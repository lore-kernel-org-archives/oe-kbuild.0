Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532433168E1
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jun 2026 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781832271; cv=none; b=Ue6u2vklaTpi4Iyn+UAjt7Qc2JTzwvTGCMQb/+pEOMac3Uyl1h6gxacPRg3Lj30ETkeGg07XHwuhdQ+4R1jXDzpVt92knAMbhbUA5U9E8KteF05jABVPPoKuweyty0s63sXb5gJJU3k/6J8WSrJ1AGR3pPj0Sb/oXmlvyyF79BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781832271; c=relaxed/simple;
	bh=TO4IwGRL3yCRqYSyhxK52nLJN3i3JGaqdKMQv0xRUjo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KyiO2R3vrN/1c385gd2o9Ywn0F0AjUlTnQtIw8zbD4dRPCjAvX/tYOyouYAV1/S4s9EYw0RXGDRtyNfB0Wgux+sjWadFoYQKvxYS6VXPtEL2WMEIXuFmdUpt2+OCiCP00Nvq0w4hlJ2EjtFl5TEC9Mlef3mkBRebC1JN2+YQldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyTnj5FW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyTnj5FW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781832269; x=1813368269;
  h=date:from:to:cc:subject:message-id;
  bh=TO4IwGRL3yCRqYSyhxK52nLJN3i3JGaqdKMQv0xRUjo=;
  b=cyTnj5FWCSTKltxcEfC5fjbNFNhwqb8fvT3D+9zMf4qHZfNIJTahuhy7
   LiMIOW1+QLgAAOz6Gv0Xl/2J71CNn7pwWLqn5nWPNrfB5BRhcIhJOUy8a
   nQEKq+hHU7TYMEFV+6ORfsuTlmEa9h46qBvENzOCHnYkwzce2Mg+uh2+O
   Efj6KqlKzEe4zjO/uF8cFQAMdbbGvSNHDTE8698FVpZpTALlFcfyTi6D7
   AJoNgyQIsGsi+YDJU8aLyZ83teWVn7IJjpbKa/YGxKlSUxju/J1WRi42q
   WbVApbBbAxPP2aH5Tgtisy2pek5FzjtV/o2wsOUVAwATLqTvb/lscXSB6
   g==;
X-CSE-ConnectionGUID: 0cbhsTOoT1iPCi6IVHbG+Q==
X-CSE-MsgGUID: lSR4UVh/SjarFnAWIELa5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82461660"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="82461660"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 18:24:29 -0700
X-CSE-ConnectionGUID: bs4KKPrGStWw1FWTQZqZJw==
X-CSE-MsgGUID: OPfXRNs6Q+q7WiWps8+lpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="246157293"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2026 18:24:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waNy5-000000005dp-261d;
	Fri, 19 Jun 2026 01:24:25 +0000
Date: Fri, 19 Jun 2026 03:24:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: wdt@48022000
 (ti,omap2-wdt): $nodename:0: 'wdt@48022000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202606190328.wp6GBtms-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
commit: 017bca91639f01302382013033b685ec8759aba4 dt-bindings: watchdog: Allow node names named 'pmic'
date:   7 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2053-20260617 (https://download.01.org/0day-ci/archive/20260619/202606190328.wp6GBtms-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260619/202606190328.wp6GBtms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 017bca91639f ("dt-bindings: watchdog: Allow node names named 'pmic'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606190328.wp6GBtms-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@240000', 'partition@40000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/mmc@4809c000: failed to match any schema with compatible: ['ti,omap2420-mmc']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: wdt@48022000 (ti,omap2-wdt): $nodename:0: 'wdt@48022000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
--
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: scm_conf@270 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/l4@48000000/target-module@4000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/mmc@4809c000: failed to match any schema with compatible: ['ti,omap2420-mmc']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: wdt@48022000 (ti,omap2-wdt): $nodename:0: 'wdt@48022000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/i2c0: failed to match any schema with compatible: ['i2c-cbus-gpio']
   arch/arm/boot/dts/ti/omap/omap2420-n800.dtb: /ocp/i2c0/retu@1: failed to match any schema with compatible: ['nokia,retu']
--
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: scm_conf@270 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/l4@48000000/target-module@4000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/mmc@4809c000: failed to match any schema with compatible: ['ti,omap2420-mmc']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: wdt@48022000 (ti,omap2-wdt): $nodename:0: 'wdt@48022000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/i2c0: failed to match any schema with compatible: ['i2c-cbus-gpio']
   arch/arm/boot/dts/ti/omap/omap2420-n810.dtb: /ocp/i2c0/retu@1: failed to match any schema with compatible: ['nokia,retu']
--
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: scm_conf@270 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/l4@48000000/target-module@4000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/mmc@4809c000: failed to match any schema with compatible: ['ti,omap2420-mmc']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: wdt@48022000 (ti,omap2-wdt): $nodename:0: 'wdt@48022000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/i2c0: failed to match any schema with compatible: ['i2c-cbus-gpio']
   arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dtb: /ocp/i2c0/retu@1: failed to match any schema with compatible: ['nokia,retu']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
