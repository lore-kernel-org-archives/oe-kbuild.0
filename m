Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420299;
	b=ZRy4cuzap/nHCJzs9SjRbcfQaArDxNP0SnfC+MynjYKoxYnEWv4mMAWC693ErXdaARUq
	 vnRo3HqW4i0fMFDJetMClzEFBEf1V82ybv/vrL0DSz3DlSLJCUeIYWqdvgyj/XEUDXNj0
	 +FhrdsBIfqHEfAjfz9xIYmU06ECoc8i7NWE0XYeM/hK/1Tpt7r/KJrNvweInnDUWWaAp3
	 bRXTV3tP5Rsf/gWJVf+y/i0+BJHd0GP7l71DAYtqNQw8B4/4KEc/MOGfUw+y4ozdE4w49
	 l79ceqBXKX1Rjp3ACM4nyzvfMzgGs2q4XgxLXTLBtD6pYB9PwJ1+J7PzFjRFwCG8O1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420299;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FYbPL3uTbwk9rjs7BZAiC8icfINoiQOA5xk4I5Gmyq8=;
	b=FxRvBAmHBpNDJ35ax8075H7ltoBXMCx+FRHI5us7NYEfs9W7OeI6FvRQ+8eZ1M9/04ae
	 8y54wIWfdlDIIvwi9FvJGaK8XH4m347MfPhcWkpw7/n/FPrXLmm+tWigKWVXkWDN5Zk4Q
	 Z/b0oXNQXTr4E4ibukn2u5G/ZD19O7ZeJUkckAeUB3G6PZF/DKLkDDLJrxntsVVx7VYcX
	 NHX3UW6nnO8w9BcwRP7a5LZCVz2j2SpUNnHrCfA6TAngnmYTPJH81+X8QXtdr8/UoGnfc
	 XyhQYNqWdBs4uJ6BvK1OOR7fHKzMErODImeymXimKHGAvvPK+ieK3Hc/jCBBe/jC4rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2ILDaoF;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2E606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 18:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2ILDaoF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794420298; x=1825956298;
  h=date:from:to:cc:subject:message-id;
  bh=32wIswEyRP/+t+oYRc+DkZMCVou+Jo+oWpWjfvP6UM0=;
  b=Q2ILDaoFZGwRPjFwSEv9uZz5w62/q0xvukqWJ5wYyAxUjAOnVflf6XlM
   hQD2xEu1OBQA71eWdnvFdr+377cjZBR1jMcVcR7PtlKJVlj8fQUKTyinH
   f1yZCILWhHX3hxLko9vPL+Ji9ZXINWqfnLsCYixjgRqCB8Os75o9Dgwmv
   0FhLG3dxkBlckKTpU9dvoER/m2QXQOE+UCK9XvqX9aGG6baRL7OY5qJ6H
   cEqRqPSgkj3EOae9kFugjqiDvdAlZmh1lQJHNP6BWUPCgQHfky1lOLzwp
   okSkFTCIEI8OpjpxSVwJqoGmPONNNcwZ/aUEpzBRKdwtPwiZUdIi+nBVa
   w==;
X-CSE-ConnectionGUID: 0A70j+aCSiCrUCPMuyp5Hw==
X-CSE-MsgGUID: K4dRhiUnRYCF+4ONgHRyKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3228432"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3228432"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:04:57 -0800
X-CSE-ConnectionGUID: O7KWQQi4TqyyPrcYfq3tMA==
X-CSE-MsgGUID: ZUSK7QcBQtm0MdEF/E+UqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8564107"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2026 10:04:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRCgn-000000000d3-3Oz0;
	Wed, 11 Nov 2026 18:04:53 +0000
Date: Wed, 11 Nov 2026 19:03:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-pinctrl-bindings 3/3]
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: pinctrl
 (stericsson,db8500-pinctrl): stmpe:stmpe_stuib:stuib_cfg: 'ste,pins' does not
 match any of the regexes:
 '^(?!phandle$|pins$|groups$|function$)[a-zA-Z0-9_-]+$', '^pinctrl-[0-9]+$'
Message-ID: <202611111814.sCoDmtwQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-pinctrl-bindings
head:   345e3710e27f07b8bf32763de6d29466418e3ac9
commit: 345e3710e27f07b8bf32763de6d29466418e3ac9 [3/3] dt-bindings: pinctrl: nomadik: Convert to DT schema
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611111814.sCoDmtwQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111814.sCoDmtwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611111814.sCoDmtwQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8011e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8011e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/gpio@8011e080: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/gpio@a03fe000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: pinctrl (stericsson,db8500-pinctrl): stmpe:stmpe_stuib:stuib_cfg: 'ste,pins' does not match any of the regexes: '^(?!phandle$|pins$|groups$|function$)[a-zA-Z0-9_-]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/stericsson,nomadik.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg: ste,pins: b'GPIO218_AH11\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
--
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8011e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8011e080 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/gpio@8011e080: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/gpio@a03fe000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: pinctrl (stericsson,db8500-pinctrl): stmpe:stmpe_stuib:stuib_cfg: 'ste,pins' does not match any of the regexes: '^(?!phandle$|pins$|groups$|function$)[a-zA-Z0-9_-]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/stericsson,nomadik.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: pinctrl (stericsson,db8500-pinctrl): gpios: {'gpios_hrefv60': {'phandle': 44, 'default_cfg1': {'pins': ['GPIO4_AH6'], 'ste,config': [[45]]}}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: stuib_cfg: ste,pins: b'GPIO218_AH11\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8011e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8011e080 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/gpio@8011e080: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/gpio@a03fe000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: pinctrl (stericsson,db8500-pinctrl): gpios: {'gpios_hrefv60': {'phandle': 44, 'default_cfg1': {'pins': ['GPIO4_AH6'], 'ste,config': [[45]]}}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8011e080 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8011e080 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/gpio@8011e080: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@a03fe000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/gpio@a03fe000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: pinctrl (stericsson,db8500-pinctrl): gpios: {'gpios_hrefv60': {'phandle': 44, 'default_cfg1': {'pins': ['GPIO4_AH6'], 'ste,config': [[45]]}}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: spi@80111000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
