Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28136494B
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276230; cv=none; b=UiMbqrZsHKfbFw1gGuUhfp0u8HJO8JZbPHXA+xoVRe6Jc75dX2nWZuFAwIyUEkJBDLqqwAb6tT3DWoD8ljbgNGO2cosh23lr75tHRwRuwfSvSKutj5i2i40vHAkzn2zyTh027vLCJXJv98N73XCVtLPf9OxZi3k2x1xlliFq8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276230; c=relaxed/simple;
	bh=h1pjLjcaq46Qi787WMR+9MdAHV/ZXeFzePD5Tg5yGfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JW6P8HHGsTzoZHZBkJ4RmO5LngqE3t1hhNB8BG8+90DYZ2vHtrPv1rby4zct2m+fVowZJjEfd8xDZS9ih6hEXkdOyO74w3NyiA/9i7o7alYIjD8ncKNeyPfcSUnnkzHp4YpXMJI1PoQQtWwkSy9TC1Kveb9F8IqnzKyWoP/Ox3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvdqQPEX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvdqQPEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791276226; x=1822812226;
  h=date:from:to:cc:subject:message-id;
  bh=h1pjLjcaq46Qi787WMR+9MdAHV/ZXeFzePD5Tg5yGfc=;
  b=gvdqQPEXp5YItjWJrIegMV+jJN2lKm6yjsZZOg40LqsvvIdT/c0ht54y
   ivbvupzDNnklcl/GOX/LDU3gy5TgDxDyl4/dsoiUot1r+x5YNbq9rTyA5
   tZ2Z61ZegZYuGXmlxqMi8u9sETt4PabKQF91JBOtiJlfEP7ovAqiQzIW6
   HAcekIEIsEL8gMRGSIYzOGb7BmTSRP7WZpURzP4TNfuGfCN1Jq1vYUX+o
   3S8SjSiGK0RBors9tXkuhn6Rv1lG0X/l1XYTH40BDx5stE4H2TOHk6Iwo
   3vDoyqyRo3jRsJKdesZkrdunaOjmEprSULfehulCYhZecIe8R0lxBI4AR
   w==;
X-CSE-ConnectionGUID: 33LcrnkLRmSovxUUF9E2xw==
X-CSE-MsgGUID: PYcdqLFMQUSOxj9ck2CBkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="14384"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="14384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:43:45 -0700
X-CSE-ConnectionGUID: ssPmEFztRDG3T11ZBkCfdw==
X-CSE-MsgGUID: 0EvzeY1PRWi1ueRAkVDKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280338812"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 01:43:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE0lx-000000000zX-41VO;
	Tue, 06 Oct 2026 08:43:41 +0000
Date: Tue, 06 Oct 2026 10:43:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-dts-for-soc 5/10]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape',
 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1',
 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the r...
Message-ID: <202610061025.PwdO2DMc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-dts-for-soc
head:   ff1501cbb825de117267124ecb8898112b4051c5
commit: 0c248f234355499539b76d1bb4f7a1b6165b0570 [5/10] ARM: dts: ux500: Add new AB8500/AB8505 regulators
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-2401-20261001 (https://download.01.org/0day-ci/archive/20261006/202610061025.PwdO2DMc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061025.PwdO2DMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610061025.PwdO2DMc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x00,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: snowball_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio-line-names', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio-line-names', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: default_href520_cfg1: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: default_href520_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: spi@80111000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
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
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
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
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tps61052@33: failed to match any schema with compatible: ['ti,tps61052']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg1: ste,config: b'\x00\x00\x005' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x006' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tps61052@33: failed to match any schema with compatible: ['ti,tps61052']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42: failed to match any schema with compatible: ['toshiba,tc35892']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80004000/tc35892@42/tc3589x_gpio: failed to match any schema with compatible: ['tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: spi@80002000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: default_hrefv60_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: default_hrefv60_cfg3: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: codina_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: codina_cfg3: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: codina_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: default_cfg1: ste,config: b"\x00\x00\x00'" is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: ab8505 (stericsson,ab8505): regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: skomer_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: ab8505 (stericsson,ab8505): gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: ab8505 (stericsson,ab8505): regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: proximity@44 (sharp,gp2ap002s00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: accel@18 (bosch,bma254): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/bosch,bma255.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg1: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: kyle_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: ab8505 (stericsson,ab8505): gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: ab8505 (stericsson,ab8505): regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: proximity@44 (sharp,gp2ap002s00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: accel@18 (bosch,bma254): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/bosch,bma255.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: stuib_cfg2: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: default_hrefv60_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: default_hrefv60_cfg3: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ab8500 (stericsson,ab8500): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: ak8974@f (asahi-kasei,ak8974): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/asahi-kasei,ak8974.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
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
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: ab8500 (stericsson,ab8500): regulator: 'ab8500_buck_ape', 'ab8500_buck_arm', 'ab8500_buck_mod', 'ab8500_buck_smps1', 'ab8500_buck_smps2', 'ab8500_buck_smps3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/i2c@80004000/proximity@39: failed to match any schema with compatible: ['sharp,gp2a030s00f']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00h\x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg2: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: golden_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: ab8505 (stericsson,ab8505): gpio: 'gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: ab8505 (stericsson,ab8505): regulator: 'ab8505_buck_arm', 'ab8505_buck_safe', 'ab8505_buck_smpsa', 'ab8505_buck_smpsb', 'ab8505_buck_smpsc', 'ab8505_buck_smpsm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-close-hysteresis: [0, 0, 0, 15] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-close-hysteresis: size is 32, expected 8
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-far-hysteresis: [0, 0, 0, 64] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: proximity@44 (sharp,gp2ap002s00f): sharp,proximity-far-hysteresis: size is 32, expected 8
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
