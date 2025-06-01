Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8FE2D3204
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820940; cv=none; b=QOUYz6k9OAo1/3JoG62tlEI6W0o6rR5ojdx6vB4rUwoagHlz5jqEydghGjXRuVOsAHga47fEPT+wt+TgxVElrKKlgO1ES2CVEDJ/ZaISFq1RpD2QW88aXUtiZ0zjCeYx+53sixXsZP10Vf8y3RNVzNeh3By4YZVyuTjdio0Cssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820940; c=relaxed/simple;
	bh=8A0UZrxV9Y5GNrpfiaDbiAgjTm3Gm+ohcjvolNfnc3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BavLmQIlntfOQL2H1HGa7W+UD+A+n/L4qsOx3cv/GqzbWOGwyna/kzTndX30U+R6fq/yswjY38CAFYz2KduPZFmc4T8NpESKxbIPirljUkUBPf3uQRikg3WrJZm/6Q6klvlvLiWNvfpjbAildhoQE5fWcuXaKe+bZnciXKe92FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKG0EKe1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKG0EKe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748820938; x=1780356938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8A0UZrxV9Y5GNrpfiaDbiAgjTm3Gm+ohcjvolNfnc3E=;
  b=lKG0EKe1yvE/DKjZvWqF76UuZlBxsOlbkP9ox/mttS+B+1Q/iDCSS62I
   4gFwV1b3cY4Dgya83Z6qXKm0c0grCJFf3MKx8wTYgIP/LW+Oep9hFTquW
   SI607Zj8J9nuRQOjVMQzq/YLHvwOsXXxm65H2l0vrf37lFf00bvl5uOn9
   i/rzf/oj8jzC5/u6/i0eHMbygeJugDDIDSStJBrfQUaAwQGeZpE/4SQMX
   E6Bshst8PdAThTu2MV3EoDyJNwEw03Cl/8N0QzUg7v8ibKS6mLlpPdtHS
   m6gsTQgR5qLHCYkZp4reg/yQaqer7tAI0kTA9bQfEM5XQK7h1Fl+mZtvu
   A==;
X-CSE-ConnectionGUID: J3dr9kh9RKylj8/7W3RQlw==
X-CSE-MsgGUID: BONd6Lk6SLG2c5vK4oH6/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50980232"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="50980232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 16:35:37 -0700
X-CSE-ConnectionGUID: 7nH2v6G4TrisZhfglwrUKQ==
X-CSE-MsgGUID: mzqh3kT5TB+nEgPZ+ylflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="181577387"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Jun 2025 16:35:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLsDF-000Z6u-1L;
	Sun, 01 Jun 2025 23:35:33 +0000
Date: Mon, 2 Jun 2025 07:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI
 example
Message-ID: <202506020733.fAyQ9C80-lkp@intel.com>
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
In-Reply-To: <20250528203152.628818-1-corentin.guillevic@smile.fr>
References: <20250528203152.628818-1-corentin.guillevic@smile.fr>
TO: Corentin Guillevic <corentin.guillevic@smile.fr>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: UNGLinuxDriver@microchip.com
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Vasut <marex@denx.de>
CC: Corentin Guillevic <corentin.guillevic@smile.fr>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Corentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Guillevic/dt-bindings-net-dsa-microchip-add-bit-banged-SMI-example/20250529-043300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528203152.628818-1-corentin.guillevic%40smile.fr
patch subject: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI example
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250602/202506020733.fAyQ9C80-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020733.fAyQ9C80-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506020733.fAyQ9C80-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: sdio-host@a0000000 (atmel,sama5d2-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: sdio-host@b0000000 (atmel,sama5d2-sdhci): $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: hlcdc@f0000000 (atmel,sama5d2-hlcdc): 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/flexcom@f8034000/spi@400/ksz8563@0: failed to match any schema with compatible: ['microchip,ksz8563']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/timer@f8048030: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: watchdog@f8048040 (atmel,sama5d4-wdt): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/pinctrl@fc038000: failed to match any schema with compatible: ['atmel,sama5d2-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/secumod@fc040000: failed to match any schema with compatible: ['atmel,sama5d2-secumod', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama5d2_icp.dtb: /ahb/apb/chipid@fc069000: failed to match any schema with compatible: ['atmel,sama5d2-chipid']
--
   	'atmel,samv71' was expected
   	'atmel,sama5' was expected
   	'microchip,sama7d6' was expected
   	'microchip,sama7' was expected
   	'microchip,lan966' was expected
   	'atmel,samv7' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /: failed to match any schema with compatible: ['microchip,sama5d3-ksz9477-evb', 'atmel,sama5d36', 'atmel,sama5d3', 'atmel,sama5']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/spi@f8008000/switch@0: failed to match any schema with compatible: ['microchip,ksz9477']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: /ahb/apb/ramc@ffffea00: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: i2c0: i2c0-gpio: {'atmel,pins': [[0, 30, 0, 0, 0, 31, 0, 0]], 'phandle': 17} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: i2c1: i2c1-gpio: {'atmel,pins': [[2, 26, 0, 0, 2, 27, 0, 0]], 'phandle': 20} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dtb: i2c2: i2c2-gpio: {'atmel,pins': [[0, 18, 0, 0, 0, 19, 0, 0]], 'phandle': 48} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: /mdio/switch@0: failed to match any schema with compatible: ['microchip,ksz8873']
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: /mdio/switch@0: failed to match any schema with compatible: ['microchip,ksz8873']
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: /mdio/switch@0: failed to match any schema with compatible: ['microchip,ksz8873']
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: /mdio/switch@0: failed to match any schema with compatible: ['microchip,ksz8873']
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: /mdio/switch@0: failed to match any schema with compatible: ['microchip,ksz8873']
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: /soc/bus@5c007000/spi@44009000/switch@0: failed to match any schema with compatible: ['microchip,ksz9563']
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: /soc/bus@5c007000/spi@44009000/switch@0: failed to match any schema with compatible: ['microchip,ksz9563']
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: /soc/bus@5c007000/spi@44009000/switch@0: failed to match any schema with compatible: ['microchip,ksz9563']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
