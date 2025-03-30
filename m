Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E238F80
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Mar 2025 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743315955; cv=none; b=mNC+hvJY2L9iq3Nd4i+u1qI/GHRoeKAubdKMNyr8eK5lu7lJd+4u/kLuns0eRowNdD/IgSoHX6f2oDRMRVVK1+n6DTs4jdTyWwZyHlb+kUre1OOiPZ30/asltfdy4B8mILM6Kk3sEY5p48Vy/5n+a8un8D06QAbtJ1QMYUC1uMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743315955; c=relaxed/simple;
	bh=r8tAw5gka4JtJozik//Qph1RM5idkEki80i4v05tOVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/QCfkzYdhdMo36l0iStUkoIuybPDGhJlG4+L06quyKkvP3V9Fb/uBjVtYXZy9DTWKTIpToRxS2S+fpGDyzI/wMulI6wd16TtV48G0DI92fg7xGtbGqzmYUkw9TPdN9S+20rky7bFBmmZIoGBPU4zuozq/Ig08PhiGSjcp8lTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcAOPSgW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcAOPSgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743315950; x=1774851950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8tAw5gka4JtJozik//Qph1RM5idkEki80i4v05tOVY=;
  b=QcAOPSgWd884t5WXeFUq1O2zR6AUfBL5rKX2lE4m4LxyaJx+DRDZKRMD
   8slFemtjGwZ0Bstu2PaDCgDkVkbgWga9vHuzDPof6jG4whjgPkfsU/GBk
   Lr0kfbhhpE/l79GqlKKKL0Q4iLtt4/lMi+9g/SktKpxKBTwAecMggJc2f
   m23v03KvQDLa9ckUAXSIPbPF4FBOQHGf/ZxQldmo142hUswI7k95iWitb
   B7U00S4DaiGvc7FT8E8ODdAIxlrH7NHESQdSifGbwbUSdnq40nbR6AzQp
   5HBbr0UhECCJdswje7tmg1SHie0qY9M+6yX+Q6VR999k1iIPNFZViTfRE
   g==;
X-CSE-ConnectionGUID: +g06RdHVTQeXLyx5ANr5lA==
X-CSE-MsgGUID: bCoi5NtAQ6+RWiIozisrJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44736257"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="44736257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 23:25:49 -0700
X-CSE-ConnectionGUID: 5SD870xkRCGH01AB9X0omQ==
X-CSE-MsgGUID: 488FDV4dSvWq3GVQej+e6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="126269197"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2025 23:25:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tym70-0008Yg-2H;
	Sun, 30 Mar 2025 06:25:38 +0000
Date: Sun, 30 Mar 2025 14:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/n1d/enablement 10/12]
 arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000: interrupts: [[0, 73,
 4]] is too short
Message-ID: <202503301410.Ul6FNSvR-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   17b4fb2aac13dc15816c7989fdf136483e900806
commit: 759d2b7a1bcb6167602aaba0b098258e847933a4 [10/12] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20250329 (https://download.01.org/0day-ci/archive/20250330/202503301410.Ul6FNSvR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301410.Ul6FNSvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503301410.Ul6FNSvR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f2d0000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f2d0000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f500000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f500000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f510000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f510000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000: interrupts: [[0, 73, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/gpio0@1701c000: failed to match any schema with compatible: ['apm,xgene-gpio']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/phy@1f21a000: failed to match any schema with compatible: ['apm,xgene-phy']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/phy@1f22a000: failed to match any schema with compatible: ['apm,xgene-phy']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/phy@1f23a000: failed to match any schema with compatible: ['apm,xgene-phy']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/sata@1a000000: failed to match any schema with compatible: ['apm,xgene-ahci']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/sata@1a400000: failed to match any schema with compatible: ['apm,xgene-ahci']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/sata@1a800000: failed to match any schema with compatible: ['apm,xgene-ahci']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/gpio@17001000: failed to match any schema with compatible: ['apm,xgene-gpio-sb']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/rtc@10510000: failed to match any schema with compatible: ['apm,xgene-rtc']
--
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2b0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2b0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a000000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a200000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a400000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: mmc@1c000000: interrupts: [[0, 73, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@1f63c000: failed to match any schema with compatible: ['apm,xgene-gpio']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@17001000: failed to match any schema with compatible: ['apm,xgene-gpio-sb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mdio@1f610000: failed to match any schema with compatible: ['apm,xgene-mdio-xfi']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f610000: failed to match any schema with compatible: ['apm,xgene2-sgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f620000: failed to match any schema with compatible: ['apm,xgene2-xgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: i2c@10511000: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7: Warning (unit_address_vs_reg): /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:906.7-913.4: Warning (graph_child_address): /usb@fe800000/usb@fe800000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /i2c@ff110000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5651']
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: typec-portc@22: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000: usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-evb.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-evb.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640@1c: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe900000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: pcie@0,0: wifi@0,0:compatible: ['qcom,ath10k'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: pcie@0,0: wifi@0,0:reg: [[0, 0, 0, 0, 0], [50331664, 0, 0, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: wifi@0,0: reg: [[0, 0, 0, 0, 0], [50331664, 0, 0, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe3a0000: bluetooth@1:compatible: ['usbcf3,e300', 'usb4ca,301a'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe3a0000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bluetooth@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe3a0000: bluetooth@1:compatible: ['usbcf3,e300', 'usb4ca,301a'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe3a0000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bluetooth@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe3a0000: bluetooth@1:compatible: ['usbcf3,e300', 'usb4ca,301a'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe3a0000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bluetooth@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: pcie@f8000000: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: typec-portc@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: typec-portc@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: typec-portc@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: cm32181@10: 'vdd-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: syscon@ff770000: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: syscon@ff770000: usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: spi@ff1d0000: Unevaluated properties are not allowed ('max-freq' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000: usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2098.21-2100.6: Warning (avoid_unnecessary_addr_size): /dsi@ff960000/ports/port@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2098.21-2100.6: Warning (graph_child_address): /dsi@ff960000/ports/port@1: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: vop@ff8f0000: assigned-clocks: [[8, 183], [8, 181], [8, 219], [8, 475]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: vop@ff8f0000: assigned-clock-rates: [0, 0, 400000000, 100000000] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: vop@ff8f0000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl: gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 188]], 'phandle': 183}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 187]], 'phandle': 182}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: usb-typec@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /i2c@ff160000/regulator@66: failed to match any schema with compatible: ['mps,mp8859']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: usb-typec@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: usb-typec@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /i2c@ff160000/regulator@66: failed to match any schema with compatible: ['mps,mp8859']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: usb-typec@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'PVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'HPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: regulator@40: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: regulator@41: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: sdio-pwrseq: clock-names:0: 'ext_clock' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-pwrseq-simple.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: sdio-pwrseq: clock-names:0: 'ext_clock' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-pwrseq-simple.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: codec@11: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: sdio-pwrseq: clock-names:0: 'ext_clock' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-pwrseq-simple.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: sdio-pwrseq: clock-names:0: 'ext_clock' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-pwrseq-simple.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: codec@11: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: sdio-pwrseq: clock-names:0: 'ext_clock' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-pwrseq-simple.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: codec@11: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: sdio-pwrseq: clock-names:0: 'ext_clock' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-pwrseq-simple.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: typec-portc@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: typec-portc@22: 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: spdif-dit: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /i2c@ff110000/rt5651@1a: failed to match any schema with compatible: ['realtek,rt5651']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb: mmc@fe330000: interrupts: [[0, 11, 4, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
--
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75: i2c@0: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75: i2c@1: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75: i2c@2: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75: i2c@3: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: pmic@5e: 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
>> arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: leds: led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0rx' does not match '^cpu[0-9]*$'
   	'phy0rx' does not match '^hci[0-9]+-power$'
   	'phy0rx' does not match '^mmc[0-9]+$'
   	'phy0rx' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: leds: led-ds4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: display@fd4a0000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: display@fd4a0000: 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75: i2c@0: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75: i2c@1: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75: i2c@2: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75: i2c@3: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: pmic@5e: 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: leds: led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0rx' does not match '^cpu[0-9]*$'
   	'phy0rx' does not match '^hci[0-9]+-power$'
   	'phy0rx' does not match '^mmc[0-9]+$'
   	'phy0rx' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: leds: led-ds4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@17: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15301@18: failed to match any schema with compatible: ['maxim,max15301']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1a: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1d: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@20: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@72: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@73: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@17: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15301@18: failed to match any schema with compatible: ['maxim,max15301']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1a: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1d: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@72: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@73: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1b: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@17: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15301@18: failed to match any schema with compatible: ['maxim,max15301']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1a: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1d: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@72: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@73: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1b: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15301@18: failed to match any schema with compatible: ['maxim,max15301']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1a: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1b: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max15303@1d: failed to match any schema with compatible: ['maxim,max15303']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@72: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff020000/i2c-mux@75/i2c@2/max20751@73: failed to match any schema with compatible: ['maxim,max20751']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@5/temp@4c: failed to match any schema with compatible: ['national,lm96163']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: sc18is603@2f: $nodename:0: 'sc18is603@2f' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/nxp,sc18is.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: display@fd4a0000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: display@fd4a0000: 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: display@fd4a0000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: display@fd4a0000: 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: mmc@ff160000: interrupts: [[0, 48, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: mmc@ff170000: interrupts: [[0, 49, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
