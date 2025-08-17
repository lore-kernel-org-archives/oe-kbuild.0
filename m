Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48619995E
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755455691; cv=none; b=qL3HVvaV8bwklO9ze5SrnefNK2HFv4JRxJWZPBx8eBMNPML9GEpxiYMbRKFiw3P/0zKWfXBvKNTXjkS+cAhOapixJ+QTrV584yXa6dXmEziF8A0t279O+v+Q8D4CILKwbpf60l9kdbpCRQZF2arEaF591omGB5+xZqoL33l2DM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755455691; c=relaxed/simple;
	bh=DbOka+K7ZiBsjKXC0pdybNy2zEl0jBJy73gh3EvSNVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9MtbUeCwNxFqg5kzUtqTaluIB2DrU81IIMP0ZqunmaqLD/EKHtPMIprKy/jsq3tAd+mqQWrQY00PSkd2yZM+9FMk1zDWsEiBstlQS8IiX3EE8rvIX/oBsaDZAS3A7c8WwkC3IUXu0ZHlOhCN3OefpB8zpy1M757OuOnmiaec88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqdM09aC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqdM09aC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755455688; x=1786991688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbOka+K7ZiBsjKXC0pdybNy2zEl0jBJy73gh3EvSNVE=;
  b=QqdM09aCMqzH1YvBNWPO9XVcURCM+3AvGo0Zz4qFQiDiSV5T+rq4uV5t
   /HmPY8Rsffl59agKVaJYd/C/jlPZgR1+X1OCYjnfYSs/liYdRFCI3j46h
   hBDp4KIvQS23PSPVJOjh9DVII+zHefKibJ2fnrow27OdzHT2E8ZXAvgiJ
   rQignvOtfDY3agLAw5C72AYMErIl9SG4P6/oG8Vne4ppEnxfraJo2CtLc
   kAlUCBy5sjw2V5GOSNbMyUsxaV8QIKsH02MLqMGSs31e2bL4HXl2Kw6yN
   N6eXBFkYAwqgYMVT8tNC/fKOVzu2+rfzO1D2xI0wWs8TY/2WWgH7xmRG0
   w==;
X-CSE-ConnectionGUID: 8uJTLd+HSx2TKXydM3UJrA==
X-CSE-MsgGUID: bPSj3NbBTiiWgcdw/FNbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61499839"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61499839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 11:34:47 -0700
X-CSE-ConnectionGUID: SjtH6W9bSTS+PBz4pkxo4Q==
X-CSE-MsgGUID: rNKwJT+tSnWYxZ1gzPO8dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167324968"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2025 11:34:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uniDJ-000Dex-1N;
	Sun, 17 Aug 2025 18:34:42 +0000
Date: Mon, 18 Aug 2025 02:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/14]
 arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning
 (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" or "ranges" property
Message-ID: <202508180241.cju7xm0X-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   326d2519811200da0e301dce3e93389dadd197a4
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/14] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: mips-randconfig-052-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180241.cju7xm0X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180241.cju7xm0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508180241.cju7xm0X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /: failed to match any schema with compatible: ['dptechnics,dpt-module']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: switch@10 (qca,ar9331-switch): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca,ar9331.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /: failed to match any schema with compatible: ['dragino,ms14']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: w25q128@0 (winbond,w25q128): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /: failed to match any schema with compatible: ['onion,omega']
   arch/mips/boot/dts/qca/ar9331_omega.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_omega.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_omega.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_omega.dtb: w25q128@0 (winbond,w25q128): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /: failed to match any schema with compatible: ['openembed,som9331']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: switch@10 (qca,ar9331-switch): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca,ar9331.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: w25q64@0 (winbond,w25q64): $nodename:0: 'w25q64@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /: failed to match any schema with compatible: ['tplink,tl-mr3020']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): $nodename:0: 's25sl032p@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spansion,s25sl032p', 'jedec,spi-nor'] is too long

vim +158 arch/mips/boot/dts/qca/ar9331.dtsi

1e6a3492e7bb12 Antony Pavlov  2016-03-17    3  
1e6a3492e7bb12 Antony Pavlov  2016-03-17    4  / {
1e6a3492e7bb12 Antony Pavlov  2016-03-17    5  	compatible = "qca,ar9331";
1e6a3492e7bb12 Antony Pavlov  2016-03-17    6  
1e6a3492e7bb12 Antony Pavlov  2016-03-17    7  	#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17    8  	#size-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17    9  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   10  	cpus {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   11  		#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   12  		#size-cells = <0>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   13  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   14  		cpu@0 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   15  			device_type = "cpu";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   16  			compatible = "mips,mips24Kc";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   17  			clocks = <&pll ATH79_CLK_CPU>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   18  			reg = <0>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   19  		};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   20  	};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   21  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   22  	cpuintc: interrupt-controller {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   23  		compatible = "qca,ar7100-cpu-intc";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   24  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   25  		interrupt-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   26  		#interrupt-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   27  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   28  		qca,ddr-wb-channel-interrupts = <2>, <3>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   29  		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   30  	};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   31  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   32  	ref: ref {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   33  		compatible = "fixed-clock";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   34  		#clock-cells = <0>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   35  	};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   36  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   37  	ahb {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   38  		compatible = "simple-bus";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   39  		ranges;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   40  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   41  		#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   42  		#size-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   43  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   44  		interrupt-parent = <&cpuintc>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   45  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   46  		apb {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   47  			compatible = "simple-bus";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   48  			ranges;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   49  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   50  			#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   51  			#size-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   52  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   53  			interrupt-parent = <&miscintc>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   54  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   55  			ddr_ctrl: memory-controller@18000000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   56  				compatible = "qca,ar7240-ddr-controller";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   57  				reg = <0x18000000 0x100>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   58  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   59  				#qca,ddr-wb-channel-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   60  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   61  
e795688eeedfab Oleksij Rempel 2020-05-10   62  			uart: serial@18020000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   63  				compatible = "qca,ar9330-uart";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   64  				reg = <0x18020000 0x14>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   65  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   66  				interrupts = <3>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   67  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   68  				clocks = <&ref>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   69  				clock-names = "uart";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   70  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   71  				status = "disabled";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   72  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   73  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   74  			gpio: gpio@18040000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   75  				compatible = "qca,ar7100-gpio";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   76  				reg = <0x18040000 0x34>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   77  				interrupts = <2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   78  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   79  				ngpios = <30>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   80  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   81  				gpio-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   82  				#gpio-cells = <2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   83  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   84  				interrupt-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   85  				#interrupt-cells = <2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   86  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   87  				status = "disabled";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   88  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   89  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   90  			pll: pll-controller@18050000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   91  				compatible = "qca,ar9330-pll";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   92  				reg = <0x18050000 0x100>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   93  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   94  				clocks = <&ref>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   95  				clock-names = "ref";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   96  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   97  				#clock-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   98  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   99  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  100  			miscintc: interrupt-controller@18060010 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17  101  				compatible = "qca,ar7240-misc-intc";
0889d07f3e4b17 Oleksij Rempel 2019-09-30  102  				reg = <0x18060010 0x8>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  103  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  104  				interrupt-parent = <&cpuintc>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  105  				interrupts = <6>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  106  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  107  				interrupt-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  108  				#interrupt-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  109  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17  110  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  111  			rst: reset-controller@1806001c {
1e6a3492e7bb12 Antony Pavlov  2016-03-17  112  				compatible = "qca,ar7100-reset";
1e6a3492e7bb12 Antony Pavlov  2016-03-17  113  				reg = <0x1806001c 0x4>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  114  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  115  				#reset-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  116  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17  117  		};
1e6a3492e7bb12 Antony Pavlov  2016-03-17  118  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  119  		eth0: ethernet@19000000 {
7ff836f064e2c8 Oleksij Rempel 2019-05-24  120  			compatible = "qca,ar9330-eth";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  121  			reg = <0x19000000 0x200>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  122  			interrupts = <4>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  123  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  124  			resets = <&rst 9>, <&rst 22>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  125  			reset-names = "mac", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  126  			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  127  			clock-names = "eth", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  128  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  129  			phy-mode = "mii";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  130  			phy-handle = <&phy_port4>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  131  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  132  			status = "disabled";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  133  		};
7ff836f064e2c8 Oleksij Rempel 2019-05-24  134  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  135  		eth1: ethernet@1a000000 {
7ff836f064e2c8 Oleksij Rempel 2019-05-24  136  			compatible = "qca,ar9330-eth";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  137  			reg = <0x1a000000 0x200>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  138  			interrupts = <5>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  139  			resets = <&rst 13>, <&rst 23>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  140  			reset-names = "mac", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  141  			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  142  			clock-names = "eth", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  143  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  144  			phy-mode = "gmii";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  145  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  146  			status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  147  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  148  			fixed-link {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  149  				speed = <1000>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  150  				full-duplex;
69e22d9ff71bae Oleksij Rempel 2021-05-14  151  				pause;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  152  			};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  153  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  154  			mdio {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  155  				#address-cells = <1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  156  				#size-cells = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  157  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18 @158  				switch10: switch@10 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  159  					#address-cells = <1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  160  					#size-cells = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  161  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  162  					compatible = "qca,ar9331-switch";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  163  					reg = <0x10>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  164  					resets = <&rst 8>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  165  					reset-names = "switch";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  166  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  167  					interrupt-parent = <&miscintc>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  168  					interrupts = <12>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  169  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  170  					interrupt-controller;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  171  					#interrupt-cells = <1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  172  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  173  					ports {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  174  						#address-cells = <1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  175  						#size-cells = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  176  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  177  						switch_port0: port@0 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  178  							reg = <0x0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  179  							ethernet = <&eth1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  180  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  181  							phy-mode = "gmii";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  182  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  183  							fixed-link {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  184  								speed = <1000>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  185  								full-duplex;
69e22d9ff71bae Oleksij Rempel 2021-05-14  186  								pause;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  187  							};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  188  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  189  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  190  						switch_port1: port@1 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  191  							reg = <0x1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  192  							phy-handle = <&phy_port0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  193  							phy-mode = "internal";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  194  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  195  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  196  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  197  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  198  						switch_port2: port@2 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  199  							reg = <0x2>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  200  							phy-handle = <&phy_port1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  201  							phy-mode = "internal";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  202  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  203  							status = "disabled";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  204  						};
7ff836f064e2c8 Oleksij Rempel 2019-05-24  205  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  206  						switch_port3: port@3 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  207  							reg = <0x3>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  208  							phy-handle = <&phy_port2>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  209  							phy-mode = "internal";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  210  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  211  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  212  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  213  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  214  						switch_port4: port@4 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  215  							reg = <0x4>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  216  							phy-handle = <&phy_port3>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  217  							phy-mode = "internal";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  218  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  219  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  220  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  221  					};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  222  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  223  					mdio {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  224  						#address-cells = <1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  225  						#size-cells = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  226  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  227  						interrupt-parent = <&switch10>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  228  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  229  						phy_port0: phy@0 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  230  							reg = <0x0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  231  							interrupts = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  232  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  233  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  234  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  235  						phy_port1: phy@1 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  236  							reg = <0x1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  237  							interrupts = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  238  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  239  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  240  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  241  						phy_port2: phy@2 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  242  							reg = <0x2>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  243  							interrupts = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  244  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  245  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  246  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  247  						phy_port3: phy@3 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  248  							reg = <0x3>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  249  							interrupts = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  250  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  251  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  252  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  253  						phy_port4: phy@4 {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  254  							reg = <0x4>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  255  							interrupts = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  256  							status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  257  						};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  258  					};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  259  				};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  260  			};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  261  		};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  262  
1e6a3492e7bb12 Antony Pavlov  2016-03-17 @263  		usb: usb@1b000100 {

:::::: The code at line 158 was first introduced by commit
:::::: 4eb7ae7a301d3586c3351e81d5c3cfe2304a1a6a MIPS: ath79: ar9331: add ar9331-switch node

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
