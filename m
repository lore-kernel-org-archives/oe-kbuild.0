Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286136D506
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 06:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372802; cv=none; b=ApB4pTrUvIfPP9jlCs1Y+9PhVnHHzKVcp4m8Hs11WoJCje2NWKpHrTIj8L2WIWsUihFJkZQqpd2o4YIWQXtN+u5gtSU4zWgeaQsPT9DIsM+yLT4G6V8W+Fky1UWMiAqupe02tzvYnZ4bDl7H2NCcMbABHoGxEcZ4Jrx/1zSP3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372802; c=relaxed/simple;
	bh=tl9V7Ay1z0CG8adSyiznGRy7yOBTaIYAKE8VX4L4qqg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n0+5qKODNuh/nz9/arH1rddPiNjDcE0fHNOhZMqXSTOgs7CHQ0rfc8SZeqU1i8tUg+ZdpfMmR5eAf3XlexgywafA9a+gxCwdE0dnODBHHbgE7t0UOfj56+0GluR4yEKyKnKLQA6UabyOkUIt/i40+VozHSLgBtlPv/ojZHm8X0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uz07MVMh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uz07MVMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768372799; x=1799908799;
  h=date:from:to:cc:subject:message-id;
  bh=tl9V7Ay1z0CG8adSyiznGRy7yOBTaIYAKE8VX4L4qqg=;
  b=Uz07MVMhvdKo5Payj/6yzDb+mI7AGvcmtv4oK+UXLlqCHKlN8YDi5dvj
   hkx/4QJg5V5RNM6cYrfaHp8NzqTZoaVl8Yd8+RQSWeuTk96mZk4tlfr4P
   Yabl/tbJiBFw4Q9a9por2GbF2oZfCpWh+LJV8bImkUA8AO3M/QQB0f2WY
   DG4J23N6iwTiNwZ9NvvUYRzKvbuTDfF6eBxUdjYyKUlaNAhhSdDE0e7uZ
   CwOlyo0yNeqOKwRu4NDqWsSQH/NqT8T8k4oGHJKiig+pzLaJZH2kmWCXI
   dHDL10OQtEj0san91vtAozhWcseS51kBmUfjxPTld3E91edsnte5ljVWD
   Q==;
X-CSE-ConnectionGUID: 3i6GfE6WTXa6jH8agbPy/Q==
X-CSE-MsgGUID: EmSHeLGlS7aRKumrf4nxWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87080543"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="87080543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:39:56 -0800
X-CSE-ConnectionGUID: 4TShrGECTEe6DzJi9oQoAQ==
X-CSE-MsgGUID: D7Gg7KirT6K/9dzzOymCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205015974"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 22:39:55 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuXo-000000001Ld-2dhK;
	Wed, 14 Jan 2026 06:39:52 +0000
Date: Wed, 14 Jan 2026 07:39:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:tegra/dt-2 4/4]
 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /pcie@1003000: failed to
 match any schema with compatible: ['nvidia,tegra124-pcie']
Message-ID: <202601140755.KtrflTmX-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tegra/dt-2
head:   f224e936dad0933a1baa3b7152f48918cdd98498
commit: f224e936dad0933a1baa3b7152f48918cdd98498 [4/4] ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)
:::::: branch date: 9 weeks ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-2051-20260107 (https://download.01.org/0day-ci/archive/20260114/202601140755.KtrflTmX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140755.KtrflTmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140755.KtrflTmX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts:1256.33-1259.6: Warning (unit_address_vs_reg): /i2c@7000d000/pmic@58/palmas-clk32k@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra124.dtsi:235.22-249.5: Warning (avoid_unnecessary_addr_size): /host1x@50000000/dsi@54400000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1172.15-1182.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /host1x@50000000/isp@54600000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /host1x@50000000/isp@54680000: failed to match any schema with compatible: ['nvidia,tegra124-isp']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dsi@54300000 (nvidia,tegra124-dsi): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /host1x@50000000/dsi@54300000/panel@0: failed to match any schema with compatible: ['sharp,lq079l1sx01']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dsi@54400000 (nvidia,tegra124-dsi): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /host1x@50000000/msenc@544c0000: failed to match any schema with compatible: ['nvidia,tegra124-msenc']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra124-tsec']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/palmas-clk32k@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: led-controller (pwm-leds): 'led-button' does not match any of the regexes: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
