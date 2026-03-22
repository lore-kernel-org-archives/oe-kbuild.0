Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113EE371CF1
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774202355; cv=none; b=u23PJYoii61b9Rn3wpjHOpk5msRDqndXHO72IJE4IecFQY0MFtW3z7uGgubr5wIzy9ZymFrHKLkpl/4lSp985ocRR6mtZ1XjoHv8MPLjYl5KxYtraPuCi7lUqUqGCsWGtqjP3xPo1noSW2+yNqsQvVHbaow5UlTljhzaUtAiJxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774202355; c=relaxed/simple;
	bh=TlmfoKPK03CWaSep0lw+0/AFaSo67EiGBG8g+49xTXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hgE62VzscGNcdluEpdWC2blRsiX/hjb35j69khAPYkebee0wUMyJht/M5NOy82tYpIRZwCS8Dq9uZkTYZJHCVoWvargbsuKpBaoQwxQLBAAKmMGSCjW72DYTxeErYunNnfRVNbC2xo04+pMY1YU/yNXFleWI7Q1vCUPKAnBjVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIBmihef; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIBmihef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774202336; x=1805738336;
  h=date:from:to:cc:subject:message-id;
  bh=TlmfoKPK03CWaSep0lw+0/AFaSo67EiGBG8g+49xTXI=;
  b=AIBmihefy7KmC/XrjyzkAuwlyFyorHSH7omTML8hqHz4Mr8nI5sb0EWn
   VqKIAUwBB1rQ5DTLk/q4JJRwkQq6oFmV8TqFryikuOeJoP52SYGDNfPLQ
   AlukL7PxeRMVyq0xyf7LAN0HUlGYMOQNTd9zeVJCjqYDjHqnIpBdHcinG
   osPuCR6NAaC0aCJxZDFeBbZu44ICCisMLOqvp+xmm43VtP/8U//MvD54W
   s2s816wEI1MYZsRJtuAQCWmuUK7C4f3JG8WIvLNL5BhgkibiCUEqZKklC
   D700Gc38PVkHoALrMEN9VXG6RfL/5WjS76hAWhZRmPL/cWm+bAKyIpAMF
   g==;
X-CSE-ConnectionGUID: kF5kY0RMSMG1OcYFoREJkQ==
X-CSE-MsgGUID: esZnK49xSiWscd/r8c5FmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75242969"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75242969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 10:58:56 -0700
X-CSE-ConnectionGUID: jgr2B1pUQGmiCX2lJUL//Q==
X-CSE-MsgGUID: Tm0MAnM5SKW2KQCy5w+qrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="254281892"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2026 10:58:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4N4c-000000006Px-3WPa;
	Sun, 22 Mar 2026 17:58:50 +0000
Date: Sun, 22 Mar 2026 18:58:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: wdt@48022000
 (ti,omap2-wdt): $nodename:0: 'wdt@48022000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202603221846.LzdySOLx-lkp@intel.com>
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
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: 017bca91639f01302382013033b685ec8759aba4 dt-bindings: watchdog: Allow node names named 'pmic'
date:   4 months ago
:::::: branch date: 2 weeks ago
:::::: commit date: 4 months ago
config: arm-randconfig-2052-20260307 (https://download.01.org/0day-ci/archive/20260322/202603221846.LzdySOLx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221846.LzdySOLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603221846.LzdySOLx-lkp@intel.com/

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
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-bone.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: pinmux@800 (pinctrl-single): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: pinmux@800 (pinctrl-single): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-nano.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: pinmux@800 (pinconf-single): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-shc.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
>> arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@e0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@110: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@140: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@170: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1a0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1d0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@200: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@230: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@260: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@290: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
>> arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: wdt@1c7000 (ti,omap3-wdt): $nodename:0: 'wdt@1c7000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/mmc@47810000: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/target-module@49b00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: l4hs@4a000000 (ti,dm814-l4hs): $nodename:0: 'l4hs@4a000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4hs@4a000000: failed to match any schema with compatible: ['ti,dm814-l4hs', 'simple-bus']
--
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@e0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@110: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@140: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@170: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1a0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1d0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@200: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@230: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@260: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@290: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
>> arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: wdt@1c7000 (ti,omap3-wdt): $nodename:0: 'wdt@1c7000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/mmc@47810000: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/target-module@49b00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: l4hs@4a000000 (ti,dm814-l4hs): $nodename:0: 'l4hs@4a000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4hs@4a000000: failed to match any schema with compatible: ['ti,dm814-l4hs', 'simple-bus']
--
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@e0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@110: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@140: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@170: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1a0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1d0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@200: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@230: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@260: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@290: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
>> arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: wdt@1c7000 (ti,omap3-wdt): $nodename:0: 'wdt@1c7000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/mmc@47810000: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/target-module@49b00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: l4hs@4a000000 (ti,dm814-l4hs): $nodename:0: 'l4hs@4a000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4hs@4a000000: failed to match any schema with compatible: ['ti,dm814-l4hs', 'simple-bus']
--
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: serial@48024000 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
   	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
   	'ti,am654-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/usb_otg_hs@47401000: failed to match any schema with compatible: ['ti,am33xx-usb']
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/usb_otg_hs@47401000/usb@47401000: failed to match any schema with compatible: ['ti,musb-dm816']
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/usb_otg_hs@47401000/usb@47401800: failed to match any schema with compatible: ['ti,musb-dm816']
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/usb_otg_hs@47401000/dma-controller@47402000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: wd_timer@480c2000 (ti,omap3-wdt): $nodename:0: 'wd_timer@480c2000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
--
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@e0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@110: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@140: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@170: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1a0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@1d0: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@200: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@230: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@260: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@290: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
>> arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: wdt@1c7000 (ti,omap3-wdt): $nodename:0: 'wdt@1c7000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/mmc@47810000: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/target-module@49b00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: l4hs@4a000000 (ti,dm814-l4hs): $nodename:0: 'l4hs@4a000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4hs@4a000000: failed to match any schema with compatible: ['ti,dm814-l4hs', 'simple-bus']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: scm_conf@0 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@10000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@10000 (simple-pm-bus): $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@20000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@20000 (simple-pm-bus): $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@30000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: m25p16@0 (st,m25p16): $nodename:0: 'm25p16@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: m25p16@0 (st,m25p16): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@c0000', 'partition@e0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-b3.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-b3.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6192-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/i2c@11000/rtc@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-c200-v1.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-cloudbox.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): pmx-sdio-gpios: {'marvell,pins': ['mpp37', 'mpp38'], 'marvell,function': ['gpio']} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6281.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts: [[10], [45]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: pin-controller@10000 (marvell,88f6282-pinctrl): pmx-sdio-gpios: {'marvell,pins': ['mpp37', 'mpp38'], 'marvell,function': ['gpio']} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-db-88f6282.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns320.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-dns325.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: /ocp@f1000000/mdio-bus@72004/ethernet-phy@0: failed to match any schema with compatible: ['marvell,88e1116']
   arch/arm/boot/dts/marvell/kirkwood-dockstar.dtb: ethernet-phy@0 (marvell,88e1116): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1116'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1116' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: m25p40@0 (mxicy,mx25l1606e): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: m25p40@0 (mxicy,mx25l1606e): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@100000', 'partition@180000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-dreamplug.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds109.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds111.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds112.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds209.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds210.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds212j.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds409slim.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411j.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ds411slim.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-goflexnet.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ib62x0.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-iconnect.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-is2.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,98dx4122-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,98dx4122-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@20 (semtech,sx1505q): $nodename:0: 'gpio-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@21 (semtech,sx1505q): $nodename:0: 'gpio-expander@21' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/i2c@11000/rtc@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: switch@10 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: switch@11 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6192-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-laplug.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: m25p40@0 (st,m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: m25p40@0 (st,m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: m25p40@0 (st,m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: m25p40@0 (st,m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: m25p40@0 (st,m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: m25p40@0 (st,m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: m25p40@0 (st,m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: m25p40@0 (st,m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: m25p40@0 (st,m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: m25p40@0 (st,m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts:0:0: 10 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts: [[10], [45]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: switch@10 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: m25p40@0 (m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: m25p40@0 (m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-lschlv2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: m25p40@0 (m25p40): $nodename:0: 'm25p40@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: m25p40@0 (m25p40): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@60000', 'partition@70000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-lsxhl.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-mplcec4.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: flash@0 (mxicy,mx25l12805d): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-nas2big.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-net2big.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-net5big.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: ocp@f1000000 (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: rs5c372a@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372a@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: ocp@f1000000 (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: rs5c372a@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372a@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2lite.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: flash@0 (mxicy,mx25l4005a): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310a.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/i2c@11000/rtc@68: failed to match any schema with compatible: ['htk,ht1382']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa310s.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: pcf8563@51 (nxp,pcf8563): $nodename:0: 'pcf8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa320.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: pcf8563@51 (nxp,pcf8563): $nodename:0: 'pcf8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-nsa325.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts:0:0: 10 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts: [[10], [45]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts:0:0: 10 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts: [[10], [45]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: cs42l51@4a (cirrus,cs42l51): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l51.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6192-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6192-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: m25p128@0 (st,m25p128): $nodename:0: 'm25p128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: m25p128@0 (st,m25p128): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs212.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs409.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rs5c372@32 (ricoh,rs5c372a): $nodename:0: 'rs5c372@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: flash@0 (st,m25p80): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts:0:0: 10 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts: [[10], [45]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
--
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: m25p128@0 (m25p128): $nodename:0: 'm25p128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: m25p128@0 (m25p128): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@200000', 'partition@40000', 'partition@400000', 'partition@c0000', 'partition@d00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/i2c@11000/s35390a@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: m25p128@0 (m25p128): $nodename:0: 'm25p128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: m25p128@0 (m25p128): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mode', 'partition@0', 'partition@200000', 'partition@40000', 'partition@400000', 'partition@c0000', 'partition@d00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/i2c@11000/s35390a@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
>> arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: watchdog-timer@20300 (marvell,orion-wdt): $nodename:0: 'watchdog-timer@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
--
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-nand']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-cs0:ranges: [[0, 18743296, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: flash@0 (jedec-flash): partitions: Unevaluated properties are not allowed ('uboot_env@3F000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: flash@0 (jedec-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: soc (marvell,orion5x-88f5182-mbus): sa-sram: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-lswsgl.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: soc (marvell,orion5x-88f5182-mbus): devbus-bootcs:ranges: [[0, 17760256, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dtb: sa-sram (mmio-sram): 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: soc (marvell,orion5x-88f5181-mbus): devbus-cs2:ranges: [[0, 18546688, 0, 4294967295]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5181-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5181-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: pinctrl@10000 (marvell,88f5181-pinctrl): pmx-pci-gpios: {'marvell,pins': ['mpp4'], 'marvell,function': ['gpio'], 'phandle': 13} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: soc (marvell,orion5x-88f5182-mbus): sa-sram: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc: failed to match any schema with compatible: ['marvell,orion5x-88f5182-mbus', 'simple-bus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: wdt@20300 (marvell,orion-wdt): $nodename:0: 'wdt@20300' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5182-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dtb: pinctrl@10000 (marvell,88f5182-pinctrl): pmx-misc-gpios: {'marvell,pins': ['mpp4', 'mpp5'], 'marvell,function': ['gpio'], 'phandle': 11} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
