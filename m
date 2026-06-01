Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43B3DC875
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329079; cv=none; b=IJb+7DXGXLrGGTRZ7OFtZTsEzEuyp0cY9+8MBh55COKMCla9+BsDsZErh9CXNhRmDs/+NdsW14TcHyEv/URx2bTSmkOXraxrLmA69B3zUYioq9UMihIUSaiEwmPIRtkXTvAQPt5/Y0a4MTsxWGzIunnCJSjzgcdmaAitnLNzJU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329079; c=relaxed/simple;
	bh=uHb10VU3LGRxKip7KyUfAStV+9LcnuII+t+mF2w4HCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YuxwyeNyg7Qbe+sP0nT3d1G3GIxy3MCw+qdVDLKHpzNfiYmx1DumjzzB5twLSGo7XPij2gcCCnQqdwyn25hh+q4Lh3439okXx3Bj7TezFGpIeWLsZW2XwKVzHB0VWFF/8XEMuhuTVfwwBlvE2P/giI8mDrTt9mtvQ1j58yYGi/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVZD7slo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVZD7slo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780329078; x=1811865078;
  h=date:from:to:cc:subject:message-id;
  bh=uHb10VU3LGRxKip7KyUfAStV+9LcnuII+t+mF2w4HCA=;
  b=fVZD7sloSXZfTlEQbWVIfMvkOd8LQUIDQZPqo1r50eYXlzJQKhX+DdT5
   PQq1TM3eZKPnK6AMKCDk3lmVJOAcBrqZq5KwUUzt/ToCrirN4yXSq/4E1
   pMIc456qWO01JfxGIY+ITO/EWRWRaYRdVtobD8ZWigHmYyUwKQchq2rWB
   V9vVOHm531o4u3LNsBPwlakRbThxAeF+caYwQimC5zhIVZZrnev7u2WEI
   Rms/ugTfvv2kVtFQ5TyrJikvrYtc4+qwMFahhb7Lw8SMc5dKPKgRX/OpZ
   uYWw2Jgch4vOEuicUqUwJkznO+BDirG1aBJ/a6ej72CXFRDbityYa1kln
   Q==;
X-CSE-ConnectionGUID: rEPyhgeJSEmlplC7vEzJMQ==
X-CSE-MsgGUID: zMOwnbG+T0WFyxegYx9t9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81084689"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81084689"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 08:51:17 -0700
X-CSE-ConnectionGUID: Mv7/M3QoSTKzJwQqJHBaeg==
X-CSE-MsgGUID: Xb5sPYDORZaVPbsnobsOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239196105"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 08:51:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU4v3-000000001bl-2MYA;
	Mon, 01 Jun 2026 15:51:13 +0000
Date: Mon, 01 Jun 2026 17:51:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-tegra:for-7.2/arm/dt 6/14]
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: front-camera@48 (onnn,mt9m114):
 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202606011753.mZdRgeRb-lkp@intel.com>
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
commit: 8399055d9f98e94c33608fe9d61afc09a43cc4df [6/14] ARM: tegra: lg-x3: Complete video device graph
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260531 (https://download.01.org/0day-ci/archive/20260601/202606011753.mZdRgeRb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011753.mZdRgeRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011753.mZdRgeRb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:55.22-61.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: front-camera@48 (onnn,mt9m114): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: dsi@2 (solomon,ssd2825): '#address-cells', '#size-cells', 'panel@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: panel@1 (koe,tx13d100vm0eaa): 'backlight' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
