Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A031B42050
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 04:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778301444; cv=none; b=Fct6RqPvW+rN6CMPAMymuiqzB+2MmDSAAj2k8FWJQBQCLD6XBQwyVSQEJsbejLmsFlHUGv7bPYvKKF9flSDjtSe2Ot/G9Ip99Jirn3IXSCOx95UkZ4gQ3zXbf5tAHNjgMqnUti9/R4BGRU6kq9DY5J2e7BNxeu803o5BBTyMjwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778301444; c=relaxed/simple;
	bh=16V7JxOIE7fXIDYUfh95jKRDX+qJM6YmmsfrWTzBsdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HJBJcPqi/KM1D8jCwGRE8Qp87x60DuDiLskA0ELknM1qtYmGE4aQ4/25qPjLlmKCjIqVUVXQO10ZzOpzNovHCSHhDEU8xn2qndH6JTySWLJuwnDjcvxFqM/paiMLkvOfKHk/8EhmrUz5RUIFXeXSUaG13FxtbRKxPim/SeCrc6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhScaO3l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhScaO3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778301442; x=1809837442;
  h=date:from:to:cc:subject:message-id;
  bh=16V7JxOIE7fXIDYUfh95jKRDX+qJM6YmmsfrWTzBsdk=;
  b=KhScaO3lafm/5uNXrPfrohHz9aZqswSR/yXPWTL9YvwOg19OQlx5o9sE
   Ipgcos7uteC0ZTlwkxWUDffRhV6c6kahSzGXryPdkQvmb96NmDwMxjF1V
   HG8Am1BElBGu74YNgnkcuze8q5HQaO/TG5N+EZnQoG3ItlbRzQ2P7XtyF
   9P6gEXLZXLjn7sm4CuaDmSeoeHBdn7Od16XfTqrp1SX9rBVY2Rf+QyINe
   gZC5X34Naryjtxtc65Mxbt9DXZ0zeqLx4ZXKqQpcfzDGPncv1QJcEgmIi
   UrqddorvHQ7/bgpyeO69Wb7lTPgbNZntYM+ntJyjXrUY903SEIPOkL+x5
   w==;
X-CSE-ConnectionGUID: Ygxfixi7QT6JO7BMtBuYZw==
X-CSE-MsgGUID: LTFSta+OTFSvxK8VX6qAMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78414752"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="78414752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 21:37:22 -0700
X-CSE-ConnectionGUID: z4RwuQYER1u/VsQFPZMAPg==
X-CSE-MsgGUID: 1uh54F5kRuSNWYteadS/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="241895656"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2026 21:37:21 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLZRH-000000007MP-1B40;
	Sat, 09 May 2026 04:37:19 +0000
Date: Sat, 09 May 2026 06:37:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0
 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency',
 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
Message-ID: <202605090646.XRPW1KIi-lkp@intel.com>
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
head:   8bb44576c5ec0e6b29ee048b88235f6f407b6979
commit: 80728bfa8c79b81eeea305f555fe5582d1907286 dt-bindings: arm/cpus: Add missing properties
date:   1 year, 1 month ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-2051 (https://download.01.org/0day-ci/archive/20260509/202605090646.XRPW1KIi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090646.XRPW1KIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80728bfa8c79 ("dt-bindings: arm/cpus: Add missing properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090646.XRPW1KIi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /: failed to match any schema with compatible: ['ti,am572x-beagle-x15', 'ti,am5728', 'ti,dra742', 'ti,dra74', 'ti,dra7']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'voltage-tolerance'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'voltage-tolerance' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aliases: 'd_can0', 'd_can1' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /interrupt-controller@48281000: failed to match any schema with compatible: ['ti,omap5-wugen-mpu', 'ti,omap4-wugen-mpu']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply', 'vdd-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@1 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cpu@1 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vbb-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/l3-noc@44000000: failed to match any schema with compatible: ['ti,dra7-l3-noc']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: interconnect@4a000000 (ti,dra7-l4-cfg): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
