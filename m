Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B14402448
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461014; cv=none; b=YESiQj9shF2rYGDQ9ZU1zAPZ0kD+AQGRrei9OGGSTqj+iE4eEF8jIqUb1yuz3gjSYOy2kk65wyKgyG3fteg56xf/EivLj6VzF04tnjpMHHaOGza2fCvxxWc5+uWdDMiBNLsA6MGRN+nWq/jpEYmI0WVWcf0HIH9bDIwx37PW5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461014; c=relaxed/simple;
	bh=ywZcyHFWo5VfvvJEEWBvvyfuuP33YpKs3lQeOTFx/a8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j9yq6vx1+ISMnkI11YHJvOlLXLAZRIlFrMoLnSsstIyzhTJm6zAYFRs5HPCBKshJO/2PftHtmrWDQcX4371BpxGqdYg985K9RlRr3C4kS2qOzkq+rdF9U/xOsFk5+NlfGu89Ue9ZhlIBMfXvnJvdFxPBAs/7yc2f5VGYtjiQkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7v0Ue+t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7v0Ue+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779461012; x=1810997012;
  h=date:from:to:cc:subject:message-id;
  bh=ywZcyHFWo5VfvvJEEWBvvyfuuP33YpKs3lQeOTFx/a8=;
  b=c7v0Ue+txHg7Y1gDf2B1AiV2yuhkNNwZWtqeXQ3ndnwQuW6nasJXgEQq
   NtQbQWCQC6cIcf5b4GJ8g1dA/frhQAoDNX5Q9i8VBURAF2C2uGLU9bVKV
   oT6DMiQMjimYkCYjLPS0DqZCCf6IOb+h8AqssTGgcuBZhoeFcwBBfQIUU
   OM7OP4X+EIm0DYpqarYcFMoDM/WaBxetkj7PrMXas3zSZkDNKF7qFrjNP
   SLizBgrZUKtqg/1h0Im25iNrKCLU1A7P2xceP5cbIrC6O0pvop8uLFgmN
   y7/MLCqgD67uEOmN8arhHsQsnebe0lFaKyaCI6IDmG81CEubnDywMRU79
   w==;
X-CSE-ConnectionGUID: +ESDGFLITsyd5GOnm1n5zQ==
X-CSE-MsgGUID: lPhgiIw9QoGgFHU6kTzTlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="79540631"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="79540631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:43:31 -0700
X-CSE-ConnectionGUID: CfJDFlUDRzyJrx1fvNO1Uw==
X-CSE-MsgGUID: s/AyjTRiRle6LHmmgajS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240088454"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 May 2026 07:43:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQR5y-00000000BMn-3ntK;
	Fri, 22 May 2026 14:43:26 +0000
Date: Fri, 22 May 2026 16:42:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: wdt@f000
 (arm,sp805): $nodename:0: 'wdt@f000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202605221613.10T1NssD-lkp@intel.com>
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
head:   6779b50faa562e6cca1aa6a4649a4d764c6c7e28
commit: 017bca91639f01302382013033b685ec8759aba4 dt-bindings: watchdog: Allow node names named 'pmic'
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-2055-20260520 (https://download.01.org/0day-ci/archive/20260522/202605221613.10T1NssD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221613.10T1NssD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 017bca91639f ("dt-bindings: watchdog: Allow node names named 'pmic'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605221613.10T1NssD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000 (arm,vexpress,v2m-p1): iofpga@7,00000000:ranges: [[0, 7, 0, 131072]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: motherboard-bus@40000000 (arm,vexpress,v2m-p1): clock-1000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: iofpga@7,00000000 (simple-bus): $nodename:0: 'iofpga@7,00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: mmci@5000 (arm,pl180): $nodename:0: 'mmci@5000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: mmci@5000 (arm,pl180): Unevaluated properties are not allowed ('cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
>> arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: wdt@f000 (arm,sp805): $nodename:0: 'wdt@f000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: mcc (arm,vexpress,config-bus): 'clock-controller-0', 'clock-controller-1', 'clock-controller-2', 'regulator-vio' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: /memory-controller@100e0000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: dcc (arm,vexpress,config-bus): 'clock-controller-0', 'clock-controller-1', 'clock-controller-2', 'regulator-ddr2vtt', 'regulator-vcc1v8', 'regulator-vcc3v3', 'regulator-vd10', 'regulator-vd10-s2', 'regulator-vd10-s3' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb: hsb@e0000000 (simple-bus): $nodename:0: 'hsb@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: / (arm,vexpress,v2p-ca15,tc1): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: hdlcd@2b000000 (arm,hdlcd): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/arm,hdlcd.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: /memory-controller@2b0a0000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
>> arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: wdt@2b060000 (arm,sp805): $nodename:0: 'wdt@2b060000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   	arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   		'nvidia,tegra210-agic' was expected
   		'arm,cortex-a15-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic', 'nvidia,tegra264-agic']
   	'arm,gic-400' was expected
   	'arm,arm1176jzf-devchip-gic' was expected
   	'brcm,brahma-b15-gic' was expected
--
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: / (arm,vexpress,v2p-ca15_a7): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: wdt@2a490000 (arm,sp805): $nodename:0: 'wdt@2a490000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: hdlcd@2b000000 (arm,hdlcd): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/arm,hdlcd.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: /memory-controller@2b0a0000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   	arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   		'nvidia,tegra210-agic' was expected
   		'arm,cortex-a15-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic', 'nvidia,tegra264-agic']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
