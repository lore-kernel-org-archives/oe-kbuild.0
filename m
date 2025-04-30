Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104CF25D1F4
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024034; cv=none; b=V8t4ep+dMIYs1OWxhyo0iLo1IEoLtpQrBQZ3gchFV+8MCrt00TRkaaySy3aiWiEvi2yGLgXXDaogZT+UpG7pAq3XfzkU80LBnAJhtsKjSZXZ23tSB90zGto8thgVYvQQtpMirVUiI05ISKtcO+mCKYnzslBcyWv1C6Jy0l1TJWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024034; c=relaxed/simple;
	bh=z+g6/cClUaz0n3QR9cfStBmaghzyJ8lqSIQFIS9D3mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YzxRA+QMLUeqLtCY8h/ZSlrafPfnU4zoGtam5sTOlQFps4BAHyenb5rMvzJ0eyXbYWuk3TB3V3rJNVgBOUF7wDNiSsxe2EN11rBwz/3qZkqnk0U5/CM8xA73+fpAPAiKO6KxHGwM1wxWHghTQjVx2OdQCdbWg3fIr4kSVWM7iAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qq1mQi6b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qq1mQi6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746024032; x=1777560032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+g6/cClUaz0n3QR9cfStBmaghzyJ8lqSIQFIS9D3mQ=;
  b=Qq1mQi6bBIABqC6OTns11u1lTAm5NOSeB9VjDY6Lt+ZhW8WZ6Oo41Y5P
   oGCBU27mo7O8w3rju1VI1ofhWccL1CumZdTVRPvWBKBRu1eebNxYpgS66
   utxqRZAdJAsv1sZHulaJRQGtW8j3XyY6+UD8kdc9S16iIXUNDeqg2vq2G
   egdewRDUfqtKTMerEQoDCOvapQXoWG4dHZ47rARnCVr7aXb/ksKDMurI9
   3be6lmdkwtFryQ5cqGF8Ddh3t3xrOI0Ggje4Ihl4gJZP7QLZZQC6xy2a0
   HblZ2zi8BM7Asc5rVJf08gqWle0NXaVcDQqGQaW35JAGfirfuBfjwax/s
   Q==;
X-CSE-ConnectionGUID: lgASD1L9QpSttwttId1pDg==
X-CSE-MsgGUID: wkdy2YuDQp6x8x9+km7Tkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58348808"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58348808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:40:31 -0700
X-CSE-ConnectionGUID: 65K2farMSySgsiogaisdAw==
X-CSE-MsgGUID: aEOgvAgGRMeMC08+Ic1XIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134643946"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2025 07:40:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA8br-0003XD-1T;
	Wed, 30 Apr 2025 14:40:27 +0000
Date: Wed, 30 Apr 2025 22:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ulfh-mmc:next 44/48] arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb:
 esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed
 ('big-endian', 'bus-width' were unexpected)
Message-ID: <202504302231.PtBsJs7f-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   c0b5481043a46e7fca1beadab4d786089b9b4354
commit: 0ebe3247f844c0e186fd123a2c5fe65207a2fe07 [44/48] dt-bindings: mmc: fsl,esdhc: add compatible string fsl,ls1021a-esdhc
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250430/202504302231.PtBsJs7f-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504302231.PtBsJs7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504302231.PtBsJs7f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:738.27-765.5: Warning (simple_bus_reg): /soc/ethernet@2d50000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:767.27-794.5: Warning (simple_bus_reg): /soc/ethernet@2d90000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: adc@35 (maxim,max1239): '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1238.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
--
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): compatible: ['mdio-mux-mmioreg'] is too short
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: at45db021d@0 (atmel,at45db021d): $nodename:0: 'at45db021d@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: at45db021d@0 (atmel,at45db021d): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'spi-cpha', 'spi-cpol' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
--
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:738.27-765.5: Warning (simple_bus_reg): /soc/ethernet@2d50000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:767.27-794.5: Warning (simple_bus_reg): /soc/ethernet@2d90000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi:67.19-106.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:767.27-794.5: Warning (simple_bus_reg): /soc/ethernet@2d90000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts:254.10-282.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts:41.29-104.4: Warning (avoid_unnecessary_addr_size): /soc/spi@2100000/ethernet-switch@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet-switch@1 (nxp,sja1105t): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
--
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: aliases: 'enet0_sgmii_phy', 'enet1_sgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: memory-controller@1530000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
