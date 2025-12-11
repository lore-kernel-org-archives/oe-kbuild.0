Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D349259CBF
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443765; cv=none; b=XCovstWU5x21r7Ko3I4D233TEHozZsShMmXJlo7HGrov8Km2YFoNG/bRNg9Egbsf2OfsxuCA62sTFPY5NG8jkDH2V3ftRuglOeRyXDcHaOJS3gqJSNz66N7+jbUHtDWVApXNy2sqwWtwKpvcZ7OkzwzK/hE5nGQAAMGx6qs0Yjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443765; c=relaxed/simple;
	bh=gujPBlhyy3H5ZVUtZoXva8EB9koR652VzLNHkyDA2ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEz5FY1hi9Q4JvkRCLbeqzgbPSgjjQocm7jYEja0x4/6KOVBmmEb/1l3fP0ph/bDbba7FUR+kpahdAQbwnsz2ZvSXvapd5Mi3I+9v+a28YDEBsUOlh0CNJFgSi6xKHNuJCdC1gchZ+o4S/dvGV+1zaScVs2+5D6Bx4e4y1q6kC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFUemafB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFUemafB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765443764; x=1796979764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gujPBlhyy3H5ZVUtZoXva8EB9koR652VzLNHkyDA2ws=;
  b=ZFUemafBw9i8tV7qLxQ51VohbYtinH+F5WN1GkZa0Wmm0w6sCFPB+4F8
   ZoByddspmXlaZF5+00M0KZ7neX1G+NmQQ/bkI9yuKQ10EPuBYPzSqp4we
   ovNFFnHYdfwQz4fR6y667w+ECBoHAid9ik6Eb+hFdRXsO0AFSLfQgsqlP
   Z9aMpu+4EhABE6aL0GxD8Zyx9TL5Nv8KOvzoFxdY6Zb/bwaTCZJBGQ7Mp
   pB+wyth0VVrDSp0b8m2GOUO6+SOeRxnM7GIMHEMFZhIFH+XW0fT0elUdm
   82AEI9uEqWpNq7mlcPTMA4BrZCs76/IuDB4E/QdUp84OF9vud/5RCeC37
   A==;
X-CSE-ConnectionGUID: xuZXUCkFSdGFDBdbVQWfyQ==
X-CSE-MsgGUID: kjH2iPCCT5mRlNjRA+cXJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71269189"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71269189"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:02:43 -0800
X-CSE-ConnectionGUID: +gAdjTfTSZalUzD9QOM2ug==
X-CSE-MsgGUID: YQtyUudrQ9+ybD8BBwBndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196647668"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 01:02:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcZL-000000000ym-3IVB;
	Thu, 11 Dec 2025 09:02:39 +0000
Date: Thu, 11 Dec 2025 10:01:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0
 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed
 ('clock-names' was unexpected)
Message-ID: <202512111012.jR5OCgcq-lkp@intel.com>
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
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: f879ee2ce0d46327e90f61c5dc85fb13a740de10 dt-bindings: Reference opp-v1 schema in CPU schemas
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-2051-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111012.jR5OCgcq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111012.jR5OCgcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111012.jR5OCgcq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): analog-amplifier@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): i2c-controller@3: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: / (gcw,zero): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: interrupt-controller@10001000 (ingenic,jz4770-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-intc'] is too short
   	'ingenic,jz4770-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: jz4770-cgu@10000000 (ingenic,jz4770-cgu): $nodename:0: 'jz4770-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/gcw0.dtb: timer@10002000 (ingenic,jz4770-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/mips/boot/dts/ingenic/qi_lb60.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: / (qi,lb60): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/qi_lb60.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: jz4740-cgu@10000000 (ingenic,jz4740-cgu): $nodename:0: 'jz4740-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: pin-controller@10010000 (ingenic,jz4740-pinctrl): $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: mmc: mmc-gpios: {'pins': ['PD0', 'PD2'], 'bias-disable': True} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml
   arch/mips/boot/dts/ingenic/qi_lb60.dtb: serial@10030000 (ingenic,jz4740-uart): 'dma-names' is a required property
--
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): keys@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: / (ylm,rs90): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/rs90.dtb: cpu@0 (ingenic,xburst-mxu1.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: adc@10070000 (ingenic,jz4725b-adc): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: nand-controller@1 (ingenic,jz4725b-nand): Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: lcd-controller@13050000 (ingenic,jz4725b-lcd): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ingenic,lcd.yaml
   arch/mips/boot/dts/ingenic/rs90.dtb: /ecc-controller@130d0000: failed to match any schema with compatible: ['ingenic,jz4725b-bch']
   arch/mips/boot/dts/ingenic/rs90.dtb: memory@1fc00000 (mtd-rom): $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
--
   arch/mips/boot/dts/ingenic/ci20.dts:25.9-29.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 805306368]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: / (img,ci20): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/ci20.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: cpu@1 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: jz4780-cgu@10000000 (ingenic,jz4780-cgu): $nodename:0: 'jz4780-cgu@10000000' does not match '^clock-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/ci20.dtb: timer@10002000 (ingenic,jz4780-tcu): timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4780-ost', 'ingenic,jz4770-ost'] is too long
   	'ingenic,jz4780-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: / (yna,cu1000-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: / (yna,cu1830-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: cpu@0 (ingenic,xburst-fpu2.0-mxu2.0): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: interrupt-controller@10001000 (ingenic,x1830-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-intc', 'ingenic,jz4780-intc'] is too long
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4775-intc', 'ingenic,jz4770-intc', 'ingenic,jz4760b-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	'ingenic,jz4760-intc' was expected
   	'ingenic,jz4740-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
