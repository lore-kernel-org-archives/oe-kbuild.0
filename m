Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78183A960A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827958; cv=none; b=BlM7JOtVYl3ZV5Siu1GXE1Rfv5/+Xu6yfwue5pEEtkes5/o/FTVSVMz9FXNf9ubX7E2gP1b79PTWW7+A/0+aXoam/2nX6Y5SZgv7y86p4jkM3cDsePSpS1oLSxuM2fbHg0uAegtqkfeVVU/5QS13IweYgPvT51Z66IVMF1hiq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827958; c=relaxed/simple;
	bh=MbWfumzmHSzQNk6QikV8mnticoSG5+PE/XYF6glVkO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d0MFGRy3dQP2PhiGOrPlqmKsqwDmWYgFsYc9S4fn9SZlhw40MyBJw9UoZqVwkflw9R+CdX1k4YuLK4xMhnDkoMaCBsenrwPkjgD04nYlGSC84o/0QBb/eKyuuM2gKrOnTkw9M8Z65tyoAIpF50IUsv9IEiEQ5HSS/d4NTXyWVRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnHPhZDk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnHPhZDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773827950; x=1805363950;
  h=date:from:to:cc:subject:message-id;
  bh=MbWfumzmHSzQNk6QikV8mnticoSG5+PE/XYF6glVkO8=;
  b=ZnHPhZDk7rsZ7CPJdzGjsnMGV/DzpuwCHTXABep3GEEWvrO1Hlmk+62K
   Kvh4Bb3S+vUb+9VRnwnOQHSgZ7g4eIh1WE3vkb15BkSyzjI3dqX0xuhRu
   ib42yFXGVe7xJGg7hI/DNJcxQwaqNJp+osW2jJW6dPXLZDC5EIneM1vVn
   LyYJGhN+x5KXT36VijXB4BkD0o4cKAFcAXt+/mD4AY50zfuRtIO13ZVih
   Z/4N313r7Nnzr/nW4+uRExyujd+JDw6ZjnGKWqxEq/jwmi0PIaTcF1ckW
   tSerRRgNVQRKdfoRWeelX14mRaZ8sTVJDCLcflIGE7j4IbWaS10ZnYOrj
   w==;
X-CSE-ConnectionGUID: NWNbU4KWSs26hAHD8h2geA==
X-CSE-MsgGUID: /UFAZ2AyRqauKtDd2S8L4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74906644"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74906644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:59:09 -0700
X-CSE-ConnectionGUID: z2tjFoXLRQ2zMepNMulO1Q==
X-CSE-MsgGUID: Bu0SjcwZS7OM9L1/vixPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227261725"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 02:59:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ng9-000000004dF-2k55;
	Wed, 18 Mar 2026 09:59:05 +0000
Date: Wed, 18 Mar 2026 10:58:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:next 3/16]
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@0:
 wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not
 contain items matching the given schema
Message-ID: <202603181049.JWGo3L7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux next
head:   b1ea5fb664d8d92b57766ef2d0ba4ca9aec129c6
commit: 893faf67438cb7642d8c2da7650a436716155416 [3/16] ARM: dts: BCM5301X: add root pcie bridges
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-2053-20260317 (https://download.01.org/0day-ci/archive/20260318/202603181049.JWGo3L7e-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181049.JWGo3L7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603181049.JWGo3L7e-lkp@intel.com/

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
