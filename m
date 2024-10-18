Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51DB188010
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 23:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293251; cv=none; b=Yd/yxVeNdHaAw5qmbuOBLBkKOd1nfs5nnlVMt7q0xP/aI6pnwphMc6zsCDO88HdKXujjNnh1OiSCAyhLqyTx75Ksk7xahGcn58fjPkqfs3EJK6+IfqvLfgI5eA1JnIPUXIzTMYZB6HDRZfduYfzrQ7cqMLv7Nb6SsojnBTcmCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293251; c=relaxed/simple;
	bh=prY1ENkZ+T6MIgrM2OxsY+Ia0+eO8zIT683fnYetU+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gl6dMSnZUzCCHaFYQPguew8CNQ0Hpn5TAvqb7P8PoTWmEA8OLdDDMnks6u7kPEYNcLLWGcipJli7TTQyG9Neklo0342k3nhKjWC8bulWsE9FIaocft2kIUKOGXtnbYQkNRPhHjdfhrmVucYcfdV7r88914vQfb+5mgiIxFrllXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0iwkQgU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0iwkQgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729293249; x=1760829249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prY1ENkZ+T6MIgrM2OxsY+Ia0+eO8zIT683fnYetU+4=;
  b=j0iwkQgUh8TQQ//IEIrMnbO0ys4SyRjqAvbHVfXi8/71ZH76aqV1Zgq/
   ES6kMnBSFu91x8cVqP5VphmZP8DHvHqASZmmlUddcGi99CDF+icZNU//t
   M/iHZS4bkQhHfgm5E8jvhjhhgCdktPBjHcXFyqj4spBCK87kGVeYYXDE9
   pvpqtxQYrKltjpgnrR8DMp/cTERYzR2/GUkIvSQ5ixD2MiVq5bOpltv8F
   yZTgaaqpo4pgPg2e8/O7Xz7FyKNreBK1Fp3IwK5xM5+8o+IPRZ+TYX3jO
   Tm3audKkfwtED+cPwzZP1k6shLn7Dp+E13chZ0cU4hH4f9uPVfkNDXF0c
   g==;
X-CSE-ConnectionGUID: zCyU0P3oRIuIxNyJAZzDTA==
X-CSE-MsgGUID: 37WB7n4xTh2muGHbnfe11A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39395648"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39395648"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 16:14:08 -0700
X-CSE-ConnectionGUID: F/kebnjXSEqdy8uGGJO/HA==
X-CSE-MsgGUID: EeEPKzxORvaG1aNMGQO/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83822040"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Oct 2024 16:14:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1wAX-000OOI-0Z;
	Fri, 18 Oct 2024 23:14:05 +0000
Date: Sat, 19 Oct 2024 07:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/rs90.dtb: /: memory@1fc00000:
 'bank-width', 'compatible', 'device-width' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202410190728.Vno23GyN-lkp@intel.com>
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
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b04ae0f45168973edb658ac2385045ac13c5aca7
commit: 04318868abaa82f7c6e9e0ce323aa5460b7fc9da mips: dts: ingenic: Remove unneeded probe-type properties
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: mips-randconfig-052-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190728.Vno23GyN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190728.Vno23GyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410190728.Vno23GyN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/rs90.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: /: keys@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: /: keys@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/rs90.dtb: /: memory@1fc00000: 'bank-width', 'compatible', 'device-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: /: memory@1fc00000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: cpu@0: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: adc@10070000: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: nand-controller@1: Unevaluated properties are not allowed ('rb-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml#
   arch/mips/boot/dts/ingenic/rs90.dtb: lcd-controller@13050000: 'memory-region' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: analog-amplifier@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: i2c-controller@3: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/ingenic/gcw0.dtb: /: memory@1fc00000: 'bank-width', 'compatible', 'device-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: memory@1fc00000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: cpu@0: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: interrupt-controller@10001000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-intc'] is too short
   	'ingenic,jz4770-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
