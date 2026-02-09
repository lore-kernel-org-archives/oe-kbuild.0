Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4347284898
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770653396; cv=none; b=WiZTDNJoofr2FK439obKTfuY4ZwsJRWtJZQ9XJYPpnL+5Uhp+FSRkIKMKpoOV5YF6BM3szhnqxJH8W8fPDjZrJ16Cm2av7zmWNH4eyzz3hNfRXngFshv7erByyGN5jZMSneLqVmYDlD1bUAZlvpV0yAskaVjmPrmHnBF65pIUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770653396; c=relaxed/simple;
	bh=qE+hhQuoFjn4RVpbNsaIOzLwjpZEDffACM4Lc0Oe3EQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c9850MF+Xkjo4RpsId2J3Ou2OyzHUASvVluMQoeZiSVslOoSOAqYiOT0rUaD8FUGpMxnhoimq0SZJ7rXPDaoeMqeU4xhc3HAP9z0brFjLeeyV0QxMqh05ricIFbprPi6YxemU6ay6t8U2MtBroIQXIHqFTckuT0CVETMl6ulNHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtEGHAws; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtEGHAws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770653395; x=1802189395;
  h=date:from:to:cc:subject:message-id;
  bh=qE+hhQuoFjn4RVpbNsaIOzLwjpZEDffACM4Lc0Oe3EQ=;
  b=CtEGHAwswbF/GUXPkZu+DOCM/DrJDY/NwaBCbpOxZGgupgmdPhDDtmzJ
   ieI93T9BfPgVVhfxnD4C+rtJ58EKDePnXXGYCNgAepao50ejVAJu3hVD2
   +z9isjGFvEA03FY4vEc3lYhZg6f66dYJUjh7rYdd5LRu2+Uya+pRysQB9
   PL28CFLCcVeGtY8D3V0XRwacue2aUlrv3rLR/bMAdNBWL+OauaQf3WKQ+
   qWF1q+FEl9i08AJSjgexGlCV09QFl12U1ugS9jZRKD0SM3Q6ok7A4ZwvE
   zvo7PNk3CPQnD4nLKhaFsnfKnCc45ARrOV7fnbUNsliCDbRFJljwYTzRb
   w==;
X-CSE-ConnectionGUID: b+4E2IOASb+j5wSmhPkRxg==
X-CSE-MsgGUID: q43MWrvhTSGZeozmmLCPLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75614819"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="75614819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 08:09:55 -0800
X-CSE-ConnectionGUID: jc8VmwtNSCKinshd3VqAuA==
X-CSE-MsgGUID: FuNy7x8FS8+h80JoNrOwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210783670"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2026 08:09:53 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTpf-000000000IO-27Kq;
	Mon, 09 Feb 2026 16:09:51 +0000
Date: Mon, 09 Feb 2026 17:09:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to
 match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
Message-ID: <202602091719.fWlaOgZ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
commit: 4f0b3cd7b664e662e9c4480e8d58574ece8aea57 MIPS: dts: Always descend vendor subdirectories
date:   2 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 2 months ago
config: mips-randconfig-2051-20260209 (https://download.01.org/0day-ci/archive/20260209/202602091719.fWlaOgZ0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091719.fWlaOgZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602091719.fWlaOgZ0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/lantiq/danube.dtsi:97.21-109.5: Warning (simple_bus_reg): /fpi@10000000/pci@e105400: simple-bus unit address format error, expected "7000000"
   arch/mips/boot/dts/lantiq/danube_easy50712.dts:112.4-114.6: Warning (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: Missing property '#address-cells' in node /biu@1f800000/icu@80200, using 0 as fallback
   arch/mips/boot/dts/lantiq/danube_easy50712.dts:112.4-114.6: Warning (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: property size (28) too small, expected > 40
   lantiq,groups: size (6) error for type uint32
   lantiq,groups: size (5) error for type uint32
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: biu@1f800000 (lantiq,biu): $nodename:0: 'biu@1f800000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000: failed to match any schema with compatible: ['lantiq,biu', 'simple-bus']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000/icu@80200: failed to match any schema with compatible: ['lantiq,icu']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000/watchdog@803f0: failed to match any schema with compatible: ['lantiq,wdt']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000: failed to match any schema with compatible: ['lantiq,sram']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/eiu@101000: failed to match any schema with compatible: ['lantiq,eiu-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cgu@103000 (lantiq,cgu-xway): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/lantiq/lantiq,cgu.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/rcu@203000: failed to match any schema with compatible: ['lantiq,rcu-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: fpi@10000000 (lantiq,fpi): $nodename:0: 'fpi@10000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000: failed to match any schema with compatible: ['lantiq,fpi', 'simple-bus']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/gptu@e100a00: failed to match any schema with compatible: ['lantiq,gptu-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pci@e105400: failed to match any schema with compatible: ['lantiq,pci-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0: failed to match any schema with compatible: ['lantiq,localbus', 'simple-bus']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0/nor-boot@0: failed to match any schema with compatible: ['lantiq,nor']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pinmux@e100b10: failed to match any schema with compatible: ['lantiq,danube-pinctrl']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: exin: lantiq,groups: b'exin1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci: lantiq,groups: b'gnt1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: ethernet@e180000 (lantiq,etop-xway): 'mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml
--
   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:221.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@9,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:240.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@a,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:259.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:278.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:297.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:316.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: failed to match any schema with compatible: ['loongson,loongson64-2core-2k1000']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: / (loongson,loongson64-2core-2k1000): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: cpu@0 (loongson,gs264): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0: [0, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@a,0:interrupts:0: [1, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@b,0:interrupts:0: [2, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@c,0:interrupts:0: [3, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@d,0:interrupts:0: [4, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0: [5, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'ehci@4,1', 'gmac@3,0', 'gmac@3,1', 'ohci@4,2', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'sata@8,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0: [0, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@a,0:interrupts:0: [1, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@b,0:interrupts:0: [2, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@c,0:interrupts:0: [3, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@d,0:interrupts:0: [4, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0: [5, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
--
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:289.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:308.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:327.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:346.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:365.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@f,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:384.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@10,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:403.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@11,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:422.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@12,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:441.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@13,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:460.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@14,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: / (loongson,loongson64c-4core-ls7a): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
--
>> arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dtb: / (loongson,loongson64c-4core-rs780e): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dtb: /bus@10000000/isa@18000000/rtc@70: failed to match any schema with compatible: ['motorola,mc146818']
--
>> arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dtb: / (loongson,loongson64c-8core-rs780e): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dtb: /bus@10000000/isa@18000000/rtc@70: failed to match any schema with compatible: ['motorola,mc146818']
--
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:289.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:308.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:327.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:346.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:365.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@f,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:384.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@10,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:403.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@11,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:422.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@12,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:441.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@13,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:460.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@14,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: / (loongson,loongson64g-4core-ls7a): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
--
   arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
   arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dtb: / (loongson,loongson64v-4core-virtio): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dtb: /hypervisor: failed to match any schema with compatible: ['linux,kvm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
