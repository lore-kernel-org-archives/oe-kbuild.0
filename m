Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E658D370D6B
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778185724; cv=none; b=VRDb4qGMOrLBupRa8VT1VvAyy7/27JAwNEI8e8gqeS/99tbiV6thfxNBgVwjXE0AEVomQkfvdEDve18ZRf1va/w3S1ZMZ/v20Ee5vXRcBrLVGfyia87GSCMEak/6KNLojMkrzciVN5+V6xHf8llsq+KAu6+Vm82UL2yaaxA0o84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778185724; c=relaxed/simple;
	bh=1fUMm3YCuEda3s2crzoh3K3bFPevQNj2ExW2Q0PxdKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IgDiJZsm1Z1pc7vVtU0qg2pbEyWMemkPIG7IgFRnXx2SZPC5TS8fQ0WrfXaD7KcT0N23w1KDJMqjZgmDwVwZZbLBP0+IzevfoigwsuMQl51ahxukApCecR4Q8XV43lwxhaaEQ0xDY/KwvS8DwANC6hyxPP3H9OgQypVug7jDSLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7klD2F+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7klD2F+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778185723; x=1809721723;
  h=date:from:to:cc:subject:message-id;
  bh=1fUMm3YCuEda3s2crzoh3K3bFPevQNj2ExW2Q0PxdKA=;
  b=b7klD2F+4kExkbokt9IvnR+cmKCY1y21VoHoBJFld1nPZsVAQ6tovADC
   rqNygK7Tdnp3ZpvkFhSUF1GGkSULsaU7FDPOYI70wmGpfOhH4j+XP3S/n
   CxDhqTSoQ4k2A1ylzYjF8+GUw5oSesViDUu0p40F2uyCcjJ1IF+hza3Dg
   OcNVeMYXzoMmVyHlUjwy8aOUohvsfazvKoAkcl3+wXqHrFQwi1B3E707b
   BLSvvUiZtmpBJs00D9Lf9cVIuCAS2aWf3fYhmaJOi6S6WjD2tjuFrNI0C
   SM3/Xd3x4KIkmGfg3zNbSi8bQOJgLZP0/UKqBDKTXW5VrboknggvtzC6b
   w==;
X-CSE-ConnectionGUID: jsAXjKjSRoeSCqw9R883IQ==
X-CSE-MsgGUID: xsXUaul6QCmLpmzS1KsVSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="83020552"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="83020552"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:28:42 -0700
X-CSE-ConnectionGUID: 3lWySyzpToiqW1linj+qAA==
X-CSE-MsgGUID: 70UURDjBTReqz9245S35dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="235578859"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2026 13:28:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL5Kp-000000006wL-2aak;
	Thu, 07 May 2026 20:28:39 +0000
Date: Thu, 07 May 2026 22:28:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/marvell/armada-370-mirabox.dtb:
 timer@20300 (marvell,armada-370-timer): 'clock-frequency' does not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605072235.ppdHJcTR-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 4334d83904fc8b1a4bd5c0829164511456feb600 dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2055-20260429 (https://download.01.org/0day-ci/archive/20260507/202605072235.ppdHJcTR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072235.ppdHJcTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4334d83904fc ("dt-bindings: timer: Convert marvell,armada-370-timer to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605072235.ppdHJcTR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs (simple-bus): gpio_leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
>> arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: timer@20300 (marvell,armada-370-timer): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/marvell,armada-370-timer.yaml
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/sata@a0000: failed to match any schema with compatible: ['marvell,armada-370-sata']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: mvsdio@d4000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
