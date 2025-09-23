Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A1194A6C
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655877; cv=none; b=pB2guTzMDmCRuUoNRE7zygwHePTZnIje2l5IYjCgChsTZa6cxgZGRt44JBUhH7OnKY3+7g2155R1IUukllmI6R3+aPBGc4327wYTibOn/pMH6NTRvFM9sxsr0CR5E/WDn7Wyv7uPlbJDLalZXiI+GBOe89sqtqs6FB35ocZUcWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655877; c=relaxed/simple;
	bh=g4P30xkMBSJCl5zk4HOWGRrgyR0zjUvAbph6so89wP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FabffLBkrgS71fKH7KVriYcYeqfR98nAvA6ZqQMC6EUY/QL15GojuQl1wCQ9SQ4lbHlvv9qhnNTR/STylqh5/w1EHSsiiYhg5bhhXDxw2DBeJEdNB37/kLGOfxjQswztuTw0KiW1Nn09RcIvRWVuDgR8pBcUuND04fHKQ0dXGZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2wn2i4m; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2wn2i4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758655875; x=1790191875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4P30xkMBSJCl5zk4HOWGRrgyR0zjUvAbph6so89wP4=;
  b=H2wn2i4mOPy6OtZ/IR3ZoPamgVcP0YYQVMndRahWw8eJwX2cs9gAUJ4B
   p1ak8F+ABIeDcH9Eby520lKhaVdGu7Q78FE12AtWCcPMGEAFF0y2wwoGP
   jFVvnspwVmB1ajIS0u3HQWL+9jgaaBCskmESNjHLlU9nyEG3v29As4djw
   tvx4Hq8RCVNJL5VL82oEicueFBQH5r5Pc+qskRkJstAqHWHDG9wREsSs+
   sEuH0vGZBgfEEjC8Bj9cA0/iha7AJ+XLbU4i27y5st+VAukvIGSWxLGGO
   Yywkz3PkrFnORnzNcyQjIixdvt1BD6eSZ3R0E7AdfiD1/8VlWm0fZYU/r
   w==;
X-CSE-ConnectionGUID: o/sJ2eKaT3afCR3vnPeEMg==
X-CSE-MsgGUID: tKXYv7zZSbKaeiRLqLRiDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60647769"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="60647769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 12:31:14 -0700
X-CSE-ConnectionGUID: crr3RPpqRx2g/akipbesoQ==
X-CSE-MsgGUID: keS/atm3QPOJqy7ghwJsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="181158699"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2025 12:31:12 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v18jG-000000004HB-11qo;
	Tue, 23 Sep 2025 19:31:10 +0000
Date: Tue, 23 Sep 2025 21:30:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3):
 iommus: [[141, 0], [142, 1]] is too long
Message-ID: <202509232116.S63N4p8l-lkp@intel.com>
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
CC: R <rqou@berkeley.edu>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 8aa03ac27ecb2eb72cd3f1f8004fbb60be85d87a [27/140] arm64: dts: apple: t600x: Add Apple Type-C PHY and dwc3
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250923/202509232116.S63N4p8l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509232116.S63N4p8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509232116.S63N4p8l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[141, 0], [142, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[159, 0], [160, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[155, 0], [156, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[161, 0], [162, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[167, 0], [168, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[173, 0], [174, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[141, 0], [142, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[159, 0], [160, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[155, 0], [156, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[161, 0], [162, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[167, 0], [168, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[173, 0], [174, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[157, 0], [158, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[163, 0], [164, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[169, 0], [170, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[175, 0], [176, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
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
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[178, 0], [179, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[184, 0], [185, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[190, 0], [191, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[196, 0], [197, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
