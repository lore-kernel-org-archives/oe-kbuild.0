Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA4221299
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 03:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746761602; cv=none; b=l1BTHBeW9hNOBXo1jp16OvJm621m5LRbsuUYrv5r9dNwasxazREN6EM/4TWRp3+WXu121i/bPRObepkC+U77dc/FlPSlNjJ6vg6AEH8goTQPFa/bV2RP77QgDGZuKrM3Off/So+OyPG34v1NdbGxjBGcoeWgZwDK2Ow3vEnBi1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746761602; c=relaxed/simple;
	bh=DitTqTfbwk+MeawUHmJt6QpzWAdHlGZbcOLPYaKrkGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AirUxMQtDMx5bRkGIn9Zpz40zA+o1HUTClkpfbFnksEF6C9OxXhkA64KkaraqgafWyTagyacBVkZ1TQKYcjx2Of5Rbxowp9O/aDU7EF6p40kbn7+OMTA4qhTuPQ4HIihVxlzgxYffCm+CySkgoIsXzOIs+k1ETW/zwRWnjl6lfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYpasWsX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYpasWsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746761601; x=1778297601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DitTqTfbwk+MeawUHmJt6QpzWAdHlGZbcOLPYaKrkGA=;
  b=LYpasWsXDqTIlTn72bUgllnLepjiAzZpvCCSFJEuOT5SX0d9pjJSF+bF
   5oPbvOcvX8PH+Qehs42ozj/TkswmSq6O8v0jJGvUIEhEXoFbulYtLYF0j
   WBe4Ko6RloJredJx/c2kUmaEfax04AsHs4NMOPSeC/XW3Y+1n6NUqhHLB
   9PVgGvEsCbXJaWqDk32qSD0/ISkrQhFvcaRIKXJue7De/jJSqCA2xD+QH
   AwWiUg0w/kzPfrbdPCE0s+09wp+s9JabP62khPWiHEbjibUAepLckhQIn
   pO+WzYOl1FzObmnMcZuxGOtJglo9V9q+eCi4FKLqZJWffRL1++6MSUZVI
   Q==;
X-CSE-ConnectionGUID: xgQkVWpfRpC83O6MaZD5Mg==
X-CSE-MsgGUID: PWqe+yULS4SGC6/MoPNYRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48446075"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48446075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 20:33:20 -0700
X-CSE-ConnectionGUID: KNgs9/AHRGe6GJa7TJQbdA==
X-CSE-MsgGUID: L7ocokyTSaWoxVAXrAOtRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136883022"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 May 2025 20:33:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDEU8-000BdD-0d;
	Fri, 09 May 2025 03:33:16 +0000
Date: Fri, 9 May 2025 11:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <202505091152.zC1V2ZeE-lkp@intel.com>
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
In-Reply-To: <20250506022301.2588282-1-robh@kernel.org>
References: <20250506022301.2588282-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Gregory Clement <gregory.clement@bootlin.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-timer-Convert-marvell-armada-370-timer-to-DT-schema/20250506-144131
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506022301.2588282-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250507 (https://download.01.org/0day-ci/archive/20250509/202505091152.zC1V2ZeE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091152.zC1V2ZeE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505091152.zC1V2ZeE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs (simple-bus): gpio_leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
>> arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: timer@20300 (marvell,armada-370-timer): 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/marvell,armada-370-timer.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/sata@a0000: failed to match any schema with compatible: ['marvell,armada-370-sata']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: mvsdio@d4000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
