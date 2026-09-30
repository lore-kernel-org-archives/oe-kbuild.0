Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFF734388E
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 22:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807928; cv=none; b=H/IoEkOBkPIX/UYhma4mYsSOOGZjXdDZBCgzejOcBC4qA0ZdZzNX7V3UsVLptnvDiGh3nu7q1pceM8+UsZo4JDE6a14Sp3ChiCK4Y4S9yQ6N6RCRNxOC6kYa7u7imR7r7mWW4YZ/C/vNUwG4v4T+sKU/cWbAifISAtWij1Bv2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807928; c=relaxed/simple;
	bh=223gB+24YPUZCkGc4cHM1NqUkgDa3BHzBuiWc59vPJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nhyKbZOrYKO1NGBqUduGsoQ7vq9PnjoAUg82DFhEu+XVI/BwYg4h6kwGXGhiSS3Cn7yt38dHwcq4gtpO2ZXGL5R1sbdFX9lIz3WoqM22Aa+J6i2NfXYB0lEE4C2a6Vc0H8Cfe5WQq8ceZj9/P7iWk1BfGHwwdDo5DezyJ6FnPZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cq/kZkqg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cq/kZkqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790807926; x=1822343926;
  h=date:from:to:cc:subject:message-id;
  bh=223gB+24YPUZCkGc4cHM1NqUkgDa3BHzBuiWc59vPJM=;
  b=Cq/kZkqgHkwPtCV4zTnxEn513hP4XKbetNBzVJzAJ68SWTRByAJGmTBb
   D4XfArenMxMkxOYPtkV4FMw/vt3Nqo1I1N4Eo5ucIoaJ4JnUWz2Bq+5ta
   +wv0rB+xBL4ihTRzYYpbeN2uvQ9DC3ONuCW3BYLk8vYTNO6QU6+J8wetl
   2x9WsgK5vFipCOdiNnW2KN1jM0io2hftr9RHppcPOkTiSCxe4hK1edNli
   58NObqtE8zPPX8NuChGsMYG55aUyv7y/ZwU4f1t4MtL8QXxx+tEYLpy6u
   og6dQbYvGU80MV/9KZUxYb7mF+Bz6tYcL+NYfzaLSePYZ0OaNlgj8wqJi
   Q==;
X-CSE-ConnectionGUID: ri5quo+kSgemNhVdESj3vw==
X-CSE-MsgGUID: vMcPIeefTvWZWq9Z9YkvGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90458004"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90458004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 15:38:45 -0700
X-CSE-ConnectionGUID: xGDHSa/xTFCKDw1RnmYdfw==
X-CSE-MsgGUID: +PI6UQDCR0iSkaxyXBjCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="274432288"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2026 15:38:44 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC2wj-0000000024B-3w6l;
	Wed, 30 Sep 2026 22:38:41 +0000
Date: Thu, 01 Oct 2026 00:37:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8864/12096]
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required
 property
Message-ID: <202610010048.QCLZAvv1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: dts patches queued in parallel for SoC"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6474fa070f2b8013b4b87350b775b8c3be6e8aac
commit: 43be6abd6775820fdac3729962f7e7b841104fda [8864/12096] mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
:::::: branch date: 32 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-2401-20260925 (https://download.01.org/0day-ci/archive/20261001/202610010048.QCLZAvv1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010048.QCLZAvv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610010048.QCLZAvv1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg2: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg3: ste,config: b'\x00\x00\x001' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gavini_cfg1: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: ab8500 (stericsson,ab8500): codec: '#sound-dai-cells' is a required property
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
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: tvk_cfg1: ste,config: b'\x00\x00\x007' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: tvk_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: default_href520_cfg1: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: default_href520_cfg2: ste,config: b'\x00\x00\x00=' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): codec: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): gpio: 'adi1', 'dmic', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,ab8500.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44: failed to match any schema with compatible: ['toshiba,tc35893']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_gpio: failed to match any schema with compatible: ['toshiba,tc3589x-gpio']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80004000/tc35893@44/tc3589x_keypad: failed to match any schema with compatible: ['toshiba,tc3589x-keypad']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/i2c@80128000/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780gli']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: spi@80111000 (arm,pl022): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
