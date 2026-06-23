Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C35328611
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233886; cv=none; b=d5RA6UR/sGdWqs0h/fJzRblpaUcX9ZDH8B2JhAENwOKZOf++BYiWH6HjTjBtdgdkRxepkEaKXrhG9r3TDYrNwkFfmaHysaHz08Y1b3GKjwXFiBW7Bk66NTy77bbF8T8aEdcZIQVR1vLRZcDc6cvijVuWp7EphNWHr9NTi6zQoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233886; c=relaxed/simple;
	bh=wXyZCd2Ifm/tYligqF/ujXbeH3L5Qhd6H14wDiBvWT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SETDrtc0xn/oq3J8LXpq3dXv+x28ELn4yHhlED1ak8JYXkBGPbqnSuMnu8XDsLQehDJZ4HM/hcyT3aoco+Z6DsmtfhSX8lfVH90lFuMOncbPF+QJ2OWZ2adCj30yiuPMGLLopFtgGGr61K/QPHrN5RLhJqFY3fN3ymRPNEKmnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcqaFRxa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcqaFRxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782233884; x=1813769884;
  h=date:from:to:cc:subject:message-id;
  bh=wXyZCd2Ifm/tYligqF/ujXbeH3L5Qhd6H14wDiBvWT0=;
  b=CcqaFRxaZQHPoGH59V4ldR+18eS+eIuos43J1LS9Os9XOx9ULpf+RIVy
   IabX9CLm+r4ngZAy8uk6LQH7Of6mvk08ZdL+c42URmMIvQL0sd4FN5ZNY
   qnvWFuIacukJzxZsGFk1KmAoLUMZzYlSbWihZCMH1rTdSR8/e9Tyz5hEa
   Srsyzu14vpCLXSqG27G3FUP6HjTj+567JtX2fk/EUUvf6mOhilAQKcQDh
   D2/4H1TR7lvFT7gvdzfOCWmD6AGaHm93kPWWYb6pkQZNGP2bDFYjLsSkY
   892i8jPMuOjNhZeXyG0wOGCe1NXKVRctpM5nV6uC/qTcUm6o73zrxVyiy
   Q==;
X-CSE-ConnectionGUID: h1k0h+OMQnye2OnWIqN8pQ==
X-CSE-MsgGUID: JO9Nc8txST6bcW/GdDlTRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93637559"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="93637559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 09:58:03 -0700
X-CSE-ConnectionGUID: DrA4+IXfRfOQI+aw0Ltvkw==
X-CSE-MsgGUID: Gn2mg+ceSRioQNvn+GF96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249680542"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 09:58:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc4Rk-000000006Dx-13UH;
	Tue, 23 Jun 2026 16:58:00 +0000
Date: Tue, 23 Jun 2026 18:57:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb:
 mpddrc@ffffe800 (microchip,sam9x60-ddramc): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202606231854.f1O0dAyA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Akhila YS <akhilayalmati@gmail.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d801f0ab03e4f32f9a33d203154ce84887921
commit: f3ae0049ff8a3d2cbd8c05857705744435629d0c dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260619 (https://download.01.org/0day-ci/archive/20260623/202606231854.f1O0dAyA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231854.f1O0dAyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f3ae0049ff8a ("dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606231854.f1O0dAyA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: pwm@f8034000 (microchip,sam9x60-pwm): Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pwm/atmel,at91sam-pwm.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: hlcdc@f8038000 (microchip,sam9x60-hlcdc): 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: adc@f804c000 (microchip,sam9x60-adc): compatible: ['microchip,sam9x60-adc', 'atmel,sama5d2-adc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/atmel,sama5d2-adc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: mpddrc@ffffe800 (microchip,sam9x60-ddramc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-ddramc', 'atmel,sama5d3-ddramc'] is too long
   	'atmel,at91rm9200-sdramc' was expected
   	'microchip,sama7d65-uddrc' was expected
   	'syscon' was expected
   	'microchip,sama7g5-uddrc' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dtb: gpio-keys: pinctrl-key-gpio: {'atmel,pins': [[0, 29, 0, 0]], 'phandle': 37} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
--
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mcp23008@20 (microchip,mcp23008): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: hlcdc@f8038000 (microchip,sam9x60-hlcdc): 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/isi@f8048000: failed to match any schema with compatible: ['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: adc@f804c000 (microchip,sam9x60-adc): compatible: ['microchip,sam9x60-adc', 'atmel,sama5d2-adc'] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/atmel,sama5d2-adc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: mpddrc@ffffe800 (microchip,sam9x60-ddramc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-ddramc', 'atmel,sama5d3-ddramc'] is too long
   	'atmel,at91rm9200-sdramc' was expected
   	'microchip,sama7d65-uddrc' was expected
   	'syscon' was expected
   	'microchip,sama7g5-uddrc' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: /ahb/apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x60ek.dtb: rtc@fffffea8 (microchip,sam9x60-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x60-rtc', 'atmel,at91sam9x5-rtc'] is too long
--
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: mpddrc@ffffe800 (microchip,sam9x7-ddramc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc'] is too long
   	'atmel,at91rm9200-sdramc' was expected
   	'microchip,sama7d65-uddrc' was expected
   	'syscon' was expected
   	'microchip,sama7g5-uddrc' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
