Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74811F667B
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730844779; cv=none; b=NBLGgEic83ZEMwMyityoa2n4tMjqg07AitEH8Dnw/WxszeIn4k2OdOIm+bKipLgr/IMfWmxvEabcHRJ0oXJzj997mymSfLNP3nMVI3TDO+Bszi4ptl4ERJ/LFWWwNoWTogd+KCpY1lYs9D59LJPASBIGkgEWyCGn8iZ7Qiq8444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730844779; c=relaxed/simple;
	bh=Maf6/TpHZsmfP3c7bIO9hDs3Fry+fOlUTVGcwdGZIps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HAX8Gj/fyjTIW6t0XuMbtlDJwGbQHC3Fnzh9kTLh431ju/iFxp4B1pS8wsbXV5yYXvbkrvdDAsW16DLh4enAmXW6AmTETCNHuuX6X9Rx+CDuAnTFQWmfDtXJ1Rq2vTiNad4hyzx3v3vNiy5zjRwe9ldgJtwlOlbuDX3VmdQIqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMFewY8j; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMFewY8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730844775; x=1762380775;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Maf6/TpHZsmfP3c7bIO9hDs3Fry+fOlUTVGcwdGZIps=;
  b=CMFewY8jSAgbpftQ2PfxaLb7+oLjA+wDUkkhhsdf70ti2OZorgJcThq/
   joswjNv9WVsyVG0u/1gNwUKQ9JJJTVT+p8M7BE3hB5zHmtC9W/Qhy1aDv
   cBYGGVomHvg0jzhX2L7sJt81P1+yHDbCrVWwDVnFTOkFf3M5sC6JIg861
   uwuhl4zW4hJR6aTEk1BlGiJBJHf3jgrallgItaY7fEoPdcopF+cPIGpBF
   RmnMnYPy+rDW5fFoPhqYhkFah3ME6cJFSvEwmHwkFXcxPQ1h0YnEU373n
   rzT+Y5unobfD+HaqtXCvvdLm7+bgiI5ULghNXoxJWrvTp4j6Jt+kt4DDP
   Q==;
X-CSE-ConnectionGUID: 08quBv9PQzSrEjlVOXzGxQ==
X-CSE-MsgGUID: fQC14AvqTZ2wVSql9gUZXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="33461641"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="33461641"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 14:12:54 -0800
X-CSE-ConnectionGUID: QxmuCCXtTW6aUg2OfxcIpQ==
X-CSE-MsgGUID: wWFcJzJxT9CzdTBlVVb0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84144153"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Nov 2024 14:12:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Rn6-000mWz-0r;
	Tue, 05 Nov 2024 22:12:48 +0000
Date: Wed, 6 Nov 2024 06:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.10-main 6/50]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning
 (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg
 or ranges property
Message-ID: <202411060650.RQg2pHk2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-main
head:   ada8e45c341eb57e21f33693487918e80994c721
commit: c1dcc8bdaa5e016d5eb6695a96fc0b8c0ba883da [6/50] dts: arm64: mediatek: add MT7988A reference board device tree
:::::: branch date: 3 days ago
:::::: commit date: 4 months ago
config: arm64-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060650.RQg2pHk2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060650.RQg2pHk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411060650.RQg2pHk2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1127.27-1288.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:25.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1127.27-1288.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +1011 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

6c1d134a103f68 Rafał Miłecki 2024-01-08    11  
6c1d134a103f68 Rafał Miłecki 2024-01-08    12  / {
6c1d134a103f68 Rafał Miłecki 2024-01-08    13  	compatible = "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki 2024-01-08    14  	interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    15  	#address-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    16  	#size-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    17  
6c1d134a103f68 Rafał Miłecki 2024-01-08    18  	cpus {
6c1d134a103f68 Rafał Miłecki 2024-01-08    19  		#address-cells = <1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    20  		#size-cells = <0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    21  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    22  		cpu0: cpu@0 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    23  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    24  			reg = <0x0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    25  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    26  			enable-method = "psci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    27  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    28  				 <&topckgen CLK_TOP_XTAL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    29  			clock-names = "cpu", "intermediate";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    30  			operating-points-v2 = <&cluster0_opp>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    31  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    32  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    33  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    34  		cpu1: cpu@1 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    35  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    36  			reg = <0x1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    37  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    38  			enable-method = "psci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    39  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    40  				 <&topckgen CLK_TOP_XTAL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    41  			clock-names = "cpu", "intermediate";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    42  			operating-points-v2 = <&cluster0_opp>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    43  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    44  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    45  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    46  		cpu2: cpu@2 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    47  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    48  			reg = <0x2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    49  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    50  			enable-method = "psci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    51  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    52  				 <&topckgen CLK_TOP_XTAL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    53  			clock-names = "cpu", "intermediate";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    54  			operating-points-v2 = <&cluster0_opp>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    55  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    56  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    57  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    58  		cpu3: cpu@3 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    59  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    60  			reg = <0x3>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    61  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    62  			enable-method = "psci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    63  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    64  				 <&topckgen CLK_TOP_XTAL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    65  			clock-names = "cpu", "intermediate";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    66  			operating-points-v2 = <&cluster0_opp>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    67  			mediatek,cci = <&cci>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    68  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    69  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    70  		cluster0_opp: opp_table0 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    71  			compatible = "operating-points-v2";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    72  			opp-shared;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    73  			opp00 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    74  				opp-hz = /bits/ 64 <800000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    75  				opp-microvolt = <850000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    76  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    77  			opp01 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    78  				opp-hz = /bits/ 64 <1100000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    79  				opp-microvolt = <850000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    80  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    81  			opp02 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    82  				opp-hz = /bits/ 64 <1500000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    83  				opp-microvolt = <850000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    84  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    85  			opp03 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    86  				opp-hz = /bits/ 64 <1800000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    87  				opp-microvolt = <900000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    88  			};
6c1d134a103f68 Rafał Miłecki 2024-01-08    89  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    90  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08    91  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    92  	cci: cci {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    93  		compatible = "mediatek,mt7988-cci",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    94  			     "mediatek,mt8183-cci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    95  		clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    96  			 <&topckgen CLK_TOP_XTAL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    97  		clock-names = "cci", "intermediate";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    98  		operating-points-v2 = <&cci_opp>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22    99  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   100  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   101  	cci_opp: opp_table_cci {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   102  		compatible = "operating-points-v2";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   103  		opp-shared;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   104  		opp00 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   105  			opp-hz = /bits/ 64 <480000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   106  			opp-microvolt = <850000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   107  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   108  		opp01 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   109  			opp-hz = /bits/ 64 <660000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   110  			opp-microvolt = <850000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   111  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   112  		opp02 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   113  			opp-hz = /bits/ 64 <900000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   114  			opp-microvolt = <850000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   115  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   116  		opp03 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   117  			opp-hz = /bits/ 64 <1080000000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   118  			opp-microvolt = <900000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   119  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   120  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   121  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   122  	fan: pwm-fan {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   123  		compatible = "pwm-fan";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   124  		/* cooling level (0, 1, 2) : (0% duty, 50% duty, 100% duty) */
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   125  		cooling-levels = <0 128 255>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   126  		#cooling-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   127  		#thermal-sensor-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   128  		status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   129  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   130  
6c1d134a103f68 Rafał Miłecki 2024-01-08   131  	oscillator-40m {
6c1d134a103f68 Rafał Miłecki 2024-01-08   132  		compatible = "fixed-clock";
6c1d134a103f68 Rafał Miłecki 2024-01-08   133  		clock-frequency = <40000000>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   134  		#clock-cells = <0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   135  		clock-output-names = "clkxtal";
6c1d134a103f68 Rafał Miłecki 2024-01-08   136  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   137  
6c1d134a103f68 Rafał Miłecki 2024-01-08   138  	pmu {
6c1d134a103f68 Rafał Miłecki 2024-01-08   139  		compatible = "arm,cortex-a73-pmu";
6c1d134a103f68 Rafał Miłecki 2024-01-08   140  		interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   141  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   142  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   143  
6c1d134a103f68 Rafał Miłecki 2024-01-08   144  	psci {
6c1d134a103f68 Rafał Miłecki 2024-01-08   145  		compatible = "arm,psci-0.2";
6c1d134a103f68 Rafał Miłecki 2024-01-08   146  		method = "smc";
6c1d134a103f68 Rafał Miłecki 2024-01-08   147  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   148  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   149  	reserved-memory {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   150  		#address-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   151  		#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   152  		ranges;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   153  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   154  		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   155  		secmon_reserved: secmon@43000000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   156  			reg = <0 0x43000000 0 0x50000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   157  			no-map;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   158  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   159  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   160  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   161  	timer {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   162  		compatible = "arm,armv8-timer";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   163  		interrupt-parent = <&gic>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   164  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   165  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   166  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   167  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   168  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   169  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   170  	reg_1p8v: regulator-1p8v {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   171  		compatible = "regulator-fixed";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   172  		regulator-name = "fixed-1.8V";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   173  		regulator-min-microvolt = <1800000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   174  		regulator-max-microvolt = <1800000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   175  		regulator-boot-on;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   176  		regulator-always-on;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   177  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   178  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   179  	reg_3p3v: regulator-3p3v {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   180  		compatible = "regulator-fixed";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   181  		regulator-name = "fixed-3.3V";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   182  		regulator-min-microvolt = <3300000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   183  		regulator-max-microvolt = <3300000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   184  		regulator-boot-on;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   185  		regulator-always-on;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   186  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   187  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   188  	thermal-zones {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   189  		cpu_thermal: cpu-thermal {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   190  			polling-delay-passive = <1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   191  			polling-delay = <1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   192  			thermal-sensors = <&lvts 0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   193  			trips {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   194  				cpu_trip_crit: crit {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   195  					temperature = <125000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   196  					hysteresis = <2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   197  					type = "critical";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   198  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   199  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   200  				cpu_trip_hot: hot {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   201  					temperature = <120000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   202  					hysteresis = <2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   203  					type = "hot";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   204  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   205  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   206  				cpu_trip_active_high: active-high {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   207  					temperature = <115000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   208  					hysteresis = <2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   209  					type = "active";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   210  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   211  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   212  				cpu_trip_active_med: active-med {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   213  					temperature = <85000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   214  					hysteresis = <2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   215  					type = "active";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   216  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   217  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   218  				cpu_trip_active_low: active-low {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   219  					temperature = <40000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   220  					hysteresis = <2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   221  					type = "active";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   222  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   223  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   224  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   225  			cooling-maps {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   226  				cpu-active-high {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   227  				/* active: set fan to cooling level 2 */
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   228  					cooling-device = <&fan 3 3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   229  					trip = <&cpu_trip_active_high>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   230  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   231  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   232  				cpu-active-low {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   233  				/* active: set fan to cooling level 1 */
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   234  					cooling-device = <&fan 2 2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   235  					trip = <&cpu_trip_active_med>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   236  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   237  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   238  				cpu-passive {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   239  				/* passive: set fan to cooling level 0 */
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   240  					cooling-device = <&fan 1 1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   241  					trip = <&cpu_trip_active_low>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   242  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   243  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   244  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   245  	};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   246  
6c1d134a103f68 Rafał Miłecki 2024-01-08   247  	soc {
6c1d134a103f68 Rafał Miłecki 2024-01-08   248  		compatible = "simple-bus";
6c1d134a103f68 Rafał Miłecki 2024-01-08   249  		ranges;
6c1d134a103f68 Rafał Miłecki 2024-01-08   250  		#address-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   251  		#size-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   252  
6c1d134a103f68 Rafał Miłecki 2024-01-08   253  		gic: interrupt-controller@c000000 {
6c1d134a103f68 Rafał Miłecki 2024-01-08   254  			compatible = "arm,gic-v3";
6c1d134a103f68 Rafał Miłecki 2024-01-08   255  			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
6c1d134a103f68 Rafał Miłecki 2024-01-08   256  			      <0 0x0c080000 0 0x200000>, /* GICR */
6c1d134a103f68 Rafał Miłecki 2024-01-08   257  			      <0 0x0c400000 0 0x2000>,   /* GICC */
6c1d134a103f68 Rafał Miłecki 2024-01-08   258  			      <0 0x0c410000 0 0x1000>,   /* GICH */
6c1d134a103f68 Rafał Miłecki 2024-01-08   259  			      <0 0x0c420000 0 0x2000>;   /* GICV */
6c1d134a103f68 Rafał Miłecki 2024-01-08   260  			interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   261  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   262  			interrupt-controller;
6c1d134a103f68 Rafał Miłecki 2024-01-08   263  			#interrupt-cells = <3>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   264  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08   265  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   266  		phyfw: phy-firmware@f000000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   267  			compatible = "mediatek,2p5gphy-fw";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   268  			reg = <0 0x0f000000 0 0x8000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   269  			      <0 0x0f100000 0 0x20000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   270  			      <0 0x0f0f0000 0 0x200>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   271  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   272  
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   273  		infracfg: clock-controller@10001000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   274  			compatible = "mediatek,mt7988-infracfg", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08   275  			reg = <0 0x10001000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   276  			#clock-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   277  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   278  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   279  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   280  		topckgen: clock-controller@1001b000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   281  			compatible = "mediatek,mt7988-topckgen", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08   282  			reg = <0 0x1001b000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   283  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   284  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   285  
b616b403cbffc6 Rafał Miłecki 2024-01-08   286  		watchdog: watchdog@1001c000 {
6c1d134a103f68 Rafał Miłecki 2024-01-08   287  			compatible = "mediatek,mt7988-wdt";
6c1d134a103f68 Rafał Miłecki 2024-01-08   288  			reg = <0 0x1001c000 0 0x1000>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   289  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   290  			#reset-cells = <1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   291  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   292  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   293  		apmixedsys: clock-controller@1001e000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   294  			compatible = "mediatek,mt7988-apmixedsys";
b616b403cbffc6 Rafał Miłecki 2024-01-08   295  			reg = <0 0x1001e000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   296  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   297  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   298  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   299  		pio: pinctrl@1001f000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   300  			compatible = "mediatek,mt7988-pinctrl", "syscon";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   301  			reg = <0 0x1001f000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   302  			<0 0x11c10000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   303  			<0 0x11d00000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   304  			<0 0x11d20000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   305  			<0 0x11e00000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   306  			<0 0x11f00000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   307  			<0 0x1000b000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   308  			reg-names = "gpio_base", "iocfg_tr_base",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   309  				    "iocfg_br_base", "iocfg_rb_base",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   310  				    "iocfg_lb_base", "iocfg_tl_base", "eint";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   311  			gpio-controller;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   312  			#gpio-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   313  			gpio-ranges = <&pio 0 0 84>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   314  			interrupt-controller;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   315  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   316  			interrupt-parent = <&gic>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   317  			#interrupt-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   318  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   319  			mdio0_pins: mdio0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   320  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   321  					function = "eth";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   322  					groups = "mdc_mdio0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   323  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   324  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   325  				conf {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   326  					groups = "mdc_mdio0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   327  					drive-strength = <MTK_DRIVE_8mA>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   328  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   329  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   330  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   331  			i2c0_pins: i2c0-pins-g0 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   332  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   333  					function = "i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   334  					groups = "i2c0_1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   335  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   336  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   337  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   338  			i2c1_pins: i2c1-pins-g0 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   339  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   340  					function = "i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   341  					groups = "i2c1_0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   342  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   343  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   344  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   345  			i2c1_sfp_pins: i2c1-sfp-pins-g0 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   346  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   347  					function = "i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   348  					groups = "i2c1_sfp";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   349  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   350  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   351  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   352  			i2c2_pins: i2c2-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   353  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   354  					function = "i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   355  					groups = "i2c2";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   356  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   357  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   358  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   359  			i2c2_0_pins: i2c2-pins-g0 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   360  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   361  					function = "i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   362  					groups = "i2c2_0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   363  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   364  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   365  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   366  			i2c2_1_pins: i2c2-pins-g1 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   367  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   368  					function = "i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   369  					groups = "i2c2_1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   370  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   371  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   372  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   373  			gbe0_led0_pins: gbe0-led0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   374  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   375  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   376  					groups = "gbe0_led0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   377  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   378  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   379  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   380  			gbe1_led0_pins: gbe1-led0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   381  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   382  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   383  					groups = "gbe1_led0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   384  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   385  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   386  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   387  			gbe2_led0_pins: gbe2-led0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   388  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   389  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   390  					groups = "gbe2_led0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   391  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   392  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   393  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   394  			gbe3_led0_pins: gbe3-led0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   395  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   396  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   397  					groups = "gbe3_led0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   398  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   399  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   400  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   401  			gbe0_led1_pins: gbe0-led1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   402  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   403  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   404  					groups = "gbe0_led1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   405  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   406  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   407  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   408  			gbe1_led1_pins: gbe1-led1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   409  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   410  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   411  					groups = "gbe1_led1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   412  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   413  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   414  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   415  			gbe2_led1_pins: gbe2-led1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   416  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   417  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   418  					groups = "gbe2_led1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   419  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   420  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   421  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   422  			gbe3_led1_pins: gbe3-led1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   423  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   424  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   425  					groups = "gbe3_led1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   426  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   427  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   428  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   429  			i2p5gbe_led0_pins: 2p5gbe-led0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   430  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   431  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   432  					groups = "2p5gbe_led0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   433  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   434  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   435  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   436  			i2p5gbe_led1_pins: 2p5gbe-led1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   437  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   438  					function = "led";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   439  					groups = "2p5gbe_led1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   440  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   441  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   442  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   443  			mmc0_pins_emmc_45: mmc0-pins-emmc-45 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   444  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   445  					function = "flash";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   446  					groups = "emmc_45";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   447  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   448  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   449  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   450  			mmc0_pins_emmc_51: mmc0-pins-emmc-51 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   451  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   452  					function = "flash";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   453  					groups = "emmc_51";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   454  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   455  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   456  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   457  			mmc0_pins_sdcard: mmc0-pins-sdcard {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   458  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   459  					function = "flash";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   460  					groups = "sdcard";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   461  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   462  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   463  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   464  			uart0_pins: uart0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   465  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   466  					function = "uart";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   467  					groups =  "uart0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   468  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   469  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   470  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   471  			snfi_pins: snfi-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   472  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   473  					function = "flash";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   474  					groups = "snfi";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   475  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   476  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   477  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   478  			spi0_pins: spi0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   479  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   480  					function = "spi";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   481  					groups = "spi0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   482  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   483  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   484  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   485  			spi0_flash_pins: spi0-flash-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   486  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   487  					function = "spi";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   488  					groups = "spi0", "spi0_wp_hold";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   489  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   490  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   491  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   492  			spi1_pins: spi1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   493  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   494  					function = "spi";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   495  					groups = "spi1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   496  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   497  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   498  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   499  			spi2_pins: spi2-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   500  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   501  					function = "spi";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   502  					groups = "spi2";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   503  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   504  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   505  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   506  			spi2_flash_pins: spi2-flash-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   507  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   508  					function = "spi";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   509  					groups = "spi2", "spi2_wp_hold";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   510  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   511  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   512  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   513  			pcie0_pins: pcie0-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   514  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   515  					function = "pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   516  					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   517  						 "pcie_wake_n0_0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   518  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   519  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   520  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   521  			pcie1_pins: pcie1-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   522  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   523  					function = "pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   524  					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   525  						 "pcie_wake_n1_0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   526  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   527  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   528  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   529  			pcie2_pins: pcie2-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   530  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   531  					function = "pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   532  					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   533  						 "pcie_wake_n2_0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   534  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   535  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   536  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   537  			pcie3_pins: pcie3-pins {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   538  				mux {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   539  					function = "pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   540  					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   541  						 "pcie_wake_n3_0";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   542  				};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   543  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   544  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   545  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   546  		pwm: pwm@10048000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   547  			compatible = "mediatek,mt7988-pwm";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   548  			reg = <0 0x10048000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   549  			#pwm-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   550  			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   551  				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   552  				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   553  				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   554  				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   555  				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   556  				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   557  				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   558  				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   559  				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   560  			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   561  				      "pwm4","pwm5","pwm6","pwm7","pwm8";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   562  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   563  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   564  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   565  		sgmiisys0: syscon@10060000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   566  			compatible = "mediatek,mt7988-sgmiisys",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   567  				     "mediatek,mt7988-sgmiisys0",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   568  				     "syscon",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   569  				     "simple-mfd";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   570  			reg = <0 0x10060000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   571  			resets = <&watchdog 1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   572  			#clock-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   573  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   574  			sgmiipcs0: pcs {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   575  				compatible = "mediatek,mt7988-sgmii";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   576  				clocks = <&topckgen CLK_TOP_SGM_0_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   577  					 <&sgmiisys0 CLK_SGM0_TX_EN>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   578  					 <&sgmiisys0 CLK_SGM0_RX_EN>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   579  				clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   580  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   581  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   582  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   583  		sgmiisys1: syscon@10070000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   584  			compatible = "mediatek,mt7988-sgmiisys",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   585  				     "mediatek,mt7988-sgmiisys1",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   586  				     "syscon",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   587  				     "simple-mfd";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   588  			reg = <0 0x10070000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   589  			resets = <&watchdog 2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   590  			#clock-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   591  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   592  			sgmiipcs1: pcs {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   593  				compatible = "mediatek,mt7988-sgmii";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   594  				clocks = <&topckgen CLK_TOP_SGM_1_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   595  					 <&sgmiisys1 CLK_SGM1_TX_EN>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   596  					 <&sgmiisys1 CLK_SGM1_RX_EN>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   597  				clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   598  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   599  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   600  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   601  		usxgmiisys0: pcs@10080000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   602  			compatible = "mediatek,mt7988-usxgmiisys";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   603  			reg = <0 0x10080000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   604  			resets = <&watchdog 12>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   605  			clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   606  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   607  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   608  		usxgmiisys1: pcs@10081000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   609  			compatible = "mediatek,mt7988-usxgmiisys";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   610  			reg = <0 0x10081000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   611  			resets = <&watchdog 13>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   612  			clocks = <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   613  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   614  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   615  		mcusys: mcusys@100e0000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   616  			compatible = "mediatek,mt7988-mcusys", "syscon";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   617  			reg = <0 0x100e0000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   618  			#clock-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   619  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   620  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   621  		uart0: serial@11000000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   622  			compatible = "mediatek,mt7986-uart",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   623  				     "mediatek,mt6577-uart";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   624  			reg = <0 0x11000000 0 0x100>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   625  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   626  			/*
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   627  			 * 8250-mtk driver don't control "baud" clock since commit
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   628  			 * e32a83c70cf9 (kernel v5.7), but both "baud" and "bus" clocks
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   629  			 * still need to be passed to the driver to prevent probe fail
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   630  			 */
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   631  			clocks = <&topckgen CLK_TOP_UART_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   632  				 <&infracfg CLK_INFRA_52M_UART0_CK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   633  			clock-names = "baud", "bus";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   634  			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   635  					  <&infracfg CLK_INFRA_MUX_UART0_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   636  			assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   637  						 <&topckgen CLK_TOP_UART_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   638  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   639  			pinctrl-0 = <&uart0_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   640  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   641  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   642  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   643  		snand: spi@11001000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   644  			compatible = "mediatek,mt7986-snand";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   645  			reg = <0 0x11001000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   646  			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   647  			clocks = <&infracfg CLK_INFRA_SPINFI>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   648  				 <&infracfg CLK_INFRA_NFI>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   649  				 <&infracfg CLK_INFRA_66M_NFI_HCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   650  			clock-names = "pad_clk", "nfi_clk", "nfi_hclk";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   651  			nand-ecc-engine = <&bch>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   652  			mediatek,quad-spi;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   653  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   654  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   655  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   656  			pinctrl-0 = <&snfi_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   657  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   658  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   659  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   660  		bch: ecc@11002000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   661  			compatible = "mediatek,mt7686-ecc";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   662  			reg = <0 0x11002000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   663  			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   664  			clocks = <&infracfg CLK_INFRA_NFI>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   665  			clock-names = "nfiecc_clk";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   666  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   667  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   668  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   669  		i2c0: i2c@11003000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   670  			compatible = "mediatek,mt7988-i2c",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   671  				     "mediatek,mt7981-i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   672  			reg = <0 0x11003000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   673  			      <0 0x10217080 0 0x80>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   674  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   675  			clock-div = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   676  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   677  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   678  			clock-names = "main", "dma";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   679  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   680  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   681  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   682  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   683  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   684  		i2c1: i2c@11004000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   685  			compatible = "mediatek,mt7988-i2c",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   686  				     "mediatek,mt7981-i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   687  			reg = <0 0x11004000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   688  			      <0 0x10217100 0 0x80>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   689  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   690  			clock-div = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   691  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   692  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   693  			clock-names = "main", "dma";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   694  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   695  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   696  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   697  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   698  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   699  		i2c2: i2c@11005000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   700  			compatible = "mediatek,mt7988-i2c",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   701  				"mediatek,mt7981-i2c";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   702  			reg = <0 0x11005000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   703  			      <0 0x10217180 0 0x80>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   704  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   705  			clock-div = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   706  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   707  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   708  			clock-names = "main", "dma";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   709  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   710  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   711  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   712  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   713  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   714  		spi0: spi@11007000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   715  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   716  			reg = <0 0x11007000 0 0x100>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   717  			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   718  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   719  				 <&topckgen CLK_TOP_SPI_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   720  				 <&infracfg CLK_INFRA_104M_SPI0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   721  				 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   722  			clock-names = "parent-clk", "sel-clk", "spi-clk",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   723  				      "spi-hclk";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   724  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   725  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   726  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   727  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   728  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   729  		spi1: spi@11008000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   730  			compatible = "mediatek,ipm-spi-single", "mediatek,spi-ipm";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   731  			reg = <0 0x11008000 0 0x100>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   732  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   733  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   734  				 <&topckgen CLK_TOP_SPI_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   735  				 <&infracfg CLK_INFRA_104M_SPI1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   736  				 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   737  			clock-names = "parent-clk", "sel-clk", "spi-clk",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   738  				      "spi-hclk";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   739  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   740  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   741  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   742  			pinctrl-0 = <&spi1_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   743  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   744  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   745  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   746  		spi2: spi@11009000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   747  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   748  			reg = <0 0x11009000 0 0x100>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   749  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   750  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   751  				 <&topckgen CLK_TOP_SPI_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   752  				 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   753  				 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   754  			clock-names = "parent-clk", "sel-clk", "spi-clk",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   755  				      "spi-hclk";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   756  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   757  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   758  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   759  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   760  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   761  		lvts: lvts@1100a000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   762  			compatible = "mediatek,mt7988-lvts-ap";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   763  			#thermal-sensor-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   764  			reg = <0 0x1100a000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   765  			clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   766  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   767  			resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   768  			nvmem-cells = <&lvts_calibration>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   769  			nvmem-cell-names = "lvts-calib-data-1";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   770  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   771  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   772  		ssusb0: usb@11190000 {
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   773  			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   774  			reg = <0 0x11190000 0 0x2e00>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   775  			      <0 0x11193e00 0 0x0100>;
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   776  			reg-names = "mac", "ippc";
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   777  			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   778  			clocks = <&infracfg CLK_INFRA_USB_SYS>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   779  				 <&infracfg CLK_INFRA_USB_REF>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   780  				 <&infracfg CLK_INFRA_66M_USB_HCK>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   781  				 <&infracfg CLK_INFRA_133M_USB_HCK>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   782  				 <&infracfg CLK_INFRA_USB_XHCI>;
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   783  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   784  		};
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   785  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   786  		ssusb1: usb@11200000 {
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   787  			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   788  			reg = <0 0x11200000 0 0x2e00>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   789  			      <0 0x11203e00 0 0x0100>;
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   790  			reg-names = "mac", "ippc";
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   791  			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   792  			clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   793  				 <&infracfg CLK_INFRA_USB_CK_P1>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   794  				 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   795  				 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   796  				 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   797  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   798  		};
fa1b3a19f8e9f4 Rafał Miłecki 2024-02-13   799  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   800  		afe: audio-controller@11210000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   801  			compatible = "mediatek,mt79xx-audio";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   802  			reg = <0 0x11210000 0 0x9000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   803  			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   804  			clocks = <&infracfg CLK_INFRA_66M_AUD_SLV_BCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   805  				 <&infracfg CLK_INFRA_AUD_26M>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   806  				 <&infracfg CLK_INFRA_AUD_L>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   807  				 <&infracfg CLK_INFRA_AUD_AUD>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   808  				 <&infracfg CLK_INFRA_AUD_EG2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   809  				 <&topckgen CLK_TOP_AUD_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   810  				 <&topckgen CLK_TOP_AUD_I2S_M>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   811  			clock-names = "aud_bus_ck",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   812  				      "aud_26m_ck",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   813  				      "aud_l_ck",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   814  				      "aud_aud_ck",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   815  				      "aud_eg2_ck",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   816  				      "aud_sel",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   817  				      "aud_i2s_m";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   818  			assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   819  					  <&topckgen CLK_TOP_A1SYS_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   820  					  <&topckgen CLK_TOP_AUD_L_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   821  					  <&topckgen CLK_TOP_A_TUNER_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   822  			assigned-clock-parents = <&apmixedsys CLK_APMIXED_APLL2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   823  						 <&topckgen CLK_TOP_APLL2_D4>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   824  						 <&apmixedsys CLK_APMIXED_APLL2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   825  						 <&topckgen CLK_TOP_APLL2_D4>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   826  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   827  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   828  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   829  		mmc0: mmc@11230000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   830  			compatible = "mediatek,mt7986-mmc",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   831  				     "mediatek,mt7981-mmc";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   832  			reg = <0 0x11230000 0 0x1000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   833  			      <0 0x11D60000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   834  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   835  			clocks = <&infracfg CLK_INFRA_MSDC400>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   836  				 <&infracfg CLK_INFRA_MSDC2_HCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   837  				 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   838  				 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   839  			assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   840  					  <&topckgen CLK_TOP_EMMC_400M_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   841  			assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   842  						 <&apmixedsys CLK_APMIXED_MSDCPLL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   843  			clock-names = "source",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   844  				      "hclk",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   845  				      "axi_cg",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   846  				      "ahb_cg";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   847  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   848  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   849  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   850  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   851  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   852  		pcie2: pcie@11280000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   853  			compatible = "mediatek,mt7988-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   854  				     "mediatek,mt7986-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   855  				     "mediatek,mt8192-pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   856  			device_type = "pci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   857  			#address-cells = <3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   858  			#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   859  			reg = <0 0x11280000 0 0x2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   860  			reg-names = "pcie-mac";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   861  			linux,pci-domain = <3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   862  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   863  			bus-range = <0x00 0xff>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   864  			ranges = <0x81000000 0x00 0x20000000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   865  				  0x20000000 0x00 0x00200000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   866  				 <0x82000000 0x00 0x20200000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   867  				  0x20200000 0x00 0x07e00000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   868  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   869  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   870  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   871  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   872  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   873  				      "top_133m";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   874  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   875  			pinctrl-0 = <&pcie2_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   876  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   877  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   878  			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   879  			phy-names = "pcie-phy";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   880  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   881  			#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   882  			interrupt-map-mask = <0 0 0 0x7>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   883  			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   884  					<0 0 0 2 &pcie_intc2 1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   885  					<0 0 0 3 &pcie_intc2 2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   886  					<0 0 0 4 &pcie_intc2 3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   887  			pcie_intc2: interrupt-controller {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   888  				#address-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   889  				#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   890  				interrupt-controller;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   891  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   892  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   893  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   894  		pcie3: pcie@11290000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   895  			compatible = "mediatek,mt7988-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   896  				     "mediatek,mt7986-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   897  				     "mediatek,mt8192-pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   898  			device_type = "pci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   899  			#address-cells = <3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   900  			#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   901  			reg = <0 0x11290000 0 0x2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   902  			reg-names = "pcie-mac";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   903  			linux,pci-domain = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   904  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   905  			bus-range = <0x00 0xff>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   906  			ranges = <0x81000000 0x00 0x28000000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   907  				  0x28000000 0x00 0x00200000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   908  				 <0x82000000 0x00 0x28200000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   909  				  0x28200000 0x00 0x07e00000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   910  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   911  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   912  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   913  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   914  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   915  				      "top_133m";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   916  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   917  			pinctrl-0 = <&pcie3_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   918  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   919  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   920  			#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   921  			interrupt-map-mask = <0 0 0 0x7>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   922  			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   923  					<0 0 0 2 &pcie_intc3 1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   924  					<0 0 0 3 &pcie_intc3 2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   925  					<0 0 0 4 &pcie_intc3 3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   926  			pcie_intc3: interrupt-controller {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   927  				#address-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   928  				#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   929  				interrupt-controller;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   930  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   931  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   932  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   933  		pcie0: pcie@11300000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   934  			compatible = "mediatek,mt7988-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   935  				     "mediatek,mt7986-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   936  				     "mediatek,mt8192-pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   937  			device_type = "pci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   938  			#address-cells = <3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   939  			#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   940  			reg = <0 0x11300000 0 0x2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   941  			reg-names = "pcie-mac";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   942  			linux,pci-domain = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   943  			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   944  			bus-range = <0x00 0xff>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   945  			ranges = <0x81000000 0x00 0x30000000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   946  				  0x30000000 0x00 0x00200000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   947  				 <0x82000000 0x00 0x30200000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   948  				  0x30200000 0x00 0x07e00000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   949  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   950  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   951  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   952  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   953  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   954  				      "top_133m";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   955  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   956  			pinctrl-0 = <&pcie0_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   957  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   958  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   959  			#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   960  			interrupt-map-mask = <0 0 0 0x7>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   961  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   962  					<0 0 0 2 &pcie_intc0 1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   963  					<0 0 0 3 &pcie_intc0 2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   964  					<0 0 0 4 &pcie_intc0 3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   965  			pcie_intc0: interrupt-controller {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   966  				#address-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   967  				#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   968  				interrupt-controller;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   969  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   970  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   971  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   972  		pcie1: pcie@11310000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   973  			compatible = "mediatek,mt7988-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   974  				     "mediatek,mt7986-pcie",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   975  				     "mediatek,mt8192-pcie";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   976  			device_type = "pci";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   977  			#address-cells = <3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   978  			#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   979  			reg = <0 0x11310000 0 0x2000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   980  			reg-names = "pcie-mac";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   981  			linux,pci-domain = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   982  			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   983  			bus-range = <0x00 0xff>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   984  			ranges = <0x81000000 0x00 0x38000000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   985  				  0x38000000 0x00 0x00200000>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   986  				 <0x82000000 0x00 0x38200000 0x00
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   987  				  0x38200000 0x00 0x07e00000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   988  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   989  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   990  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   991  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   992  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   993  				      "top_133m";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   994  			pinctrl-names = "default";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   995  			pinctrl-0 = <&pcie1_pins>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   996  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   997  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   998  			#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22   999  			interrupt-map-mask = <0 0 0 0x7>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1000  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1001  					<0 0 0 2 &pcie_intc1 1>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1002  					<0 0 0 3 &pcie_intc1 2>,
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1003  					<0 0 0 4 &pcie_intc1 3>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1004  			pcie_intc1: interrupt-controller {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1005  				#address-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1006  				#interrupt-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1007  				interrupt-controller;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1008  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1009  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1010  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22 @1011  		tphy: tphy@11c50000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1012  			compatible = "mediatek,mt7988",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1013  				     "mediatek,generic-tphy-v2";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1014  			#address-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1015  			#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1016  			ranges;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1017  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1018  			tphyu2port0: usb-phy@11c50000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1019  				reg = <0 0x11c50000 0 0x700>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1020  				clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1021  				clock-names = "ref";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1022  				#phy-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1023  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1024  			tphyu3port0: usb-phy@11c50700 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1025  				reg = <0 0x11c50700 0 0x900>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1026  				clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1027  				clock-names = "ref";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1028  				#phy-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1029  				mediatek,usb3-pll-ssc-delta;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1030  				mediatek,usb3-pll-ssc-delta1;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1031  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1032  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1033  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1034  		topmisc: topmisc@11d10000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1035  			compatible = "mediatek,mt7988-topmisc", "syscon",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1036  				     "mediatek,mt7988-power-controller";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1037  			reg = <0 0x11d10000 0 0x10000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1038  			#clock-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1039  			#power-domain-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1040  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1041  			#size-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1042  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1043  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22 @1044  		xphy: xphy@11e10000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1045  			compatible = "mediatek,mt7988",
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1046  				     "mediatek,xsphy";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1047  			#address-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1048  			#size-cells = <2>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1049  			ranges;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1050  			status = "disabled";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1051  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1052  			xphyu2port0: usb-phy@11e10000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1053  				reg = <0 0x11e10000 0 0x400>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1054  				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1055  				clock-names = "ref";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1056  				#phy-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1057  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1058  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1059  			xphyu3port0: usb-phy@11e13000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1060  				reg = <0 0x11e13400 0 0x500>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1061  				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1062  				clock-names = "ref";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1063  				#phy-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1064  				mediatek,syscon-type = <&topmisc 0x218 0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1065  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1066  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1067  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1068  		xfi_tphy0: phy@11f20000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1069  			compatible = "mediatek,mt7988-xfi-tphy";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1070  			reg = <0 0x11f20000 0 0x10000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1071  			resets = <&watchdog 14>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1072  			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1073  			clock-names = "xfipll", "topxtal";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1074  			mediatek,usxgmii-performance-errata;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1075  			#phy-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1076  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1077  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1078  		xfi_tphy1: phy@11f30000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1079  			compatible = "mediatek,mt7988-xfi-tphy";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1080  			reg = <0 0x11f30000 0 0x10000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1081  			resets = <&watchdog 15>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1082  			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1083  			clock-names = "xfipll", "topxtal";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1084  			#phy-cells = <0>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1085  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1086  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1087  		xfi_pll: clock-controller@11f40000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08  1088  			compatible = "mediatek,mt7988-xfi-pll";
b616b403cbffc6 Rafał Miłecki 2024-01-08  1089  			reg = <0 0x11f40000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1090  			resets = <&watchdog 16>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1091  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1092  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08  1093  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1094  		efuse: efuse@11f50000 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1095  			compatible = "mediatek,efuse";
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1096  			reg = <0 0x11f50000 0 0x1000>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1097  			#address-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1098  			#size-cells = <1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1099  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1100  			cpufreq_calibration: calib@278 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1101  				reg = <0x278 0x1>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1102  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1103  			lvts_calibration: calib@918 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1104  				reg = <0x918 0x28>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1105  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1106  			phy_calibration_p0: calib@940 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1107  				reg = <0x940 0x10>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1108  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1109  			phy_calibration_p1: calib@954 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1110  				reg = <0x954 0x10>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1111  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1112  			phy_calibration_p2: calib@968 {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1113  				reg = <0x968 0x10>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1114  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1115  			phy_calibration_p3: calib@97c {
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1116  				reg = <0x97c 0x10>;
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1117  			};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1118  		};
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1119  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22  1120  		ethsys: clock-controller@15000000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08  1121  			compatible = "mediatek,mt7988-ethsys", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08  1122  			reg = <0 0x15000000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1123  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1124  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1125  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08  1126  
c1dcc8bdaa5e01 Daniel Golle  2023-02-22 @1127  		switch: switch@15020000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
