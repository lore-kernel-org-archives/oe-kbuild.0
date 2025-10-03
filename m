Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9E292B4B
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759507355; cv=none; b=XUOHe1oIbtOM3mFI3pZUN5ZiU0GsXD6F1m1jAqQsWskI6714OAwrhg09Km3p8D1nmXj3wF2QhP3KlbPbGmLi8iqZLVQVulydLbsjUD0ce267HuPYt4PxkMxxIC3QS4c8MMwMZsdTB9GrEAY/bLAxaCUECVcNFaUDKfLMJN9CPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759507355; c=relaxed/simple;
	bh=/MCMJdhncWwFEcBIdWKlNZvvthJKXjlvmojh9C0HAs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W62nZB2cXTiMwUJfSi5GE996BpJKt68WoQ4ROJ62JM6zKc84IQlTp1FDGT0GatY8/hnqf7oLaNnynh5AWSkpf6nUckybHxin7oe001IHSeIB768CjiAOsmkEhtydHUJoij4m8k9A0Wjzu2vI+mVZHrvKwfMhqoM25p8JQL5XgT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaoDok+1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaoDok+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759507352; x=1791043352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MCMJdhncWwFEcBIdWKlNZvvthJKXjlvmojh9C0HAs4=;
  b=LaoDok+1ufr0ZLiT6oxvSq/4WEh6rGgm+LuhUKU1f+ncNO2IwvsRIBjW
   ZYNBHKOUWRFyiBTk2VSP+aUkbfRk/tPDILypx3UZU5ugAolAfuZDvglYJ
   IF4TKnMFEjn+VjIzP9fAuBmexXtPE/y0ap0C3B4A7NaSmJkq6mM5v5DAI
   rleNlW9gkIiDTWsaRw9hUgZxq73HfWtyO8tSYKcRk1zvBvxyWeg/Z6qOs
   PiF4xOJ3MLUcGkwD7/S96gLOClRiDefgV39AuNvPzr45JRBz/eoFaL1z4
   2qR6uY4zFG0N6ueKGRUPvkWxG1dcCg4VhBHmTTVERXk38rRWL0BVPFgYr
   w==;
X-CSE-ConnectionGUID: NxfthxRCQeCl6XQElkOGKA==
X-CSE-MsgGUID: jZvRlgk7TkSYZaCHyc+3Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61678879"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="61678879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 09:02:31 -0700
X-CSE-ConnectionGUID: 2jxFQu+gQm6mnmZhEmMCCw==
X-CSE-MsgGUID: yOjT92k4SyiFJvSvBhZn7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="210304999"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Oct 2025 09:02:28 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4iEk-0004dv-1l;
	Fri, 03 Oct 2025 16:02:26 +0000
Date: Sat, 4 Oct 2025 00:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next 5/5] dt-bindings: net: dsa: mv88e6xxx: add
 mv88e6xxx-avb-mode property
Message-ID: <202510032353.Ih0pxMv2-lkp@intel.com>
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
In-Reply-To: <20250927070724.734933-6-lukeh@padl.com>
References: <20250927070724.734933-6-lukeh@padl.com>
TO: Luke Howard <lukeh@padl.com>

Hi Luke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-Howard/net-dsa-mv88e6xxx-add-num_tx_queues-to-chip-info-structure/20250927-155031
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250927070724.734933-6-lukeh%40padl.com
patch subject: [RFC net-next 5/5] dt-bindings: net: dsa: mv88e6xxx: add mv88e6xxx-avb-mode property
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-053-20250929 (https://download.01.org/0day-ci/archive/20251003/202510032353.Ih0pxMv2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032353.Ih0pxMv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510032353.Ih0pxMv2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: / (zii,imx51-rdu1): i2c-gpio: {'compatible': ['i2c-gpio'], 'pinctrl-names': ['default'], 'pinctrl-0': [[47]], 'sda-gpios': [[17, 2, 0]], 'scl-gpios': [[31, 4, 0]], 'i2c-gpio,delay-us': [50], 'status': ['okay'], '#address-cells': 1, '#size-cells': 0, 'codec@a': {'compatible': ['fsl,sgtl5000'], 'reg': [[10]], 'clocks': [[48]], 'VDDA-supply': [[49]], 'VDDIO-supply': [[50]], '#sound-dai-cells': 0, 'phandle': 57}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@70000000/spba-bus@70000000/spi@70010000/pmic@0: failed to match any schema with compatible: ['fsl,mc13892']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: owire@83fa4000 (fsl,imx51-owire): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/w1/fsl-imx-owire.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: audmux@83fd0000 (fsl,imx51-audmux): 'aud3', 'ssi2' do not match any of the regexes: '^mux-[0-9a-z]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/imx-audmux.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@80000000/nand-controller@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: nand-controller@83fdb000 (fsl,imx51-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /mdio/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
--
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /soc/bus@70000000/spba-bus@70000000/spi@70010000/pmic@0: failed to match any schema with compatible: ['fsl,mc13892']
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: owire@83fa4000 (fsl,imx51-owire): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/w1/fsl-imx-owire.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /soc/bus@80000000/nand-controller@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: nand-controller@83fdb000 (fsl,imx51-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /mdio/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
--
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: pmic@58 (dlg,da9063): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /mdio/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
--
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: pmic@58 (dlg,da9063): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /mdio/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
--
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: pmic@58 (dlg,da9063): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /mdio/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/ethernet@400d1000/mdio/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /mdio-mux/mdio@1/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /mdio-mux/mdio@2/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /mdio-mux/mdio@4/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /mdio-mux/mdio@8/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/ethernet@400d1000/mdio/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/ethernet@400d1000/mdio/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/ethernet@400d1000/mdio/ethernet-switch@0/mdio-external: failed to match any schema with compatible: ['marvell,mv88e6xxx-mdio-external']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/ethernet@400d1000/mdio/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
>> Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml: ignoring, error parsing file
--
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,orion-devbus']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/wdt@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: dma-controller@60900 (marvell,orion-xor): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,orion-eth']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/ethernet-controller@72000/ethernet-port@0: failed to match any schema with compatible: ['marvell,orion-eth-port']
>> arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/mdio-bus@72004/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/pinctrl@10000: failed to match any schema with compatible: ['marvell,88f5181-pinctrl']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: pinctrl@10000 (marvell,88f5181-pinctrl): pmx-pci-gpios: {'marvell,pins': ['mpp4'], 'marvell,function': ['gpio'], 'phandle': 13} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: sa-sram (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dtb: sa-sram (mmio-sram): $nodename:0: 'sa-sram' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: internal-regs (simple-bus): gpio-fan: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
>> arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@10: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: mvsdio@d4000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/thermal@18300: failed to match any schema with compatible: ['marvell,armada370-thermal']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-370-cpu-config']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/audio-controller@30000: failed to match any schema with compatible: ['marvell,armada370-audio']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: sa-sram (mmio-sram): 'reg-names' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
>> arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0/mdio-external: failed to match any schema with compatible: ['marvell,mv88e6xxx-mdio-external']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
--
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable', 'vmmc', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
--
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6190']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable', 'vmmc', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
--
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
--
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
--
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
--
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
--
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@10: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
--
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'no-1-8-v', 'vmmc-supply', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
--
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-380-pmsu']
>> arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@4: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'no-1-8-v', 'vmmc-supply', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
--
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-a0-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv78230-pinctrl']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-xp-wdt']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
>> arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/mdio@72004/ethernet-switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/thermal@182b0: failed to match any schema with compatible: ['marvell,armadaxp-thermal']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-xp-cpu-config']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: sa-sram0 (mmio-sram): $nodename:0: 'sa-sram0' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/marvell/armada-xp-linksys-mamba.dtb: sa-sram1 (mmio-sram): $nodename:0: 'sa-sram1' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/mdio-bus@72004/switch@11: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
--
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@1,0:interrupts: [[9], [44]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/mdio-bus@72004/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-dir665.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
--
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@20 (semtech,sx1505q): $nodename:0: 'gpio-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: gpio-expander@21 (semtech,sx1505q): $nodename:0: 'gpio-expander@21' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/i2c@11000/rtc@30: failed to match any schema with compatible: ['s35390a']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/mdio-bus@72004/switch@10: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/mdio-bus@72004/switch@11: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
--
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: pcie@82000000 (marvell,kirkwood-pcie): pcie@2,0:interrupts: [[10], [45]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6282-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/mdio-bus@72004/switch@10: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
--
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: flash@0 (mxicy,mx25l12805d): Unevaluated properties are not allowed ('mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/mdio-bus@72004/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
--
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/mdio-bus@72004/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-z0.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
--
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: ocp@f1000000 (simple-bus): $nodename:0: 'ocp@f1000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/pin-controller@10000: failed to match any schema with compatible: ['marvell,88f6281-pinctrl']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: pin-controller@10000 (marvell,88f6281-pinctrl): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/system-controller@20000: failed to match any schema with compatible: ['marvell,orion-system-controller']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/watchdog-timer@20300: failed to match any schema with compatible: ['marvell,orion-wdt']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
>> arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/mdio-bus@72004/switch@0: failed to match any schema with compatible: ['marvell,mv88e6085']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rd88f6281-a.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
