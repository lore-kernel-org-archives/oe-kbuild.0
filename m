Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE173EF65E
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 19:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921611; cv=none; b=uwWSGWqqSR9/T9bcoGgj594bE/cPwH0Etd2B0jPHLV5vnY6IraHjmlvF9QIMVBCtoaWi3P97tW62P3ZkAEbWu/VJ2FrgYen01J4WexGQWMhHk7PRpOWnTBBAkFFQJ15DRonXYonGE4pgVOGDrA3AtNvP2r0unDiUrgZ6Awjxh+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921611; c=relaxed/simple;
	bh=UKWpxZDThpvrqX8f9CztdJgtqK6P7+hT9+1bOKXsjd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PDNsuhAF6l2725mrrPnD6Jf/q5V4rxHt6+MuEgCJatSFALXIiCrEgeNZawv9Nc1CBuH+be7fO2sF5YUXOSgZdcAMjlFUOG1tzbm3cf+l6bfVx2SMrO5SKJmJHJMaD8vNc1k4ehPwYJuv1vqcsNiJBScQu+c+UQgluhtL3we9zPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2JMZ3uN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2JMZ3uN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777921609; x=1809457609;
  h=date:from:to:cc:subject:message-id;
  bh=UKWpxZDThpvrqX8f9CztdJgtqK6P7+hT9+1bOKXsjd0=;
  b=Y2JMZ3uNSU2miLemq8FITvIii3owYo1gHtPS2gGP0auORlI6gTA1NIrq
   L3nFkbjNlaVCVPU9fO8EgYN3rx2mMn7yxpv9row2iKhlJbIP9Lznch+3e
   i+SMCN/BvP9z36ORr8h+mkwyuGU0nliXTD9/HEpL0rRuAAjpYeFMoxX2i
   VHqecXGhIsgZDHSzgXMPK8y5/r3wKRsrn17Q27PYJZtHGGgILYD4C8W0R
   6RfU3yCZy0zqqSVrhbSPtmPEhMyWgJKnEQmuegy1bnG88Q6x7jcngu7sC
   xymKIser+oDmv2+WWVk+sp1UMg4bdY2hazuFZG2mUiGlnZo4pHfu87yjH
   g==;
X-CSE-ConnectionGUID: epeZireBT8WgUbtIUmICHQ==
X-CSE-MsgGUID: p1PmpzDbSPuB1krpjVfhvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78686966"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78686966"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 12:06:47 -0700
X-CSE-ConnectionGUID: ewQhOe3zRCqXfmY3h4SJug==
X-CSE-MsgGUID: NGiKCpJPS5C0MvkzyXpfpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235651851"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2026 12:06:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJycp-000000005vF-3T32;
	Mon, 04 May 2026 19:06:39 +0000
Date: Mon, 04 May 2026 21:06:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: disp1
 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605042158.bF8kA7Dg-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f377d0025eb00c0590466f5be9f50decf9b9180e
commit: b252d1b00e283de06b35a13115d7e4bb9c5381ff dt-bindings: display: imx: convert fsl-imx-drm.txt to yaml format
date:   1 year ago
:::::: branch date: 27 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-2053-20260429 (https://download.01.org/0day-ci/archive/20260504/202605042158.bF8kA7Dg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042158.bF8kA7Dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b252d1b00e28 ("dt-bindings: display: imx: convert fsl-imx-drm.txt to yaml format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605042158.bF8kA7Dg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: /soc/bus@70000000/bridge@73f00000: failed to match any schema with compatible: ['fsl,imx51-aipstz']
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: /soc/bus@80000000/bridge@83f00000: failed to match any schema with compatible: ['fsl,imx51-aipstz']
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: efuse@83f98000 (fsl,imx51-iim): compatible: ['fsl,imx51-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: /soc/bus@80000000/tigerp@83fa0000: failed to match any schema with compatible: ['fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: owire@83fa4000 (fsl,imx51-owire): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/w1/fsl-imx-owire.yaml
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: /soc/bus@80000000/m4if@83fd8000: failed to match any schema with compatible: ['fsl,imx51-m4if']
   arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: /soc/bus@80000000/nand@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
>> arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
--
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: /soc/bus@70000000/bridge@73f00000: failed to match any schema with compatible: ['fsl,imx51-aipstz']
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: /soc/bus@80000000/bridge@83f00000: failed to match any schema with compatible: ['fsl,imx51-aipstz']
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: efuse@83f98000 (fsl,imx51-iim): compatible: ['fsl,imx51-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: /soc/bus@80000000/tigerp@83fa0000: failed to match any schema with compatible: ['fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: owire@83fa4000 (fsl,imx51-owire): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/w1/fsl-imx-owire.yaml
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: /soc/bus@80000000/m4if@83fd8000: failed to match any schema with compatible: ['fsl,imx51-m4if']
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: /soc/bus@80000000/nand@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
>> arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: disp2 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
   arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: dvi-encoder (ti,tfp410): 'ti,deskew' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410.yaml
--
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: memory-controller@83fda000 (fsl,imx51-weim): 'fpga@0' does not match any of the regexes: '^.*@[0-7],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yaml
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: fpga@0 (simple-bus): $nodename:0: 'fpga@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: syscon@10000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/memory-controller@83fda000/fpga@0/syscon@10000/wdt: failed to match any schema with compatible: ['technologic,ts4800-wdt']
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/memory-controller@83fda000/fpga@0/touchscreen@12000: failed to match any schema with compatible: ['technologic,ts4800-ts']
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/memory-controller@83fda000/fpga@0/fpga-irqc@15000: failed to match any schema with compatible: ['technologic,ts4800-irqc']
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/nand@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
>> arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
--
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@50000000/iomuxc-gpr@53fa8000: failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@50000000/ldb@53fa8008: failed to match any schema with compatible: ['fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@60000000/bridge@63f00000: failed to match any schema with compatible: ['fsl,imx53-aipstz']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: efuse@63f98000 (fsl,imx53-iim): compatible: ['fsl,imx53-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@60000000/nand@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
>> arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
--
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@50000000/iomuxc-gpr@53fa8000: failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@50000000/ldb@53fa8008: failed to match any schema with compatible: ['fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@60000000/bridge@63f00000: failed to match any schema with compatible: ['fsl,imx53-aipstz']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: efuse@63f98000 (fsl,imx53-iim): compatible: ['fsl,imx53-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@60000000/i2c@63fc4000/mc34708@8: failed to match any schema with compatible: ['fsl,mc34708']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@60000000/nand@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
>> arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: disp1 (fsl,imx-parallel-display): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
--
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/ldb@53fa8008: failed to match any schema with compatible: ['fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/i2c@53fec000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/i2c@53fec000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/bridge@63f00000: failed to match any schema with compatible: ['fsl,imx53-aipstz']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: efuse@63f98000 (fsl,imx53-iim): compatible: ['fsl,imx53-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/nand@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
>> arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: disp0 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: /soc/bus@2100000/i2c@21a8000/rtc@68: failed to match any schema with compatible: ['dallas,m41t00']
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dtb: disp0 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: /soc/bus@2100000/i2c@21a8000/rtc@68: failed to match any schema with compatible: ['dallas,m41t00']
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dtb: disp0 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
