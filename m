Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE215145FEB
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726602760; cv=none; b=Cckcmq3z1jIHwwIKAgNSjhKHt/hZN0nyOtR9UJwJHU4KM58ZRu5/nUA0o3fX9zluWneWdt7Ji+foM+2JReZhQJsd7EcX2qNFmkWwnE7HhsF6LpZ+7S0ews0kdS0QvIT9NHA8B2hqZvFxpgU6MwvRjwLCY6iw8p450xJLnXBOjbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726602760; c=relaxed/simple;
	bh=PZ0/CfnyW9DJmcCFb/5m1zW6dKhXncqWRCyGJ04fMcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8j6yp/GnBkibCEbqqTnP25N2/7hGE0jxngEj+s8Wf7vMQHj2EW1J0ZRSjJ/zInaKQRcsXPWznrVWtnfQ20CnFygg7THdm0cC3iwwichW6e8xSmsdSRxZKARfHUo6RVn2eNpUwlreFvx7ph0fkhLHJ6KBRU6NeclJDi2/8D8TBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTUJC9BJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTUJC9BJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726602756; x=1758138756;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PZ0/CfnyW9DJmcCFb/5m1zW6dKhXncqWRCyGJ04fMcs=;
  b=FTUJC9BJm01vN4j250+xqlo3MJr0VrCFWhEHeu9vaVW4WrIf17ljbjkq
   h77Q+uLRmyj8m+xHadhBNJRzVGWPTZEfIDWKiFioiRkyft7Snh9WkWcqs
   5b4aaa4lG1GYMDoksv3a9GQ5Bujr7cqWU4KghS959l7uIF3u6kVR3k6Sv
   96njKqSgDnGkVQWG1X6l0Wu5HbML87GyfbOPPlKHMBGiMC6HPeExsfgW3
   /H46kGRDIChxv8L5m8poc/MnTYd1Pgui7q3sutHj0aZlgFoBWgrzhNjaD
   77ytZIqpK1Bb4vlaHIct1Z6ObXy2SZMUjBxS8g56Bi2YbqTwSYlt96kal
   g==;
X-CSE-ConnectionGUID: Y7YyaEFxRiitfTKd/bj5vQ==
X-CSE-MsgGUID: +STRxLA7Rims9CyQQ1VuuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562724"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="13562724"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 12:52:35 -0700
X-CSE-ConnectionGUID: 7qGdRBsQQymWcwPK82cBTw==
X-CSE-MsgGUID: rKynUYx/Q66TvsfoFkWi/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69292456"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2024 12:52:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqeFT-000BUG-0q;
	Tue, 17 Sep 2024 19:52:31 +0000
Date: Wed, 18 Sep 2024 03:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.11-rc 26/60]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning
 (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202409180629.nLSPmYyn-lkp@intel.com>
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

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   de8b6ff8886ed2a781de1c57a0ffe141d377bf84
commit: 663cecf5bbda13c83a239cee7fb73ac79a037fbe [26/60] dts: arm64: mediatek: add MT7988A reference board device tree
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-004-20240917 (https://download.01.org/0day-ci/archive/20240918/202409180629.nLSPmYyn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409180629.nLSPmYyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409180629.nLSPmYyn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:25.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +1135 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

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
663cecf5bbda13 Daniel Golle  2023-02-22    22  		cpu0: cpu@0 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    23  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    24  			reg = <0x0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    25  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    26  			enable-method = "psci";
663cecf5bbda13 Daniel Golle  2023-02-22    27  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22    28  				 <&topckgen CLK_TOP_XTAL>;
663cecf5bbda13 Daniel Golle  2023-02-22    29  			clock-names = "cpu", "intermediate";
663cecf5bbda13 Daniel Golle  2023-02-22    30  			operating-points-v2 = <&cluster0_opp>;
663cecf5bbda13 Daniel Golle  2023-02-22    31  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    32  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    33  
663cecf5bbda13 Daniel Golle  2023-02-22    34  		cpu1: cpu@1 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    35  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    36  			reg = <0x1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    37  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    38  			enable-method = "psci";
663cecf5bbda13 Daniel Golle  2023-02-22    39  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22    40  				 <&topckgen CLK_TOP_XTAL>;
663cecf5bbda13 Daniel Golle  2023-02-22    41  			clock-names = "cpu", "intermediate";
663cecf5bbda13 Daniel Golle  2023-02-22    42  			operating-points-v2 = <&cluster0_opp>;
663cecf5bbda13 Daniel Golle  2023-02-22    43  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    44  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    45  
663cecf5bbda13 Daniel Golle  2023-02-22    46  		cpu2: cpu@2 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    47  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    48  			reg = <0x2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    49  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    50  			enable-method = "psci";
663cecf5bbda13 Daniel Golle  2023-02-22    51  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22    52  				 <&topckgen CLK_TOP_XTAL>;
663cecf5bbda13 Daniel Golle  2023-02-22    53  			clock-names = "cpu", "intermediate";
663cecf5bbda13 Daniel Golle  2023-02-22    54  			operating-points-v2 = <&cluster0_opp>;
663cecf5bbda13 Daniel Golle  2023-02-22    55  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    56  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    57  
663cecf5bbda13 Daniel Golle  2023-02-22    58  		cpu3: cpu@3 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    59  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    60  			reg = <0x3>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    61  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    62  			enable-method = "psci";
663cecf5bbda13 Daniel Golle  2023-02-22    63  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22    64  				 <&topckgen CLK_TOP_XTAL>;
663cecf5bbda13 Daniel Golle  2023-02-22    65  			clock-names = "cpu", "intermediate";
663cecf5bbda13 Daniel Golle  2023-02-22    66  			operating-points-v2 = <&cluster0_opp>;
663cecf5bbda13 Daniel Golle  2023-02-22    67  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    68  		};
663cecf5bbda13 Daniel Golle  2023-02-22    69  
663cecf5bbda13 Daniel Golle  2023-02-22    70  		cluster0_opp: opp_table0 {
663cecf5bbda13 Daniel Golle  2023-02-22    71  			compatible = "operating-points-v2";
663cecf5bbda13 Daniel Golle  2023-02-22    72  			opp-shared;
663cecf5bbda13 Daniel Golle  2023-02-22    73  			opp00 {
663cecf5bbda13 Daniel Golle  2023-02-22    74  				opp-hz = /bits/ 64 <800000000>;
663cecf5bbda13 Daniel Golle  2023-02-22    75  				opp-microvolt = <850000>;
663cecf5bbda13 Daniel Golle  2023-02-22    76  			};
663cecf5bbda13 Daniel Golle  2023-02-22    77  			opp01 {
663cecf5bbda13 Daniel Golle  2023-02-22    78  				opp-hz = /bits/ 64 <1100000000>;
663cecf5bbda13 Daniel Golle  2023-02-22    79  				opp-microvolt = <850000>;
663cecf5bbda13 Daniel Golle  2023-02-22    80  			};
663cecf5bbda13 Daniel Golle  2023-02-22    81  			opp02 {
663cecf5bbda13 Daniel Golle  2023-02-22    82  				opp-hz = /bits/ 64 <1500000000>;
663cecf5bbda13 Daniel Golle  2023-02-22    83  				opp-microvolt = <850000>;
663cecf5bbda13 Daniel Golle  2023-02-22    84  			};
663cecf5bbda13 Daniel Golle  2023-02-22    85  			opp03 {
663cecf5bbda13 Daniel Golle  2023-02-22    86  				opp-hz = /bits/ 64 <1800000000>;
663cecf5bbda13 Daniel Golle  2023-02-22    87  				opp-microvolt = <900000>;
663cecf5bbda13 Daniel Golle  2023-02-22    88  			};
663cecf5bbda13 Daniel Golle  2023-02-22    89  		};
663cecf5bbda13 Daniel Golle  2023-02-22    90  	};
663cecf5bbda13 Daniel Golle  2023-02-22    91  
663cecf5bbda13 Daniel Golle  2023-02-22    92  	cci: cci {
663cecf5bbda13 Daniel Golle  2023-02-22    93  		compatible = "mediatek,mt7988-cci",
663cecf5bbda13 Daniel Golle  2023-02-22    94  			     "mediatek,mt8183-cci";
663cecf5bbda13 Daniel Golle  2023-02-22    95  		clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22    96  			 <&topckgen CLK_TOP_XTAL>;
663cecf5bbda13 Daniel Golle  2023-02-22    97  		clock-names = "cci", "intermediate";
663cecf5bbda13 Daniel Golle  2023-02-22    98  		operating-points-v2 = <&cci_opp>;
663cecf5bbda13 Daniel Golle  2023-02-22    99  	};
663cecf5bbda13 Daniel Golle  2023-02-22   100  
663cecf5bbda13 Daniel Golle  2023-02-22   101  	cci_opp: opp_table_cci {
663cecf5bbda13 Daniel Golle  2023-02-22   102  		compatible = "operating-points-v2";
663cecf5bbda13 Daniel Golle  2023-02-22   103  		opp-shared;
663cecf5bbda13 Daniel Golle  2023-02-22   104  		opp00 {
663cecf5bbda13 Daniel Golle  2023-02-22   105  			opp-hz = /bits/ 64 <480000000>;
663cecf5bbda13 Daniel Golle  2023-02-22   106  			opp-microvolt = <850000>;
663cecf5bbda13 Daniel Golle  2023-02-22   107  		};
663cecf5bbda13 Daniel Golle  2023-02-22   108  		opp01 {
663cecf5bbda13 Daniel Golle  2023-02-22   109  			opp-hz = /bits/ 64 <660000000>;
663cecf5bbda13 Daniel Golle  2023-02-22   110  			opp-microvolt = <850000>;
663cecf5bbda13 Daniel Golle  2023-02-22   111  		};
663cecf5bbda13 Daniel Golle  2023-02-22   112  		opp02 {
663cecf5bbda13 Daniel Golle  2023-02-22   113  			opp-hz = /bits/ 64 <900000000>;
663cecf5bbda13 Daniel Golle  2023-02-22   114  			opp-microvolt = <850000>;
663cecf5bbda13 Daniel Golle  2023-02-22   115  		};
663cecf5bbda13 Daniel Golle  2023-02-22   116  		opp03 {
663cecf5bbda13 Daniel Golle  2023-02-22   117  			opp-hz = /bits/ 64 <1080000000>;
663cecf5bbda13 Daniel Golle  2023-02-22   118  			opp-microvolt = <900000>;
663cecf5bbda13 Daniel Golle  2023-02-22   119  		};
663cecf5bbda13 Daniel Golle  2023-02-22   120  	};
663cecf5bbda13 Daniel Golle  2023-02-22   121  
663cecf5bbda13 Daniel Golle  2023-02-22   122  	fan: pwm-fan {
663cecf5bbda13 Daniel Golle  2023-02-22   123  		compatible = "pwm-fan";
663cecf5bbda13 Daniel Golle  2023-02-22   124  		/* cooling level (0, 1, 2) : (0% duty, 50% duty, 100% duty) */
663cecf5bbda13 Daniel Golle  2023-02-22   125  		cooling-levels = <0 128 255>;
663cecf5bbda13 Daniel Golle  2023-02-22   126  		#cooling-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   127  		#thermal-sensor-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   128  		status = "disabled";
6c1d134a103f68 Rafał Miłecki 2024-01-08   129  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   130  
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
663cecf5bbda13 Daniel Golle  2023-02-22   149  	reserved-memory {
663cecf5bbda13 Daniel Golle  2023-02-22   150  		#address-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   151  		#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   152  		ranges;
663cecf5bbda13 Daniel Golle  2023-02-22   153  
663cecf5bbda13 Daniel Golle  2023-02-22   154  		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
663cecf5bbda13 Daniel Golle  2023-02-22   155  		secmon_reserved: secmon@43000000 {
663cecf5bbda13 Daniel Golle  2023-02-22   156  			reg = <0 0x43000000 0 0x50000>;
663cecf5bbda13 Daniel Golle  2023-02-22   157  			no-map;
663cecf5bbda13 Daniel Golle  2023-02-22   158  		};
663cecf5bbda13 Daniel Golle  2023-02-22   159  	};
663cecf5bbda13 Daniel Golle  2023-02-22   160  
663cecf5bbda13 Daniel Golle  2023-02-22   161  	timer {
663cecf5bbda13 Daniel Golle  2023-02-22   162  		compatible = "arm,armv8-timer";
663cecf5bbda13 Daniel Golle  2023-02-22   163  		interrupt-parent = <&gic>;
663cecf5bbda13 Daniel Golle  2023-02-22   164  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
663cecf5bbda13 Daniel Golle  2023-02-22   165  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
663cecf5bbda13 Daniel Golle  2023-02-22   166  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
663cecf5bbda13 Daniel Golle  2023-02-22   167  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
663cecf5bbda13 Daniel Golle  2023-02-22   168  	};
663cecf5bbda13 Daniel Golle  2023-02-22   169  
663cecf5bbda13 Daniel Golle  2023-02-22   170  	reg_1p8v: regulator-1p8v {
663cecf5bbda13 Daniel Golle  2023-02-22   171  		compatible = "regulator-fixed";
663cecf5bbda13 Daniel Golle  2023-02-22   172  		regulator-name = "fixed-1.8V";
663cecf5bbda13 Daniel Golle  2023-02-22   173  		regulator-min-microvolt = <1800000>;
663cecf5bbda13 Daniel Golle  2023-02-22   174  		regulator-max-microvolt = <1800000>;
663cecf5bbda13 Daniel Golle  2023-02-22   175  		regulator-boot-on;
663cecf5bbda13 Daniel Golle  2023-02-22   176  		regulator-always-on;
663cecf5bbda13 Daniel Golle  2023-02-22   177  	};
663cecf5bbda13 Daniel Golle  2023-02-22   178  
663cecf5bbda13 Daniel Golle  2023-02-22   179  	reg_3p3v: regulator-3p3v {
663cecf5bbda13 Daniel Golle  2023-02-22   180  		compatible = "regulator-fixed";
663cecf5bbda13 Daniel Golle  2023-02-22   181  		regulator-name = "fixed-3.3V";
663cecf5bbda13 Daniel Golle  2023-02-22   182  		regulator-min-microvolt = <3300000>;
663cecf5bbda13 Daniel Golle  2023-02-22   183  		regulator-max-microvolt = <3300000>;
663cecf5bbda13 Daniel Golle  2023-02-22   184  		regulator-boot-on;
663cecf5bbda13 Daniel Golle  2023-02-22   185  		regulator-always-on;
663cecf5bbda13 Daniel Golle  2023-02-22   186  	};
663cecf5bbda13 Daniel Golle  2023-02-22   187  
663cecf5bbda13 Daniel Golle  2023-02-22   188  	thermal-zones {
663cecf5bbda13 Daniel Golle  2023-02-22   189  		cpu_thermal: cpu-thermal {
663cecf5bbda13 Daniel Golle  2023-02-22   190  			polling-delay-passive = <1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   191  			polling-delay = <1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   192  			thermal-sensors = <&lvts 0>;
663cecf5bbda13 Daniel Golle  2023-02-22   193  			trips {
663cecf5bbda13 Daniel Golle  2023-02-22   194  				cpu_trip_crit: crit {
663cecf5bbda13 Daniel Golle  2023-02-22   195  					temperature = <125000>;
663cecf5bbda13 Daniel Golle  2023-02-22   196  					hysteresis = <2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   197  					type = "critical";
663cecf5bbda13 Daniel Golle  2023-02-22   198  				};
663cecf5bbda13 Daniel Golle  2023-02-22   199  
663cecf5bbda13 Daniel Golle  2023-02-22   200  				cpu_trip_hot: hot {
663cecf5bbda13 Daniel Golle  2023-02-22   201  					temperature = <120000>;
663cecf5bbda13 Daniel Golle  2023-02-22   202  					hysteresis = <2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   203  					type = "hot";
663cecf5bbda13 Daniel Golle  2023-02-22   204  				};
663cecf5bbda13 Daniel Golle  2023-02-22   205  
663cecf5bbda13 Daniel Golle  2023-02-22   206  				cpu_trip_active_high: active-high {
663cecf5bbda13 Daniel Golle  2023-02-22   207  					temperature = <115000>;
663cecf5bbda13 Daniel Golle  2023-02-22   208  					hysteresis = <2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   209  					type = "active";
663cecf5bbda13 Daniel Golle  2023-02-22   210  				};
663cecf5bbda13 Daniel Golle  2023-02-22   211  
663cecf5bbda13 Daniel Golle  2023-02-22   212  				cpu_trip_active_med: active-med {
663cecf5bbda13 Daniel Golle  2023-02-22   213  					temperature = <85000>;
663cecf5bbda13 Daniel Golle  2023-02-22   214  					hysteresis = <2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   215  					type = "active";
663cecf5bbda13 Daniel Golle  2023-02-22   216  				};
663cecf5bbda13 Daniel Golle  2023-02-22   217  
663cecf5bbda13 Daniel Golle  2023-02-22   218  				cpu_trip_active_low: active-low {
663cecf5bbda13 Daniel Golle  2023-02-22   219  					temperature = <40000>;
663cecf5bbda13 Daniel Golle  2023-02-22   220  					hysteresis = <2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   221  					type = "active";
663cecf5bbda13 Daniel Golle  2023-02-22   222  				};
663cecf5bbda13 Daniel Golle  2023-02-22   223  			};
663cecf5bbda13 Daniel Golle  2023-02-22   224  
663cecf5bbda13 Daniel Golle  2023-02-22   225  			cooling-maps {
663cecf5bbda13 Daniel Golle  2023-02-22   226  				cpu-active-high {
663cecf5bbda13 Daniel Golle  2023-02-22   227  				/* active: set fan to cooling level 2 */
663cecf5bbda13 Daniel Golle  2023-02-22   228  					cooling-device = <&fan 3 3>;
663cecf5bbda13 Daniel Golle  2023-02-22   229  					trip = <&cpu_trip_active_high>;
663cecf5bbda13 Daniel Golle  2023-02-22   230  				};
663cecf5bbda13 Daniel Golle  2023-02-22   231  
663cecf5bbda13 Daniel Golle  2023-02-22   232  				cpu-active-low {
663cecf5bbda13 Daniel Golle  2023-02-22   233  				/* active: set fan to cooling level 1 */
663cecf5bbda13 Daniel Golle  2023-02-22   234  					cooling-device = <&fan 2 2>;
663cecf5bbda13 Daniel Golle  2023-02-22   235  					trip = <&cpu_trip_active_med>;
663cecf5bbda13 Daniel Golle  2023-02-22   236  				};
663cecf5bbda13 Daniel Golle  2023-02-22   237  
663cecf5bbda13 Daniel Golle  2023-02-22   238  				cpu-passive {
663cecf5bbda13 Daniel Golle  2023-02-22   239  				/* passive: set fan to cooling level 0 */
663cecf5bbda13 Daniel Golle  2023-02-22   240  					cooling-device = <&fan 1 1>;
663cecf5bbda13 Daniel Golle  2023-02-22   241  					trip = <&cpu_trip_active_low>;
663cecf5bbda13 Daniel Golle  2023-02-22   242  				};
663cecf5bbda13 Daniel Golle  2023-02-22   243  			};
663cecf5bbda13 Daniel Golle  2023-02-22   244  		};
663cecf5bbda13 Daniel Golle  2023-02-22   245  	};
663cecf5bbda13 Daniel Golle  2023-02-22   246  
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
663cecf5bbda13 Daniel Golle  2023-02-22   266  		phyfw: phy-firmware@f000000 {
663cecf5bbda13 Daniel Golle  2023-02-22   267  			compatible = "mediatek,2p5gphy-fw";
663cecf5bbda13 Daniel Golle  2023-02-22   268  			reg = <0 0x0f000000 0 0x8000>,
663cecf5bbda13 Daniel Golle  2023-02-22   269  			      <0 0x0f100000 0 0x20000>,
663cecf5bbda13 Daniel Golle  2023-02-22   270  			      <0 0x0f0f0000 0 0x200>;
663cecf5bbda13 Daniel Golle  2023-02-22   271  		};
663cecf5bbda13 Daniel Golle  2023-02-22   272  
09346afaba0a89 Rafał Miłecki 2024-02-13   273  		infracfg: clock-controller@10001000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   274  			compatible = "mediatek,mt7988-infracfg", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08   275  			reg = <0 0x10001000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   276  			#clock-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   277  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   278  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   279  
663cecf5bbda13 Daniel Golle  2023-02-22   280  		topckgen: clock-controller@1001b000 {
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
663cecf5bbda13 Daniel Golle  2023-02-22   293  		apmixedsys: clock-controller@1001e000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   294  			compatible = "mediatek,mt7988-apmixedsys";
b616b403cbffc6 Rafał Miłecki 2024-01-08   295  			reg = <0 0x1001e000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   296  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   297  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   298  
663cecf5bbda13 Daniel Golle  2023-02-22   299  		pio: pinctrl@1001f000 {
663cecf5bbda13 Daniel Golle  2023-02-22   300  			compatible = "mediatek,mt7988-pinctrl", "syscon";
663cecf5bbda13 Daniel Golle  2023-02-22   301  			reg = <0 0x1001f000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   302  			<0 0x11c10000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   303  			<0 0x11d00000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   304  			<0 0x11d20000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   305  			<0 0x11e00000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   306  			<0 0x11f00000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   307  			<0 0x1000b000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   308  			reg-names = "gpio_base", "iocfg_tr_base",
663cecf5bbda13 Daniel Golle  2023-02-22   309  				    "iocfg_br_base", "iocfg_rb_base",
663cecf5bbda13 Daniel Golle  2023-02-22   310  				    "iocfg_lb_base", "iocfg_tl_base", "eint";
663cecf5bbda13 Daniel Golle  2023-02-22   311  			gpio-controller;
663cecf5bbda13 Daniel Golle  2023-02-22   312  			#gpio-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   313  			gpio-ranges = <&pio 0 0 84>;
663cecf5bbda13 Daniel Golle  2023-02-22   314  			interrupt-controller;
663cecf5bbda13 Daniel Golle  2023-02-22   315  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   316  			interrupt-parent = <&gic>;
663cecf5bbda13 Daniel Golle  2023-02-22   317  			#interrupt-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   318  
663cecf5bbda13 Daniel Golle  2023-02-22   319  			mdio0_pins: mdio0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   320  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   321  					function = "eth";
663cecf5bbda13 Daniel Golle  2023-02-22   322  					groups = "mdc_mdio0";
663cecf5bbda13 Daniel Golle  2023-02-22   323  				};
663cecf5bbda13 Daniel Golle  2023-02-22   324  
663cecf5bbda13 Daniel Golle  2023-02-22   325  				conf {
663cecf5bbda13 Daniel Golle  2023-02-22   326  					groups = "mdc_mdio0";
663cecf5bbda13 Daniel Golle  2023-02-22   327  					drive-strength = <MTK_DRIVE_8mA>;
663cecf5bbda13 Daniel Golle  2023-02-22   328  				};
663cecf5bbda13 Daniel Golle  2023-02-22   329  			};
663cecf5bbda13 Daniel Golle  2023-02-22   330  
663cecf5bbda13 Daniel Golle  2023-02-22   331  			i2c0_pins: i2c0-pins-g0 {
663cecf5bbda13 Daniel Golle  2023-02-22   332  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   333  					function = "i2c";
663cecf5bbda13 Daniel Golle  2023-02-22   334  					groups = "i2c0_1";
663cecf5bbda13 Daniel Golle  2023-02-22   335  				};
663cecf5bbda13 Daniel Golle  2023-02-22   336  			};
663cecf5bbda13 Daniel Golle  2023-02-22   337  
663cecf5bbda13 Daniel Golle  2023-02-22   338  			i2c1_pins: i2c1-pins-g0 {
663cecf5bbda13 Daniel Golle  2023-02-22   339  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   340  					function = "i2c";
663cecf5bbda13 Daniel Golle  2023-02-22   341  					groups = "i2c1_0";
663cecf5bbda13 Daniel Golle  2023-02-22   342  				};
663cecf5bbda13 Daniel Golle  2023-02-22   343  			};
663cecf5bbda13 Daniel Golle  2023-02-22   344  
663cecf5bbda13 Daniel Golle  2023-02-22   345  			i2c1_sfp_pins: i2c1-sfp-pins-g0 {
663cecf5bbda13 Daniel Golle  2023-02-22   346  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   347  					function = "i2c";
663cecf5bbda13 Daniel Golle  2023-02-22   348  					groups = "i2c1_sfp";
663cecf5bbda13 Daniel Golle  2023-02-22   349  				};
663cecf5bbda13 Daniel Golle  2023-02-22   350  			};
663cecf5bbda13 Daniel Golle  2023-02-22   351  
663cecf5bbda13 Daniel Golle  2023-02-22   352  			i2c2_pins: i2c2-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   353  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   354  					function = "i2c";
663cecf5bbda13 Daniel Golle  2023-02-22   355  					groups = "i2c2";
663cecf5bbda13 Daniel Golle  2023-02-22   356  				};
663cecf5bbda13 Daniel Golle  2023-02-22   357  			};
663cecf5bbda13 Daniel Golle  2023-02-22   358  
663cecf5bbda13 Daniel Golle  2023-02-22   359  			i2c2_0_pins: i2c2-pins-g0 {
663cecf5bbda13 Daniel Golle  2023-02-22   360  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   361  					function = "i2c";
663cecf5bbda13 Daniel Golle  2023-02-22   362  					groups = "i2c2_0";
663cecf5bbda13 Daniel Golle  2023-02-22   363  				};
663cecf5bbda13 Daniel Golle  2023-02-22   364  			};
663cecf5bbda13 Daniel Golle  2023-02-22   365  
663cecf5bbda13 Daniel Golle  2023-02-22   366  			i2c2_1_pins: i2c2-pins-g1 {
663cecf5bbda13 Daniel Golle  2023-02-22   367  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   368  					function = "i2c";
663cecf5bbda13 Daniel Golle  2023-02-22   369  					groups = "i2c2_1";
663cecf5bbda13 Daniel Golle  2023-02-22   370  				};
663cecf5bbda13 Daniel Golle  2023-02-22   371  			};
663cecf5bbda13 Daniel Golle  2023-02-22   372  
663cecf5bbda13 Daniel Golle  2023-02-22   373  			gbe0_led0_pins: gbe0-led0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   374  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   375  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   376  					groups = "gbe0_led0";
663cecf5bbda13 Daniel Golle  2023-02-22   377  				};
663cecf5bbda13 Daniel Golle  2023-02-22   378  			};
663cecf5bbda13 Daniel Golle  2023-02-22   379  
663cecf5bbda13 Daniel Golle  2023-02-22   380  			gbe1_led0_pins: gbe1-led0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   381  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   382  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   383  					groups = "gbe1_led0";
663cecf5bbda13 Daniel Golle  2023-02-22   384  				};
663cecf5bbda13 Daniel Golle  2023-02-22   385  			};
663cecf5bbda13 Daniel Golle  2023-02-22   386  
663cecf5bbda13 Daniel Golle  2023-02-22   387  			gbe2_led0_pins: gbe2-led0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   388  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   389  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   390  					groups = "gbe2_led0";
663cecf5bbda13 Daniel Golle  2023-02-22   391  				};
663cecf5bbda13 Daniel Golle  2023-02-22   392  			};
663cecf5bbda13 Daniel Golle  2023-02-22   393  
663cecf5bbda13 Daniel Golle  2023-02-22   394  			gbe3_led0_pins: gbe3-led0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   395  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   396  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   397  					groups = "gbe3_led0";
663cecf5bbda13 Daniel Golle  2023-02-22   398  				};
663cecf5bbda13 Daniel Golle  2023-02-22   399  			};
663cecf5bbda13 Daniel Golle  2023-02-22   400  
663cecf5bbda13 Daniel Golle  2023-02-22   401  			gbe0_led1_pins: gbe0-led1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   402  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   403  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   404  					groups = "gbe0_led1";
663cecf5bbda13 Daniel Golle  2023-02-22   405  				};
663cecf5bbda13 Daniel Golle  2023-02-22   406  			};
663cecf5bbda13 Daniel Golle  2023-02-22   407  
663cecf5bbda13 Daniel Golle  2023-02-22   408  			gbe1_led1_pins: gbe1-led1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   409  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   410  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   411  					groups = "gbe1_led1";
663cecf5bbda13 Daniel Golle  2023-02-22   412  				};
663cecf5bbda13 Daniel Golle  2023-02-22   413  			};
663cecf5bbda13 Daniel Golle  2023-02-22   414  
663cecf5bbda13 Daniel Golle  2023-02-22   415  			gbe2_led1_pins: gbe2-led1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   416  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   417  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   418  					groups = "gbe2_led1";
663cecf5bbda13 Daniel Golle  2023-02-22   419  				};
663cecf5bbda13 Daniel Golle  2023-02-22   420  			};
663cecf5bbda13 Daniel Golle  2023-02-22   421  
663cecf5bbda13 Daniel Golle  2023-02-22   422  			gbe3_led1_pins: gbe3-led1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   423  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   424  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   425  					groups = "gbe3_led1";
663cecf5bbda13 Daniel Golle  2023-02-22   426  				};
663cecf5bbda13 Daniel Golle  2023-02-22   427  			};
663cecf5bbda13 Daniel Golle  2023-02-22   428  
663cecf5bbda13 Daniel Golle  2023-02-22   429  			i2p5gbe_led0_pins: 2p5gbe-led0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   430  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   431  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   432  					groups = "2p5gbe_led0";
663cecf5bbda13 Daniel Golle  2023-02-22   433  				};
663cecf5bbda13 Daniel Golle  2023-02-22   434  			};
663cecf5bbda13 Daniel Golle  2023-02-22   435  
663cecf5bbda13 Daniel Golle  2023-02-22   436  			i2p5gbe_led1_pins: 2p5gbe-led1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   437  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   438  					function = "led";
663cecf5bbda13 Daniel Golle  2023-02-22   439  					groups = "2p5gbe_led1";
663cecf5bbda13 Daniel Golle  2023-02-22   440  				};
663cecf5bbda13 Daniel Golle  2023-02-22   441  			};
663cecf5bbda13 Daniel Golle  2023-02-22   442  
663cecf5bbda13 Daniel Golle  2023-02-22   443  			mmc0_pins_emmc_45: mmc0-pins-emmc-45 {
663cecf5bbda13 Daniel Golle  2023-02-22   444  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   445  					function = "flash";
663cecf5bbda13 Daniel Golle  2023-02-22   446  					groups = "emmc_45";
663cecf5bbda13 Daniel Golle  2023-02-22   447  				};
663cecf5bbda13 Daniel Golle  2023-02-22   448  			};
663cecf5bbda13 Daniel Golle  2023-02-22   449  
663cecf5bbda13 Daniel Golle  2023-02-22   450  			mmc0_pins_emmc_51: mmc0-pins-emmc-51 {
663cecf5bbda13 Daniel Golle  2023-02-22   451  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   452  					function = "flash";
663cecf5bbda13 Daniel Golle  2023-02-22   453  					groups = "emmc_51";
663cecf5bbda13 Daniel Golle  2023-02-22   454  				};
663cecf5bbda13 Daniel Golle  2023-02-22   455  			};
663cecf5bbda13 Daniel Golle  2023-02-22   456  
663cecf5bbda13 Daniel Golle  2023-02-22   457  			mmc0_pins_sdcard: mmc0-pins-sdcard {
663cecf5bbda13 Daniel Golle  2023-02-22   458  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   459  					function = "flash";
663cecf5bbda13 Daniel Golle  2023-02-22   460  					groups = "sdcard";
663cecf5bbda13 Daniel Golle  2023-02-22   461  				};
663cecf5bbda13 Daniel Golle  2023-02-22   462  			};
663cecf5bbda13 Daniel Golle  2023-02-22   463  
663cecf5bbda13 Daniel Golle  2023-02-22   464  			uart0_pins: uart0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   465  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   466  					function = "uart";
663cecf5bbda13 Daniel Golle  2023-02-22   467  					groups =  "uart0";
663cecf5bbda13 Daniel Golle  2023-02-22   468  				};
663cecf5bbda13 Daniel Golle  2023-02-22   469  			};
663cecf5bbda13 Daniel Golle  2023-02-22   470  
663cecf5bbda13 Daniel Golle  2023-02-22   471  			snfi_pins: snfi-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   472  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   473  					function = "flash";
663cecf5bbda13 Daniel Golle  2023-02-22   474  					groups = "snfi";
663cecf5bbda13 Daniel Golle  2023-02-22   475  				};
663cecf5bbda13 Daniel Golle  2023-02-22   476  			};
663cecf5bbda13 Daniel Golle  2023-02-22   477  
663cecf5bbda13 Daniel Golle  2023-02-22   478  			spi0_pins: spi0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   479  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   480  					function = "spi";
663cecf5bbda13 Daniel Golle  2023-02-22   481  					groups = "spi0";
663cecf5bbda13 Daniel Golle  2023-02-22   482  				};
663cecf5bbda13 Daniel Golle  2023-02-22   483  			};
663cecf5bbda13 Daniel Golle  2023-02-22   484  
663cecf5bbda13 Daniel Golle  2023-02-22   485  			spi0_flash_pins: spi0-flash-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   486  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   487  					function = "spi";
663cecf5bbda13 Daniel Golle  2023-02-22   488  					groups = "spi0", "spi0_wp_hold";
663cecf5bbda13 Daniel Golle  2023-02-22   489  				};
663cecf5bbda13 Daniel Golle  2023-02-22   490  			};
663cecf5bbda13 Daniel Golle  2023-02-22   491  
663cecf5bbda13 Daniel Golle  2023-02-22   492  			spi1_pins: spi1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   493  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   494  					function = "spi";
663cecf5bbda13 Daniel Golle  2023-02-22   495  					groups = "spi1";
663cecf5bbda13 Daniel Golle  2023-02-22   496  				};
663cecf5bbda13 Daniel Golle  2023-02-22   497  			};
663cecf5bbda13 Daniel Golle  2023-02-22   498  
663cecf5bbda13 Daniel Golle  2023-02-22   499  			spi2_pins: spi2-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   500  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   501  					function = "spi";
663cecf5bbda13 Daniel Golle  2023-02-22   502  					groups = "spi2";
663cecf5bbda13 Daniel Golle  2023-02-22   503  				};
663cecf5bbda13 Daniel Golle  2023-02-22   504  			};
663cecf5bbda13 Daniel Golle  2023-02-22   505  
663cecf5bbda13 Daniel Golle  2023-02-22   506  			spi2_flash_pins: spi2-flash-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   507  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   508  					function = "spi";
663cecf5bbda13 Daniel Golle  2023-02-22   509  					groups = "spi2", "spi2_wp_hold";
663cecf5bbda13 Daniel Golle  2023-02-22   510  				};
663cecf5bbda13 Daniel Golle  2023-02-22   511  			};
663cecf5bbda13 Daniel Golle  2023-02-22   512  
663cecf5bbda13 Daniel Golle  2023-02-22   513  			pcie0_pins: pcie0-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   514  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   515  					function = "pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   516  					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
663cecf5bbda13 Daniel Golle  2023-02-22   517  						 "pcie_wake_n0_0";
663cecf5bbda13 Daniel Golle  2023-02-22   518  				};
663cecf5bbda13 Daniel Golle  2023-02-22   519  			};
663cecf5bbda13 Daniel Golle  2023-02-22   520  
663cecf5bbda13 Daniel Golle  2023-02-22   521  			pcie1_pins: pcie1-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   522  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   523  					function = "pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   524  					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
663cecf5bbda13 Daniel Golle  2023-02-22   525  						 "pcie_wake_n1_0";
663cecf5bbda13 Daniel Golle  2023-02-22   526  				};
663cecf5bbda13 Daniel Golle  2023-02-22   527  			};
663cecf5bbda13 Daniel Golle  2023-02-22   528  
663cecf5bbda13 Daniel Golle  2023-02-22   529  			pcie2_pins: pcie2-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   530  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   531  					function = "pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   532  					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
663cecf5bbda13 Daniel Golle  2023-02-22   533  						 "pcie_wake_n2_0";
663cecf5bbda13 Daniel Golle  2023-02-22   534  				};
663cecf5bbda13 Daniel Golle  2023-02-22   535  			};
663cecf5bbda13 Daniel Golle  2023-02-22   536  
663cecf5bbda13 Daniel Golle  2023-02-22   537  			pcie3_pins: pcie3-pins {
663cecf5bbda13 Daniel Golle  2023-02-22   538  				mux {
663cecf5bbda13 Daniel Golle  2023-02-22   539  					function = "pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   540  					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
663cecf5bbda13 Daniel Golle  2023-02-22   541  						 "pcie_wake_n3_0";
663cecf5bbda13 Daniel Golle  2023-02-22   542  				};
663cecf5bbda13 Daniel Golle  2023-02-22   543  			};
663cecf5bbda13 Daniel Golle  2023-02-22   544  		};
663cecf5bbda13 Daniel Golle  2023-02-22   545  
663cecf5bbda13 Daniel Golle  2023-02-22   546  		pwm: pwm@10048000 {
09ff2216a03570 Rafał Miłecki 2024-06-04   547  			compatible = "mediatek,mt7988-pwm";
09ff2216a03570 Rafał Miłecki 2024-06-04   548  			reg = <0 0x10048000 0 0x1000>;
09ff2216a03570 Rafał Miłecki 2024-06-04   549  			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
09ff2216a03570 Rafał Miłecki 2024-06-04   550  				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
09ff2216a03570 Rafał Miłecki 2024-06-04   551  				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
09ff2216a03570 Rafał Miłecki 2024-06-04   552  				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
09ff2216a03570 Rafał Miłecki 2024-06-04   553  				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
09ff2216a03570 Rafał Miłecki 2024-06-04   554  				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
09ff2216a03570 Rafał Miłecki 2024-06-04   555  				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
09ff2216a03570 Rafał Miłecki 2024-06-04   556  				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
09ff2216a03570 Rafał Miłecki 2024-06-04   557  				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
09ff2216a03570 Rafał Miłecki 2024-06-04   558  				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
09ff2216a03570 Rafał Miłecki 2024-06-04   559  			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
09ff2216a03570 Rafał Miłecki 2024-06-04   560  				      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
09ff2216a03570 Rafał Miłecki 2024-06-04   561  			#pwm-cells = <2>;
09ff2216a03570 Rafał Miłecki 2024-06-04   562  			status = "disabled";
09ff2216a03570 Rafał Miłecki 2024-06-04   563  		};
09ff2216a03570 Rafał Miłecki 2024-06-04   564  
663cecf5bbda13 Daniel Golle  2023-02-22   565  		sgmiisys0: syscon@10060000 {
663cecf5bbda13 Daniel Golle  2023-02-22   566  			compatible = "mediatek,mt7988-sgmiisys",
663cecf5bbda13 Daniel Golle  2023-02-22   567  				     "mediatek,mt7988-sgmiisys0",
663cecf5bbda13 Daniel Golle  2023-02-22   568  				     "syscon",
663cecf5bbda13 Daniel Golle  2023-02-22   569  				     "simple-mfd";
663cecf5bbda13 Daniel Golle  2023-02-22   570  			reg = <0 0x10060000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   571  			resets = <&watchdog 1>;
663cecf5bbda13 Daniel Golle  2023-02-22   572  			#clock-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   573  
663cecf5bbda13 Daniel Golle  2023-02-22   574  			sgmiipcs0: pcs {
663cecf5bbda13 Daniel Golle  2023-02-22   575  				compatible = "mediatek,mt7988-sgmii";
663cecf5bbda13 Daniel Golle  2023-02-22   576  				clocks = <&topckgen CLK_TOP_SGM_0_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   577  					 <&sgmiisys0 CLK_SGM0_TX_EN>,
663cecf5bbda13 Daniel Golle  2023-02-22   578  					 <&sgmiisys0 CLK_SGM0_RX_EN>;
663cecf5bbda13 Daniel Golle  2023-02-22   579  				clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
663cecf5bbda13 Daniel Golle  2023-02-22   580  				phys = <&xfi_tphy0>;
663cecf5bbda13 Daniel Golle  2023-02-22   581  				#pcs-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   582  			};
663cecf5bbda13 Daniel Golle  2023-02-22   583  		};
663cecf5bbda13 Daniel Golle  2023-02-22   584  
663cecf5bbda13 Daniel Golle  2023-02-22   585  		sgmiisys1: syscon@10070000 {
663cecf5bbda13 Daniel Golle  2023-02-22   586  			compatible = "mediatek,mt7988-sgmiisys",
663cecf5bbda13 Daniel Golle  2023-02-22   587  				     "mediatek,mt7988-sgmiisys1",
663cecf5bbda13 Daniel Golle  2023-02-22   588  				     "syscon",
663cecf5bbda13 Daniel Golle  2023-02-22   589  				     "simple-mfd";
663cecf5bbda13 Daniel Golle  2023-02-22   590  			reg = <0 0x10070000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   591  			resets = <&watchdog 2>;
663cecf5bbda13 Daniel Golle  2023-02-22   592  			#clock-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   593  
663cecf5bbda13 Daniel Golle  2023-02-22   594  			sgmiipcs1: pcs {
663cecf5bbda13 Daniel Golle  2023-02-22   595  				compatible = "mediatek,mt7988-sgmii";
663cecf5bbda13 Daniel Golle  2023-02-22   596  				clocks = <&topckgen CLK_TOP_SGM_1_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   597  					 <&sgmiisys1 CLK_SGM1_TX_EN>,
663cecf5bbda13 Daniel Golle  2023-02-22   598  					 <&sgmiisys1 CLK_SGM1_RX_EN>;
663cecf5bbda13 Daniel Golle  2023-02-22   599  				clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
663cecf5bbda13 Daniel Golle  2023-02-22   600  				phys = <&xfi_tphy1>;
663cecf5bbda13 Daniel Golle  2023-02-22   601  				#pcs-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   602  			};
663cecf5bbda13 Daniel Golle  2023-02-22   603  		};
663cecf5bbda13 Daniel Golle  2023-02-22   604  
663cecf5bbda13 Daniel Golle  2023-02-22   605  		usxgmiisys0: pcs@10080000 {
663cecf5bbda13 Daniel Golle  2023-02-22   606  			compatible = "mediatek,mt7988-usxgmiisys";
663cecf5bbda13 Daniel Golle  2023-02-22   607  			reg = <0 0x10080000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   608  			resets = <&watchdog 12>;
663cecf5bbda13 Daniel Golle  2023-02-22   609  			clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22   610  			phys = <&xfi_tphy0>;
663cecf5bbda13 Daniel Golle  2023-02-22   611  			#pcs-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   612  		};
663cecf5bbda13 Daniel Golle  2023-02-22   613  
663cecf5bbda13 Daniel Golle  2023-02-22   614  		usxgmiisys1: pcs@10081000 {
663cecf5bbda13 Daniel Golle  2023-02-22   615  			compatible = "mediatek,mt7988-usxgmiisys";
663cecf5bbda13 Daniel Golle  2023-02-22   616  			reg = <0 0x10081000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   617  			resets = <&watchdog 13>;
663cecf5bbda13 Daniel Golle  2023-02-22   618  			clocks = <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22   619  			phys = <&xfi_tphy1>;
663cecf5bbda13 Daniel Golle  2023-02-22   620  			#pcs-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   621  		};
663cecf5bbda13 Daniel Golle  2023-02-22   622  
663cecf5bbda13 Daniel Golle  2023-02-22   623  		mcusys: mcusys@100e0000 {
663cecf5bbda13 Daniel Golle  2023-02-22   624  			compatible = "mediatek,mt7988-mcusys", "syscon";
663cecf5bbda13 Daniel Golle  2023-02-22   625  			reg = <0 0x100e0000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   626  			#clock-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   627  		};
663cecf5bbda13 Daniel Golle  2023-02-22   628  
663cecf5bbda13 Daniel Golle  2023-02-22   629  		uart0: serial@11000000 {
663cecf5bbda13 Daniel Golle  2023-02-22   630  			compatible = "mediatek,mt7986-uart",
663cecf5bbda13 Daniel Golle  2023-02-22   631  				     "mediatek,mt6577-uart";
663cecf5bbda13 Daniel Golle  2023-02-22   632  			reg = <0 0x11000000 0 0x100>;
663cecf5bbda13 Daniel Golle  2023-02-22   633  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   634  			/*
663cecf5bbda13 Daniel Golle  2023-02-22   635  			 * 8250-mtk driver don't control "baud" clock since commit
663cecf5bbda13 Daniel Golle  2023-02-22   636  			 * e32a83c70cf9 (kernel v5.7), but both "baud" and "bus" clocks
663cecf5bbda13 Daniel Golle  2023-02-22   637  			 * still need to be passed to the driver to prevent probe fail
663cecf5bbda13 Daniel Golle  2023-02-22   638  			 */
663cecf5bbda13 Daniel Golle  2023-02-22   639  			clocks = <&topckgen CLK_TOP_UART_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   640  				 <&infracfg CLK_INFRA_52M_UART0_CK>;
663cecf5bbda13 Daniel Golle  2023-02-22   641  			clock-names = "baud", "bus";
663cecf5bbda13 Daniel Golle  2023-02-22   642  			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   643  					  <&infracfg CLK_INFRA_MUX_UART0_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22   644  			assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
663cecf5bbda13 Daniel Golle  2023-02-22   645  						 <&topckgen CLK_TOP_UART_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22   646  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22   647  			pinctrl-0 = <&uart0_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22   648  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   649  		};
663cecf5bbda13 Daniel Golle  2023-02-22   650  
663cecf5bbda13 Daniel Golle  2023-02-22   651  		snand: spi@11001000 {
663cecf5bbda13 Daniel Golle  2023-02-22   652  			compatible = "mediatek,mt7986-snand";
663cecf5bbda13 Daniel Golle  2023-02-22   653  			reg = <0 0x11001000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   654  			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   655  			clocks = <&infracfg CLK_INFRA_SPINFI>,
663cecf5bbda13 Daniel Golle  2023-02-22   656  				 <&infracfg CLK_INFRA_NFI>,
663cecf5bbda13 Daniel Golle  2023-02-22   657  				 <&infracfg CLK_INFRA_66M_NFI_HCK>;
663cecf5bbda13 Daniel Golle  2023-02-22   658  			clock-names = "pad_clk", "nfi_clk", "nfi_hclk";
663cecf5bbda13 Daniel Golle  2023-02-22   659  			nand-ecc-engine = <&bch>;
663cecf5bbda13 Daniel Golle  2023-02-22   660  			mediatek,quad-spi;
663cecf5bbda13 Daniel Golle  2023-02-22   661  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   662  			#size-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   663  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22   664  			pinctrl-0 = <&snfi_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22   665  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   666  		};
663cecf5bbda13 Daniel Golle  2023-02-22   667  
663cecf5bbda13 Daniel Golle  2023-02-22   668  		bch: ecc@11002000 {
663cecf5bbda13 Daniel Golle  2023-02-22   669  			compatible = "mediatek,mt7686-ecc";
663cecf5bbda13 Daniel Golle  2023-02-22   670  			reg = <0 0x11002000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   671  			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   672  			clocks = <&infracfg CLK_INFRA_NFI>;
663cecf5bbda13 Daniel Golle  2023-02-22   673  			clock-names = "nfiecc_clk";
663cecf5bbda13 Daniel Golle  2023-02-22   674  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   675  		};
663cecf5bbda13 Daniel Golle  2023-02-22   676  
663cecf5bbda13 Daniel Golle  2023-02-22   677  		i2c0: i2c@11003000 {
663cecf5bbda13 Daniel Golle  2023-02-22   678  			compatible = "mediatek,mt7988-i2c",
663cecf5bbda13 Daniel Golle  2023-02-22   679  				     "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki 2024-06-04   680  			reg = <0 0x11003000 0 0x1000>,
660c230bf30280 Rafał Miłecki 2024-06-04   681  			      <0 0x10217080 0 0x80>;
660c230bf30280 Rafał Miłecki 2024-06-04   682  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   683  			clock-div = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   684  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki 2024-06-04   685  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki 2024-06-04   686  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki 2024-06-04   687  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   688  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki 2024-06-04   689  			status = "disabled";
660c230bf30280 Rafał Miłecki 2024-06-04   690  		};
660c230bf30280 Rafał Miłecki 2024-06-04   691  
663cecf5bbda13 Daniel Golle  2023-02-22   692  		i2c1: i2c@11004000 {
663cecf5bbda13 Daniel Golle  2023-02-22   693  			compatible = "mediatek,mt7988-i2c",
663cecf5bbda13 Daniel Golle  2023-02-22   694  				     "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki 2024-06-04   695  			reg = <0 0x11004000 0 0x1000>,
660c230bf30280 Rafał Miłecki 2024-06-04   696  			      <0 0x10217100 0 0x80>;
660c230bf30280 Rafał Miłecki 2024-06-04   697  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   698  			clock-div = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   699  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki 2024-06-04   700  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki 2024-06-04   701  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki 2024-06-04   702  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   703  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki 2024-06-04   704  			status = "disabled";
660c230bf30280 Rafał Miłecki 2024-06-04   705  		};
660c230bf30280 Rafał Miłecki 2024-06-04   706  
663cecf5bbda13 Daniel Golle  2023-02-22   707  		i2c2: i2c@11005000 {
663cecf5bbda13 Daniel Golle  2023-02-22   708  			compatible = "mediatek,mt7988-i2c",
663cecf5bbda13 Daniel Golle  2023-02-22   709  				"mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki 2024-06-04   710  			reg = <0 0x11005000 0 0x1000>,
660c230bf30280 Rafał Miłecki 2024-06-04   711  			      <0 0x10217180 0 0x80>;
660c230bf30280 Rafał Miłecki 2024-06-04   712  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   713  			clock-div = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   714  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki 2024-06-04   715  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki 2024-06-04   716  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki 2024-06-04   717  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   718  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki 2024-06-04   719  			status = "disabled";
660c230bf30280 Rafał Miłecki 2024-06-04   720  		};
660c230bf30280 Rafał Miłecki 2024-06-04   721  
663cecf5bbda13 Daniel Golle  2023-02-22   722  		spi0: spi@11007000 {
663cecf5bbda13 Daniel Golle  2023-02-22   723  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
663cecf5bbda13 Daniel Golle  2023-02-22   724  			reg = <0 0x11007000 0 0x100>;
663cecf5bbda13 Daniel Golle  2023-02-22   725  			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   726  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
663cecf5bbda13 Daniel Golle  2023-02-22   727  				 <&topckgen CLK_TOP_SPI_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   728  				 <&infracfg CLK_INFRA_104M_SPI0>,
663cecf5bbda13 Daniel Golle  2023-02-22   729  				 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
663cecf5bbda13 Daniel Golle  2023-02-22   730  			clock-names = "parent-clk", "sel-clk", "spi-clk",
663cecf5bbda13 Daniel Golle  2023-02-22   731  				      "spi-hclk";
663cecf5bbda13 Daniel Golle  2023-02-22   732  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   733  			#size-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   734  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   735  		};
663cecf5bbda13 Daniel Golle  2023-02-22   736  
663cecf5bbda13 Daniel Golle  2023-02-22   737  		spi1: spi@11008000 {
663cecf5bbda13 Daniel Golle  2023-02-22   738  			compatible = "mediatek,ipm-spi-single", "mediatek,spi-ipm";
663cecf5bbda13 Daniel Golle  2023-02-22   739  			reg = <0 0x11008000 0 0x100>;
663cecf5bbda13 Daniel Golle  2023-02-22   740  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   741  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
663cecf5bbda13 Daniel Golle  2023-02-22   742  				 <&topckgen CLK_TOP_SPI_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   743  				 <&infracfg CLK_INFRA_104M_SPI1>,
663cecf5bbda13 Daniel Golle  2023-02-22   744  				 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
663cecf5bbda13 Daniel Golle  2023-02-22   745  			clock-names = "parent-clk", "sel-clk", "spi-clk",
663cecf5bbda13 Daniel Golle  2023-02-22   746  				      "spi-hclk";
663cecf5bbda13 Daniel Golle  2023-02-22   747  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   748  			#size-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   749  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22   750  			pinctrl-0 = <&spi1_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22   751  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   752  		};
663cecf5bbda13 Daniel Golle  2023-02-22   753  
663cecf5bbda13 Daniel Golle  2023-02-22   754  		spi2: spi@11009000 {
663cecf5bbda13 Daniel Golle  2023-02-22   755  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
663cecf5bbda13 Daniel Golle  2023-02-22   756  			reg = <0 0x11009000 0 0x100>;
663cecf5bbda13 Daniel Golle  2023-02-22   757  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   758  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
663cecf5bbda13 Daniel Golle  2023-02-22   759  				 <&topckgen CLK_TOP_SPI_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   760  				 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
663cecf5bbda13 Daniel Golle  2023-02-22   761  				 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
663cecf5bbda13 Daniel Golle  2023-02-22   762  			clock-names = "parent-clk", "sel-clk", "spi-clk",
663cecf5bbda13 Daniel Golle  2023-02-22   763  				      "spi-hclk";
663cecf5bbda13 Daniel Golle  2023-02-22   764  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   765  			#size-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   766  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   767  		};
663cecf5bbda13 Daniel Golle  2023-02-22   768  
663cecf5bbda13 Daniel Golle  2023-02-22   769  		lvts: lvts@1100a000 {
663cecf5bbda13 Daniel Golle  2023-02-22   770  			compatible = "mediatek,mt7988-lvts-ap";
663cecf5bbda13 Daniel Golle  2023-02-22   771  			#thermal-sensor-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   772  			reg = <0 0x1100a000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   773  			clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
663cecf5bbda13 Daniel Golle  2023-02-22   774  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   775  			resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
663cecf5bbda13 Daniel Golle  2023-02-22   776  			nvmem-cells = <&lvts_calibration>;
663cecf5bbda13 Daniel Golle  2023-02-22   777  			nvmem-cell-names = "lvts-calib-data-1";
663cecf5bbda13 Daniel Golle  2023-02-22   778  		};
663cecf5bbda13 Daniel Golle  2023-02-22   779  
663cecf5bbda13 Daniel Golle  2023-02-22   780  		ssusb0: usb@11190000 {
09346afaba0a89 Rafał Miłecki 2024-02-13   781  			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
09346afaba0a89 Rafał Miłecki 2024-02-13   782  			reg = <0 0x11190000 0 0x2e00>,
09346afaba0a89 Rafał Miłecki 2024-02-13   783  			      <0 0x11193e00 0 0x0100>;
09346afaba0a89 Rafał Miłecki 2024-02-13   784  			reg-names = "mac", "ippc";
09346afaba0a89 Rafał Miłecki 2024-02-13   785  			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
09346afaba0a89 Rafał Miłecki 2024-02-13   786  			clocks = <&infracfg CLK_INFRA_USB_SYS>,
09346afaba0a89 Rafał Miłecki 2024-02-13   787  				 <&infracfg CLK_INFRA_USB_REF>,
09346afaba0a89 Rafał Miłecki 2024-02-13   788  				 <&infracfg CLK_INFRA_66M_USB_HCK>,
09346afaba0a89 Rafał Miłecki 2024-02-13   789  				 <&infracfg CLK_INFRA_133M_USB_HCK>,
09346afaba0a89 Rafał Miłecki 2024-02-13   790  				 <&infracfg CLK_INFRA_USB_XHCI>;
09346afaba0a89 Rafał Miłecki 2024-02-13   791  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
09346afaba0a89 Rafał Miłecki 2024-02-13   792  		};
09346afaba0a89 Rafał Miłecki 2024-02-13   793  
663cecf5bbda13 Daniel Golle  2023-02-22   794  		ssusb1: usb@11200000 {
09346afaba0a89 Rafał Miłecki 2024-02-13   795  			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
09346afaba0a89 Rafał Miłecki 2024-02-13   796  			reg = <0 0x11200000 0 0x2e00>,
09346afaba0a89 Rafał Miłecki 2024-02-13   797  			      <0 0x11203e00 0 0x0100>;
09346afaba0a89 Rafał Miłecki 2024-02-13   798  			reg-names = "mac", "ippc";
09346afaba0a89 Rafał Miłecki 2024-02-13   799  			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
09346afaba0a89 Rafał Miłecki 2024-02-13   800  			clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   801  				 <&infracfg CLK_INFRA_USB_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   802  				 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   803  				 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   804  				 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
09346afaba0a89 Rafał Miłecki 2024-02-13   805  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
09346afaba0a89 Rafał Miłecki 2024-02-13   806  		};
09346afaba0a89 Rafał Miłecki 2024-02-13   807  
663cecf5bbda13 Daniel Golle  2023-02-22   808  		afe: audio-controller@11210000 {
663cecf5bbda13 Daniel Golle  2023-02-22   809  			compatible = "mediatek,mt79xx-audio";
663cecf5bbda13 Daniel Golle  2023-02-22   810  			reg = <0 0x11210000 0 0x9000>;
663cecf5bbda13 Daniel Golle  2023-02-22   811  			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   812  			clocks = <&infracfg CLK_INFRA_66M_AUD_SLV_BCK>,
663cecf5bbda13 Daniel Golle  2023-02-22   813  				 <&infracfg CLK_INFRA_AUD_26M>,
663cecf5bbda13 Daniel Golle  2023-02-22   814  				 <&infracfg CLK_INFRA_AUD_L>,
663cecf5bbda13 Daniel Golle  2023-02-22   815  				 <&infracfg CLK_INFRA_AUD_AUD>,
663cecf5bbda13 Daniel Golle  2023-02-22   816  				 <&infracfg CLK_INFRA_AUD_EG2>,
663cecf5bbda13 Daniel Golle  2023-02-22   817  				 <&topckgen CLK_TOP_AUD_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   818  				 <&topckgen CLK_TOP_AUD_I2S_M>;
663cecf5bbda13 Daniel Golle  2023-02-22   819  			clock-names = "aud_bus_ck",
663cecf5bbda13 Daniel Golle  2023-02-22   820  				      "aud_26m_ck",
663cecf5bbda13 Daniel Golle  2023-02-22   821  				      "aud_l_ck",
663cecf5bbda13 Daniel Golle  2023-02-22   822  				      "aud_aud_ck",
663cecf5bbda13 Daniel Golle  2023-02-22   823  				      "aud_eg2_ck",
663cecf5bbda13 Daniel Golle  2023-02-22   824  				      "aud_sel",
663cecf5bbda13 Daniel Golle  2023-02-22   825  				      "aud_i2s_m";
663cecf5bbda13 Daniel Golle  2023-02-22   826  			assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   827  					  <&topckgen CLK_TOP_A1SYS_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   828  					  <&topckgen CLK_TOP_AUD_L_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   829  					  <&topckgen CLK_TOP_A_TUNER_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22   830  			assigned-clock-parents = <&apmixedsys CLK_APMIXED_APLL2>,
663cecf5bbda13 Daniel Golle  2023-02-22   831  						 <&topckgen CLK_TOP_APLL2_D4>,
663cecf5bbda13 Daniel Golle  2023-02-22   832  						 <&apmixedsys CLK_APMIXED_APLL2>,
663cecf5bbda13 Daniel Golle  2023-02-22   833  						 <&topckgen CLK_TOP_APLL2_D4>;
663cecf5bbda13 Daniel Golle  2023-02-22   834  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   835  		};
663cecf5bbda13 Daniel Golle  2023-02-22   836  
663cecf5bbda13 Daniel Golle  2023-02-22   837  		mmc0: mmc@11230000 {
663cecf5bbda13 Daniel Golle  2023-02-22   838  			compatible = "mediatek,mt7986-mmc",
663cecf5bbda13 Daniel Golle  2023-02-22   839  				     "mediatek,mt7981-mmc";
663cecf5bbda13 Daniel Golle  2023-02-22   840  			reg = <0 0x11230000 0 0x1000>,
663cecf5bbda13 Daniel Golle  2023-02-22   841  			      <0 0x11D60000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22   842  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   843  			clocks = <&infracfg CLK_INFRA_MSDC400>,
663cecf5bbda13 Daniel Golle  2023-02-22   844  				 <&infracfg CLK_INFRA_MSDC2_HCK>,
663cecf5bbda13 Daniel Golle  2023-02-22   845  				 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
663cecf5bbda13 Daniel Golle  2023-02-22   846  				 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
663cecf5bbda13 Daniel Golle  2023-02-22   847  			assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
663cecf5bbda13 Daniel Golle  2023-02-22   848  					  <&topckgen CLK_TOP_EMMC_400M_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22   849  			assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
663cecf5bbda13 Daniel Golle  2023-02-22   850  						 <&apmixedsys CLK_APMIXED_MSDCPLL>;
663cecf5bbda13 Daniel Golle  2023-02-22   851  			clock-names = "source",
663cecf5bbda13 Daniel Golle  2023-02-22   852  				      "hclk",
663cecf5bbda13 Daniel Golle  2023-02-22   853  				      "axi_cg",
663cecf5bbda13 Daniel Golle  2023-02-22   854  				      "ahb_cg";
663cecf5bbda13 Daniel Golle  2023-02-22   855  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   856  			#size-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   857  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   858  		};
663cecf5bbda13 Daniel Golle  2023-02-22   859  
663cecf5bbda13 Daniel Golle  2023-02-22   860  		pcie2: pcie@11280000 {
663cecf5bbda13 Daniel Golle  2023-02-22   861  			compatible = "mediatek,mt7988-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   862  				     "mediatek,mt7986-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   863  				     "mediatek,mt8192-pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   864  			device_type = "pci";
663cecf5bbda13 Daniel Golle  2023-02-22   865  			#address-cells = <3>;
663cecf5bbda13 Daniel Golle  2023-02-22   866  			#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   867  			reg = <0 0x11280000 0 0x2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   868  			reg-names = "pcie-mac";
663cecf5bbda13 Daniel Golle  2023-02-22   869  			linux,pci-domain = <3>;
663cecf5bbda13 Daniel Golle  2023-02-22   870  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   871  			bus-range = <0x00 0xff>;
663cecf5bbda13 Daniel Golle  2023-02-22   872  			ranges = <0x81000000 0x00 0x20000000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   873  				  0x20000000 0x00 0x00200000>,
663cecf5bbda13 Daniel Golle  2023-02-22   874  				 <0x82000000 0x00 0x20200000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   875  				  0x20200000 0x00 0x07e00000>;
663cecf5bbda13 Daniel Golle  2023-02-22   876  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
663cecf5bbda13 Daniel Golle  2023-02-22   877  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
663cecf5bbda13 Daniel Golle  2023-02-22   878  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
663cecf5bbda13 Daniel Golle  2023-02-22   879  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
663cecf5bbda13 Daniel Golle  2023-02-22   880  			clock-names = "pl_250m", "tl_26m", "peri_26m",
663cecf5bbda13 Daniel Golle  2023-02-22   881  				      "top_133m";
663cecf5bbda13 Daniel Golle  2023-02-22   882  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22   883  			pinctrl-0 = <&pcie2_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22   884  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   885  
663cecf5bbda13 Daniel Golle  2023-02-22   886  			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
663cecf5bbda13 Daniel Golle  2023-02-22   887  			phy-names = "pcie-phy";
663cecf5bbda13 Daniel Golle  2023-02-22   888  
663cecf5bbda13 Daniel Golle  2023-02-22   889  			#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   890  			interrupt-map-mask = <0 0 0 0x7>;
663cecf5bbda13 Daniel Golle  2023-02-22   891  			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
663cecf5bbda13 Daniel Golle  2023-02-22   892  					<0 0 0 2 &pcie_intc2 1>,
663cecf5bbda13 Daniel Golle  2023-02-22   893  					<0 0 0 3 &pcie_intc2 2>,
663cecf5bbda13 Daniel Golle  2023-02-22   894  					<0 0 0 4 &pcie_intc2 3>;
663cecf5bbda13 Daniel Golle  2023-02-22   895  			pcie_intc2: interrupt-controller {
663cecf5bbda13 Daniel Golle  2023-02-22   896  				#address-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   897  				#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   898  				interrupt-controller;
663cecf5bbda13 Daniel Golle  2023-02-22   899  			};
663cecf5bbda13 Daniel Golle  2023-02-22   900  		};
663cecf5bbda13 Daniel Golle  2023-02-22   901  
663cecf5bbda13 Daniel Golle  2023-02-22   902  		pcie3: pcie@11290000 {
663cecf5bbda13 Daniel Golle  2023-02-22   903  			compatible = "mediatek,mt7988-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   904  				     "mediatek,mt7986-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   905  				     "mediatek,mt8192-pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   906  			device_type = "pci";
663cecf5bbda13 Daniel Golle  2023-02-22   907  			#address-cells = <3>;
663cecf5bbda13 Daniel Golle  2023-02-22   908  			#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   909  			reg = <0 0x11290000 0 0x2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   910  			reg-names = "pcie-mac";
663cecf5bbda13 Daniel Golle  2023-02-22   911  			linux,pci-domain = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   912  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   913  			bus-range = <0x00 0xff>;
663cecf5bbda13 Daniel Golle  2023-02-22   914  			ranges = <0x81000000 0x00 0x28000000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   915  				  0x28000000 0x00 0x00200000>,
663cecf5bbda13 Daniel Golle  2023-02-22   916  				 <0x82000000 0x00 0x28200000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   917  				  0x28200000 0x00 0x07e00000>;
663cecf5bbda13 Daniel Golle  2023-02-22   918  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
663cecf5bbda13 Daniel Golle  2023-02-22   919  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
663cecf5bbda13 Daniel Golle  2023-02-22   920  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
663cecf5bbda13 Daniel Golle  2023-02-22   921  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
663cecf5bbda13 Daniel Golle  2023-02-22   922  			clock-names = "pl_250m", "tl_26m", "peri_26m",
663cecf5bbda13 Daniel Golle  2023-02-22   923  				      "top_133m";
663cecf5bbda13 Daniel Golle  2023-02-22   924  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22   925  			pinctrl-0 = <&pcie3_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22   926  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   927  
663cecf5bbda13 Daniel Golle  2023-02-22   928  			#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   929  			interrupt-map-mask = <0 0 0 0x7>;
663cecf5bbda13 Daniel Golle  2023-02-22   930  			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
663cecf5bbda13 Daniel Golle  2023-02-22   931  					<0 0 0 2 &pcie_intc3 1>,
663cecf5bbda13 Daniel Golle  2023-02-22   932  					<0 0 0 3 &pcie_intc3 2>,
663cecf5bbda13 Daniel Golle  2023-02-22   933  					<0 0 0 4 &pcie_intc3 3>;
663cecf5bbda13 Daniel Golle  2023-02-22   934  			pcie_intc3: interrupt-controller {
663cecf5bbda13 Daniel Golle  2023-02-22   935  				#address-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   936  				#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   937  				interrupt-controller;
663cecf5bbda13 Daniel Golle  2023-02-22   938  			};
663cecf5bbda13 Daniel Golle  2023-02-22   939  		};
663cecf5bbda13 Daniel Golle  2023-02-22   940  
663cecf5bbda13 Daniel Golle  2023-02-22   941  		pcie0: pcie@11300000 {
663cecf5bbda13 Daniel Golle  2023-02-22   942  			compatible = "mediatek,mt7988-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   943  				     "mediatek,mt7986-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   944  				     "mediatek,mt8192-pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   945  			device_type = "pci";
663cecf5bbda13 Daniel Golle  2023-02-22   946  			#address-cells = <3>;
663cecf5bbda13 Daniel Golle  2023-02-22   947  			#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   948  			reg = <0 0x11300000 0 0x2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   949  			reg-names = "pcie-mac";
663cecf5bbda13 Daniel Golle  2023-02-22   950  			linux,pci-domain = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   951  			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   952  			bus-range = <0x00 0xff>;
663cecf5bbda13 Daniel Golle  2023-02-22   953  			ranges = <0x81000000 0x00 0x30000000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   954  				  0x30000000 0x00 0x00200000>,
663cecf5bbda13 Daniel Golle  2023-02-22   955  				 <0x82000000 0x00 0x30200000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   956  				  0x30200000 0x00 0x07e00000>;
663cecf5bbda13 Daniel Golle  2023-02-22   957  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
663cecf5bbda13 Daniel Golle  2023-02-22   958  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
663cecf5bbda13 Daniel Golle  2023-02-22   959  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
663cecf5bbda13 Daniel Golle  2023-02-22   960  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
663cecf5bbda13 Daniel Golle  2023-02-22   961  			clock-names = "pl_250m", "tl_26m", "peri_26m",
663cecf5bbda13 Daniel Golle  2023-02-22   962  				      "top_133m";
663cecf5bbda13 Daniel Golle  2023-02-22   963  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22   964  			pinctrl-0 = <&pcie0_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22   965  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22   966  
663cecf5bbda13 Daniel Golle  2023-02-22   967  			#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   968  			interrupt-map-mask = <0 0 0 0x7>;
663cecf5bbda13 Daniel Golle  2023-02-22   969  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
663cecf5bbda13 Daniel Golle  2023-02-22   970  					<0 0 0 2 &pcie_intc0 1>,
663cecf5bbda13 Daniel Golle  2023-02-22   971  					<0 0 0 3 &pcie_intc0 2>,
663cecf5bbda13 Daniel Golle  2023-02-22   972  					<0 0 0 4 &pcie_intc0 3>;
663cecf5bbda13 Daniel Golle  2023-02-22   973  			pcie_intc0: interrupt-controller {
663cecf5bbda13 Daniel Golle  2023-02-22   974  				#address-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22   975  				#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   976  				interrupt-controller;
663cecf5bbda13 Daniel Golle  2023-02-22   977  			};
663cecf5bbda13 Daniel Golle  2023-02-22   978  		};
663cecf5bbda13 Daniel Golle  2023-02-22   979  
663cecf5bbda13 Daniel Golle  2023-02-22   980  		pcie1: pcie@11310000 {
663cecf5bbda13 Daniel Golle  2023-02-22   981  			compatible = "mediatek,mt7988-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   982  				     "mediatek,mt7986-pcie",
663cecf5bbda13 Daniel Golle  2023-02-22   983  				     "mediatek,mt8192-pcie";
663cecf5bbda13 Daniel Golle  2023-02-22   984  			device_type = "pci";
663cecf5bbda13 Daniel Golle  2023-02-22   985  			#address-cells = <3>;
663cecf5bbda13 Daniel Golle  2023-02-22   986  			#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22   987  			reg = <0 0x11310000 0 0x2000>;
663cecf5bbda13 Daniel Golle  2023-02-22   988  			reg-names = "pcie-mac";
663cecf5bbda13 Daniel Golle  2023-02-22   989  			linux,pci-domain = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22   990  			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
663cecf5bbda13 Daniel Golle  2023-02-22   991  			bus-range = <0x00 0xff>;
663cecf5bbda13 Daniel Golle  2023-02-22   992  			ranges = <0x81000000 0x00 0x38000000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   993  				  0x38000000 0x00 0x00200000>,
663cecf5bbda13 Daniel Golle  2023-02-22   994  				 <0x82000000 0x00 0x38200000 0x00
663cecf5bbda13 Daniel Golle  2023-02-22   995  				  0x38200000 0x00 0x07e00000>;
663cecf5bbda13 Daniel Golle  2023-02-22   996  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
663cecf5bbda13 Daniel Golle  2023-02-22   997  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
663cecf5bbda13 Daniel Golle  2023-02-22   998  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
663cecf5bbda13 Daniel Golle  2023-02-22   999  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1000  			clock-names = "pl_250m", "tl_26m", "peri_26m",
663cecf5bbda13 Daniel Golle  2023-02-22  1001  				      "top_133m";
663cecf5bbda13 Daniel Golle  2023-02-22  1002  			pinctrl-names = "default";
663cecf5bbda13 Daniel Golle  2023-02-22  1003  			pinctrl-0 = <&pcie1_pins>;
663cecf5bbda13 Daniel Golle  2023-02-22  1004  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22  1005  
663cecf5bbda13 Daniel Golle  2023-02-22  1006  			#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1007  			interrupt-map-mask = <0 0 0 0x7>;
663cecf5bbda13 Daniel Golle  2023-02-22  1008  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
663cecf5bbda13 Daniel Golle  2023-02-22  1009  					<0 0 0 2 &pcie_intc1 1>,
663cecf5bbda13 Daniel Golle  2023-02-22  1010  					<0 0 0 3 &pcie_intc1 2>,
663cecf5bbda13 Daniel Golle  2023-02-22  1011  					<0 0 0 4 &pcie_intc1 3>;
663cecf5bbda13 Daniel Golle  2023-02-22  1012  			pcie_intc1: interrupt-controller {
663cecf5bbda13 Daniel Golle  2023-02-22  1013  				#address-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22  1014  				#interrupt-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1015  				interrupt-controller;
663cecf5bbda13 Daniel Golle  2023-02-22  1016  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1017  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1018  
663cecf5bbda13 Daniel Golle  2023-02-22  1019  		tphy: tphy@11c50000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1020  			compatible = "mediatek,mt7988",
663cecf5bbda13 Daniel Golle  2023-02-22  1021  				     "mediatek,generic-tphy-v2";
663cecf5bbda13 Daniel Golle  2023-02-22  1022  			#address-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22  1023  			#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22  1024  			ranges;
663cecf5bbda13 Daniel Golle  2023-02-22  1025  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22  1026  			tphyu2port0: usb-phy@11c50000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1027  				reg = <0 0x11c50000 0 0x700>;
663cecf5bbda13 Daniel Golle  2023-02-22  1028  				clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1029  				clock-names = "ref";
663cecf5bbda13 Daniel Golle  2023-02-22  1030  				#phy-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1031  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1032  			tphyu3port0: usb-phy@11c50700 {
663cecf5bbda13 Daniel Golle  2023-02-22  1033  				reg = <0 0x11c50700 0 0x900>;
663cecf5bbda13 Daniel Golle  2023-02-22  1034  				clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1035  				clock-names = "ref";
663cecf5bbda13 Daniel Golle  2023-02-22  1036  				#phy-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1037  				mediatek,usb3-pll-ssc-delta;
663cecf5bbda13 Daniel Golle  2023-02-22  1038  				mediatek,usb3-pll-ssc-delta1;
663cecf5bbda13 Daniel Golle  2023-02-22  1039  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1040  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1041  
663cecf5bbda13 Daniel Golle  2023-02-22  1042  		topmisc: topmisc@11d10000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1043  			compatible = "mediatek,mt7988-topmisc", "syscon",
663cecf5bbda13 Daniel Golle  2023-02-22  1044  				     "mediatek,mt7988-power-controller";
663cecf5bbda13 Daniel Golle  2023-02-22  1045  			reg = <0 0x11d10000 0 0x10000>;
663cecf5bbda13 Daniel Golle  2023-02-22  1046  			#clock-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1047  			#power-domain-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1048  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1049  			#size-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22  1050  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1051  
663cecf5bbda13 Daniel Golle  2023-02-22  1052  		xphy: xphy@11e10000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1053  			compatible = "mediatek,mt7988",
663cecf5bbda13 Daniel Golle  2023-02-22  1054  				     "mediatek,xsphy";
663cecf5bbda13 Daniel Golle  2023-02-22  1055  			#address-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22  1056  			#size-cells = <2>;
663cecf5bbda13 Daniel Golle  2023-02-22  1057  			ranges;
663cecf5bbda13 Daniel Golle  2023-02-22  1058  			status = "disabled";
663cecf5bbda13 Daniel Golle  2023-02-22  1059  
663cecf5bbda13 Daniel Golle  2023-02-22  1060  			xphyu2port0: usb-phy@11e10000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1061  				reg = <0 0x11e10000 0 0x400>;
663cecf5bbda13 Daniel Golle  2023-02-22  1062  				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
663cecf5bbda13 Daniel Golle  2023-02-22  1063  				clock-names = "ref";
663cecf5bbda13 Daniel Golle  2023-02-22  1064  				#phy-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1065  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1066  
663cecf5bbda13 Daniel Golle  2023-02-22  1067  			xphyu3port0: usb-phy@11e13000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1068  				reg = <0 0x11e13400 0 0x500>;
663cecf5bbda13 Daniel Golle  2023-02-22  1069  				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
663cecf5bbda13 Daniel Golle  2023-02-22  1070  				clock-names = "ref";
663cecf5bbda13 Daniel Golle  2023-02-22  1071  				#phy-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1072  				mediatek,syscon-type = <&topmisc 0x218 0>;
663cecf5bbda13 Daniel Golle  2023-02-22  1073  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1074  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1075  
663cecf5bbda13 Daniel Golle  2023-02-22  1076  		xfi_tphy0: phy@11f20000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1077  			compatible = "mediatek,mt7988-xfi-tphy";
663cecf5bbda13 Daniel Golle  2023-02-22  1078  			reg = <0 0x11f20000 0 0x10000>;
663cecf5bbda13 Daniel Golle  2023-02-22  1079  			resets = <&watchdog 14>;
663cecf5bbda13 Daniel Golle  2023-02-22  1080  			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22  1081  			clock-names = "xfipll", "topxtal";
663cecf5bbda13 Daniel Golle  2023-02-22  1082  			mediatek,usxgmii-performance-errata;
663cecf5bbda13 Daniel Golle  2023-02-22  1083  			#phy-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22  1084  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1085  
663cecf5bbda13 Daniel Golle  2023-02-22  1086  		xfi_tphy1: phy@11f30000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1087  			compatible = "mediatek,mt7988-xfi-tphy";
663cecf5bbda13 Daniel Golle  2023-02-22  1088  			reg = <0 0x11f30000 0 0x10000>;
663cecf5bbda13 Daniel Golle  2023-02-22  1089  			resets = <&watchdog 15>;
663cecf5bbda13 Daniel Golle  2023-02-22  1090  			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
663cecf5bbda13 Daniel Golle  2023-02-22  1091  			clock-names = "xfipll", "topxtal";
663cecf5bbda13 Daniel Golle  2023-02-22  1092  			#phy-cells = <0>;
663cecf5bbda13 Daniel Golle  2023-02-22  1093  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1094  
663cecf5bbda13 Daniel Golle  2023-02-22  1095  		xfi_pll: clock-controller@11f40000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08  1096  			compatible = "mediatek,mt7988-xfi-pll";
b616b403cbffc6 Rafał Miłecki 2024-01-08  1097  			reg = <0 0x11f40000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1098  			resets = <&watchdog 16>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1099  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1100  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08  1101  
663cecf5bbda13 Daniel Golle  2023-02-22  1102  		efuse: efuse@11f50000 {
663cecf5bbda13 Daniel Golle  2023-02-22  1103  			compatible = "mediatek,efuse";
663cecf5bbda13 Daniel Golle  2023-02-22  1104  			reg = <0 0x11f50000 0 0x1000>;
663cecf5bbda13 Daniel Golle  2023-02-22  1105  			#address-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1106  			#size-cells = <1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1107  
663cecf5bbda13 Daniel Golle  2023-02-22  1108  			cpufreq_calibration: calib@278 {
663cecf5bbda13 Daniel Golle  2023-02-22  1109  				reg = <0x278 0x1>;
663cecf5bbda13 Daniel Golle  2023-02-22  1110  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1111  			lvts_calibration: calib@918 {
663cecf5bbda13 Daniel Golle  2023-02-22  1112  				reg = <0x918 0x28>;
663cecf5bbda13 Daniel Golle  2023-02-22  1113  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1114  			phy_calibration_p0: calib@940 {
663cecf5bbda13 Daniel Golle  2023-02-22  1115  				reg = <0x940 0x10>;
663cecf5bbda13 Daniel Golle  2023-02-22  1116  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1117  			phy_calibration_p1: calib@954 {
663cecf5bbda13 Daniel Golle  2023-02-22  1118  				reg = <0x954 0x10>;
663cecf5bbda13 Daniel Golle  2023-02-22  1119  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1120  			phy_calibration_p2: calib@968 {
663cecf5bbda13 Daniel Golle  2023-02-22  1121  				reg = <0x968 0x10>;
663cecf5bbda13 Daniel Golle  2023-02-22  1122  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1123  			phy_calibration_p3: calib@97c {
663cecf5bbda13 Daniel Golle  2023-02-22  1124  				reg = <0x97c 0x10>;
663cecf5bbda13 Daniel Golle  2023-02-22  1125  			};
663cecf5bbda13 Daniel Golle  2023-02-22  1126  		};
663cecf5bbda13 Daniel Golle  2023-02-22  1127  
663cecf5bbda13 Daniel Golle  2023-02-22  1128  		ethsys: clock-controller@15000000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08  1129  			compatible = "mediatek,mt7988-ethsys", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08  1130  			reg = <0 0x15000000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1131  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1132  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1133  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08  1134  
663cecf5bbda13 Daniel Golle  2023-02-22 @1135  		switch: switch@15020000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
