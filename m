Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6D3E123F
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 18:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301065; cv=none; b=etyxSW89UYl0ns5zs3PvnQBpNiKMe+Qk+f26n8SlPu5OIJuXTsi+MkXSSTiZ2UWyoT8N4w7OyVTC6EmlUSIL2c+uD+59PedMriG4ztwxnFhCOqrQFTkmcSRtix90ptf9HauPQRpUslH+lLrK7Zr4UdzN2wSPs74zQTqeR5bJah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301065; c=relaxed/simple;
	bh=UFJSoCVMxqhqBxePWmMpICd2Ts1dC/MuWNf5TIintq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qAkCt+2lk9rekgpLKehyLsYkMcUDIZnpsvo8j4xoNYuh5ehlFwKbqbPOylhxiMG/Sr50D1y6sl5ukIw4uHuOyK7jgXyraQM5zb4kmml3kHFELB7GxFLj+CYVbZ+F//Q0lcJamUeWj6o+t0R5CkHf1b+6APLFy29USlZQXPR1OBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li9ifnQ8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li9ifnQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779301062; x=1810837062;
  h=date:from:to:cc:subject:message-id;
  bh=UFJSoCVMxqhqBxePWmMpICd2Ts1dC/MuWNf5TIintq4=;
  b=Li9ifnQ8wXrtxp5qA2SsIP42a9riIuRlyhVk9XU4wspRaAX+l6GXv4n0
   +TL6qUrxTajUA2bf2PH59LQG9jdSR1cvB2D84zs+QZu9tJ7LET/Rq/zjC
   e/SKPlAQEu6XCQ/EhdruWDst4npX6J5NmxPtyhAvJf6k51l2bA5Lp8Err
   I5hP/pvwwLdeOjKJZED0G6rM/KCVw+5n7Fz5lJPnSfBMg4PL4Gi29gmOf
   tMAtzPBJwVsDz4GeDFO0d4f+Vs8SDZCL7MvVE9dWiW54siqSyV9vL1xdq
   z30P8N1PLUuM0x3ZDdmOi3mDO2AL63a4q5SSlTtiXMR+uWkZ8TPNJzokH
   g==;
X-CSE-ConnectionGUID: 4nvseb4rTo+5V2HVhX64PA==
X-CSE-MsgGUID: y0DG6DwZQIisMEKq1tGwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102887752"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102887752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 11:17:42 -0700
X-CSE-ConnectionGUID: 59WlUQ4FTNmoQ2GB9Ib93w==
X-CSE-MsgGUID: lTsu7prMS0+TEWhGvI7y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="236013749"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 11:17:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPlUA-00000000AcP-1zix;
	Wed, 20 May 2026 18:17:38 +0000
Date: Wed, 20 May 2026 20:16:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0
 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
Message-ID: <202605202055.CgcZFymk-lkp@intel.com>
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
TO: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tanmay-Kathpalia/dt-bindings-reset-altr-add-COMBOPHY_RESET-for-Agilex5/20260514-171032
head:   622e0667dd0c2dd40581a3ccfb6c36f7afb1da3e
commit: 5f6cfbf70920762cfa4ef7066c28381baf1947d0 arm64: dts: agilex5: add SOCDK eMMC daughter board support
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20260520 (https://download.01.org/0day-ci/archive/20260520/202605202055.CgcZFymk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605202055.CgcZFymk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605202055.CgcZFymk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc@10808000 (altr,agilex5-sd6hc): Unevaluated properties are not allowed ('dma-coherent', 'fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
--
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-cyclone5' was expected
   	'enclustra,mercury-sa1' was expected
   	'enclustra,mercury-sa2' was expected
   	'altr,socfpga-stratix10' was expected
   	'intel,socfpga-agilex' was expected
   	'intel,socfpga-agilex3' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /: failed to match any schema with compatible: ['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: mmc@10808000 (altr,agilex5-sd6hc): Unevaluated properties are not allowed ('dma-coherent', 'fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
