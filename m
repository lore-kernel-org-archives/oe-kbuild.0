Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1822A804
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754637555; cv=none; b=i8tPB1PiZPdq9iIA7Jr/rz06dSNo55DQaHYzZdsKBjWvBn3P2LyDOoIN0k+RTwhV7lYTXLpE4teWgZyHZINFtW2qiKaTNBXmYm383BtiRK4DdIyDQfnv1cXC8QPjtqFkBGozVHDUJrLnWCLDwMGGtzu/yduSHB2sm0a9oFCBVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754637555; c=relaxed/simple;
	bh=bAHy74hwFILkGGeZPVwrNwQujCk41vVDxarWthWUdvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SypgR7/z9UnyqLZyiU2W3OZU08NwWiMELrZMyBD261Cnhc50m80qvr8YGkURz+Veia8Ef09u4B9wGV/IJutvEbE4c14C/lJCiwOt1jq+FHLpLlu4k6sfaJuRGST1Xmsyflvjaqrg6SD9JE9NRocyL+oHSqqbyOhiFTv2IvAjOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxsUB/RK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxsUB/RK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754637554; x=1786173554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bAHy74hwFILkGGeZPVwrNwQujCk41vVDxarWthWUdvs=;
  b=DxsUB/RK9jIsBssvei5hcA9VSUMcGbHsv3yavw9trtp3z3F6n3r/CZ+D
   pwwgM2QO1DtsPFik0w41HnPyO6FhKVBG69sDhXMqkRs8140LubEO3bLJ4
   dSdcmnmAq0IuQLiCRZFcsmkcZ9qWzpHodvyOqWKqkWqImf1LiUlu2T3Sw
   c8+HeYNWp+vgO7hiu6aQIB2RxcGAg86xkZIMnB9yVwgXa18Nx6RX6RVoj
   mzTvDTJIiuNDuaUcXyluRZEcj9r75sWWG5iFDuBqALJsVxjdvy9f0qN3L
   vEpWLV9znWe8PkTG6aZf/KIEQu/qdsoM9ipXYYx9QIA2rwaYRQthyMOhS
   w==;
X-CSE-ConnectionGUID: UFkpPSnATG2np+ssNsmh5g==
X-CSE-MsgGUID: b0mNr7yDT1qxv2TsNOTrSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82427100"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="82427100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:19:13 -0700
X-CSE-ConnectionGUID: YQZzwLbJSKeeqsJeTsMtaQ==
X-CSE-MsgGUID: 3pTklf66Rma7kfWpF/6OEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164780036"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2025 00:19:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukHN8-0003cq-0X;
	Fri, 08 Aug 2025 07:18:53 +0000
Date: Fri, 8 Aug 2025 15:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 28/208]
 arch/arm64/boot/dts/apple/t6000-j316s.dtb: soc (simple-bus):
 display-subsystem: 'ranges' is a required property
Message-ID: <202508081551.WMCSlWms-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: aca0e4516c528fee4b8d9730757f962a358c2780 [28/208] arch: arm64: apple: t600x: Add display controller related device tree nodes
:::::: branch date: 5 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250808/202508081551.WMCSlWms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081551.WMCSlWms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081551.WMCSlWms-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:337.14-360.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:362.14-371.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:215.29-220.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:188.21-213.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:119.45-122.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:15.10-22.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:83.10-92.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:109.10-118.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:135.10-144.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:245.14-254.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:215.29-220.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:188.21-213.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:119.45-122.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:13.10-20.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:69.10-78.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:95.10-104.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:121.10-130.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:147.10-156.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
