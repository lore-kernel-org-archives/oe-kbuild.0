Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1842136E37
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756030088; cv=none; b=Fn+YX4WkS0mSWs+cEDu9im74ynTBTwRONJKVGdtXjMilWIaqoMS7/iyr41ikaMc8kGMb8L3GVnWGc6fEJ41r+rXc86MtPrGEJYVtHw+hK+wsXTfapkSWIWwsO5Vci0i22yJdxL8BuXOz++qwMqcmiRL4Is6ScKMBj1zyjjT8XVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756030088; c=relaxed/simple;
	bh=0/nSPQEed4zasjiubHorwDJb1Qfz4prcAHXSPXaZwPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEvdItIQkuqr45qxr91KG6ADliI7OOJ8lCvGwZaGjve62idEyGlV1oEB02itBvEjrAY9/C4MWUUgsJXtPJ/IJEoT6AywSPSS0UlHoTU10fRZ9jBJgJ4oDYuOES08+PJUpzvvUAkwRevmC+bZaHMsOcXr4Mxe1JLgFNCXdXCEAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipGPv8gf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipGPv8gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756030086; x=1787566086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/nSPQEed4zasjiubHorwDJb1Qfz4prcAHXSPXaZwPM=;
  b=ipGPv8gfcSrVmEK1zkzIHKMQFW2GDBrMR8JiLX8aM6PHDpTR/6fUOCjt
   9hH+vqE081EXiahgdyz6DlNdxVqBI/aX9iTzTaHq7GEXZzZ/vRuK4g4jT
   xpVnLBdCFchjV+c4gwa0/lMF0PCVz5AKJ4ZhN0pyD6jSTdzzE79od19u5
   iJdcWNzsH97jCMVYGI6G5w6PfqDEgHW74S1Eudj3uLxyK2g6aHtpKdVzA
   obcRfLGpEJK1b/DmefIG8PnPi2xVtDoRGh868SOQ8LfzjZwTPby0cQJKO
   C+PAHzEifISBx4w5tUw7C0n988vnNBpguuHFTQurHWiuctaqGJq9LNH5P
   g==;
X-CSE-ConnectionGUID: xj2nJ6AjS3GDQ7mVO87oJw==
X-CSE-MsgGUID: PT6V7NqRRkahqwYuiaUUbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75860015"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75860015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 03:08:05 -0700
X-CSE-ConnectionGUID: 37tmcbPpSp6ZQdAR/FT5mQ==
X-CSE-MsgGUID: QGKhNghPTlavVJqlKadr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174345009"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2025 03:08:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq7dV-000MwE-0T;
	Sun, 24 Aug 2025 10:07:42 +0000
Date: Sun, 24 Aug 2025 18:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sven:wip/atcphy 21/21] arch/arm64/boot/dts/apple/t8103-j274.dtb:
 usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed,
 one must be fixed:
Message-ID: <202508241834.bdiH9H2C-lkp@intel.com>
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
config: arm64-randconfig-053-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241834.bdiH9H2C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241834.bdiH9H2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508241834.bdiH9H2C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[106, 0], [107, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[114, 0], [115, 1]] is too long
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
