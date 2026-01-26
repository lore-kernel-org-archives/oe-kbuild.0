Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A061AA1F4
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 04:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400859; cv=none; b=Qmhq8PO7CU/rMmNOkym0k0lHz/sZ/wy/58KPPLxg3RxIX+m6NO2Hp1TqBfHnRWn6Lmiog/z7UJEcEOvAU9Gh3DHTnB8PrZu2erMBuDVXzEk4v564Et1mE3Zw8iOoOkO4A2ne2uaUrRfcTUVVcmyLTnk6mtbgD6yPowwyMmyskMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400859; c=relaxed/simple;
	bh=g6J4dgfuObeiaTHdOHFSpgvacGcLxNFyXlQDn8rOHnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VyuKnxpn/pM5JMdzUDDQ0+hNoVpTXSWOTlg41sJ22sstk8sPKA4zl2jq+zLSJnjlr/KYmU5aBBTE1S9u8tcgk68l8uXiWJm8aMvKrrht2359fIzHUHDAqjJDUfDIhLqBWXONWTwU086q6EU+i0KP+qcKk9vUDFfHenwIjlrVwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZs6Fj4N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZs6Fj4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769400857; x=1800936857;
  h=date:from:to:cc:subject:message-id;
  bh=g6J4dgfuObeiaTHdOHFSpgvacGcLxNFyXlQDn8rOHnI=;
  b=FZs6Fj4N0h7+oCjeiApKpkix9gfdaYgLh/tqoaRE3w0p2fhFlXde1BKq
   7t9bd+/bNZUsuFqPCyBpwsUILN4eyKYeDZoG9Mfje4xyKP9v+EkAVhl51
   ZxQsVipB2lukPUfQIddnRWt/3OX8KK3clO/KSpFoMqNtrFUGy7BvCN+o1
   lBQpAfJBpP5RceMnjgtzQUrWpqNdO+06m6uE3HS3y7d8pwWt5FsKlAZTj
   SYbvC+tK1zLPdSUzJ4960B+mj+Q6GhOGbYPbgpKz5H3FOvCXL1Lx8jOoB
   2BmPrx1VCjuOGwR2zF6WIIUUOFgQL7rnRe/wI+lNv/NZfTQWeV2Y35b1a
   w==;
X-CSE-ConnectionGUID: 8eCS1hODRA+ySLFlPgRHww==
X-CSE-MsgGUID: ZYGTfxN2QKWJX1yQhn8upA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81688661"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="81688661"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 20:14:16 -0800
X-CSE-ConnectionGUID: NNdBfUnLT+OLWnq5Y8GCgQ==
X-CSE-MsgGUID: wX2iXV8eTH+T9dxf48/WvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="211679728"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2026 20:14:15 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkDzR-000000001Q1-24f3;
	Mon, 26 Jan 2026 04:14:13 +0000
Date: Mon, 26 Jan 2026 05:13:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20
 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202601260535.YFCUHWOy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andreas Kemnade <andreas@kemnade.info>
CC: Stephen Boyd <sboyd@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92954998e252f9487f280bd2d9ce6a54c7efd152
commit: 944b074ff105a1541626c9492e32d248d3b1257b dt-bindings: clock: ti: Convert ti-clkctrl.txt to json-schema
date:   11 months ago
:::::: branch date: 3 days ago
:::::: commit date: 11 months ago
config: arm-randconfig-2055-20260118 (https://download.01.org/0day-ci/archive/20260126/202601260535.YFCUHWOy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260535.YFCUHWOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260535.YFCUHWOy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@300 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@500 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@600 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@700 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@760 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
