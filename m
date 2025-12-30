Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CF3A1E94
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767131301; cv=none; b=C3dm+rP/Q5JJboiA7UY6bCoJ+X7pE6whZDiQiPsZuE3RDUgvkk3O4iVzEIJqJBwmsKABaTcam8HroWSFyHZxm7MM3HA/ShT3M5FDtiO5donnnYolaIdjyYDZJFB6xucGtIAh/5rx8bRBOGC/KIBeMdq+noy2XjG4jQibL9+CqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767131301; c=relaxed/simple;
	bh=uDztJIMNMeC0AdK4WbtAq0Dvz3Aif+D6hjBit/E8Fts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtYREJ3d9JskPp91rviOjibHU9z0/YSj3RAm37++Q13bVbOe70AQBBW23P5IpeFGWvRyuiQSKoU/E9OVbNyYzGcU3gbNaTZQItsPEaEawKkaTQ1bSY8hLD5weIwrVcsZetjJty+zd5cmj4E/4FSBZO/ij77PxFvhBFTsroQr3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZx6jcvQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZx6jcvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767131299; x=1798667299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDztJIMNMeC0AdK4WbtAq0Dvz3Aif+D6hjBit/E8Fts=;
  b=lZx6jcvQCpmM5CNxh/S/fjVfboZb9LKaYrXbocjvwHk2h6o3dW93kh4E
   tS3buJCzFsCnnpsHUkfVMGfrY+A2M0V3aeBevO0FLTZziSF1Py173kSHi
   nqDQJQVtcY10GahRY0b4lu3SCAdMpRJx4zEURW9N+YZ0bff1tQZdUyPHS
   2ehh7s9gxFhMEG6zIc10ZnYnb3kev8frUjNCjRmwiQ8CIAJ2tsyvI8oSA
   pCOUX//Y1pR7XDXwGirisE6iWpSGDnW61o5htQKv3KimC2mULUblFL4QJ
   TU31WGzvmznkTaevBx5qwfzmBy1TIgAanQ7bcX+R1wSOzeB1Q66gTnXm5
   Q==;
X-CSE-ConnectionGUID: EM9rrSf8SnWqm0Y3Dw4eJA==
X-CSE-MsgGUID: ZZqRSgl2QrKdqG9X4Tig5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68690100"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="68690100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 13:48:18 -0800
X-CSE-ConnectionGUID: 5LZGmAx7SOGzT6ITAlwX+Q==
X-CSE-MsgGUID: N8/hDgzMR3OW1ng+0IknCg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 13:48:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vahZf-0000000081g-0BVB;
	Tue, 30 Dec 2025 21:48:15 +0000
Date: Tue, 30 Dec 2025 22:47:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 21/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000
 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202512302231.CUZcQzcl-lkp@intel.com>
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
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 45a01553f533c7e71dbd5f25aa29101da7adc870 [21/128] arm64: dts: apple: t8112: Add mtp device nodes for j413/j493
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251230/202512302231.CUZcQzcl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302231.CUZcQzcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512302231.CUZcQzcl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
