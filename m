Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6D1FF1B5
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759008306; cv=none; b=CayKDRANUDuaMMXVScvHnwnCL8nxjbxuzk6ROxdxaiF5uwn2Uj+EnWRnf4pKDUBm0IsmKABdB7+rSubLyju/QqRsUat8NHHPhm3UQS+0wHCqX03zx5N9v3pp+anVYcqOc0bWoTY+0lzxQU3uFh33TTP84BsXIcZVApLxATOLymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759008306; c=relaxed/simple;
	bh=T2FZ6wj8xLEnrXOo2rVeNKFn4YN/WagQRJ6MI7hm5IE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qA1Wx38o+Mgx6M8mlkp4Hfv+0Tl3XL+n/3T5HHaI5f79+4S9kkfnDsg9Yltc7VwbIy94wqNMp1Sw1m5Y6wtb5IQo8o+i23S/E/EKtkakNegtdAb7RuOUkOa8slEJiJb/uHJ3m7VydJcNlG7LCcXUC4SPlP7WyuJbnzRqBW5HX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZmFKbll; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZmFKbll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759008304; x=1790544304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2FZ6wj8xLEnrXOo2rVeNKFn4YN/WagQRJ6MI7hm5IE=;
  b=fZmFKbll54SztrSaszMj8xkqxjRdKQgxlPREO6ZR9/DYUXQ6XVNtkzwD
   HYjiZdTY7WuPc9DdqaCvqq/OlfZxYqq3OwsSZAf+3KEiN77mKrq8nSmj1
   rzRJF/foEt0WeOYNUbCJMnXi/9FbYTwAdhhRRSZW81rwJfXTNZAgD7cW0
   Bj/lH5aHj2RG4amezjH3zSzNChjdBl2LaEPHgIYb9F57itm4xz44uhixr
   DYGpKahX5SD7lGG5QP5f1DoRb4GXS5V2c48mHPABFzDE7twqkuCD4mbAj
   D1brMWvZFOaJ8VDcbDOorG4y8bm0o9s9yPpSXDrY+SMM5qsAhy41ZNXAM
   Q==;
X-CSE-ConnectionGUID: jKwjTlrJS5qGoib9PebteA==
X-CSE-MsgGUID: Hss+dEnuSWKFkDsUIYI7tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72736068"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="72736068"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 14:25:02 -0700
X-CSE-ConnectionGUID: BurpsICUStCjj9YFcLY6iw==
X-CSE-MsgGUID: A0oBSCj2TXOcnMhYKf5ftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="183065722"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2025 14:25:01 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2cPa-000000005YX-0GEL;
	Sat, 27 Sep 2025 21:24:58 +0000
Date: Sat, 27 Sep 2025 23:24:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] ARM: tegra: add device-tree for Xiaomi Mi Pad
 (A0101)
Message-ID: <202509272322.vfMIVVK3-lkp@intel.com>
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
In-Reply-To: <20250914135753.94277-2-clamor95@gmail.com>
References: <20250914135753.94277-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Ion Agorria <ion@agorria.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250912]
[also build test WARNING on linus/master v6.17-rc7]
[cannot apply to robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next v6.17-rc5 v6.17-rc4 v6.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ARM-tegra-add-device-tree-for-Xiaomi-Mi-Pad-A0101/20250914-220003
base:   next-20250912
patch link:    https://lore.kernel.org/r/20250914135753.94277-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/1] ARM: tegra: add device-tree for Xiaomi Mi Pad (A0101)
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-2052-20250926 (https://download.01.org/0day-ci/archive/20250927/202509272322.vfMIVVK3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2d6ce5148cf144ab800116e1f75a5d007e82cf58)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272322.vfMIVVK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509272322.vfMIVVK3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts:1256.33-1259.6: Warning (unit_address_vs_reg): /i2c@7000d000/pmic@58/palmas-clk32k@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra124.dtsi:196.22-210.5: Warning (avoid_unnecessary_addr_size): /host1x@50000000/dsi@54400000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dsi@54300000 (nvidia,tegra124-dsi): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /host1x@50000000/dsi@54300000/panel@0: failed to match any schema with compatible: ['sharp,lq079l1sx01']
   arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dsi@54400000 (nvidia,tegra124-dsi): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: fuel-gauge@55 (ti,bq27520g4): 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/bq27xxx.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: charger@6b (ti,bq24192): 'ce-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/bq24190.yaml#
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
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dtb: led-controller (pwm-leds): 'led-button' does not match any of the regexes: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
