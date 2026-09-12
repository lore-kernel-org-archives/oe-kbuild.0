Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD4360EE1
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 05:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789190825; cv=none; b=XTR8BEUsz31co6F6LhZXSByZk4xYJAsesDldOXCTA6GFLea2tiglGE+UN+DybsJYDhxRfuAL/aBvP3F28qCi6JDViRXkmQbpnqB7VBkaqvLeL4PbEtB2QYHhPX/92c79KMot4SUTEtgpzj5dH0ugn6KZgHg2ZGfgC9wJorwWx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789190825; c=relaxed/simple;
	bh=NtmApOz/tRFY9/FV+hzJUH9btHXUrWl5wrru/+IPlDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RMDGbnjbvbhnkuAq5vqathznOqXSZrWxBsnEzqZ9YpBBElVQxXtgndOrRCfTHVlVgIVnBCaeYuD2vb/JIeCf0M0sFeYvnhhaiwXG+QuJLvjxiWpgq0FBjjDqpLfmw425r0ffOorkGX5SNnzWnrcJzsSlb45BNnYEikkol4A2pHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+dpvnUa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+dpvnUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789190824; x=1820726824;
  h=date:from:to:cc:subject:message-id;
  bh=NtmApOz/tRFY9/FV+hzJUH9btHXUrWl5wrru/+IPlDM=;
  b=S+dpvnUa7ogoc4JayEzf3TPlxWD6sVFl51FKBOzud0iXL5GmRG+OPm6h
   01SCE6JYZBZpukUFdjGzUkj0YdA7hLY9TJ8Bjlggs0lv5UMGq/Ha972Un
   3SEqYgFG65/N6EtUl985Ae7/QjiLLuNuy/lTIQ5e19PLv2nF+wubsy2EY
   FO1cEm5Gkm2LjGTBIs8GenRBrVyovdzBGCyXjKffU7BJTA5a2zIgO3tW5
   rsv1ID7b3rleZBMh6PDdVPIns7Gx/yQaonTGjRyzuUD5A6L4UlgxsD5gZ
   Q4yxIYM2V8v6mOu3HMzNdgcd5x+8tD3U2TxiGqbSTOvQEMb+Lw7GYdYdd
   g==;
X-CSE-ConnectionGUID: DKXVntZSQ8abnclRQGGriA==
X-CSE-MsgGUID: GvRwszP2Qo+GdLzPbgERGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89675216"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89675216"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 22:27:04 -0700
X-CSE-ConnectionGUID: r6y308ChRHKRNxjf5SFQig==
X-CSE-MsgGUID: DNaeqPSWRK26AS0AijToOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276264655"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 22:27:02 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5GGS-000000000yx-0b6a;
	Sat, 12 Sep 2026 05:27:00 +0000
Date: Sat, 12 Sep 2026 07:26:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-simple-sound 22/25]
 arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8505:gpio: 'adi1', 'extcpena', 'gpio10',
 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25',
 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39',...
Message-ID: <202609120755.2hhZTve3-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-simple-sound
head:   2eb80219e8fce070d765e9882a7fe586861ee64a
commit: bc1d0a54a8f259daccf57996c2cfa35acd94593e [22/25] ARM: dts: ux500: Convert HREF audio card to simple-card
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm-randconfig-2055-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120755.2hhZTve3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120755.2hhZTve3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609120755.2hhZTve3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: prcmu@80157000 (stericsson,db8500-prcmu): ab8505:gpio: 'adi1', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/stericsson,db8500-prcmu.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: ab8505 (stericsson,ab8505): gpio: 'adi1', 'extcpena', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio16', 'gpio2', 'gpio24', 'gpio25', 'gpio26', 'gpio35', 'gpio36', 'gpio37', 'gpio38', 'gpio39', 'gpio4', 'gpio42', 'modsclsda', 'pwm', 'sysclkreq2', 'sysclkreq4', 'usbuicc', 'ycbcr' do not match any of the regexes: '^pinctrl-[0-9]+$'
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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
