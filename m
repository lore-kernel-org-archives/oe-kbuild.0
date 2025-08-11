Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6427877B
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919896; cv=none; b=In6Y5b7AAjTZ6TOU73kbbWRarjtdPDn2MSrVGCEq9ZSOgaSNRYBio67W4mf6B0QVIloS6/VxjA3MytmBk3penzAu9uiGQT/K7jAziSh5u69ubnPNRg1+4GnPWbwmXHVN9pE1Qc09T+OFhzurjV8vZf8j6znJDPJVsco+hNVCTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919896; c=relaxed/simple;
	bh=6sJEqHCDSiTBo4PJkKpZWjHq8hjiP/r7T24l7bcoXwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvi8kU1Eh823txwrS9kbMYiQvyDcB0I/+FfMGpdEYI2eBlRGa24z8L5qytVy9ldMGpzWFx7NgCV+xH7E9mNk7vsSQqagwuZAQonO8IY8U0xNrmZzbsUE7yTP7GGpwhSeV/jLFEdQpiCEl2poMXqxWD/4Q8XRZgScqqiKsf8fH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GD8aFQo7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GD8aFQo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754919894; x=1786455894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sJEqHCDSiTBo4PJkKpZWjHq8hjiP/r7T24l7bcoXwU=;
  b=GD8aFQo7EUwHQ46MnhsB0UTZykpmN5Hbt4jVSv/RJbswwhSEjKlCUHvc
   p88UbqSyRuJSRudTNKXLVSxgdI/jrOG81h66JCE+bC9zbG3UcC7INpFTH
   Uvy3VnKqVSVCQVk9EropZU8Vk4UqY02LvcOTry2OaxR53FRn0++BcMJf2
   t9msb31ZHPCvxS/dIC8lnzmPPf8c/xZaln0Q5s9n2jURcpq+aZ9uXa0Bn
   8wvdF/3/7uHsv8FhdA/0rbYzojqQlKrCQpxGeFCz3X0Lm8RxaCW+FcK9H
   w+/rRjQsDRIie8qhVHzaenCT0k3OZlb75c1k60I3o8VmX9PWpNPFVbSvt
   g==;
X-CSE-ConnectionGUID: Xz6/9cl9QnmgL279fK14+Q==
X-CSE-MsgGUID: reQHpAxFScm04/TFjNDSow==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67441876"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67441876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 06:44:53 -0700
X-CSE-ConnectionGUID: v/3+7dT9RXKM6phj+d7j5g==
X-CSE-MsgGUID: 9C1WlYpyTzu5OWr2DZgaKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166719886"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Aug 2025 06:44:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulSpV-0005tm-1t;
	Mon, 11 Aug 2025 13:44:49 +0000
Date: Mon, 11 Aug 2025 21:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/9]
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning
 (avoid_unnecessary_addr_size): /sound: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508112120.fidKkVJi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   18adc1b2661a506b233aa53c4fbe2243c7f4db20
commit: 2a52e4d89847745f8ab76265199a371ef5e7f93f [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-002-20250811 (https://download.01.org/0day-ci/archive/20250811/202508112120.fidKkVJi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508112120.fidKkVJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508112120.fidKkVJi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi:492.31-507.4: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts:138.9-149.5: Warning (graph_child_address): /soc/i2c@1c2ac00/anx6345@38/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:183.32-196.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:170.15-197.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1217.20-1234.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
--
   arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1351.10-1354.7: Warning (unit_address_vs_reg): /i2c@7000d000/pmic@3c/fps/fps0: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1356.10-1360.7: Warning (unit_address_vs_reg): /i2c@7000d000/pmic@3c/fps/fps1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1362.10-1365.7: Warning (unit_address_vs_reg): /i2c@7000d000/pmic@3c/fps/fps2: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
--
   arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi:168.24-174.5: Warning (simple_bus_reg): /crmu/sdio0_clk: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi:176.24-182.5: Warning (simple_bus_reg): /crmu/sdio1_clk: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:55.17-61.5: Warning (simple_bus_reg): /fs4/raid@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:63.17-69.5: Warning (simple_bus_reg): /fs4/raid@1: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:71.17-77.5: Warning (simple_bus_reg): /fs4/raid@2: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:79.17-85.5: Warning (simple_bus_reg): /fs4/raid@3: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:87.17-93.5: Warning (simple_bus_reg): /fs4/raid@4: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:95.17-101.5: Warning (simple_bus_reg): /fs4/raid@5: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:103.17-109.5: Warning (simple_bus_reg): /fs4/raid@6: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:111.17-117.5: Warning (simple_bus_reg): /fs4/raid@7: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi:43.25-346.5: Warning (avoid_unnecessary_addr_size): /hsls/pinmux@14029c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:45.9-51.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:61.11-67.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@100: duplicate unit-address (also used in node /cpus/l2-cache@100)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:77.11-83.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@200: duplicate unit-address (also used in node /cpus/l2-cache@200)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:93.11-99.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@300: duplicate unit-address (also used in node /cpus/l2-cache@300)
   arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi:39.30-45.5: Warning (unique_unit_address_if_enabled): /fs4/crypto_mbox@0: duplicate unit-address (also used in node /fs4/raid@0)
--
   arch/arm64/boot/dts/apm/apm-storm.dtsi:763.14-766.5: Warning (simple_bus_reg): /soc/i2cslimpro: missing or empty reg/ranges property
   arch/arm64/boot/dts/apm/apm-storm.dtsi:768.16-771.5: Warning (simple_bus_reg): /soc/hwmonslimpro: missing or empty reg/ranges property
   arch/arm64/boot/dts/apm/apm-storm.dtsi:973.23-979.5: Warning (unique_unit_address_if_enabled): /soc/mdio@17020000: duplicate unit-address (also used in node /soc/ethernet@17020000)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:229.30-238.6: Warning (unique_unit_address_if_enabled): /soc/clocks/sge0clk@1f21c000: duplicate unit-address (also used in node /soc/clocks/sata01clk@1f21c000)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:275.38-287.6: Warning (unique_unit_address_if_enabled): /soc/clocks/sataphy1clk@1f22c000: duplicate unit-address (also used in node /soc/clocks/sata23clk@1f22c000)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:289.38-301.6: Warning (unique_unit_address_if_enabled): /soc/clocks/sataphy1clk@1f23c000: duplicate unit-address (also used in node /soc/clocks/sata45clk@1f23c000)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:178.28-188.6: Warning (unique_unit_address_if_enabled): /soc/clocks/ahbclk@17000000: duplicate unit-address (also used in node /soc/clocks/rtcclk@17000000)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:178.28-188.6: Warning (unique_unit_address_if_enabled): /soc/clocks/ahbclk@17000000: duplicate unit-address (also used in node /soc/clocks/rngpkaclk@17000000)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:342.28-353.6: Warning (unique_unit_address_if_enabled): /soc/clocks/rtcclk@17000000: duplicate unit-address (also used in node /soc/clocks/rngpkaclk@17000000)
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:636.4-639.42: Warning (interrupt_map): /soc/pcie@1f2b0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:636.4-639.42: Warning (interrupt_map): /soc/pcie@1f2b0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:636.4-639.42: Warning (interrupt_map): /soc/pcie@1f2b0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:636.4-639.42: Warning (interrupt_map): /soc/pcie@1f2b0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:662.4-665.42: Warning (interrupt_map): /soc/pcie@1f2c0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:662.4-665.42: Warning (interrupt_map): /soc/pcie@1f2c0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:662.4-665.42: Warning (interrupt_map): /soc/pcie@1f2c0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:662.4-665.42: Warning (interrupt_map): /soc/pcie@1f2c0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:688.4-691.42: Warning (interrupt_map): /soc/pcie@1f2d0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:688.4-691.42: Warning (interrupt_map): /soc/pcie@1f2d0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:688.4-691.42: Warning (interrupt_map): /soc/pcie@1f2d0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:688.4-691.42: Warning (interrupt_map): /soc/pcie@1f2d0000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:714.4-717.42: Warning (interrupt_map): /soc/pcie@1f500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:714.4-717.42: Warning (interrupt_map): /soc/pcie@1f500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:714.4-717.42: Warning (interrupt_map): /soc/pcie@1f500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:714.4-717.42: Warning (interrupt_map): /soc/pcie@1f500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:740.4-743.42: Warning (interrupt_map): /soc/pcie@1f510000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:740.4-743.42: Warning (interrupt_map): /soc/pcie@1f510000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:740.4-743.42: Warning (interrupt_map): /soc/pcie@1f510000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
>> arch/arm64/boot/dts/apm/apm-storm.dtsi:740.4-743.42: Warning (interrupt_map): /soc/pcie@1f510000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
--
>> arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1425.3-1428.29: Warning (interrupt_map): /bus@100000/pcie@2910000:interrupt-map: Missing property '#address-cells' in node /bus@100000/pcie@2910000/interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1425.3-1428.29: Warning (interrupt_map): /bus@100000/pcie@2910000:interrupt-map: Missing property '#address-cells' in node /bus@100000/pcie@2910000/interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1425.3-1428.29: Warning (interrupt_map): /bus@100000/pcie@2910000:interrupt-map: Missing property '#address-cells' in node /bus@100000/pcie@2910000/interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1425.3-1428.29: Warning (interrupt_map): /bus@100000/pcie@2910000:interrupt-map: Missing property '#address-cells' in node /bus@100000/pcie@2910000/interrupt-controller, using 0 as fallback

vim +170 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi

6bc37fac30cf01 Andre Przywara      2016-01-18   15  
6bc37fac30cf01 Andre Przywara      2016-01-18   16  / {
6bc37fac30cf01 Andre Przywara      2016-01-18   17  	interrupt-parent = <&gic>;
6bc37fac30cf01 Andre Przywara      2016-01-18   18  	#address-cells = <1>;
6bc37fac30cf01 Andre Przywara      2016-01-18   19  	#size-cells = <1>;
6bc37fac30cf01 Andre Przywara      2016-01-18   20  
c1cff65f9b16b3 Harald Geyer        2018-03-15   21  	chosen {
c1cff65f9b16b3 Harald Geyer        2018-03-15   22  		#address-cells = <1>;
c1cff65f9b16b3 Harald Geyer        2018-03-15   23  		#size-cells = <1>;
c1cff65f9b16b3 Harald Geyer        2018-03-15   24  		ranges;
c1cff65f9b16b3 Harald Geyer        2018-03-15   25  
c1cff65f9b16b3 Harald Geyer        2018-03-15   26  		simplefb_lcd: framebuffer-lcd {
c1cff65f9b16b3 Harald Geyer        2018-03-15   27  			compatible = "allwinner,simple-framebuffer",
c1cff65f9b16b3 Harald Geyer        2018-03-15   28  				     "simple-framebuffer";
c1cff65f9b16b3 Harald Geyer        2018-03-15   29  			allwinner,pipeline = "mixer0-lcd0";
c1cff65f9b16b3 Harald Geyer        2018-03-15   30  			clocks = <&ccu CLK_TCON0>,
2c796fc8f5dbd1 Icenowy Zheng       2018-06-22   31  				 <&display_clocks CLK_MIXER0>;
c1cff65f9b16b3 Harald Geyer        2018-03-15   32  			status = "disabled";
c1cff65f9b16b3 Harald Geyer        2018-03-15   33  		};
fca63f58972508 Icenowy Zheng       2018-06-22   34  
fca63f58972508 Icenowy Zheng       2018-06-22   35  		simplefb_hdmi: framebuffer-hdmi {
fca63f58972508 Icenowy Zheng       2018-06-22   36  			compatible = "allwinner,simple-framebuffer",
fca63f58972508 Icenowy Zheng       2018-06-22   37  				     "simple-framebuffer";
fca63f58972508 Icenowy Zheng       2018-06-22   38  			allwinner,pipeline = "mixer1-lcd1-hdmi";
fca63f58972508 Icenowy Zheng       2018-06-22   39  			clocks = <&display_clocks CLK_MIXER1>,
fca63f58972508 Icenowy Zheng       2018-06-22   40  				 <&ccu CLK_TCON1>, <&ccu CLK_HDMI>;
fca63f58972508 Icenowy Zheng       2018-06-22   41  			status = "disabled";
fca63f58972508 Icenowy Zheng       2018-06-22   42  		};
c1cff65f9b16b3 Harald Geyer        2018-03-15   43  	};
c1cff65f9b16b3 Harald Geyer        2018-03-15   44  
6bc37fac30cf01 Andre Przywara      2016-01-18   45  	cpus {
6bc37fac30cf01 Andre Przywara      2016-01-18   46  		#address-cells = <1>;
6bc37fac30cf01 Andre Przywara      2016-01-18   47  		#size-cells = <0>;
6bc37fac30cf01 Andre Przywara      2016-01-18   48  
6bc37fac30cf01 Andre Przywara      2016-01-18   49  		cpu0: cpu@0 {
31af04cd60d316 Rob Herring         2019-01-14   50  			compatible = "arm,cortex-a53";
6bc37fac30cf01 Andre Przywara      2016-01-18   51  			device_type = "cpu";
6bc37fac30cf01 Andre Przywara      2016-01-18   52  			reg = <0>;
6bc37fac30cf01 Andre Przywara      2016-01-18   53  			enable-method = "psci";
7db1aa6ff9811b Alexander Kochetkov 2020-08-03   54  			clocks = <&ccu CLK_CPUX>;
f267eff70c0c4f Vasily Khoruzhick   2020-01-07   55  			clock-names = "cpu";
e1c3804a177418 Vasily Khoruzhick   2020-01-07   56  			#cooling-cells = <2>;
7360e752165496 Dragan Simic        2024-04-28   57  			i-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28   58  			i-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28   59  			i-cache-sets = <256>;
7360e752165496 Dragan Simic        2024-04-28   60  			d-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28   61  			d-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28   62  			d-cache-sets = <128>;
7360e752165496 Dragan Simic        2024-04-28   63  			next-level-cache = <&l2_cache>;
6bc37fac30cf01 Andre Przywara      2016-01-18   64  		};
6bc37fac30cf01 Andre Przywara      2016-01-18   65  
6bc37fac30cf01 Andre Przywara      2016-01-18   66  		cpu1: cpu@1 {
31af04cd60d316 Rob Herring         2019-01-14   67  			compatible = "arm,cortex-a53";
6bc37fac30cf01 Andre Przywara      2016-01-18   68  			device_type = "cpu";
6bc37fac30cf01 Andre Przywara      2016-01-18   69  			reg = <1>;
6bc37fac30cf01 Andre Przywara      2016-01-18   70  			enable-method = "psci";
7db1aa6ff9811b Alexander Kochetkov 2020-08-03   71  			clocks = <&ccu CLK_CPUX>;
f267eff70c0c4f Vasily Khoruzhick   2020-01-07   72  			clock-names = "cpu";
e1c3804a177418 Vasily Khoruzhick   2020-01-07   73  			#cooling-cells = <2>;
7360e752165496 Dragan Simic        2024-04-28   74  			i-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28   75  			i-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28   76  			i-cache-sets = <256>;
7360e752165496 Dragan Simic        2024-04-28   77  			d-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28   78  			d-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28   79  			d-cache-sets = <128>;
7360e752165496 Dragan Simic        2024-04-28   80  			next-level-cache = <&l2_cache>;
6bc37fac30cf01 Andre Przywara      2016-01-18   81  		};
6bc37fac30cf01 Andre Przywara      2016-01-18   82  
6bc37fac30cf01 Andre Przywara      2016-01-18   83  		cpu2: cpu@2 {
31af04cd60d316 Rob Herring         2019-01-14   84  			compatible = "arm,cortex-a53";
6bc37fac30cf01 Andre Przywara      2016-01-18   85  			device_type = "cpu";
6bc37fac30cf01 Andre Przywara      2016-01-18   86  			reg = <2>;
6bc37fac30cf01 Andre Przywara      2016-01-18   87  			enable-method = "psci";
7db1aa6ff9811b Alexander Kochetkov 2020-08-03   88  			clocks = <&ccu CLK_CPUX>;
f267eff70c0c4f Vasily Khoruzhick   2020-01-07   89  			clock-names = "cpu";
e1c3804a177418 Vasily Khoruzhick   2020-01-07   90  			#cooling-cells = <2>;
7360e752165496 Dragan Simic        2024-04-28   91  			i-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28   92  			i-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28   93  			i-cache-sets = <256>;
7360e752165496 Dragan Simic        2024-04-28   94  			d-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28   95  			d-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28   96  			d-cache-sets = <128>;
7360e752165496 Dragan Simic        2024-04-28   97  			next-level-cache = <&l2_cache>;
6bc37fac30cf01 Andre Przywara      2016-01-18   98  		};
6bc37fac30cf01 Andre Przywara      2016-01-18   99  
6bc37fac30cf01 Andre Przywara      2016-01-18  100  		cpu3: cpu@3 {
31af04cd60d316 Rob Herring         2019-01-14  101  			compatible = "arm,cortex-a53";
6bc37fac30cf01 Andre Przywara      2016-01-18  102  			device_type = "cpu";
6bc37fac30cf01 Andre Przywara      2016-01-18  103  			reg = <3>;
6bc37fac30cf01 Andre Przywara      2016-01-18  104  			enable-method = "psci";
7db1aa6ff9811b Alexander Kochetkov 2020-08-03  105  			clocks = <&ccu CLK_CPUX>;
f267eff70c0c4f Vasily Khoruzhick   2020-01-07  106  			clock-names = "cpu";
e1c3804a177418 Vasily Khoruzhick   2020-01-07  107  			#cooling-cells = <2>;
7360e752165496 Dragan Simic        2024-04-28  108  			i-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28  109  			i-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28  110  			i-cache-sets = <256>;
7360e752165496 Dragan Simic        2024-04-28  111  			d-cache-size = <0x8000>;
7360e752165496 Dragan Simic        2024-04-28  112  			d-cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28  113  			d-cache-sets = <128>;
7360e752165496 Dragan Simic        2024-04-28  114  			next-level-cache = <&l2_cache>;
39defc813264ea Andre Przywara      2018-07-30  115  		};
39defc813264ea Andre Przywara      2018-07-30  116  
7360e752165496 Dragan Simic        2024-04-28  117  		l2_cache: l2-cache {
39defc813264ea Andre Przywara      2018-07-30  118  			compatible = "cache";
39defc813264ea Andre Przywara      2018-07-30  119  			cache-level = <2>;
4c84cced930430 Krzysztof Kozlowski 2023-04-22  120  			cache-unified;
7360e752165496 Dragan Simic        2024-04-28  121  			cache-size = <0x80000>;
7360e752165496 Dragan Simic        2024-04-28  122  			cache-line-size = <64>;
7360e752165496 Dragan Simic        2024-04-28  123  			cache-sets = <512>;
6bc37fac30cf01 Andre Przywara      2016-01-18  124  		};
6bc37fac30cf01 Andre Przywara      2016-01-18  125  	};
6bc37fac30cf01 Andre Przywara      2016-01-18  126  
e85f28e047d06d Jagan Teki          2018-09-25  127  	de: display-engine {
e85f28e047d06d Jagan Teki          2018-09-25  128  		compatible = "allwinner,sun50i-a64-display-engine";
e85f28e047d06d Jagan Teki          2018-09-25  129  		allwinner,pipelines = <&mixer0>,
e85f28e047d06d Jagan Teki          2018-09-25  130  				      <&mixer1>;
e85f28e047d06d Jagan Teki          2018-09-25  131  		status = "disabled";
e85f28e047d06d Jagan Teki          2018-09-25  132  	};
e85f28e047d06d Jagan Teki          2018-09-25  133  
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  134  	gpu_opp_table: opp-table-gpu {
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  135  		compatible = "operating-points-v2";
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  136  
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  137  		opp-432000000 {
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  138  			opp-hz = /bits/ 64 <432000000>;
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  139  		};
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  140  	};
e954a7afe8f5d2 Jernej Skrabec      2021-09-12  141  
5dfdedf0de9a7c Krzysztof Kozlowski 2024-03-17  142  	osc24M: osc24M-clk {
6bc37fac30cf01 Andre Przywara      2016-01-18  143  		#clock-cells = <0>;
6bc37fac30cf01 Andre Przywara      2016-01-18  144  		compatible = "fixed-clock";
6bc37fac30cf01 Andre Przywara      2016-01-18  145  		clock-frequency = <24000000>;
6bc37fac30cf01 Andre Przywara      2016-01-18  146  		clock-output-names = "osc24M";
6bc37fac30cf01 Andre Przywara      2016-01-18  147  	};
6bc37fac30cf01 Andre Przywara      2016-01-18  148  
5dfdedf0de9a7c Krzysztof Kozlowski 2024-03-17  149  	osc32k: osc32k-clk {
6bc37fac30cf01 Andre Przywara      2016-01-18  150  		#clock-cells = <0>;
6bc37fac30cf01 Andre Przywara      2016-01-18  151  		compatible = "fixed-clock";
6bc37fac30cf01 Andre Przywara      2016-01-18  152  		clock-frequency = <32768>;
44ff3cafcd7f41 Chen-Yu Tsai        2018-12-03  153  		clock-output-names = "ext-osc32k";
791a9e001d3ba3 Icenowy Zheng       2017-04-04  154  	};
791a9e001d3ba3 Icenowy Zheng       2017-04-04  155  
34a97fcc71c26f Harald Geyer        2018-12-19  156  	pmu {
34a97fcc71c26f Harald Geyer        2018-12-19  157  		compatible = "arm,cortex-a53-pmu";
6b832a148717f1 Andre Przywara      2019-11-05  158  		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
6b832a148717f1 Andre Przywara      2019-11-05  159  			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
6b832a148717f1 Andre Przywara      2019-11-05  160  			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
6b832a148717f1 Andre Przywara      2019-11-05  161  			     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
34a97fcc71c26f Harald Geyer        2018-12-19  162  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
34a97fcc71c26f Harald Geyer        2018-12-19  163  	};
34a97fcc71c26f Harald Geyer        2018-12-19  164  
6bc37fac30cf01 Andre Przywara      2016-01-18  165  	psci {
6bc37fac30cf01 Andre Przywara      2016-01-18  166  		compatible = "arm,psci-0.2";
6bc37fac30cf01 Andre Przywara      2016-01-18  167  		method = "smc";
6bc37fac30cf01 Andre Przywara      2016-01-18  168  	};
6bc37fac30cf01 Andre Przywara      2016-01-18  169  
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22 @170  	sound: sound {
984a51c5308c90 Samuel Holland      2021-04-29  171  		#address-cells = <1>;
984a51c5308c90 Samuel Holland      2021-04-29  172  		#size-cells = <0>;
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22  173  		compatible = "simple-audio-card";
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22  174  		simple-audio-card,name = "sun50i-a64-audio";
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22  175  		simple-audio-card,aux-devs = <&codec_analog>;
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22  176  		simple-audio-card,routing =
631e6a35306098 Samuel Holland      2020-07-25  177  				"Left DAC", "DACL",
631e6a35306098 Samuel Holland      2020-07-25  178  				"Right DAC", "DACR",
631e6a35306098 Samuel Holland      2020-07-25  179  				"ADCL", "Left ADC",
631e6a35306098 Samuel Holland      2020-07-25  180  				"ADCR", "Right ADC";
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22  181  		status = "disabled";
ec4a95409d5c28 Vasily Khoruzhick   2018-11-22  182  
984a51c5308c90 Samuel Holland      2021-04-29 @183  		simple-audio-card,dai-link@0 {

:::::: The code at line 170 was first introduced by commit
:::::: ec4a95409d5c28962e0097e8291aa7048f8b262a arm64: dts: allwinner: a64: add nodes necessary for analog sound support

:::::: TO: Vasily Khoruzhick <anarsoul@gmail.com>
:::::: CC: Chen-Yu Tsai <wens@csie.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
