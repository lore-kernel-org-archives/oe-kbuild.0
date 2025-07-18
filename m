Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823B3597E
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752869815; cv=none; b=EDsOVCpVZo2WIS2+IlHvYdIXdeCbwU5uPIHc861CQlzhkD7bl7CBnIKP1CQi98+6POppy4eCRBvKoqyejoQuCSeR/Xfc5dIGcKBF9KvN9ZeToF3hYklcKUA2+pZD66/cz5KPtlYbLljUSiYEqTg3NAAFlx0FHxwamdPPXgn9Ok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752869815; c=relaxed/simple;
	bh=J7igMaATHL126rTmZp+aMet3/K1dH0/GtGmSgrXbi/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UyjiRQkQhYiIcS6xXstPMVUOPkK0E1Rn/aj1pR2F8z0A0vdFZI9F3MtNcw5F+hAzHPUonrcoSAG/Io+Lnja4aBJL2kwJb8ef6H7tDOgvwpVXT6b52E7GAJhVqp+Xwy3NXxiVpzVLseMmeNGmqOaMrZG3z5RuKOVwW1VrWEHkNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+ce2uKx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+ce2uKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752869813; x=1784405813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7igMaATHL126rTmZp+aMet3/K1dH0/GtGmSgrXbi/k=;
  b=R+ce2uKxSgA3HBlR0Pv+tBk9lDq28LmGoJE9F2Jaf3WjdWgqW404OFW+
   T0+Rt9O8wG0K4kvQn3eC0EQk9h9taOMRarUlWQo/YwpswjjYzyV7tIwtQ
   V5bVAP1k0KEI6JJyUU29OjLBZ3g1wRyodchpU7m86xMfmkWh3sld7tLuP
   wf7XZj4TvNiZNDRhJ2BDaBfS9biYd8qRkP1RXjQve7KDM5oZ2LtS6DpvN
   7ekZtRV8z0k2zCliEBb+nJSGcTt6h7YMCJdo+qbpaFBiqK6ciynLqrMkC
   31m8PivEItH8e5Y32Mk6YvCcevI14gSjG/f8CK1U3XxY0xnpNjC/X4ArJ
   A==;
X-CSE-ConnectionGUID: L3fhEUGoRNeVRe231maSog==
X-CSE-MsgGUID: e1Ck2X+qTqq0FxKow9s+bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="80615929"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="80615929"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 13:16:52 -0700
X-CSE-ConnectionGUID: UqovkFQKRNiiTszTg+pw6g==
X-CSE-MsgGUID: jJ4YpW2XQfOiXsgj1I7kyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158296861"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2025 13:16:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucrVh-000F0h-1E;
	Fri, 18 Jul 2025 20:16:49 +0000
Date: Sat, 19 Jul 2025 04:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/dt-bindings-qcom-naming 6/7]
 arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@e2000000
 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items
 matching the given schema
Message-ID: <202507190402.wpfdS0mt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@e2000000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/krzk/linux n/dt-bindings-qcom-naming
head:   cc9ec12e51d6cceb1dda0566a4bb50057effe437
commit: 51d8e9266eb19027c576810fb1783a2ea8405507 [6/7] ARM: dts: st: spear: Use generic "ethernet" as node name
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm-randconfig-052-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190402.wpfdS0mt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190402.wpfdS0mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507190402.wpfdS0mt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: dma@ea800000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: dma@eb000000 (snps,dma-spear1340): $nodename:0: 'dma@eb000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: dma@eb000000 (snps,dma-spear1340): dma-requests: 32 is greater than the maximum of 16
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: dma@eb000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/flash@b0000000: failed to match any schema with compatible: ['st,spear600-fsmc-nand']
>> arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@e2000000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/pcm: failed to match any schema with compatible: ['st,pcm-audio']
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/flash@ea000000: failed to match any schema with compatible: ['st,spear600-smi']
   arch/arm/boot/dts/st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: usb@e4000000 (st,spear600-ohci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: usb@e5000000 (st,spear600-ohci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: ahci@b1000000 (snps,spear-ahci): Unevaluated properties are not allowed ('interrupts', 'phy-names', 'phys', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: ahci@b1800000 (snps,spear-ahci): $nodename:0: 'ahci@b1800000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: ahci@b4000000 (snps,spear-ahci): $nodename:0: 'ahci@b4000000' does not match '^sata(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/pcie@b1000000: failed to match any schema with compatible: ['st,spear1340-pcie', 'snps,dw-pcie']
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/pcie@b1800000: failed to match any schema with compatible: ['st,spear1340-pcie', 'snps,dw-pcie']
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/pcie@b4000000: failed to match any schema with compatible: ['st,spear1340-pcie', 'snps,dw-pcie']
>> arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@5c400000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@5c500000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@5c600000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/spear1310-evb.dtb: ethernet@5c700000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: /ahb/pinmux@e0700000: failed to match any schema with compatible: ['st,spear1310-pinmux']
   arch/arm/boot/dts/st/spear1310-evb.dtb: clcd: st,pins: b'clcd_grp\x00clcd_high_res\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: nand: st,pins: b'nand_8bit_grp\x00nand_16bit_grp\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/st/spear1310-evb.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'button@1' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: dma@ea800000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: dma@eb000000 (snps,dma-spear1340): $nodename:0: 'dma@eb000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: dma@eb000000 (snps,dma-spear1340): dma-requests: 32 is greater than the maximum of 16
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: dma@eb000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: /ahb/flash@b0000000: failed to match any schema with compatible: ['st,spear600-fsmc-nand']
>> arch/arm/boot/dts/st/spear1340-evb.dtb: ethernet@e2000000 (st,spear600-gmac): compatible: ['st,spear600-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: /ahb/pcm: failed to match any schema with compatible: ['st,pcm-audio']
   arch/arm/boot/dts/st/spear1340-evb.dtb: /ahb/flash@ea000000: failed to match any schema with compatible: ['st,spear600-smi']
   arch/arm/boot/dts/st/spear1340-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: usb@e4000000 (st,spear600-ohci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/st/spear1340-evb.dtb: usb@e5000000 (st,spear600-ohci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
