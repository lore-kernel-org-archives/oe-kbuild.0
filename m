Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0BA1448E0
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 22:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728080208; cv=none; b=iwE9pUja/v9RGNcmpvubIGL8zF528bdsf0Nb/CZyP3Ny/7/9XxYgii3sBd4ncZ/d9DBBdmkrSj9T6SWGnmDKIRFKn2GuT2phfxOLGa/IPw3beXnRbOKVvR0+AU7woCCNRlB1r1EBGHBRa2BvtM/5R2oYFaHs6hTPsTF7S/MczUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728080208; c=relaxed/simple;
	bh=S1zZJWNvxmdW1qp6FZ4l/jbMPHGDx72+Yz+la21nhLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbNJ5kkgW6NU54/GjrOGudGy4od6WGBk7PkPOoOk5u222Z7Oo5tyufA4SyX796WaRBromkRuKgKHSUaI8P7pBkluDYCQsjit78FgWSoAbCRyG+EABvqdR+/t4HlSg6yAq4ZpB57JPQ8hvcMtUy3fyDzQ4OGGPPbf1k91tw77OWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLNC1nJC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLNC1nJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728080207; x=1759616207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1zZJWNvxmdW1qp6FZ4l/jbMPHGDx72+Yz+la21nhLw=;
  b=TLNC1nJCD7LudiO3G9Fc2pJAgOhYQ4l+gxdg5t9IUgzwzOmTrWdRHGva
   hNGIo4XGs8XZRVBh8hUCpQPkr77YI2I81hZOlj+24u7z54Vt47nnmkGKG
   vhyUIJawzIL0KmFNPZy/9QtJI84xYK0Ov9WuQNcxMWJG9DHBP0nzyuiWi
   EzA58EfGhdzywV950bsQBjHZVxEcW5/aYlTt7zO16zpWurAuZZyfg71XT
   QyIAsdIBkI65/9gFgPtiZamL2jj9m6cCbSigPNWIxspwf9+rdZeLEKmUj
   5TThTgr21E5EtGabOPc3F6wCas4KHwZq/7vQE1aw2MN/+GkxZFLpcyGZm
   Q==;
X-CSE-ConnectionGUID: IsalQa7pRaC4K0pSouAqVw==
X-CSE-MsgGUID: l9SUIvdFQDOI2PMr1qe5rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27446765"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27446765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 15:16:45 -0700
X-CSE-ConnectionGUID: T6gNQSw9R96sdV0o+OykEQ==
X-CSE-MsgGUID: MJGj7itkTBqgduPx1c/waQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75658698"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2024 15:16:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swqbJ-0002HX-2d;
	Fri, 04 Oct 2024 22:16:41 +0000
Date: Sat, 5 Oct 2024 06:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:pending-fixes 236/374]
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mcasp@100000: interrupts:
 [[54]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems':
 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
Message-ID: <202410050659.9rJ8osBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mcasp@100000: interrupts: [[54]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   19350293efa2819a2403599c4e46643ee7bfb88f
commit: 17d8adc4cd5181c13c1041b197b76efc09eaf8a8 [236/374] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20241003 (https://download.01.org/0day-ci/archive/20241005/202410050659.9rJ8osBj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050659.9rJ8osBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410050659.9rJ8osBj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: sata@218000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mdio@224000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mcasp@100000: interrupts: [[54]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: mcasp@100000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: /aemif@68000000/cs3/nand@2000000,0: failed to match any schema with compatible: ['ti,davinci-nand']
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: gpio-keys: 'user1', 'user2' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lcdk.dtb: vga-bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
--
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml#
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mdio@224000: 'bus_freq' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mdio@224000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: mcasp@100000: interrupts: [[54]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-enbw-cmc.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
--
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@200000/dma-controller@201000: failed to match any schema with compatible: ['ti,da830-cppi41']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: sata@218000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/ti,da850-ahci.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@21a000: failed to match any schema with compatible: ['ti,da850-pll1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: mdio@224000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,davinci-mdio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/ethernet@220000: failed to match any schema with compatible: ['ti,davinci-dm6467-emac']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/usb@225000: failed to match any schema with compatible: ['ti,da830-ohci']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: mcasp@100000: interrupts: [[54]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
>> arch/arm/boot/dts/ti/davinci/da850-evm.dtb: mcasp@100000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: cs3: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /aemif@68000000/cs3/nand@2000000,0: failed to match any schema with compatible: ['ti,davinci-nand']
   arch/arm/boot/dts/ti/davinci/da850-evm.dtb: /panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
--
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: bt_clock_en: $nodename:0: 'bt_clock_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: bt_pic_en: $nodename:0: 'bt_pic_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: bt_pic_rst: $nodename:0: 'bt_pic_rst' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: bt_pic_cts: $nodename:0: 'bt_pic_cts' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/clock-controller@227000: failed to match any schema with compatible: ['ti,da850-psc1']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/pin-controller@22c00c: failed to match any schema with compatible: ['ti,da850-pupd']
>> arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: mcasp@100000: interrupts: [[54]] is valid under each of {'type': 'array', 'maxItems': 1, 'minItems': 1}, {'minItems': 1, 'type': 'array', 'maxItems': 2}
   	from schema $id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /soc@1c00000/display@213000: failed to match any schema with compatible: ['ti,da850-tilcdc']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: /aemif@68000000: failed to match any schema with compatible: ['ti,da850-aemif']
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: gpio_keys: 'back', 'center', 'down', 'left', 'right', 'up' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: leds: 'left_green', 'left_red', 'right_green', 'right_red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: regulator1: Unevaluated properties are not allowed ('over-current-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
   arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dtb: memory@ffff0000: compatible: ['syscon', 'simple-mfd'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
