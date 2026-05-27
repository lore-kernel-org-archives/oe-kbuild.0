Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1182F3621
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 00:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779842149; cv=none; b=Vf7NYtKP7KX7zqD2hEbm+kgK3rztlpYY1Y3a+oLKZms7WT5tfT1tKqv6X1yqZZ0ijytmkvDAybAuOuj/OLTOSYBA54LIh/UG4gH/DNS99pAc6hDs7GvbumsaxtAZRvxd5RzBsooyQUWMrhUs5T5RFe+TDCto8KXTo/LHckFvP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779842149; c=relaxed/simple;
	bh=ItNi2ayfdFulXOkqAtwpgRXxwHHPxKWKNaYir+r5bps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=owC12voIfWFLBeQN1MgoW+pe8qTbMU0tZ7kVaf5kwrBOuv3VQYm8i62yrD7ExDZG1do3/R8NGLBr17I7aULL7zBRUMmU1cdzHfGZRJGVDB8/58YM0w9IOrifBf3sbLRCxukTodllXSE9adEpkvOBKwBugLIKh4R6Y/H1VFI3BWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be3A+o7Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be3A+o7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779842145; x=1811378145;
  h=date:from:to:cc:subject:message-id;
  bh=ItNi2ayfdFulXOkqAtwpgRXxwHHPxKWKNaYir+r5bps=;
  b=Be3A+o7QW18obXx3JEn3c83NkCkLtkADIroy2h9qvISIZIyObiMeqkML
   1GfFiRGolUucrH0HPF2Mm3ovOqCGnyJjaTcVDSTRDs4hlDuIx32TABrTj
   uaLFw1SXztnLveGGW+63vxexmgFyhIGVxAWiTkVtOo08OAgF3DKz063In
   xGP9e33tlhiS9ohoy8yTMchBQmrOViRIS7pR1nJ18s79SmAnvIhaBk8wZ
   x9e4Zc/juJZ+YlmAhwEsIrG+CcSS0X+rvmY+yP+/2XRqaOvtxTfhI/NId
   JNx17GoPVQSDc2yL1g3FAj5uBG0ruD0vy42pgn+xrhnoshRXTF6TKRyjd
   w==;
X-CSE-ConnectionGUID: eNJK2+9cTGq4m+B8nfz9cg==
X-CSE-MsgGUID: ox2afSGOSsyj9r00G+ZFGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98093424"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="98093424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 17:35:42 -0700
X-CSE-ConnectionGUID: qGrQfLkEQxCP9r8+tqpY3w==
X-CSE-MsgGUID: S895bheISRSJZgVv85uNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239471328"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 17:35:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS2FG-00000000CZR-1zA4;
	Wed, 27 May 2026 00:35:38 +0000
Date: Wed, 27 May 2026 02:35:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 14/114]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000
 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605270208.aS4DFHP1-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 0fe91d70bf9d32cd19576a040059bfb22b6a9b03 [14/114] arm64: dts: apple: t8112: Mark MCA power states as externally-clocked
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260527/202605270208.aS4DFHP1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270208.aS4DFHP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605270208.aS4DFHP1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
