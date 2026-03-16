Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2661A23A4
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 05:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773638564; cv=none; b=WNXa/L7VdKid6TeOXSkthnbIcXgrsJDR8N95WjkfJ1e/8ItQlmcUYJ5l076eWBjWEbmoD9OHpHC3v9i1oWX808XlgCpAAfCYXrA9twkZYQZe/0b3qpMLh5mtozv2DP84PcQO9JVveqlfRzh0qjAUCzhofmoHoXQt1IxKhF0ELlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773638564; c=relaxed/simple;
	bh=uM0XN8mjoIaWAnmXlA7SeTPfcK2f5EpfMEOPgNctuM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoZlD6/hBP/HzFdtJU4uVPC2U/vOnUR30ZwmU7m9daQRpZrLPdqvu6CSnxhrU8khHLn7NaIDX+uc9EYU/Wy/Iv0r6fa1lxIXUc8QH+MwJh1Ufqqk3baqCHqe+mmhMCSUCLG21PBG0NRARY8I5SengARt1CdTkZkMvyOXhhuD94w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPVMYbdV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPVMYbdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773638563; x=1805174563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uM0XN8mjoIaWAnmXlA7SeTPfcK2f5EpfMEOPgNctuM0=;
  b=iPVMYbdVrw3HLgatUdPKaEoT6TJ7uGZWSQ2HJDUzPn/IMRecEgcjVhaD
   rpZLEEPBlu+gBmEG0WUKqmdJBtWa7zdTjjjc3zVQaDJPotMJE53vw4J34
   x7hcCLpmXyy8d0XxrRR0h5oLk41f1+3ZB0Xh0LvIAx8t1G29VFJMODbP/
   QIuAO2MXbkiHnZQT27XfAeXwhBOj1cAPTZnPyhc/ZgDBOQzbKDAd+/0AN
   pT1o+57I4DnNdiBvF2fJMfP/66nsI8dL6PHU2YjUvS4l7bgPDmLiKuJY/
   y8IptPAUPPwwknMRIs+Gel9mvILoJLzqvJlgXQhJctG+Vmeq3OCav2bpf
   A==;
X-CSE-ConnectionGUID: 2hdtqzPGSo2lCO2twF3DaA==
X-CSE-MsgGUID: 5lEeSK1eRSyhcA4IKN6Y/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="86124741"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="86124741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 22:22:43 -0700
X-CSE-ConnectionGUID: 3R/hDT3qTEC9hvwGL56Ylg==
X-CSE-MsgGUID: PfPWVflNRVezoYovChVxKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="259699252"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2026 22:22:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w20PW-0000000049x-3IeC;
	Mon, 16 Mar 2026 05:22:38 +0000
Date: Mon, 16 Mar 2026 06:22:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/5] dt-bindings: mfd: max77620: convert to DT schema
Message-ID: <202603160659.9jlCaVH2-lkp@intel.com>
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
In-Reply-To: <20260312085258.11431-4-clamor95@gmail.com>
References: <20260312085258.11431-4-clamor95@gmail.com>
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

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-regulator/for-next brgl/gpio/for-next abelloni/rtc-next robh/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc3 next-20260313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/regulator-dt-bindings-regulator-max77620-convert-to-DT-schema/20260312-171749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260312085258.11431-4-clamor95%40gmail.com
patch subject: [PATCH v4 3/5] dt-bindings: mfd: max77620: convert to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2051-20260313 (https://download.01.org/0day-ci/archive/20260316/202603160659.9jlCaVH2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603160659.9jlCaVH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603160659.9jlCaVH2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): 'cpu-pwr-req-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators: 'in-sd4-supply' does not match any of the regexes: '^(sd[0-3]|ldo[0-8])$', '^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: pmic@3c (maxim,max77663): 'cpu-pwr-req-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: pmic@3c (maxim,max77663): regulators: 'in-sd4-supply' does not match any of the regexes: '^(sd[0-3]|ldo[0-8])$', '^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
--
   arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:52.22-58.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: coil@c (dongwoon,dw9714): 'enable-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: max77663@1c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: max77663@1c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: sound (lg,tegra-audio-max98089-p880): nvidia,audio-routing:13: 'Mic Jack' is not one of ['Int Spk', 'Headphone Jack', 'Earpiece', 'Headset Mic', 'Internal Mic 1', 'Internal Mic 2', 'HPL', 'HPR', 'SPKL', 'SPKR', 'RECL', 'RECR', 'INA1', 'INA2', 'INB1', 'INB2', 'MIC1', 'MIC2', 'MICBIAS']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml
--
   arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:52.22-58.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: coil@c (dongwoon,dw9714): 'enable-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: gpio-leds (gpio-leds): led-power:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'battery-charging' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'battery-charging' does not match '^cpu[0-9]*$'
   	'battery-charging' does not match '^hci[0-9]+-power$'
   	'battery-charging' does not match '^mmc[0-9]+$'
   	'battery-charging' does not match '^phy[0-9]+tx$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
