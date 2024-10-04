Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75CC647
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 00:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000545; cv=none; b=bhiQ2QQ5hqjzbZ9CPRLJCwYjpvxi6aRAiG/H9bc/yfFEnHoFmM1Z2nJlDLLB/g20E/k0Xgi0+iI4lg30RCfQq/WLTT+hxoZn40/PTDoOcOeG8a4uNaLKqTKXhgLamWqXvMHy7tkx2PDaONBh4Wh6geJB4KNqkuyGI/PfDftxwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000545; c=relaxed/simple;
	bh=nThzfEa4HzmR0bmis+rWn9pM9pG/Jbv7y6FHQsCEZEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdKSdTx0YhkdO/D6YNjSVtq6q6BrcPaGOA3VMqSnwPqQhwNiUp3p43kAdCk/vwhM+RsFgUt+hGdyB+n4lrDJ0bAbyQhTu0MP+8znGGUveoMxGnni3Pd8/i1F+a3YHsUPQmtXOYh+/yjvCyAjSSIkKvXuNZdHKdKXvZ6n3N/I+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtEQMm4Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtEQMm4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728000542; x=1759536542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nThzfEa4HzmR0bmis+rWn9pM9pG/Jbv7y6FHQsCEZEk=;
  b=HtEQMm4YiOm3zQ2ED135hmIT2rhe6Z9bIU9/TgViUbATiWEb+fXzBfv/
   2SxBZoFXF56kGCs/MXkZ/dhOHB3+ANoqwwU04P8BjcW+bwOUIZyVhq5xr
   yJS96JoO6EW/ZiDNFmGteF4L8jKc++u4+04OvobT2EnrPWah3IeA0ktoO
   ZcbUSZt5dOftNZ7f1/kkH6MR0fd1Wt+O8GUP5Kb/KDNUusrapacisRNxb
   8/1PXwddeXqavuFSw2goHFNEo56JQvbkeMlZP9yhU8uLQuvyKZuFyNLCB
   /NMvCQHuvqjkdSA1DdPbr8OTILUxkZnt6VKbPvsYdHg6FNbD6OChJHM96
   g==;
X-CSE-ConnectionGUID: 1Qu9kLsmSm6aeyiam+c3aw==
X-CSE-MsgGUID: UsQO0h8QQjOCCKCSGXj7Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27389549"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27389549"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 17:08:59 -0700
X-CSE-ConnectionGUID: v8DhHuIAS6eDQy18smoW9A==
X-CSE-MsgGUID: +TkgA+WBTsWoiwz+HfcOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74359774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Oct 2024 17:08:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVsM-00012m-1B;
	Fri, 04 Oct 2024 00:08:54 +0000
Date: Fri, 4 Oct 2024 08:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1921/2170]
 arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: mcasp@0: interrupts:
 [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1,
 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
Message-ID: <202410040853.lXLj3g93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c02d24a5af66a9806922391493205a344749f2c4
commit: 17d8adc4cd5181c13c1041b197b76efc09eaf8a8 [1921/2170] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
:::::: branch date: 20 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-053-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040853.lXLj3g93-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040853.lXLj3g93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410040853.lXLj3g93-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: gpmc@50000000: 'ethernet@gpmc' does not match any of the regexes: '@[0-7],[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: gpmc@50000000: 'ethernet@gpmc' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
--
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-panda.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
--
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000: failed to match any schema with compatible: ['ti,omap4-l4-abe', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000/segment@0/target-module@22000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000/segment@0/target-module@24000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000/segment@0/target-module@26000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: mcasp@0: interrupts: [[0, 109, 4]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000/segment@0/target-module@2e000/dmic@0: failed to match any schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@40100000/segment@0/target-module@30000/wdt@0: failed to match any schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap4-dmm']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: emif@0: '#phy-cells' is a dependency of 'phy-type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
