Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F52DAFAA
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379935; cv=none; b=RgOFa2v5LmGFpBJdB2Bva593rfGejWgWYz/cu9VKlnTGMiU+qoK0Bg5w4cHfP0VGPRgys/tf89HtPU0uVYRbrY9Zr28rqK/9jSBRe856Zq/0/qlimAJ6awW9nrt91SeQsWk2ESxaDMiCfk34fq5irnnNjIUxMVDRwo7B0KoJevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379935; c=relaxed/simple;
	bh=mS1E58E4irpkjwMUkQrhMoynDRYqvmwtnlw0NmUge20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sf5FcDwnmnvvTinZDFzaU6FrJDn7/JNBnqv47yAPUeZH1r7wmFTAEWoB0zGCXdNV+5mTxDv0rRxEH7zzy2YV+t0QPWPtRkdMXn/QTeQr30jLWeugdjklgB21UE9jTfP/oP0oHZVfYWA6/81/xE5grqzxRQrTRUA4lyla+F4JYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6nCckj6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6nCckj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762379934; x=1793915934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mS1E58E4irpkjwMUkQrhMoynDRYqvmwtnlw0NmUge20=;
  b=j6nCckj6f7Ewa4buAxrhzoPqy6NWb6W0S6IQM8i4aJJdknFl3hK++4/z
   ZmLYzaZ9dT5FwOkuTe6CXCOFIYu7LZ7nxhV5l23o1EA3Oi+JI71Ij+cQt
   o+xR1nCBqG57b53NacE3nOgBfdDO1lOmoR810hbVGhBpZgjPb6A2+TXdd
   ALrY7wKRKtu/TOXEVh2HZvY5iy4R6sgU6HF9H8OgJdHz6e6k1TW7yVKLx
   3c1hzdrGGgjzCdp7TnyR7gUjHaVYedMoak26gRMb9GBXZn93wLesWW9oB
   rLqA92QQBDtLSaDPqLECFkfHY6uabaod6QSV4SZrpCpk31iA3dnXlB2Ts
   A==;
X-CSE-ConnectionGUID: Xrb9XFzCTOK1Qj4fBwMuvg==
X-CSE-MsgGUID: 0EcU4NgqQGqL+J4q8TtjQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64545212"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64545212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 13:58:54 -0800
X-CSE-ConnectionGUID: jdCjM74HQF6x6yTzgDDGdw==
X-CSE-MsgGUID: D2bY5esHSga+f8di15vzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="192747840"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2025 13:58:53 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGlWk-000000002j2-1vD3;
	Wed, 05 Nov 2025 21:58:50 +0000
Date: Wed, 5 Nov 2025 22:58:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [alexandrebelloni:rtc-misc 15/19]
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: pinmux@800 (pinctrl-single):
 'pinmux_i2c1_pins', 'pinmux_rtc_nint_pins', 'spi1_pins_s0' do not match any
 of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
Message-ID: <202511052211.85cQpGJm-lkp@intel.com>
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
TO: Alexandre Belloni <alexandre.belloni@free-electrons.com>

tree:   https://github.com/alexandrebelloni/linux rtc-misc
head:   0d52d57ce82d23435901c63fd2ba89eb449d0a53
commit: 22c4a5f1d0bde0e39e26a13d2e90954765bf6698 [15/19] RTCs on BBB
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2052-20251102 (https://download.01.org/0day-ci/archive/20251105/202511052211.85cQpGJm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052211.85cQpGJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511052211.85cQpGJm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24: failed to match any schema with compatible: ['ti,tps65217']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: pinmux@800 (pinctrl-single): 'pinmux_i2c1_pins', 'pinmux_rtc_nint_pins', 'spi1_pins_s0' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@35000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@100000/target-module@a0000/spi@0/rtc@0: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@100000/target-module@d8000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
--
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24: failed to match any schema with compatible: ['ti,tps65217']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/pmic@24/pwrbutton: failed to match any schema with compatible: ['ti,tps65217-pwrbutton']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: pinmux@800 (pinctrl-single): 'pinmux_i2c1_pins', 'pinmux_rtc_nint_pins', 'spi1_pins_s0' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: scm_conf@0 (syscon): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/control@620: failed to match any schema with compatible: ['ti,am335x-usb-ctrl-module']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/dma-router@f90: failed to match any schema with compatible: ['ti,am335x-edma-crossbar']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@35000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@100000/target-module@a0000/spi@0/rtc@0: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@100000/target-module@d8000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
