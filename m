Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F273911CAF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736315516; cv=none; b=CjEAkSQQoxXz1isS5td+d8w9z5MeSo0g9Pe0KXDPZ1SXK7IWr78DfX2uNEiq3vuEUUDb9SvUiuWuXTE+M5tHSC91ehdgSq/LL0EYmBsXc2oyoqr/lYRjlWtLki+eRhw1hW6HnE5nic+z7J64PIpkaro9S3BEdGBNKA8a9KRKcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736315516; c=relaxed/simple;
	bh=JE6vu/O+jxH2+aLuXAd68q93RcArXkEp1DKzkdR1PqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCnH0zZM8QYleR8N3iwjwtgkNPHXxrMfVvEXtAnUPxGNJJ7/b1FXGigA+ewo2Eh/s7a2MT5boh89wdgWYrngYYOqYiLsxe9kyRD4qw7uM+c0Eeymnc7hpaqioJ+xp623MDFNrbeA7px8qzuoCYFi2hCCONxuO5ucBr3SKGNJaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJhyekqY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJhyekqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736315513; x=1767851513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JE6vu/O+jxH2+aLuXAd68q93RcArXkEp1DKzkdR1PqE=;
  b=nJhyekqYzsobhHCceltS4Pa7AHgaPV1nm19DgjxgYJM/ee4Uuy5YgLtk
   0LFdyB9gI2dQWOy5cu+BO+a4+AO+Z3CS1uSuTlQAoJSDCyaAkbIdS90yk
   BletrO/VXAhP0znHSSP/edh+ly+L9vJYWJ9QsNwouBOaFR/oO4rsqlOwX
   z57OpDeuC7+qaBEFmJZK7MCC8O0koOfZODf4qRPcGUzhLAKYXbmPMV+/6
   ab1mYDIQQnfC+Mx0eo8WfmvRUpDhS7HY31OUkiYAtA/DU9npQJMt2C6Mg
   mN9sVJwQ9uPCMUDNi/9Cv44qElGZEFLYbxYPQuK/7FuLNSZ6rsKfHBA0Y
   Q==;
X-CSE-ConnectionGUID: 0V1/8YFDQfafKyiA/gaQhw==
X-CSE-MsgGUID: Wan0/ih+TtCKpj3gpEiBMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36219728"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36219728"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 21:51:51 -0800
X-CSE-ConnectionGUID: q4LfJIrEQuyTEVKKSPCYTQ==
X-CSE-MsgGUID: nkXjox5LRxi5XVfL54CxmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108043211"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2025 21:51:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVOyp-000FfT-2G;
	Wed, 08 Jan 2025 05:51:47 +0000
Date: Wed, 8 Jan 2025 13:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 66/191]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: watchdog@29e2c4000: compatible:0:
 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt',
 'apple,t6000-wdt']
Message-ID: <202501081359.aWiKwCyh-lkp@intel.com>
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
commit: 970d0a3b59bf083e2917989cb6d03f5cf0a674d8 [66/191] arm64: dts: apple: Add MTP nodes to t6020x
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250108/202501081359.aWiKwCyh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081359.aWiKwCyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081359.aWiKwCyh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /: failed to match any schema with compatible: ['apple,j414s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /: failed to match any schema with compatible: ['apple,j414s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /: failed to match any schema with compatible: ['apple,j414c', 'apple,t6021', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /: failed to match any schema with compatible: ['apple,j414c', 'apple,t6021', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /: failed to match any schema with compatible: ['apple,j416s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /: failed to match any schema with compatible: ['apple,j416s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /: failed to match any schema with compatible: ['apple,j416c', 'apple,t6021', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /: failed to match any schema with compatible: ['apple,j416c', 'apple,t6021', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
