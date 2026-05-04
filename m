Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806F0CA6B
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 01:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858890; cv=none; b=qDCGcWublHDnUuobkyhJxWLRjcK0gw/LBwXWafvyD2Mqx/g8WNtpxjMqXbHsp/6Uk8wBG+VrAkELeSnih6vejgMk6Nmxz8CIKtzPRF6iC64UbOMKalpKZJ9Dv4ymFFqO+I/82X3ro9f1V2/NjKu3nDf96EUwBjwhZZmbkS4/I+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858890; c=relaxed/simple;
	bh=1EkD51dWP6iYnKEbpSaFi4hz+amarn7hFMGh/OHu3iE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QiSW2lJdzek7pc9rdjGas3BVgRdU7qd5MIpYsEOwOMfbFfDBPgb6N1tX4FhMOGVqu7UXxZrr32gulnX9atyZ6KsBKD5wkpSmWlh7ax6DAwZwBuDEJTSkvU6n7TLv3K3LT1lyY4GR/zeZrasn2BvN3xjdW7qjktV22FOyRtAWl/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y14By0+5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y14By0+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777858889; x=1809394889;
  h=date:from:to:cc:subject:message-id;
  bh=1EkD51dWP6iYnKEbpSaFi4hz+amarn7hFMGh/OHu3iE=;
  b=Y14By0+5fahwiP3XRTjXBwgadrqCvei5+UW9yl3ZpYikrwJJ37t1MtvH
   Fn1x0VJ78mRNuxQc0xdZ31qDs6YNryV6Ah37Cr+zjUeoRQzq6WlWv7OFU
   uICl7xXnPvLozpVMPSRGZ3gx023OJlS7hV+MiCF05YAcJWHqH037uSPod
   NePKfJA4DLUKOP/IJnbJ1jF5Um0cNC5WiLompsaaTCxZl4JWA5gFnphR+
   Ku/EV4zfMG2XmTDSQHuK/81PAxWYLnJ4UkbXAlp6vcNf5moZD3KXr1DKH
   LzVpU0/H0371dFkRkheObXvEr/Ojqp0BOaGvLPHQOF3W7wqkex2o4qPlD
   g==;
X-CSE-ConnectionGUID: N0NUKHmqRyKx9999niX84g==
X-CSE-MsgGUID: xXiUGLzMRauAUNIPYL2xkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78743779"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78743779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 18:41:28 -0700
X-CSE-ConnectionGUID: OaPUwcmxT5qi1fnb+Ptw6Q==
X-CSE-MsgGUID: 70xn2dtzSkSxOqQ9Ux34XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="265733561"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2026 18:41:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJiJI-000000005g9-2xQg;
	Mon, 04 May 2026 01:41:24 +0000
Date: Mon, 04 May 2026 03:41:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/marvell/armada-370-mirabox.dtb:
 timer@20300 (marvell,armada-370-timer): 'clock-frequency' does not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605040322.ez1qrBIy-lkp@intel.com>
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
head:   f377d0025eb00c0590466f5be9f50decf9b9180e
commit: 4334d83904fc8b1a4bd5c0829164511456feb600 dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2055-20260429 (https://download.01.org/0day-ci/archive/20260504/202605040322.ez1qrBIy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040322.ez1qrBIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4334d83904fc ("dt-bindings: timer: Convert marvell,armada-370-timer to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040322.ez1qrBIy-lkp@intel.com/

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
