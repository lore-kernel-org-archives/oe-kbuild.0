Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E9B3C1D54
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786275625; cv=none; b=TBd/16J1HiP0UFoNQ3D5z6xYEXuwRr48mYLEXm3S/+QZ9XzWwQRrSutuClLEqtyiYFnFjsL5qm2ZZQxngcvUd8CKW8kJ1usfKNSyd8Qaxa22hBYCSFlhgGe0oIk5aIqdhHZN595EkitbS28HNXsgijIrRBVIN1armhNHvYeuDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786275625; c=relaxed/simple;
	bh=A+OIsd0TvuNRZE4Bc7j0RQX7+kuMZYj6GAYkroUeak0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q+TWN4JA9uXgmcaHdAQhw2UI16YgubK7fL8nTYLaZbJPwxL0pfJesXY6sxTrW4pIrq7iOm8jNVAiAggLNd5Qw4Ri0IFmAHLOGsm7DSPc11GoIfY51GkaWtAlw5qT4zNOSBc0dXCsurP8C94SCkJ1HEIrv+jK1XhRQRRcsQfOft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OV0N6DUP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV0N6DUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786275622; x=1817811622;
  h=date:from:to:cc:subject:message-id;
  bh=A+OIsd0TvuNRZE4Bc7j0RQX7+kuMZYj6GAYkroUeak0=;
  b=OV0N6DUPG3ZSuoxZ5CPLXuEHdK/lx4UwmPwK05Srh36nGsUBnscqEJFC
   GxHMBUBWFh9dz//jLH+PtAWFzFbEa1ZcyIqDTOhIGi6kGqprNlblLRBAl
   E88MxOG8W6MtSKbSH2v30QBkn7xO4lNhSwUCHpcrpjMzOXJJRkoz4qjXM
   mfgpcmcg+KhPdWsaCR3FGnErq1QU/26vR4rhBe5JLVY1dtY2+RBNQpOe0
   ROvZ0lku5MTuYEvNcw1RZd8kR3A032hxuUoBdZxMiyhrO84qniXsCTcmT
   ymtnqz1ne1KSRahwjH//ZezNXS2DsvVHOsOcribnotYIZyvORjHMdRD4L
   Q==;
X-CSE-ConnectionGUID: uRl2yDhNRlKX+1vLYYMv6g==
X-CSE-MsgGUID: goNoAa2dR1SA8V8HrfZiyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="74349347"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="74349347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 04:40:20 -0700
X-CSE-ConnectionGUID: CAZMZGeWQZGBzzvQzFJM6Q==
X-CSE-MsgGUID: 6vsZYFKkStObSaY3aJ2Hpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="261056520"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 04:40:19 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt1t3-000000005GM-0dHm;
	Sun, 09 Aug 2026 11:40:17 +0000
Date: Sun, 09 Aug 2026 13:39:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb:
 /pcie@1003000: failed to match any schema with compatible:
 ['nvidia,tegra124-pcie']
Message-ID: <202608091317.XSHSJonB-lkp@intel.com>
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
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a59f57e2aa127c5354168d2ec4bac920df1be4f4
commit: f224e936dad0933a1baa3b7152f48918cdd98498 ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)
date:   9 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-2051-20260805 (https://download.01.org/0day-ci/archive/20260809/202608091317.XSHSJonB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091317.XSHSJonB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f224e936dad0 ("ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608091317.XSHSJonB-lkp@intel.com/

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
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
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
