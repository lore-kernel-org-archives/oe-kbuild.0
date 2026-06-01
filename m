Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3C370D56
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337060; cv=none; b=FelqL1Hq8zjkZNowRv/gqfyQ9ckqEFUN7c2wsyeU/Md8BDIGbUMm2AgiSRiEMduicThSbAJLVy6+Cl3CBThZgocffKyp6m4cm5tD84YUrRrFAwf+NTKhnqn3uYVODZQ5tdD1cYmFLCTCF1/yKzp96HHzm9QW4VIwjfGQIILvAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337060; c=relaxed/simple;
	bh=xPQAhwtCQFMWIgmag05S/nTb/d8+NZRAqd9JNlB53tc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OTlJcu2UXM+Kmouazf57P+lwX93WzA2Rl0Mvq92DiQ/ELuDbz5xEAunh+diaGeDGXA2qQsaZs/q78fgVZnnHN+SlmInqQVwtDHIWenUvD1z9+/v6T76FgR4zPxIZ8ulQFBnMMaH5Fh7q4/VG/wqm9SqP5RXfVHkfUFAORaWd79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAwuDFIV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAwuDFIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780337059; x=1811873059;
  h=date:from:to:cc:subject:message-id;
  bh=xPQAhwtCQFMWIgmag05S/nTb/d8+NZRAqd9JNlB53tc=;
  b=YAwuDFIVmEM347uGjxs/F+GSvpIeXQ8sWNZZlllvBaN5xaz1GTK/wx8S
   qDE9Pps8WEY33vd9hd6vyWkoxQ0F1Cetd+d4HvBZSasDg62vMpGtyQlv9
   4n++OHJbNEA6PVDYImAq77+MZTQOni8WzkCqbOkMpH+YFUYiN76iQwpCB
   za4W2+JYR5Dt1VgjBLrcOQ20Pixppdk/2eOmJ/x9muSOC9iOEbATaI9fG
   ikoPWv+aWLIzD0TDRm9Zd7A1K2vhuG8YcLuRsJ6gLQaG2oki8kAmImhqj
   sda12JXTx9BRb+g54R2a/LfFOgNKOCJIrvKwHu8n66WKnEtHuhLWd9pWo
   w==;
X-CSE-ConnectionGUID: 8srDpxwnQK+2pWCEIyxqOg==
X-CSE-MsgGUID: aeK9j327SLGU9JS7pCKJcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80952483"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80952483"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 11:04:18 -0700
X-CSE-ConnectionGUID: bpLRssnqRVaHu2E+OBCUHQ==
X-CSE-MsgGUID: uJMwzE4lRcagOWIThlk0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="267531246"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2026 11:04:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU6zm-000000001cb-3iim;
	Mon, 01 Jun 2026 18:04:14 +0000
Date: Mon, 01 Jun 2026 20:03:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-tegra:for-7.2/arm/dt 9/14]
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb:
 front-camera@48 (aptina,mi1040): 'orientation' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202606011944.DlovlEMA-lkp@intel.com>
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
CC: linux-tegra@vger.kernel.org
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-7.2/arm/dt
head:   774bc2764647cfd6b65727cfa978d809f11df392
commit: a5acde8adb4d4d921a004b8df995d50255253afa [9/14] ARM: tegra: grouper: Add support for front camera
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20260531 (https://download.01.org/0day-ci/archive/20260601/202606011944.DlovlEMA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011944.DlovlEMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011944.DlovlEMA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
--
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
