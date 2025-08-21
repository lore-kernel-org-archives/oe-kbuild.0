Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128093D76
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 03:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755746761; cv=none; b=PAn4ywlK5kl9iyDz7L96fONvJcTpR50WiSHKoKI9itAKRUkFuQaGeQgK3Zpp5esyK3WWFYMWWtgKbAtQ0whWJtGn4fV28yqMIt+2gvthV9ylEoli8Q6ZyXdv+wvkOWWUqA6e+M8SA3Y2F9JgjpYFQ94LoirEq310/yXVW7qoz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755746761; c=relaxed/simple;
	bh=Vi3C3csu0KFriQCQ68dIHXx0MA8ncORx/PIMVUVnrLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLhb59fNy63OrxPqH3istHRjaF0m8kTBHLcYp6bg8WeZ8Ge5gde+fPbAqJrRU+ptuYCL0Kz9gByfzAHFdQtoY0gz99h+fFoHKDUBLx4N+z8tami6pfV7G4as9p7ydtAKpBLR04ahw7elNht7y2h7L/5pMzNYP0rlyJR/MF7VqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7Ylczs3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7Ylczs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755746759; x=1787282759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vi3C3csu0KFriQCQ68dIHXx0MA8ncORx/PIMVUVnrLI=;
  b=F7Ylczs3d7S7OhYC3aZqfDC6QRmQzNvV5TaoYwBuacy1WO6CQCj56+IZ
   jlP9vfgfybrtrqY7pNCS1vcFp1W7ZKU73m3yA2hx3/vJdp9vkC52Iwmnb
   LfRD9QDB64hgF+p9zAcZYfSp7R6ca7c3lGXsK7a4uWg0mEjf1EcibNCWT
   qYd8Wd2bOgtfgi5fJ7NapmuJn9qoQiAbpboq3w0bTH/2z0HuaA1o9vqiP
   TSZuwggq3dePWIA8KQEhANu8RnhZCDXgOGBQl7h/T/SLObim2yCzrEUcl
   z2JlWEsJTI1krN3iDPvX3NKOLW4wzBD9pXdC3oA8aI0Jaby5XamrghkX8
   w==;
X-CSE-ConnectionGUID: +GOEduOiQFGDsir10J92cQ==
X-CSE-MsgGUID: mVWcrc2YQh67hz8v8kFSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57976705"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57976705"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 20:25:59 -0700
X-CSE-ConnectionGUID: CteVsM+8Rg6+W8kuSatHPA==
X-CSE-MsgGUID: PiKXzEylTrOgdl3y9wz4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168707744"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2025 20:25:57 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uovw2-0001eN-38;
	Thu, 21 Aug 2025 03:25:54 +0000
Date: Thu, 21 Aug 2025 05:25:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ulfh-mmc:next 4/20] arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb:
 esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed
 ('big-endian' was unexpected)
Message-ID: <202508210508.IjIp73pX-lkp@intel.com>
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
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   7138017038c42feb682445407974ed736e1ff308
commit: 0caebd1658bbb3796bec4e3449876742d29701ab [4/20] dt-bindings: mmc: fsl,esdhc: Add explicit reference to mmc-controller-common
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20250819 (https://download.01.org/0day-ci/archive/20250821/202508210508.IjIp73pX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4f15debe13af14e0fd668ee4861aff6dbc5283df)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210508.IjIp73pX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508210508.IjIp73pX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:738.27-765.5: Warning (simple_bus_reg): /soc/ethernet@2d50000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:767.27-794.5: Warning (simple_bus_reg): /soc/ethernet@2d90000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: adc@35 (maxim,max1239): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1238.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
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
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: at45db021d@0 (atmel,at45db021d): $nodename:0: 'at45db021d@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: at45db021d@0 (atmel,at45db021d): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'spi-cpha', 'spi-cpol' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:738.27-765.5: Warning (simple_bus_reg): /soc/ethernet@2d50000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:767.27-794.5: Warning (simple_bus_reg): /soc/ethernet@2d90000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi:67.19-107.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:767.27-794.5: Warning (simple_bus_reg): /soc/ethernet@2d90000: missing or empty reg/ranges property
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts:254.10-282.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts:41.29-104.4: Warning (avoid_unnecessary_addr_size): /soc/spi@2100000/ethernet-switch@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet-switch@1 (nxp,sja1105t): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: aliases: 'enet0_sgmii_phy', 'enet1_sgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: memory-controller@1530000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: sai@2b50000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: sai@2b50000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: touchscreen@38 (edt,edt-ft5406): compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: touchscreen@38 (edt,edt-ft5406): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: /soc/i2c@2180000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: touchscreen@38 (edt,edt-ft5406): compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: touchscreen@38 (edt,edt-ft5406): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/i2c@2180000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
