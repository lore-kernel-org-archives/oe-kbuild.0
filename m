Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECB40D595
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jun 2026 02:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782008085; cv=none; b=E51LVg21yzJ3cAh7A4UXzVyqOqML43t+JaxapvbtWHKL+s2uuEV02rIDI6AZcSLF+IeQxuMIrbp5S5yf1sf4RERgq5KE0Y3wtmnPFNo6RWWZBqWplfnU9+xv+G3kqxl86ojgO85ejV5QA3xMQBwjs8l6gET0EAhZu6NNc5HcRZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782008085; c=relaxed/simple;
	bh=1ZoVwQ9woV0OaxhFzB7thIXqDG42SEsTJ/+4bM9EFOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wx6ZH10lCZNmDxKlgDz1B7cVhCYGl9pWXgtXdwcvSicOJyfaq4f73kSrtA2UTav0R+8kcUto6wcw2u8Kp7FuiSOyEKA0vgNkqdSpiFQmBUiYLcqBVkgHY9odCm/iW8Fb9UzqtnVDza4rK8OEyRVWI91X51o2ZdZt8P/jfcQwSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbuJbK4y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbuJbK4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782008082; x=1813544082;
  h=date:from:to:cc:subject:message-id;
  bh=1ZoVwQ9woV0OaxhFzB7thIXqDG42SEsTJ/+4bM9EFOg=;
  b=FbuJbK4y07J+WUn94ArCYQaGxJZR1PB/m8rYA4anjTNTAXpk+8rn5cKT
   UJebLx1hnuDnOIwL+ahwH90DKx7SeUrdeme8GfY0RCDDieShlF0yK4+RR
   suLb0pZ/tFXd8RQbPEDPqK01y0KfWzqifZ10ZHqunMcFFDe7rpquqkVQj
   wzQ4tw1eCVwT6nsBAOpSOdfdi1hIPGjoJyIL8+nC/rEGsfIRAvXuqA/+W
   83hz9R6tI1w+HZglRGH04N9XpSn8oAhcC+ns5iGwP+N3GBno2Gao12HYl
   DsRhd+p5Dj/hUt3qbt462BkqXRfjpOHFKWDC6S79eu2dQgZ3LhsMk1zBA
   A==;
X-CSE-ConnectionGUID: flxTJqzwTYu92dtZkH//VQ==
X-CSE-MsgGUID: gX6Dm6b4SEGF1EF1xyNluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="108330798"
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="108330798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2026 19:14:41 -0700
X-CSE-ConnectionGUID: sgwlNM0+SxKkYK/u7zrWlg==
X-CSE-MsgGUID: OA2xt51pR4Ci97i+pEKvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="242545160"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2026 19:14:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wb7hl-000000005pF-3Bbz;
	Sun, 21 Jun 2026 02:14:37 +0000
Date: Sun, 21 Jun 2026 04:14:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: wdt@0
 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202606210417.OxxCANgk-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: arm-randconfig-2052-20260617 (https://download.01.org/0day-ci/archive/20260621/202606210417.OxxCANgk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260621/202606210417.OxxCANgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 017bca91639f ("dt-bindings: watchdog: Allow node names named 'pmic'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606210417.OxxCANgk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
