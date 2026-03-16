Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B851EDA32
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644625; cv=none; b=EU2WgZIRfttLl1+uPQSK/VAzkrF3C69kAeXQwKQJIBvzwsRPIDimlkmxrV7LLhbOmTsYYeUuOgF0qKoMiiJ2opGGq3hDYD2zoLXT1655npRSnptVUSE2umIb8i7nt+DDXIC4VWg419EmW2ZyUrdiNwEE3GNl2jy942dSZvhDMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644625; c=relaxed/simple;
	bh=F75VUrT2jNFbs9d9939MKYTAHiYoGY4eptQ2ETA2WCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J/N155SgYx/VFYbQZ3/rrx/aIA69KFF8WeYuuwY/8dxGwpIs982f2rn34f3r/Rv0NNaYo95ANV8sE/dKgBNOMex2HW9x4gqDYBsyFZ7NYEmHSR5l4jZMZ+PErnDpTA3O6kw/QJMcpk4AzwXsEeL4b+xQiaoN7yyOReuHmmneMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGcaGB8A; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGcaGB8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773644624; x=1805180624;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F75VUrT2jNFbs9d9939MKYTAHiYoGY4eptQ2ETA2WCg=;
  b=dGcaGB8AuOf19IzKyk6pDczKbu2g/KsOomVyiFmeFhMllhkiv7HvH9iV
   FMe83DJP5qHoEA6iHtR0VrMGHyjbYk934IK1kHqJBkE7xLpfsGbnw8vAi
   0YTSZcq83Hg/D4VXNmiNaiziaLgutG7e2mJo3Dg64nx4l0cIhGVChoZQ4
   EnV86PQO6C9vO2Sdq7yJc/ownZXNJvf7UWt0x7xxx6l6NwUsQ5ru8z8L0
   9SnOQQz/gBjdlHfgh8GEcXoC23Ole7/ZKFjY2StVZhfBYLFfhqHGzcbgy
   GmCwXayenzJGFoPsTeX4mlxAgjJ7aSFSgFVAVrv/TvFU7L9oD8F/6RWVu
   g==;
X-CSE-ConnectionGUID: BS7P1tb0QO6t5aPn8fF88w==
X-CSE-MsgGUID: N/s+g8AcSoKwyj9R46ej2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="86131405"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="86131405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 00:03:43 -0700
X-CSE-ConnectionGUID: kiFYC1AdRMylxPyxBVYqmA==
X-CSE-MsgGUID: jP+xAeyKQyixq/tvi4HsGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="226289422"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Mar 2026 00:03:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w21zH-000000004Az-2eXz;
	Mon, 16 Mar 2026 07:03:39 +0000
Date: Mon, 16 Mar 2026 08:03:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3519
Message-ID: <202603160848.Ma860plK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260314-edt-ft3519-v2-1-e28c3f9c6559@machinesoul.in>
References: <20260314-edt-ft3519-v2-1-e28c3f9c6559@machinesoul.in>
TO: Bhushan Shah <bhushan.shah@machinesoul.in>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bhushan Shah <bhushan.shah@machinesoul.in>

Hi Bhushan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhushan-Shah/dt-bindings-input-touchscreen-edt-ft5x06-Add-FocalTech-FT3519/20260315-071854
base:   0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
patch link:    https://lore.kernel.org/r/20260314-edt-ft3519-v2-1-e28c3f9c6559%40machinesoul.in
patch subject: [PATCH v2] dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3519
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm-randconfig-2051-20260315 (https://download.01.org/0day-ci/archive/20260316/202603160848.Ma860plK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603160848.Ma860plK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603160848.Ma860plK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml:38:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml:51:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
--
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'CPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'DCVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: wm8904@1a (wlf,wm8904): 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml
>> arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: ft5426@38 (focaltech,ft5426): compatible: 'oneOf' conditional failed, one must be fixed:
   	['focaltech,ft5426', 'edt,edt-ft5406'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-dvk_som60.dtb: /ahb/apb/ramc@ffffea00: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,dra7-l4-per1', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): compatible: 'oneOf' conditional failed, one must be fixed:
   	['edt,edt-ft5506', 'edt,edt-ft5x06'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/edt-ft5506@38: failed to match any schema with compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58: failed to match any schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pmic: failed to match any schema with compatible: ['ti,tps659038-pmic']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pwr_button: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_usb: failed to match any schema with compatible: ['ti,palmas-usb-vid']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,dra7-l4-per1', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: edt-ft5506@38 (edt,edt-ft5506): compatible: 'oneOf' conditional failed, one must be fixed:
   	['edt,edt-ft5506', 'edt,edt-ft5x06'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/edt-ft5506@38: failed to match any schema with compatible: ['edt,edt-ft5506', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58: failed to match any schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pmic: failed to match any schema with compatible: ['ti,tps659038-pmic']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_pwr_button: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/tps659038@58/tps659038_usb: failed to match any schema with compatible: ['ti,palmas-usb-vid']

vim +38 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml

10ad4845cd3d76 Benjamin Gaignard 2020-02-15    8  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15    9  description: |
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   10               There are 5 variants of the chip for various touch panel sizes
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   11                FT5206GE1  2.8" .. 3.8"
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   12                FT5306DE4  4.3" .. 7"
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   13                FT5406EE8  7"   .. 8.9"
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   14                FT5506EEG  7"   .. 8.9"
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   15                FT5726NEI  5.7” .. 11.6"
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   16  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   17  maintainers:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   18    - Dmitry Torokhov <dmitry.torokhov@gmail.com>
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   19  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   20  allOf:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   21    - $ref: touchscreen.yaml#
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   22    - if:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   23        properties:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   24          compatible:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   25            contains:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   26              enum:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   27                - evervision,ev-ft5726
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   28  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   29      then:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   30        properties:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   31          offset-x: true
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   32          offset-y: true
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   33  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   34  properties:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   35    compatible:
f8d2ba92246009 Bhushan Shah      2026-03-14   36      oneOf:
f8d2ba92246009 Bhushan Shah      2026-03-14   37        - enum:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15  @38          - edt,edt-ft5206
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   39          - edt,edt-ft5306
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   40          - edt,edt-ft5406
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   41          - edt,edt-ft5506
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   42          - evervision,ev-ft5726
9b352327add1ab Yedaya Katsman    2026-01-18   43          - focaltech,ft3518
2e23b7f3b7dbb5 Andreas Kemnade   2024-05-01   44          - focaltech,ft5426
fe962300973046 Joel Selvaraj     2024-05-21   45          - focaltech,ft5452
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   46          - focaltech,ft6236
70d76b0e85ad12 Felix Kaechele    2024-08-03   47          - focaltech,ft8201
06226bd497dd99 Jens Reidel       2025-03-13   48          - focaltech,ft8716
fe962300973046 Joel Selvaraj     2024-05-21   49          - focaltech,ft8719
f8d2ba92246009 Bhushan Shah      2026-03-14   50        - items:
f8d2ba92246009 Bhushan Shah      2026-03-14   51          - const: focaltech,ft3519
f8d2ba92246009 Bhushan Shah      2026-03-14   52          - const: focaltech,ft3518
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   53  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   54    reg:
73b1e2170a9da9 Johan Jonker      2020-05-20   55      maxItems: 1
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   56  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   57    interrupts:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   58      maxItems: 1
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   59  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   60    reset-gpios:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   61      maxItems: 1
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   62  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   63    wake-gpios:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   64      maxItems: 1
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   65  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   66    wakeup-source: true
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   67  
9bfaf9c729a924 Rob Herring       2020-12-21   68    vcc-supply: true
77191c8d6ccf2e Stephan Gerhold   2021-06-01   69    iovcc-supply: true
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   70  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   71    gain:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   72      description: Allows setting the sensitivity in the range from 0 to 31.
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   73                   Note that lower values indicate higher sensitivity.
3d21a46093352f Rob Herring       2020-04-15   74      $ref: /schemas/types.yaml#/definitions/uint32
3d21a46093352f Rob Herring       2020-04-15   75      minimum: 0
3d21a46093352f Rob Herring       2020-04-15   76      maximum: 31
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   77  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   78    offset:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   79      description: Allows setting the edge compensation in the range from 0 to 31.
3d21a46093352f Rob Herring       2020-04-15   80      $ref: /schemas/types.yaml#/definitions/uint32
3d21a46093352f Rob Herring       2020-04-15   81      minimum: 0
3d21a46093352f Rob Herring       2020-04-15   82      maximum: 31
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   83  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   84    offset-x:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   85      description: Same as offset, but applies only to the horizontal position.
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   86                   Range from 0 to 80, only supported by evervision,ev-ft5726 devices.
3d21a46093352f Rob Herring       2020-04-15   87      $ref: /schemas/types.yaml#/definitions/uint32
3d21a46093352f Rob Herring       2020-04-15   88      minimum: 0
3d21a46093352f Rob Herring       2020-04-15   89      maximum: 80
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   90  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   91    offset-y:
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   92      description: Same as offset, but applies only to the vertical position.
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   93                   Range from 0 to 80, only supported by evervision,ev-ft5726 devices.
3d21a46093352f Rob Herring       2020-04-15   94      $ref: /schemas/types.yaml#/definitions/uint32
3d21a46093352f Rob Herring       2020-04-15   95      minimum: 0
3d21a46093352f Rob Herring       2020-04-15   96      maximum: 80
10ad4845cd3d76 Benjamin Gaignard 2020-02-15   97  
625f829586ea96 Dario Binacchi    2022-06-27   98    report-rate-hz:
625f829586ea96 Dario Binacchi    2022-06-27   99      description: |
625f829586ea96 Dario Binacchi    2022-06-27  100                   Allows setting the scan rate in Hertz.
625f829586ea96 Dario Binacchi    2022-06-27  101                    M06 supports range from 30 to 140 Hz.
625f829586ea96 Dario Binacchi    2022-06-27  102                    M12 supports range from 1 to 255 Hz.
625f829586ea96 Dario Binacchi    2022-06-27  103      minimum: 1
625f829586ea96 Dario Binacchi    2022-06-27  104      maximum: 255
625f829586ea96 Dario Binacchi    2022-06-27  105  
685b37704ce689 Oleksij Rempel    2023-06-21  106    threshold:
685b37704ce689 Oleksij Rempel    2023-06-21  107      description: Allows setting the  "click"-threshold in the range from 0 to 255.
685b37704ce689 Oleksij Rempel    2023-06-21  108      $ref: /schemas/types.yaml#/definitions/uint32
685b37704ce689 Oleksij Rempel    2023-06-21  109      minimum: 0
685b37704ce689 Oleksij Rempel    2023-06-21  110      maximum: 255
685b37704ce689 Oleksij Rempel    2023-06-21  111  
10ad4845cd3d76 Benjamin Gaignard 2020-02-15  112    interrupt-controller: true
10ad4845cd3d76 Benjamin Gaignard 2020-02-15  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
