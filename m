Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99E29B22D
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Aug 2025 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434498; cv=none; b=FfyvTqMs7dgAhtkIAL5hgjqkq7FE800o8BCl2yA5P/ACi26cQ8WeU9NYi9eAi1v4hPQn2Loizrb91cD1aONO2Kwoo1ac60emstul8IhXrisKFgOsdaLVTDxEu4QewtpRjN3G2vblogwdt8R1xLEeVlIrKDJW+aLu3goIEBqUL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434498; c=relaxed/simple;
	bh=Ase8uVwujLqP6BLVh9tNMPT5/rWwoyw6NIIHxxs5ukA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRasdFfD5bFZM81HC037cUQksRsalnuCOf4ba9vEYV217q1yInKxolGIP6wWESVMCkcNKl6IMxBFN15vJfyRX3yBh8z/SUUmDI4YKuRjBSeeKrNfblvjVxWtJusW4sXQKOWoHo9W1tbqnmjcqiRPHF+kqUd4lWknOQmJRprGIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/GJ27kj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/GJ27kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754434497; x=1785970497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ase8uVwujLqP6BLVh9tNMPT5/rWwoyw6NIIHxxs5ukA=;
  b=K/GJ27kjHz+O5dz0vkkUqpWpLtYBTpt5vCGAImM0eB1spKcEKq9argni
   IyM6nPNevUKwXneMnnvMB6mj63hkiOCIfXCNYtL0KVXHgkHT1K2FreCN4
   zApkuu3ZRtNcLxzPKwLikYxpzCyR970mFJ1DraJKm6wg7LgiUNjNzP/9j
   j6zfHekGhdjjTTF2aALp7hFJULfQ+dDnyRAqjCHJgDTMWZCX+lB6lA+yO
   nQ4/k+J0txEiTOYCq7KJkvQjVTYq28yJi7UGvn1LskpW3Awt71MGF5A2s
   v7Mw+xjRy84HxxNcngaf48sB0fXbCWXlRKkcAIkBbBgKWxyStPHRMY3yU
   A==;
X-CSE-ConnectionGUID: pdyscQzxSdu8vkdHDtzXUA==
X-CSE-MsgGUID: LjFjfp6DQfautkTUYAuJ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68198226"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68198226"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:54:53 -0700
X-CSE-ConnectionGUID: 4BfikF/aRfibf/AV38DcfQ==
X-CSE-MsgGUID: RrKHKKDnRXSLHCsTFP6gXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164282558"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2025 15:54:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujQYT-0000pG-1v;
	Tue, 05 Aug 2025 22:54:49 +0000
Date: Wed, 6 Aug 2025 06:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0
 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed
 ('clock-names' was unexpected)
Message-ID: <202508060629.9ssIiT1X-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
commit: f879ee2ce0d46327e90f61c5dc85fb13a740de10 dt-bindings: Reference opp-v1 schema in CPU schemas
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-052-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060629.9ssIiT1X-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060629.9ssIiT1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508060629.9ssIiT1X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
--
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/rs90.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: adc@10070000 (ingenic,jz4725b-adc): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: nand-controller@1 (ingenic,jz4725b-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: lcd-controller@13050000 (ingenic,jz4725b-lcd): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: /ecc-controller@130d0000: failed to match any schema with compatible: ['ingenic,jz4725b-bch']
   arch/mips/boot/dts/ingenic/rs90.dtb: memory@1fc00000 (mtd-rom): $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): analog-amplifier@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): i2c-controller@3: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: interrupt-controller@10001000 (ingenic,jz4770-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-intc'] is too short
   	'ingenic,jz4770-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: jz4770-cgu@10000000 (ingenic,jz4770-cgu): $nodename:0: 'jz4770-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/mips/boot/dts/ingenic/ci20.dts:25.9-29.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 805306368]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/ci20.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: cpu@1 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): $nodename:0: 'jz4780-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/ci20.dtb: timer@10002000 (ingenic,jz4780-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-ost', 'ingenic,jz4770-ost'] is too long
   	'ingenic,jz4780-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: / (yna,cu1000-neo): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: / (yna,cu1830-neo): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: cpu@0 (ingenic,xburst-fpu2.0-mxu2.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: interrupt-controller@10001000 (ingenic,x1830-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-intc', 'ingenic,jz4780-intc'] is too long
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4775-intc', 'ingenic,jz4770-intc', 'ingenic,jz4760b-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	'ingenic,jz4760-intc' was expected
   	'ingenic,jz4740-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
