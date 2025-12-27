Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531E1A9F9D
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 04:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766811039; cv=none; b=m81qQBYJ9iBNily8A2XT3AM9YJCCFPXkO+sAzYy4/E/UzLPLqkfJV5LHO7hRTX3sdH/thkb11aLPTcmn6eAvH/e1tsipdcKYyupj4mvM8UAbvmElEmWaD7ljelfhmbSOoX/w5dgUwq3/syrUt+BP4We/vt1KThBERRhkmvUul54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766811039; c=relaxed/simple;
	bh=VzvP4LghBMfnLxq0P4cC3hSkPq0ipc6msjSlYgKifmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wx3YYn+w9XO8O53LhI65fLPXBdsAEkEPOFoZ+T6a260Z5aqMBwQbjv7ElvbLe2/BGjL+J4Orb/b96P0RIPttOybTBqlNWmmK4PhKbEXP3/yfDIGTHiIWZC/qe0mFT3uO8wPuwgP6vSKnjQZvqaH30DSlAHYd85Sxl294k5OLB5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwzk9XUW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwzk9XUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766811037; x=1798347037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzvP4LghBMfnLxq0P4cC3hSkPq0ipc6msjSlYgKifmQ=;
  b=kwzk9XUWniYfRUvyRrCuUgfsXxjuslzJdZrTcomMkeUWFwW4kBjlg+e5
   1mdE0+W1vz0VCINPN/LbF5G+tFiaVjPEXwuHahkGdM779MtcVXrcLXxyf
   5XdYRyE3QwOgtV0byxscecMaHXLdECsXzjddwImusWrbRzENY7VbM8f73
   kzVM7kRPvtODDBRX1NLOxs/YnZ50CyGCkDKVZS5n4HKXsQf3b4uzxvQfL
   7+x4BSP1RK1vGZgVcbsv+fxkuJQutSHvdfaGsLIsPuvxy+N6IukX3RIx4
   l8OKZZfgGoUdKH7aPrhrg9I3N4zGltN1HiYMP3T6mmxvwCJvf35THOQNG
   w==;
X-CSE-ConnectionGUID: FhlHi6ZCSlCIZZHamyfHWQ==
X-CSE-MsgGUID: CjIpOebiQa+Kidc+0rITpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68419485"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68419485"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 20:50:36 -0800
X-CSE-ConnectionGUID: 8JiysVYjQbK5QVKcZRTQAw==
X-CSE-MsgGUID: z5Y4L+WfTLiGBzRL1XNsZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200467481"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Dec 2025 20:50:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZMG8-0000000077c-3HT1;
	Sat, 27 Dec 2025 04:50:32 +0000
Date: Sat, 27 Dec 2025 05:50:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 10/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000
 (apple,t8112-efuses): Unevaluated properties are not allowed
 ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28',
 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@...
Message-ID: <202512270542.cqdkholn-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 62c539c660c695d320c897db87ea08041c225a49 [10/128] arm64: dts: apple: t8112: Add eFuses node and ATC phy fuses
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251227/202512270542.cqdkholn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270542.cqdkholn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512270542.cqdkholn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:503.26-507.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
