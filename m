Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF51F417F
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 21:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749937362; cv=none; b=dNmdRdOT8VyAHDn1Xlck7t7bKX9IXz+VKz0Sdyy50bfsFRkuNNJsIHwAx81Do6lhrU8NuaCgeJUR7iFlpZTkJFL9uzjg27MHAa/NDyo6hfalp1Mm3kezbIDx3gemZgNtQPP0VBBW2sDDqGI/fQsGW1eRbOyyaurH6SBIoQvQVQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749937362; c=relaxed/simple;
	bh=kb20sxtlmeT7ojeYEecuiZbKs99unjBIlsSRiAi9wn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8JyKyBfPAoeyq5xPNz4leHEsxfTRlyH7A2TYtxOYSabS1CHYZoVJy+p7833fc3haEmHnNQHIY6h9DfgJ07cuvRl8KIPb3XKDuse0XZQp9yNouXrFZXqYBMQaZDcZcgwvF/dGScTo1g4Xw1J0JHASsTUAqcodhb9+c8YOAVgyBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J00Q52Qr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J00Q52Qr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749937360; x=1781473360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kb20sxtlmeT7ojeYEecuiZbKs99unjBIlsSRiAi9wn4=;
  b=J00Q52QrQCnri+nCpLJTGByp4NNB9reSYgdUU9ugV4L4Am9TRmHngx53
   5OGh8mOqQ+1HMEN3QLgsdJQMh/4Kpyfn92YZ9upHYJUtueIcWPg+/PQr/
   btMWyELPejl2rSWwhS2W1nNCiD72Lv0rLfr1Y6tmqkIjUpBuTVLRDQpXo
   4WQG6jjvdaw7Eq1sRybP2loLq3mn6Mm57Rx5ZoOE6JhEV2mY8/uV7iOn6
   Z3Q1BuhrhXAvxfJD2WE/L74jYeW7P/puWKT8nPYmiQCpKYv5JAJlyYWAc
   PgcflbX+1JW89tBPwD4+FhY9xcYXg4voLuSVpONdocIOGFs8KUJ1qmhuf
   A==;
X-CSE-ConnectionGUID: LI/I89sBSPusMSxsttfSGQ==
X-CSE-MsgGUID: /Kn5mpCMRTyxp28MBXX78A==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55925781"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="55925781"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 14:42:37 -0700
X-CSE-ConnectionGUID: GfVqMz5pQEyYfMl0diULxA==
X-CSE-MsgGUID: gpm4W5SySKuFDOpIr0pxRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="147961231"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jun 2025 14:42:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQYe1-000Dsq-0q;
	Sat, 14 Jun 2025 21:42:33 +0000
Date: Sun, 15 Jun 2025 05:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <202506150529.BUC5cRQe-lkp@intel.com>
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
In-Reply-To: <20250613-bbg-v3-2-514cdc768448@bootlin.com>
References: <20250613-bbg-v3-2-514cdc768448@bootlin.com>
TO: Kory Maincent <kory.maincent@bootlin.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Roger Quadros <rogerq@kernel.org>
TO: Russell King <linux@armlinux.org.uk>
TO: Paul Barker <paul.barker@sancloud.com>
TO: Marc Murphy <marc.murphy@sancloud.com>
CC: Jason Kridner <jkridner@gmail.com>
CC: Andrew Davis <afd@ti.com>
CC: Bajjuri Praneeth <praneeth@ti.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: linux-omap@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Kory Maincent <kory.maincent@bootlin.com>

Hi Kory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e22b9ddaf3afd031abc350c303c7c07a51c569d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent/dt-bindings-omap-Add-missing-AM33xx-compatible-strings/20250614-000333
base:   e22b9ddaf3afd031abc350c303c7c07a51c569d8
patch link:    https://lore.kernel.org/r/20250613-bbg-v3-2-514cdc768448%40bootlin.com
patch subject: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible strings from device trees
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm-randconfig-052-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150529.BUC5cRQe-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150529.BUC5cRQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506150529.BUC5cRQe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts:17.32-27.4: Warning (unit_address_vs_reg): /fixedregulator@2: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:111.25-114.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:116.37-117.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:317.33-321.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/phy-gmii-sel: simple-bus unit address format error, expected "650"
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:323.25-326.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:352.36-353.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:953.12-983.4: Warning (simple_bus_reg): /ocp/interconnect@4b140000/segment@0: simple-bus unit address format error, expected "4800"
   arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi:87.9-98.5: Warning (graph_child_address): /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tda19988@70/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: / (beagle,am335x-bone-black-wireless): fixedregulator@2: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
--
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:764.27-768.7: Warning (unit_address_vs_reg): /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0/slave@300: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dts:104.32-114.4: Warning (unit_address_vs_reg): /fixedregulator@2: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:111.25-114.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:116.37-117.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:317.33-321.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/phy-gmii-sel: simple-bus unit address format error, expected "650"
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:323.25-326.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:352.36-353.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:953.12-983.4: Warning (simple_bus_reg): /ocp/interconnect@4b140000/segment@0: simple-bus unit address format error, expected "4800"
>> arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: / (beagle,am335x-bone-blue): fixedregulator@2: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
--
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:764.27-768.7: Warning (unit_address_vs_reg): /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0/slave@300: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts:16.32-26.4: Warning (unit_address_vs_reg): /fixedregulator@2: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:111.25-114.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:116.37-117.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:317.33-321.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/phy-gmii-sel: simple-bus unit address format error, expected "650"
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:323.25-326.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:352.36-353.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:953.12-983.4: Warning (simple_bus_reg): /ocp/interconnect@4b140000/segment@0: simple-bus unit address format error, expected "4800"
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: / (seeed,am335x-bone-green-wireless): fixedregulator@2: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
