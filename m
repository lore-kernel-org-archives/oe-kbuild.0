Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C7335BA
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379387; cv=none; b=IjVsmGF47tiYO3lUZufMXlxHj0+Cp8HILrpbz5GFxWGbv7mrxVpshDSs6EggJJS7V9X1HB7+ZVXZFwzNhgoccUIzafRrDHhxboX/Q+ZaU4iOEbcYGlvEgX4GAmuofTlzxu8+I//myfDIADYeMC041xooi5kzq6PHLLm1vbNHECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379387; c=relaxed/simple;
	bh=/BhMgQ4YtOPoh4merhXAWNMMw3jDmmrGQZO3kwXCKRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkBK4h+floypnRjtCXFDjRTA8tpAvJ/OHzArSCKQF/Vy2J0q40xN2Mg56gh8pVm52cesrtB9A6a6HrwN5nIow9DQDclp96LtoRdGRwss6mXvhI1jHPLw2XhsVw5E61T7w7/vdf9W/IIpgQ+gIV2XGL8rU2t64QM+UcWCkhNf2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXduHjx5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXduHjx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784379386; x=1815915386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BhMgQ4YtOPoh4merhXAWNMMw3jDmmrGQZO3kwXCKRo=;
  b=CXduHjx5CLmWu08ltstNLAZLd2ZmoUEFbaB7p3kxw6kKBBICBaP6eUyU
   su8L40tvYsTOfrwtnkGyM7SFot5XOM1pqtOuX8FqWn+4fwGuGAXjPidGi
   bygtCj5L0FveX61XIQMThlUDiMIHDUEtpNMk8ePSBlbOjzaSR9+3i9ccH
   TKpeiGZwJY/oiI24vx27Ma/Or3mZic1mmBlm4oYU0J4KFKpHktBR7RzT3
   WqW6vV1mKNUhHtuqbm3ZwtXLGZuynclKN6eUWmK2y1+0bAf9rUOkadW+F
   aUFzospvo/LiTHruR8fk4x93vG5xt0P1jMIE8vyTDO118J8f/9IBhCg5o
   g==;
X-CSE-ConnectionGUID: kzpP3uyWQyKto7vqL8jwlA==
X-CSE-MsgGUID: 4jqdQiTcQ+69R/NcWkp2zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102448723"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="102448723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 05:56:25 -0700
X-CSE-ConnectionGUID: rbzwQ0HjStSa+zvaGiNOoQ==
X-CSE-MsgGUID: l9Qqi4tlT3ef+KmK6yvwSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="256457261"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Jul 2026 05:56:24 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4ab-000000005pF-0ZSt;
	Sat, 18 Jul 2026 12:56:21 +0000
Date: Sat, 18 Jul 2026 14:56:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Message-ID: <202607181400.9LRShl0x-lkp@intel.com>
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
In-Reply-To: <20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com>
References: <20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com>
TO: Bhargav Joshi <j.bhargav.u@gmail.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Axel Haslam <ahaslam@baylibre.com>
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: goledhruva@gmail.com
CC: m-chawdhry@ti.com
CC: daniel.baluta@gmail.com
CC: simona.toaca@nxp.com
CC: j.bhargav.u@gmail.com

Hi Bhargav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ef0c9f75a19532d7675384708fc8621e10850104]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargav-Joshi/dt-bindings-usb-ti-da830-ohci-Convert-to-DT-schema/20260717-054535
base:   ef0c9f75a19532d7675384708fc8621e10850104
patch link:    https://lore.kernel.org/r/20260717-ti-da830-ohci-v1-1-3f2d111a2042%40gmail.com
patch subject: [PATCH] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260717 (https://download.01.org/0day-ci/archive/20260718/202607181400.9LRShl0x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181400.9LRShl0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607181400.9LRShl0x-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/spi@41000: failed to match any schema with compatible: ['ti,da830-spi']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/spi@30e000: failed to match any schema with compatible: ['ti,da830-spi']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@200000: failed to match any schema with compatible: ['ti,da830-musb']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mdio@224000 (ti,davinci_mdio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: usb@225000 (ti,da830-ohci): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: nand@2000000,0 (ti,davinci-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml
--
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/usb@200000: failed to match any schema with compatible: ['ti,da830-musb']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mdio@224000 (ti,davinci_mdio): 'bus_freq' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mdio@224000 (ti,davinci_mdio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
>> arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: usb@225000 (ti,da830-ohci): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
--
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/spi@41000: failed to match any schema with compatible: ['ti,da830-spi']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/spi@30e000: failed to match any schema with compatible: ['ti,da830-spi']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@200000: failed to match any schema with compatible: ['ti,da830-musb']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: mdio@224000 (ti,davinci_mdio): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: usb@225000 (ti,da830-ohci): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: display@213000 (ti,da850-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: adc@3 (ti,ads7957): 'ti,spi-wdelay' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads7950.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/spi@30e000: failed to match any schema with compatible: ['ti,da830-spi']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/usb@200000: failed to match any schema with compatible: ['ti,da830-musb']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: sata@218000 (ti,da850-ahci): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
>> arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: usb@225000 (ti,da830-ohci): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: display@213000 (ti,da850-tilcdc): 'clock-names', 'clocks', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: gpio_keys (gpio-keys): 'back', 'center', 'down', 'left', 'right', 'up' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: leds (gpio-leds): 'left_green', 'left_red', 'right_green', 'right_red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
