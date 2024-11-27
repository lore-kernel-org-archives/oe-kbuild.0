Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C41FECC8
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732717034; cv=none; b=ljSctRZztPkvrjQAfJtnnhsUBVBYHax0Baaj++iOWI+0gNf7xv6xsYnipUIsYoFAocyhSN4BrwZMg+GfSfqd9oTQjjZsdZ1NcKlnbyAuZwmz/ettrBjF+ePHhrWKEhhQM/yJN40q0kZ7PK+dz3nJzR3v+EFq6/9iCKAARPFzXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732717034; c=relaxed/simple;
	bh=m9UrxIft/EGnMt7KkwBSj9FS6Eo2OAcrbeOjaGtsjds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNNBZy6djUWvu0RUdNxU5SWTlFYdgiunfs2Cx4EgzMK0OLwFupMXPePlzTNcw6YwkKUIMG5dcwycWmhPJXzoiANGUVZWb/MWJEo+letMoTjm2rT1lr8eBdgFEXGCZIthNN0o6XlST/SAbqy04qs2TK0rManc/p8FqmSFC0la/Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqvKZ6Uf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqvKZ6Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732717032; x=1764253032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9UrxIft/EGnMt7KkwBSj9FS6Eo2OAcrbeOjaGtsjds=;
  b=GqvKZ6UfHGkxnQoY5B8151qJ0VfLNoAtZf2gzazHrSCx0jXb13vP5oIR
   it7LfdIt2DRmJC+39oxP72XNwKq/Lus7t10LiatrK4vtEVJHhXC6m7HZx
   EGMetHAalVup2FxOjX9MFnUkOBcRLUrhmWpXcRNKtYIJIkVhb1pZVLLd9
   6N92Ku+l9d6B7Rls6+5kt/KaWPPb9tcs8+aZreM2iRpqhXe7v+a1Yc+SV
   yZ83Pv9a1RgnoNls6swH2htLpbdqsL4mjxAW2xWH72ZGqBYyzemBmI6bl
   SBaVrA34KNNXRVbpe3u7BcG/cJX+tTgV0pfdGa7AF2B+i1Dh4nQJdIqR7
   A==;
X-CSE-ConnectionGUID: qkpaGihtQXO1U0N8oLzTgw==
X-CSE-MsgGUID: bJ7xmqwVSkqloUGvvEY9YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43985660"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43985660"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 06:17:11 -0800
X-CSE-ConnectionGUID: 367e6G6XRoSofqwQVF/Q/w==
X-CSE-MsgGUID: 6m1cnGzeQWGc3PevgXKHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92355984"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 06:17:10 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGIqp-00082x-38;
	Wed, 27 Nov 2024 14:17:07 +0000
Date: Wed, 27 Nov 2024 22:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 7/187]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000: iommus: [[95, 0],
 [96, 1]] is too long
Message-ID: <202411272225.2FN9b26N-lkp@intel.com>
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
head:   fc5046b01c4d686a823d497cd4abeaae227b62db
commit: 450732102c9d0ebf2bbff8f3fb10c9b15fae8cac [7/187] arm64: dts: apple: t8112: Add dwc3 nodes
:::::: branch date: 8 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-051-20241118 (https://download.01.org/0day-ci/archive/20241127/202411272225.2FN9b26N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411272225.2FN9b26N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411272225.2FN9b26N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000: iommus: [[95, 0], [96, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@502280000: iommus: [[99, 0], [100, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@382280000: iommus: [[95, 0], [96, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@502280000: iommus: [[99, 0], [100, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@382280000: iommus: [[95, 0], [96, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@502280000: iommus: [[99, 0], [100, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
