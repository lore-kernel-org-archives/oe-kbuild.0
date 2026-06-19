Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAFA3B6BFD
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jun 2026 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883820; cv=none; b=g96cn5z6s+7XfIu8VYkylQ1po2NlNUAFhT04aIFjrHfQJzTKbraeGMZanPGdTmken+TJ2X3ZwQh2KpXzptI3Q7RKmFfxE+pqXX2w5cuXHZM1rUpSf5ztn5ystiAo/WCvSdVl53yPSoPUI8pXZ1EZe9rIqOK45tY0tELuR2YvQ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883820; c=relaxed/simple;
	bh=5FLxWI844t54PC7MnjcC97M7/YKkQSlQOLMkL2ch9VQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cxzCL0e+I5BsOm7VJcCYJDRcfGRkk8bwQq5PVxJWh0yQ/RYD1hoRGE4QaRGigiQh5JZtAzm2koYsrQKvFr9ZMG8iX0lNaFpmr+/JThNo07Mcp6569BPI49LxSFulH6/Xb2wAGj/wuPKXuW32PvuLFIYbk94+7gN5A5varUt7MMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Al8/rEcm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Al8/rEcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781883813; x=1813419813;
  h=date:from:to:cc:subject:message-id;
  bh=5FLxWI844t54PC7MnjcC97M7/YKkQSlQOLMkL2ch9VQ=;
  b=Al8/rEcmwfJvAHvOvdgUlE2erl5ytBiavnvOQwtIOvLrJsXxtdKI8kQ+
   SWrDERKuOHwe4ZK0FyqoLDvyy9BA2o4LG6HEC0l/ld5HlDTUDDq5mrubu
   OgwJiaXER0IfAgff9hiztKZKjWMyfsuFnWY4lIKTdWo5BWsMhoarRhj1A
   L4LkytnYXWzPCcDl0lbUgUM8nntkf7xtADNJF8PFoQyGdaPr4eErNjZYX
   LPdU8EFbDgwUnD4PDBNAXMSRoLlLoU5lSEzz209oQ+WcSiD1XxlSHZch0
   50wrvKuTKNCAEaAC9/QmGIxmqVxOst9psWVcAh7da3cMkOKc0jj5XAcUO
   A==;
X-CSE-ConnectionGUID: 8ay/xIJIQpuD/F36Gy4YeQ==
X-CSE-MsgGUID: gX106FFOTTS8VZ1awy5NQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="86412851"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="86412851"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 08:43:31 -0700
X-CSE-ConnectionGUID: /zTMg+8/RwaHwt0U1roN3A==
X-CSE-MsgGUID: WTE279TjSHCKGT8UwdVXEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="242283906"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2026 08:43:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wabNP-000000005fR-2vKJ;
	Fri, 19 Jun 2026 15:43:27 +0000
Date: Fri, 19 Jun 2026 17:42:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: wdt@20300
 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202606191748.8C8FBuOi-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
commit: 017bca91639f01302382013033b685ec8759aba4 dt-bindings: watchdog: Allow node names named 'pmic'
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: arm-randconfig-2054-20260617 (https://download.01.org/0day-ci/archive/20260619/202606191748.8C8FBuOi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260619/202606191748.8C8FBuOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 017bca91639f ("dt-bindings: watchdog: Allow node names named 'pmic'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606191748.8C8FBuOi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-nand']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: soc (marvell,orion5x-88f5182-mbus): sa-sram: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-cs2:ranges: [[0, 18546688, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: soc (marvell,orion5x-88f5181-mbus): devbus-cs1:ranges: [[0, 18677760, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5181-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5181-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: pinctrl@10000 (marvell,88f5181-pinctrl): pmx-pci-gpios: {'marvell,pins': ['mpp4'], 'marvell,function': ['gpio'], 'phandle': 13} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: soc (marvell,orion5x-88f5182-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: pinctrl@10000 (marvell,88f5182-pinctrl): pmx-misc-gpios: {'marvell,pins': ['mpp4', 'mpp5'], 'marvell,function': ['gpio'], 'phandle': 11} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
