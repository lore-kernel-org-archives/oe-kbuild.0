Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735E1F0E3E
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761550427; cv=none; b=iK2p2hDbtlFtsSZMJKq/IZGHuD1o+IqHLAbbSJ3PtoftP0xH5Ac+FHIUIiE/RXVvcYEYOyHhpfgj5LqLhFRz4kc3GXWhV60+nruRKGIihEmK6PsU4NvDEM5OZk1MebB0Rrtq7vEDQw2xcLPpGc+0fmzokTHV326uVOjwKTJE244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761550427; c=relaxed/simple;
	bh=iHBuegeezZyCwlUfpRe7gSf2f9JXNl4J2jmt9YCNiSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mn1PpqfzI6+HEQd566Q0Nj9Uc9L4uDy7/XmovjhbKWrZJSJ2iSRY/HkGia4ChPc2qm18TiKZLCu0NRBQ7uXxLorE/pcLCuFOW9VBRnKgFZK4vCkoByJzuhO26cbXH8SvCrv7EGv1hv/k7uICDTd9gv8/APdyVlRRa2IQcklPzZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhm2CBdY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhm2CBdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761550422; x=1793086422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHBuegeezZyCwlUfpRe7gSf2f9JXNl4J2jmt9YCNiSM=;
  b=hhm2CBdYf2XdUQOZN4f4dCW2axsQkaX0o5rV9zt5dMqR8mHAhYoXCKG0
   /nrG8YH3HQWw1QPIoiz048MwOK1QHMPWo8unysltxuM8gHPI43kefmV4W
   3yq0MM6D2tPwn5OzsxVdvySsltIZxkFypZQTlpVfF2EklLxLzqdJq/AUe
   9x4Aclq0szfr2b+9XgZTBgvltEBUAFNPTlv08/OoNKkxCxjJY9I2b0GDb
   TOKsGiDRZk3pHe6p1syE0GwWcIDJB+CHkgMa4pobYegP7hKFTVoW7I+a/
   kCKSM7RUWftJ/XtRaaKjcWTRYqgQJ2mfM3kMBiKHOjUC9P/HDE14pVDFt
   w==;
X-CSE-ConnectionGUID: vMlz4R8hSMyZK/Vg9WgZHA==
X-CSE-MsgGUID: VrVT8AQcQvKvSun4NCTn2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81049890"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="81049890"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 00:33:42 -0700
X-CSE-ConnectionGUID: WED8PoaKTVSzSfyEJujmHg==
X-CSE-MsgGUID: 7Sy/5czrQJe7+ahfRlNkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184676085"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 00:33:40 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDHjV-000000000Ij-3Zr7;
	Mon, 27 Oct 2025 07:33:37 +0000
Date: Mon, 27 Oct 2025 08:32:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000
 (fsl,ifc): 'nor@0,0' does not match any of the regexes:
 '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$',
 '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
Message-ID: <202510270823.2evPX9Wk-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   566771afc7a81e343da9939f0bd848d3622e2501
commit: 89e6684538f59093d89eda50e30a6f2644b06ab6 dt-bindings: memory-controllers: fsl,ifc: split child node differences
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510270823.2evPX9Wk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270823.2evPX9Wk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510270823.2evPX9Wk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi:45.10-64.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /: failed to match any schema with compatible: ['fsl,B4420QDS']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: / (fsl,B4420QDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: / (fsl,B4420QDS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: aliases: 'phy_sgmii_10', 'phy_sgmii_11', 'phy_sgmii_1c', 'phy_sgmii_1d' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,b4420qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,b4420qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,b4420qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,b4420qds-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,b4420qds-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,b4420qds-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: board-control@3,0 (fsl,b4420qds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
--
   arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi:45.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /: failed to match any schema with compatible: ['fsl,B4860QDS']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: / (fsl,B4860QDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: / (fsl,B4860QDS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: aliases: 'phy_sgmii_10', 'phy_sgmii_11', 'phy_sgmii_1c', 'phy_sgmii_1d', 'phy_sgmii_1e', 'phy_sgmii_1f', 'phy_xaui_slot1', 'phy_xaui_slot2' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,b4860qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,b4860qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,b4860qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,b4860qds-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,b4860qds-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,b4860qds-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: board-control@3,0 (fsl,b4860qds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
--
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi:108.24-112.4: Warning (simple_bus_reg): /soc@ff700000/ethernet@b1000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi:121.23-123.5: Warning (simple_bus_reg): /soc@ff700000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /: failed to match any schema with compatible: ['fsl,bsc9132qds']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: / (fsl,bsc9132qds): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: / (fsl,bsc9132qds): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: memory-controller@ff71e000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: soc@ff700000 (fsl,bsc9132-immr): gpio-controller@f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000: failed to match any schema with compatible: ['fsl,bsc9132-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/c293pcie.dts:219.24-222.4: Warning (simple_bus_reg): /soc@fffe00000/ethernet@b1000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /: failed to match any schema with compatible: ['fsl,C293PCIE']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: / (fsl,C293PCIE): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: / (fsl,C293PCIE): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@2,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,c293pcie-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,c293pcie-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,c293pcie-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,c293pcie-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,c293pcie-cpld'] is too short
   		'fsl,c293pcie-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,c293pcie-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,c293pcie-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /memory-controller@fffe1e000/cpld@2,0: failed to match any schema with compatible: ['fsl,c293pcie-cpld']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 38, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 39, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): 'chassis-mgmt@6,0', 'nor@0,0' do not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['keymile,qriox'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'keymile,qriox' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'keymile,qriox' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'keymile,qriox' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['keymile,qriox'] is too short
   		'keymile,qriox' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'keymile,qriox' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'keymile,qriox' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['keymile,qriox']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /localbus@ffe124000/chassis-mgmt@6,0: failed to match any schema with compatible: ['keymile,bfticu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@ffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: / (fsl,P1010RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: / (fsl,P1010RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /memory-controller@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@fffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: / (fsl,P1010RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: / (fsl,P1010RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /memory-controller@fffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@ffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB-PB']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: / (fsl,P1010RDB-PB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: / (fsl,P1010RDB-PB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /memory-controller@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@fffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB-PB']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: / (fsl,P1010RDB-PB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: / (fsl,P1010RDB-PB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /memory-controller@fffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 34, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 35, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 14, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 15, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,tetra-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,tetra-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,tetra-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,tetra-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,tetra-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,tetra-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: board-control@3,0 (fsl,tetra-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,tetra-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 34, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 35, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1024-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t1024-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t1024-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t1024-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t1024-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1024-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t1024-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t1024-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1024-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t1024-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t1024-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 18, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 19, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld'] is too short
   		'fsl,t1040d4rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t1040d4rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1040d4rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 43, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t1040d4rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t1040d4rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1040d4rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 39, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 51, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 52, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 49, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 50, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t2080-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t2080-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t2080-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t2080-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t2080-cpld'] is too short
   		'fsl,t2080-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t2080-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t2080-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t2080-cpld']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 52, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-fqd (fsl,qman-fqd): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-pfdr (fsl,qman-pfdr): {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 53, '$nodename': ['qman-pfdr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-pfdr (fsl,qman-pfdr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
--
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: failed to match any schema with compatible: ['fsl,T4240QDS']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: / (fsl,T4240QDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: / (fsl,T4240QDS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: aliases: 'emi1_rgmii', 'emi1_slot1', 'emi1_slot2', 'emi1_slot3', 'emi1_slot4', 'phy_rgmii1', 'phy_rgmii2', 'phy_sgmii11', 'phy_sgmii12', 'phy_sgmii3', 'phy_sgmii4', 'phy_xfi1', 'phy_xfi2', 'phy_xfi3', 'phy_xfi4', 'sgmii_phy11', 'sgmii_phy12', 'sgmii_phy13', 'sgmii_phy14', 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy31', 'sgmii_phy32', 'sgmii_phy33', 'sgmii_phy34', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44', 'xfi_pcs_mdio1', 'xfi_pcs_mdio2', 'xfi_pcs_mdio3', 'xfi_pcs_mdio4' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>> 	arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t4240qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t4240qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t4240qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,t4240qds-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t4240qds-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t4240qds-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): nand@2,0: 'partition@C00000' does not match any of the regexes: '^partition@[0-9a-f]+', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0 (fsl,t4240qds-fpga): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0 (fsl,t4240qds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
--
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /: failed to match any schema with compatible: ['fsl,T4240RDB']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: / (fsl,T4240RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: / (fsl,T4240RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: aliases: 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: bman-fbpr (fsl,bman-fbpr): {'size': 16777216, 'alignment': 16777216, 'compatible': ['fsl,bman-fbpr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 99, '$nodename': ['bman-fbpr']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: bman-fbpr (fsl,bman-fbpr): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: qman-fqd (fsl,qman-fqd): {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 96, '$nodename': ['qman-fqd']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/soc/fsl/reserved-memory.yaml#"}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
