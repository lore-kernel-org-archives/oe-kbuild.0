Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA390328617
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255532; cv=none; b=NeHyGm0qVhXMNx2AJMwsMArgSxYbnjxtTCOrmnILZ3dkkUeIdVhpZIppwOQ1iaw20KlBQM2T59hQ/Qc+bQb6KLuVOuE8l2UEjs7csa+P0/rNoQ2KOMH/rXI/c2XS5yEMu3y1itU73n4fKQo1jOlihj3sZ4eYGeD936AM0h2r3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255532; c=relaxed/simple;
	bh=VGKtt9SC9siU6JXAk8ZKD0YMqaHD6QvqqYazns8Ek/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G1YG1nUgq8nsC/CHtb68zISHxAwo6o+aL5dh8qBO0VpRrmQkK6N1rDj2EUSpz11Sow48pR410OseMvfgR3TkZzft0bp71q1GJNcD2B35YARG03e8wG2uBtZnfA/kzNZH3L5JYmSLy77UfxKn7C589QMztS8bvnKqGbcx0qa4aCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfTUcMW8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfTUcMW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771255531; x=1802791531;
  h=date:from:to:cc:subject:message-id;
  bh=VGKtt9SC9siU6JXAk8ZKD0YMqaHD6QvqqYazns8Ek/U=;
  b=EfTUcMW8AArwIpEbz3Y1FKgnD6uTKDXNm7OV+I6KUtOhg5nTwJU13nDj
   0o7FhXR5HvRW13QzBKa1kpnTGMH7hyR1LTI313djbsW7Qkh4hLNlVh9fP
   tW37TT0tWc7t0PA+3Tu8CEU8lspAqgs7vQCv2krnMP5BMIV6L0bmZSjFU
   IyCWclh73IQXc63oKAIIi34SFztpekUhiQFmmsZU/1wFYmf1JR2AbC3HI
   t50kRBM0qgea2Oa/YWcTvW5PlsWwnwwP4idAKGlS1TK3VZ25s+RsVjVdh
   vRenuhpZX/wpUFlNH+bQMmPAliio9AT27F8JysTUUsRZhZckJPR01uGJe
   Q==;
X-CSE-ConnectionGUID: TfGT6LTlTmOSp8J8b701fA==
X-CSE-MsgGUID: KRzPPSpPT1ulptEsE9328A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83701116"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83701116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 07:25:30 -0800
X-CSE-ConnectionGUID: gP2zNKIQQbCyS+QIy3DHjA==
X-CSE-MsgGUID: 7QLJDPc2RTi08GV130fVhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212947319"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 07:25:29 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs0TX-000000002VB-0PBj;
	Mon, 16 Feb 2026 15:25:27 +0000
Date: Mon, 16 Feb 2026 16:24:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 1/25]
 arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: lcdc@0 (ti,am33xx-tilcdc):
 'port' is a required property
Message-ID: <202602161618.sku6dwEC-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   0ef1dcf4c16bb6d90e8fbf7b18f3d76b79fcde9d
commit: e88bb45cf742177a18d63d306be345a294b4c1db [1/25] dt-bindings: display: tilcdc: Convert to DT schema
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
config: arm-randconfig-2051-20260214 (https://download.01.org/0day-ci/archive/20260216/202602161618.sku6dwEC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161618.sku6dwEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602161618.sku6dwEC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: lcdc@0 (ti,am33xx-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
