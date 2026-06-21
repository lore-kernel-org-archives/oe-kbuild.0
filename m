Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598AC233953
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jun 2026 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782052366; cv=none; b=F0fEMvBzrENWFFQz56/zR2jV3dHBW0IElNLhLsgXVpyDWlqxvU1QlqWbJISgmHXJBaraoCY/+ftcA1NUAWS/ae7K1SJfPFin+5CQ6JsbiL++eDFbwDlzlaR6Op/saH4iLfGWys6XWWOSIDeSRRp7g5t1lA1SgIJxilArlFL3Lb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782052366; c=relaxed/simple;
	bh=TvcUS9azzXZyzL7lMk078UoIRMzUb0JnsbRt7oEkMys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k5k9cefpqot4YKuQ/bo4/fQZEkpnrJAFz21Q6GXVevmzoQLERapw55KEl9q3rO4b/+fxF7bRpky9XhsMAoUoJRa84oNocKnpDiHJzsfbkShHspzHKCbRPrUxsoDqnvtV4S/B7BNSEchHlj/1dXEcBARc2z2oZoC6TfSTQh7P6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddkRLESF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddkRLESF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782052364; x=1813588364;
  h=date:from:to:cc:subject:message-id;
  bh=TvcUS9azzXZyzL7lMk078UoIRMzUb0JnsbRt7oEkMys=;
  b=ddkRLESFoT1da14DFMeAHsL3Wlf6fiGMs+SUlhUp47NJkN65PTDna+ZP
   qCfASEUKyLGI07JWkTDu0UwDk7HygOTP6ZbJjhlfLIN8WR3x7I7eeStM9
   g84SEJVEa9P8/WH7wOX0bKSwxdI2HZ666epxxmHQwdRGDtb4rLZLs1kjw
   j5+8r/iV1jyc6aU0tAMddJPqnCQEg95n7BaqRpXOGbY/MCAPNyyKN+IJg
   Y0loLGmgIOmUVc5rGvLyB1TdHqrvljD5+ys2XQND22bmhlLv3+O2f6kEd
   TaDA640HwXGPohHUHskq2tll/wBappev/M/HqN0wctX5cTxAsEEzIQQqW
   A==;
X-CSE-ConnectionGUID: XB49XJqWRiGygn4ZTKwSQw==
X-CSE-MsgGUID: uhT5m3ODRg+UcVtObMyC1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82912581"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="82912581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 07:32:44 -0700
X-CSE-ConnectionGUID: BKhYGanuQz67QRzYn0aixg==
X-CSE-MsgGUID: N5iS/avMROWgSR6KZnOK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="242660674"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jun 2026 07:32:42 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbJE0-000000005sb-3aoq;
	Sun, 21 Jun 2026 14:32:40 +0000
Date: Sun, 21 Jun 2026 16:31:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 lvds-controller@e1408000 (microchip,sama7d65-lvds): compatible:0:
 'microchip,sam9x75-lvds' was expected
Message-ID: <202606211606.MffoqXCK-lkp@intel.com>
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
TO: Ryan Wanner <Ryan.Wanner@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   390d73adf896bf4883c7d3bcd13c1b53d64351e3
commit: d83734a0bd253cab38b52065b2e35fa34c2d8770 ARM: dts: microchip: sama7d65: add LVDS controller
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260619 (https://download.01.org/0day-ci/archive/20260621/202606211606.MffoqXCK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260621/202606211606.MffoqXCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d83734a0bd25 ("ARM: dts: microchip: sama7d65: add LVDS controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606211606.MffoqXCK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt'] is too long
   	'microchip,sama7d65-wdt' is not one of ['atmel,sama5d4-wdt', 'microchip,sam9x60-wdt', 'microchip,sama7g5-wdt']
   	'microchip,sam9x7-wdt' was expected
   	'microchip,sam9x60-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/watchdog@e001d000: failed to match any schema with compatible: ['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: lvds-controller@e1408000 (microchip,sama7d65-lvds): compatible:0: 'microchip,sam9x75-lvds' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-lvds.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: lvds-controller@e1408000 (microchip,sama7d65-lvds): compatible: ['microchip,sama7d65-lvds', 'microchip,sam9x75-lvds'] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-lvds.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/lvds-controller@e1408000: failed to match any schema with compatible: ['microchip,sama7d65-lvds', 'microchip,sam9x75-lvds']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
