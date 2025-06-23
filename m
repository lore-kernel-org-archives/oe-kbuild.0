Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3196527991E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698479; cv=none; b=sk4svr10RJgunlnOpJYFZrZUxKx9Yj4RXyMmuLyKq9u9eCFcasjONspow9XhfULXEzC9Dax+7qhFVrPpNol6tf8uvmpj3Rg4FJu0YcH9x2eb0/im/nXycHFHJpALbIXX/3Fsx3dWQkj0G/rLCofx/KnqGvzb0YfVoLCFXlUTOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698479; c=relaxed/simple;
	bh=XesnpbaqH7/K8SvCfHONCC4VygQrKo1LjSMuUn3OWjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGhFyJUHbxvycMVB9aQdPcik5LuHl6DLzrcfSjFOAGPl17FmwmjZqkWjB5RCp7qumNFUfnelhgA3dkRwvK3HFD0fVHpZB/KZTTJ4/7CKNnFbP+jfWrIPLMf3W+ffjwzz+p26HtiOVFK0uc+yh3oOuxtLF9XVc/TPhB9VYCsgl1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVM+05YV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVM+05YV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750698472; x=1782234472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XesnpbaqH7/K8SvCfHONCC4VygQrKo1LjSMuUn3OWjQ=;
  b=IVM+05YVS8INzCJfMhq0+p0nFV65Q5lxtUfiHKifhpiuJZXDA9loERpm
   7pRCpv3RpOhixCzem6oiUMgwO14XDVZoTFA3zUlmAu/xchax1JTtVJmlH
   Zkzvv3MBAfrwOj3r5GVpVXI6TKl56HSaVAUljKwsETPmddeaATagUb9Jq
   JreTt+X+lPsAZ4BLB2BRyQhjMSwnnBEfNGut4LZauEkwbbwgQ72DXcnLY
   AEZa6xAGtQaU9tt0/Hcwto9WGcLywQNVfdG00Dg7DynvVAvSYRgxHRsM2
   PdbZW/lnytx5ZJIjS61OwjXFPJKXt2ucJTpMC+hvtIIX1FICYesnJElqw
   A==;
X-CSE-ConnectionGUID: 4vRxjOA0Tsi3CuaQFKalhA==
X-CSE-MsgGUID: 8p++7UX6Q3S4owVgW9Mg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52853931"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52853931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 10:07:51 -0700
X-CSE-ConnectionGUID: hlked072SPKnC2bZpADx5A==
X-CSE-MsgGUID: dwBykcR5SWyoXHZLBiKrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151425965"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2025 10:07:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTke2-000P8o-1q;
	Mon, 23 Jun 2025 17:07:46 +0000
Date: Tue, 24 Jun 2025 01:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
Message-ID: <202506240006.s7xR78zE-lkp@intel.com>
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
In-Reply-To: <20250621034401.586780-1-dinguyen@kernel.org>
References: <20250621034401.586780-1-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh+dt@kernel.org
TO: krzysztof.kozlowskii+dt@linaro.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: devicetree@vger.kernel.org

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/dt-bindings-net-convert-socfpga-dwmac-txt-to-DT-schema/20250621-114611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250621034401.586780-1-dinguyen%40kernel.org
patch subject: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240006.s7xR78zE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240006.s7xR78zE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506240006.s7xR78zE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'power-domains', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: brcmf@1 (brcm,bcm4329-fmac): $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'mdio', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'amlogic,meson-gxbb-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:143.34-587.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:143.34-587.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clocks: [[5, 185], [2, 3], [2, 29]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): compatible:0: 'amlogic,meson-axg-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): reg: [[0, 4257218560, 0, 65536], [0, 4261560320, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains', 'rx-internal-delay-ps' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains', 'rx-internal-delay-ps' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains', 'rx-internal-delay-ps' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rgmii-txid' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): phy-mode:0: 'rmii' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'amlogic,tx-delay-ns', 'mdio', 'phy-handle', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'amlogic,meson-g12a-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
