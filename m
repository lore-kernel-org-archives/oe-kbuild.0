Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB453019B2
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769469988; cv=none; b=FxG6HaHGR5c3gLufmF2a400Iiz0TZ4GZ6pcCxaE8ZGW3pJ7ALptMOS7njqTXZTu5BrFGzv/5eTx9xBPyIL0GZ5KT/2T7tnDHXqkg8lWfdVpBSD0xP04ofGZr2npLPiowpwkD6lV2qSW4cOCO7w8or0tePVCtvWF0x16ZXvcjqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769469988; c=relaxed/simple;
	bh=k769etM3IhKCCRAkYL7XuN/q9tBM9zFBeCZhJ9F31AU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PAW34EJAWrDyB5+k0P1s+MDtLn42inwWH14X9vEe5xhmehGzRYJWd/i/L3rtjc+ENCD3JfpYPRPdYpthLorb8IZomd+UHfb8o2JxUPfVNbUdpCHIDHM5+mo7PvEeyjJR4e2qXKuAEzvRHLekojTeQUlwYsY/AOgsGZATiVMmk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVPCQSBy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVPCQSBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769469987; x=1801005987;
  h=date:from:to:cc:subject:message-id;
  bh=k769etM3IhKCCRAkYL7XuN/q9tBM9zFBeCZhJ9F31AU=;
  b=HVPCQSBySwCIjm4FFtSczXGwkhYhiM1c6NXOgO4IsL83sj8fVqo3132Y
   hdh4AqnCsmaX5qtzLm/imQMgo4vPA78XSulxqWUSpoHkLSA0jEu+IesOh
   oz50l9YtUqED9OXQ9b00cQFPRTbw7Ssc5lOmUspZCbjNA8GgdT97aXQiI
   5GWIQ6JWhUFmfu8g2HERGbocttY4yi6mVDLb3s59eDpT0EQ9hfsxR+a4X
   sEG/lkCORHoBWFddBMWG1oKENaG8suMAlB2Umiuh8y/WGP7XQVutSZK5J
   c7ow0Syq5+mGi2PrXviFB6rsOhmkfqHonpBjPc9JoWwz12sXI1mVR+UFP
   g==;
X-CSE-ConnectionGUID: ryobEd+8QXmwlxGw5y19vQ==
X-CSE-MsgGUID: QKzky8wkTE+O5p3iw25ZYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69856899"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="69856899"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 15:26:26 -0800
X-CSE-ConnectionGUID: o3KkUnCwRsq7Hnl/kJzoOg==
X-CSE-MsgGUID: HxLbN1AdRuymTTHmA5F1Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212270265"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 15:26:24 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkVyQ-000000001cr-3Je2;
	Mon, 26 Jan 2026 23:26:22 +0000
Date: Tue, 27 Jan 2026 00:26:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_sd6hc_support_v1 11/11]
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus):
 regulator-fixed-1p8v: 'ranges' is a required property
Message-ID: <202601270030.1MeiJ2M5-lkp@intel.com>
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
commit: a79ac29af37c6923eb8f16457c8d10a545fbcc61 [11/11] arm64: dts: agilex5: add SOCDK eMMC daughter board support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20260125 (https://download.01.org/0day-ci/archive/20260127/202601270030.1MeiJ2M5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270030.1MeiJ2M5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601270030.1MeiJ2M5-lkp@intel.com/

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
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:320.41-326.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: soc@0 (simple-bus): regulator-fixed-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: mmc0@10808000 (altr,agilex5-sd6hc): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cap-mmc-highspeed', 'clock-names', 'disable-wp', 'iommus', 'max-frequency', 'no-1-8-v', 'no-sd', 'no-sdio', 'non-removable', 'reset-names', 'sdhci-caps', 'sdhci-caps-mask', 'vmmc-supply', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
