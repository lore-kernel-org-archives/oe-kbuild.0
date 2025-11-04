Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACDD13A3F7
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762269328; cv=none; b=dhjOkMo3IaDQNVm6IeH4xYIYQKih0lwHcBFxRPImGc6QFFDkaXLU/LNnPLW92FVyvfaYDGVMsVrEndlfURfteQrFuXLtEGbsa/mTNTmK6tizUHxgs3p3FyY0e4i7T15/piMgb4a4Z4LGiXTSSUxclGf0MPKWbalf+6iGkD0hrVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762269328; c=relaxed/simple;
	bh=I4wlz78+uJjVnQw5D4Nzfh4WoCealzvyikDn3qtPERk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHvV7ND66zgCcsz+wYi2+6Hdtw/XXsaawJV6d1t8rvg6RFxGJJAYGeEcQdQCPx3SLeJDImBkX0HABASX3PodS93PGLlo8M6YIxHCU0g1nnz6n7viOEAKSamg+QmiO5rblLn5KdOb4fWkKC/S5RcmwgpuOgtvlDMabMCP9AP1kqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xjcr3N+Q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xjcr3N+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762269326; x=1793805326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4wlz78+uJjVnQw5D4Nzfh4WoCealzvyikDn3qtPERk=;
  b=Xjcr3N+QRH4Gt50ID1NEOGsETRkls/tOQMyYoC1fUXywleaXdwnN2YVp
   us1fj+T9BkTbx7k7iUzt40tFbKTPnuUm+lbxOBmvwZzOJRGq81jEyiEeJ
   EFyWX4rvyGEBeuApB3+SkOqVXOIk+c4PrfgUziYEoknxYUVueJhUgSY0e
   rBtxCw24g/64qx5Z1cFnAz2JIFKg2vX/P/K4gTYkFcKM2xqvaQlWxCMiO
   gOWD4bwlvgZM4MOcpZ4Yt5Q+suTGpf5upWgmvqJD2NVpJPogqbOIX5uTg
   sFYPyzb+vht4NS4oKIgxoHSFtFRiPGi6fmC8LyZ/OwnAfSH+ZlxNJ1pst
   Q==;
X-CSE-ConnectionGUID: RHpgQ9Y7T8O/V7lJsRhEJg==
X-CSE-MsgGUID: Npa92HltTjC9a5R+REO8nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75475786"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="75475786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 07:15:26 -0800
X-CSE-ConnectionGUID: ddN6RCKQREeTdH7tYW+drg==
X-CSE-MsgGUID: OWzkXO8bSE6IkBAE5OKYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191273304"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2025 07:15:24 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGIkk-000000002E4-2enb;
	Tue, 04 Nov 2025 15:15:22 +0000
Date: Tue, 4 Nov 2025 16:14:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [alexandrebelloni:rtc-misc 14/19]
 arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: rv8803@32
 (microcrystal,rv8803): $nodename:0: 'rv8803@32' does not match
 '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202511041658.mE6FPZe3-lkp@intel.com>
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
commit: b3aff9ab5262424a47fbda51f88cf9cbc8f4dea7 [14/19] RTCs on sama5d4 xult
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2052-20251102 (https://download.01.org/0day-ci/archive/20251104/202511041658.mE6FPZe3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041658.mE6FPZe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511041658.mE6FPZe3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: nand-controller (atmel,sama5d3-nand-controller): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: nand-controller (atmel,sama5d3-nand-controller): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: hlcdc@f0000000 (atmel,sama5d4-hlcdc): 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/isi@f0008000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/ramc@f0010000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
>> arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: rv8803@32 (microcrystal,rv8803): $nodename:0: 'rv8803@32' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/epson,rx8900.yaml
>> arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: ds1307@68 (dallas,ds1307): $nodename:0: 'ds1307@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/rtc-ds1307.yaml
>> arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: rv1805@69 (microcrystal,rv1805): $nodename:0: 'rv1805@69' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/abracon,abx80x.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/sfr@f8028000: failed to match any schema with compatible: ['atmel,sama5d4-sfr', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/spi@fc018000/rtc@0: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/smc@fc05c000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/smc@fc05c000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,sama5d4-pmecc']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: /ahb/apb/timer@fc068630: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: watchdog@fc068640 (atmel,sama5d4-wdt): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: i2c0: i2c0-gpio: {'atmel,pins': [[0, 30, 0, 0, 0, 31, 0, 0]], 'phandle': 30} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: i2c1: i2c1-gpio: {'atmel,pins': [[4, 29, 0, 0, 4, 30, 0, 0]], 'phandle': 33} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dtb: i2c2: i2c2-gpio: {'atmel,pins': [[1, 29, 0, 0, 1, 30, 0, 0]], 'phandle': 39} is not of type 'array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
