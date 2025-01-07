Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66241F63F0
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736283812; cv=none; b=j5inKra7DZQL8sdESdwKXEqjEgp8RnW/yt4SeMyp3zZ7P3Oubir1gxYO7d86KtZRKtZHyHDZvVCmGfq1ypVwvwbBb5UPA4QMIxHQVNga8c6/Wu+KKzdkFnWDM+X/BGW3lc2NGLiO9HoI727WF5O15jzryYRsBAcl45ecKSzTSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736283812; c=relaxed/simple;
	bh=53ptYWwMDFM2mCWa1X78ogKUBe0bBScP9B0ev81rL7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3T55c9xIpHw/qurPMYWXVeNhIfdqUFbOkPqzlXIguVtodcfadBdKzaG42PmbrPRlX2QLr2TWX0NK/oZ+ueqopjiWf1eBqMcyKuf1w/UMeMCaIc9Ls3ZQS6WrNdkAYErw/SYZ/V1O1Zb7eT6+3tbfP0EY2jFnNeC3ghoa/svPfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQC+HqA+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQC+HqA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736283810; x=1767819810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53ptYWwMDFM2mCWa1X78ogKUBe0bBScP9B0ev81rL7w=;
  b=bQC+HqA+IvQP3pXNedRHrmIXmaqMDtziIMlFHgRneQ3NjZXZAHBHmNok
   z0IulxVbmkkgxnUUFW3i1/MN+gGy6Mkmq2UTUOUg+jgree9YPV0bOJ7xg
   OyJpnLesoZvCGVy+HtN7+Jq3rSPIp9zEoMz5EFVe1GXVb2ruUjLDyHi/Q
   C0Vhr3og3rH4uY19KzPEtFnOCoNZ0xuJ9dU2A95oZ6uoFPwlb+otKAZTV
   SmfCmI18K7X2yjtoSq9jd2Pogdb8fgMi2FBrnG4/fW1DfL2bNUk0XDzjb
   J8Vf6arb+zPW+Vs5tlCpqf2+b8zGmZacKCsna3p/Ia6OKFu9JPlwlqbAB
   w==;
X-CSE-ConnectionGUID: UPL47V2vR7ydFsuBu+pjEg==
X-CSE-MsgGUID: 0zDYSuDZR6aohIsLSbR2qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36605128"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36605128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 13:03:30 -0800
X-CSE-ConnectionGUID: 4EG1cEhfSjSlgQ+DbesMAg==
X-CSE-MsgGUID: Msmn153KT+eibhDGa/KB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102699926"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2025 13:03:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVGjV-000FDf-35;
	Tue, 07 Jan 2025 21:03:25 +0000
Date: Wed, 8 Jan 2025 05:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 65/191]
 arch/arm64/boot/dts/apple/t6020-j474s.dtb: watchdog@29e2c4000: compatible:0:
 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt',
 'apple,t6000-wdt']
Message-ID: <202501080451.G3n4yBZd-lkp@intel.com>
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
commit: 96052369dda9091a4eebc55f3e3f71f36dcb618f [65/191] arm64: dts: apple: Add initial t602x device trees
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250108/202501080451.G3n4yBZd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080451.G3n4yBZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501080451.G3n4yBZd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /: failed to match any schema with compatible: ['apple,j474s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /: failed to match any schema with compatible: ['apple,j474s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: clock-controller@28e03c000: compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: interrupt-controller@28e100000: compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: watchdog@29e2c4000: compatible:0: 'apple,t6020-wdt' is not one of ['apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: watchdog@29e2c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@2a2408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@e0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: efuse@29e2cc000: compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
