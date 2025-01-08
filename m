Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299801F8EFA
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336410; cv=none; b=AGv39yO9vwMUPpqDaVt4oDnagbUEDz8DsgIZd83AEvkDrODbDchsFXRb1juQ+VPKLvNFtYBt0JtxcheeysZu9Et/ZKxk7df56REkjzfBWQzf8gxewg2iPXaRiC9r1Q//MZlUKPtEw3F39qwILP2OtZh1D1Pj5R0AP6xuFV6Dc5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336410; c=relaxed/simple;
	bh=/iqDP4pISkIWmNSqUa3+TR7ujGCkTreiuOx3xPLZalg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rtbFzthW/lsWkokob2HlbCiAVn/Xftxh1l7lxxSKV3gCMgeIKYFwaRE9ivqnRIQmohmv8w73sNnuMTWs7PgSeqXl/dOW3+rCPZZX6x+utKCmzkhnmc+/VKZ+1tS6itM8Bzv0GLGSBH74JC/h7MtTeGCrlsP6UpPeGAZspAFWGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS235yyV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS235yyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736336407; x=1767872407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/iqDP4pISkIWmNSqUa3+TR7ujGCkTreiuOx3xPLZalg=;
  b=dS235yyVXrjedfKJ4WKDwhpxnmH5svVMOaiAUw+LnBoxRc0PC/VR/DhV
   EWI/sVTZxp5t26p7t5CLg6LHNJQyIIROThOL1bOMMQ2ufQkVcdFXG1kS8
   oSoFj39piuVHDmo+wBhpZeAku0gsXo2/QqOn7w4s01OjT8r8H/jkTGiHe
   Z+5q0UU+4L+at1uKyDhRA2ByY9mP37zoHsHBdOGOwCCHE2dpB0UPzxmDW
   8iuQ1+M9DJjHWbMZQoqISq5NgK0AMzuacsV6TKCJKLhBid1G6ov9s+RpN
   om2ldG0wicwarKi/Q7ac1UyIbMSvngG19PcOLSr/kvY8sVUFrou99vUIq
   w==;
X-CSE-ConnectionGUID: GRcRVMIgTNS8pTGE47DGFg==
X-CSE-MsgGUID: eaxYE1AsS+OWatRzBfmm0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40323730"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="40323730"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:40:07 -0800
X-CSE-ConnectionGUID: ZX/ZMv/8Tui7MUa5Omb6UQ==
X-CSE-MsgGUID: z+naIifyRVe3tu/CXSUVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108167586"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 03:40:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVUPq-000G0N-2N;
	Wed, 08 Jan 2025 11:40:02 +0000
Date: Wed, 8 Jan 2025 19:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 78/191]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: watchdog@29e2c4000: compatible:0:
 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt',
 'apple,t6000-wdt']
Message-ID: <202501081900.eUz0e4ho-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: 57a69ae7075ac7fc56a4f89526ae9bfea2bff3a5 [78/191] arm64: dts: apple: Add j180d (Mac Pro 2023) device tree
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250108/202501081900.eUz0e4ho-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081900.eUz0e4ho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081900.eUz0e4ho-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: soc@200000000: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6020-pmgr-misc', 'apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6020-pmgr-misc', 'apple,t6000-pmgr-misc']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: compatible:0: 'apple,t6020-pmgr' is not one of ['apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: power-controller@0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: power-controller@100:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: power-controller@108:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: compatible:0: 'apple,t6020-pmgr' is not one of ['apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: power-controller@0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: power-controller@100:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-management@404e80000: power-controller@108:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
