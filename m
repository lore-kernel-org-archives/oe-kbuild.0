Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4DE2E975E
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 02:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790996011; cv=none; b=LOs+wuzYV9ASV79gJ5xCL4zWgB8WRbMIGHamgu1egnod58z5Ky90Ka4dJ+e2HCbQ48rb1rSB8ZvvUP4K4E2RzRDP/eAaDcpXOAq3W3B3BNfuc7iLcXW/KSvSEapSZjMc1PcrO2b8Hq/ADwmd+Pl+4Y1JtJ28DzGwSr81JD9t+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790996011; c=relaxed/simple;
	bh=MepYt+mlqfDFDJMvWWpU5+UinmaEtLfCCFZazTXcGN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cr1p0bhHze/kbSPsEQmR4AJOE+v/Vi4CGcnXRgAIBsmueP282HoqDbZtQdBPjAiWuripKwATS+osbwvXJIdJjGNiVBBEpi+0Zf0ayxb+Tv9+cJESGyUA5dU0/Ybhrg5uYIlYTW6pzi9GfLUkt2PNHZPJkG6dw6NilzFPxkfuFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krruDksn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krruDksn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790996009; x=1822532009;
  h=date:from:to:cc:subject:message-id;
  bh=MepYt+mlqfDFDJMvWWpU5+UinmaEtLfCCFZazTXcGN4=;
  b=krruDksnIjf8p2ExRjR/WFVu4hzAgeNfkdirwvFsAQjVUmyWaWl+aoU+
   m6jbsLjuNmmKkL/vnQM+Myzg18kNf61LR63fbmPPFluXYR05q/ABQWQhL
   RdNml4SWZzPSq8crLZ+kXgg235GTu2e5+DWsXiNlplC2HGLbeSQ/nfKCg
   mGwZ+FOzi4k7TyxpyPf0X1ce+GVw2RqOcMEkDnaVRlKeTx+CroBHM65IY
   yU++Wu5ad32uL4YkgNJkjU/pXEJ9xNaEJGDiuHYNzAb74pZZnrXUrgjTX
   OPhEf6grDd52Hs+IZVln7HD7xGxwEXqri9hz6zecJ7udZZfzJNJqPpLZi
   w==;
X-CSE-ConnectionGUID: +aieEz06TICnB3s7ON8t2g==
X-CSE-MsgGUID: I5E39tfxSRmTbKElMm54Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="103133942"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="103133942"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 19:53:29 -0700
X-CSE-ConnectionGUID: vOPgG+/rRt+x1yOtCkDi0Q==
X-CSE-MsgGUID: 8FaxW03RQ9igSCBSlPrxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275928704"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 19:53:27 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCpsL-000000000uJ-2O0N;
	Sat, 03 Oct 2026 02:53:25 +0000
Date: Sat, 03 Oct 2026 04:52:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-tegra:for-7.4/arm/dt 21/21]
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb:
 /i2c@7000c400/led-controller@36: failed to match any schema with compatible:
 ['ti,lm3533']
Message-ID: <202610030405.SYywwKcC-lkp@intel.com>
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
CC: linux-tegra@vger.kernel.org
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-7.4/arm/dt
head:   c79aff01aeda4885cf707c17eede8d19617b78f1
commit: c79aff01aeda4885cf707c17eede8d19617b78f1 [21/21] ARM: tegra: lg-x3: Add backlight LED controller node
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-2401-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030405.SYywwKcC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030405.SYywwKcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030405.SYywwKcC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: pci@3,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000c400/led-controller@36: failed to match any schema with compatible: ['ti,lm3533']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000c400/led-controller@36/backlight@0: failed to match any schema with compatible: ['ti,lm3533-backlight']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: max77663@1c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: max77663@1c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: thermal-sensor-battery (generic-adc-thermal): Unevaluated properties are not allowed ('#io-channel-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/generic-adc-thermal.yaml
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: pci@3,0: nvidia,num-lanes: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c400/led-controller@36: failed to match any schema with compatible: ['ti,lm3533']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c400/led-controller@36/backlight@0: failed to match any schema with compatible: ['ti,lm3533-backlight']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: gpio-leds (gpio-leds): led-power:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'battery-charging' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'gpio', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
