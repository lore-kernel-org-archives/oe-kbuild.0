Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B4E1D5AC0
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241769; cv=none; b=a2pmGlaIv7sxg8jlNJ8MlRcxroF8pwXlj7V52zZD9WVtyHuy4Yq9ctX+yHEpqhu0K00O9o4j4LqMRfXp/7K9P0oZrqLE634HLmJ4nF9IMaGgp8T/1BPj8n56tlxrlns59znDcADImR6VZKYph27mF2O4Fuz7cKAoIDmydk4bIdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241769; c=relaxed/simple;
	bh=kFJrcNC3akLAG9iPP0W29VxM10XZnXVQkycWjuYt8Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7TEigHI5Q0BuIIhqCKb6Kv6L02C/dmDO8w6+7raQcKFbviFC1CCfxKk9a5FGswNWeBMjTQakhnwKkt+ZT3LbPZfsxuNm6Sm8pmSnRYKmwbAqMOQMdnqdp+iLrzKmhJrgmdWmB9YqTTjXWARQlT8Ry4tcvdqnDlDazNCMOvZpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfUURvwh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfUURvwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749241766; x=1780777766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFJrcNC3akLAG9iPP0W29VxM10XZnXVQkycWjuYt8Mg=;
  b=HfUURvwhDBakPj2XoM1DPj+I1j9eODmTygB0XDpicMKPpcE05zdOyYB9
   uWb4SuLtjMXrOXcfYoDgGrhxP2svevwmrMkvNSyrH9lU1ZtTD01EuGUKw
   TEqosJRiqedHEGiQp/WaXxoUWOh0iCNV7WERy5k7wuzokiNnvfb8mYBbY
   18Uypql9IFasS/86P6XghmN+Rh9yplBkQRWevMyEWNgAn1BNzSRBZDd4Q
   rIsH5oyzZgeRC/JLB35zE/nSGJcYAuh0dZ3hjkyHUaBi0DEdPfpr1gWwv
   67//hioUjFZ2CkKiLIA6lk2rwoEyketnPKoVwHYkfaouX3IAgMOyMNFVv
   g==;
X-CSE-ConnectionGUID: IhcixJEzRqinYUc1nMgoMA==
X-CSE-MsgGUID: SB+ooxhyQ5iwYPIhbt/s9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62059331"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62059331"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 13:29:26 -0700
X-CSE-ConnectionGUID: SSUpuJQcShycCpYfea17Uw==
X-CSE-MsgGUID: vqlldaSHQSW2C3A9WZGW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="145847264"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2025 13:29:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNdgo-0005Fz-2J;
	Fri, 06 Jun 2025 20:29:22 +0000
Date: Sat, 7 Jun 2025 04:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: syscon@100000008 (syscon):
 compatible: ['syscon'] is too short
Message-ID: <202506070454.zXsxgP4e-lkp@intel.com>
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
head:   e271ed52b344ac02d4581286961d0c40acc54c03
commit: f97b0435c8572b16305d68cfc14ddc901878a9e7 dt-bindings: mfd: syscon: Split and enforce documenting MFD children
date:   11 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-051-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070454.zXsxgP4e-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070454.zXsxgP4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070454.zXsxgP4e-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/brcm/bcm6368.dtsi:68.30-78.5: Warning (simple_bus_reg): /ubus/syscon@100000008: simple-bus unit address format error, expected "10000008"
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: / (brcm,bcm96368mvwg): compatible:0: 'brcm,bcm96368mvwg' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: / (brcm,bcm96368mvwg): compatible: ['brcm,bcm96368mvwg', 'brcm,bcm6368'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /: failed to match any schema with compatible: ['brcm,bcm96368mvwg', 'brcm,bcm6368']
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: ubus (simple-bus): $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm6368-clocks']
>> arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: syscon@100000008 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: watchdog@1000005c (brcm,bcm7038-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: /ubus/led-controller@100000d0: failed to match any schema with compatible: ['brcm,bcm6358-leds']
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: nand@10000200 (brcm,nand-bcm6368): $nodename:0: 'nand@10000200' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:1: 'nand-int-base' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm96368mvwg.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:2: 'nand-cache' was expected
--
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: / (brcm,bcm9ejtagprb): compatible: ['brcm,bcm9ejtagprb', 'brcm,bcm6328'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /: failed to match any schema with compatible: ['brcm,bcm9ejtagprb', 'brcm,bcm6328']
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: ubus (simple-bus): $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm6328-clocks']
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: watchdog@1000005c (brcm,bcm7038-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
>> arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: syscon@10000068 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: nand@10000200 (brcm,nand-bcm6368): $nodename:0: 'nand@10000200' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:1: 'nand-int-base' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:2: 'nand-cache' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: nand@10000200 (brcm,nand-bcm6368): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.2', 'brcm,brcmnand'] is too long
   	['brcm,nand-bcm6368', 'brcm,brcmnand-v2.2', 'brcm,brcmnand'] is too short
--
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: / (comtrend,vr-3032u): compatible:0: 'comtrend,vr-3032u' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: / (comtrend,vr-3032u): compatible: ['comtrend,vr-3032u', 'brcm,bcm63268'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: /: failed to match any schema with compatible: ['comtrend,vr-3032u', 'brcm,bcm63268']
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: ubus (simple-bus): $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm63268-clocks']
>> arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: syscon@10000008 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: timer-mfd@10000080 (brcm,bcm7038-twd): watchdog@1c: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/brcm,twd.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: watchdog@1c (brcm,bcm7038-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: nand@10000200 (brcm,nand-bcm6368): $nodename:0: 'nand@10000200' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:1: 'nand-int-base' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
--
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: / (netgear,cvg834g): compatible: ['netgear,cvg834g', 'brcm,bcm3368'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /: failed to match any schema with compatible: ['netgear,cvg834g', 'brcm,bcm3368']
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: ubus (simple-bus): syscon-reboot@fff8c008: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: ubus (simple-bus): $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /ubus/clock-controller@fff8c004: failed to match any schema with compatible: ['brcm,bcm3368-clocks']
>> arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: syscon@fff8c008 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dtb: /ubus/interrupt-controller@fff8c00c: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
--
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: / (sfr,nb4-ser): compatible:0: 'sfr,nb4-ser' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: / (sfr,nb4-ser): compatible: ['sfr,nb4-ser', 'brcm,bcm6358'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /: failed to match any schema with compatible: ['sfr,nb4-ser', 'brcm,bcm6358']
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: ubus (simple-bus): $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /ubus/clock-controller@fffe0004: failed to match any schema with compatible: ['brcm,bcm6358-clocks']
>> arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: syscon@fffe0008 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /ubus/interrupt-controller@fffe000c: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: watchdog@fffe005c (brcm,bcm7038-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: /ubus/led-controller@fffe00d0: failed to match any schema with compatible: ['brcm,bcm6358-leds']
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: usb-phy@fffe1500 (brcm,bcm6358-usbh-phy): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/brcm,bcm63xx-usbh-phy.yaml#
   arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dtb: nor@1e000000 (cfi-flash): $nodename:0: 'nor@1e000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: / (sfr,nb6-ser): compatible:0: 'sfr,nb6-ser' is not one of ['brcm,bcm3368', 'brcm,bcm3384', 'brcm,bcm33843', 'brcm,bcm3384-viper', 'brcm,bcm33843-viper', 'brcm,bcm6328', 'brcm,bcm6358', 'brcm,bcm6362', 'brcm,bcm6368', 'brcm,bcm63168', 'brcm,bcm63268', 'brcm,bcm7125', 'brcm,bcm7346', 'brcm,bcm7358', 'brcm,bcm7360', 'brcm,bcm7362', 'brcm,bcm7420', 'brcm,bcm7425']
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: / (sfr,nb6-ser): compatible: ['sfr,nb6-ser', 'brcm,bcm6362'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /: failed to match any schema with compatible: ['sfr,nb6-ser', 'brcm,bcm6362']
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: ubus (simple-bus): $nodename:0: 'ubus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /ubus/clock-controller@10000004: failed to match any schema with compatible: ['brcm,bcm6362-clocks']
>> arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: syscon@10000008 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: /ubus/interrupt-controller@10000020: failed to match any schema with compatible: ['brcm,bcm6345-l1-intc']
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: watchdog@1000005c (brcm,bcm7038-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: nand@10000200 (brcm,nand-bcm6368): $nodename:0: 'nand@10000200' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:1: 'nand-int-base' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dtb: nand@10000200 (brcm,nand-bcm6368): reg-names:2: 'nand-cache' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
