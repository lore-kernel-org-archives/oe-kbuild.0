Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E97929CE7
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875948; cv=none; b=RGfX0aFiEKhO5MHokxQdXXNFZApqEa/+UpYJeIgJc5HTD48/8upG5IHI8/tK8Z2UcFbP6jCLjROJzDFMCQKc0g0qhsRLTaT7gAwuIKJl16CX6bMyplsTd3F0hJRB7ZboTmp6FbbrAiPBcTPs4Pb2/p2ZKbcvo1ji9+HARRxL93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875948; c=relaxed/simple;
	bh=WmbFphjEPtHZHgH9bmoGv/ZbI/vhilUZYqpKKxhTHx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXcjjy+VwjYrLeiNEQO1akdmGhTOt3Dj8Ih5X1DLeqcNpedpkSPd5oSIgdoS74fRlh4Nyx/Z4TPByuoY6OmXVn2XCsGE+S02QrGw15yMQNCEbGQHeH/4YhX1+k9/Sbw+PZ7hinPpLjZbZhJUtbeZJ+M02ZMmKYmHSrPY7IaxZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqQmHO0R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqQmHO0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727875946; x=1759411946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmbFphjEPtHZHgH9bmoGv/ZbI/vhilUZYqpKKxhTHx8=;
  b=cqQmHO0Re4eYYqGfp6QE7ZbCRTDcV6uR5johQtnL0AF31M/wOGTFxVHF
   JvN+agE1I8fU3Y2uwbo/TxGHyZj7GXilE4GqQALlbbqYHfwzk4W8sXncw
   iOrsol2Y/mHo7CLXyxfSmeJMWjxZLr4Y5nxF3TR0ecNjxwrhUZ2mNzfWx
   l1pURH5SkjnC59vRFOh2sjOZkfPTwU5leWaXdlvrKfd/SU22Wr0WrzxTf
   xsjS5L9CVZUGZkXnDkOkByvlwZVE3LKTZEvIpqN1xj3+O6CL8iMNqJsqR
   7/bbuE7SuuQM6FwqFsUsVKzrrZr/6vGeNrf6g7QJG5Hzey1ogLztLwGUv
   Q==;
X-CSE-ConnectionGUID: h+IsoWqlScmhDpMn7Z+k4w==
X-CSE-MsgGUID: npXWEIYERCKgi+gkKvBRZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37628996"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="37628996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 06:32:26 -0700
X-CSE-ConnectionGUID: gtmgjFBXQGO8vMLxfysVTw==
X-CSE-MsgGUID: ecyUy++5QaWBWUdwUuQnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78962312"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2024 06:32:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svzSo-000SGF-05;
	Wed, 02 Oct 2024 13:32:22 +0000
Date: Wed, 2 Oct 2024 21:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-sound:for-6.13 11/21]
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: audio-codec@1c:
 Unevaluated properties are not allowed ('clock-names', 'clocks',
 'realtek,ldo1-en-gpios' were unexpected)
Message-ID: <202410022140.2d6RQyEh-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.13
head:   436bf27903ee56a242bcd373053dd8d1b5d17915
commit: eba5a0bac211075b9673139df42bab955e984fce [11/21] ASoC: dt-bindings: realtek,rt5640: Convert to dtschema
:::::: branch date: 24 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-054-20241001 (https://download.01.org/0day-ci/archive/20241002/202410022140.2d6RQyEh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022140.2d6RQyEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410022140.2d6RQyEh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: serial@70006200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra114-hsuart', 'nvidia,tegra30-hsuart'] is too long
   	'nvidia,tegra114-hsuart' is not one of ['nvidia,tegra20-hsuart', 'nvidia,tegra30-hsuart', 'nvidia,tegra186-hsuart', 'nvidia,tegra194-hsuart']
   	'nvidia,tegra124-hsuart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: serial@70006200: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /serial@70006200: failed to match any schema with compatible: ['nvidia,tegra114-hsuart', 'nvidia,tegra30-hsuart']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: bluetooth: reset-gpios: False schema does not allow [[20, 134, 1]]
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks', 'realtek,ldo1-en-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: audio-codec@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
--
   arch/arm/boot/dts/nvidia/tegra114.dtsi:725.15-735.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:765.15-775.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra114-ictlr', 'nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra114-ictlr', 'nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra114-apbdma']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: rt5640@1c: Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps51632@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65090@48: failed to match any schema with compatible: ['ti,tps65090']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1147.15-1157.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra124-ictlr', 'nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra124-ictlr', 'nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: audio-codec@1c: Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: core-regulator@60: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77663']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77663']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: audio-codec@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: rt5640@1c: Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /i2c@7000d000/tps65911@2d: failed to match any schema with compatible: ['ti,tps65911']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps62361@60: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
