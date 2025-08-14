Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5B2F99B5
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179848; cv=none; b=NVtwFOEFFyZckcijnz/UHLnjEOKICcNNURhNf15K7GpVrokVyehHwpNgk3zCe7VtzvzBNsA0thilZgeu0EV4GyTcHIRu9mZpY0WC65XspOudHrQAf/UhLJh4EECA/WoUstra2H00p7MKRzyzrM4+L9vdYQy1iLny7WbcY+qlDP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179848; c=relaxed/simple;
	bh=ujNqqmw37HpK17SD9lQ+WCCGBkeHr3vsWBoUcyQC8iU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hx8mRmZehIXuFUFBHnofZ1NkreevvDpdMg4Hv9+x0bsueOAnt+IgtNQKOHQBU7+mOyYL8pOWLc3PorciCUqxql/nn9w1v07AP6sT3jWxIh2ZMlRrqjYd64IhUeq6jGeUv62d58pAy0J/HxLaS7A2Uuhrv9wy0n9gTEHWhDaZZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT9vf75c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT9vf75c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755179847; x=1786715847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujNqqmw37HpK17SD9lQ+WCCGBkeHr3vsWBoUcyQC8iU=;
  b=jT9vf75cxBBfFyX4FDkL9qFpYJVSdcVfyw2qR7OmSxLXqoBh1yaN5WGm
   w2uU3B3EpBhplP+A4nVofUtN02YQRQxPH7a2veaP04Y4aReKf4Hlbc4nd
   kzgGi0O0aNX9Pasa2b+tvJa3kLbW26OV6I8vmcF0UTlNmIUnzuK6W09jk
   ABgrC2qHVvzmoFLVxQgoHRxNVKUURQNK2dMMlCB+2kdhsPIugBf5J2UV+
   2MmU+yBNGMShE324LdJ1PhIty3nnzK9dbpnsjxyuOSCRS+H8vcUElXKrF
   owmyocJbvo+7t4VdWFp+bCPF+ATQheUTJm4nTK1hx8mpDkkYe3OJvb+X3
   g==;
X-CSE-ConnectionGUID: WN46QmncRpmjw2BRkbgvLw==
X-CSE-MsgGUID: XTcQVLU/RB6XG/w4iu3KVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="67765830"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="67765830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:57:27 -0700
X-CSE-ConnectionGUID: mzw7RXZwQpGDaXpEqeYvGQ==
X-CSE-MsgGUID: sSpas1ygRxCv7a41yTe5ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166402061"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Aug 2025 06:57:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umYRU-000B0c-21;
	Thu, 14 Aug 2025 13:57:03 +0000
Date: Thu, 14 Aug 2025 21:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801] arch/arm/boot/dts/ti/omap/omap2420-h4.dtb:
 gpio@4801c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
Message-ID: <202508142120.kRm5acES-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux: Convert adi,adgs1408 to DT schema
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250814/202508142120.kRm5acES-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142120.kRm5acES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508142120.kRm5acES-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@48018000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801a000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801a000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801a000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801c000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801e000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801e000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpio@4801e000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpmc@6800a000 (ti,omap2420-gpmc): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpmc@6800a000 (ti,omap2420-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: gpmc@6800a000 (ti,omap2420-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@240000', 'partition@40000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2420-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2420-h4.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio (ti,twl4030-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/ti,twl4030-gpio.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio (ti,twl4030-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio (ti,twl4030-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: dss@48050000 (ti,omap2-dss): '#address-cells', '#size-cells', 'dispc@48050400', 'encoder@48050800', 'encoder@48050c00', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,omap2-dss.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): '#address-cells', '#size-cells', 'prcm@6000', 'scm@2000', 'target-module@20000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,omap2-l4.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: prcm@6000 (ti,omap2-prcm): 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/omap/prcm.yaml#
--
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900e000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900e000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900e000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49010000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49010000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49010000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49012000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49012000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49012000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@480b6000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@480b6000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@480b6000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '@[0-7],[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/gpmc@6e000000/ethernet@gpmc: failed to match any schema with compatible: ['smsc,lan91c94']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
