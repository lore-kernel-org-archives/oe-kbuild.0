Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49CB173
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737222768; cv=none; b=aIHNA0r/7o+4i5okKpSaJX2fQUF0UqvVouppNFRu+sG8N+WzyHTu9lCavg3g7B6fspKufp8ogQANdLdd/Wv0uRMv6JQdLiChbRaFWIJahbKyQdHU8P9xu94g8X9WOnxlB8+7yVPNeZo+j6tPX2C83qVOAULIMF2VFSbNDSrh91o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737222768; c=relaxed/simple;
	bh=HkjBrrbPoP+9DBTbIymIuJkjHLgHh0MlC3qeysTglMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTT9lpCmIBpQayIEQWx+t+qMpqYgYOm8mh6+NAFFL1FHeoaPIf5xe8Amy1DIBZuuDrt47Im87aoeOaNM0IgfNJ6IPwE5c7mvDpRpAWzM0FOoPyT3owpGb6nBTAdqz4j9deADQbRnezs16JRAPqUN3ql15AOziJDR8xdG3gGv0WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6IGeUwb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6IGeUwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737222766; x=1768758766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkjBrrbPoP+9DBTbIymIuJkjHLgHh0MlC3qeysTglMA=;
  b=T6IGeUwb3pN+3gqBLssMJjWF8F6zh8P/V2LMQWXfoU05WPtRiHOPA/u7
   IvHTl221Yi5m/f3yokW/qx7XAaNZPRDn4yl/StMPBHP+F3PCDFg2kV/CU
   9do7g2u0F391jTltCI6qDXAukUXF5vJu8JmvKJGtIpqmtwSwwY8aWMq0x
   Bk4b3dGuhudcCl8rqyP8mZ4ABWzns6+ZEPLDmhLoGIeJHtSUmV+tjP3pr
   tljRatBDz2mX0hlD9FfCNMwfE87RqlX1lg1QFfcXB3LppZa2BCNAlwPgk
   hEp9tXZqVVEvCaSCGxVAQUKkgXoF+asW6oL3uCf8bwGL5Igt86BVs+VyP
   A==;
X-CSE-ConnectionGUID: b9I28rTPSjuMU7vlTHeWQg==
X-CSE-MsgGUID: vPoLG7WuQ52u2tw+Iuddkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41398682"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="41398682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 09:52:46 -0800
X-CSE-ConnectionGUID: qWqaxSjaTWG6PhKqZN71AQ==
X-CSE-MsgGUID: 97ta5POwROqdqtM4hVFPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111069685"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jan 2025 09:52:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZCzy-000Ugm-0M;
	Sat, 18 Jan 2025 17:52:42 +0000
Date: Sun, 19 Jan 2025 01:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/str-enable-disable 52/59]
 arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: gpio@10100: Unevaluated
 properties are not allowed ('p28-hog' was unexpected)
Message-ID: <202501190159.8XT5whYt-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   bd2e2630d542c17294dcf6b292cfaeb576adbbbc
commit: 230e4445fbe314622b1f4c322861c7151ed8e492 [52/59] ARM: dts: marvell: kirkwood-openrd: Align GPIO hog name with bindings
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250119/202501190159.8XT5whYt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190159.8XT5whYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501190159.8XT5whYt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: pcie@82000000: pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: pcie@82000000: pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /mbus@f1000000/pcie@82000000: failed to match any schema with compatible: ['marvell,kirkwood-pcie']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: ocp@f1000000: $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/core-clocks@10030: failed to match any schema with compatible: ['marvell,kirkwood-core-clock']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/spi@10600: failed to match any schema with compatible: ['marvell,orion-spi']
>> arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: gpio@10100: Unevaluated properties are not allowed ('p28-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: gpio@10140: Unevaluated properties are not allowed ('p2-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/bridge-interrupt-ctrl@20110: failed to match any schema with compatible: ['marvell,orion-bridge-intc']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/clock-gating-control@2011c: failed to match any schema with compatible: ['marvell,kirkwood-gating-clock']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/l2-cache@20128: failed to match any schema with compatible: ['marvell,kirkwood-cache']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/timer@20300: failed to match any schema with compatible: ['marvell,orion-timer']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: /ocp@f1000000/crypto@30000: failed to match any schema with compatible: ['marvell,kirkwood-crypto']
   arch/arm/boot/dts/marvell/kirkwood-openrd-base.dtb: ehci@50000: $nodename:0: 'ehci@50000' does not match '^usb(@.*)?'
--
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: pcie@82000000: pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: pcie@82000000: pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /mbus@f1000000/pcie@82000000: failed to match any schema with compatible: ['marvell,kirkwood-pcie']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: ocp@f1000000: $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/core-clocks@10030: failed to match any schema with compatible: ['marvell,kirkwood-core-clock']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/spi@10600: failed to match any schema with compatible: ['marvell,orion-spi']
>> arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: gpio@10100: Unevaluated properties are not allowed ('p28-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: gpio@10140: Unevaluated properties are not allowed ('p2-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/bridge-interrupt-ctrl@20110: failed to match any schema with compatible: ['marvell,orion-bridge-intc']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/clock-gating-control@2011c: failed to match any schema with compatible: ['marvell,kirkwood-gating-clock']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/l2-cache@20128: failed to match any schema with compatible: ['marvell,kirkwood-cache']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/timer@20300: failed to match any schema with compatible: ['marvell,orion-timer']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: /ocp@f1000000/crypto@30000: failed to match any schema with compatible: ['marvell,kirkwood-crypto']
   arch/arm/boot/dts/marvell/kirkwood-openrd-client.dtb: ehci@50000: $nodename:0: 'ehci@50000' does not match '^usb(@.*)?'
--
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: pcie@82000000: pcie@1,0:interrupts:0:0: 9 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: pcie@82000000: pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /mbus@f1000000/pcie@82000000: failed to match any schema with compatible: ['marvell,kirkwood-pcie']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: ocp@f1000000: $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/core-clocks@10030: failed to match any schema with compatible: ['marvell,kirkwood-core-clock']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/spi@10600: failed to match any schema with compatible: ['marvell,orion-spi']
>> arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: gpio@10100: Unevaluated properties are not allowed ('p28-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: gpio@10140: Unevaluated properties are not allowed ('p2-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: cs42l51@4a: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l51.yaml#
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/bridge-interrupt-ctrl@20110: failed to match any schema with compatible: ['marvell,orion-bridge-intc']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/clock-gating-control@2011c: failed to match any schema with compatible: ['marvell,kirkwood-gating-clock']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/l2-cache@20128: failed to match any schema with compatible: ['marvell,kirkwood-cache']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/timer@20300: failed to match any schema with compatible: ['marvell,orion-timer']
   arch/arm/boot/dts/marvell/kirkwood-openrd-ultimate.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
