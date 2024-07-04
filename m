Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565813D276
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720124753; cv=none; b=tLqvZ2SDt4a4XzvlIc5LzDqr7tJ9G15WFjd6HRQ74/+EZ9Jl2BMVeow73uKU72CfzIfk6u2NC1xd0DXncAe+/1ACNWyw8/a6nxPEnZCFPcJKcDEDauBGSqqzwpJJue+PzLy1KkMVSmq2c0qPBV/+NvslXjKs0ci8wCXxJUMVOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720124753; c=relaxed/simple;
	bh=m6aLeH5JM5Uli+EJbOdos25ry/l01v0cKcfMUUbaCEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wq1HYx6o3tDi3R0+usZfm8VYHcfxEFDXATduP1A+4M/CJwyw1jj51jQpw6EH/OAAB0KpUgkfv5RRMaWRupS6t+du/zUIzgkAqryj6R9m1FMB2CUl1XaKlTFjcVv8Blm5LXa8Dt+ZdsssB22wwXYIsTJaQEFP2V+W/bAe0cLBDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8//4XaJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8//4XaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720124750; x=1751660750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m6aLeH5JM5Uli+EJbOdos25ry/l01v0cKcfMUUbaCEY=;
  b=M8//4XaJCLok8NsnjUMBgerPwQOmOzQ1imX5w9XPhWhife7eBc8Q0MBv
   nK5oJ/UHjvnhQ8AyPK4QbeS550FNwL+dBHFkPU5YTdToB2caTQXCAeksG
   OGDq2U/FgwAjVF3yZh9G8Yj5RvlyEU0cDi+rQbJ0Osstkte/rbCPx7+WX
   4s/jin98UwIWTVdfSzp2lNuch6UDoFN/yks/UgbXWxInhNUpdm73SPI+K
   7/dKgJ1X+jZ1FQKnnzMDvZtR7kIEWuvsX3tNoX+JkuHZ4br8WuBDbe352
   iLT8mVzHK666Cq4meRMIKYEwCQsiliCQcr67Hhohv+KNJoJke/3zIqjie
   Q==;
X-CSE-ConnectionGUID: ZYcSOcN7RxWGq5ST8JPP+Q==
X-CSE-MsgGUID: SDn2hU2/SQOZCS/hZ5ow2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17548954"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17548954"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 13:25:50 -0700
X-CSE-ConnectionGUID: +fQ9GXxCSemfizHWxPX9OQ==
X-CSE-MsgGUID: 7L4t0ljrRnua5kbo4F03oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="69895115"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2024 13:25:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPT1V-000RPc-1O;
	Thu, 04 Jul 2024 20:25:45 +0000
Date: Fri, 5 Jul 2024 04:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] dt-bindings: net: Define properties at top-level
Message-ID: <202407050331.AlIVvOyL-lkp@intel.com>
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
In-Reply-To: <20240625215442.190557-2-robh@kernel.org>
References: <20240625215442.190557-2-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Felix Fietkau <nbd@nbd.name>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Giuseppe Cavallaro <peppe.cavallaro@st.com>
TO: Jose Abreu <joabreu@synopsys.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-net-Define-properties-at-top-level/20240626-091748
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240625215442.190557-2-robh%40kernel.org
patch subject: [PATCH net-next] dt-bindings: net: Define properties at top-level
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240705/202407050331.AlIVvOyL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050331.AlIVvOyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050331.AlIVvOyL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3015.17-3072.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3089.17-3125.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #interrupt-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: display@14f06000: clocks: [[37, 14], [37, 43], [37, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3015.17-3072.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3089.17-3125.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #interrupt-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: display@14f06000: clocks: [[37, 14], [37, 43], [37, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3015.17-3072.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3089.17-3125.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #interrupt-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3015.17-3072.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3089.17-3125.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,axi-config', 'snps,clk-csr', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic@34: charger:usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: charger: usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: regulator: buck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: regulator: buck2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: regulator: ldo1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000: i2c0-pins:pins: 'mediatek,drive-strength-adv' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000: i2c1-pins:pins: 'mediatek,drive-strength-adv' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000: i2c4-pins:pins: 'mediatek,drive-strength-adv' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: display@14f06000: clocks: [[30, 14], [30, 43], [30, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3015.17-3072.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3089.17-3125.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ethernet@11021000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,axi-config', 'snps,clk-csr', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3015.17-3072.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3089.17-3125.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ethernet@11021000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,axi-config', 'snps,clk-csr', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ethernet@11021000: snps,txpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ethernet@11021000: snps,rxpbl: False schema does not allow [[16]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: display@14f06000: clocks: [[30, 14], [30, 43], [30, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
