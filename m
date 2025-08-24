Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47EA136E37
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756030094; cv=none; b=qzKxhquJzbwifjPvpcuZzD/21jIn92agEZ8siGik6LVNdUianvPAZeSXmN5Sm0GfcISMil4HQC0AqfgTCJg//ssoVGq6gyxUKCsV8306E0U17uW/pV4iCiWA/LzaxOCueMmObVnQanUo1QCOoZJAjvtu2W456BKZWz945wB/eAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756030094; c=relaxed/simple;
	bh=c4vBfdHrF9/GzTpRfDU6u0zkaUfS4bnz7H8jI1G95Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UN+oqLk05dYEEV4GHPO1xM3I7fI068jJLbrk/Jo1ONsPnfcT79lZbP6oU8DeIqGSRlYLo0c2+V7FCGnFrQi+pSphuCqGWtku89iXVNRErL5lwLe8sltnaQ14x273ShhHlyr65XzPR6FzjqATqixqNuaUdmiGiWBjRK5PYbAd0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhPwASlS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhPwASlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756030092; x=1787566092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4vBfdHrF9/GzTpRfDU6u0zkaUfS4bnz7H8jI1G95Mg=;
  b=MhPwASlSGamOewFV5eAekwrzALz0Lq6bEHNlK7TIxN/EnfICXROz+OXW
   e6CHIw54tajwhoy8Q28WP6mf/NWyVp4LiyRR8KJzvQD+bO5UyOoroyDXy
   icCNcpMd1Lckdv6pNMWCKHCy2eXGt1ieQha6H3+qX6ggS/2WdTCCAoZMw
   +o1Zq20BFdQkO7fDP+lNqQCoIvfTG/Lk0b09Ap1sZNd9owSD8q2Xcb0LS
   942TwX+n1QwziPDaxrkxujUxFIWqGBmmDECuIBgm+NTsgJclejGxIQn0C
   50Cl45N8AaHbWb81DTYgla4pyUjok1ZL4+6RQwvoXSie2Zq0id1WCfme3
   g==;
X-CSE-ConnectionGUID: 9gAz2ngaRweHqyT4MiP9Dw==
X-CSE-MsgGUID: g4ESmdZ+Q/CCKrn7aLD2/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75721834"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75721834"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 03:08:12 -0700
X-CSE-ConnectionGUID: E5JNVP51SUCurDcjdcBdYg==
X-CSE-MsgGUID: YRjr4JzCTaSOJt2j7Bandg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168272911"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2025 03:08:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq7dp-000MwH-1q;
	Sun, 24 Aug 2025 10:08:05 +0000
Date: Sun, 24 Aug 2025 18:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sven:wip/atcphy 21/21] arch/arm64/boot/dts/apple/t8103-j274.dtb:
 usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed
 ('compatible', 'iommus' were unexpected)
Message-ID: <202508241831.snkJs50F-lkp@intel.com>
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
TO: Sven Peter <sven@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git wip/atcphy
head:   775cf79ad68f8662890ae7f18b28e8c97bf11e74
commit: 775cf79ad68f8662890ae7f18b28e8c97bf11e74 [21/21] arm64: dts: apple: t8103: Add Apple Type-C PHY and dwc3 nodes
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241831.snkJs50F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241831.snkJs50F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508241831.snkJs50F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[106, 0], [107, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[114, 0], [115, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
