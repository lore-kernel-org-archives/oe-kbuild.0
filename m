Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4925392C
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779559319; cv=none; b=XCUedDGF5bS4u9W8fVzJ3M2psdaTXUP8S/vNlUo+4+yh9WglO3Sk6SlLprti8F7l/YjrgoOhAYmT9wO2zksM3JotSIdCQF/l8ZJ8hoyQA3x3TG3Ig/aUTip3C1XbnNtJrOzkdH0J0lZNdSVrqmwgNHvCk7e0hoBU24TkZnJ6KnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779559319; c=relaxed/simple;
	bh=UwvKwJW+Zf7Afvj++iFNcyUQeBc2JZPQho/n2s+pRwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RauG3dPk6E79OxXG/7vDDf5SoAYSsWkBaZ5DfPrPdhwRzrPv9/7C5K6nMwmbld5ACSEbZSf/CJAlygLomeg5lRDN+HgeeYh9PYHSE7SgPqgyhHjDBPzzmY/JrWIEPqM/b/dKhSQw+Pw5IZUpyZPINaSOey0bsQiQHxJkKB7gxLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+jcZs4S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+jcZs4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779559314; x=1811095314;
  h=date:from:to:cc:subject:message-id;
  bh=UwvKwJW+Zf7Afvj++iFNcyUQeBc2JZPQho/n2s+pRwk=;
  b=c+jcZs4SEFdYqDzRYgCd6+C397LTIxhQ7LWo/cwSxyjNZZxCYyFkf1jC
   N/y6fvcWkqgNy4k2OBBCiORWDVGBCY+b2v28BCmDHNXrdmwDsoz3+f8VA
   aXXQb5a/l81SKQS3zr07IxV8t6zWiNXBal78ypdrf+3985rHtLf4uk69U
   1lbHOprU5c5klgYUKgUt95CLQdsXXoExnOA2Ifw95bN9/tvBnsNTeIe4w
   OqQJKkaTsR2X08fNoi66czuKjsdreT/BTQx3/b2u/vxvz4I8g3i3wqJfh
   c1YJa7/CcUpcArGGdA7ykv0xbvDkLcjeA8b85DhUC1DyTf5x+wFxwaHjr
   g==;
X-CSE-ConnectionGUID: rISBCLpwQDShrdFB7pr2ow==
X-CSE-MsgGUID: as7J7s5aRByOHh66bRB8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91024173"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="91024173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 11:01:53 -0700
X-CSE-ConnectionGUID: aHr7Eo5NQIC7g17jdm20VQ==
X-CSE-MsgGUID: ZKhV8502SCexBS0cHXk5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="243011930"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2026 11:01:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQqfV-00000000Bjd-11t6;
	Sat, 23 May 2026 18:01:49 +0000
Date: Sat, 23 May 2026 20:01:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: cpu@0
 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency',
 'vbb-supply' were unexpected)
Message-ID: <202605231909.owLCeGEC-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 80728bfa8c79b81eeea305f555fe5582d1907286 dt-bindings: arm/cpus: Add missing properties
date:   1 year, 1 month ago
:::::: branch date: 10 days ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260523/202605231909.owLCeGEC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231909.owLCeGEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80728bfa8c79 ("dt-bindings: arm/cpus: Add missing properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231909.owLCeGEC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
   arch/arm/boot/dts/ti/omap/omap36xx.dtsi:136.10-139.6: Warning (graph_child_address): /ocp@68000000/isp@480bc000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
   arch/arm/boot/dts/ti/omap/omap36xx.dtsi:136.10-139.6: Warning (graph_child_address): /ocp@68000000/isp@480bc000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
   arch/arm/boot/dts/ti/omap/omap36xx.dtsi:136.10-139.6: Warning (graph_child_address): /ocp@68000000/isp@480bc000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /: failed to match any schema with compatible: ['headacoustics,omap3-ha', 'technexion,omap3-tao3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /: failed to match any schema with compatible: ['headacoustics,omap3-ha', 'technexion,omap3-tao3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /: failed to match any schema with compatible: ['headacoustics,omap3-ha', 'technexion,omap3-tao3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' is not one of ['ti,omap3430', 'ti,omap3630']
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /: failed to match any schema with compatible: ['isee,omap3-igep0020', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /: failed to match any schema with compatible: ['incostartec,omap3-lilly-dbb056', 'incostartec,omap3-lilly-a83x', 'ti,omap3630', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /: failed to match any schema with compatible: ['incostartec,omap3-lilly-dbb056', 'incostartec,omap3-lilly-a83x', 'ti,omap3630', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
   arch/arm/boot/dts/ti/omap/omap3-n900.dts:37.3-8: Warning (alias_paths): /aliases:i2c0: aliases property is not a valid node ((null))
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: aliases: i2c0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000: failed to match any schema with compatible: ['ti,omap3-l3-smx', 'simple-bus']
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000: failed to match any schema with compatible: ['ti,omap3-l3-smx', 'simple-bus']
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000: failed to match any schema with compatible: ['ti,omap3-l3-smx', 'simple-bus']
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000: failed to match any schema with compatible: ['ti,omap3-l3-smx', 'simple-bus']
--
   	'ti,omap4430' was expected
   	'ti,omap4-panda' was expected
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:512.35-519.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m3x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,am3517' is not one of ['ti,omap3430', 'ti,omap3630']
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /: failed to match any schema with compatible: ['compulab,omap3-sbc-t3517', 'compulab,omap3-cm-t3517', 'ti,am3517', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'gumstix,omap4-duovero' was expected
   	'ti,omap4460' was expected
   	'variscite,var-som-om44' was expected
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /: failed to match any schema with compatible: ['compulab,omap3-sbc-t3530', 'compulab,omap3-cm-t3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /: failed to match any schema with compatible: ['compulab,omap3-sbc-t3530', 'compulab,omap3-cm-t3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000: failed to match any schema with compatible: ['ti,omap3-l3-smx', 'simple-bus']
--
   	'ti,omap5' was expected
   	'ti,omap2' was expected
   	'ti,omap3' was expected
   	'ti,omap4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/ti/omap.yaml
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /: failed to match any schema with compatible: ['technexion,omap3-thunder', 'technexion,omap3-tao3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /: failed to match any schema with compatible: ['technexion,omap3-thunder', 'technexion,omap3-tao3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /: failed to match any schema with compatible: ['technexion,omap3-thunder', 'technexion,omap3-tao3530', 'ti,omap3430', 'ti,omap34xx', 'ti,omap3']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000: failed to match any schema with compatible: ['ti,omap3-l3-smx', 'simple-bus']
--
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:546.35-554.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi:574.35-582.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_ck@d00: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/dpll4_m6x2_ck@d00)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/ts_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:112.31-118.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/cpefuse_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:120.21-126.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/ts_fck@a08: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbtll_fck@a08)
   arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi:210.42-216.4: Warning (unique_unit_address_if_enabled): /ocp@68000000/cm@48004000/clocks/usbhost_120m_fck@1400: duplicate unit-address (also used in node /ocp@68000000/cm@48004000/clocks/usbhost_48m_fck@1400)
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: pmu@54000000 (arm,cortex-a8-pmu): 'reg', 'ti,hwmods' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc/iva: failed to match any schema with compatible: ['ti,iva2.2']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /soc/iva/dsp: failed to match any schema with compatible: ['ti,omap3-c64']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: ocp@68000000 (ti,omap3-l3-smx): regulator-abb-mpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: ocp@68000000 (ti,omap3-l3-smx): $nodename:0: 'ocp@68000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: / (beagle,am5729-beagleboneai): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /: failed to match any schema with compatible: ['compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /: failed to match any schema with compatible: ['compulab,sbc-am57x', 'compulab,cl-som-am57x', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: / (ti,am5728-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: / (ti,am5718-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: / (ti,am5748-idk): encoder@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /: failed to match any schema with compatible: ['ti,dra7-evm', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /: failed to match any schema with compatible: ['ti,dra72-evm', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /: failed to match any schema with compatible: ['ti,dra718-evm', 'ti,dra718', 'ti,dra722', 'ti,dra72', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: / (ti,dra718-evm): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra7.dtsi:23.10-44.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /: failed to match any schema with compatible: ['ti,dra76-evm', 'ti,dra762', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /: failed to match any schema with compatible: ['ti,dra76-evm', 'ti,dra762', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /: failed to match any schema with compatible: ['ti,dra76-evm', 'ti,dra762', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
