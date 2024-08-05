Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D713C809
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722889402; cv=none; b=bzOqOljvxxPop3J21BreDC+ZT5gMcLnaReswSd6xNua9cTgAfXhnJCKAqYGR7P2jZTvWbUouXio2dTWDauDrRGaoijZ7YAo7Gza5I25grgdIMqeMAL0Tft/+Q48jYLQ52tXG+43iePEiGxESqLsNa0v3tHGNDE+qla58/PCyOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722889402; c=relaxed/simple;
	bh=j1GoensUtif8J4mGAIiq4I9mvpA2Xzq1hpJazEFOJI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGdQKHHFqp9SxKbK+D+ujioNLXcyNAbXq6R0XgcvqUi2+GLKTsaurYaaAl5Z0rLOhUSYRmhYsmddkhyYietR7lJ4ys4hbv3QHAWZhz+TvEoKqZJSbCiWn+YOdhfl96+C/VNhI64aDsRG2gEiQRvENsN1UyF+P6+AeiuZyCl+wkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAQRjygg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAQRjygg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722889399; x=1754425399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1GoensUtif8J4mGAIiq4I9mvpA2Xzq1hpJazEFOJI8=;
  b=TAQRjyggbj7Do/8peZcF+jgLeffUeIqWffFw3gIsROxIk1LpBpkAIcBP
   FVKKNSroOKZ/UC1lF1AAZUDKkIh53heu1Zcku7hfggH4RXI5/gjoSNMQy
   sZIzxdn0wl0j5bX2S5lAKNEgugzBdZ1kuXB5bqo+Dz4NsbwhUt60Hz7Ob
   Z6iMzdDKiBGH5FVkZ3fe/RX/7/GDDdg6bLl8/v06wf6rM8akpePGjQnZJ
   RnIDCDkQIltGqgF3pJZzo81uI9vWraBZF0fuz1ESrnOvCQJHqxenUCKIr
   Uw6elsjGk/ggikoXuNSCVhcZUgRGA+YyNcfEvYIvLF2eYS99MTW6kLA9r
   A==;
X-CSE-ConnectionGUID: 8lw3aZKrRDiydDVxxTGKzA==
X-CSE-MsgGUID: t7AO2UfgTHqpVeYiMH38oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="23789225"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="23789225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 13:23:19 -0700
X-CSE-ConnectionGUID: xOSWJ4tWSQKwLLWIEGEeog==
X-CSE-MsgGUID: IB49ee9KT4uZyWoLNsA9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="60651596"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2024 13:23:18 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb4Ed-0003em-28;
	Mon, 05 Aug 2024 20:23:15 +0000
Date: Tue, 6 Aug 2024 04:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 06/10] arm64: dts: layerscape: add msi-cell = <1> for
 gic its
Message-ID: <202408060446.sMuaGD6L-lkp@intel.com>
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
In-Reply-To: <20240729-ls_warning_all-v2-6-942d80ddd441@nxp.com>
References: <20240729-ls_warning_all-v2-6-942d80ddd441@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-layerscape-rename-aux-bus-to-bus/20240730-031018
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240729-ls_warning_all-v2-6-942d80ddd441%40nxp.com
patch subject: [PATCH v2 06/10] arm64: dts: layerscape: add msi-cell = <1> for gic its
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240806/202408060446.sMuaGD6L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060446.sMuaGD6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408060446.sMuaGD6L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls1088aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: fsl-mc@80c000000: msi-parent:0: [16, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1088ardb-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: fsl-mc@80c000000: msi-parent:0: [17, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: fsl-mc@80c000000: msi-parent:0: [16, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: fsl-mc@80c000000: dpmacs:ethernet@1: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: fsl-mc@80c000000: dpmacs:ethernet@2: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: ethernet@1: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: ethernet@2: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: fsl-mc@80c000000: msi-parent:0: [19, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: fsl-mc@80c000000: msi-parent:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: fsl-mc@80c000000: msi-parent:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: fsl-mc@80c000000: msi-parent:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: fsl-mc@80c000000: msi-parent:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3700000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: fsl-mc@80c000000: msi-parent:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: fsl-mc@80c000000: msi-parent:0: [24, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: fsl-mc@80c000000: msi-parent:0: [70, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: fsl-mc@80c000000: dpmacs:ethernet@11: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: fsl-mc@80c000000: dpmacs:ethernet@12: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: ethernet@11: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: ethernet@12: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: fsl-mc@80c000000: msi-parent:0: [70, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: fsl-mc@80c000000: dpmacs:ethernet@11: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: fsl-mc@80c000000: dpmacs:ethernet@12: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: ethernet@11: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: ethernet@12: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: msi-parent:0: [51, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@7: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@8: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@9: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@a: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: ethernet@7: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: msi-parent:0: [51, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@7: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@8: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@9: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@a: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: ethernet@7: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: fsl-mc@80c000000: msi-parent:0: [51, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: fsl-mc@80c000000: msi-parent:0: [52, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: msi-parent:0: [50, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@3: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@4: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@5: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@6: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@b: 'phys' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: fsl-mc@80c000000: msi-parent:0: [52, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: fsl-mc@80c000000: msi-parent:0: [55, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: fsl-mc@80c000000: msi-parent:0: [55, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
