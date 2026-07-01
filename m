Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100534D385
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 01:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869890; cv=none; b=tPUPxD8SgK/CU+UHKKQuZBzebVzKRiRQVATJdDqdhOykb21sfWMoTcjd1dZZBhd5yHY/EscHjWJZUcmVKxgEaLy4V1YrMNLWOwPP4Bo7nHKMGO0Hc8t9q97oq0PnoMQX+GqV8RlnRE3AOa0gWcKuf0dUXVtDeGMoZXg32kHYW/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869890; c=relaxed/simple;
	bh=OcFEVoaqRVoUDiIPPuKbfrqOfqzYEpnOpRo9V6mW0Fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ieZB5spjEjk3CiCxzCGEMuTOtUhAvCdoFkgYMK/DdfEjXpeehHtf8Dkca7LV1LzZWtrewxLnD7os4CK03FEKGr11PCt6VXJC5vA++HhceD52xRLawto99mhgxhAc4OLhRKhuL0Mxk7NoN9ML77ft7I9FE1cfUpz+0KRDywkKn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aefJj2Z2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aefJj2Z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782869889; x=1814405889;
  h=date:from:to:cc:subject:message-id;
  bh=OcFEVoaqRVoUDiIPPuKbfrqOfqzYEpnOpRo9V6mW0Fc=;
  b=aefJj2Z2uzKQU+s17o8u1PlWzzDzcRCGGa8cBi8BJN7b5teEGI+hcsgo
   Mz2dSDrXj13Uk1p7bSV4LCvmMfAH5HSq8tYqpmcSBlv7iXKU9llKhzqXG
   I5ModCkS3NV7f/l3Gfb0+iV3wXFVtOvQiyO+fvviX8kAiHD6ZoQPU8P6M
   O2WdFTTl6aWQv6mxcToTGpBcZZBJsMWLsVqECojnbn1Um72CNLpLOVOUJ
   PgAfHSPexcbVUZwioOtsnUfARyVwyCmkVH/vot6K0pqeA2P9Get5wN3uA
   GQ/alGbtA22hPEsC+sFvRiPGs2WIGGKE+4qxHADgmUnF1i+mcdBzWSM1R
   w==;
X-CSE-ConnectionGUID: gwX2ovJ+QxaiQKcaPQnJ/A==
X-CSE-MsgGUID: sCdWfo68R22/g+2HSv0gbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94975402"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="94975402"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:38:08 -0700
X-CSE-ConnectionGUID: p1LrkxlSS0uyO7i+e/+vNA==
X-CSE-MsgGUID: FaC57wABT1CPYYtOS9FvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="248439477"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2026 18:37:22 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wejtA-000000000dV-05zA;
	Wed, 01 Jul 2026 01:37:20 +0000
Date: Wed, 01 Jul 2026 03:36:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb:
 pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does
 not contain items matching the given schema
Message-ID: <202607010348.FSUXkFKn-lkp@intel.com>
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
TO: Rosen Penev <rosenp@gmail.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 893faf67438cb7642d8c2da7650a436716155416 ARM: dts: BCM5301X: add root pcie bridges
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260629 (https://download.01.org/0day-ci/archive/20260701/202607010348.FSUXkFKn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 8a531c3608c722ad529be448d6ecef06ba107228)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010348.FSUXkFKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 893faf67438c ("ARM: dts: BCM5301X: add root pcie bridges")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607010348.FSUXkFKn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@1,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@2,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@1,0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@2,0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
--
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
--
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
