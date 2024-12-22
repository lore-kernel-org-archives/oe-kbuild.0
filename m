Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45921547F5
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853786; cv=none; b=fhePGSe2O4A+QXlmRRFqTae3PUfNYd06LrLWY6N0nLjraZwmw3WLriAIMZp/RSbFUS29AJprJNwsojiwyZMpj/lO6HzfVOp+bSKqEKDyUUqIXCcasC7QYEER8XZEJzE1MeL+bgWJ7m5hZMhmoq1gkkni8/g3+hTG3mUWqyk617w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853786; c=relaxed/simple;
	bh=UCCvYd0AaxKREyWez4NH9QAuXMdN23kx5e8S5HJ5JDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tkg1xutVPOfx1+q79pXWCwA4eREVa6dnv2MuRYv+HxVaacUvJt88xQEz80G13lAFHtMDL9GOWhZocsGLgJxMw0SLD+hLvc+bXzJizHFOFk4/AmsIQzw/2FZZsujl+cQz8/tuE5AwMBQke7ST6SjFwTeDe6vjI2uzNTEOroJN4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uj0l1JIt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uj0l1JIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734853782; x=1766389782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UCCvYd0AaxKREyWez4NH9QAuXMdN23kx5e8S5HJ5JDk=;
  b=Uj0l1JItEtM2/wwdrOepOuxzF1UHwiEa9QiagooKCDLj1rb3ShFCK3Pn
   acs55zmaO1//LnJmP8FNQItN5hHNsFnvIIkin15Q5lBHNXD79IbN9QzfC
   s3RiJU3w2+um89wI0u7UJjxGLDGAFvMEJS82kdkM6LV1KpCGNhPLaG/BU
   cCup5XzLlYh2IOUZ39+dD6y/XSpIz5JX9Hs7SMnoPNk8APoF5r0W9zm0g
   2AK0nvWAM/K7ZD5+NsbTC1RQ66qPouHQ+6MTS9NV8JHYFcHy0Ap2WdDtl
   YOscOrbf1GoQ+KUV8HQPa8Zz/J19BxfS2P1HvpeOeOwRUsKcFcRkN0p+/
   Q==;
X-CSE-ConnectionGUID: iDu2thQaT0KCjo/0/V2A1g==
X-CSE-MsgGUID: zhXtAjWpT1KEm06KKv2o9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46767031"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46767031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:49:39 -0800
X-CSE-ConnectionGUID: YKKnZdS0SNi5ydYJbZZ00Q==
X-CSE-MsgGUID: 9DQFtU0jTLaRDsjlnWp75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98687002"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 23:49:37 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGiV-0002nR-1l;
	Sun, 22 Dec 2024 07:49:35 +0000
Date: Sun, 22 Dec 2024 15:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/px30.dtsi:1210.9-1219.5: Warning
 (graph_child_address): /isp@ff4a0000/ports: graph node has single child node
 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202412221557.oFdVZb41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 474a77395be201c80925efb7a0425fb28b0ba60b arm64: dts: rockchip: hook up camera on px30-evb
date:   3 years, 3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 years, 3 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241222/202412221557.oFdVZb41-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221557.oFdVZb41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221557.oFdVZb41-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/px30.dtsi:331.26-351.4: Warning (avoid_unnecessary_addr_size): /syscon@ff010000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:411.23-451.4: Warning (avoid_unnecessary_addr_size): /syscon@ff140000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:430.10-449.6: Warning (graph_child_address): /syscon@ff140000/lvds/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30.dtsi:1210.9-1219.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30.dtsi:1214.11-1218.6: Warning (graph_child_address): /isp@ff4a0000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1210 arch/arm64/boot/dts/rockchip/px30.dtsi

7053e06b1422a6 Liang Chen        2018-08-01    14  
7053e06b1422a6 Liang Chen        2018-08-01    15  / {
7053e06b1422a6 Liang Chen        2018-08-01    16  	compatible = "rockchip,px30";
7053e06b1422a6 Liang Chen        2018-08-01    17  
7053e06b1422a6 Liang Chen        2018-08-01    18  	interrupt-parent = <&gic>;
7053e06b1422a6 Liang Chen        2018-08-01    19  	#address-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    20  	#size-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    21  
7053e06b1422a6 Liang Chen        2018-08-01    22  	aliases {
7053e06b1422a6 Liang Chen        2018-08-01    23  		ethernet0 = &gmac;
7053e06b1422a6 Liang Chen        2018-08-01    24  		i2c0 = &i2c0;
7053e06b1422a6 Liang Chen        2018-08-01    25  		i2c1 = &i2c1;
7053e06b1422a6 Liang Chen        2018-08-01    26  		i2c2 = &i2c2;
7053e06b1422a6 Liang Chen        2018-08-01    27  		i2c3 = &i2c3;
7053e06b1422a6 Liang Chen        2018-08-01    28  		serial0 = &uart0;
7053e06b1422a6 Liang Chen        2018-08-01    29  		serial1 = &uart1;
7053e06b1422a6 Liang Chen        2018-08-01    30  		serial2 = &uart2;
7053e06b1422a6 Liang Chen        2018-08-01    31  		serial3 = &uart3;
7053e06b1422a6 Liang Chen        2018-08-01    32  		serial4 = &uart4;
7053e06b1422a6 Liang Chen        2018-08-01    33  		serial5 = &uart5;
7053e06b1422a6 Liang Chen        2018-08-01    34  		spi0 = &spi0;
7053e06b1422a6 Liang Chen        2018-08-01    35  		spi1 = &spi1;
7053e06b1422a6 Liang Chen        2018-08-01    36  	};
7053e06b1422a6 Liang Chen        2018-08-01    37  
7053e06b1422a6 Liang Chen        2018-08-01    38  	cpus {
7053e06b1422a6 Liang Chen        2018-08-01    39  		#address-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    40  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01    41  
7053e06b1422a6 Liang Chen        2018-08-01    42  		cpu0: cpu@0 {
7053e06b1422a6 Liang Chen        2018-08-01    43  			device_type = "cpu";
31af04cd60d316 Rob Herring       2019-01-14    44  			compatible = "arm,cortex-a35";
7053e06b1422a6 Liang Chen        2018-08-01    45  			reg = <0x0 0x0>;
7053e06b1422a6 Liang Chen        2018-08-01    46  			enable-method = "psci";
7053e06b1422a6 Liang Chen        2018-08-01    47  			clocks = <&cru ARMCLK>;
7053e06b1422a6 Liang Chen        2018-08-01    48  			#cooling-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    49  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
7053e06b1422a6 Liang Chen        2018-08-01    50  			dynamic-power-coefficient = <90>;
7053e06b1422a6 Liang Chen        2018-08-01    51  			operating-points-v2 = <&cpu0_opp_table>;
7053e06b1422a6 Liang Chen        2018-08-01    52  		};
7053e06b1422a6 Liang Chen        2018-08-01    53  
7053e06b1422a6 Liang Chen        2018-08-01    54  		cpu1: cpu@1 {
7053e06b1422a6 Liang Chen        2018-08-01    55  			device_type = "cpu";
31af04cd60d316 Rob Herring       2019-01-14    56  			compatible = "arm,cortex-a35";
7053e06b1422a6 Liang Chen        2018-08-01    57  			reg = <0x0 0x1>;
7053e06b1422a6 Liang Chen        2018-08-01    58  			enable-method = "psci";
7053e06b1422a6 Liang Chen        2018-08-01    59  			clocks = <&cru ARMCLK>;
7053e06b1422a6 Liang Chen        2018-08-01    60  			#cooling-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    61  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
7053e06b1422a6 Liang Chen        2018-08-01    62  			dynamic-power-coefficient = <90>;
7053e06b1422a6 Liang Chen        2018-08-01    63  			operating-points-v2 = <&cpu0_opp_table>;
7053e06b1422a6 Liang Chen        2018-08-01    64  		};
7053e06b1422a6 Liang Chen        2018-08-01    65  
7053e06b1422a6 Liang Chen        2018-08-01    66  		cpu2: cpu@2 {
7053e06b1422a6 Liang Chen        2018-08-01    67  			device_type = "cpu";
31af04cd60d316 Rob Herring       2019-01-14    68  			compatible = "arm,cortex-a35";
7053e06b1422a6 Liang Chen        2018-08-01    69  			reg = <0x0 0x2>;
7053e06b1422a6 Liang Chen        2018-08-01    70  			enable-method = "psci";
7053e06b1422a6 Liang Chen        2018-08-01    71  			clocks = <&cru ARMCLK>;
7053e06b1422a6 Liang Chen        2018-08-01    72  			#cooling-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    73  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
7053e06b1422a6 Liang Chen        2018-08-01    74  			dynamic-power-coefficient = <90>;
7053e06b1422a6 Liang Chen        2018-08-01    75  			operating-points-v2 = <&cpu0_opp_table>;
7053e06b1422a6 Liang Chen        2018-08-01    76  		};
7053e06b1422a6 Liang Chen        2018-08-01    77  
7053e06b1422a6 Liang Chen        2018-08-01    78  		cpu3: cpu@3 {
7053e06b1422a6 Liang Chen        2018-08-01    79  			device_type = "cpu";
31af04cd60d316 Rob Herring       2019-01-14    80  			compatible = "arm,cortex-a35";
7053e06b1422a6 Liang Chen        2018-08-01    81  			reg = <0x0 0x3>;
7053e06b1422a6 Liang Chen        2018-08-01    82  			enable-method = "psci";
7053e06b1422a6 Liang Chen        2018-08-01    83  			clocks = <&cru ARMCLK>;
7053e06b1422a6 Liang Chen        2018-08-01    84  			#cooling-cells = <2>;
7053e06b1422a6 Liang Chen        2018-08-01    85  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
7053e06b1422a6 Liang Chen        2018-08-01    86  			dynamic-power-coefficient = <90>;
7053e06b1422a6 Liang Chen        2018-08-01    87  			operating-points-v2 = <&cpu0_opp_table>;
7053e06b1422a6 Liang Chen        2018-08-01    88  		};
7053e06b1422a6 Liang Chen        2018-08-01    89  
7053e06b1422a6 Liang Chen        2018-08-01    90  		idle-states {
7053e06b1422a6 Liang Chen        2018-08-01    91  			entry-method = "psci";
7053e06b1422a6 Liang Chen        2018-08-01    92  
7053e06b1422a6 Liang Chen        2018-08-01    93  			CPU_SLEEP: cpu-sleep {
7053e06b1422a6 Liang Chen        2018-08-01    94  				compatible = "arm,idle-state";
7053e06b1422a6 Liang Chen        2018-08-01    95  				local-timer-stop;
7053e06b1422a6 Liang Chen        2018-08-01    96  				arm,psci-suspend-param = <0x0010000>;
7053e06b1422a6 Liang Chen        2018-08-01    97  				entry-latency-us = <120>;
7053e06b1422a6 Liang Chen        2018-08-01    98  				exit-latency-us = <250>;
7053e06b1422a6 Liang Chen        2018-08-01    99  				min-residency-us = <900>;
7053e06b1422a6 Liang Chen        2018-08-01   100  			};
7053e06b1422a6 Liang Chen        2018-08-01   101  
7053e06b1422a6 Liang Chen        2018-08-01   102  			CLUSTER_SLEEP: cluster-sleep {
7053e06b1422a6 Liang Chen        2018-08-01   103  				compatible = "arm,idle-state";
7053e06b1422a6 Liang Chen        2018-08-01   104  				local-timer-stop;
7053e06b1422a6 Liang Chen        2018-08-01   105  				arm,psci-suspend-param = <0x1010000>;
7053e06b1422a6 Liang Chen        2018-08-01   106  				entry-latency-us = <400>;
7053e06b1422a6 Liang Chen        2018-08-01   107  				exit-latency-us = <500>;
7053e06b1422a6 Liang Chen        2018-08-01   108  				min-residency-us = <2000>;
7053e06b1422a6 Liang Chen        2018-08-01   109  			};
7053e06b1422a6 Liang Chen        2018-08-01   110  		};
7053e06b1422a6 Liang Chen        2018-08-01   111  	};
7053e06b1422a6 Liang Chen        2018-08-01   112  
7053e06b1422a6 Liang Chen        2018-08-01   113  	cpu0_opp_table: cpu0-opp-table {
7053e06b1422a6 Liang Chen        2018-08-01   114  		compatible = "operating-points-v2";
7053e06b1422a6 Liang Chen        2018-08-01   115  		opp-shared;
7053e06b1422a6 Liang Chen        2018-08-01   116  
7053e06b1422a6 Liang Chen        2018-08-01   117  		opp-600000000 {
7053e06b1422a6 Liang Chen        2018-08-01   118  			opp-hz = /bits/ 64 <600000000>;
7053e06b1422a6 Liang Chen        2018-08-01   119  			opp-microvolt = <950000 950000 1350000>;
7053e06b1422a6 Liang Chen        2018-08-01   120  			clock-latency-ns = <40000>;
8554723e664d8a Heiko Stuebner    2019-11-16   121  			opp-suspend;
7053e06b1422a6 Liang Chen        2018-08-01   122  		};
7053e06b1422a6 Liang Chen        2018-08-01   123  		opp-816000000 {
7053e06b1422a6 Liang Chen        2018-08-01   124  			opp-hz = /bits/ 64 <816000000>;
7053e06b1422a6 Liang Chen        2018-08-01   125  			opp-microvolt = <1050000 1050000 1350000>;
7053e06b1422a6 Liang Chen        2018-08-01   126  			clock-latency-ns = <40000>;
7053e06b1422a6 Liang Chen        2018-08-01   127  		};
7053e06b1422a6 Liang Chen        2018-08-01   128  		opp-1008000000 {
7053e06b1422a6 Liang Chen        2018-08-01   129  			opp-hz = /bits/ 64 <1008000000>;
7053e06b1422a6 Liang Chen        2018-08-01   130  			opp-microvolt = <1175000 1175000 1350000>;
7053e06b1422a6 Liang Chen        2018-08-01   131  			clock-latency-ns = <40000>;
7053e06b1422a6 Liang Chen        2018-08-01   132  		};
7053e06b1422a6 Liang Chen        2018-08-01   133  		opp-1200000000 {
7053e06b1422a6 Liang Chen        2018-08-01   134  			opp-hz = /bits/ 64 <1200000000>;
7053e06b1422a6 Liang Chen        2018-08-01   135  			opp-microvolt = <1300000 1300000 1350000>;
7053e06b1422a6 Liang Chen        2018-08-01   136  			clock-latency-ns = <40000>;
7053e06b1422a6 Liang Chen        2018-08-01   137  		};
7053e06b1422a6 Liang Chen        2018-08-01   138  		opp-1296000000 {
7053e06b1422a6 Liang Chen        2018-08-01   139  			opp-hz = /bits/ 64 <1296000000>;
7053e06b1422a6 Liang Chen        2018-08-01   140  			opp-microvolt = <1350000 1350000 1350000>;
7053e06b1422a6 Liang Chen        2018-08-01   141  			clock-latency-ns = <40000>;
7053e06b1422a6 Liang Chen        2018-08-01   142  		};
7053e06b1422a6 Liang Chen        2018-08-01   143  	};
7053e06b1422a6 Liang Chen        2018-08-01   144  
7053e06b1422a6 Liang Chen        2018-08-01   145  	arm-pmu {
5944eb7a1ec7eb Robin Murphy      2020-04-17   146  		compatible = "arm,cortex-a35-pmu";
7053e06b1422a6 Liang Chen        2018-08-01   147  		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
7053e06b1422a6 Liang Chen        2018-08-01   148  			     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
7053e06b1422a6 Liang Chen        2018-08-01   149  			     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
7053e06b1422a6 Liang Chen        2018-08-01   150  			     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   151  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
7053e06b1422a6 Liang Chen        2018-08-01   152  	};
7053e06b1422a6 Liang Chen        2018-08-01   153  
7053e06b1422a6 Liang Chen        2018-08-01   154  	display_subsystem: display-subsystem {
7053e06b1422a6 Liang Chen        2018-08-01   155  		compatible = "rockchip,display-subsystem";
967c1464913294 Sandy Huang       2018-08-29   156  		ports = <&vopb_out>, <&vopl_out>;
7053e06b1422a6 Liang Chen        2018-08-01   157  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   158  	};
7053e06b1422a6 Liang Chen        2018-08-01   159  
7053e06b1422a6 Liang Chen        2018-08-01   160  	gmac_clkin: external-gmac-clock {
7053e06b1422a6 Liang Chen        2018-08-01   161  		compatible = "fixed-clock";
7053e06b1422a6 Liang Chen        2018-08-01   162  		clock-frequency = <50000000>;
7053e06b1422a6 Liang Chen        2018-08-01   163  		clock-output-names = "gmac_clkin";
7053e06b1422a6 Liang Chen        2018-08-01   164  		#clock-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   165  	};
7053e06b1422a6 Liang Chen        2018-08-01   166  
7053e06b1422a6 Liang Chen        2018-08-01   167  	psci {
7053e06b1422a6 Liang Chen        2018-08-01   168  		compatible = "arm,psci-1.0";
7053e06b1422a6 Liang Chen        2018-08-01   169  		method = "smc";
7053e06b1422a6 Liang Chen        2018-08-01   170  	};
7053e06b1422a6 Liang Chen        2018-08-01   171  
7053e06b1422a6 Liang Chen        2018-08-01   172  	timer {
7053e06b1422a6 Liang Chen        2018-08-01   173  		compatible = "arm,armv8-timer";
7053e06b1422a6 Liang Chen        2018-08-01   174  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
7053e06b1422a6 Liang Chen        2018-08-01   175  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
7053e06b1422a6 Liang Chen        2018-08-01   176  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
7053e06b1422a6 Liang Chen        2018-08-01   177  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
7053e06b1422a6 Liang Chen        2018-08-01   178  	};
7053e06b1422a6 Liang Chen        2018-08-01   179  
023115cdea26b9 Heiko Stuebner    2019-11-16   180  	thermal_zones: thermal-zones {
023115cdea26b9 Heiko Stuebner    2019-11-16   181  		soc_thermal: soc-thermal {
023115cdea26b9 Heiko Stuebner    2019-11-16   182  			polling-delay-passive = <20>;
023115cdea26b9 Heiko Stuebner    2019-11-16   183  			polling-delay = <1000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   184  			sustainable-power = <750>;
023115cdea26b9 Heiko Stuebner    2019-11-16   185  			thermal-sensors = <&tsadc 0>;
023115cdea26b9 Heiko Stuebner    2019-11-16   186  
023115cdea26b9 Heiko Stuebner    2019-11-16   187  			trips {
023115cdea26b9 Heiko Stuebner    2019-11-16   188  				threshold: trip-point-0 {
023115cdea26b9 Heiko Stuebner    2019-11-16   189  					temperature = <70000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   190  					hysteresis = <2000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   191  					type = "passive";
023115cdea26b9 Heiko Stuebner    2019-11-16   192  				};
023115cdea26b9 Heiko Stuebner    2019-11-16   193  
023115cdea26b9 Heiko Stuebner    2019-11-16   194  				target: trip-point-1 {
023115cdea26b9 Heiko Stuebner    2019-11-16   195  					temperature = <85000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   196  					hysteresis = <2000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   197  					type = "passive";
023115cdea26b9 Heiko Stuebner    2019-11-16   198  				};
023115cdea26b9 Heiko Stuebner    2019-11-16   199  
023115cdea26b9 Heiko Stuebner    2019-11-16   200  				soc_crit: soc-crit {
023115cdea26b9 Heiko Stuebner    2019-11-16   201  					temperature = <115000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   202  					hysteresis = <2000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   203  					type = "critical";
023115cdea26b9 Heiko Stuebner    2019-11-16   204  				};
023115cdea26b9 Heiko Stuebner    2019-11-16   205  			};
023115cdea26b9 Heiko Stuebner    2019-11-16   206  
023115cdea26b9 Heiko Stuebner    2019-11-16   207  			cooling-maps {
023115cdea26b9 Heiko Stuebner    2019-11-16   208  				map0 {
023115cdea26b9 Heiko Stuebner    2019-11-16   209  					trip = <&target>;
023115cdea26b9 Heiko Stuebner    2019-11-16   210  					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
023115cdea26b9 Heiko Stuebner    2019-11-16   211  					contribution = <4096>;
023115cdea26b9 Heiko Stuebner    2019-11-16   212  				};
a07f34a083f211 Heiko Stuebner    2019-12-08   213  
a07f34a083f211 Heiko Stuebner    2019-12-08   214  				map1 {
a07f34a083f211 Heiko Stuebner    2019-12-08   215  					trip = <&target>;
a07f34a083f211 Heiko Stuebner    2019-12-08   216  					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
a07f34a083f211 Heiko Stuebner    2019-12-08   217  					contribution = <4096>;
a07f34a083f211 Heiko Stuebner    2019-12-08   218  				};
023115cdea26b9 Heiko Stuebner    2019-11-16   219  			};
023115cdea26b9 Heiko Stuebner    2019-11-16   220  		};
023115cdea26b9 Heiko Stuebner    2019-11-16   221  
023115cdea26b9 Heiko Stuebner    2019-11-16   222  		gpu_thermal: gpu-thermal {
023115cdea26b9 Heiko Stuebner    2019-11-16   223  			polling-delay-passive = <100>; /* milliseconds */
023115cdea26b9 Heiko Stuebner    2019-11-16   224  			polling-delay = <1000>; /* milliseconds */
023115cdea26b9 Heiko Stuebner    2019-11-16   225  			thermal-sensors = <&tsadc 1>;
023115cdea26b9 Heiko Stuebner    2019-11-16   226  		};
023115cdea26b9 Heiko Stuebner    2019-11-16   227  	};
023115cdea26b9 Heiko Stuebner    2019-11-16   228  
7053e06b1422a6 Liang Chen        2018-08-01   229  	xin24m: xin24m {
7053e06b1422a6 Liang Chen        2018-08-01   230  		compatible = "fixed-clock";
7053e06b1422a6 Liang Chen        2018-08-01   231  		#clock-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   232  		clock-frequency = <24000000>;
7053e06b1422a6 Liang Chen        2018-08-01   233  		clock-output-names = "xin24m";
7053e06b1422a6 Liang Chen        2018-08-01   234  	};
7053e06b1422a6 Liang Chen        2018-08-01   235  
7053e06b1422a6 Liang Chen        2018-08-01   236  	pmu: power-management@ff000000 {
7053e06b1422a6 Liang Chen        2018-08-01   237  		compatible = "rockchip,px30-pmu", "syscon", "simple-mfd";
7053e06b1422a6 Liang Chen        2018-08-01   238  		reg = <0x0 0xff000000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   239  
7053e06b1422a6 Liang Chen        2018-08-01   240  		power: power-controller {
7053e06b1422a6 Liang Chen        2018-08-01   241  			compatible = "rockchip,px30-power-controller";
7053e06b1422a6 Liang Chen        2018-08-01   242  			#power-domain-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   243  			#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   244  			#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   245  
7053e06b1422a6 Liang Chen        2018-08-01   246  			/* These power domains are grouped by VD_LOGIC */
d5de0d688ac6e0 Elaine Zhang      2021-04-17   247  			power-domain@PX30_PD_USB {
7053e06b1422a6 Liang Chen        2018-08-01   248  				reg = <PX30_PD_USB>;
7053e06b1422a6 Liang Chen        2018-08-01   249  				clocks = <&cru HCLK_HOST>,
7053e06b1422a6 Liang Chen        2018-08-01   250  					 <&cru HCLK_OTG>,
7053e06b1422a6 Liang Chen        2018-08-01   251  					 <&cru SCLK_OTG_ADP>;
7053e06b1422a6 Liang Chen        2018-08-01   252  				pm_qos = <&qos_usb_host>, <&qos_usb_otg>;
837188d4982323 Johan Jonker      2021-04-17   253  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   254  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   255  			power-domain@PX30_PD_SDCARD {
7053e06b1422a6 Liang Chen        2018-08-01   256  				reg = <PX30_PD_SDCARD>;
7053e06b1422a6 Liang Chen        2018-08-01   257  				clocks = <&cru HCLK_SDMMC>,
7053e06b1422a6 Liang Chen        2018-08-01   258  					 <&cru SCLK_SDMMC>;
7053e06b1422a6 Liang Chen        2018-08-01   259  				pm_qos = <&qos_sdmmc>;
837188d4982323 Johan Jonker      2021-04-17   260  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   261  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   262  			power-domain@PX30_PD_GMAC {
7053e06b1422a6 Liang Chen        2018-08-01   263  				reg = <PX30_PD_GMAC>;
7053e06b1422a6 Liang Chen        2018-08-01   264  				clocks = <&cru ACLK_GMAC>,
7053e06b1422a6 Liang Chen        2018-08-01   265  					 <&cru PCLK_GMAC>,
7053e06b1422a6 Liang Chen        2018-08-01   266  					 <&cru SCLK_MAC_REF>,
7053e06b1422a6 Liang Chen        2018-08-01   267  					 <&cru SCLK_GMAC_RX_TX>;
7053e06b1422a6 Liang Chen        2018-08-01   268  				pm_qos = <&qos_gmac>;
837188d4982323 Johan Jonker      2021-04-17   269  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   270  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   271  			power-domain@PX30_PD_MMC_NAND {
7053e06b1422a6 Liang Chen        2018-08-01   272  				reg = <PX30_PD_MMC_NAND>;
7053e06b1422a6 Liang Chen        2018-08-01   273  				clocks =  <&cru HCLK_NANDC>,
7053e06b1422a6 Liang Chen        2018-08-01   274  					  <&cru HCLK_EMMC>,
7053e06b1422a6 Liang Chen        2018-08-01   275  					  <&cru HCLK_SDIO>,
7053e06b1422a6 Liang Chen        2018-08-01   276  					  <&cru HCLK_SFC>,
7053e06b1422a6 Liang Chen        2018-08-01   277  					  <&cru SCLK_EMMC>,
7053e06b1422a6 Liang Chen        2018-08-01   278  					  <&cru SCLK_NANDC>,
7053e06b1422a6 Liang Chen        2018-08-01   279  					  <&cru SCLK_SDIO>,
7053e06b1422a6 Liang Chen        2018-08-01   280  					  <&cru SCLK_SFC>;
7053e06b1422a6 Liang Chen        2018-08-01   281  				pm_qos = <&qos_emmc>, <&qos_nand>,
7053e06b1422a6 Liang Chen        2018-08-01   282  					 <&qos_sdio>, <&qos_sfc>;
837188d4982323 Johan Jonker      2021-04-17   283  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   284  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   285  			power-domain@PX30_PD_VPU {
7053e06b1422a6 Liang Chen        2018-08-01   286  				reg = <PX30_PD_VPU>;
7053e06b1422a6 Liang Chen        2018-08-01   287  				clocks = <&cru ACLK_VPU>,
7053e06b1422a6 Liang Chen        2018-08-01   288  					 <&cru HCLK_VPU>,
7053e06b1422a6 Liang Chen        2018-08-01   289  					 <&cru SCLK_CORE_VPU>;
7053e06b1422a6 Liang Chen        2018-08-01   290  				pm_qos = <&qos_vpu>, <&qos_vpu_r128>;
837188d4982323 Johan Jonker      2021-04-17   291  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   292  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   293  			power-domain@PX30_PD_VO {
7053e06b1422a6 Liang Chen        2018-08-01   294  				reg = <PX30_PD_VO>;
7053e06b1422a6 Liang Chen        2018-08-01   295  				clocks = <&cru ACLK_RGA>,
7053e06b1422a6 Liang Chen        2018-08-01   296  					 <&cru ACLK_VOPB>,
7053e06b1422a6 Liang Chen        2018-08-01   297  					 <&cru ACLK_VOPL>,
7053e06b1422a6 Liang Chen        2018-08-01   298  					 <&cru DCLK_VOPB>,
7053e06b1422a6 Liang Chen        2018-08-01   299  					 <&cru DCLK_VOPL>,
7053e06b1422a6 Liang Chen        2018-08-01   300  					 <&cru HCLK_RGA>,
7053e06b1422a6 Liang Chen        2018-08-01   301  					 <&cru HCLK_VOPB>,
7053e06b1422a6 Liang Chen        2018-08-01   302  					 <&cru HCLK_VOPL>,
7053e06b1422a6 Liang Chen        2018-08-01   303  					 <&cru PCLK_MIPI_DSI>,
7053e06b1422a6 Liang Chen        2018-08-01   304  					 <&cru SCLK_RGA_CORE>,
7053e06b1422a6 Liang Chen        2018-08-01   305  					 <&cru SCLK_VOPB_PWM>;
7053e06b1422a6 Liang Chen        2018-08-01   306  				pm_qos = <&qos_rga_rd>, <&qos_rga_wr>,
7053e06b1422a6 Liang Chen        2018-08-01   307  					 <&qos_vop_m0>, <&qos_vop_m1>;
837188d4982323 Johan Jonker      2021-04-17   308  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   309  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   310  			power-domain@PX30_PD_VI {
7053e06b1422a6 Liang Chen        2018-08-01   311  				reg = <PX30_PD_VI>;
7053e06b1422a6 Liang Chen        2018-08-01   312  				clocks = <&cru ACLK_CIF>,
7053e06b1422a6 Liang Chen        2018-08-01   313  					 <&cru ACLK_ISP>,
7053e06b1422a6 Liang Chen        2018-08-01   314  					 <&cru HCLK_CIF>,
7053e06b1422a6 Liang Chen        2018-08-01   315  					 <&cru HCLK_ISP>,
7053e06b1422a6 Liang Chen        2018-08-01   316  					 <&cru SCLK_ISP>;
7053e06b1422a6 Liang Chen        2018-08-01   317  				pm_qos = <&qos_isp_128>, <&qos_isp_rd>,
7053e06b1422a6 Liang Chen        2018-08-01   318  					 <&qos_isp_wr>, <&qos_isp_m1>,
7053e06b1422a6 Liang Chen        2018-08-01   319  					 <&qos_vip>;
837188d4982323 Johan Jonker      2021-04-17   320  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   321  			};
d5de0d688ac6e0 Elaine Zhang      2021-04-17   322  			power-domain@PX30_PD_GPU {
7053e06b1422a6 Liang Chen        2018-08-01   323  				reg = <PX30_PD_GPU>;
7053e06b1422a6 Liang Chen        2018-08-01   324  				clocks = <&cru SCLK_GPU>;
7053e06b1422a6 Liang Chen        2018-08-01   325  				pm_qos = <&qos_gpu>;
837188d4982323 Johan Jonker      2021-04-17   326  				#power-domain-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   327  			};
7053e06b1422a6 Liang Chen        2018-08-01   328  		};
7053e06b1422a6 Liang Chen        2018-08-01   329  	};
7053e06b1422a6 Liang Chen        2018-08-01   330  
7053e06b1422a6 Liang Chen        2018-08-01   331  	pmugrf: syscon@ff010000 {
7053e06b1422a6 Liang Chen        2018-08-01   332  		compatible = "rockchip,px30-pmugrf", "syscon", "simple-mfd";
7053e06b1422a6 Liang Chen        2018-08-01   333  		reg = <0x0 0xff010000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   334  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   335  		#size-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   336  
7053e06b1422a6 Liang Chen        2018-08-01   337  		pmu_io_domains: io-domains {
7053e06b1422a6 Liang Chen        2018-08-01   338  			compatible = "rockchip,px30-pmu-io-voltage-domain";
7053e06b1422a6 Liang Chen        2018-08-01   339  			status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   340  		};
7053e06b1422a6 Liang Chen        2018-08-01   341  
7053e06b1422a6 Liang Chen        2018-08-01   342  		reboot-mode {
7053e06b1422a6 Liang Chen        2018-08-01   343  			compatible = "syscon-reboot-mode";
7053e06b1422a6 Liang Chen        2018-08-01   344  			offset = <0x200>;
7053e06b1422a6 Liang Chen        2018-08-01   345  			mode-bootloader = <BOOT_BL_DOWNLOAD>;
7053e06b1422a6 Liang Chen        2018-08-01   346  			mode-fastboot = <BOOT_FASTBOOT>;
7053e06b1422a6 Liang Chen        2018-08-01   347  			mode-loader = <BOOT_BL_DOWNLOAD>;
7053e06b1422a6 Liang Chen        2018-08-01   348  			mode-normal = <BOOT_NORMAL>;
7053e06b1422a6 Liang Chen        2018-08-01   349  			mode-recovery = <BOOT_RECOVERY>;
7053e06b1422a6 Liang Chen        2018-08-01   350  		};
7053e06b1422a6 Liang Chen        2018-08-01   351  	};
7053e06b1422a6 Liang Chen        2018-08-01   352  
7053e06b1422a6 Liang Chen        2018-08-01   353  	uart0: serial@ff030000 {
7053e06b1422a6 Liang Chen        2018-08-01   354  		compatible = "rockchip,px30-uart", "snps,dw-apb-uart";
7053e06b1422a6 Liang Chen        2018-08-01   355  		reg = <0x0 0xff030000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   356  		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   357  		clocks = <&pmucru SCLK_UART0_PMU>, <&pmucru PCLK_UART0_PMU>;
7053e06b1422a6 Liang Chen        2018-08-01   358  		clock-names = "baudclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   359  		dmas = <&dmac 0>, <&dmac 1>;
7053e06b1422a6 Liang Chen        2018-08-01   360  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   361  		reg-shift = <2>;
7053e06b1422a6 Liang Chen        2018-08-01   362  		reg-io-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   363  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   364  		pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
7053e06b1422a6 Liang Chen        2018-08-01   365  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   366  	};
7053e06b1422a6 Liang Chen        2018-08-01   367  
7053e06b1422a6 Liang Chen        2018-08-01   368  	i2s1_2ch: i2s@ff070000 {
7053e06b1422a6 Liang Chen        2018-08-01   369  		compatible = "rockchip,px30-i2s", "rockchip,rk3066-i2s";
7053e06b1422a6 Liang Chen        2018-08-01   370  		reg = <0x0 0xff070000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   371  		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   372  		clocks = <&cru SCLK_I2S1>, <&cru HCLK_I2S1>;
7053e06b1422a6 Liang Chen        2018-08-01   373  		clock-names = "i2s_clk", "i2s_hclk";
7053e06b1422a6 Liang Chen        2018-08-01   374  		dmas = <&dmac 18>, <&dmac 19>;
7053e06b1422a6 Liang Chen        2018-08-01   375  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   376  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   377  		pinctrl-0 = <&i2s1_2ch_sclk &i2s1_2ch_lrck
7053e06b1422a6 Liang Chen        2018-08-01   378  			     &i2s1_2ch_sdi &i2s1_2ch_sdo>;
7053e06b1422a6 Liang Chen        2018-08-01   379  		#sound-dai-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   380  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   381  	};
7053e06b1422a6 Liang Chen        2018-08-01   382  
7053e06b1422a6 Liang Chen        2018-08-01   383  	i2s2_2ch: i2s@ff080000 {
7053e06b1422a6 Liang Chen        2018-08-01   384  		compatible = "rockchip,px30-i2s", "rockchip,rk3066-i2s";
7053e06b1422a6 Liang Chen        2018-08-01   385  		reg = <0x0 0xff080000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   386  		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   387  		clocks = <&cru SCLK_I2S2>, <&cru HCLK_I2S2>;
7053e06b1422a6 Liang Chen        2018-08-01   388  		clock-names = "i2s_clk", "i2s_hclk";
7053e06b1422a6 Liang Chen        2018-08-01   389  		dmas = <&dmac 20>, <&dmac 21>;
7053e06b1422a6 Liang Chen        2018-08-01   390  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   391  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   392  		pinctrl-0 = <&i2s2_2ch_sclk &i2s2_2ch_lrck
7053e06b1422a6 Liang Chen        2018-08-01   393  			     &i2s2_2ch_sdi &i2s2_2ch_sdo>;
7053e06b1422a6 Liang Chen        2018-08-01   394  		#sound-dai-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   395  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   396  	};
7053e06b1422a6 Liang Chen        2018-08-01   397  
7053e06b1422a6 Liang Chen        2018-08-01   398  	gic: interrupt-controller@ff131000 {
7053e06b1422a6 Liang Chen        2018-08-01   399  		compatible = "arm,gic-400";
7053e06b1422a6 Liang Chen        2018-08-01   400  		#interrupt-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   401  		#address-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   402  		interrupt-controller;
7053e06b1422a6 Liang Chen        2018-08-01   403  		reg = <0x0 0xff131000 0 0x1000>,
7053e06b1422a6 Liang Chen        2018-08-01   404  		      <0x0 0xff132000 0 0x2000>,
7053e06b1422a6 Liang Chen        2018-08-01   405  		      <0x0 0xff134000 0 0x2000>,
7053e06b1422a6 Liang Chen        2018-08-01   406  		      <0x0 0xff136000 0 0x2000>;
7053e06b1422a6 Liang Chen        2018-08-01   407  		interrupts = <GIC_PPI 9
7053e06b1422a6 Liang Chen        2018-08-01   408  		      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
7053e06b1422a6 Liang Chen        2018-08-01   409  	};
7053e06b1422a6 Liang Chen        2018-08-01   410  
7053e06b1422a6 Liang Chen        2018-08-01   411  	grf: syscon@ff140000 {
7053e06b1422a6 Liang Chen        2018-08-01   412  		compatible = "rockchip,px30-grf", "syscon", "simple-mfd";
7053e06b1422a6 Liang Chen        2018-08-01   413  		reg = <0x0 0xff140000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   414  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   415  		#size-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   416  
7053e06b1422a6 Liang Chen        2018-08-01   417  		io_domains: io-domains {
7053e06b1422a6 Liang Chen        2018-08-01   418  			compatible = "rockchip,px30-io-voltage-domain";
7053e06b1422a6 Liang Chen        2018-08-01   419  			status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   420  		};
dbb6f7787961d8 Miquel Raynal     2019-12-24   421  
dbb6f7787961d8 Miquel Raynal     2019-12-24   422  		lvds: lvds {
dbb6f7787961d8 Miquel Raynal     2019-12-24   423  			compatible = "rockchip,px30-lvds";
dbb6f7787961d8 Miquel Raynal     2019-12-24   424  			phys = <&dsi_dphy>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   425  			phy-names = "dphy";
dbb6f7787961d8 Miquel Raynal     2019-12-24   426  			rockchip,grf = <&grf>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   427  			rockchip,output = "lvds";
dbb6f7787961d8 Miquel Raynal     2019-12-24   428  			status = "disabled";
dbb6f7787961d8 Miquel Raynal     2019-12-24   429  
186444c146dcfa Heiko Stuebner    2020-01-21   430  			ports {
186444c146dcfa Heiko Stuebner    2020-01-21   431  				#address-cells = <1>;
186444c146dcfa Heiko Stuebner    2020-01-21   432  				#size-cells = <0>;
186444c146dcfa Heiko Stuebner    2020-01-21   433  
dbb6f7787961d8 Miquel Raynal     2019-12-24   434  				port@0 {
dbb6f7787961d8 Miquel Raynal     2019-12-24   435  					reg = <0>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   436  					#address-cells = <1>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   437  					#size-cells = <0>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   438  
dbb6f7787961d8 Miquel Raynal     2019-12-24   439  					lvds_vopb_in: endpoint@0 {
dbb6f7787961d8 Miquel Raynal     2019-12-24   440  						reg = <0>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   441  						remote-endpoint = <&vopb_out_lvds>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   442  					};
dbb6f7787961d8 Miquel Raynal     2019-12-24   443  
dbb6f7787961d8 Miquel Raynal     2019-12-24   444  					lvds_vopl_in: endpoint@1 {
dbb6f7787961d8 Miquel Raynal     2019-12-24   445  						reg = <1>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   446  						remote-endpoint = <&vopl_out_lvds>;
dbb6f7787961d8 Miquel Raynal     2019-12-24   447  					};
dbb6f7787961d8 Miquel Raynal     2019-12-24   448  				};
dbb6f7787961d8 Miquel Raynal     2019-12-24   449  			};
7053e06b1422a6 Liang Chen        2018-08-01   450  		};
186444c146dcfa Heiko Stuebner    2020-01-21   451  	};
7053e06b1422a6 Liang Chen        2018-08-01   452  
7053e06b1422a6 Liang Chen        2018-08-01   453  	uart1: serial@ff158000 {
7053e06b1422a6 Liang Chen        2018-08-01   454  		compatible = "rockchip,px30-uart", "snps,dw-apb-uart";
7053e06b1422a6 Liang Chen        2018-08-01   455  		reg = <0x0 0xff158000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   456  		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   457  		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
7053e06b1422a6 Liang Chen        2018-08-01   458  		clock-names = "baudclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   459  		dmas = <&dmac 2>, <&dmac 3>;
7053e06b1422a6 Liang Chen        2018-08-01   460  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   461  		reg-shift = <2>;
7053e06b1422a6 Liang Chen        2018-08-01   462  		reg-io-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   463  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   464  		pinctrl-0 = <&uart1_xfer &uart1_cts &uart1_rts>;
7053e06b1422a6 Liang Chen        2018-08-01   465  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   466  	};
7053e06b1422a6 Liang Chen        2018-08-01   467  
7053e06b1422a6 Liang Chen        2018-08-01   468  	uart2: serial@ff160000 {
7053e06b1422a6 Liang Chen        2018-08-01   469  		compatible = "rockchip,px30-uart", "snps,dw-apb-uart";
7053e06b1422a6 Liang Chen        2018-08-01   470  		reg = <0x0 0xff160000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   471  		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   472  		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
7053e06b1422a6 Liang Chen        2018-08-01   473  		clock-names = "baudclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   474  		dmas = <&dmac 4>, <&dmac 5>;
7053e06b1422a6 Liang Chen        2018-08-01   475  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   476  		reg-shift = <2>;
7053e06b1422a6 Liang Chen        2018-08-01   477  		reg-io-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   478  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   479  		pinctrl-0 = <&uart2m0_xfer>;
7053e06b1422a6 Liang Chen        2018-08-01   480  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   481  	};
7053e06b1422a6 Liang Chen        2018-08-01   482  
7053e06b1422a6 Liang Chen        2018-08-01   483  	uart3: serial@ff168000 {
7053e06b1422a6 Liang Chen        2018-08-01   484  		compatible = "rockchip,px30-uart", "snps,dw-apb-uart";
7053e06b1422a6 Liang Chen        2018-08-01   485  		reg = <0x0 0xff168000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   486  		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   487  		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
7053e06b1422a6 Liang Chen        2018-08-01   488  		clock-names = "baudclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   489  		dmas = <&dmac 6>, <&dmac 7>;
7053e06b1422a6 Liang Chen        2018-08-01   490  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   491  		reg-shift = <2>;
7053e06b1422a6 Liang Chen        2018-08-01   492  		reg-io-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   493  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   494  		pinctrl-0 = <&uart3m1_xfer &uart3m1_cts &uart3m1_rts>;
7053e06b1422a6 Liang Chen        2018-08-01   495  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   496  	};
7053e06b1422a6 Liang Chen        2018-08-01   497  
7053e06b1422a6 Liang Chen        2018-08-01   498  	uart4: serial@ff170000 {
7053e06b1422a6 Liang Chen        2018-08-01   499  		compatible = "rockchip,px30-uart", "snps,dw-apb-uart";
7053e06b1422a6 Liang Chen        2018-08-01   500  		reg = <0x0 0xff170000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   501  		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   502  		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
7053e06b1422a6 Liang Chen        2018-08-01   503  		clock-names = "baudclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   504  		dmas = <&dmac 8>, <&dmac 9>;
7053e06b1422a6 Liang Chen        2018-08-01   505  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   506  		reg-shift = <2>;
7053e06b1422a6 Liang Chen        2018-08-01   507  		reg-io-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   508  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   509  		pinctrl-0 = <&uart4_xfer &uart4_cts &uart4_rts>;
7053e06b1422a6 Liang Chen        2018-08-01   510  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   511  	};
7053e06b1422a6 Liang Chen        2018-08-01   512  
7053e06b1422a6 Liang Chen        2018-08-01   513  	uart5: serial@ff178000 {
7053e06b1422a6 Liang Chen        2018-08-01   514  		compatible = "rockchip,px30-uart", "snps,dw-apb-uart";
7053e06b1422a6 Liang Chen        2018-08-01   515  		reg = <0x0 0xff178000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   516  		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   517  		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
7053e06b1422a6 Liang Chen        2018-08-01   518  		clock-names = "baudclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   519  		dmas = <&dmac 10>, <&dmac 11>;
7053e06b1422a6 Liang Chen        2018-08-01   520  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   521  		reg-shift = <2>;
7053e06b1422a6 Liang Chen        2018-08-01   522  		reg-io-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   523  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   524  		pinctrl-0 = <&uart5_xfer &uart5_cts &uart5_rts>;
7053e06b1422a6 Liang Chen        2018-08-01   525  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   526  	};
7053e06b1422a6 Liang Chen        2018-08-01   527  
7053e06b1422a6 Liang Chen        2018-08-01   528  	i2c0: i2c@ff180000 {
7053e06b1422a6 Liang Chen        2018-08-01   529  		compatible = "rockchip,px30-i2c", "rockchip,rk3399-i2c";
7053e06b1422a6 Liang Chen        2018-08-01   530  		reg = <0x0 0xff180000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   531  		clocks =  <&cru SCLK_I2C0>, <&cru PCLK_I2C0>;
7053e06b1422a6 Liang Chen        2018-08-01   532  		clock-names = "i2c", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   533  		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   534  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   535  		pinctrl-0 = <&i2c0_xfer>;
7053e06b1422a6 Liang Chen        2018-08-01   536  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   537  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   538  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   539  	};
7053e06b1422a6 Liang Chen        2018-08-01   540  
7053e06b1422a6 Liang Chen        2018-08-01   541  	i2c1: i2c@ff190000 {
7053e06b1422a6 Liang Chen        2018-08-01   542  		compatible = "rockchip,px30-i2c", "rockchip,rk3399-i2c";
7053e06b1422a6 Liang Chen        2018-08-01   543  		reg = <0x0 0xff190000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   544  		clocks = <&cru SCLK_I2C1>, <&cru PCLK_I2C1>;
7053e06b1422a6 Liang Chen        2018-08-01   545  		clock-names = "i2c", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   546  		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   547  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   548  		pinctrl-0 = <&i2c1_xfer>;
7053e06b1422a6 Liang Chen        2018-08-01   549  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   550  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   551  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   552  	};
7053e06b1422a6 Liang Chen        2018-08-01   553  
7053e06b1422a6 Liang Chen        2018-08-01   554  	i2c2: i2c@ff1a0000 {
7053e06b1422a6 Liang Chen        2018-08-01   555  		compatible = "rockchip,px30-i2c", "rockchip,rk3399-i2c";
7053e06b1422a6 Liang Chen        2018-08-01   556  		reg = <0x0 0xff1a0000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   557  		clocks = <&cru SCLK_I2C2>, <&cru PCLK_I2C2>;
7053e06b1422a6 Liang Chen        2018-08-01   558  		clock-names = "i2c", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   559  		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   560  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   561  		pinctrl-0 = <&i2c2_xfer>;
7053e06b1422a6 Liang Chen        2018-08-01   562  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   563  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   564  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   565  	};
7053e06b1422a6 Liang Chen        2018-08-01   566  
7053e06b1422a6 Liang Chen        2018-08-01   567  	i2c3: i2c@ff1b0000 {
7053e06b1422a6 Liang Chen        2018-08-01   568  		compatible = "rockchip,px30-i2c", "rockchip,rk3399-i2c";
7053e06b1422a6 Liang Chen        2018-08-01   569  		reg = <0x0 0xff1b0000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   570  		clocks = <&cru SCLK_I2C3>, <&cru PCLK_I2C3>;
7053e06b1422a6 Liang Chen        2018-08-01   571  		clock-names = "i2c", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   572  		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   573  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   574  		pinctrl-0 = <&i2c3_xfer>;
7053e06b1422a6 Liang Chen        2018-08-01   575  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   576  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   577  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   578  	};
7053e06b1422a6 Liang Chen        2018-08-01   579  
7053e06b1422a6 Liang Chen        2018-08-01   580  	spi0: spi@ff1d0000 {
7053e06b1422a6 Liang Chen        2018-08-01   581  		compatible = "rockchip,px30-spi", "rockchip,rk3066-spi";
7053e06b1422a6 Liang Chen        2018-08-01   582  		reg = <0x0 0xff1d0000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   583  		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   584  		clocks = <&cru SCLK_SPI0>, <&cru PCLK_SPI0>;
7053e06b1422a6 Liang Chen        2018-08-01   585  		clock-names = "spiclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   586  		dmas = <&dmac 12>, <&dmac 13>;
7053e06b1422a6 Liang Chen        2018-08-01   587  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   588  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   589  		pinctrl-0 = <&spi0_clk &spi0_csn &spi0_miso &spi0_mosi>;
7053e06b1422a6 Liang Chen        2018-08-01   590  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   591  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   592  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   593  	};
7053e06b1422a6 Liang Chen        2018-08-01   594  
7053e06b1422a6 Liang Chen        2018-08-01   595  	spi1: spi@ff1d8000 {
7053e06b1422a6 Liang Chen        2018-08-01   596  		compatible = "rockchip,px30-spi", "rockchip,rk3066-spi";
7053e06b1422a6 Liang Chen        2018-08-01   597  		reg = <0x0 0xff1d8000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   598  		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   599  		clocks = <&cru SCLK_SPI1>, <&cru PCLK_SPI1>;
7053e06b1422a6 Liang Chen        2018-08-01   600  		clock-names = "spiclk", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   601  		dmas = <&dmac 14>, <&dmac 15>;
7053e06b1422a6 Liang Chen        2018-08-01   602  		dma-names = "tx", "rx";
7053e06b1422a6 Liang Chen        2018-08-01   603  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   604  		pinctrl-0 = <&spi1_clk &spi1_csn0 &spi1_csn1 &spi1_miso &spi1_mosi>;
7053e06b1422a6 Liang Chen        2018-08-01   605  		#address-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   606  		#size-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01   607  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   608  	};
7053e06b1422a6 Liang Chen        2018-08-01   609  
7053e06b1422a6 Liang Chen        2018-08-01   610  	wdt: watchdog@ff1e0000 {
d16c7082cff5e1 Johan Jonker      2020-12-18   611  		compatible = "rockchip,px30-wdt", "snps,dw-wdt";
7053e06b1422a6 Liang Chen        2018-08-01   612  		reg = <0x0 0xff1e0000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   613  		clocks = <&cru PCLK_WDT_NS>;
7053e06b1422a6 Liang Chen        2018-08-01   614  		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   615  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   616  	};
7053e06b1422a6 Liang Chen        2018-08-01   617  
7053e06b1422a6 Liang Chen        2018-08-01   618  	pwm0: pwm@ff200000 {
7053e06b1422a6 Liang Chen        2018-08-01   619  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   620  		reg = <0x0 0xff200000 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   621  		clocks = <&cru SCLK_PWM0>, <&cru PCLK_PWM0>;
7053e06b1422a6 Liang Chen        2018-08-01   622  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   623  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   624  		pinctrl-0 = <&pwm0_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   625  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   626  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   627  	};
7053e06b1422a6 Liang Chen        2018-08-01   628  
7053e06b1422a6 Liang Chen        2018-08-01   629  	pwm1: pwm@ff200010 {
7053e06b1422a6 Liang Chen        2018-08-01   630  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   631  		reg = <0x0 0xff200010 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   632  		clocks = <&cru SCLK_PWM0>, <&cru PCLK_PWM0>;
7053e06b1422a6 Liang Chen        2018-08-01   633  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   634  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   635  		pinctrl-0 = <&pwm1_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   636  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   637  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   638  	};
7053e06b1422a6 Liang Chen        2018-08-01   639  
7053e06b1422a6 Liang Chen        2018-08-01   640  	pwm2: pwm@ff200020 {
7053e06b1422a6 Liang Chen        2018-08-01   641  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   642  		reg = <0x0 0xff200020 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   643  		clocks = <&cru SCLK_PWM0>, <&cru PCLK_PWM0>;
7053e06b1422a6 Liang Chen        2018-08-01   644  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   645  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   646  		pinctrl-0 = <&pwm2_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   647  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   648  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   649  	};
7053e06b1422a6 Liang Chen        2018-08-01   650  
7053e06b1422a6 Liang Chen        2018-08-01   651  	pwm3: pwm@ff200030 {
7053e06b1422a6 Liang Chen        2018-08-01   652  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   653  		reg = <0x0 0xff200030 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   654  		clocks = <&cru SCLK_PWM0>, <&cru PCLK_PWM0>;
7053e06b1422a6 Liang Chen        2018-08-01   655  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   656  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   657  		pinctrl-0 = <&pwm3_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   658  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   659  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   660  	};
7053e06b1422a6 Liang Chen        2018-08-01   661  
7053e06b1422a6 Liang Chen        2018-08-01   662  	pwm4: pwm@ff208000 {
7053e06b1422a6 Liang Chen        2018-08-01   663  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   664  		reg = <0x0 0xff208000 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   665  		clocks = <&cru SCLK_PWM1>, <&cru PCLK_PWM1>;
7053e06b1422a6 Liang Chen        2018-08-01   666  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   667  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   668  		pinctrl-0 = <&pwm4_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   669  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   670  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   671  	};
7053e06b1422a6 Liang Chen        2018-08-01   672  
7053e06b1422a6 Liang Chen        2018-08-01   673  	pwm5: pwm@ff208010 {
7053e06b1422a6 Liang Chen        2018-08-01   674  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   675  		reg = <0x0 0xff208010 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   676  		clocks = <&cru SCLK_PWM1>, <&cru PCLK_PWM1>;
7053e06b1422a6 Liang Chen        2018-08-01   677  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   678  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   679  		pinctrl-0 = <&pwm5_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   680  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   681  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   682  	};
7053e06b1422a6 Liang Chen        2018-08-01   683  
7053e06b1422a6 Liang Chen        2018-08-01   684  	pwm6: pwm@ff208020 {
7053e06b1422a6 Liang Chen        2018-08-01   685  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   686  		reg = <0x0 0xff208020 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   687  		clocks = <&cru SCLK_PWM1>, <&cru PCLK_PWM1>;
7053e06b1422a6 Liang Chen        2018-08-01   688  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   689  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   690  		pinctrl-0 = <&pwm6_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   691  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   692  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   693  	};
7053e06b1422a6 Liang Chen        2018-08-01   694  
7053e06b1422a6 Liang Chen        2018-08-01   695  	pwm7: pwm@ff208030 {
7053e06b1422a6 Liang Chen        2018-08-01   696  		compatible = "rockchip,px30-pwm", "rockchip,rk3328-pwm";
7053e06b1422a6 Liang Chen        2018-08-01   697  		reg = <0x0 0xff208030 0x0 0x10>;
7053e06b1422a6 Liang Chen        2018-08-01   698  		clocks = <&cru SCLK_PWM1>, <&cru PCLK_PWM1>;
7053e06b1422a6 Liang Chen        2018-08-01   699  		clock-names = "pwm", "pclk";
7053e06b1422a6 Liang Chen        2018-08-01   700  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   701  		pinctrl-0 = <&pwm7_pin>;
7053e06b1422a6 Liang Chen        2018-08-01   702  		#pwm-cells = <3>;
7053e06b1422a6 Liang Chen        2018-08-01   703  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   704  	};
7053e06b1422a6 Liang Chen        2018-08-01   705  
7053e06b1422a6 Liang Chen        2018-08-01   706  	rktimer: timer@ff210000 {
7053e06b1422a6 Liang Chen        2018-08-01   707  		compatible = "rockchip,px30-timer", "rockchip,rk3288-timer";
7053e06b1422a6 Liang Chen        2018-08-01   708  		reg = <0x0 0xff210000 0x0 0x1000>;
7053e06b1422a6 Liang Chen        2018-08-01   709  		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   710  		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER0>;
7053e06b1422a6 Liang Chen        2018-08-01   711  		clock-names = "pclk", "timer";
7053e06b1422a6 Liang Chen        2018-08-01   712  	};
7053e06b1422a6 Liang Chen        2018-08-01   713  
7053e06b1422a6 Liang Chen        2018-08-01   714  	dmac: dmac@ff240000 {
7053e06b1422a6 Liang Chen        2018-08-01   715  		compatible = "arm,pl330", "arm,primecell";
7053e06b1422a6 Liang Chen        2018-08-01   716  		reg = <0x0 0xff240000 0x0 0x4000>;
7053e06b1422a6 Liang Chen        2018-08-01   717  		interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
7053e06b1422a6 Liang Chen        2018-08-01   718  			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
505af9184ec0a0 Sugar Zhang       2020-06-29   719  		arm,pl330-periph-burst;
7053e06b1422a6 Liang Chen        2018-08-01   720  		clocks = <&cru ACLK_DMAC>;
7053e06b1422a6 Liang Chen        2018-08-01   721  		clock-names = "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   722  		#dma-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   723  	};
7053e06b1422a6 Liang Chen        2018-08-01   724  
023115cdea26b9 Heiko Stuebner    2019-11-16   725  	tsadc: tsadc@ff280000 {
023115cdea26b9 Heiko Stuebner    2019-11-16   726  		compatible = "rockchip,px30-tsadc";
023115cdea26b9 Heiko Stuebner    2019-11-16   727  		reg = <0x0 0xff280000 0x0 0x100>;
023115cdea26b9 Heiko Stuebner    2019-11-16   728  		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
023115cdea26b9 Heiko Stuebner    2019-11-16   729  		assigned-clocks = <&cru SCLK_TSADC>;
023115cdea26b9 Heiko Stuebner    2019-11-16   730  		assigned-clock-rates = <50000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   731  		clocks = <&cru SCLK_TSADC>, <&cru PCLK_TSADC>;
023115cdea26b9 Heiko Stuebner    2019-11-16   732  		clock-names = "tsadc", "apb_pclk";
023115cdea26b9 Heiko Stuebner    2019-11-16   733  		resets = <&cru SRST_TSADC>;
023115cdea26b9 Heiko Stuebner    2019-11-16   734  		reset-names = "tsadc-apb";
023115cdea26b9 Heiko Stuebner    2019-11-16   735  		rockchip,grf = <&grf>;
023115cdea26b9 Heiko Stuebner    2019-11-16   736  		rockchip,hw-tshut-temp = <120000>;
023115cdea26b9 Heiko Stuebner    2019-11-16   737  		pinctrl-names = "init", "default", "sleep";
2bc65fef4fe424 Johan Jonker      2020-05-24   738  		pinctrl-0 = <&tsadc_otp_pin>;
023115cdea26b9 Heiko Stuebner    2019-11-16   739  		pinctrl-1 = <&tsadc_otp_out>;
2bc65fef4fe424 Johan Jonker      2020-05-24   740  		pinctrl-2 = <&tsadc_otp_pin>;
023115cdea26b9 Heiko Stuebner    2019-11-16   741  		#thermal-sensor-cells = <1>;
023115cdea26b9 Heiko Stuebner    2019-11-16   742  		status = "disabled";
023115cdea26b9 Heiko Stuebner    2019-11-16   743  	};
023115cdea26b9 Heiko Stuebner    2019-11-16   744  
7053e06b1422a6 Liang Chen        2018-08-01   745  	saradc: saradc@ff288000 {
7053e06b1422a6 Liang Chen        2018-08-01   746  		compatible = "rockchip,px30-saradc", "rockchip,rk3399-saradc";
7053e06b1422a6 Liang Chen        2018-08-01   747  		reg = <0x0 0xff288000 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   748  		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   749  		#io-channel-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   750  		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
7053e06b1422a6 Liang Chen        2018-08-01   751  		clock-names = "saradc", "apb_pclk";
7053e06b1422a6 Liang Chen        2018-08-01   752  		resets = <&cru SRST_SARADC_P>;
7053e06b1422a6 Liang Chen        2018-08-01   753  		reset-names = "saradc-apb";
7053e06b1422a6 Liang Chen        2018-08-01   754  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   755  	};
7053e06b1422a6 Liang Chen        2018-08-01   756  
fbb78418c870c6 Heiko Stuebner    2019-10-24   757  	otp: nvmem@ff290000 {
fbb78418c870c6 Heiko Stuebner    2019-10-24   758  		compatible = "rockchip,px30-otp";
fbb78418c870c6 Heiko Stuebner    2019-10-24   759  		reg = <0x0 0xff290000 0x0 0x4000>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   760  		clocks = <&cru SCLK_OTP_USR>, <&cru PCLK_OTP_NS>,
fbb78418c870c6 Heiko Stuebner    2019-10-24   761  			 <&cru PCLK_OTP_PHY>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   762  		clock-names = "otp", "apb_pclk", "phy";
fbb78418c870c6 Heiko Stuebner    2019-10-24   763  		resets = <&cru SRST_OTP_PHY>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   764  		reset-names = "phy";
fbb78418c870c6 Heiko Stuebner    2019-10-24   765  		#address-cells = <1>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   766  		#size-cells = <1>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   767  
fbb78418c870c6 Heiko Stuebner    2019-10-24   768  		/* Data cells */
fbb78418c870c6 Heiko Stuebner    2019-10-24   769  		cpu_id: id@7 {
fbb78418c870c6 Heiko Stuebner    2019-10-24   770  			reg = <0x07 0x10>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   771  		};
fbb78418c870c6 Heiko Stuebner    2019-10-24   772  		cpu_leakage: cpu-leakage@17 {
fbb78418c870c6 Heiko Stuebner    2019-10-24   773  			reg = <0x17 0x1>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   774  		};
fbb78418c870c6 Heiko Stuebner    2019-10-24   775  		performance: performance@1e {
fbb78418c870c6 Heiko Stuebner    2019-10-24   776  			reg = <0x1e 0x1>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   777  			bits = <4 3>;
fbb78418c870c6 Heiko Stuebner    2019-10-24   778  		};
fbb78418c870c6 Heiko Stuebner    2019-10-24   779  	};
fbb78418c870c6 Heiko Stuebner    2019-10-24   780  
7053e06b1422a6 Liang Chen        2018-08-01   781  	cru: clock-controller@ff2b0000 {
7053e06b1422a6 Liang Chen        2018-08-01   782  		compatible = "rockchip,px30-cru";
7053e06b1422a6 Liang Chen        2018-08-01   783  		reg = <0x0 0xff2b0000 0x0 0x1000>;
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   784  		clocks = <&xin24m>, <&pmucru PLL_GPLL>;
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   785  		clock-names = "xin24m", "gpll";
7053e06b1422a6 Liang Chen        2018-08-01   786  		rockchip,grf = <&grf>;
7053e06b1422a6 Liang Chen        2018-08-01   787  		#clock-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   788  		#reset-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   789  
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   790  		assigned-clocks = <&cru PLL_NPLL>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   791  			<&cru ACLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   792  			<&cru HCLK_BUS_PRE>, <&cru HCLK_PERI_PRE>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   793  			<&cru PCLK_BUS_PRE>, <&cru SCLK_GPU>;
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   794  
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   795  		assigned-clock-rates = <1188000000>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   796  			<200000000>, <200000000>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   797  			<150000000>, <150000000>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   798  			<100000000>, <200000000>;
7053e06b1422a6 Liang Chen        2018-08-01   799  	};
7053e06b1422a6 Liang Chen        2018-08-01   800  
7053e06b1422a6 Liang Chen        2018-08-01   801  	pmucru: clock-controller@ff2bc000 {
7053e06b1422a6 Liang Chen        2018-08-01   802  		compatible = "rockchip,px30-pmucru";
7053e06b1422a6 Liang Chen        2018-08-01   803  		reg = <0x0 0xff2bc000 0x0 0x1000>;
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   804  		clocks = <&xin24m>;
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   805  		clock-names = "xin24m";
7053e06b1422a6 Liang Chen        2018-08-01   806  		rockchip,grf = <&grf>;
7053e06b1422a6 Liang Chen        2018-08-01   807  		#clock-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   808  		#reset-cells = <1>;
7053e06b1422a6 Liang Chen        2018-08-01   809  
7053e06b1422a6 Liang Chen        2018-08-01   810  		assigned-clocks =
7053e06b1422a6 Liang Chen        2018-08-01   811  			<&pmucru PLL_GPLL>, <&pmucru PCLK_PMU_PRE>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   812  			<&pmucru SCLK_WIFI_PMU>;
7053e06b1422a6 Liang Chen        2018-08-01   813  		assigned-clock-rates =
7053e06b1422a6 Liang Chen        2018-08-01   814  			<1200000000>, <100000000>,
45cb61b4f3bf99 Heiko Stuebner    2019-09-17   815  			<26000000>;
7053e06b1422a6 Liang Chen        2018-08-01   816  	};
7053e06b1422a6 Liang Chen        2018-08-01   817  
f952b45bf37076 Heiko Stuebner    2019-09-17   818  	usb2phy_grf: syscon@ff2c0000 {
f952b45bf37076 Heiko Stuebner    2019-09-17   819  		compatible = "rockchip,px30-usb2phy-grf", "syscon",
f952b45bf37076 Heiko Stuebner    2019-09-17   820  			     "simple-mfd";
f952b45bf37076 Heiko Stuebner    2019-09-17   821  		reg = <0x0 0xff2c0000 0x0 0x10000>;
f952b45bf37076 Heiko Stuebner    2019-09-17   822  		#address-cells = <1>;
f952b45bf37076 Heiko Stuebner    2019-09-17   823  		#size-cells = <1>;
f952b45bf37076 Heiko Stuebner    2019-09-17   824  
8c3d64251ac5c5 Johan Jonker      2021-06-01   825  		u2phy: usb2phy@100 {
f952b45bf37076 Heiko Stuebner    2019-09-17   826  			compatible = "rockchip,px30-usb2phy";
f952b45bf37076 Heiko Stuebner    2019-09-17   827  			reg = <0x100 0x20>;
f952b45bf37076 Heiko Stuebner    2019-09-17   828  			clocks = <&pmucru SCLK_USBPHY_REF>;
f952b45bf37076 Heiko Stuebner    2019-09-17   829  			clock-names = "phyclk";
f952b45bf37076 Heiko Stuebner    2019-09-17   830  			#clock-cells = <0>;
f952b45bf37076 Heiko Stuebner    2019-09-17   831  			assigned-clocks = <&cru USB480M>;
f952b45bf37076 Heiko Stuebner    2019-09-17   832  			assigned-clock-parents = <&u2phy>;
f952b45bf37076 Heiko Stuebner    2019-09-17   833  			clock-output-names = "usb480m_phy";
f952b45bf37076 Heiko Stuebner    2019-09-17   834  			status = "disabled";
f952b45bf37076 Heiko Stuebner    2019-09-17   835  
f952b45bf37076 Heiko Stuebner    2019-09-17   836  			u2phy_host: host-port {
f952b45bf37076 Heiko Stuebner    2019-09-17   837  				#phy-cells = <0>;
f952b45bf37076 Heiko Stuebner    2019-09-17   838  				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
f952b45bf37076 Heiko Stuebner    2019-09-17   839  				interrupt-names = "linestate";
f952b45bf37076 Heiko Stuebner    2019-09-17   840  				status = "disabled";
f952b45bf37076 Heiko Stuebner    2019-09-17   841  			};
f952b45bf37076 Heiko Stuebner    2019-09-17   842  
f952b45bf37076 Heiko Stuebner    2019-09-17   843  			u2phy_otg: otg-port {
f952b45bf37076 Heiko Stuebner    2019-09-17   844  				#phy-cells = <0>;
f952b45bf37076 Heiko Stuebner    2019-09-17   845  				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
f952b45bf37076 Heiko Stuebner    2019-09-17   846  					     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
f952b45bf37076 Heiko Stuebner    2019-09-17   847  					     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
f952b45bf37076 Heiko Stuebner    2019-09-17   848  				interrupt-names = "otg-bvalid", "otg-id",
f952b45bf37076 Heiko Stuebner    2019-09-17   849  						  "linestate";
f952b45bf37076 Heiko Stuebner    2019-09-17   850  				status = "disabled";
f952b45bf37076 Heiko Stuebner    2019-09-17   851  			};
f952b45bf37076 Heiko Stuebner    2019-09-17   852  		};
f952b45bf37076 Heiko Stuebner    2019-09-17   853  	};
f952b45bf37076 Heiko Stuebner    2019-09-17   854  
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   855  	dsi_dphy: phy@ff2e0000 {
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   856  		compatible = "rockchip,px30-dsi-dphy";
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   857  		reg = <0x0 0xff2e0000 0x0 0x10000>;
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   858  		clocks = <&pmucru SCLK_MIPIDSIPHY_REF>, <&cru PCLK_MIPIDSIPHY>;
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   859  		clock-names = "ref", "pclk";
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   860  		resets = <&cru SRST_MIPIDSIPHY_P>;
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   861  		reset-names = "apb";
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   862  		#phy-cells = <0>;
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   863  		power-domains = <&power PX30_PD_VO>;
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   864  		status = "disabled";
e2425dcc70115a Heiko Stuebner    2021-07-22   865  	};
e2425dcc70115a Heiko Stuebner    2021-07-22   866  
e2425dcc70115a Heiko Stuebner    2021-07-22   867  	csi_dphy: phy@ff2f0000 {
e2425dcc70115a Heiko Stuebner    2021-07-22   868  		compatible = "rockchip,px30-csi-dphy";
e2425dcc70115a Heiko Stuebner    2021-07-22   869  		reg = <0x0 0xff2f0000 0x0 0x4000>;
e2425dcc70115a Heiko Stuebner    2021-07-22   870  		clocks = <&cru PCLK_MIPICSIPHY>;
e2425dcc70115a Heiko Stuebner    2021-07-22   871  		clock-names = "pclk";
e2425dcc70115a Heiko Stuebner    2021-07-22   872  		#phy-cells = <0>;
e2425dcc70115a Heiko Stuebner    2021-07-22   873  		power-domains = <&power PX30_PD_VI>;
e2425dcc70115a Heiko Stuebner    2021-07-22   874  		resets = <&cru SRST_MIPICSIPHY_P>;
e2425dcc70115a Heiko Stuebner    2021-07-22   875  		reset-names = "apb";
e2425dcc70115a Heiko Stuebner    2021-07-22   876  		rockchip,grf = <&grf>;
e2425dcc70115a Heiko Stuebner    2021-07-22   877  		status = "disabled";
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   878  	};
7e90ccec8c3cb3 Miquel Raynal     2019-12-24   879  
bb5981333f302f Heiko Stuebner    2018-08-02   880  	usb20_otg: usb@ff300000 {
bb5981333f302f Heiko Stuebner    2018-08-02   881  		compatible = "rockchip,px30-usb", "rockchip,rk3066-usb",
bb5981333f302f Heiko Stuebner    2018-08-02   882  			     "snps,dwc2";
bb5981333f302f Heiko Stuebner    2018-08-02   883  		reg = <0x0 0xff300000 0x0 0x40000>;
bb5981333f302f Heiko Stuebner    2018-08-02   884  		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
bb5981333f302f Heiko Stuebner    2018-08-02   885  		clocks = <&cru HCLK_OTG>;
bb5981333f302f Heiko Stuebner    2018-08-02   886  		clock-names = "otg";
bb5981333f302f Heiko Stuebner    2018-08-02   887  		dr_mode = "otg";
bb5981333f302f Heiko Stuebner    2018-08-02   888  		g-np-tx-fifo-size = <16>;
bb5981333f302f Heiko Stuebner    2018-08-02   889  		g-rx-fifo-size = <280>;
bb5981333f302f Heiko Stuebner    2018-08-02   890  		g-tx-fifo-size = <256 128 128 64 32 16>;
f952b45bf37076 Heiko Stuebner    2019-09-17   891  		phys = <&u2phy_otg>;
f952b45bf37076 Heiko Stuebner    2019-09-17   892  		phy-names = "usb2-phy";
bb5981333f302f Heiko Stuebner    2018-08-02   893  		power-domains = <&power PX30_PD_USB>;
bb5981333f302f Heiko Stuebner    2018-08-02   894  		status = "disabled";
bb5981333f302f Heiko Stuebner    2018-08-02   895  	};
bb5981333f302f Heiko Stuebner    2018-08-02   896  
7053e06b1422a6 Liang Chen        2018-08-01   897  	usb_host0_ehci: usb@ff340000 {
7053e06b1422a6 Liang Chen        2018-08-01   898  		compatible = "generic-ehci";
7053e06b1422a6 Liang Chen        2018-08-01   899  		reg = <0x0 0xff340000 0x0 0x10000>;
7053e06b1422a6 Liang Chen        2018-08-01   900  		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   901  		clocks = <&cru HCLK_HOST>;
f952b45bf37076 Heiko Stuebner    2019-09-17   902  		phys = <&u2phy_host>;
f952b45bf37076 Heiko Stuebner    2019-09-17   903  		phy-names = "usb";
7053e06b1422a6 Liang Chen        2018-08-01   904  		power-domains = <&power PX30_PD_USB>;
7053e06b1422a6 Liang Chen        2018-08-01   905  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   906  	};
7053e06b1422a6 Liang Chen        2018-08-01   907  
7053e06b1422a6 Liang Chen        2018-08-01   908  	usb_host0_ohci: usb@ff350000 {
7053e06b1422a6 Liang Chen        2018-08-01   909  		compatible = "generic-ohci";
7053e06b1422a6 Liang Chen        2018-08-01   910  		reg = <0x0 0xff350000 0x0 0x10000>;
7053e06b1422a6 Liang Chen        2018-08-01   911  		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   912  		clocks = <&cru HCLK_HOST>;
f952b45bf37076 Heiko Stuebner    2019-09-17   913  		phys = <&u2phy_host>;
f952b45bf37076 Heiko Stuebner    2019-09-17   914  		phy-names = "usb";
7053e06b1422a6 Liang Chen        2018-08-01   915  		power-domains = <&power PX30_PD_USB>;
7053e06b1422a6 Liang Chen        2018-08-01   916  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   917  	};
7053e06b1422a6 Liang Chen        2018-08-01   918  
7053e06b1422a6 Liang Chen        2018-08-01   919  	gmac: ethernet@ff360000 {
7053e06b1422a6 Liang Chen        2018-08-01   920  		compatible = "rockchip,px30-gmac";
7053e06b1422a6 Liang Chen        2018-08-01   921  		reg = <0x0 0xff360000 0x0 0x10000>;
7053e06b1422a6 Liang Chen        2018-08-01   922  		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   923  		interrupt-names = "macirq";
7053e06b1422a6 Liang Chen        2018-08-01   924  		clocks = <&cru SCLK_GMAC>, <&cru SCLK_GMAC_RX_TX>,
7053e06b1422a6 Liang Chen        2018-08-01   925  			 <&cru SCLK_GMAC_RX_TX>, <&cru SCLK_MAC_REF>,
7053e06b1422a6 Liang Chen        2018-08-01   926  			 <&cru SCLK_MAC_REFOUT>, <&cru ACLK_GMAC>,
7053e06b1422a6 Liang Chen        2018-08-01   927  			 <&cru PCLK_GMAC>, <&cru SCLK_GMAC_RMII>;
7053e06b1422a6 Liang Chen        2018-08-01   928  		clock-names = "stmmaceth", "mac_clk_rx",
7053e06b1422a6 Liang Chen        2018-08-01   929  			      "mac_clk_tx", "clk_mac_ref",
7053e06b1422a6 Liang Chen        2018-08-01   930  			      "clk_mac_refout", "aclk_mac",
7053e06b1422a6 Liang Chen        2018-08-01   931  			      "pclk_mac", "clk_mac_speed";
7053e06b1422a6 Liang Chen        2018-08-01   932  		rockchip,grf = <&grf>;
7053e06b1422a6 Liang Chen        2018-08-01   933  		phy-mode = "rmii";
7053e06b1422a6 Liang Chen        2018-08-01   934  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   935  		pinctrl-0 = <&rmii_pins &mac_refclk_12ma>;
7053e06b1422a6 Liang Chen        2018-08-01   936  		power-domains = <&power PX30_PD_GMAC>;
7053e06b1422a6 Liang Chen        2018-08-01   937  		resets = <&cru SRST_GMAC_A>;
7053e06b1422a6 Liang Chen        2018-08-01   938  		reset-names = "stmmaceth";
7053e06b1422a6 Liang Chen        2018-08-01   939  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   940  	};
7053e06b1422a6 Liang Chen        2018-08-01   941  
3ef7c2558f3174 Johan Jonker      2020-01-15   942  	sdmmc: mmc@ff370000 {
7053e06b1422a6 Liang Chen        2018-08-01   943  		compatible = "rockchip,px30-dw-mshc", "rockchip,rk3288-dw-mshc";
7053e06b1422a6 Liang Chen        2018-08-01   944  		reg = <0x0 0xff370000 0x0 0x4000>;
7053e06b1422a6 Liang Chen        2018-08-01   945  		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   946  		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
7053e06b1422a6 Liang Chen        2018-08-01   947  			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
7f214735029156 Johan Jonker      2020-01-10   948  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
fb0ab17f1ab750 Johan Jonker      2020-04-16   949  		bus-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   950  		fifo-depth = <0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   951  		max-frequency = <150000000>;
7053e06b1422a6 Liang Chen        2018-08-01   952  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   953  		pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_det &sdmmc_bus4>;
7053e06b1422a6 Liang Chen        2018-08-01   954  		power-domains = <&power PX30_PD_SDCARD>;
7053e06b1422a6 Liang Chen        2018-08-01   955  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   956  	};
7053e06b1422a6 Liang Chen        2018-08-01   957  
3ef7c2558f3174 Johan Jonker      2020-01-15   958  	sdio: mmc@ff380000 {
7053e06b1422a6 Liang Chen        2018-08-01   959  		compatible = "rockchip,px30-dw-mshc", "rockchip,rk3288-dw-mshc";
7053e06b1422a6 Liang Chen        2018-08-01   960  		reg = <0x0 0xff380000 0x0 0x4000>;
7053e06b1422a6 Liang Chen        2018-08-01   961  		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   962  		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
7053e06b1422a6 Liang Chen        2018-08-01   963  			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
7f214735029156 Johan Jonker      2020-01-10   964  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
fb0ab17f1ab750 Johan Jonker      2020-04-16   965  		bus-width = <4>;
7053e06b1422a6 Liang Chen        2018-08-01   966  		fifo-depth = <0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   967  		max-frequency = <150000000>;
7053e06b1422a6 Liang Chen        2018-08-01   968  		pinctrl-names = "default";
7053e06b1422a6 Liang Chen        2018-08-01   969  		pinctrl-0 = <&sdio_bus4 &sdio_cmd &sdio_clk>;
7053e06b1422a6 Liang Chen        2018-08-01   970  		power-domains = <&power PX30_PD_MMC_NAND>;
7053e06b1422a6 Liang Chen        2018-08-01   971  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   972  	};
7053e06b1422a6 Liang Chen        2018-08-01   973  
3ef7c2558f3174 Johan Jonker      2020-01-15   974  	emmc: mmc@ff390000 {
7053e06b1422a6 Liang Chen        2018-08-01   975  		compatible = "rockchip,px30-dw-mshc", "rockchip,rk3288-dw-mshc";
7053e06b1422a6 Liang Chen        2018-08-01   976  		reg = <0x0 0xff390000 0x0 0x4000>;
7053e06b1422a6 Liang Chen        2018-08-01   977  		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01   978  		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
7053e06b1422a6 Liang Chen        2018-08-01   979  			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
7f214735029156 Johan Jonker      2020-01-10   980  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
fb0ab17f1ab750 Johan Jonker      2020-04-16   981  		bus-width = <8>;
7053e06b1422a6 Liang Chen        2018-08-01   982  		fifo-depth = <0x100>;
7053e06b1422a6 Liang Chen        2018-08-01   983  		max-frequency = <150000000>;
cdfebb27892a66 Heiko Stuebner    2019-09-17   984  		pinctrl-names = "default";
cdfebb27892a66 Heiko Stuebner    2019-09-17   985  		pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
7053e06b1422a6 Liang Chen        2018-08-01   986  		power-domains = <&power PX30_PD_MMC_NAND>;
7053e06b1422a6 Liang Chen        2018-08-01   987  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01   988  	};
7053e06b1422a6 Liang Chen        2018-08-01   989  
4d97b78aec8d19 Chris Morgan      2021-08-12   990  	sfc: spi@ff3a0000 {
4d97b78aec8d19 Chris Morgan      2021-08-12   991  		compatible = "rockchip,sfc";
4d97b78aec8d19 Chris Morgan      2021-08-12   992  		reg = <0x0 0xff3a0000 0x0 0x4000>;
4d97b78aec8d19 Chris Morgan      2021-08-12   993  		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
4d97b78aec8d19 Chris Morgan      2021-08-12   994  		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
4d97b78aec8d19 Chris Morgan      2021-08-12   995  		clock-names = "clk_sfc", "hclk_sfc";
4d97b78aec8d19 Chris Morgan      2021-08-12   996  		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
4d97b78aec8d19 Chris Morgan      2021-08-12   997  		pinctrl-names = "default";
4d97b78aec8d19 Chris Morgan      2021-08-12   998  		power-domains = <&power PX30_PD_MMC_NAND>;
4d97b78aec8d19 Chris Morgan      2021-08-12   999  		status = "disabled";
4d97b78aec8d19 Chris Morgan      2021-08-12  1000  	};
4d97b78aec8d19 Chris Morgan      2021-08-12  1001  
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1002  	nfc: nand-controller@ff3b0000 {
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1003  		compatible = "rockchip,px30-nfc";
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1004  		reg = <0x0 0xff3b0000 0x0 0x4000>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1005  		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1006  		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1007  		clock-names = "ahb", "nfc";
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1008  		assigned-clocks = <&cru SCLK_NANDC>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1009  		assigned-clock-rates = <150000000>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1010  		pinctrl-names = "default";
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1011  		pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_cs0
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1012  			     &flash_rdn &flash_rdy &flash_wrn &flash_dqs>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1013  		power-domains = <&power PX30_PD_MMC_NAND>;
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1014  		status = "disabled";
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1015  	};
d00e6e22e8b9f8 Yifeng Zhao       2020-12-10  1016  
f43e351c963021 Maciej Matuszczyk 2021-02-25  1017  	gpu_opp_table: opp-table2 {
f43e351c963021 Maciej Matuszczyk 2021-02-25  1018  		compatible = "operating-points-v2";
f43e351c963021 Maciej Matuszczyk 2021-02-25  1019  
f43e351c963021 Maciej Matuszczyk 2021-02-25  1020  		opp-200000000 {
f43e351c963021 Maciej Matuszczyk 2021-02-25  1021  			opp-hz = /bits/ 64 <200000000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1022  			opp-microvolt = <950000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1023  		};
f43e351c963021 Maciej Matuszczyk 2021-02-25  1024  		opp-300000000 {
f43e351c963021 Maciej Matuszczyk 2021-02-25  1025  			opp-hz = /bits/ 64 <300000000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1026  			opp-microvolt = <975000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1027  		};
f43e351c963021 Maciej Matuszczyk 2021-02-25  1028  		opp-400000000 {
f43e351c963021 Maciej Matuszczyk 2021-02-25  1029  			opp-hz = /bits/ 64 <400000000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1030  			opp-microvolt = <1050000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1031  		};
f43e351c963021 Maciej Matuszczyk 2021-02-25  1032  		opp-480000000 {
f43e351c963021 Maciej Matuszczyk 2021-02-25  1033  			opp-hz = /bits/ 64 <480000000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1034  			opp-microvolt = <1125000>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1035  		};
f43e351c963021 Maciej Matuszczyk 2021-02-25  1036  	};
f43e351c963021 Maciej Matuszczyk 2021-02-25  1037  
a07f34a083f211 Heiko Stuebner    2019-12-08  1038  	gpu: gpu@ff400000 {
a07f34a083f211 Heiko Stuebner    2019-12-08  1039  		compatible = "rockchip,px30-mali", "arm,mali-bifrost";
a07f34a083f211 Heiko Stuebner    2019-12-08  1040  		reg = <0x0 0xff400000 0x0 0x4000>;
a07f34a083f211 Heiko Stuebner    2019-12-08  1041  		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
a07f34a083f211 Heiko Stuebner    2019-12-08  1042  			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
a07f34a083f211 Heiko Stuebner    2019-12-08  1043  			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
a07f34a083f211 Heiko Stuebner    2019-12-08  1044  		interrupt-names = "job", "mmu", "gpu";
a07f34a083f211 Heiko Stuebner    2019-12-08  1045  		clocks = <&cru SCLK_GPU>;
a07f34a083f211 Heiko Stuebner    2019-12-08  1046  		#cooling-cells = <2>;
a07f34a083f211 Heiko Stuebner    2019-12-08  1047  		power-domains = <&power PX30_PD_GPU>;
f43e351c963021 Maciej Matuszczyk 2021-02-25  1048  		operating-points-v2 = <&gpu_opp_table>;
a07f34a083f211 Heiko Stuebner    2019-12-08  1049  		status = "disabled";
a07f34a083f211 Heiko Stuebner    2019-12-08  1050  	};
a07f34a083f211 Heiko Stuebner    2019-12-08  1051  
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1052  	vpu: video-codec@ff442000 {
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1053  		compatible = "rockchip,px30-vpu";
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1054  		reg = <0x0 0xff442000 0x0 0x800>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1055  		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1056  			     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1057  		interrupt-names = "vepu", "vdpu";
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1058  		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1059  		clock-names = "aclk", "hclk";
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1060  		iommus = <&vpu_mmu>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1061  		power-domains = <&power PX30_PD_VPU>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1062  	};
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1063  
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1064  	vpu_mmu: iommu@ff442800 {
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1065  		compatible = "rockchip,iommu";
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1066  		reg = <0x0 0xff442800 0x0 0x100>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1067  		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1068  		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1069  		clock-names = "aclk", "iface";
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1070  		#iommu-cells = <0>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1071  		power-domains = <&power PX30_PD_VPU>;
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1072  	};
6b4b2af5d288e4 Paul Kocialkowski 2021-07-28  1073  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1074  	dsi: dsi@ff450000 {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1075  		compatible = "rockchip,px30-mipi-dsi";
cc5912ab43a19b Heiko Stuebner    2020-01-06  1076  		reg = <0x0 0xff450000 0x0 0x10000>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1077  		interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1078  		clocks = <&cru PCLK_MIPI_DSI>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1079  		clock-names = "pclk";
cc5912ab43a19b Heiko Stuebner    2020-01-06  1080  		phys = <&dsi_dphy>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1081  		phy-names = "dphy";
cc5912ab43a19b Heiko Stuebner    2020-01-06  1082  		power-domains = <&power PX30_PD_VO>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1083  		resets = <&cru SRST_MIPIDSI_HOST_P>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1084  		reset-names = "apb";
cc5912ab43a19b Heiko Stuebner    2020-01-06  1085  		rockchip,grf = <&grf>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1086  		#address-cells = <1>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1087  		#size-cells = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1088  		status = "disabled";
cc5912ab43a19b Heiko Stuebner    2020-01-06  1089  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1090  		ports {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1091  			#address-cells = <1>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1092  			#size-cells = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1093  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1094  			port@0 {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1095  				reg = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1096  				#address-cells = <1>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1097  				#size-cells = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1098  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1099  				dsi_in_vopb: endpoint@0 {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1100  					reg = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1101  					remote-endpoint = <&vopb_out_dsi>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1102  				};
cc5912ab43a19b Heiko Stuebner    2020-01-06  1103  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1104  				dsi_in_vopl: endpoint@1 {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1105  					reg = <1>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1106  					remote-endpoint = <&vopl_out_dsi>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1107  				};
cc5912ab43a19b Heiko Stuebner    2020-01-06  1108  			};
cc5912ab43a19b Heiko Stuebner    2020-01-06  1109  		};
cc5912ab43a19b Heiko Stuebner    2020-01-06  1110  	};
cc5912ab43a19b Heiko Stuebner    2020-01-06  1111  
7053e06b1422a6 Liang Chen        2018-08-01  1112  	vopb: vop@ff460000 {
7053e06b1422a6 Liang Chen        2018-08-01  1113  		compatible = "rockchip,px30-vop-big";
7053e06b1422a6 Liang Chen        2018-08-01  1114  		reg = <0x0 0xff460000 0x0 0xefc>;
7053e06b1422a6 Liang Chen        2018-08-01  1115  		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01  1116  		clocks = <&cru ACLK_VOPB>, <&cru DCLK_VOPB>,
7053e06b1422a6 Liang Chen        2018-08-01  1117  			 <&cru HCLK_VOPB>;
7053e06b1422a6 Liang Chen        2018-08-01  1118  		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
967c1464913294 Sandy Huang       2018-08-29  1119  		resets = <&cru SRST_VOPB_A>, <&cru SRST_VOPB_H>, <&cru SRST_VOPB>;
967c1464913294 Sandy Huang       2018-08-29  1120  		reset-names = "axi", "ahb", "dclk";
7053e06b1422a6 Liang Chen        2018-08-01  1121  		iommus = <&vopb_mmu>;
7053e06b1422a6 Liang Chen        2018-08-01  1122  		power-domains = <&power PX30_PD_VO>;
7053e06b1422a6 Liang Chen        2018-08-01  1123  		status = "disabled";
967c1464913294 Sandy Huang       2018-08-29  1124  
967c1464913294 Sandy Huang       2018-08-29  1125  		vopb_out: port {
967c1464913294 Sandy Huang       2018-08-29  1126  			#address-cells = <1>;
967c1464913294 Sandy Huang       2018-08-29  1127  			#size-cells = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1128  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1129  			vopb_out_dsi: endpoint@0 {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1130  				reg = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1131  				remote-endpoint = <&dsi_in_vopb>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1132  			};
dbb6f7787961d8 Miquel Raynal     2019-12-24  1133  
dbb6f7787961d8 Miquel Raynal     2019-12-24  1134  			vopb_out_lvds: endpoint@1 {
dbb6f7787961d8 Miquel Raynal     2019-12-24  1135  				reg = <1>;
dbb6f7787961d8 Miquel Raynal     2019-12-24  1136  				remote-endpoint = <&lvds_vopb_in>;
dbb6f7787961d8 Miquel Raynal     2019-12-24  1137  			};
967c1464913294 Sandy Huang       2018-08-29  1138  		};
7053e06b1422a6 Liang Chen        2018-08-01  1139  	};
7053e06b1422a6 Liang Chen        2018-08-01  1140  
7053e06b1422a6 Liang Chen        2018-08-01  1141  	vopb_mmu: iommu@ff460f00 {
7053e06b1422a6 Liang Chen        2018-08-01  1142  		compatible = "rockchip,iommu";
7053e06b1422a6 Liang Chen        2018-08-01  1143  		reg = <0x0 0xff460f00 0x0 0x100>;
7053e06b1422a6 Liang Chen        2018-08-01  1144  		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01  1145  		clocks = <&cru ACLK_VOPB>, <&cru HCLK_VOPB>;
8e57eed2047b93 Heiko Stuebner    2019-09-17  1146  		clock-names = "aclk", "iface";
7053e06b1422a6 Liang Chen        2018-08-01  1147  		power-domains = <&power PX30_PD_VO>;
7053e06b1422a6 Liang Chen        2018-08-01  1148  		#iommu-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01  1149  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01  1150  	};
7053e06b1422a6 Liang Chen        2018-08-01  1151  
7053e06b1422a6 Liang Chen        2018-08-01  1152  	vopl: vop@ff470000 {
7053e06b1422a6 Liang Chen        2018-08-01  1153  		compatible = "rockchip,px30-vop-lit";
7053e06b1422a6 Liang Chen        2018-08-01  1154  		reg = <0x0 0xff470000 0x0 0xefc>;
7053e06b1422a6 Liang Chen        2018-08-01  1155  		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01  1156  		clocks = <&cru ACLK_VOPL>, <&cru DCLK_VOPL>,
7053e06b1422a6 Liang Chen        2018-08-01  1157  			 <&cru HCLK_VOPL>;
7053e06b1422a6 Liang Chen        2018-08-01  1158  		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
967c1464913294 Sandy Huang       2018-08-29  1159  		resets = <&cru SRST_VOPL_A>, <&cru SRST_VOPL_H>, <&cru SRST_VOPL>;
967c1464913294 Sandy Huang       2018-08-29  1160  		reset-names = "axi", "ahb", "dclk";
7053e06b1422a6 Liang Chen        2018-08-01  1161  		iommus = <&vopl_mmu>;
7053e06b1422a6 Liang Chen        2018-08-01  1162  		power-domains = <&power PX30_PD_VO>;
7053e06b1422a6 Liang Chen        2018-08-01  1163  		status = "disabled";
967c1464913294 Sandy Huang       2018-08-29  1164  
967c1464913294 Sandy Huang       2018-08-29  1165  		vopl_out: port {
967c1464913294 Sandy Huang       2018-08-29  1166  			#address-cells = <1>;
967c1464913294 Sandy Huang       2018-08-29  1167  			#size-cells = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1168  
cc5912ab43a19b Heiko Stuebner    2020-01-06  1169  			vopl_out_dsi: endpoint@0 {
cc5912ab43a19b Heiko Stuebner    2020-01-06  1170  				reg = <0>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1171  				remote-endpoint = <&dsi_in_vopl>;
cc5912ab43a19b Heiko Stuebner    2020-01-06  1172  			};
dbb6f7787961d8 Miquel Raynal     2019-12-24  1173  
dbb6f7787961d8 Miquel Raynal     2019-12-24  1174  			vopl_out_lvds: endpoint@1 {
dbb6f7787961d8 Miquel Raynal     2019-12-24  1175  				reg = <1>;
dbb6f7787961d8 Miquel Raynal     2019-12-24  1176  				remote-endpoint = <&lvds_vopl_in>;
dbb6f7787961d8 Miquel Raynal     2019-12-24  1177  			};
967c1464913294 Sandy Huang       2018-08-29  1178  		};
7053e06b1422a6 Liang Chen        2018-08-01  1179  	};
7053e06b1422a6 Liang Chen        2018-08-01  1180  
7053e06b1422a6 Liang Chen        2018-08-01  1181  	vopl_mmu: iommu@ff470f00 {
7053e06b1422a6 Liang Chen        2018-08-01  1182  		compatible = "rockchip,iommu";
7053e06b1422a6 Liang Chen        2018-08-01  1183  		reg = <0x0 0xff470f00 0x0 0x100>;
656c648354e156 Sandy Huang       2021-01-08  1184  		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
7053e06b1422a6 Liang Chen        2018-08-01  1185  		clocks = <&cru ACLK_VOPL>, <&cru HCLK_VOPL>;
8e57eed2047b93 Heiko Stuebner    2019-09-17  1186  		clock-names = "aclk", "iface";
7053e06b1422a6 Liang Chen        2018-08-01  1187  		power-domains = <&power PX30_PD_VO>;
7053e06b1422a6 Liang Chen        2018-08-01  1188  		#iommu-cells = <0>;
7053e06b1422a6 Liang Chen        2018-08-01  1189  		status = "disabled";
7053e06b1422a6 Liang Chen        2018-08-01  1190  	};
7053e06b1422a6 Liang Chen        2018-08-01  1191  
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1192  	isp: isp@ff4a0000 {
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1193  		compatible = "rockchip,px30-cif-isp"; /*rk3326-rkisp1*/
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1194  		reg = <0x0 0xff4a0000 0x0 0x8000>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1195  		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1196  			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1197  			     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1198  		interrupt-names = "isp", "mi", "mipi";
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1199  		clocks = <&cru SCLK_ISP>,
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1200  			 <&cru ACLK_ISP>,
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1201  			 <&cru HCLK_ISP>,
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1202  			 <&cru PCLK_ISP>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1203  		clock-names = "isp", "aclk", "hclk", "pclk";
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1204  		iommus = <&isp_mmu>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1205  		phys = <&csi_dphy>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1206  		phy-names = "dphy";
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1207  		power-domains = <&power PX30_PD_VI>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1208  		status = "disabled";
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1209  
8df7b4537dfb4c Heiko Stuebner    2021-08-30 @1210  		ports {
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1211  			#address-cells = <1>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1212  			#size-cells = <0>;
8df7b4537dfb4c Heiko Stuebner    2021-08-30  1213  
8df7b4537dfb4c Heiko Stuebner    2021-08-30 @1214  			port@0 {

:::::: The code at line 1210 was first introduced by commit
:::::: 8df7b4537dfb4c0a2a42de603927f5818cee0274 arm64: dts: rockchip: add isp node for px30

:::::: TO: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
