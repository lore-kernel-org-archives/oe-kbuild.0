Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FF257459
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Sep 2025 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082892; cv=none; b=FTM6upOpMbcME0giVRTssc0nA/9M0PNMtWfUX39oP1bbUPnr2msebDyEeX9tItDBDFTN9Wb6gVYFz0jKslG/z7AhGqBf1nyaKW3ALj+hFYVJLfccogVvDZa23EQsxNC7E/L0wWeAWw+46LhjM8FiMJ3w3wRg7wxuoMNFb+5R6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082892; c=relaxed/simple;
	bh=poazfKM9mdMixQ+5wQCDwKmp5p+/N2YYjAIc3AnTwII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRjBc+F3i1ffj3WME2E5MRiwLimznCb250XKShVX6MtvdgvKS4Jf/ZiNF//jGAAVzoBDm4uIna8cwDVIF7OKarqcZVMJCdgc9ESE5Ts3KNSw39ImHGTxXQOXC+cDesyHbdI3xJLI/Dt0sSFUgCCH6QkhktcqOuSLqOUhqxxrYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOFhJXqZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOFhJXqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759082889; x=1790618889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=poazfKM9mdMixQ+5wQCDwKmp5p+/N2YYjAIc3AnTwII=;
  b=AOFhJXqZ6VbphbbEmLKnP+KKJyL0YTLR8e+/w1MZ58gYKZXxYQnCkBoL
   SbpqFNKY1fpHk2YnW2zZSvME24iwv2b04eU4I0HRIEnO6CRrp/+qPK/0W
   GiM9ESfXpRyqcdnYbOgox4OUZcNJz+7I6bNtyuIgZQ3eutA5TehCs7WPW
   OXELtXPT2Pk1IVhN0DNh9ynUTwB+aa7jhtd0hYI1vobAOcNL/FDYmlxwx
   fQ5uBlHAVz8SWX9cdZ+QEWX+rUcqE3TYPzpXEevt089IvPuS9p6ESh1Yp
   dluGNylVMoVMrh3AYDaGHi6jv1Oy4FqMh4CabfUrsOzuYzecz19Haggar
   A==;
X-CSE-ConnectionGUID: W6c4KeVHRhyZACIuIBSnTg==
X-CSE-MsgGUID: DyIIIxjpR5KBKco9z2TltQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61297358"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61297358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 11:08:08 -0700
X-CSE-ConnectionGUID: fvjyAgNDRJq56rMtdchd8g==
X-CSE-MsgGUID: qhaZ5s7kQmCcnfNbcNH1/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="183219478"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2025 11:08:07 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2voZ-000000005gv-2vC6;
	Sun, 28 Sep 2025 18:08:03 +0000
Date: Sun, 28 Sep 2025 20:07:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 41/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000
 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does
 not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509282010.CQKIAIDD-lkp@intel.com>
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
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 9340f4298dc40c3db24bea5d0f2318da700265c6 [41/140] arm64: dts: apple: t600x: Mark MCA power states as externally-clocked
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250928/202509282010.CQKIAIDD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509282010.CQKIAIDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509282010.CQKIAIDD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[142, 0], [143, 1]] is too long
--
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[156, 0], [157, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[142, 0], [143, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[156, 0], [157, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[158, 0], [159, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[179, 0], [180, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[224, 0], [225, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[306, 0], [307, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
