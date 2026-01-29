Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEED329C74
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769719743; cv=none; b=RMW0sDW+iDXoqHkrmrgIojUbvmP4vJB4goMgFDbaCj74rf0nMpqkKpleW7FDMumjfLEV75A8mbk1xwP0k6Gox/a89drDR9TMPoD+DEfoptqYmjl8qiVgAkdLVAUH7mwAMFuA2hPCOmJohhf8r3yHW4F4y33xSUncwIee8w6WXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769719743; c=relaxed/simple;
	bh=IiIrOqKBfmvPL18TsekDDJY9aGkI2qSbqaRoPj6L/zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ON23Z+Rg/Ntj9M3qfB7MaKrD/SafLVp6XoW3xgi3/3rQXQQtepooK2el3UR+mjXOg5nKwp/9DHQZOTl1kVbC4yYebnoNUaX0Hl5zt9va2+XU8EOunyiCzuIdXl2B5co1S8dq+Xt8iySTleo3vwa0yuOdHSLAyUxXoDC01aJq8tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbiFdxgO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbiFdxgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769719741; x=1801255741;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IiIrOqKBfmvPL18TsekDDJY9aGkI2qSbqaRoPj6L/zo=;
  b=SbiFdxgOydarFSGdmYs63UqWyReeWy22CMVVryDabaPq01bUoddfr4Ri
   g8XY4Tmxvx0pHw+/20qq0+eJ4szEdCwuDQjAyU73NfynqVTe87Zmtdvpy
   HK7tvrBbXxyRdSkvSf3qFMp2cHjIBBdJ54LIgYi348K1KqPT7ezE5PGwK
   gj2lZtTCSIQiI9dIljVgLxcnG3X2NNQBJwT+88qIm0/ZR987iaHELHVHe
   lFd//iueselUIIN/t1NbcbnJ77TMZO3Rkhc8BzKLwgsH+eZhLcQkzTomp
   hwgAXf7KwH+GIDk3jlEgjGBmG2CKWepKHyk4QjQs1QBOsQvQK/Oudt6FU
   Q==;
X-CSE-ConnectionGUID: 5mTCMWDbRS268FXwZf/MDw==
X-CSE-MsgGUID: UiYRsAoIRuGLmZaPeTsoxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73569572"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="73569572"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:49:01 -0800
X-CSE-ConnectionGUID: gT3ID+glTyql/vJitt5uXw==
X-CSE-MsgGUID: 3THGs3FpS4qGgX6qjysQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="212759216"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2026 12:48:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlYwj-000000002LN-1bz7;
	Thu, 29 Jan 2026 20:48:57 +0000
Date: Thu, 29 Jan 2026 21:48:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 08/10] dt-bindings: mfg: motorola-cpcap: convert to
 schema
Message-ID: <202601292148.pWDigXuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260125134302.45958-9-clamor95@gmail.com>
References: <20260125134302.45958-9-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Dixit Parmar <dixitparmar19@gmail.com>
TO: Tony Lindgren <tony@atomide.com>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: linux-rtc@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes broonie-regulator/for-next next-20260127]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-regulator-cpcap-regulator-convert-to-schema/20260125-233339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260125134302.45958-9-clamor95%40gmail.com
patch subject: [PATCH v1 08/10] dt-bindings: mfg: motorola-cpcap: convert to schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2051-20260126 (https://download.01.org/0day-ci/archive/20260129/202601292148.pWDigXuW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292148.pWDigXuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601292148.pWDigXuW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[114, 18, 2], [111, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: touchscreen@4a (atmel,maxtouch): interrupts-extended: [[114, 23, 8], [111, 352]] is too long
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: touchscreen@4a (atmel,maxtouch): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: pmic@0 (motorola,cpcap): 'button', 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^led(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: pmic@0 (motorola,cpcap): audio-codec: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: pmic@0 (motorola,cpcap): audio-codec: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: pmic@0 (motorola,cpcap): compatible: ['motorola,cpcap', 'st,6556002'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: pmic@0 (motorola,cpcap): spi-max-frequency: 9600000 is greater than the maximum of 8000000
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
--
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[114, 18, 2], [111, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: touchscreen@4a (atmel,maxtouch): interrupts-extended: [[114, 23, 8], [111, 352]] is too long
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: touchscreen@4a (atmel,maxtouch): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: pmic@0 (motorola,cpcap): 'button', 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^led(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: pmic@0 (motorola,cpcap): audio-codec: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: pmic@0 (motorola,cpcap): audio-codec: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: pmic@0 (motorola,cpcap): compatible: ['motorola,cpcap', 'st,6556002'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: pmic@0 (motorola,cpcap): spi-max-frequency: 9600000 is greater than the maximum of 8000000
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
--
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: tmp105@48 (ti,tmp105): False schema does not allow [[112, 18, 2], [109, 334]]
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[112, 18, 2], [109, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: pmic@0 (motorola,cpcap): 'button', 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^led(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: pmic@0 (motorola,cpcap): audio-codec: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: pmic@0 (motorola,cpcap): audio-codec: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: pmic@0 (motorola,cpcap): compatible: ['motorola,cpcap', 'st,6556002'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: pmic@0 (motorola,cpcap): spi-max-frequency: 9600000 is greater than the maximum of 8000000
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: tmp105@48 (ti,tmp105): False schema does not allow [[112, 18, 2], [109, 334]]
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[112, 18, 2], [109, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: pmic@0 (motorola,cpcap): 'button', 'spi-cpha', 'spi-cpol' do not match any of the regexes: '^led(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: pmic@0 (motorola,cpcap): audio-codec: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: pmic@0 (motorola,cpcap): audio-codec: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: pmic@0 (motorola,cpcap): compatible: ['motorola,cpcap', 'st,6556002'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: pmic@0 (motorola,cpcap): spi-max-frequency: 9600000 is greater than the maximum of 8000000
   	from schema $id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
