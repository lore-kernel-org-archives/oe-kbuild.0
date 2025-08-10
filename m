Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B711D5ADC
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754820688; cv=none; b=hrkx52qO7P/oo1jRH/lJZEhuub6ynYvofZGAwLA2H6nCwdIVyP77EVxBcETcK9yd/+T0cYQbv/p4J86dNWkoEvGSmxkrIEkcrXdDZqZgebfHUKFieEBTkRxD1zTkSpSl70XMViJSN4987vdf5p52XDJ9s8Z09PWqGu92E+96h9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754820688; c=relaxed/simple;
	bh=44AioxwArIgZEowvZFYGytWwM+ZEsBZq7lcnRXUUkps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCXbTVaEG2ee94gKQvWaYvI0I+Sh796OaR0YE6LiCUq2p8Djqo0ur4aK6MsQ+FTvEFRpOG0SOGN5Pus9abY6Oose7xdLXEd4w4Athd9Mkg0GRKtOAyaKg8aJnkcbVHmjqLNNb6NkBw1IHkiZOiMEw08h4a/Y/V46wkDHjAeP5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msLZbSAX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msLZbSAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754820686; x=1786356686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=44AioxwArIgZEowvZFYGytWwM+ZEsBZq7lcnRXUUkps=;
  b=msLZbSAXtIs5B/HsXv3P3mL0jjf2DlWTkhqXCErFpzG+KH+ImyIaByr5
   mgOdEpQuT27AZS0g0g8aYy2MceBOD9r4La2aZqjW0Rr6m2CH5f6zAJtyV
   IIAVgbbcYxQGa9E254LniXp9osSIUYPKSSTleEJtE3Zn1PrxIvval8qCh
   rVluoN9tdU76EmnLGP0OYx6qcA0LPhirdOdWzNc8fwlKNJIVqWoiyHhrP
   a5WOjPAK3aW0pNw1y2zdaqx0ZrrpyBTK8ZFQrK82H73+ERoFSPYxWP6qo
   6fgv7ODy9ICj0jtEzvSW54r7qn3f4TDXq6hcXuiUYF2NRYys9gO298p7l
   A==;
X-CSE-ConnectionGUID: pzPUkm7LSE+rMJaao5Xdag==
X-CSE-MsgGUID: AXqY9Ot3QE6SQ3oP5wzEzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="68178259"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68178259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 03:11:26 -0700
X-CSE-ConnectionGUID: mHXrlk/CTCyR0pAk26WeZg==
X-CSE-MsgGUID: 4heUD2KLSLOHdpG1dLRKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166034798"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2025 03:11:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ul315-0005Fg-0F;
	Sun, 10 Aug 2025 10:11:08 +0000
Date: Sun, 10 Aug 2025 18:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 702/801]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000
 (ti,omap2430-mcbsp): interrupt-names:3: 'sidetone' was expected
Message-ID: <202508101839.EY3zJdOs-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-054-20250807 (https://download.01.org/0day-ci/archive/20250810/202508101839.EY3zJdOs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508101839.EY3zJdOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508101839.EY3zJdOs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/gpmc@6e000000/ethernet@gpmc: failed to match any schema with compatible: ['smsc,lan91c94']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): interrupt-names:3: 'sidetone' was expected
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): reg: [[1208434688, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48074000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): interrupts: [[16], [62], [63]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): reg: [[1208442880, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48076000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): interrupts: [[17], [89], [90]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): reg: [[1208532992, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808c000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): interrupts: [[18], [54], [55]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): reg: [[1208541184, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@4808e000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): 'dma-names', 'dmas' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): interrupt-names: ['common', 'tx', 'rx'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): interrupts: [[19], [81], [82]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): reg: [[1208573952, 255]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/ti,omap-mcbsp.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mcbsp@48096000 (ti,omap2430-mcbsp): reg-names: ['mpu'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
