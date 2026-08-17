Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D83431A31
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972416; cv=none; b=r8l7vdJvSUgNE6Q/li36TQUL222onpCAe8nXJiYNFhGOnHQIeIytvGWSZHkdf3WaLl8oepVwhXQiXrpwhiLOFMUjlloZiRhleJiTlbN2rl/BaSI0BPCghqxZgYC/UfE4MWYKFjc9DdyeHe5eWmipQKh+xE9CgXQL9M0NKWhbp7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972416; c=relaxed/simple;
	bh=ai6Jnn2054DkPXnDS3j6bfdSyCcCp1QJUwPCZBkXZUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Roco4MoBUA/BUSKw96AQKivGXGYcNxYcKsRDbGsJV01hRCnLZlmQ2L3PDWGFJ5YQuyGdPZ6AgOvolxla9N2pbP4rR1YxC82BIJUj8217CqEu573lC2n4lfld4Sph5kJxaPIPmd4S56+uGNsMcuBM9hZzge2X/OyWGk6b9Li/F+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPfyJgKk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPfyJgKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786972414; x=1818508414;
  h=date:from:to:cc:subject:message-id;
  bh=ai6Jnn2054DkPXnDS3j6bfdSyCcCp1QJUwPCZBkXZUc=;
  b=bPfyJgKkaobS8c8pmjd+01gLlRo/gQc/XMLvpGYxfZMnr91UDLVCYP0X
   K1xIc/E0sOW0f37MQX4joTlOewCfV18eTfXGs/koXsy+MJXJaI8y7i8ue
   mYUgztMgw9g5v0I8wIvHZpCg5NJ3fc//XLE9mi4eXzPfNUfRZWsotPR4F
   HzeoPDCxwkXOYyZ6ayIUIUVpGZtNRiwtFYiV0YVg8JvvaXxM9TIqcISJL
   Dc+RP3hDcW2z7Je+poc06JzGv3qSUBude8NXcxI8gMRVNX4qXkjsdB0VD
   xD1JhTZZmMlP1Q6FHy+0181YI+c7FOnFiyVfYMjGVQUAaDWFnMQEXYWUO
   A==;
X-CSE-ConnectionGUID: CkWNL/RUQYyu3joZdSrxPw==
X-CSE-MsgGUID: o3On/bOqS5u3doSbEj9eKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87512888"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87512888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 06:13:33 -0700
X-CSE-ConnectionGUID: yqho44MqRci+SjRWgMF49A==
X-CSE-MsgGUID: 8qpoaBoPQ6y305B2t/iRoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="258709990"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2026 06:13:33 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvx9e-000000006pB-4B8Q;
	Mon, 17 Aug 2026 13:13:30 +0000
Date: Mon, 17 Aug 2026 15:13:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: twl@48
 (ti,twl4030): regulator-regen: Unevaluated properties are not allowed
 ('startup-delay-us' was unexpected)
Message-ID: <202608171540.9HUKRHSv-lkp@intel.com>
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
TO: Grond <grond66@riseup.net>
CC: 0day robot <lkp@intel.com>
CC: "H. Nikolaus Schaller" <hns@goldelico.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/dt-bindings-twl-regulator-Add-bindings-for-exposing-ti-twl4030-regen/20260812-201259
head:   4f5559ad82b8debd2be982b089e18240288940e9
commit: a6474ecbd6d2cf15a47148897e3f1acdff219575 arm: dts: omap3pandora: Populate DT data for the TWL4030's REGEN regulator
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2051-20260816 (https://download.01.org/0day-ci/archive/20260817/202608171540.9HUKRHSv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171540.9HUKRHSv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171540.9HUKRHSv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: twl@48 (ti,twl4030): regulator-regen: Unevaluated properties are not allowed ('startup-delay-us' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: lcd@1 (tpo,td043mtea1): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/tpo,td.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@480ad000/wifi@1: failed to match any schema with compatible: ['ti,wl1251']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: mmu@480bd400 (ti,omap2-iommu): ti,#tlb-entries: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: twl@48 (ti,twl4030): regulator-regen: Unevaluated properties are not allowed ('startup-delay-us' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: lcd@1 (tpo,td043mtea1): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/tpo,td.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@480ad000/wifi@1: failed to match any schema with compatible: ['ti,wl1251']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: mmu@480bd400 (ti,omap2-iommu): ti,#tlb-entries: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
