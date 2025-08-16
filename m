Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAED1C7015
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755318344; cv=none; b=lMBcS8FVGKtFta2RgBVw7JQ9R3OBUr7kZS997Z5hx4TNoRBMk7qsY+WBfzisWlOjSjlnXi6HmRytHDdwaUxlkcIIvp8+wVUw5kkg3rtdWH0zpszrpXtkWk3QQO3g4vt+5x2bUFcHqbgBjArNj/lGMrEH3ZdcdfHRjdWOG+OepqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755318344; c=relaxed/simple;
	bh=9wmhVw7bmULiA2Cy6mjSP8wMr//6W4nbge/S/OP2fUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQ82+K1UpoQTZm6g3eB+BFFielCjlugg9Abk9OEO/yyL9uT7OB3tc12ZeMp6pbRn8i/aAT9DHa6PPpSbH2EKY1bQwIXbgy2k7cFRsQIQnqgkEfPo7KFPBpu7LMZr4PUtsVW/eBg+BrmDSbFbqePxhxc6cK5Ire+MLVLRoa7kGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euLW1qN6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euLW1qN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755318341; x=1786854341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9wmhVw7bmULiA2Cy6mjSP8wMr//6W4nbge/S/OP2fUc=;
  b=euLW1qN6awbja2zUv0T4IbyTUvstogPk0d0pGET7F7dWKTN3V+TWTktl
   YDFhokr+EzyhOrhNBnKOUg0Rxzi1QVOQHCvBNMCskrxL0a1jtYWTfxscd
   cPKQV1/4VYJPyBA8rRjLBdqjPm6aBYZF9YYJ83Pes+Gm9eYDEQUTNgt5Q
   ylYRKimI94v1aTTRj2plEm0B87br45kNOXzrSwo7iu/spejapl4s1+qwW
   T6hV+z2VggrmCvvsPgN/a/P6Bo2YrKh5RO1n0IAT90rZcL1LbdIhJ81w4
   2fkfYARw+KOv3A2kpuat1D68E7RZfgvzZWrsd5v6fZWb2pNbQTzyC2aTc
   w==;
X-CSE-ConnectionGUID: GxxqwWLbSWyktpDpFLL9RQ==
X-CSE-MsgGUID: w5ghYZ7qQvS9XZ8HSS1OvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="45204636"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="45204636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 21:25:39 -0700
X-CSE-ConnectionGUID: O8K3cTkcRd6NIWVLf+TTXg==
X-CSE-MsgGUID: vZo008koTWiB7Ie4j8VYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171349078"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Aug 2025 21:25:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un8U3-000CaW-34;
	Sat, 16 Aug 2025 04:25:35 +0000
Date: Sat, 16 Aug 2025 12:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 26/801]
 arch/arm/boot/dts/marvell/armada-370-db.dtb: coherency-fabric@20200
 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too
 short
Message-ID: <202508161239.v4CzyVId-lkp@intel.com>
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
commit: 3a6c3debf722ee6a0f5de17adc8ba2a2096a9369 [26/801] dt-bindings: arm: Convert marvell/marvell,coherency-fabric to DT schema
:::::: branch date: 9 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250816/202508161239.v4CzyVId-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161239.v4CzyVId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508161239.v4CzyVId-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc: failed to match any schema with compatible: ['marvell,armada370-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-db.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/thermal@18300: failed to match any schema with compatible: ['marvell,armada370-thermal']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-370-cpu-config']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/audio-controller@30000: failed to match any schema with compatible: ['marvell,armada370-audio']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: flash@0 (mx25l25635e): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mx25l25635e', 'jedec,spi-nor'] is too long
--
   arch/arm/boot/dts/marvell/armada-375-db.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-375-db.dtb: interrupt-controller@d000 (arm,cortex-a9-gic): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
   arch/arm/boot/dts/marvell/armada-375-db.dtb: interrupt-controller@d000 (arm,cortex-a9-gic): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-375-db.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6720-pinctrl']
   arch/arm/boot/dts/marvell/armada-375-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-375-system-controller']
   arch/arm/boot/dts/marvell/armada-375-db.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-375-db.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-375-wdt']
>> arch/arm/boot/dts/marvell/armada-375-db.dtb: coherency-fabric@21010 (marvell,armada-375-coherency-fabric): compatible:0: 'marvell,coherency-fabric' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-375-db.dtb: coherency-fabric@21010 (marvell,armada-375-coherency-fabric): compatible: ['marvell,armada-375-coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-375-db.dtb: coherency-fabric@21010 (marvell,armada-375-coherency-fabric): reg: [[135184, 28]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-375-db.dtb: usb@58000 (marvell,armada-375-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-375-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-375-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-375-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-375-db.dtb: usb@58000 (marvell,armada-375-xhci): reg: [[360448, 131072], [374912, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
>> arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible:0: 'marvell,coherency-fabric' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible: ['marvell,armada-380-coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): reg: [[135184, 28]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
--
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
>> arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible:0: 'marvell,coherency-fabric' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible: ['marvell,armada-380-coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): reg: [[135184, 28]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
--
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
>> arch/arm/boot/dts/marvell/armada-388-gp.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible:0: 'marvell,coherency-fabric' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-388-gp.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible: ['marvell,armada-380-coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-388-gp.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): reg: [[135184, 28]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: usb@58000 (marvell,orion-ehci): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
--
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
>> arch/arm/boot/dts/marvell/armada-388-rd.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible:0: 'marvell,coherency-fabric' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-388-rd.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): compatible: ['marvell,armada-380-coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
>> arch/arm/boot/dts/marvell/armada-388-rd.dtb: coherency-fabric@21010 (marvell,armada-380-coherency-fabric): reg: [[135184, 28]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'no-1-8-v', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtb: flash@0 (jedec,spi-nor): 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s-bit.dtb: flash@0 (jedec,spi-nor): 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtb: flash@0 (jedec,spi-nor): 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s-bit.dtb: flash@0 (jedec,spi-nor): 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtb: flash@0 (jedec,spi-nor): 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s-bit.dtb: flash@0 (jedec,spi-nor): 'partition@u-boot', 'partition@u-boot-env', 'partition@ubi1', 'partition@ubi2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv78460-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-db.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: mvsdio@d4000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/internal-regs/thermal@182b0: failed to match any schema with compatible: ['marvell,armadaxp-thermal']
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-db.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx4251-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: mvsdio@d4000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dtb: flash@0 (m25p64): 'partition@u-boot', 'partition@u-boot-env', 'partition@unused' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: i2c@11000 (marvell,mv78230-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/serial@12000: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,98dx3236-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: flash@0 (m25p64): 'partition@u-boot', 'partition@u-boot-env', 'partition@unused' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
   arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dtb: dfx-server@ac000000 (marvell,dfx-server): $nodename:0: 'dfx-server@ac000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv78460-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: coherency-fabric@20200 (marvell,coherency-fabric): compatible: ['marvell,coherency-fabric'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,coherency-fabric.yaml#
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/internal-regs/thermal@182b0: failed to match any schema with compatible: ['marvell,armadaxp-thermal']
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
   arch/arm/boot/dts/marvell/armada-xp-matrix.dtb: sa-sram0 (mmio-sram): $nodename:0: 'sa-sram0' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
