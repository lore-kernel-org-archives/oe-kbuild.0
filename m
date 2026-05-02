Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7123E25B
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 04:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777696383; cv=none; b=lnZsQDyZs64FbZMXRRXuRPLZSHk+8TPepcnqCj+VH7cSYVcmp4aJsR6MeXkO6ErgK4UciRruFhP1mgrHk2yNxwhP71JWDt7Blx/zRQnAnhSRcYVNaCm8Seb0FeuCRkvATEVGNFr3UcisFyK5uk3BArFor72L5rWLvcL3krAhW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777696383; c=relaxed/simple;
	bh=UXKLVzQ/yjFVDX4mb+UF5wZ2DgwKbnWc5eeIYL/DRfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tYvUtHtSOlD/8eAacmJrOg2QQk/GdkZx/LU6z81dQ9nw8Eoo3D6hhz5IcvZYnmtuDR2tkdJtHtvs32kWrOfFHzBrMHv8zWmLmTHkKnbUblWI3hGJ+S01CsDpUMP5qYtsMCyh1KS7FXxW6n4/ps+VSKp4caGdw5/S2ZmicE7hQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7097qOJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7097qOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777696380; x=1809232380;
  h=date:from:to:cc:subject:message-id;
  bh=UXKLVzQ/yjFVDX4mb+UF5wZ2DgwKbnWc5eeIYL/DRfY=;
  b=M7097qOJu0qOiK2gV1/U10TT7DO7A5FVxgSYFGFp2C9GPbjkBTuGbP4P
   5U6thhs+hUBiyjKjhBsL+FNFgdTGOFztDDRz3uCUeOhXlcqEVfGFnVclh
   8aAPRd0Cqd0/3u/zhti2UXdGq6OqNHfwGmZMEANKc0Z92AZ5EDMWQHtZd
   ywHbNmbCCrxo3HpcqvVcobcKTkr433gkqA3u4SpYU0Leh9PrXm+UawrkU
   zIwaSpY4d3lKKxu0vSpzYHagoeO1/pMqkkgkIcJ694HsZNWcfyDyxsOsd
   5nNRb/M7a8AWMjf13645I+A1zcY08QULrBoWe7HAZK5y/QbE2UOp9ZcW1
   Q==;
X-CSE-ConnectionGUID: 8FsnQT1cSjmbM9n4XHuuPA==
X-CSE-MsgGUID: Hn1WPZ6fRn6SzfJ8z2SHIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="66181874"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="66181874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 21:32:59 -0700
X-CSE-ConnectionGUID: hhRQu2WmTzWIJUDRFS1eOQ==
X-CSE-MsgGUID: 3T8CHhtOSo+UqOElPf8sZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="240008210"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2026 21:32:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ22C-000000005C7-0ihL;
	Sat, 02 May 2026 04:32:56 +0000
Date: Sat, 02 May 2026 06:32:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/marvell/armada-370-mirabox.dtb:
 timer@20300 (marvell,armada-370-timer): 'clock-frequency' does not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605020630.s6BSkgeM-lkp@intel.com>
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
head:   ef5f46b630235b75beec43174348c3d01d6fc49a
commit: 4334d83904fc8b1a4bd5c0829164511456feb600 dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2055-20260429 (https://download.01.org/0day-ci/archive/20260502/202605020630.s6BSkgeM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020630.s6BSkgeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4334d83904fc ("dt-bindings: timer: Convert marvell,armada-370-timer to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605020630.s6BSkgeM-lkp@intel.com/

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
