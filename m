Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0E3EBF0C
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769270886; cv=none; b=jfiHBgxSfrNmp1qJCeOTshghZD2EHbJSjHMIciNevQFhqfR09IwEoSm5EfF0azuJYjrDteeMS/kM0qNR3LMb8/Q90cSM0hH7Czo8UvKPj/UxiVhUSqT1bd7E+C5ot6E2+62ONj5L/NACxerxg3TwC7uGEUzO5COIXl+6wHnS5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769270886; c=relaxed/simple;
	bh=Q++G0Pp6qwmb+cFn5Lb1d3//nGyCUNk4LssXKJOeJZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MRsk6TRJkGmJ6KP+u34kEkA8mmoHWZKADQQW6gzGYK4mWw29N4dx0DsxTs+pAZxTOD+veAQIaorLge+9moAdN1xSqtfpX3kiYS/+x1otTcaQbzat2fOaXdLbphpbBp22f5vycO88ULguchK4KrT0D0BPvEtO9HTvcZJX/IyALmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5TT4qhn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5TT4qhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769270885; x=1800806885;
  h=date:from:to:cc:subject:message-id;
  bh=Q++G0Pp6qwmb+cFn5Lb1d3//nGyCUNk4LssXKJOeJZk=;
  b=B5TT4qhnXVAAcfsUyhj91LGE3PD1oV4AOvWYcF6XVQFZLVjdyfGf/S0Y
   UH7SbQLiM8geJdOWRcICBv//HfAxWZmw8QNfYncPPp5cVkWbt6I88s+W8
   8jPNiKP9py8/dJ4sPMjVaUub1cziaXPzA2zXeyfvU+V5QJBTbDFxpj46G
   DepAjbKlFoumRVkjGu9mHfg4cEIcZZO9bHwUZy9vzRusjVMCQsnBi0aT6
   QJnLyvBwePPYJ1u+H+sPA/jo1bggg9ksr5GtCa+AOpSLns8kz2MnsP6aP
   RYTCfKtMWypfQ3cngF1gYCW/o9Cy6x48Q9tv5Eyp7Kt8VpoCIwO6YFhV4
   A==;
X-CSE-ConnectionGUID: TOV9rl+JRXiYSuZoel3CgA==
X-CSE-MsgGUID: rA2iRV/fQYGIB/NNuwYHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="88070409"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="88070409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 08:07:58 -0800
X-CSE-ConnectionGUID: 0jdNurtES8eJFC8Jco+Tyw==
X-CSE-MsgGUID: pdVYpm0PTvGF5oCkgfg7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="211748526"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2026 08:07:57 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjgB1-0000000011p-1zJF;
	Sat, 24 Jan 2026 16:07:55 +0000
Date: Sat, 24 Jan 2026 17:07:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt/linus 70/87]
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000
 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3',
 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3',
 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'tr...
Message-ID: <202601241729.aItDmStt-lkp@intel.com>
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
TO: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/linus
head:   81122fba08fa3ccafab6ed272a5c6f2203923a7e
commit: d0b5a39acd079bccaebbb0d94bfd4649359951c2 [70/87] dt-bindings: pinctrl: mt65xx: Allow gpio-line-names
:::::: branch date: 7 days ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241729.aItDmStt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241729.aItDmStt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241729.aItDmStt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   marvell,wakeup-pin: size (2) error for type uint32
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/mmc@11260000/btmrvl@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2 (marvell,sd8897-bt): marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
--
   marvell,wakeup-pin: size (2) error for type uint32
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/mmc@11260000/btmrvl@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2 (marvell,sd8897-bt): marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
