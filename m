Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA6382
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735408047; cv=none; b=rEQzKRUjeu+tWzXaE7igHKS0WXP/CwgcVFCLmwt0ZPgNgpJ0Uu1qXpzYoPf9T1IxP9nRr9RhHifjUdUMAmo1G95knR0rcc9/4hqfRsFoLFZNhyiJ4BWGwo3/qBAeS93vFU1odOos9FFqu9klzLuqGxFg6suwWMT0WkhZXnYfSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735408047; c=relaxed/simple;
	bh=Bch5x496/qntIqTCUvUCtvIrtcvH3ddHorz5vRu8/QA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOOyzTXIALVO07gnWroU0rhEUzGny0A4clmyo1vK2x/xAKfzhkdj5zUy9+1MiSh6om26ZzqW2PQvmMIeKahOdeDEjk2Gy8RtIQYE2T/1UUPxfsrJdIwPPlH8SZU0J9HDzGgtLHGBiMIGGK/WcUFsggdWt3yhWCND3l8ZUeARBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaL8IdlZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaL8IdlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735408044; x=1766944044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bch5x496/qntIqTCUvUCtvIrtcvH3ddHorz5vRu8/QA=;
  b=CaL8IdlZMG3s0qrT62Gwzi/7OS3Cp7fZF+yLYuZX8lX6Wa0QZUX+yXdn
   hGmU5To5bpOxbHdjBaJ+EpUA6AV85cwl2+QtntMDWh65cplb/2VuaLhZ7
   +ad4Fmr1VFIwNzjs6OiHqqKaTHUFQuHSRPsy9cpijAvt+5Df1cdm6SA1U
   FVNXWkXnXSofwxmPv6VfapmYYn+WZOWCdevKTxEtmxKwf6ldYCLaASrlA
   HTxFoR49QJ6q6+XyOml0Jq0g997DF1VZmczu8Tpbmf9DQ/SzZmSNpcvaO
   8k7ey1N7ANHABt1H3M88x6hAe5eSVcVC0Ki54thDGrB6jAwZoobBFjpB8
   Q==;
X-CSE-ConnectionGUID: 5vtlq9TnRtC9fhcwbC4shg==
X-CSE-MsgGUID: phLHmA7/QvG7/Xxwg/fSqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="53297240"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="53297240"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 09:47:23 -0800
X-CSE-ConnectionGUID: nXDLuUs2TNGddrpH2Nu05A==
X-CSE-MsgGUID: cWj+KaUaTOWptuDJ9vJQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="100522377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Dec 2024 09:47:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRauF-0004E4-0O;
	Sat, 28 Dec 2024 17:47:19 +0000
Date: Sun, 29 Dec 2024 01:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb:
 syscon@fff8c008: compatible: ['syscon'] is too short
Message-ID: <202412290107.fr3zMYES-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: f97b0435c8572b16305d68cfc14ddc901878a9e7 dt-bindings: mfd: syscon: Split and enforce documenting MFD children
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290107.fr3zMYES-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290107.fr3zMYES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412290107.fr3zMYES-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /: compatible: ['netgear,cvg834g', 'brcm,bcm3368'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /: failed to match any schema with compatible: ['netgear,cvg834g', 'brcm,bcm3368']
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: ubus: $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: ubus: syscon-reboot@fff8c008: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /ubus/clock-controller@fff8c004: failed to match any schema with compatible: ['brcm,bcm3368-clocks']
>> arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: syscon@fff8c008: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /ubus/interrupt-controller@fff8c00c: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
--
   arch/mips/boot/dts/brcm/bcm6368.dtsi:68.30-78.5: Warning (simple_bus_reg): /ubus/syscon@100000008: simple-bus unit address format error, expected "10000008"
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /: compatible:0: 'brcm,bcm96368mvwg' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /: compatible: ['brcm,bcm96368mvwg', 'brcm,bcm6368'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /: failed to match any schema with compatible: ['brcm,bcm96368mvwg', 'brcm,bcm6368']
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: ubus: $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm6368-clocks']
>> arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: syscon@100000008: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: watchdog@1000005c: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /ubus/led-controller@100000d0: failed to match any schema with compatible: ['brcm,bcm6358-leds']
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: nand@10000200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-bcm6368' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
--
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /: compatible: ['brcm,bcm9ejtagprb', 'brcm,bcm6328'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /: failed to match any schema with compatible: ['brcm,bcm9ejtagprb', 'brcm,bcm6328']
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: ubus: $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm6328-clocks']
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: watchdog@1000005c: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
>> arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: syscon@10000068: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: nand@10000200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.2', 'brcm,brcmnand'] is too long
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.2', 'brcm,brcmnand'] is too short
   	'brcm,nand-bcm6368' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-iproc' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v2.2' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
--
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /: compatible:0: 'sfr,nb4-ser' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /: compatible: ['sfr,nb4-ser', 'brcm,bcm6358'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /: failed to match any schema with compatible: ['sfr,nb4-ser', 'brcm,bcm6358']
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: ubus: $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /ubus/clock-controller@fffe0004: failed to match any schema with compatible: ['brcm,bcm6358-clocks']
>> arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: syscon@fffe0008: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /ubus/interrupt-controller@fffe000c: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: watchdog@fffe005c: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /ubus/led-controller@fffe00d0: failed to match any schema with compatible: ['brcm,bcm6358-leds']
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: usb-phy@fffe1500: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/brcm,bcm63xx-usbh-phy.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: nor@1e000000: $nodename:0: 'nor@1e000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /: compatible:0: 'sfr,nb6-ser' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /: compatible: ['sfr,nb6-ser', 'brcm,bcm6362'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /: failed to match any schema with compatible: ['sfr,nb6-ser', 'brcm,bcm6362']
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: ubus: $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm6362-clocks']
>> arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: syscon@10000008: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: watchdog@1000005c: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: nand@10000200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.2', 'brcm,brcmnand'] is too long
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.2', 'brcm,brcmnand'] is too short
   	'brcm,nand-bcm6368' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-iproc' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
