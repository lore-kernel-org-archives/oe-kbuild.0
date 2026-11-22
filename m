Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385424;
	b=dToECy0JAU6tkxqo+ZxwTqxkyk526aWqVerL58u7dUmtpbRpw8kHzYTShDcg8OSvJ0EU
	 z6zAGPFTwDyJBs/ele80EVmSM5EQZcELl8I8ZlQA6NH6mk71SXUKQMmgNnWgBTFHfhVMb
	 4x/joE/wRmbf4YF68jfKsYr2yHYb+C5sNmYl8hH0GNpiabJ9FDCrLfivNT6f4NgZFrBnH
	 smWV88XjHrrkxFoumaAQJOKKPZZJLmPx+IlORHDdRTODFxQ9/BQZr/2kNQsrXY9MA0X5b
	 zR8Q8BkNB9zZFDD6LNwFYLrN2Up3pT4e+0K536Bu7Q1RfkkEzNp8SRukuVq/pWqZLhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385424;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s2dnoQ9G0fakxN7he6NBy3A/vL4TeKtNL44kaDWth2E=;
	b=gUkhUd8pjzbKRJlIDwEH2VxnDhaoiMhv8Smmj+ndIYDH0ZjdAzQges236AqExLq2h/GO
	 c+aqO7ZmnXw82ZjEyJv5NCzN2qR/dZ2fN6kJy6fnDH/DWseVmd3EO42JGwlkR14c0Zeas
	 Y1FBIIrgiXNQRv+5iATcHbR5YtS7MxON86nM5Pl6QOjtkzUd2QETT7qLRnDGmPI6hvGnC
	 wO/wvgFHxkGVeitFN4j8WT6k5lwjaRG83SGI8PYIBCifPoLyNsi5gg958v17+Sa+DJXrK
	 tHkCOb0Ig5p4LNAa+jMtFHl18zOsn1BTX4289IMglicCBRo20trVE+IUe949/f2Bejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxMOcoXI;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE9606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 22:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxMOcoXI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795385423; x=1826921423;
  h=date:from:to:cc:subject:message-id;
  bh=x7cgQLAj+xTF52KDWgCROJjBzxtslol8S2EeJmGHZ68=;
  b=gxMOcoXI9L8KFLb9BlfEqDuHhVzqQWQQ9hbL92fuVzVGfrmemYqvxsAZ
   /DHCKdYo8FulIFH0DlLndCoNtiZ1kzHwJj0ejbEgcP2sUWyl88KkQcwPg
   BFI6btxMM49xUzzBw1XIqz9+7L5ApPz+OQgiaJFVKRr4oV2bRTb8NefCh
   3OHGD5+S+4C0GxYjdxtJQBnueTyt94BZtdPstmLPzc3GAP9kQyN1ae1yf
   QXG4kIMAVaI3DCJ1wh8s91YuQt4Z7Q7m70aMxIZ69ocOsFcshti2dMhBa
   plTS/AahDLt/8pZ6G6xMkQySXSl38jNObi3Uh+Wx+FsCGx31MIte5HTBL
   Q==;
X-CSE-ConnectionGUID: BKNWCJlEQnWUfGUmlajG5Q==
X-CSE-MsgGUID: fVeW69AXQm66RC5c+aIfAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4234231"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4234231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 14:10:22 -0800
X-CSE-ConnectionGUID: TeJdPtuQT6eOdaONtb1QvA==
X-CSE-MsgGUID: qMeDYZ4JRMij9pvLnUo7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11443677"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2026 14:10:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVFlK-000000004cM-43ZG;
	Sun, 22 Nov 2026 22:10:18 +0000
Date: Sun, 22 Nov 2026 23:09:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-mfd-ulp-pll-supply-binding 2/2]
 arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a
 required property
Message-ID: <20261122225901.jqDzGseq-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-mfd-ulp-pll-supply-binding
head:   0d53bdf513bfec32c7d34846adbd64340075be3e
commit: 0d53bdf513bfec32c7d34846adbd64340075be3e [2/2] dt-bindings: mfd: ab8500: Describe the ULP PLL supply
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261122/20261122225901.jqDzGseq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122225901.jqDzGseq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122225901.jqDzGseq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio-line-names', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio-line-names', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x005' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x00B' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: default_hrefv60_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: default_hrefv60_cfg3: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x00C' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: default_hrefv60_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: default_hrefv60_cfg3: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg3: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/i2c@80004000/proximity@39: failed to match any schema with compatible: ['sharp,gp2a030s00f']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: codina_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: codina_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: codina_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: default_cfg1: ste,config: b"\x00\x00\x00'" is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: ab8500 (stericsson,ab8500): clock-controller: 'vintcore-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
