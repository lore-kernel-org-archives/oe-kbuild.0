Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9513D244
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578382; cv=none; b=UuJwk1QrxfLCgQB0hqSYSuseivmCUjuSTKYfxuT6p1bNNS48Ie2F64Ye2hjbzkIXr7UTxwM60JEJKOZlCvq83Bh5JnXFg171kyA/HSji2ip+RwkbE8pm4S5vQph0DgQG+cm2dqWAlmZ8CLVZdiLBaYEvYKTQaeDcg+E40ob7yDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578382; c=relaxed/simple;
	bh=xFaWhE9W+9i4aHWw01PPkXrf2P7aZ6pnYoLfizkpoIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhTYClq7q2hqHrxNc0Xf0OHSQqKwJcz/wBjWAakbgDIXHwEoYHCXs5+s6FOQd+64YkMErn5m0kgYijmto/1RnfELbSY8vJ3oX1V94zS8AKPOaj3XAVvoPsmEYpvOFdZj+fLbLYoZPtIyp0igFosLJOdotslHt219n1y8wvsjdTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wlc94m7S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wlc94m7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729578380; x=1761114380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFaWhE9W+9i4aHWw01PPkXrf2P7aZ6pnYoLfizkpoIg=;
  b=Wlc94m7SgWdw3ULZfxZpwfSNrHEtjmuK97SiiXmkA1Q6mU2XKT6XEkaL
   exNxtG2I0P6nHU/9X9ki6lTckzGt7siCzbsMZYuF0VEL15gBxgIzZHX53
   O/ppJxxcClcj0e59oLkNydHEsWJ9pKHXEkNSc1/hoyZY1z6MzhFkd7sXA
   cmSTxZCFdbK3LXG3LK51iroNI6l1W9DCameu6wDFgs6Yh9js4lns8VZ7k
   r8LGafgSX5oZD8ImC6OgKCq022SuuqN5aszxJvWym7O4fMJjdDuteSFGP
   PtlHUYbFmIz3OPdsWttU7daKdWyZCiw97Skgo1lOZi4H4AeA31SGl/foK
   w==;
X-CSE-ConnectionGUID: BUro/1vSTguRPHnY1avYzg==
X-CSE-MsgGUID: hxpe+LorT7qA8c0+3ucFDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39635047"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39635047"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 23:26:19 -0700
X-CSE-ConnectionGUID: HehDqADpTyShu+/5TgY2aA==
X-CSE-MsgGUID: zD8LFEYxRD+71U2FWl3tcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79395793"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2024 23:26:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t38LP-000TAg-20;
	Tue, 22 Oct 2024 06:26:15 +0000
Date: Tue, 22 Oct 2024 14:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-misc:regulator-6.13 7/8]
 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: pmic@3c: regulators:sw1:
 Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt'
 was unexpected)
Message-ID: <202410221450.eMNWAsbz-lkp@intel.com>
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
TO: Marek Vasut <marex@denx.de>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git regulator-6.13
head:   15767191c26d74f7cc2d03fa2ede0d6d0051218e
commit: eab92ea3c1c31b6917fa1665ac8a30c21d9eabfa [7/8] dt-bindings: regulator: lltc,ltc3676: convert to YAML
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20241021 (https://download.01.org/0day-ci/archive/20241022/202410221450.eMNWAsbz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221450.eMNWAsbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410221450.eMNWAsbz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:905.28-913.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: pmic@3c: regulators:sw1: Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
--
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: gsc@20: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: gsc@20: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /soc/bus@2100000/i2c@21a4000/keypad@34: failed to match any schema with compatible: ['ti,tca8418']
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('linux,phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: gpio-keys: 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: gsc@20: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: gsc@20: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('linux,phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: pmic@3c: regulators:sw4: Unevaluated properties are not allowed ('linux,phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: gpio-keys: 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dtb: /sound: failed to match any schema with compatible: ['fsl,imx-audio-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:905.28-913.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6q-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: pmic@3c: regulators:sw1: Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
   arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: gpio-keys: '#size-cells' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6q-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: gsc@20: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: gsc@20: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/bus@2100000/i2c@21a4000/keypad@34: failed to match any schema with compatible: ['ti,tca8418']
>> arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('linux,phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: gpio-keys: 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6q-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: gsc@20: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: gsc@20: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('linux,phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: pmic@3c: regulators:sw4: Unevaluated properties are not allowed ('linux,phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: gpio-keys: 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dtb: /sound: failed to match any schema with compatible: ['fsl,imx-audio-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:905.28-913.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: pmic@3c: regulators:sw1: Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: pmic@3c: regulators:sw3: Unevaluated properties are not allowed ('regulator-suspend-mem-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/lltc,ltc3676.yaml#
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
