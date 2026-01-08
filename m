Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDA132C8B
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 05:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849368; cv=none; b=GX3urQvTdfP1gD3lkIETjXd01n0Z1DP1EV0EP5U1tgI5IMbKh7B12F+RKMRnEtgUOw71oTrvIH7zGdJVvFoKPZinbKh5Z/V4L2fBV4TbNB/wQM6GDeTiorXFblefsB5mibPiTt/4o6o43rCubBKYj3IOKnmSZ5AJfgx5gfYtqAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849368; c=relaxed/simple;
	bh=UsA4FrUjMdEOX4tbQOUn5BF8a9YNsEqx6+obt/zL61M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8qcIND08STiOlNtxncxCSg+0z8KoGX9IoqafrnoIeoOrBSP+zdZ/aknYsldT2lHw3k3wcz7VyxyIPmleWrta4bILpQxWHnE1BxYbz8lWGvPtzef6r98/mLBS7FlMxmH4x56l1jplFKeTn9KtsdYtySIhEakrJHbUNbZVV4GSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekv+wQlQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekv+wQlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767849366; x=1799385366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UsA4FrUjMdEOX4tbQOUn5BF8a9YNsEqx6+obt/zL61M=;
  b=ekv+wQlQm6rKjKwI8raWQofpg3bk1yReBjnhhJ8ywnVA4gq043rgfarj
   vhyWZ5/YKTeM6d1taq2eNlJJ2VdR5SoWqyBZTiDQxndxWFP/kTsPJwq0m
   DoDHNxDmka/gp3RuyoQvujKQbwim4EQCLnIlk58w/VWnR/CK+gVQPnwmu
   qAvJ9XrsgDNe5EzbjFfa3mY3fLo+OtYgNPFsoRVULaX4EQobeyX5ygkCD
   4zfXXnq/RzLYFZ21gOeFyof72yOWs8E89RzjJmMObwdZ5YWajjGKE+9Af
   4Azz+0j/pshS2fF4Sgl7XyD9U2l+0LTv85eI/sNieBsVRRd5MZxRCiJAl
   A==;
X-CSE-ConnectionGUID: VtUmYJv9Q5q26EeoEqQ0Vg==
X-CSE-MsgGUID: sQIHhI8OSrif+7BVrArlEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68417927"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="68417927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 21:16:06 -0800
X-CSE-ConnectionGUID: 93BkSnr6T6CunQ1/QxNw7g==
X-CSE-MsgGUID: YAOlQoFySQKRMwrrt7bVbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="233813365"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Jan 2026 21:16:05 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdiNO-000000001h2-2wEe;
	Thu, 08 Jan 2026 05:16:02 +0000
Date: Thu, 8 Jan 2026 06:15:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Message-ID: <202601080619.ei1kWBXQ-lkp@intel.com>
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
In-Reply-To: <20260105162546.1809714-3-parvathi@couthit.com>
References: <20260105162546.1809714-3-parvathi@couthit.com>
TO: Parvathi Pudi <parvathi@couthit.com>
TO: nm@ti.com
TO: vigneshr@ti.com
TO: afd@ti.com
TO: khilman@baylibre.com
TO: rogerq@kernel.org
TO: tony@atomide.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: richardcochran@gmail.com
TO: aaro.koskinen@iki.fi
TO: andreas@kemnade.info
CC: andrew@lunn.ch
CC: linux-omap@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: danishanwar@ti.com
CC: pratheesh@ti.com
CC: j-rameshbabu@ti.com
CC: praneeth@ti.com
CC: srk@ti.com
CC: rogerq@ti.com
CC: krishna@couthit.com
CC: mohan@couthit.com
CC: pmohan@couthit.com
CC: basharath@couthit.com
CC: parvathi@couthit.com
CC: Murali Karicheri <m-karicheri2@ti.com>

Hi Parvathi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc4 next-20260107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Parvathi-Pudi/arm-dts-ti-Adds-device-tree-nodes-for-PRU-Cores-IEP-and-eCAP-modules-of-PRU-ICSS2-Instance/20260106-004325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260105162546.1809714-3-parvathi%40couthit.com
patch subject: [PATCH v4 2/2] arm: dts: ti: Adds support for AM335x and AM437x
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260106 (https://download.01.org/0day-ci/archive/20260108/202601080619.ei1kWBXQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080619.ei1kWBXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601080619.ei1kWBXQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: pinmux@800 (pinctrl-single): 'pruss_eth_default', 'pruss_mdio_default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: switch@0 (ti,am335x-cpsw-switch): status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: mdio@1000 (ti,cpsw-mdio): status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: interconnect@4b140000 (ti,am33xx-l4-mpuss): $nodename:0: 'interconnect@4b140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/interconnect@4b140000: failed to match any schema with compatible: ['ti,am33xx-l4-mpuss', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
