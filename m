Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB70625
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 01:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772934859; cv=none; b=Jq/o8qfGkhlsHxgwmBICghi9DO2LqYMpHKHHl4gzI2VdYicG86hXWntX8XtVTWCQIn0EjghCG57dJvpyM3KRC97J984LL+fJHzsZ1vnUriCakp/G9gYvnT+L2/2Qyx0Hu8OKB9vcBdr7FrN5zObulzrRizVALDW65OIhjvSsxgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772934859; c=relaxed/simple;
	bh=mfZpxEmFuw9Cp1kb+Y7S0ljoAGQuK1ufucY/RHwT4WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSnPHCcSAnN4NqT9yOmIX9nmRccYk2jtfkf+nvHDQRVcVLeN93a78aO2XjjvJug1A4/HYIx1NXeZqIOPM1NfsGukx7m8pN+7izjIKL+mnbwJvsoUDJp+v0HuVwAzNxxsAbNyiKvJNFW/ysWck4HVfKzlBcHDLnUD6yhP/iZlv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jS85mL7E; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jS85mL7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772934858; x=1804470858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mfZpxEmFuw9Cp1kb+Y7S0ljoAGQuK1ufucY/RHwT4WM=;
  b=jS85mL7ER+8A7hDAis8t6vMbDfMSYQuAvxqkSyhy86lShWz+QGbuko2a
   78koe4IPvXM2/g7zN2rADqWC79L0ydLOo2eaWp97AlGuanhoiCZGhi/PB
   f94MSkowgzXgcoSWIjArTdhQS6LUWJfOGbHJ2WUfGvB0TesCI0/JRGoXl
   JLcZn512wUQdps/8+enxndlxTd07xHrXD2q1pYvDbiaQHg9onahR+qpTA
   zc8FY0PpcGNna9TgJI4mRi/7FfHY2D2oriuoONVJkN1vhPKPbt7FNI+K2
   2PE9t3OUzhmdWm3kRNgFbGvEZSt3/Q7aVA/GgSlzi50r0vGCLajbX9S6k
   g==;
X-CSE-ConnectionGUID: RXDYzkybSvm/mgbZJoMvLg==
X-CSE-MsgGUID: xb4GMz4ySDirbTyvXOhMVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73196461"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="73196461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 17:54:17 -0800
X-CSE-ConnectionGUID: 32hO/72QQJGVvMRcI8jVyg==
X-CSE-MsgGUID: PcZWXX8hQKChdy8D7PGXeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="249860081"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2026 17:54:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz3LR-000000002c1-2EsI;
	Sun, 08 Mar 2026 01:54:13 +0000
Date: Sun, 8 Mar 2026 02:54:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] dt-bindings: mfd: max77620: convert to DT schema
Message-ID: <202603080207.KhWjxw6R-lkp@intel.com>
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
In-Reply-To: <20260306133351.31589-5-clamor95@gmail.com>
References: <20260306133351.31589-5-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@kernel.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-rtc@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next brgl/gpio/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/regulator-dt-binding-regulator-max77620-convert-to-DT-schema/20260306-223101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20260306133351.31589-5-clamor95%40gmail.com
patch subject: [PATCH v3 4/6] dt-bindings: mfd: max77620: convert to DT schema
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2051-20260306 (https://download.01.org/0day-ci/archive/20260308/202603080207.KhWjxw6R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080207.KhWjxw6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603080207.KhWjxw6R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): regulators:ldo4: Unevaluated properties are not allowed ('regulator-disable-active-discharge' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
--
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): regulators:ldo4: Unevaluated properties are not allowed ('regulator-disable-active-discharge' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
--
   	'toradex,apalis-tk1-v1.2' was expected
   	'google,nyan-blaze-rev8' was expected
   	'google,nyan-big-rev8' was expected
   	'google,nyan-big-rev5' was expected
   	'nvidia,tegra264' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): 'max77620-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): fps: '#address-cells', '#size-cells' do not match any of the regexes: '^fps[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): fps:fps0: 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): fps:fps1: 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): fps:fps2: 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
--
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvidia,tegra194-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvidia,tegra194-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: pmic@3c (maxim,max20024): regulators: 'in-sd4-supply', 'sd4' do not match any of the regexes: '^(sd[0-3]|ldo[0-8])$', '^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: pmic@3c (maxim,max20024): regulators: 'in-sd4-supply', 'sd4' do not match any of the regexes: '^(sd[0-3]|ldo[0-8])$', '^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
