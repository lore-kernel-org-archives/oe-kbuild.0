Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E942C2405F5
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755293229; cv=none; b=fu5cOsLr2Uy5tI8mizXJEIo8/qqnCbmdbVc7uS7FHnOCVm3a/CuSFt7Mvnz9IRB0fxPms131TSmDgxzKVWZlLa0Lc6ARVxO/gi9REfK8TfVrLF4lOlibxxfGCJH9xQlzSSp7vFRRVo0u1EoFDRr7Rtx7+dWLZkfxTb6OWYm0A3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755293229; c=relaxed/simple;
	bh=VuD5YnUbPgyup0W8wWM88/lC8TIWh1mGpqed1KMHr6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nS3Jg+5g40qpdaGIHmU2F8Jtqk3lPTAv1rbrwNE5p+YTA319y0rU3452SWh9+x3/N+b3Ix0C+ab+7GyqOU5vyFQt3wTQHs0Z3Y3y6YZq6HOnKO2EJt2GVsVGc0Buq8PkqoB3BZdGBXxUkkAX3d5uZiYcjKImJcy0V0TeG6m0zns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6EaWhLv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6EaWhLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755293228; x=1786829228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuD5YnUbPgyup0W8wWM88/lC8TIWh1mGpqed1KMHr6w=;
  b=e6EaWhLvfA+JkAkDHmp7NWJDWhplXlfIKPOmtXGLLtce7O8bRY09eSSk
   5PukniL/rgu8wRXn0k1QAjkQ99qWSYXdb2X7S+80/J1+2tW50jteRdyzX
   OZ9obNsrqL/IWJpRcahFt8EUhI8ljExcJowVa6st2atvzPyit0i7uURIj
   MeoTwgVoemh9z5pD5sKtxZkd51KlnhF4XvbJajlf+tabZGCqLxwDYfsd6
   UZ7HMj7IFZpf4C3CnYWd9u507abfhzs1kA03rMLUsQmw6gqr7YzPu21gS
   nxw2D4aNMtxnDfkva3C2Vgk1ra3ifdPK6brYuAFlgpZF8QJfdoftCAB8v
   A==;
X-CSE-ConnectionGUID: Bj0A9gMGR5K+Rivzyk2e0g==
X-CSE-MsgGUID: jiHbCerqQua/9AL3MicyLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57691272"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57691272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:27:08 -0700
X-CSE-ConnectionGUID: bpp+a5laRAC3qp44H85PEA==
X-CSE-MsgGUID: fW8LZo0STF6Ghyvjec2Caw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166725065"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Aug 2025 14:27:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un1x2-000CMC-0I;
	Fri, 15 Aug 2025 21:27:04 +0000
Date: Sat, 16 Aug 2025 05:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 702/801] arch/arm/boot/dts/ti/omap/omap2420-h4.dtb:
 mcbsp@48074000 (ti,omap2420-mcbsp): interrupt-names:0: 'common' was expected
Message-ID: <202508160549.txoGW5DX-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 754be9b6a20050b6c1423cd6309e51d32c1ed930 [702/801] dt-bindings: sound: Convert ti,omap-mcbsp to DT schema
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250816/202508160549.txoGW5DX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160549.txoGW5DX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508160549.txoGW5DX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpmc@6800a000 (ti,omap2420-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpmc@6800a000 (ti,omap2420-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@240000', 'partition@40000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): interrupt-names:0: 'common' was expected
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): interrupt-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): interrupt-names: ['tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): interrupts: [[59], [60]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): reg: [[1208434688, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48074000 (ti,omap2420-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48076000 (ti,omap2420-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48076000 (ti,omap2420-mcbsp): interrupt-names:0: 'common' was expected
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48076000 (ti,omap2420-mcbsp): interrupt-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: mcbsp@48076000 (ti,omap2420-mcbsp): interrupt-names: ['tx', 'rx'] is too short
--
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/gpmc@6e000000/ethernet@gpmc: failed to match any schema with compatible: ['smsc,lan91c94']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): interrupt-names:3: 'sidetone' was expected
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): reg: [[1208434688, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): interrupts: [[16], [62], [63]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): reg: [[1208442880, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): interrupts: [[17], [89], [90]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): reg: [[1208532992, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): interrupts: [[18], [54], [55]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): reg: [[1208541184, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): interrupts: [[19], [81], [82]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): reg: [[1208573952, 255]] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
