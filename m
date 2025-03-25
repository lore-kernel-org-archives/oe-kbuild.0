Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F4C19E833
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Mar 2025 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742892779; cv=none; b=YgbiFLczzG8VyAlOXebXLDWzypjhOiM8o7RaRXciw/O3Ia2yec1oxAtc0b4NPPxHmq6v/yjcG046qnccVoxKj/FyRjSoaBzlTp0POAbapd0ZgzF1j/DY+lDEonsuKVv7AwdluR4T4aqgEGn8CPGaA5N7Trwdlqa2GrlKCr1SGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742892779; c=relaxed/simple;
	bh=2FLaV8beduDsgLY4BfUH4A3yCP0RyEQ/yB/KjKSY4wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKudJPdDtA14rlAYe2yDEFRGXtOYh4D7mmUeR9gPPUUNKqluxSvbMzmdcKmpgC0w3vLtxkDXZvKV7w+1E5aLwCBo030vEOgOu8/9PVjFDFScBvoN3A+55fgS1OoVYBNzx0n+O/PC00EcNdbqauoLCBibQ+fe5QmQq/HvBnYtuPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOR1SPVc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOR1SPVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742892775; x=1774428775;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2FLaV8beduDsgLY4BfUH4A3yCP0RyEQ/yB/KjKSY4wQ=;
  b=WOR1SPVcDKZNF/J4LBz7fADiieUfiD+ifj0RR6FA+q/M+4DHHxD4r7pU
   1kbJgZ1F7BNyiUy9qQ94zgzkpHs5y+24KRYIYkRpAvzadtadnzJB2qxz4
   yH6mrHsJohAcpovHt46pq5XJIFNlV0AlMGLZmdl/tY2ErNaNQ5SeXPEMo
   wqDa274GU8+t0yAE0h7JVuBL4uvggEZhhWJYa7X8uBv75elLVsGZBTwdI
   oxOQstQ+u1d7z9cNdQf4lKtESxEAP6jmf7SXfr52QXDZvB8ahfG4rR2sc
   ob3bzojdtaBW863Gyzh4fyM95RnLq42fgB+5c8NAxbX61yHXz/qKghaxX
   A==;
X-CSE-ConnectionGUID: 8Na3bszmTtuTfH2+HggGdw==
X-CSE-MsgGUID: g0INoD+TTKiXv2Htf3nqWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61518519"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="61518519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 01:52:54 -0700
X-CSE-ConnectionGUID: eyZvNGbRQCqdY6uGTsL8XQ==
X-CSE-MsgGUID: yO9oMn26TMuqch881Cz1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="161524476"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2025 01:52:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx01h-0004Ff-25;
	Tue, 25 Mar 2025 08:52:49 +0000
Date: Tue, 25 Mar 2025 16:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-25 20/22]
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning
 (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
Message-ID: <202503251655.qr5i1NVj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-25
head:   2aaeca922f0024ed9f04ce055f5345a1953e54ae
commit: 355788e861e9247e2bd672c424a1298eb0d907d6 [20/22] arm64: dts: renesas: sparrow hawk: Add MSIOF Sound support
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-randconfig-003-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251655.qr5i1NVj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251655.qr5i1NVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503251655.qr5i1NVj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'

vim +1262 arch/arm64/boot/dts/renesas/r8a779g0.dtsi

987da486d84a56 Yoshihiro Shimoda  2022-04-28    11  
987da486d84a56 Yoshihiro Shimoda  2022-04-28    12  / {
987da486d84a56 Yoshihiro Shimoda  2022-04-28    13  	compatible = "renesas,r8a779g0";
987da486d84a56 Yoshihiro Shimoda  2022-04-28    14  	#address-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    15  	#size-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    16  
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    17  	/* External Audio clock - to be overridden by boards that provide it */
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    18  	audio_clkin: audio_clkin {
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    19  		compatible = "fixed-clock";
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    20  		#clock-cells = <0>;
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    21  		clock-frequency = <0>;
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    22  	};
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    23  
5056a0c7286237 Geert Uytterhoeven 2023-01-23    24  	/* External CAN clock - to be overridden by boards that provide it */
5056a0c7286237 Geert Uytterhoeven 2023-01-23    25  	can_clk: can {
5056a0c7286237 Geert Uytterhoeven 2023-01-23    26  		compatible = "fixed-clock";
5056a0c7286237 Geert Uytterhoeven 2023-01-23    27  		#clock-cells = <0>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23    28  		clock-frequency = <0>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23    29  	};
5056a0c7286237 Geert Uytterhoeven 2023-01-23    30  
9a0e630655361c Geert Uytterhoeven 2022-11-14    31  	cluster0_opp: opp-table-0 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    32  		compatible = "operating-points-v2";
9a0e630655361c Geert Uytterhoeven 2022-11-14    33  		opp-shared;
9a0e630655361c Geert Uytterhoeven 2022-11-14    34  
9a0e630655361c Geert Uytterhoeven 2022-11-14    35  		opp-500000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    36  			opp-hz = /bits/ 64 <500000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    37  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    38  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    39  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    40  		opp-1000000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    41  			opp-hz = /bits/ 64 <1000000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    42  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    43  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    44  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    45  		opp-1500000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    46  			opp-hz = /bits/ 64 <1500000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    47  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    48  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    49  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    50  		opp-1700000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    51  			opp-hz = /bits/ 64 <1700000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    52  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    53  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    54  			opp-suspend;
9a0e630655361c Geert Uytterhoeven 2022-11-14    55  		};
87d85b48f81099 Geert Uytterhoeven 2022-12-08    56  		opp-1800000000 {
87d85b48f81099 Geert Uytterhoeven 2022-12-08    57  			opp-hz = /bits/ 64 <1800000000>;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    58  			opp-microvolt = <880000>;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    59  			clock-latency-ns = <500000>;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    60  			turbo-mode;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    61  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    62  	};
9a0e630655361c Geert Uytterhoeven 2022-11-14    63  
987da486d84a56 Yoshihiro Shimoda  2022-04-28    64  	cpus {
987da486d84a56 Yoshihiro Shimoda  2022-04-28    65  		#address-cells = <1>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    66  		#size-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    67  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    68  		cpu-map {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    69  			cluster0 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    70  				core0 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    71  					cpu = <&a76_0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    72  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    73  				core1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    74  					cpu = <&a76_1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    75  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    76  			};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    77  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    78  			cluster1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    79  				core0 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    80  					cpu = <&a76_2>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    81  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    82  				core1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    83  					cpu = <&a76_3>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    84  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    85  			};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    86  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    87  
987da486d84a56 Yoshihiro Shimoda  2022-04-28    88  		a76_0: cpu@0 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28    89  			compatible = "arm,cortex-a76";
987da486d84a56 Yoshihiro Shimoda  2022-04-28    90  			reg = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    91  			device_type = "cpu";
987da486d84a56 Yoshihiro Shimoda  2022-04-28    92  			power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
f08407210db921 Geert Uytterhoeven 2022-11-14    93  			next-level-cache = <&L3_CA76_0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    94  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14    95  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14    96  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    97  			operating-points-v2 = <&cluster0_opp>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    98  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    99  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   100  		a76_1: cpu@100 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   101  			compatible = "arm,cortex-a76";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   102  			reg = <0x100>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   103  			device_type = "cpu";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   104  			power-domains = <&sysc R8A779G0_PD_A1E0D0C1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   105  			next-level-cache = <&L3_CA76_0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   106  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   107  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14   108  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14   109  			operating-points-v2 = <&cluster0_opp>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   110  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   111  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   112  		a76_2: cpu@10000 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   113  			compatible = "arm,cortex-a76";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   114  			reg = <0x10000>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   115  			device_type = "cpu";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   116  			power-domains = <&sysc R8A779G0_PD_A1E0D1C0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   117  			next-level-cache = <&L3_CA76_1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   118  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   119  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14   120  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14   121  			operating-points-v2 = <&cluster0_opp>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   122  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   123  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   124  		a76_3: cpu@10100 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   125  			compatible = "arm,cortex-a76";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   126  			reg = <0x10100>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   127  			device_type = "cpu";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   128  			power-domains = <&sysc R8A779G0_PD_A1E0D1C1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   129  			next-level-cache = <&L3_CA76_1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   130  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   131  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14   132  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14   133  			operating-points-v2 = <&cluster0_opp>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   134  		};
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   135  
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   136  		idle-states {
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   137  			entry-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   138  
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   139  			CPU_SLEEP_0: cpu-sleep-0 {
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   140  				compatible = "arm,idle-state";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   141  				arm,psci-suspend-param = <0x0010000>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   142  				local-timer-stop;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   143  				entry-latency-us = <400>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   144  				exit-latency-us = <500>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   145  				min-residency-us = <4000>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   146  			};
f08407210db921 Geert Uytterhoeven 2022-11-14   147  	       };
f08407210db921 Geert Uytterhoeven 2022-11-14   148  
f08407210db921 Geert Uytterhoeven 2022-11-14   149  		L3_CA76_0: cache-controller-0 {
f08407210db921 Geert Uytterhoeven 2022-11-14   150  			compatible = "cache";
f08407210db921 Geert Uytterhoeven 2022-11-14   151  			power-domains = <&sysc R8A779G0_PD_A2E0D0>;
f08407210db921 Geert Uytterhoeven 2022-11-14   152  			cache-unified;
f08407210db921 Geert Uytterhoeven 2022-11-14   153  			cache-level = <3>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   154  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   155  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   156  		L3_CA76_1: cache-controller-1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   157  			compatible = "cache";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   158  			power-domains = <&sysc R8A779G0_PD_A2E0D1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   159  			cache-unified;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   160  			cache-level = <3>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   161  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   162  	};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   163  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   164  	extal_clk: extal {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   165  		compatible = "fixed-clock";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   166  		#clock-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   167  		/* This value must be overridden by the board */
987da486d84a56 Yoshihiro Shimoda  2022-04-28   168  		clock-frequency = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   169  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   170  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   171  	extalr_clk: extalr {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   172  		compatible = "fixed-clock";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   173  		#clock-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   174  		/* This value must be overridden by the board */
987da486d84a56 Yoshihiro Shimoda  2022-04-28   175  		clock-frequency = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   176  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   177  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   178  	pcie0_clkref: pcie0-clkref {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   179  		compatible = "fixed-clock";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   180  		#clock-cells = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   181  		/* This value must be overridden by the board */
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   182  		clock-frequency = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   183  	};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   184  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   185  	pcie1_clkref: pcie1-clkref {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   186  		compatible = "fixed-clock";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   187  		#clock-cells = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   188  		/* This value must be overridden by the board */
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   189  		clock-frequency = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   190  	};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   191  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   192  	pmu_a76 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   193  		compatible = "arm,cortex-a76-pmu";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   194  		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   195  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   196  
8b93657c976a61 Geert Uytterhoeven 2024-01-15   197  	psci {
8b93657c976a61 Geert Uytterhoeven 2024-01-15   198  		compatible = "arm,psci-1.0", "arm,psci-0.2";
8b93657c976a61 Geert Uytterhoeven 2024-01-15   199  		method = "smc";
8b93657c976a61 Geert Uytterhoeven 2024-01-15   200  	};
8b93657c976a61 Geert Uytterhoeven 2024-01-15   201  
08e799f6bce80d Geert Uytterhoeven 2024-01-18   202  	/* External SCIF clocks - to be overridden by boards that provide them */
987da486d84a56 Yoshihiro Shimoda  2022-04-28   203  	scif_clk: scif {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   204  		compatible = "fixed-clock";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   205  		#clock-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   206  		clock-frequency = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   207  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   208  
08e799f6bce80d Geert Uytterhoeven 2024-01-18   209  	scif_clk2: scif2 {
08e799f6bce80d Geert Uytterhoeven 2024-01-18   210  		compatible = "fixed-clock";
08e799f6bce80d Geert Uytterhoeven 2024-01-18   211  		#clock-cells = <0>;
08e799f6bce80d Geert Uytterhoeven 2024-01-18   212  		clock-frequency = <0>;
08e799f6bce80d Geert Uytterhoeven 2024-01-18   213  	};
08e799f6bce80d Geert Uytterhoeven 2024-01-18   214  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   215  	soc: soc {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   216  		compatible = "simple-bus";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   217  		interrupt-parent = <&gic>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   218  		#address-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   219  		#size-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   220  		ranges;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   221  
a43306faeea860 Geert Uytterhoeven 2022-09-09   222  		rwdt: watchdog@e6020000 {
a43306faeea860 Geert Uytterhoeven 2022-09-09   223  			compatible = "renesas,r8a779g0-wdt",
a43306faeea860 Geert Uytterhoeven 2022-09-09   224  				     "renesas,rcar-gen4-wdt";
a43306faeea860 Geert Uytterhoeven 2022-09-09   225  			reg = <0 0xe6020000 0 0x0c>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   226  			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   227  			clocks = <&cpg CPG_MOD 907>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   228  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   229  			resets = <&cpg 907>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   230  			status = "disabled";
a43306faeea860 Geert Uytterhoeven 2022-09-09   231  		};
a43306faeea860 Geert Uytterhoeven 2022-09-09   232  
4cebce2577239f Geert Uytterhoeven 2022-09-09   233  		pfc: pinctrl@e6050000 {
4cebce2577239f Geert Uytterhoeven 2022-09-09   234  			compatible = "renesas,pfc-r8a779g0";
4cebce2577239f Geert Uytterhoeven 2022-09-09   235  			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   236  			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   237  			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   238  			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   239  			      <0 0xe6068000 0 0x16c>;
4cebce2577239f Geert Uytterhoeven 2022-09-09   240  		};
4cebce2577239f Geert Uytterhoeven 2022-09-09   241  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   242  		gpio0: gpio@e6050180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   243  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   244  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   245  			reg = <0 0xe6050180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   246  			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   247  			clocks = <&cpg CPG_MOD 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   248  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   249  			resets = <&cpg 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   250  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   251  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   252  			gpio-ranges = <&pfc 0 0 19>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   253  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   254  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   255  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   256  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   257  		gpio1: gpio@e6050980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   258  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   259  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   260  			reg = <0 0xe6050980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   261  			interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   262  			clocks = <&cpg CPG_MOD 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   263  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   264  			resets = <&cpg 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   265  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   266  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   267  			gpio-ranges = <&pfc 0 32 29>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   268  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   269  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   270  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   271  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   272  		gpio2: gpio@e6058180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   273  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   274  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   275  			reg = <0 0xe6058180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   276  			interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   277  			clocks = <&cpg CPG_MOD 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   278  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   279  			resets = <&cpg 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   280  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   281  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   282  			gpio-ranges = <&pfc 0 64 20>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   283  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   284  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   285  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   286  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   287  		gpio3: gpio@e6058980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   288  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   289  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   290  			reg = <0 0xe6058980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   291  			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   292  			clocks = <&cpg CPG_MOD 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   293  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   294  			resets = <&cpg 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   295  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   296  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   297  			gpio-ranges = <&pfc 0 96 30>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   298  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   299  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   300  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   301  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   302  		gpio4: gpio@e6060180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   303  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   304  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   305  			reg = <0 0xe6060180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   306  			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   307  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   308  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   309  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   310  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   311  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   312  			gpio-ranges = <&pfc 0 128 25>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   313  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   314  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   315  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   316  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   317  		gpio5: gpio@e6060980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   318  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   319  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   320  			reg = <0 0xe6060980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   321  			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   322  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   323  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   324  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   325  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   326  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   327  			gpio-ranges = <&pfc 0 160 21>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   328  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   329  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   330  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   331  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   332  		gpio6: gpio@e6061180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   333  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   334  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   335  			reg = <0 0xe6061180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   336  			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   337  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   338  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   339  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   340  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   341  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   342  			gpio-ranges = <&pfc 0 192 21>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   343  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   344  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   345  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   346  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   347  		gpio7: gpio@e6061980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   348  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   349  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   350  			reg = <0 0xe6061980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   351  			interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   352  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   353  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   354  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   355  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   356  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   357  			gpio-ranges = <&pfc 0 224 21>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   358  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   359  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   360  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   361  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   362  		gpio8: gpio@e6068180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   363  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   364  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   365  			reg = <0 0xe6068180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   366  			interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   367  			clocks = <&cpg CPG_MOD 918>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   368  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   369  			resets = <&cpg 918>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   370  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   371  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   372  			gpio-ranges = <&pfc 0 256 14>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   373  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   374  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   375  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   376  
40a6dd7b94172d Thanh Quan         2022-11-04   377  		cmt0: timer@e60f0000 {
40a6dd7b94172d Thanh Quan         2022-11-04   378  			compatible = "renesas,r8a779g0-cmt0",
40a6dd7b94172d Thanh Quan         2022-11-04   379  				     "renesas,rcar-gen4-cmt0";
40a6dd7b94172d Thanh Quan         2022-11-04   380  			reg = <0 0xe60f0000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   381  			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   382  				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   383  			clocks = <&cpg CPG_MOD 910>;
40a6dd7b94172d Thanh Quan         2022-11-04   384  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   385  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   386  			resets = <&cpg 910>;
40a6dd7b94172d Thanh Quan         2022-11-04   387  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   388  		};
40a6dd7b94172d Thanh Quan         2022-11-04   389  
40a6dd7b94172d Thanh Quan         2022-11-04   390  		cmt1: timer@e6130000 {
40a6dd7b94172d Thanh Quan         2022-11-04   391  			compatible = "renesas,r8a779g0-cmt1",
40a6dd7b94172d Thanh Quan         2022-11-04   392  				     "renesas,rcar-gen4-cmt1";
40a6dd7b94172d Thanh Quan         2022-11-04   393  			reg = <0 0xe6130000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   394  			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   395  				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   396  				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   397  				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   398  				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   399  				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   400  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   401  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   402  			clocks = <&cpg CPG_MOD 911>;
40a6dd7b94172d Thanh Quan         2022-11-04   403  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   404  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   405  			resets = <&cpg 911>;
40a6dd7b94172d Thanh Quan         2022-11-04   406  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   407  		};
40a6dd7b94172d Thanh Quan         2022-11-04   408  
40a6dd7b94172d Thanh Quan         2022-11-04   409  		cmt2: timer@e6140000 {
40a6dd7b94172d Thanh Quan         2022-11-04   410  			compatible = "renesas,r8a779g0-cmt1",
40a6dd7b94172d Thanh Quan         2022-11-04   411  				     "renesas,rcar-gen4-cmt1";
40a6dd7b94172d Thanh Quan         2022-11-04   412  			reg = <0 0xe6140000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   413  			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   414  				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   415  				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   416  				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   417  				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   418  				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   419  				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   420  				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   421  			clocks = <&cpg CPG_MOD 912>;
40a6dd7b94172d Thanh Quan         2022-11-04   422  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   423  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   424  			resets = <&cpg 912>;
40a6dd7b94172d Thanh Quan         2022-11-04   425  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   426  		};
40a6dd7b94172d Thanh Quan         2022-11-04   427  
40a6dd7b94172d Thanh Quan         2022-11-04   428  		cmt3: timer@e6148000 {
40a6dd7b94172d Thanh Quan         2022-11-04   429  			compatible = "renesas,r8a779g0-cmt1",
40a6dd7b94172d Thanh Quan         2022-11-04   430  				     "renesas,rcar-gen4-cmt1";
40a6dd7b94172d Thanh Quan         2022-11-04   431  			reg = <0 0xe6148000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   432  			interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   433  				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   434  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   435  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   436  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   437  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   438  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   439  				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   440  			clocks = <&cpg CPG_MOD 913>;
40a6dd7b94172d Thanh Quan         2022-11-04   441  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   442  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   443  			resets = <&cpg 913>;
40a6dd7b94172d Thanh Quan         2022-11-04   444  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   445  		};
40a6dd7b94172d Thanh Quan         2022-11-04   446  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   447  		cpg: clock-controller@e6150000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   448  			compatible = "renesas,r8a779g0-cpg-mssr";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   449  			reg = <0 0xe6150000 0 0x4000>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   450  			clocks = <&extal_clk>, <&extalr_clk>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   451  			clock-names = "extal", "extalr";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   452  			#clock-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   453  			#power-domain-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   454  			#reset-cells = <1>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   455  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   456  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   457  		rst: reset-controller@e6160000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   458  			compatible = "renesas,r8a779g0-rst";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   459  			reg = <0 0xe6160000 0 0x4000>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   460  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   461  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   462  		sysc: system-controller@e6180000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   463  			compatible = "renesas,r8a779g0-sysc";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   464  			reg = <0 0xe6180000 0 0x4000>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   465  			#power-domain-cells = <1>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   466  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   467  
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   468  		tsc: thermal@e6198000 {
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   469  			compatible = "renesas,r8a779g0-thermal";
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   470  			reg = <0 0xe6198000 0 0x200>,
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   471  			      <0 0xe61a0000 0 0x200>,
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   472  			      <0 0xe61a8000 0 0x200>,
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   473  			      <0 0xe61b0000 0 0x200>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   474  			clocks = <&cpg CPG_MOD 919>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   475  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   476  			resets = <&cpg 919>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   477  			#thermal-sensor-cells = <1>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   478  		};
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   479  
5a910676b1d68a Geert Uytterhoeven 2024-10-03   480  		otp: otp@e61be000 {
5a910676b1d68a Geert Uytterhoeven 2024-10-03   481  			compatible = "renesas,r8a779g0-otp";
5a910676b1d68a Geert Uytterhoeven 2024-10-03   482  			reg = <0 0xe61be000 0 0x1000>, <0 0xe61bf000 0 0x1000>;
5a910676b1d68a Geert Uytterhoeven 2024-10-03   483  		};
5a910676b1d68a Geert Uytterhoeven 2024-10-03   484  
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   485  		intc_ex: interrupt-controller@e61c0000 {
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   486  			compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   487  			#interrupt-cells = <2>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   488  			interrupt-controller;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   489  			reg = <0 0xe61c0000 0 0x200>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   490  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   491  				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   492  				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   493  				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   494  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   495  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   496  			clocks = <&cpg CPG_MOD 611>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   497  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   498  			resets = <&cpg 611>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   499  		};
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   500  
524789257264ca Wolfram Sang       2022-11-03   501  		tmu0: timer@e61e0000 {
524789257264ca Wolfram Sang       2022-11-03   502  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   503  			reg = <0 0xe61e0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   504  			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   505  				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   506  				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   507  			interrupt-names = "tuni0", "tuni1", "tuni2";
524789257264ca Wolfram Sang       2022-11-03   508  			clocks = <&cpg CPG_MOD 713>;
524789257264ca Wolfram Sang       2022-11-03   509  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   510  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   511  			resets = <&cpg 713>;
524789257264ca Wolfram Sang       2022-11-03   512  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   513  		};
524789257264ca Wolfram Sang       2022-11-03   514  
524789257264ca Wolfram Sang       2022-11-03   515  		tmu1: timer@e6fc0000 {
524789257264ca Wolfram Sang       2022-11-03   516  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   517  			reg = <0 0xe6fc0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   518  			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   519  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   520  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   521  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   522  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   523  			clocks = <&cpg CPG_MOD 714>;
524789257264ca Wolfram Sang       2022-11-03   524  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   525  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   526  			resets = <&cpg 714>;
524789257264ca Wolfram Sang       2022-11-03   527  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   528  		};
524789257264ca Wolfram Sang       2022-11-03   529  
524789257264ca Wolfram Sang       2022-11-03   530  		tmu2: timer@e6fd0000 {
524789257264ca Wolfram Sang       2022-11-03   531  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   532  			reg = <0 0xe6fd0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   533  			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   534  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   535  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   536  				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   537  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   538  			clocks = <&cpg CPG_MOD 715>;
524789257264ca Wolfram Sang       2022-11-03   539  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   540  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   541  			resets = <&cpg 715>;
524789257264ca Wolfram Sang       2022-11-03   542  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   543  		};
524789257264ca Wolfram Sang       2022-11-03   544  
524789257264ca Wolfram Sang       2022-11-03   545  		tmu3: timer@e6fe0000 {
524789257264ca Wolfram Sang       2022-11-03   546  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   547  			reg = <0 0xe6fe0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   548  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   549  				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   550  				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   551  				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   552  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   553  			clocks = <&cpg CPG_MOD 716>;
524789257264ca Wolfram Sang       2022-11-03   554  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   555  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   556  			resets = <&cpg 716>;
524789257264ca Wolfram Sang       2022-11-03   557  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   558  		};
524789257264ca Wolfram Sang       2022-11-03   559  
524789257264ca Wolfram Sang       2022-11-03   560  		tmu4: timer@ffc00000 {
524789257264ca Wolfram Sang       2022-11-03   561  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   562  			reg = <0 0xffc00000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   563  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   564  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   565  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   566  				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   567  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   568  			clocks = <&cpg CPG_MOD 717>;
524789257264ca Wolfram Sang       2022-11-03   569  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   570  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   571  			resets = <&cpg 717>;
524789257264ca Wolfram Sang       2022-11-03   572  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   573  		};
524789257264ca Wolfram Sang       2022-11-03   574  
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   575  		tsn0: ethernet@e6460000 {
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   576  			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   577  			reg = <0 0xe6460000 0 0x7000>,
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   578  			      <0 0xe6449000 0 0x500>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   579  			reg-names = "tsnes", "gptp";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   580  			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   581  				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   582  			interrupt-names = "tx", "rx";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   583  			clocks = <&cpg CPG_MOD 2723>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   584  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   585  			resets = <&cpg 2723>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   586  			status = "disabled";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   587  		};
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   588  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   589  		i2c0: i2c@e6500000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   590  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   591  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   592  			reg = <0 0xe6500000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   593  			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   594  			clocks = <&cpg CPG_MOD 518>;
08f282888effdf Geert Uytterhoeven 2022-09-26   595  			dmas = <&dmac0 0x91>, <&dmac0 0x90>,
08f282888effdf Geert Uytterhoeven 2022-09-26   596  			       <&dmac1 0x91>, <&dmac1 0x90>;
08f282888effdf Geert Uytterhoeven 2022-09-26   597  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   598  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   599  			resets = <&cpg 518>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   600  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   601  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   602  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   603  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   604  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   605  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   606  		i2c1: i2c@e6508000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   607  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   608  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   609  			reg = <0 0xe6508000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   610  			interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   611  			clocks = <&cpg CPG_MOD 519>;
08f282888effdf Geert Uytterhoeven 2022-09-26   612  			dmas = <&dmac0 0x93>, <&dmac0 0x92>,
08f282888effdf Geert Uytterhoeven 2022-09-26   613  			       <&dmac1 0x93>, <&dmac1 0x92>;
08f282888effdf Geert Uytterhoeven 2022-09-26   614  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   615  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   616  			resets = <&cpg 519>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   617  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   618  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   619  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   620  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   621  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   622  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   623  		i2c2: i2c@e6510000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   624  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   625  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   626  			reg = <0 0xe6510000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   627  			interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   628  			clocks = <&cpg CPG_MOD 520>;
08f282888effdf Geert Uytterhoeven 2022-09-26   629  			dmas = <&dmac0 0x95>, <&dmac0 0x94>,
08f282888effdf Geert Uytterhoeven 2022-09-26   630  			       <&dmac1 0x95>, <&dmac1 0x94>;
08f282888effdf Geert Uytterhoeven 2022-09-26   631  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   632  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   633  			resets = <&cpg 520>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   634  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   635  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   636  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   637  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   638  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   639  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   640  		i2c3: i2c@e66d0000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   641  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   642  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   643  			reg = <0 0xe66d0000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   644  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   645  			clocks = <&cpg CPG_MOD 521>;
08f282888effdf Geert Uytterhoeven 2022-09-26   646  			dmas = <&dmac0 0x97>, <&dmac0 0x96>,
08f282888effdf Geert Uytterhoeven 2022-09-26   647  			       <&dmac1 0x97>, <&dmac1 0x96>;
08f282888effdf Geert Uytterhoeven 2022-09-26   648  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   649  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   650  			resets = <&cpg 521>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   651  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   652  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   653  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   654  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   655  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   656  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   657  		i2c4: i2c@e66d8000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   658  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   659  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   660  			reg = <0 0xe66d8000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   661  			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   662  			clocks = <&cpg CPG_MOD 522>;
08f282888effdf Geert Uytterhoeven 2022-09-26   663  			dma-names = "tx", "rx", "tx", "rx";
08f282888effdf Geert Uytterhoeven 2022-09-26   664  			dmas = <&dmac0 0x99>, <&dmac0 0x98>,
08f282888effdf Geert Uytterhoeven 2022-09-26   665  			       <&dmac1 0x99>, <&dmac1 0x98>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   666  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   667  			resets = <&cpg 522>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   668  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   669  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   670  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   671  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   672  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   673  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   674  		i2c5: i2c@e66e0000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   675  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   676  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   677  			reg = <0 0xe66e0000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   678  			interrupts = <GIC_SPI 615 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   679  			clocks = <&cpg CPG_MOD 523>;
08f282888effdf Geert Uytterhoeven 2022-09-26   680  			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
08f282888effdf Geert Uytterhoeven 2022-09-26   681  			       <&dmac1 0x9b>, <&dmac1 0x9a>;
08f282888effdf Geert Uytterhoeven 2022-09-26   682  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   683  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   684  			resets = <&cpg 523>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   685  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   686  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   687  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   688  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   689  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   690  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   691  		hscif0: serial@e6540000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   692  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   693  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   694  			reg = <0 0xe6540000 0 0x60>;
ab2866f12ca187 Geert Uytterhoeven 2022-08-25   695  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   696  			clocks = <&cpg CPG_MOD 514>,
a4290d407aa9fd Geert Uytterhoeven 2022-10-07   697  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
987da486d84a56 Yoshihiro Shimoda  2022-04-28   698  				 <&scif_clk>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   699  			clock-names = "fck", "brg_int", "scif_clk";
08f282888effdf Geert Uytterhoeven 2022-09-26   700  			dmas = <&dmac0 0x31>, <&dmac0 0x30>,
08f282888effdf Geert Uytterhoeven 2022-09-26   701  			       <&dmac1 0x31>, <&dmac1 0x30>;
08f282888effdf Geert Uytterhoeven 2022-09-26   702  			dma-names = "tx", "rx", "tx", "rx";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   703  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   704  			resets = <&cpg 514>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   705  			status = "disabled";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   706  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   707  
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   708  		hscif1: serial@e6550000 {
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   709  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   710  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   711  			reg = <0 0xe6550000 0 0x60>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   712  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   713  			clocks = <&cpg CPG_MOD 515>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   714  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   715  				 <&scif_clk>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   716  			clock-names = "fck", "brg_int", "scif_clk";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   717  			dmas = <&dmac0 0x33>, <&dmac0 0x32>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   718  			       <&dmac1 0x33>, <&dmac1 0x32>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   719  			dma-names = "tx", "rx", "tx", "rx";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   720  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   721  			resets = <&cpg 515>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   722  			status = "disabled";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   723  		};
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   724  
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   725  		hscif2: serial@e6560000 {
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   726  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   727  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   728  			reg = <0 0xe6560000 0 0x60>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   729  			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   730  			clocks = <&cpg CPG_MOD 516>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   731  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
08e799f6bce80d Geert Uytterhoeven 2024-01-18   732  				 <&scif_clk2>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   733  			clock-names = "fck", "brg_int", "scif_clk";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   734  			dmas = <&dmac0 0x35>, <&dmac0 0x34>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   735  			       <&dmac1 0x35>, <&dmac1 0x34>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   736  			dma-names = "tx", "rx", "tx", "rx";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   737  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   738  			resets = <&cpg 516>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   739  			status = "disabled";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   740  		};
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   741  
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   742  		hscif3: serial@e66a0000 {
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   743  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   744  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   745  			reg = <0 0xe66a0000 0 0x60>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   746  			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   747  			clocks = <&cpg CPG_MOD 517>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   748  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   749  				 <&scif_clk>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   750  			clock-names = "fck", "brg_int", "scif_clk";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   751  			dmas = <&dmac0 0x37>, <&dmac0 0x36>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   752  			       <&dmac1 0x37>, <&dmac1 0x36>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   753  			dma-names = "tx", "rx", "tx", "rx";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   754  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   755  			resets = <&cpg 517>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   756  			status = "disabled";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   757  		};
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   758  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   759  		pciec0: pcie@e65d0000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   760  			compatible = "renesas,r8a779g0-pcie",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   761  				     "renesas,rcar-gen4-pcie";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   762  			reg = <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   763  			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   764  			      <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   765  			      <0 0xfe000000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   766  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   767  			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   768  				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   769  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   770  				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   771  			interrupt-names = "msi", "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   772  			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   773  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   774  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   775  			resets = <&cpg 624>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   776  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   777  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   778  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   779  			#address-cells = <3>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   780  			#size-cells = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   781  			bus-range = <0x00 0xff>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   782  			device_type = "pci";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   783  			ranges = <0x01000000 0 0x00000000 0 0xfe000000 0 0x00400000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   784  				 <0x02000000 0 0x30000000 0 0x30000000 0 0x10000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   785  			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   786  			#interrupt-cells = <1>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   787  			interrupt-map-mask = <0 0 0 7>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   788  			interrupt-map = <0 0 0 1 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   789  					<0 0 0 2 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   790  					<0 0 0 3 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   791  					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   792  			snps,enable-cdm-check;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   793  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   794  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   795  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   796  		pciec1: pcie@e65d8000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   797  			compatible = "renesas,r8a779g0-pcie",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   798  				     "renesas,rcar-gen4-pcie";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   799  			reg = <0 0xe65d8000 0 0x1000>, <0 0xe65da000 0 0x0800>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   800  			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   801  			      <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   802  			      <0 0xee900000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   803  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   804  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   805  				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   806  				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   807  				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   808  			interrupt-names = "msi", "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   809  			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   810  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   811  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   812  			resets = <&cpg 625>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   813  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   814  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   815  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   816  			#address-cells = <3>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   817  			#size-cells = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   818  			bus-range = <0x00 0xff>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   819  			device_type = "pci";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   820  			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00400000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   821  				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x10000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   822  			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   823  			#interrupt-cells = <1>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   824  			interrupt-map-mask = <0 0 0 7>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   825  			interrupt-map = <0 0 0 1 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   826  					<0 0 0 2 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   827  					<0 0 0 3 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   828  					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   829  			snps,enable-cdm-check;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   830  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   831  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   832  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   833  		pciec0_ep: pcie-ep@e65d0000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   834  			compatible = "renesas,r8a779g0-pcie-ep",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   835  				     "renesas,rcar-gen4-pcie-ep";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   836  			reg = <0 0xe65d0000 0 0x2000>, <0 0xe65d2000 0 0x1000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   837  			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   838  			      <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   839  			      <0 0xfe000000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   840  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "addr_space";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   841  			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   842  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   843  				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   844  			interrupt-names = "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   845  			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   846  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   847  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   848  			resets = <&cpg 624>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   849  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   850  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   851  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   852  			max-functions = /bits/ 8 <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   853  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   854  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   855  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   856  		pciec1_ep: pcie-ep@e65d8000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   857  			compatible = "renesas,r8a779g0-pcie-ep",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   858  				     "renesas,rcar-gen4-pcie-ep";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   859  			reg = <0 0xe65d8000 0 0x2000>, <0 0xe65da000 0 0x1000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   860  			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   861  			      <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   862  			      <0 0xee900000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   863  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "addr_space";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   864  			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   865  				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   866  				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   867  			interrupt-names = "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   868  			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   869  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   870  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   871  			resets = <&cpg 625>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   872  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   873  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   874  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   875  			max-functions = /bits/ 8 <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   876  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   877  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   878  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   879  		canfd: can@e6660000 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   880  			compatible = "renesas,r8a779g0-canfd",
5056a0c7286237 Geert Uytterhoeven 2023-01-23   881  				     "renesas,rcar-gen4-canfd";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   882  			reg = <0 0xe6660000 0 0x8500>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   883  			interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
5056a0c7286237 Geert Uytterhoeven 2023-01-23   884  				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   885  			interrupt-names = "ch_int", "g_int";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   886  			clocks = <&cpg CPG_MOD 328>,
5056a0c7286237 Geert Uytterhoeven 2023-01-23   887  				 <&cpg CPG_CORE R8A779G0_CLK_CANFD>,
5056a0c7286237 Geert Uytterhoeven 2023-01-23   888  				 <&can_clk>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   889  			clock-names = "fck", "canfd", "can_clk";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   890  			assigned-clocks = <&cpg CPG_CORE R8A779G0_CLK_CANFD>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   891  			assigned-clock-rates = <80000000>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   892  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   893  			resets = <&cpg 328>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   894  			status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   895  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   896  			channel0 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   897  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   898  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   899  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   900  			channel1 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   901  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   902  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   903  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   904  			channel2 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   905  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   906  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   907  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   908  			channel3 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   909  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   910  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   911  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   912  			channel4 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   913  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   914  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   915  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   916  			channel5 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   917  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   918  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   919  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   920  			channel6 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   921  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   922  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   923  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   924  			channel7 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   925  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   926  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   927  		};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   928  
848c82db56923a Geert Uytterhoeven 2022-09-09   929  		avb0: ethernet@e6800000 {
848c82db56923a Geert Uytterhoeven 2022-09-09   930  			compatible = "renesas,etheravb-r8a779g0",
848c82db56923a Geert Uytterhoeven 2022-09-09   931  				     "renesas,etheravb-rcar-gen4";
7edbb5880dc331 Geert Uytterhoeven 2024-02-11   932  			reg = <0 0xe6800000 0 0x1000>;
848c82db56923a Geert Uytterhoeven 2022-09-09   933  			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   934  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   935  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   936  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   937  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   938  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   939  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   940  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   941  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   942  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   943  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   944  				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   945  				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   946  				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   947  				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   948  				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   949  				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   950  				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   951  				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   952  				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   953  				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   954  				     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   955  				     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   956  				     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   957  				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
848c82db56923a Geert Uytterhoeven 2022-09-09   958  			interrupt-names = "ch0", "ch1", "ch2", "ch3", "ch4",
848c82db56923a Geert Uytterhoeven 2022-09-09   959  					  "ch5", "ch6", "ch7", "ch8", "ch9",
848c82db56923a Geert Uytterhoeven 2022-09-09   960  					  "ch10", "ch11", "ch12", "ch13",
848c82db56923a Geert Uytterhoeven 2022-09-09   961  					  "ch14", "ch15", "ch16", "ch17",
848c82db56923a Geert Uytterhoeven 2022-09-09   962  					  "ch18", "ch19", "ch20", "ch21",
848c82db56923a Geert Uytterhoeven 2022-09-09   963  					  "ch22", "ch23", "ch24";
848c82db56923a Geert Uytterhoeven 2022-09-09   964  			clocks = <&cpg CPG_MOD 211>;
848c82db56923a Geert Uytterhoeven 2022-09-09   965  			clock-names = "fck";
848c82db56923a Geert Uytterhoeven 2022-09-09   966  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
848c82db56923a Geert Uytterhoeven 2022-09-09   967  			resets = <&cpg 211>;
848c82db56923a Geert Uytterhoeven 2022-09-09   968  			phy-mode = "rgmii";
848c82db56923a Geert Uytterhoeven 2022-09-09   969  			rx-internal-delay-ps = <0>;
848c82db56923a Geert Uytterhoeven 2022-09-09   970  			tx-internal-delay-ps = <0>;
c313c77babc72b Geert Uytterhoeven 2024-07-08   971  			iommus = <&ipmmu_hc 0>;
848c82db56923a Geert Uytterhoeven 2022-09-09   972  			status = "disabled";
848c82db56923a Geert Uytterhoeven 2022-09-09   973  		};
848c82db56923a Geert Uytterhoeven 2022-09-09   974  
848c82db56923a Geert Uytterhoeven 2022-09-09   975  		avb1: ethernet@e6810000 {
848c82db56923a Geert Uytterhoeven 2022-09-09   976  			compatible = "renesas,etheravb-r8a779g0",
848c82db56923a Geert Uytterhoeven 2022-09-09   977  				     "renesas,etheravb-rcar-gen4";
7edbb5880dc331 Geert Uytterhoeven 2024-02-11   978  			reg = <0 0xe6810000 0 0x1000>;
848c82db56923a Geert Uytterhoeven 2022-09-09   979  			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   980  				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   981  				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   982  				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   983  				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   984  				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   985  				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   986  				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   987  				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   988  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   989  				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   990  				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   991  				     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   992  				     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   993  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   994  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   995  				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   996  				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   997  				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   998  				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   999  				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1000  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1001  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1002  				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1003  				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1004  			interrupt-names = "ch0", "ch1", "ch2", "ch3", "ch4",
848c82db56923a Geert Uytterhoeven 2022-09-09  1005  					  "ch5", "ch6", "ch7", "ch8", "ch9",
848c82db56923a Geert Uytterhoeven 2022-09-09  1006  					  "ch10", "ch11", "ch12", "ch13",
848c82db56923a Geert Uytterhoeven 2022-09-09  1007  					  "ch14", "ch15", "ch16", "ch17",
848c82db56923a Geert Uytterhoeven 2022-09-09  1008  					  "ch18", "ch19", "ch20", "ch21",
848c82db56923a Geert Uytterhoeven 2022-09-09  1009  					  "ch22", "ch23", "ch24";
848c82db56923a Geert Uytterhoeven 2022-09-09  1010  			clocks = <&cpg CPG_MOD 212>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1011  			clock-names = "fck";
848c82db56923a Geert Uytterhoeven 2022-09-09  1012  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1013  			resets = <&cpg 212>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1014  			phy-mode = "rgmii";
848c82db56923a Geert Uytterhoeven 2022-09-09  1015  			rx-internal-delay-ps = <0>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1016  			tx-internal-delay-ps = <0>;
c313c77babc72b Geert Uytterhoeven 2024-07-08  1017  			iommus = <&ipmmu_hc 1>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1018  			status = "disabled";
848c82db56923a Geert Uytterhoeven 2022-09-09  1019  		};
848c82db56923a Geert Uytterhoeven 2022-09-09  1020  
848c82db56923a Geert Uytterhoeven 2022-09-09  1021  		avb2: ethernet@e6820000 {
848c82db56923a Geert Uytterhoeven 2022-09-09  1022  			compatible = "renesas,etheravb-r8a779g0",
848c82db56923a Geert Uytterhoeven 2022-09-09  1023  				     "renesas,etheravb-rcar-gen4";
848c82db56923a Geert Uytterhoeven 2022-09-09  1024  			reg = <0 0xe6820000 0 0x1000>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1025  			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1026  				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1027  				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1028  				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1029  				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1030  				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1031  				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1032  				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1033  				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1034  				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1035  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1036  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1037  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1038  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1039  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1040  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1041  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1042  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1043  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1044  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1045  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1046  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1047  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1048  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1049  				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1050  			interrupt-names = "ch0", "ch1", "ch2", "ch3", "ch4",
848c82db56923a Geert Uytterhoeven 2022-09-09  1051  					  "ch5", "ch6", "ch7", "ch8", "ch9",
848c82db56923a Geert Uytterhoeven 2022-09-09  1052  					  "ch10", "ch11", "ch12", "ch13",
848c82db56923a Geert Uytterhoeven 2022-09-09  1053  					  "ch14", "ch15", "ch16", "ch17",
848c82db56923a Geert Uytterhoeven 2022-09-09  1054  					  "ch18", "ch19", "ch20", "ch21",
848c82db56923a Geert Uytterhoeven 2022-09-09  1055  					  "ch22", "ch23", "ch24";
848c82db56923a Geert Uytterhoeven 2022-09-09  1056  			clocks = <&cpg CPG_MOD 213>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1057  			clock-names = "fck";
848c82db56923a Geert Uytterhoeven 2022-09-09  1058  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1059  			resets = <&cpg 213>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1060  			phy-mode = "rgmii";
848c82db56923a Geert Uytterhoeven 2022-09-09  1061  			rx-internal-delay-ps = <0>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1062  			tx-internal-delay-ps = <0>;
c313c77babc72b Geert Uytterhoeven 2024-07-08  1063  			iommus = <&ipmmu_hc 2>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1064  			status = "disabled";
848c82db56923a Geert Uytterhoeven 2022-09-09  1065  		};
848c82db56923a Geert Uytterhoeven 2022-09-09  1066  
5b9d1306ef463f CongDang           2022-10-07  1067  		pwm0: pwm@e6e30000 {
5b9d1306ef463f CongDang           2022-10-07  1068  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1069  			reg = <0 0xe6e30000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1070  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1071  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1072  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1073  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1074  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1075  		};
5b9d1306ef463f CongDang           2022-10-07  1076  
5b9d1306ef463f CongDang           2022-10-07  1077  		pwm1: pwm@e6e31000 {
5b9d1306ef463f CongDang           2022-10-07  1078  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1079  			reg = <0 0xe6e31000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1080  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1081  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1082  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1083  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1084  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1085  		};
5b9d1306ef463f CongDang           2022-10-07  1086  
5b9d1306ef463f CongDang           2022-10-07  1087  		pwm2: pwm@e6e32000 {
5b9d1306ef463f CongDang           2022-10-07  1088  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1089  			reg = <0 0xe6e32000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1090  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1091  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1092  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1093  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1094  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1095  		};
5b9d1306ef463f CongDang           2022-10-07  1096  
5b9d1306ef463f CongDang           2022-10-07  1097  		pwm3: pwm@e6e33000 {
5b9d1306ef463f CongDang           2022-10-07  1098  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1099  			reg = <0 0xe6e33000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1100  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1101  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1102  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1103  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1104  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1105  		};
5b9d1306ef463f CongDang           2022-10-07  1106  
5b9d1306ef463f CongDang           2022-10-07  1107  		pwm4: pwm@e6e34000 {
5b9d1306ef463f CongDang           2022-10-07  1108  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1109  			reg = <0 0xe6e34000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1110  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1111  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1112  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1113  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1114  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1115  		};
5b9d1306ef463f CongDang           2022-10-07  1116  
5b9d1306ef463f CongDang           2022-10-07  1117  		pwm5: pwm@e6e35000 {
5b9d1306ef463f CongDang           2022-10-07  1118  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1119  			reg = <0 0xe6e35000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1120  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1121  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1122  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1123  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1124  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1125  		};
5b9d1306ef463f CongDang           2022-10-07  1126  
5b9d1306ef463f CongDang           2022-10-07  1127  		pwm6: pwm@e6e36000 {
5b9d1306ef463f CongDang           2022-10-07  1128  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1129  			reg = <0 0xe6e36000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1130  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1131  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1132  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1133  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1134  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1135  		};
5b9d1306ef463f CongDang           2022-10-07  1136  
5b9d1306ef463f CongDang           2022-10-07  1137  		pwm7: pwm@e6e37000 {
5b9d1306ef463f CongDang           2022-10-07  1138  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1139  			reg = <0 0xe6e37000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1140  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1141  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1142  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1143  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1144  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1145  		};
5b9d1306ef463f CongDang           2022-10-07  1146  
5b9d1306ef463f CongDang           2022-10-07  1147  		pwm8: pwm@e6e38000 {
5b9d1306ef463f CongDang           2022-10-07  1148  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1149  			reg = <0 0xe6e38000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1150  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1151  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1152  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1153  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1154  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1155  		};
5b9d1306ef463f CongDang           2022-10-07  1156  
5b9d1306ef463f CongDang           2022-10-07  1157  		pwm9: pwm@e6e39000 {
5b9d1306ef463f CongDang           2022-10-07  1158  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1159  			reg = <0 0xe6e39000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1160  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1161  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1162  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1163  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1164  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1165  		};
5b9d1306ef463f CongDang           2022-10-07  1166  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1167  		scif0: serial@e6e60000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1168  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1169  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1170  			reg = <0 0xe6e60000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1171  			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1172  			clocks = <&cpg CPG_MOD 702>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1173  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1174  				 <&scif_clk>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1175  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1176  			dmas = <&dmac0 0x51>, <&dmac0 0x50>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1177  			       <&dmac1 0x51>, <&dmac1 0x50>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1178  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1179  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1180  			resets = <&cpg 702>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1181  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1182  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1183  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1184  		scif1: serial@e6e68000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1185  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1186  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1187  			reg = <0 0xe6e68000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1188  			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1189  			clocks = <&cpg CPG_MOD 703>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1190  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1191  				 <&scif_clk>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1192  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1193  			dmas = <&dmac0 0x53>, <&dmac0 0x52>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1194  			       <&dmac1 0x53>, <&dmac1 0x52>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1195  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1196  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1197  			resets = <&cpg 703>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1198  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1199  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1200  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1201  		scif3: serial@e6c50000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1202  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1203  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1204  			reg = <0 0xe6c50000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1205  			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1206  			clocks = <&cpg CPG_MOD 704>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1207  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1208  				 <&scif_clk>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1209  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1210  			dmas = <&dmac0 0x57>, <&dmac0 0x56>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1211  			       <&dmac1 0x57>, <&dmac1 0x56>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1212  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1213  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1214  			resets = <&cpg 704>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1215  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1216  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1217  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1218  		scif4: serial@e6c40000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1219  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1220  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1221  			reg = <0 0xe6c40000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1222  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1223  			clocks = <&cpg CPG_MOD 705>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1224  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
08e799f6bce80d Geert Uytterhoeven 2024-01-18  1225  				 <&scif_clk2>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1226  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1227  			dmas = <&dmac0 0x59>, <&dmac0 0x58>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1228  			       <&dmac1 0x59>, <&dmac1 0x58>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1229  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1230  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1231  			resets = <&cpg 705>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1232  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1233  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1234  
4a76d4ab8487aa CongDang           2022-10-07  1235  		tpu: pwm@e6e80000 {
4a76d4ab8487aa CongDang           2022-10-07  1236  			compatible = "renesas,tpu-r8a779g0", "renesas,tpu";
4a76d4ab8487aa CongDang           2022-10-07  1237  			reg = <0 0xe6e80000 0 0x148>;
4a76d4ab8487aa CongDang           2022-10-07  1238  			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
4a76d4ab8487aa CongDang           2022-10-07  1239  			clocks = <&cpg CPG_MOD 718>;
4a76d4ab8487aa CongDang           2022-10-07  1240  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
4a76d4ab8487aa CongDang           2022-10-07  1241  			resets = <&cpg 718>;
4a76d4ab8487aa CongDang           2022-10-07  1242  			#pwm-cells = <3>;
4a76d4ab8487aa CongDang           2022-10-07  1243  			status = "disabled";
4a76d4ab8487aa CongDang           2022-10-07  1244  		};
4a76d4ab8487aa CongDang           2022-10-07  1245  
e076807315cb62 Geert Uytterhoeven 2022-09-26  1246  		msiof0: spi@e6e90000 {
e076807315cb62 Geert Uytterhoeven 2022-09-26  1247  			compatible = "renesas,msiof-r8a779g0",
e076807315cb62 Geert Uytterhoeven 2022-09-26  1248  				     "renesas,rcar-gen4-msiof";
e076807315cb62 Geert Uytterhoeven 2022-09-26  1249  			reg = <0 0xe6e90000 0 0x0064>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1250  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1251  			clocks = <&cpg CPG_MOD 618>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1252  			dmas = <&dmac0 0x41>, <&dmac0 0x40>,
e076807315cb62 Geert Uytterhoeven 2022-09-26  1253  			       <&dmac1 0x41>, <&dmac1 0x40>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1254  			dma-names = "tx", "rx", "tx", "rx";
e076807315cb62 Geert Uytterhoeven 2022-09-26  1255  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1256  			resets = <&cpg 618>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1257  			#address-cells = <1>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1258  			#size-cells = <0>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1259  			status = "disabled";
e076807315cb62 Geert Uytterhoeven 2022-09-26  1260  		};
e076807315cb62 Geert Uytterhoeven 2022-09-26  1261  
e076807315cb62 Geert Uytterhoeven 2022-09-26 @1262  		msiof1: spi@e6ea0000 {

:::::: The code at line 1262 was first introduced by commit
:::::: e076807315cb62ec3bc94f9a473bcb0caf4f2760 arm64: dts: renesas: r8a779g0: Add MSIOF nodes

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
