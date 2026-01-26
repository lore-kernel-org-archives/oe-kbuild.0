Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1B24DFF3
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769455526; cv=none; b=d3lcKTztMDSYJ71aHamEx810pCXcdllqhBWT19VIEPPG2R8lV6GyJLnIwjwPMDRWkDFn1mjV1iD75zRkkHqE75knqTWW+z46srqNQsFDnXWxgFvppRIO/3IfwHYEPZ1jKEM30QsNnOukHDf6J+5ICX5AgRHENniKSQaNTEkOeXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769455526; c=relaxed/simple;
	bh=ebIoItGws/HNfC5VrS+WBckRls2kGRtZQtelkM3phXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yrx6H1ytZuYiAHZJA5j30WDxkAbE3g82hhaWTHtH+lzZquMA5zO6xIQUgFqFxdIa1u+Yg4HWd6TzwkfrgnsUX3wh67xSdYgDPxhNvrPoxeRkHE39ZUBgm8O05y7t5zp1IXg+Zxg4+ryEb2hamSQLOuIREcrOocFsmqJe6SxMuVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A//2dV+K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A//2dV+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769455525; x=1800991525;
  h=date:from:to:cc:subject:message-id;
  bh=ebIoItGws/HNfC5VrS+WBckRls2kGRtZQtelkM3phXo=;
  b=A//2dV+KIZcR4jItXETNO9apbLOIWIEoC43Cp8QQM65bjksp6o6+7klI
   kEEWYNMSyPmCQTStNGdEeyXh+l3WZ44H3vLNMK/fHoIchKruZSQ8qj8oe
   Fbd9NLUR26w0GO936lX29iZcwYKLWxEi4FBzgrJL4znLKKqFQCJ+vqE1p
   lMETG6Hjdpgn47jropy0qeLtTVggvgzH3iNasDxeIocSPRoCk/0T7Qy6f
   e/t/Fio0396MGU0nPunGsDBWx6pP24FlzZBsmWKRQ4msv3KXQCzefizSu
   hWM7lMAychOAbDTbHo9Zbk1eRGhTrX1M5K4ERFAutiB9tQGChpCDYNYC3
   w==;
X-CSE-ConnectionGUID: 0iS2Obb0Sz6ZpChKqyq29g==
X-CSE-MsgGUID: nthPpvQzRaKB8PRaq/2wEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81749867"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="81749867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:25:24 -0800
X-CSE-ConnectionGUID: EyiKB2STTzq8bQEfnaUklg==
X-CSE-MsgGUID: VPAqlJ6rQK2GC7kdb54l6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212300107"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2026 11:25:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkSDB-000000001af-083Z;
	Mon, 26 Jan 2026 19:25:21 +0000
Date: Mon, 26 Jan 2026 20:25:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_sd6hc_support_v1 9/11]
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus):
 regulator-fixed-3p3v: 'ranges' is a required property
Message-ID: <202601262033.k53aP5ic-lkp@intel.com>
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
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_sd6hc_support_v1
head:   a79ac29af37c6923eb8f16457c8d10a545fbcc61
commit: 765391fea3e3d8b523438f7382cd670efe66734a [9/11] arm64: dts: agilex5: add SD controller support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20260125 (https://download.01.org/0day-ci/archive/20260126/202601262033.k53aP5ic-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262033.k53aP5ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601262033.k53aP5ic-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cap-sd-highspeed', 'clock-names', 'disable-wp', 'iommus', 'max-frequency', 'no-mmc', 'reset-names', 'sdhci-caps', 'sdhci-caps-mask', 'vmmc-supply', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
