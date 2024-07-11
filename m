Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DD55C1A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720727393; cv=none; b=QxPxO0mFFcnG3OJ1RD7SjxuriSnkwpaz819Wn0+hAzCyLM64jlROpjDrGg/3YWlQAYYlBR3jUFyv7lk7Oga8qsQ7HAU9135vmUQbkreIJ/Z31DyJbkz4+knlIHXw/sZBWWuAzx76cro/Ft7SXQL+/pTx/7U1yVcp1Ilh+EvR2TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720727393; c=relaxed/simple;
	bh=E95ppV/yY/vFjdwBDbofopqfeidv74I82oxdTggNQNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NgBXpmVz+geCpZ8G8By2PWWNWAxtrPVtBnxPTrrCOELHAlnTo+Tdm2RTZJCq22O2dqotrkWnWdiNhJW0fc98kzaI4st6AwzOMIP3BtmJ6PkYAkGfjSooo0IxGLcPcHzplJffjBdmu4H9EoK++U42hDwZeK1E4sRhHqMBKeV8WsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+/0Wbuy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+/0Wbuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720727388; x=1752263388;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E95ppV/yY/vFjdwBDbofopqfeidv74I82oxdTggNQNQ=;
  b=W+/0WbuyGhGqwnBJizBMMobEW5JUkeBXJRMcj2IwPilw/8EE+NCHkX06
   rBaLLcnEIzNS9NmaRaqA23wq6Jz9t67f+5EuU0J2K3gA0//WDy16sxNIW
   E9LgN/J+0Nx23RJg+oM7nO7lPaLyugglbYcMKvYggMPYjMzHCroWXqvkS
   ttfpY2Br6ONU9VSvkXJHMCcmSUBp6cumo8LMQdaIIbOVEKQnZ6ckVMF+l
   AER3pFkmbJ8snz7apaVbZb7j1tlxzZyXxzHJWYntIH/FpFzxKFYjfzaxZ
   yTb83WwgZOaK3VuK2S1vBnPi1KzJsRT+W2e40q60sK89EbzHofj4Tcl5C
   w==;
X-CSE-ConnectionGUID: LFfenXjdRAiPfSRDosEjuQ==
X-CSE-MsgGUID: 5grsH+ivSmWlYeob5KB6UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29551629"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="29551629"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 12:49:47 -0700
X-CSE-ConnectionGUID: 6LD6koA7R6Ou4lNyqSxFQw==
X-CSE-MsgGUID: kSu42NwoSdWW9IZKzmpIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="79365698"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2024 12:49:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRznT-000Zpm-1w;
	Thu, 11 Jul 2024 19:49:43 +0000
Date: Fri, 12 Jul 2024 03:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: layerscape: move dwc3 usb under glue
 layer node
Message-ID: <202407120322.GhbUFf3n-lkp@intel.com>
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
In-Reply-To: <20240710-ls-dwc-v1-3-62f8cbed31d7@nxp.com>
References: <20240710-ls-dwc-v1-3-62f8cbed31d7@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: Shawn Guo <shawnguo@kernel.org>
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e60284b63245b84c3ae352427ed5ff8b79266b91]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-usb-Add-fsl-ls-dwc3-yaml-for-layerscape-usb3-glue-layer/20240711-092945
base:   e60284b63245b84c3ae352427ed5ff8b79266b91
patch link:    https://lore.kernel.org/r/20240710-ls-dwc-v1-3-62f8cbed31d7%40nxp.com
patch subject: [PATCH 3/3] arm64: dts: layerscape: move dwc3 usb under glue layer node
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-004-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120322.GhbUFf3n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120322.GhbUFf3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407120322.GhbUFf3n-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi:618.7-645.5: Warning (simple_bus_reg): /soc/usb: missing or empty reg/ranges property

vim +618 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi

8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    14  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    15  / {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    16  	compatible = "fsl,ls1028a";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    17  	interrupt-parent = <&gic>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    18  	#address-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    19  	#size-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    20  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    21  	cpus {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    22  		#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    23  		#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    24  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    25  		cpu0: cpu@0 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    26  			device_type = "cpu";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    27  			compatible = "arm,cortex-a72";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    28  			reg = <0x0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    29  			enable-method = "psci";
99314eb13c74b1 Michael Walle       2020-12-29    30  			clocks = <&clockgen QORIQ_CLK_CMUX 0>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    31  			i-cache-size = <0xc000>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    32  			i-cache-line-size = <64>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    33  			i-cache-sets = <256>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    34  			d-cache-size = <0x8000>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    35  			d-cache-line-size = <64>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    36  			d-cache-sets = <256>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    37  			next-level-cache = <&l2>;
53f2ac9d3aa881 Ran Wang            2019-05-17    38  			cpu-idle-states = <&CPU_PW20>;
571cebfe8e2b86 Yuantian Tang       2019-08-06    39  			#cooling-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    40  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    41  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    42  		cpu1: cpu@1 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    43  			device_type = "cpu";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    44  			compatible = "arm,cortex-a72";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    45  			reg = <0x1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    46  			enable-method = "psci";
99314eb13c74b1 Michael Walle       2020-12-29    47  			clocks = <&clockgen QORIQ_CLK_CMUX 0>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    48  			i-cache-size = <0xc000>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    49  			i-cache-line-size = <64>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    50  			i-cache-sets = <256>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    51  			d-cache-size = <0x8000>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    52  			d-cache-line-size = <64>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    53  			d-cache-sets = <256>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    54  			next-level-cache = <&l2>;
53f2ac9d3aa881 Ran Wang            2019-05-17    55  			cpu-idle-states = <&CPU_PW20>;
571cebfe8e2b86 Yuantian Tang       2019-08-06    56  			#cooling-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    57  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    58  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    59  		l2: l2-cache {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    60  			compatible = "cache";
3b450831e5f1af Pierre Gondois      2022-11-07    61  			cache-level = <2>;
c290d09a998c81 Krzysztof Kozlowski 2023-04-22    62  			cache-unified;
fcf7ff67a2aa6d Hui Wang            2023-07-31    63  			cache-size = <0x100000>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    64  			cache-line-size = <64>;
fcf7ff67a2aa6d Hui Wang            2023-07-31    65  			cache-sets = <1024>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    66  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    67  	};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    68  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    69  	idle-states {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    70  		/*
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    71  		 * PSCI node is not added default, U-boot will add missing
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    72  		 * parts if it determines to use PSCI.
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    73  		 */
9b631649c43672 Linus Walleij       2020-03-22    74  		entry-method = "psci";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    75  
53f2ac9d3aa881 Ran Wang            2019-05-17    76  		CPU_PW20: cpu-pw20 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    77  			  compatible = "arm,idle-state";
53f2ac9d3aa881 Ran Wang            2019-05-17    78  			  idle-state-name = "PW20";
53f2ac9d3aa881 Ran Wang            2019-05-17    79  			  arm,psci-suspend-param = <0x0>;
53f2ac9d3aa881 Ran Wang            2019-05-17    80  			  entry-latency-us = <2000>;
53f2ac9d3aa881 Ran Wang            2019-05-17    81  			  exit-latency-us = <2000>;
53f2ac9d3aa881 Ran Wang            2019-05-17    82  			  min-residency-us = <6000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    83  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    84  	};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    85  
71799672ea24d2 Biwen Li            2021-12-14    86  	rtc_clk: rtc-clk {
71799672ea24d2 Biwen Li            2021-12-14    87  		compatible = "fixed-clock";
71799672ea24d2 Biwen Li            2021-12-14    88  		#clock-cells = <0>;
71799672ea24d2 Biwen Li            2021-12-14    89  		clock-frequency = <32768>;
71799672ea24d2 Biwen Li            2021-12-14    90  		clock-output-names = "rtc_clk";
71799672ea24d2 Biwen Li            2021-12-14    91  	};
71799672ea24d2 Biwen Li            2021-12-14    92  
7e71b85473f863 Vladimir Oltean     2021-06-08    93  	sysclk: sysclk {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    94  		compatible = "fixed-clock";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    95  		#clock-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    96  		clock-frequency = <100000000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    97  		clock-output-names = "sysclk";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    98  	};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14    99  
81f36887ea337b Wen He              2019-08-12   100  	osc_27m: clock-osc-27m {
7f538f199f71b0 Wen He              2019-05-10   101  		compatible = "fixed-clock";
7f538f199f71b0 Wen He              2019-05-10   102  		#clock-cells = <0>;
7f538f199f71b0 Wen He              2019-05-10   103  		clock-frequency = <27000000>;
81f36887ea337b Wen He              2019-08-12   104  		clock-output-names = "phy_27m";
81f36887ea337b Wen He              2019-08-12   105  	};
81f36887ea337b Wen He              2019-08-12   106  
f90931aeefe3f3 Michael Walle       2020-11-15   107  	firmware {
c67b761aac6cb4 Sahil Malhotra      2021-03-30   108  		optee: optee  {
f90931aeefe3f3 Michael Walle       2020-11-15   109  			compatible = "linaro,optee-tz";
f90931aeefe3f3 Michael Walle       2020-11-15   110  			method = "smc";
f90931aeefe3f3 Michael Walle       2020-11-15   111  			status = "disabled";
f90931aeefe3f3 Michael Walle       2020-11-15   112  		};
f90931aeefe3f3 Michael Walle       2020-11-15   113  	};
f90931aeefe3f3 Michael Walle       2020-11-15   114  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   115  	reboot {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   116  		compatible = "syscon-reboot";
3f0fb37b22b460 Michael Walle       2019-12-11   117  		regmap = <&rst>;
1653e3d470629d Michael Walle       2020-12-15   118  		offset = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   119  		mask = <0x02>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   120  	};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   121  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   122  	timer {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   123  		compatible = "arm,armv8-timer";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   124  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   125  					  IRQ_TYPE_LEVEL_LOW)>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   126  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   127  					  IRQ_TYPE_LEVEL_LOW)>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   128  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   129  					  IRQ_TYPE_LEVEL_LOW)>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   130  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   131  					  IRQ_TYPE_LEVEL_LOW)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   132  	};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   133  
b9eb314ae888a7 Alison Wang         2019-03-06   134  	pmu {
b9eb314ae888a7 Alison Wang         2019-03-06   135  		compatible = "arm,cortex-a72-pmu";
b9eb314ae888a7 Alison Wang         2019-03-06   136  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
b9eb314ae888a7 Alison Wang         2019-03-06   137  	};
b9eb314ae888a7 Alison Wang         2019-03-06   138  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   139  	gic: interrupt-controller@6000000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   140  		compatible = "arm,gic-v3";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   141  		#address-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   142  		#size-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   143  		ranges;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   144  		reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   145  			<0x0 0x06040000 0 0x40000>; /* GIC Redistributor */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   146  		#interrupt-cells = <3>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   147  		interrupt-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   148  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   149  					 IRQ_TYPE_LEVEL_LOW)>;
04b09f6e5d0051 Rob Herring         2023-02-08   150  		its: msi-controller@6020000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   151  			compatible = "arm,gic-v3-its";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   152  			msi-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   153  			reg = <0x0 0x06020000 0 0x20000>;/* GIC Translater */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   154  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   155  	};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   156  
68e36a429ef5df Fabio Estevam       2019-10-25   157  	thermal-zones {
3269c178b7a11d Yuantian Tang       2020-05-25   158  		ddr-controller {
68e36a429ef5df Fabio Estevam       2019-10-25   159  			polling-delay-passive = <1000>;
68e36a429ef5df Fabio Estevam       2019-10-25   160  			polling-delay = <5000>;
68e36a429ef5df Fabio Estevam       2019-10-25   161  			thermal-sensors = <&tmu 0>;
68e36a429ef5df Fabio Estevam       2019-10-25   162  
3269c178b7a11d Yuantian Tang       2020-05-25   163  			trips {
3269c178b7a11d Yuantian Tang       2020-05-25   164  				ddr-ctrler-alert {
3269c178b7a11d Yuantian Tang       2020-05-25   165  					temperature = <85000>;
3269c178b7a11d Yuantian Tang       2020-05-25   166  					hysteresis = <2000>;
3269c178b7a11d Yuantian Tang       2020-05-25   167  					type = "passive";
3269c178b7a11d Yuantian Tang       2020-05-25   168  				};
3269c178b7a11d Yuantian Tang       2020-05-25   169  
3269c178b7a11d Yuantian Tang       2020-05-25   170  				ddr-ctrler-crit {
3269c178b7a11d Yuantian Tang       2020-05-25   171  					temperature = <95000>;
3269c178b7a11d Yuantian Tang       2020-05-25   172  					hysteresis = <2000>;
3269c178b7a11d Yuantian Tang       2020-05-25   173  					type = "critical";
3269c178b7a11d Yuantian Tang       2020-05-25   174  				};
3269c178b7a11d Yuantian Tang       2020-05-25   175  			};
3269c178b7a11d Yuantian Tang       2020-05-25   176  		};
3269c178b7a11d Yuantian Tang       2020-05-25   177  
3269c178b7a11d Yuantian Tang       2020-05-25   178  		core-cluster {
3269c178b7a11d Yuantian Tang       2020-05-25   179  			polling-delay-passive = <1000>;
3269c178b7a11d Yuantian Tang       2020-05-25   180  			polling-delay = <5000>;
3269c178b7a11d Yuantian Tang       2020-05-25   181  			thermal-sensors = <&tmu 1>;
3269c178b7a11d Yuantian Tang       2020-05-25   182  
68e36a429ef5df Fabio Estevam       2019-10-25   183  			trips {
68e36a429ef5df Fabio Estevam       2019-10-25   184  				core_cluster_alert: core-cluster-alert {
68e36a429ef5df Fabio Estevam       2019-10-25   185  					temperature = <85000>;
68e36a429ef5df Fabio Estevam       2019-10-25   186  					hysteresis = <2000>;
68e36a429ef5df Fabio Estevam       2019-10-25   187  					type = "passive";
68e36a429ef5df Fabio Estevam       2019-10-25   188  				};
68e36a429ef5df Fabio Estevam       2019-10-25   189  
68e36a429ef5df Fabio Estevam       2019-10-25   190  				core_cluster_crit: core-cluster-crit {
68e36a429ef5df Fabio Estevam       2019-10-25   191  					temperature = <95000>;
68e36a429ef5df Fabio Estevam       2019-10-25   192  					hysteresis = <2000>;
68e36a429ef5df Fabio Estevam       2019-10-25   193  					type = "critical";
68e36a429ef5df Fabio Estevam       2019-10-25   194  				};
68e36a429ef5df Fabio Estevam       2019-10-25   195  			};
68e36a429ef5df Fabio Estevam       2019-10-25   196  
68e36a429ef5df Fabio Estevam       2019-10-25   197  			cooling-maps {
68e36a429ef5df Fabio Estevam       2019-10-25   198  				map0 {
68e36a429ef5df Fabio Estevam       2019-10-25   199  					trip = <&core_cluster_alert>;
68e36a429ef5df Fabio Estevam       2019-10-25   200  					cooling-device =
68e36a429ef5df Fabio Estevam       2019-10-25   201  						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
68e36a429ef5df Fabio Estevam       2019-10-25   202  						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
68e36a429ef5df Fabio Estevam       2019-10-25   203  				};
68e36a429ef5df Fabio Estevam       2019-10-25   204  			};
68e36a429ef5df Fabio Estevam       2019-10-25   205  		};
68e36a429ef5df Fabio Estevam       2019-10-25   206  	};
68e36a429ef5df Fabio Estevam       2019-10-25   207  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   208  	soc: soc {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   209  		compatible = "simple-bus";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   210  		#address-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   211  		#size-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   212  		ranges;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   213  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   214  		ddr: memory-controller@1080000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   215  			compatible = "fsl,qoriq-memory-controller";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   216  			reg = <0x0 0x1080000 0x0 0x1000>;
dabea675faf16e Michael Walle       2021-04-08   217  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
dabea675faf16e Michael Walle       2021-04-08   218  			little-endian;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   219  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   220  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   221  		dcfg: syscon@1e00000 {
69c910d3675fc4 Michael Walle       2021-01-11   222  			#address-cells = <1>;
69c910d3675fc4 Michael Walle       2021-01-11   223  			#size-cells = <1>;
69c910d3675fc4 Michael Walle       2021-01-11   224  			compatible = "fsl,ls1028a-dcfg", "syscon", "simple-mfd";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   225  			reg = <0x0 0x1e00000 0x0 0x10000>;
69c910d3675fc4 Michael Walle       2021-01-11   226  			ranges = <0x0 0x0 0x1e00000 0x10000>;
33eae7fb2e593f Yinbo Zhu           2019-12-13   227  			little-endian;
69c910d3675fc4 Michael Walle       2021-01-11   228  
69c910d3675fc4 Michael Walle       2021-01-11   229  			fspi_clk: clock-controller@900 {
69c910d3675fc4 Michael Walle       2021-01-11   230  				compatible = "fsl,ls1028a-flexspi-clk";
69c910d3675fc4 Michael Walle       2021-01-11   231  				reg = <0x900 0x4>;
69c910d3675fc4 Michael Walle       2021-01-11   232  				#clock-cells = <0>;
69c910d3675fc4 Michael Walle       2021-01-11   233  				clocks = <&clockgen QORIQ_CLK_HWACCEL 0>;
69c910d3675fc4 Michael Walle       2021-01-11   234  				clock-output-names = "fspi_clk";
69c910d3675fc4 Michael Walle       2021-01-11   235  			};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   236  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   237  
3f0fb37b22b460 Michael Walle       2019-12-11   238  		rst: syscon@1e60000 {
3f0fb37b22b460 Michael Walle       2019-12-11   239  			compatible = "syscon";
3f0fb37b22b460 Michael Walle       2019-12-11   240  			reg = <0x0 0x1e60000 0x0 0x10000>;
3f0fb37b22b460 Michael Walle       2019-12-11   241  			little-endian;
3f0fb37b22b460 Michael Walle       2019-12-11   242  		};
3f0fb37b22b460 Michael Walle       2019-12-11   243  
3c12e9da3098a3 Sean Anderson       2022-04-28   244  		sfp: efuse@1e80000 {
eba5bea8f37fe8 Michael Walle       2022-02-14   245  			compatible = "fsl,ls1028a-sfp";
eba5bea8f37fe8 Michael Walle       2022-02-14   246  			reg = <0x0 0x1e80000 0x0 0x10000>;
3c12e9da3098a3 Sean Anderson       2022-04-28   247  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
3c12e9da3098a3 Sean Anderson       2022-04-28   248  					    QORIQ_CLK_PLL_DIV(4)>;
3c12e9da3098a3 Sean Anderson       2022-04-28   249  			clock-names = "sfp";
eba5bea8f37fe8 Michael Walle       2022-02-14   250  			#address-cells = <1>;
eba5bea8f37fe8 Michael Walle       2022-02-14   251  			#size-cells = <1>;
eba5bea8f37fe8 Michael Walle       2022-02-14   252  
eba5bea8f37fe8 Michael Walle       2022-02-14   253  			ls1028a_uid: unique-id@1c {
eba5bea8f37fe8 Michael Walle       2022-02-14   254  				reg = <0x1c 0x8>;
eba5bea8f37fe8 Michael Walle       2022-02-14   255  			};
eba5bea8f37fe8 Michael Walle       2022-02-14   256  		};
eba5bea8f37fe8 Michael Walle       2022-02-14   257  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   258  		scfg: syscon@1fc0000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   259  			compatible = "fsl,ls1028a-scfg", "syscon";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   260  			reg = <0x0 0x1fc0000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   261  			big-endian;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   262  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   263  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   264  		clockgen: clock-controller@1300000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   265  			compatible = "fsl,ls1028a-clockgen";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   266  			reg = <0x0 0x1300000 0x0 0xa0000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   267  			#clock-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   268  			clocks = <&sysclk>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   269  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   270  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   271  		i2c0: i2c@2000000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   272  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   273  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   274  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   275  			reg = <0x0 0x2000000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   276  			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   277  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   278  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   279  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   280  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   281  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   282  		i2c1: i2c@2010000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   283  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   284  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   285  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   286  			reg = <0x0 0x2010000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   287  			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   288  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   289  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   290  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   291  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   292  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   293  		i2c2: i2c@2020000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   294  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   295  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   296  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   297  			reg = <0x0 0x2020000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   298  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   299  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   300  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   301  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   302  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   303  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   304  		i2c3: i2c@2030000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   305  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   306  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   307  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   308  			reg = <0x0 0x2030000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   309  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   310  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   311  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   312  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   313  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   314  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   315  		i2c4: i2c@2040000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   316  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   317  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   318  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   319  			reg = <0x0 0x2040000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   320  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   321  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   322  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   323  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   324  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   325  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   326  		i2c5: i2c@2050000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   327  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   328  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   329  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   330  			reg = <0x0 0x2050000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   331  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   332  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   333  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   334  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   335  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   336  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   337  		i2c6: i2c@2060000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   338  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   339  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   340  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   341  			reg = <0x0 0x2060000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   342  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   343  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   344  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   345  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   346  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   347  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   348  		i2c7: i2c@2070000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   349  			compatible = "fsl,vf610-i2c";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   350  			#address-cells = <1>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   351  			#size-cells = <0>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   352  			reg = <0x0 0x2070000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   353  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   354  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   355  					    QORIQ_CLK_PLL_DIV(4)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   356  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   357  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   358  
c77fae5ba09a6b Ashish Kumar        2019-12-04   359  		fspi: spi@20c0000 {
c77fae5ba09a6b Ashish Kumar        2019-12-04   360  			compatible = "nxp,lx2160a-fspi";
c77fae5ba09a6b Ashish Kumar        2019-12-04   361  			#address-cells = <1>;
c77fae5ba09a6b Ashish Kumar        2019-12-04   362  			#size-cells = <0>;
c77fae5ba09a6b Ashish Kumar        2019-12-04   363  			reg = <0x0 0x20c0000 0x0 0x10000>,
c77fae5ba09a6b Ashish Kumar        2019-12-04   364  			      <0x0 0x20000000 0x0 0x10000000>;
c77fae5ba09a6b Ashish Kumar        2019-12-04   365  			reg-names = "fspi_base", "fspi_mmap";
c77fae5ba09a6b Ashish Kumar        2019-12-04   366  			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
69c910d3675fc4 Michael Walle       2021-01-11   367  			clocks = <&fspi_clk>, <&fspi_clk>;
c77fae5ba09a6b Ashish Kumar        2019-12-04   368  			clock-names = "fspi_en", "fspi";
c77fae5ba09a6b Ashish Kumar        2019-12-04   369  			status = "disabled";
c77fae5ba09a6b Ashish Kumar        2019-12-04   370  		};
c77fae5ba09a6b Ashish Kumar        2019-12-04   371  
c2d35ada106ed5 Michael Walle       2020-02-18   372  		dspi0: spi@2100000 {
c2d35ada106ed5 Michael Walle       2020-02-18   373  			compatible = "fsl,ls1028a-dspi", "fsl,ls1021a-v1.0-dspi";
c2d35ada106ed5 Michael Walle       2020-02-18   374  			#address-cells = <1>;
c2d35ada106ed5 Michael Walle       2020-02-18   375  			#size-cells = <0>;
c2d35ada106ed5 Michael Walle       2020-02-18   376  			reg = <0x0 0x2100000 0x0 0x10000>;
c2d35ada106ed5 Michael Walle       2020-02-18   377  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
c2d35ada106ed5 Michael Walle       2020-02-18   378  			clock-names = "dspi";
99314eb13c74b1 Michael Walle       2020-12-29   379  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   380  					    QORIQ_CLK_PLL_DIV(2)>;
dd12fa6978a1c9 Vladimir Oltean     2020-03-18   381  			dmas = <&edma0 0 62>, <&edma0 0 60>;
dd12fa6978a1c9 Vladimir Oltean     2020-03-18   382  			dma-names = "tx", "rx";
c2d35ada106ed5 Michael Walle       2020-02-18   383  			spi-num-chipselects = <4>;
c2d35ada106ed5 Michael Walle       2020-02-18   384  			little-endian;
c2d35ada106ed5 Michael Walle       2020-02-18   385  			status = "disabled";
c2d35ada106ed5 Michael Walle       2020-02-18   386  		};
c2d35ada106ed5 Michael Walle       2020-02-18   387  
c2d35ada106ed5 Michael Walle       2020-02-18   388  		dspi1: spi@2110000 {
c2d35ada106ed5 Michael Walle       2020-02-18   389  			compatible = "fsl,ls1028a-dspi", "fsl,ls1021a-v1.0-dspi";
c2d35ada106ed5 Michael Walle       2020-02-18   390  			#address-cells = <1>;
c2d35ada106ed5 Michael Walle       2020-02-18   391  			#size-cells = <0>;
c2d35ada106ed5 Michael Walle       2020-02-18   392  			reg = <0x0 0x2110000 0x0 0x10000>;
c2d35ada106ed5 Michael Walle       2020-02-18   393  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
c2d35ada106ed5 Michael Walle       2020-02-18   394  			clock-names = "dspi";
99314eb13c74b1 Michael Walle       2020-12-29   395  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   396  					    QORIQ_CLK_PLL_DIV(2)>;
dd12fa6978a1c9 Vladimir Oltean     2020-03-18   397  			dmas = <&edma0 0 58>, <&edma0 0 56>;
dd12fa6978a1c9 Vladimir Oltean     2020-03-18   398  			dma-names = "tx", "rx";
c2d35ada106ed5 Michael Walle       2020-02-18   399  			spi-num-chipselects = <4>;
c2d35ada106ed5 Michael Walle       2020-02-18   400  			little-endian;
c2d35ada106ed5 Michael Walle       2020-02-18   401  			status = "disabled";
c2d35ada106ed5 Michael Walle       2020-02-18   402  		};
c2d35ada106ed5 Michael Walle       2020-02-18   403  
c2d35ada106ed5 Michael Walle       2020-02-18   404  		dspi2: spi@2120000 {
c2d35ada106ed5 Michael Walle       2020-02-18   405  			compatible = "fsl,ls1028a-dspi", "fsl,ls1021a-v1.0-dspi";
c2d35ada106ed5 Michael Walle       2020-02-18   406  			#address-cells = <1>;
c2d35ada106ed5 Michael Walle       2020-02-18   407  			#size-cells = <0>;
c2d35ada106ed5 Michael Walle       2020-02-18   408  			reg = <0x0 0x2120000 0x0 0x10000>;
c2d35ada106ed5 Michael Walle       2020-02-18   409  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
c2d35ada106ed5 Michael Walle       2020-02-18   410  			clock-names = "dspi";
99314eb13c74b1 Michael Walle       2020-12-29   411  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   412  					    QORIQ_CLK_PLL_DIV(2)>;
dd12fa6978a1c9 Vladimir Oltean     2020-03-18   413  			dmas = <&edma0 0 54>, <&edma0 0 2>;
dd12fa6978a1c9 Vladimir Oltean     2020-03-18   414  			dma-names = "tx", "rx";
c2d35ada106ed5 Michael Walle       2020-02-18   415  			spi-num-chipselects = <3>;
c2d35ada106ed5 Michael Walle       2020-02-18   416  			little-endian;
c2d35ada106ed5 Michael Walle       2020-02-18   417  			status = "disabled";
c2d35ada106ed5 Michael Walle       2020-02-18   418  		};
c2d35ada106ed5 Michael Walle       2020-02-18   419  
491d3a3fc113a6 Ashish Kumar        2019-08-15   420  		esdhc: mmc@2140000 {
491d3a3fc113a6 Ashish Kumar        2019-08-15   421  			compatible = "fsl,ls1028a-esdhc", "fsl,esdhc";
491d3a3fc113a6 Ashish Kumar        2019-08-15   422  			reg = <0x0 0x2140000 0x0 0x10000>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   423  			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   424  			clock-frequency = <0>; /* fixed up by bootloader */
99314eb13c74b1 Michael Walle       2020-12-29   425  			clocks = <&clockgen QORIQ_CLK_HWACCEL 1>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   426  			voltage-ranges = <1800 1800 3300 3300>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   427  			sdhci,auto-cmd12;
491d3a3fc113a6 Ashish Kumar        2019-08-15   428  			little-endian;
491d3a3fc113a6 Ashish Kumar        2019-08-15   429  			bus-width = <4>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   430  			status = "disabled";
491d3a3fc113a6 Ashish Kumar        2019-08-15   431  		};
491d3a3fc113a6 Ashish Kumar        2019-08-15   432  
491d3a3fc113a6 Ashish Kumar        2019-08-15   433  		esdhc1: mmc@2150000 {
491d3a3fc113a6 Ashish Kumar        2019-08-15   434  			compatible = "fsl,ls1028a-esdhc", "fsl,esdhc";
491d3a3fc113a6 Ashish Kumar        2019-08-15   435  			reg = <0x0 0x2150000 0x0 0x10000>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   436  			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   437  			clock-frequency = <0>; /* fixed up by bootloader */
99314eb13c74b1 Michael Walle       2020-12-29   438  			clocks = <&clockgen QORIQ_CLK_HWACCEL 1>;
8b94aa318aa746 Michael Walle       2021-09-15   439  			voltage-ranges = <1800 1800>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   440  			sdhci,auto-cmd12;
8b94aa318aa746 Michael Walle       2021-09-15   441  			non-removable;
491d3a3fc113a6 Ashish Kumar        2019-08-15   442  			little-endian;
491d3a3fc113a6 Ashish Kumar        2019-08-15   443  			bus-width = <4>;
491d3a3fc113a6 Ashish Kumar        2019-08-15   444  			status = "disabled";
491d3a3fc113a6 Ashish Kumar        2019-08-15   445  		};
491d3a3fc113a6 Ashish Kumar        2019-08-15   446  
04fa4f03e3533f Michael Walle       2020-10-01   447  		can0: can@2180000 {
c9e5ef8cef813f Kuldeep Singh       2021-01-21   448  			compatible = "fsl,lx2160ar1-flexcan";
04fa4f03e3533f Michael Walle       2020-10-01   449  			reg = <0x0 0x2180000 0x0 0x10000>;
04fa4f03e3533f Michael Walle       2020-10-01   450  			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
c9e5ef8cef813f Kuldeep Singh       2021-01-21   451  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
c9e5ef8cef813f Kuldeep Singh       2021-01-21   452  					    QORIQ_CLK_PLL_DIV(2)>,
c9e5ef8cef813f Kuldeep Singh       2021-01-21   453  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   454  					    QORIQ_CLK_PLL_DIV(2)>;
04fa4f03e3533f Michael Walle       2020-10-01   455  			clock-names = "ipg", "per";
04fa4f03e3533f Michael Walle       2020-10-01   456  			status = "disabled";
04fa4f03e3533f Michael Walle       2020-10-01   457  		};
04fa4f03e3533f Michael Walle       2020-10-01   458  
04fa4f03e3533f Michael Walle       2020-10-01   459  		can1: can@2190000 {
c9e5ef8cef813f Kuldeep Singh       2021-01-21   460  			compatible = "fsl,lx2160ar1-flexcan";
04fa4f03e3533f Michael Walle       2020-10-01   461  			reg = <0x0 0x2190000 0x0 0x10000>;
04fa4f03e3533f Michael Walle       2020-10-01   462  			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
c9e5ef8cef813f Kuldeep Singh       2021-01-21   463  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
c9e5ef8cef813f Kuldeep Singh       2021-01-21   464  					    QORIQ_CLK_PLL_DIV(2)>,
c9e5ef8cef813f Kuldeep Singh       2021-01-21   465  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   466  					    QORIQ_CLK_PLL_DIV(2)>;
04fa4f03e3533f Michael Walle       2020-10-01   467  			clock-names = "ipg", "per";
04fa4f03e3533f Michael Walle       2020-10-01   468  			status = "disabled";
04fa4f03e3533f Michael Walle       2020-10-01   469  		};
04fa4f03e3533f Michael Walle       2020-10-01   470  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   471  		duart0: serial@21c0500 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   472  			compatible = "fsl,ns16550", "ns16550a";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   473  			reg = <0x00 0x21c0500 0x0 0x100>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   474  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   475  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   476  					    QORIQ_CLK_PLL_DIV(2)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   477  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   478  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   479  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   480  		duart1: serial@21c0600 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   481  			compatible = "fsl,ns16550", "ns16550a";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   482  			reg = <0x00 0x21c0600 0x0 0x100>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   483  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   484  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   485  					    QORIQ_CLK_PLL_DIV(2)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   486  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   487  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   488  
2607d7246fb2a3 Michael Walle       2020-03-07   489  
2607d7246fb2a3 Michael Walle       2020-03-07   490  		lpuart0: serial@2260000 {
2607d7246fb2a3 Michael Walle       2020-03-07   491  			compatible = "fsl,ls1028a-lpuart";
2607d7246fb2a3 Michael Walle       2020-03-07   492  			reg = <0x0 0x2260000 0x0 0x1000>;
2607d7246fb2a3 Michael Walle       2020-03-07   493  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   494  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   495  					    QORIQ_CLK_PLL_DIV(2)>;
2607d7246fb2a3 Michael Walle       2020-03-07   496  			clock-names = "ipg";
2607d7246fb2a3 Michael Walle       2020-03-07   497  			dma-names = "rx","tx";
2607d7246fb2a3 Michael Walle       2020-03-07   498  			dmas = <&edma0 1 32>,
2607d7246fb2a3 Michael Walle       2020-03-07   499  			       <&edma0 1 33>;
2607d7246fb2a3 Michael Walle       2020-03-07   500  			status = "disabled";
2607d7246fb2a3 Michael Walle       2020-03-07   501  		};
2607d7246fb2a3 Michael Walle       2020-03-07   502  
2607d7246fb2a3 Michael Walle       2020-03-07   503  		lpuart1: serial@2270000 {
2607d7246fb2a3 Michael Walle       2020-03-07   504  			compatible = "fsl,ls1028a-lpuart";
2607d7246fb2a3 Michael Walle       2020-03-07   505  			reg = <0x0 0x2270000 0x0 0x1000>;
2607d7246fb2a3 Michael Walle       2020-03-07   506  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   507  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   508  					    QORIQ_CLK_PLL_DIV(2)>;
2607d7246fb2a3 Michael Walle       2020-03-07   509  			clock-names = "ipg";
2607d7246fb2a3 Michael Walle       2020-03-07   510  			dma-names = "rx","tx";
2607d7246fb2a3 Michael Walle       2020-03-07   511  			dmas = <&edma0 1 30>,
2607d7246fb2a3 Michael Walle       2020-03-07   512  			       <&edma0 1 31>;
2607d7246fb2a3 Michael Walle       2020-03-07   513  			status = "disabled";
2607d7246fb2a3 Michael Walle       2020-03-07   514  		};
2607d7246fb2a3 Michael Walle       2020-03-07   515  
2607d7246fb2a3 Michael Walle       2020-03-07   516  		lpuart2: serial@2280000 {
2607d7246fb2a3 Michael Walle       2020-03-07   517  			compatible = "fsl,ls1028a-lpuart";
2607d7246fb2a3 Michael Walle       2020-03-07   518  			reg = <0x0 0x2280000 0x0 0x1000>;
2607d7246fb2a3 Michael Walle       2020-03-07   519  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   520  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   521  					    QORIQ_CLK_PLL_DIV(2)>;
2607d7246fb2a3 Michael Walle       2020-03-07   522  			clock-names = "ipg";
2607d7246fb2a3 Michael Walle       2020-03-07   523  			dma-names = "rx","tx";
2607d7246fb2a3 Michael Walle       2020-03-07   524  			dmas = <&edma0 1 28>,
2607d7246fb2a3 Michael Walle       2020-03-07   525  			       <&edma0 1 29>;
2607d7246fb2a3 Michael Walle       2020-03-07   526  			status = "disabled";
2607d7246fb2a3 Michael Walle       2020-03-07   527  		};
2607d7246fb2a3 Michael Walle       2020-03-07   528  
2607d7246fb2a3 Michael Walle       2020-03-07   529  		lpuart3: serial@2290000 {
2607d7246fb2a3 Michael Walle       2020-03-07   530  			compatible = "fsl,ls1028a-lpuart";
2607d7246fb2a3 Michael Walle       2020-03-07   531  			reg = <0x0 0x2290000 0x0 0x1000>;
2607d7246fb2a3 Michael Walle       2020-03-07   532  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   533  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   534  					    QORIQ_CLK_PLL_DIV(2)>;
2607d7246fb2a3 Michael Walle       2020-03-07   535  			clock-names = "ipg";
2607d7246fb2a3 Michael Walle       2020-03-07   536  			dma-names = "rx","tx";
2607d7246fb2a3 Michael Walle       2020-03-07   537  			dmas = <&edma0 1 26>,
2607d7246fb2a3 Michael Walle       2020-03-07   538  			       <&edma0 1 27>;
2607d7246fb2a3 Michael Walle       2020-03-07   539  			status = "disabled";
2607d7246fb2a3 Michael Walle       2020-03-07   540  		};
2607d7246fb2a3 Michael Walle       2020-03-07   541  
2607d7246fb2a3 Michael Walle       2020-03-07   542  		lpuart4: serial@22a0000 {
2607d7246fb2a3 Michael Walle       2020-03-07   543  			compatible = "fsl,ls1028a-lpuart";
2607d7246fb2a3 Michael Walle       2020-03-07   544  			reg = <0x0 0x22a0000 0x0 0x1000>;
2607d7246fb2a3 Michael Walle       2020-03-07   545  			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   546  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   547  					    QORIQ_CLK_PLL_DIV(2)>;
2607d7246fb2a3 Michael Walle       2020-03-07   548  			clock-names = "ipg";
2607d7246fb2a3 Michael Walle       2020-03-07   549  			dma-names = "rx","tx";
2607d7246fb2a3 Michael Walle       2020-03-07   550  			dmas = <&edma0 1 24>,
2607d7246fb2a3 Michael Walle       2020-03-07   551  			       <&edma0 1 25>;
2607d7246fb2a3 Michael Walle       2020-03-07   552  			status = "disabled";
2607d7246fb2a3 Michael Walle       2020-03-07   553  		};
2607d7246fb2a3 Michael Walle       2020-03-07   554  
2607d7246fb2a3 Michael Walle       2020-03-07   555  		lpuart5: serial@22b0000 {
2607d7246fb2a3 Michael Walle       2020-03-07   556  			compatible = "fsl,ls1028a-lpuart";
2607d7246fb2a3 Michael Walle       2020-03-07   557  			reg = <0x0 0x22b0000 0x0 0x1000>;
2607d7246fb2a3 Michael Walle       2020-03-07   558  			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   559  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   560  					    QORIQ_CLK_PLL_DIV(2)>;
2607d7246fb2a3 Michael Walle       2020-03-07   561  			clock-names = "ipg";
2607d7246fb2a3 Michael Walle       2020-03-07   562  			dma-names = "rx","tx";
2607d7246fb2a3 Michael Walle       2020-03-07   563  			dmas = <&edma0 1 22>,
2607d7246fb2a3 Michael Walle       2020-03-07   564  			       <&edma0 1 23>;
2607d7246fb2a3 Michael Walle       2020-03-07   565  			status = "disabled";
2607d7246fb2a3 Michael Walle       2020-03-07   566  		};
2607d7246fb2a3 Michael Walle       2020-03-07   567  
f54f7be5c5acd8 Alison Wang         2019-03-01   568  		edma0: dma-controller@22c0000 {
f54f7be5c5acd8 Alison Wang         2019-03-01   569  			#dma-cells = <2>;
e0d7856eb9a411 Michael Walle       2020-03-06   570  			compatible = "fsl,ls1028a-edma", "fsl,vf610-edma";
f54f7be5c5acd8 Alison Wang         2019-03-01   571  			reg = <0x0 0x22c0000 0x0 0x10000>,
f54f7be5c5acd8 Alison Wang         2019-03-01   572  			      <0x0 0x22d0000 0x0 0x10000>,
f54f7be5c5acd8 Alison Wang         2019-03-01   573  			      <0x0 0x22e0000 0x0 0x10000>;
f54f7be5c5acd8 Alison Wang         2019-03-01   574  			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
f54f7be5c5acd8 Alison Wang         2019-03-01   575  				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
f54f7be5c5acd8 Alison Wang         2019-03-01   576  			interrupt-names = "edma-tx", "edma-err";
f54f7be5c5acd8 Alison Wang         2019-03-01   577  			dma-channels = <32>;
f54f7be5c5acd8 Alison Wang         2019-03-01   578  			clock-names = "dmamux0", "dmamux1";
99314eb13c74b1 Michael Walle       2020-12-29   579  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   580  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   581  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   582  					    QORIQ_CLK_PLL_DIV(2)>;
f54f7be5c5acd8 Alison Wang         2019-03-01   583  		};
f54f7be5c5acd8 Alison Wang         2019-03-01   584  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   585  		gpio1: gpio@2300000 {
f64697bd0b9e3d Song Hui            2019-08-05   586  			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   587  			reg = <0x0 0x2300000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   588  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   589  			gpio-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   590  			#gpio-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   591  			interrupt-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   592  			#interrupt-cells = <2>;
f64697bd0b9e3d Song Hui            2019-08-05   593  			little-endian;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   594  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   595  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   596  		gpio2: gpio@2310000 {
f64697bd0b9e3d Song Hui            2019-08-05   597  			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   598  			reg = <0x0 0x2310000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   599  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   600  			gpio-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   601  			#gpio-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   602  			interrupt-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   603  			#interrupt-cells = <2>;
f64697bd0b9e3d Song Hui            2019-08-05   604  			little-endian;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   605  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   606  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   607  		gpio3: gpio@2320000 {
f64697bd0b9e3d Song Hui            2019-08-05   608  			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   609  			reg = <0x0 0x2320000 0x0 0x10000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   610  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   611  			gpio-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   612  			#gpio-cells = <2>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   613  			interrupt-controller;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   614  			#interrupt-cells = <2>;
f64697bd0b9e3d Song Hui            2019-08-05   615  			little-endian;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   616  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   617  
d0014fad38c878 Frank Li            2024-07-10  @618  		usb {
d0014fad38c878 Frank Li            2024-07-10   619  			compatible = "fsl,ls1028a-dwc3";
d0014fad38c878 Frank Li            2024-07-10   620  			#address-cells = <2>;
d0014fad38c878 Frank Li            2024-07-10   621  			#size-cells = <2>;
d0014fad38c878 Frank Li            2024-07-10   622  			ranges;
d0014fad38c878 Frank Li            2024-07-10   623  
c92f56faaadd31 Ran Wang            2019-05-17   624  			usb0: usb@3100000 {
d0014fad38c878 Frank Li            2024-07-10   625  				compatible = "snps,dwc3";
c92f56faaadd31 Ran Wang            2019-05-17   626  				reg = <0x0 0x3100000 0x0 0x10000>;
c92f56faaadd31 Ran Wang            2019-05-17   627  				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
d0014fad38c878 Frank Li            2024-07-10   628  				dma-coherent;
c92f56faaadd31 Ran Wang            2019-05-17   629  				snps,dis_rxdet_inp3_quirk;
c92f56faaadd31 Ran Wang            2019-05-17   630  				snps,quirk-frame-length-adjustment = <0x20>;
c92f56faaadd31 Ran Wang            2019-05-17   631  				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
70293bea929067 Michael Walle       2021-08-31   632  				status = "disabled";
c92f56faaadd31 Ran Wang            2019-05-17   633  			};
c92f56faaadd31 Ran Wang            2019-05-17   634  
c92f56faaadd31 Ran Wang            2019-05-17   635  			usb1: usb@3110000 {
d0014fad38c878 Frank Li            2024-07-10   636  				compatible = "snps,dwc3";
c92f56faaadd31 Ran Wang            2019-05-17   637  				reg = <0x0 0x3110000 0x0 0x10000>;
c92f56faaadd31 Ran Wang            2019-05-17   638  				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
d0014fad38c878 Frank Li            2024-07-10   639  				dma-coherent;
c92f56faaadd31 Ran Wang            2019-05-17   640  				snps,dis_rxdet_inp3_quirk;
c92f56faaadd31 Ran Wang            2019-05-17   641  				snps,quirk-frame-length-adjustment = <0x20>;
c92f56faaadd31 Ran Wang            2019-05-17   642  				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
70293bea929067 Michael Walle       2021-08-31   643  				status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   644  			};
d0014fad38c878 Frank Li            2024-07-10   645  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   646  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   647  		sata: sata@3200000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   648  			compatible = "fsl,ls1028a-ahci";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   649  			reg = <0x0 0x3200000 0x0 0x10000>,
3f3d795804352d Peng Ma             2019-03-11   650  				<0x7 0x100520 0x0 0x4>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   651  			reg-names = "ahci", "sata-ecc";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   652  			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   653  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   654  					    QORIQ_CLK_PLL_DIV(2)>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   655  			status = "disabled";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   656  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   657  
f7d48ffcfc6efc Wasim Khan          2020-09-13   658  		pcie1: pcie@3400000 {
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   659  			compatible = "fsl,ls1028a-pcie";
ce87d936889bdb Zhen Lei            2021-05-21   660  			reg = <0x00 0x03400000 0x0 0x00100000>, /* controller registers */
ce87d936889bdb Zhen Lei            2021-05-21   661  			      <0x80 0x00000000 0x0 0x00002000>; /* configuration space */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   662  			reg-names = "regs", "config";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   663  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   664  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   665  			interrupt-names = "pme", "aer";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   666  			#address-cells = <3>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   667  			#size-cells = <2>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   668  			device_type = "pci";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   669  			dma-coherent;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   670  			num-viewport = <8>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   671  			bus-range = <0x0 0xff>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   672  			ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000   /* downstream I/O */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   673  				  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   674  			msi-parent = <&its>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   675  			#interrupt-cells = <1>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   676  			interrupt-map-mask = <0 0 0 7>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   677  			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   678  					<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   679  					<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   680  					<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   681  			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   682  			status = "disabled";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   683  		};
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   684  
e84e22c0c3b348 Xiaowei Bao         2021-12-14   685  		pcie_ep1: pcie-ep@3400000 {
e84e22c0c3b348 Xiaowei Bao         2021-12-14   686  			compatible = "fsl,ls1028a-pcie-ep","fsl,ls-pcie-ep";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   687  			reg = <0x00 0x03400000 0x0 0x00100000
e84e22c0c3b348 Xiaowei Bao         2021-12-14   688  			       0x80 0x00000000 0x8 0x00000000>;
e84e22c0c3b348 Xiaowei Bao         2021-12-14   689  			reg-names = "regs", "addr_space";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   690  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>; /* PME interrupt */
e84e22c0c3b348 Xiaowei Bao         2021-12-14   691  			interrupt-names = "pme";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   692  			num-ib-windows = <6>;
e84e22c0c3b348 Xiaowei Bao         2021-12-14   693  			num-ob-windows = <8>;
e84e22c0c3b348 Xiaowei Bao         2021-12-14   694  			status = "disabled";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   695  		};
e84e22c0c3b348 Xiaowei Bao         2021-12-14   696  
f7d48ffcfc6efc Wasim Khan          2020-09-13   697  		pcie2: pcie@3500000 {
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   698  			compatible = "fsl,ls1028a-pcie";
ce87d936889bdb Zhen Lei            2021-05-21   699  			reg = <0x00 0x03500000 0x0 0x00100000>, /* controller registers */
ce87d936889bdb Zhen Lei            2021-05-21   700  			      <0x88 0x00000000 0x0 0x00002000>; /* configuration space */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   701  			reg-names = "regs", "config";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   702  			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   703  				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   704  			interrupt-names = "pme", "aer";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   705  			#address-cells = <3>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   706  			#size-cells = <2>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   707  			device_type = "pci";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   708  			dma-coherent;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   709  			num-viewport = <8>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   710  			bus-range = <0x0 0xff>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   711  			ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000   /* downstream I/O */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   712  				  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   713  			msi-parent = <&its>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   714  			#interrupt-cells = <1>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   715  			interrupt-map-mask = <0 0 0 7>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   716  			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   717  					<0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   718  					<0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   719  					<0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   720  			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   721  			status = "disabled";
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   722  		};
f6ff3f6d2bc288 Xiaowei Bao         2020-03-11   723  
e84e22c0c3b348 Xiaowei Bao         2021-12-14   724  		pcie_ep2: pcie-ep@3500000 {
e84e22c0c3b348 Xiaowei Bao         2021-12-14   725  			compatible = "fsl,ls1028a-pcie-ep","fsl,ls-pcie-ep";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   726  			reg = <0x00 0x03500000 0x0 0x00100000
e84e22c0c3b348 Xiaowei Bao         2021-12-14   727  			       0x88 0x00000000 0x8 0x00000000>;
e84e22c0c3b348 Xiaowei Bao         2021-12-14   728  			reg-names = "regs", "addr_space";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   729  			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>; /* PME interrupt */
e84e22c0c3b348 Xiaowei Bao         2021-12-14   730  			interrupt-names = "pme";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   731  			num-ib-windows = <6>;
e84e22c0c3b348 Xiaowei Bao         2021-12-14   732  			num-ob-windows = <8>;
e84e22c0c3b348 Xiaowei Bao         2021-12-14   733  			status = "disabled";
e84e22c0c3b348 Xiaowei Bao         2021-12-14   734  		};
e84e22c0c3b348 Xiaowei Bao         2021-12-14   735  
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   736  		smmu: iommu@5000000 {
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   737  			compatible = "arm,mmu-500";
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   738  			reg = <0 0x5000000 0 0x800000>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   739  			#global-interrupts = <8>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   740  			#iommu-cells = <1>;
8720913f8402e5 Vladimir Oltean     2022-12-15   741  			dma-coherent;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   742  			stream-match-mask = <0x7c00>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   743  			/* global secure fault */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   744  			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   745  			/* combined secure interrupt */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   746  				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   747  			/* global non-secure fault */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   748  				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   749  			/* combined non-secure interrupt */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   750  				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   751  			/* performance counter interrupts 0-7 */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   752  				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   753  				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   754  			/* per context interrupt, 64 interrupts */
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   755  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   756  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   757  				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   758  				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   759  				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   760  				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   761  				     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   762  				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   763  				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   764  				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   765  				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   766  				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   767  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   768  				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   769  				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   770  				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   771  				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   772  				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   773  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   774  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   775  				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   776  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   777  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   778  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   779  				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   780  				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   781  				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   782  				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   783  				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   784  				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   785  				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   786  				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14   787  		};
927d7f8575422e Claudiu Manoil      2019-02-26   788  
1d0becabdc0e79 Horia Geantă        2019-06-10   789  		crypto: crypto@8000000 {
1d0becabdc0e79 Horia Geantă        2019-06-10   790  			compatible = "fsl,sec-v5.0", "fsl,sec-v4.0";
1d0becabdc0e79 Horia Geantă        2019-06-10   791  			fsl,sec-era = <10>;
1d0becabdc0e79 Horia Geantă        2019-06-10   792  			#address-cells = <1>;
1d0becabdc0e79 Horia Geantă        2019-06-10   793  			#size-cells = <1>;
1d0becabdc0e79 Horia Geantă        2019-06-10   794  			ranges = <0x0 0x00 0x8000000 0x100000>;
1d0becabdc0e79 Horia Geantă        2019-06-10   795  			reg = <0x00 0x8000000 0x0 0x100000>;
1d0becabdc0e79 Horia Geantă        2019-06-10   796  			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
1d0becabdc0e79 Horia Geantă        2019-06-10   797  			dma-coherent;
1d0becabdc0e79 Horia Geantă        2019-06-10   798  
1d0becabdc0e79 Horia Geantă        2019-06-10   799  			sec_jr0: jr@10000 {
1d0becabdc0e79 Horia Geantă        2019-06-10   800  				compatible = "fsl,sec-v5.0-job-ring",
1d0becabdc0e79 Horia Geantă        2019-06-10   801  					     "fsl,sec-v4.0-job-ring";
1d0becabdc0e79 Horia Geantă        2019-06-10   802  				reg = <0x10000 0x10000>;
1d0becabdc0e79 Horia Geantă        2019-06-10   803  				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
1d0becabdc0e79 Horia Geantă        2019-06-10   804  			};
1d0becabdc0e79 Horia Geantă        2019-06-10   805  
1d0becabdc0e79 Horia Geantă        2019-06-10   806  			sec_jr1: jr@20000 {
1d0becabdc0e79 Horia Geantă        2019-06-10   807  				compatible = "fsl,sec-v5.0-job-ring",
1d0becabdc0e79 Horia Geantă        2019-06-10   808  					     "fsl,sec-v4.0-job-ring";
1d0becabdc0e79 Horia Geantă        2019-06-10   809  				reg = <0x20000 0x10000>;
1d0becabdc0e79 Horia Geantă        2019-06-10   810  				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
1d0becabdc0e79 Horia Geantă        2019-06-10   811  			};
1d0becabdc0e79 Horia Geantă        2019-06-10   812  
1d0becabdc0e79 Horia Geantă        2019-06-10   813  			sec_jr2: jr@30000 {
1d0becabdc0e79 Horia Geantă        2019-06-10   814  				compatible = "fsl,sec-v5.0-job-ring",
1d0becabdc0e79 Horia Geantă        2019-06-10   815  					     "fsl,sec-v4.0-job-ring";
1d0becabdc0e79 Horia Geantă        2019-06-10   816  				reg = <0x30000 0x10000>;
1d0becabdc0e79 Horia Geantă        2019-06-10   817  				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
1d0becabdc0e79 Horia Geantă        2019-06-10   818  			};
1d0becabdc0e79 Horia Geantă        2019-06-10   819  
1d0becabdc0e79 Horia Geantă        2019-06-10   820  			sec_jr3: jr@40000 {
1d0becabdc0e79 Horia Geantă        2019-06-10   821  				compatible = "fsl,sec-v5.0-job-ring",
1d0becabdc0e79 Horia Geantă        2019-06-10   822  					     "fsl,sec-v4.0-job-ring";
1d0becabdc0e79 Horia Geantă        2019-06-10   823  				reg = <0x40000 0x10000>;
1d0becabdc0e79 Horia Geantă        2019-06-10   824  				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
1d0becabdc0e79 Horia Geantă        2019-06-10   825  			};
1d0becabdc0e79 Horia Geantă        2019-06-10   826  		};
1d0becabdc0e79 Horia Geantă        2019-06-10   827  
7802f88de0e1c3 Peng Ma             2019-05-06   828  		qdma: dma-controller@8380000 {
7802f88de0e1c3 Peng Ma             2019-05-06   829  			compatible = "fsl,ls1028a-qdma", "fsl,ls1021a-qdma";
7802f88de0e1c3 Peng Ma             2019-05-06   830  			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
7802f88de0e1c3 Peng Ma             2019-05-06   831  			      <0x0 0x8390000 0x0 0x10000>, /* Status regs */
7802f88de0e1c3 Peng Ma             2019-05-06   832  			      <0x0 0x83a0000 0x0 0x40000>; /* Block regs */
7802f88de0e1c3 Peng Ma             2019-05-06   833  			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
7802f88de0e1c3 Peng Ma             2019-05-06   834  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
7802f88de0e1c3 Peng Ma             2019-05-06   835  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
7802f88de0e1c3 Peng Ma             2019-05-06   836  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
7802f88de0e1c3 Peng Ma             2019-05-06   837  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
7802f88de0e1c3 Peng Ma             2019-05-06   838  			interrupt-names = "qdma-error", "qdma-queue0",
7802f88de0e1c3 Peng Ma             2019-05-06   839  				"qdma-queue1", "qdma-queue2", "qdma-queue3";
7802f88de0e1c3 Peng Ma             2019-05-06   840  			dma-channels = <8>;
7802f88de0e1c3 Peng Ma             2019-05-06   841  			block-number = <1>;
7802f88de0e1c3 Peng Ma             2019-05-06   842  			block-offset = <0x10000>;
7802f88de0e1c3 Peng Ma             2019-05-06   843  			fsl,dma-queues = <2>;
7802f88de0e1c3 Peng Ma             2019-05-06   844  			status-sizes = <64>;
7802f88de0e1c3 Peng Ma             2019-05-06   845  			queue-sizes = <64 64>;
7802f88de0e1c3 Peng Ma             2019-05-06   846  		};
7802f88de0e1c3 Peng Ma             2019-05-06   847  
57aa1bc7d17e6f Chuanhua Han        2019-05-28   848  		cluster1_core0_watchdog: watchdog@c000000 {
57aa1bc7d17e6f Chuanhua Han        2019-05-28   849  			compatible = "arm,sp805", "arm,primecell";
57aa1bc7d17e6f Chuanhua Han        2019-05-28   850  			reg = <0x0 0xc000000 0x0 0x1000>;
99314eb13c74b1 Michael Walle       2020-12-29   851  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   852  					    QORIQ_CLK_PLL_DIV(16)>,
99314eb13c74b1 Michael Walle       2020-12-29   853  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   854  					    QORIQ_CLK_PLL_DIV(16)>;
f2dc2359b75e1f Andre Przywara      2020-08-28   855  			clock-names = "wdog_clk", "apb_pclk";
57aa1bc7d17e6f Chuanhua Han        2019-05-28   856  		};
57aa1bc7d17e6f Chuanhua Han        2019-05-28   857  
57aa1bc7d17e6f Chuanhua Han        2019-05-28   858  		cluster1_core1_watchdog: watchdog@c010000 {
57aa1bc7d17e6f Chuanhua Han        2019-05-28   859  			compatible = "arm,sp805", "arm,primecell";
57aa1bc7d17e6f Chuanhua Han        2019-05-28   860  			reg = <0x0 0xc010000 0x0 0x1000>;
99314eb13c74b1 Michael Walle       2020-12-29   861  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   862  					    QORIQ_CLK_PLL_DIV(16)>,
99314eb13c74b1 Michael Walle       2020-12-29   863  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   864  					    QORIQ_CLK_PLL_DIV(16)>;
f2dc2359b75e1f Andre Przywara      2020-08-28   865  			clock-names = "wdog_clk", "apb_pclk";
57aa1bc7d17e6f Chuanhua Han        2019-05-28   866  		};
57aa1bc7d17e6f Chuanhua Han        2019-05-28   867  
7de87eae2d3398 Michael Walle       2021-08-31   868  		malidp0: display@f080000 {
7de87eae2d3398 Michael Walle       2021-08-31   869  			compatible = "arm,mali-dp500";
7de87eae2d3398 Michael Walle       2021-08-31   870  			reg = <0x0 0xf080000 0x0 0x10000>;
7de87eae2d3398 Michael Walle       2021-08-31   871  			interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
7de87eae2d3398 Michael Walle       2021-08-31   872  				     <0 223 IRQ_TYPE_LEVEL_HIGH>;
7de87eae2d3398 Michael Walle       2021-08-31   873  			interrupt-names = "DE", "SE";
7de87eae2d3398 Michael Walle       2021-08-31   874  			clocks = <&dpclk>,
7de87eae2d3398 Michael Walle       2021-08-31   875  				 <&clockgen QORIQ_CLK_HWACCEL 2>,
7de87eae2d3398 Michael Walle       2021-08-31   876  				 <&clockgen QORIQ_CLK_HWACCEL 2>,
7de87eae2d3398 Michael Walle       2021-08-31   877  				 <&clockgen QORIQ_CLK_HWACCEL 2>;
7de87eae2d3398 Michael Walle       2021-08-31   878  			clock-names = "pxlclk", "mclk", "aclk", "pclk";
7de87eae2d3398 Michael Walle       2021-08-31   879  			arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
7de87eae2d3398 Michael Walle       2021-08-31   880  			arm,malidp-arqos-value = <0xd000d000>;
7de87eae2d3398 Michael Walle       2021-08-31   881  
7de87eae2d3398 Michael Walle       2021-08-31   882  			port {
7de87eae2d3398 Michael Walle       2021-08-31   883  				dpi0_out: endpoint {
7de87eae2d3398 Michael Walle       2021-08-31   884  
7de87eae2d3398 Michael Walle       2021-08-31   885  				};
7de87eae2d3398 Michael Walle       2021-08-31   886  			};
7de87eae2d3398 Michael Walle       2021-08-31   887  		};
7de87eae2d3398 Michael Walle       2021-08-31   888  
55ca18c0d906a8 Michael Walle       2021-08-31   889  		gpu: gpu@f0c0000 {
55ca18c0d906a8 Michael Walle       2021-08-31   890  			compatible = "vivante,gc";
55ca18c0d906a8 Michael Walle       2021-08-31   891  			reg = <0x0 0xf0c0000 0x0 0x10000>;
55ca18c0d906a8 Michael Walle       2021-08-31   892  			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
55ca18c0d906a8 Michael Walle       2021-08-31   893  			clocks = <&clockgen QORIQ_CLK_HWACCEL 2>,
55ca18c0d906a8 Michael Walle       2021-08-31   894  				 <&clockgen QORIQ_CLK_HWACCEL 2>,
55ca18c0d906a8 Michael Walle       2021-08-31   895  				 <&clockgen QORIQ_CLK_HWACCEL 2>;
55ca18c0d906a8 Michael Walle       2021-08-31   896  			clock-names = "core", "shader", "bus";
55ca18c0d906a8 Michael Walle       2021-08-31   897  			#cooling-cells = <2>;
55ca18c0d906a8 Michael Walle       2021-08-31   898  		};
55ca18c0d906a8 Michael Walle       2021-08-31   899  
f54f7be5c5acd8 Alison Wang         2019-03-01   900  		sai1: audio-controller@f100000 {
f54f7be5c5acd8 Alison Wang         2019-03-01   901  			#sound-dai-cells = <0>;
f54f7be5c5acd8 Alison Wang         2019-03-01   902  			compatible = "fsl,vf610-sai";
f54f7be5c5acd8 Alison Wang         2019-03-01   903  			reg = <0x0 0xf100000 0x0 0x10000>;
f54f7be5c5acd8 Alison Wang         2019-03-01   904  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   905  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   906  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   907  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   908  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   909  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   910  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   911  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   912  					    QORIQ_CLK_PLL_DIV(2)>;
f54f7be5c5acd8 Alison Wang         2019-03-01   913  			clock-names = "bus", "mclk1", "mclk2", "mclk3";
f54f7be5c5acd8 Alison Wang         2019-03-01   914  			dma-names = "tx", "rx";
f54f7be5c5acd8 Alison Wang         2019-03-01   915  			dmas = <&edma0 1 4>,
f54f7be5c5acd8 Alison Wang         2019-03-01   916  			       <&edma0 1 3>;
9c015e13c875fc Michael Walle       2019-11-29   917  			fsl,sai-asynchronous;
f54f7be5c5acd8 Alison Wang         2019-03-01   918  			status = "disabled";
f54f7be5c5acd8 Alison Wang         2019-03-01   919  		};
f54f7be5c5acd8 Alison Wang         2019-03-01   920  
f54f7be5c5acd8 Alison Wang         2019-03-01   921  		sai2: audio-controller@f110000 {
f54f7be5c5acd8 Alison Wang         2019-03-01   922  			#sound-dai-cells = <0>;
f54f7be5c5acd8 Alison Wang         2019-03-01   923  			compatible = "fsl,vf610-sai";
f54f7be5c5acd8 Alison Wang         2019-03-01   924  			reg = <0x0 0xf110000 0x0 0x10000>;
f54f7be5c5acd8 Alison Wang         2019-03-01   925  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   926  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   927  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   928  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   929  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   930  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   931  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   932  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   933  					    QORIQ_CLK_PLL_DIV(2)>;
f54f7be5c5acd8 Alison Wang         2019-03-01   934  			clock-names = "bus", "mclk1", "mclk2", "mclk3";
f54f7be5c5acd8 Alison Wang         2019-03-01   935  			dma-names = "tx", "rx";
f54f7be5c5acd8 Alison Wang         2019-03-01   936  			dmas = <&edma0 1 6>,
f54f7be5c5acd8 Alison Wang         2019-03-01   937  			       <&edma0 1 5>;
9c015e13c875fc Michael Walle       2019-11-29   938  			fsl,sai-asynchronous;
f54f7be5c5acd8 Alison Wang         2019-03-01   939  			status = "disabled";
f54f7be5c5acd8 Alison Wang         2019-03-01   940  		};
f54f7be5c5acd8 Alison Wang         2019-03-01   941  
434f9cc1f7a038 Michael Walle       2019-12-10   942  		sai3: audio-controller@f120000 {
434f9cc1f7a038 Michael Walle       2019-12-10   943  			#sound-dai-cells = <0>;
434f9cc1f7a038 Michael Walle       2019-12-10   944  			compatible = "fsl,vf610-sai";
434f9cc1f7a038 Michael Walle       2019-12-10   945  			reg = <0x0 0xf120000 0x0 0x10000>;
434f9cc1f7a038 Michael Walle       2019-12-10   946  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   947  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   948  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   949  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   950  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   951  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   952  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   953  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   954  					    QORIQ_CLK_PLL_DIV(2)>;
434f9cc1f7a038 Michael Walle       2019-12-10   955  			clock-names = "bus", "mclk1", "mclk2", "mclk3";
434f9cc1f7a038 Michael Walle       2019-12-10   956  			dma-names = "tx", "rx";
434f9cc1f7a038 Michael Walle       2019-12-10   957  			dmas = <&edma0 1 8>,
434f9cc1f7a038 Michael Walle       2019-12-10   958  			       <&edma0 1 7>;
9c015e13c875fc Michael Walle       2019-11-29   959  			fsl,sai-asynchronous;
f54f7be5c5acd8 Alison Wang         2019-03-01   960  			status = "disabled";
f54f7be5c5acd8 Alison Wang         2019-03-01   961  		};
f54f7be5c5acd8 Alison Wang         2019-03-01   962  
f54f7be5c5acd8 Alison Wang         2019-03-01   963  		sai4: audio-controller@f130000 {
f54f7be5c5acd8 Alison Wang         2019-03-01   964  			#sound-dai-cells = <0>;
f54f7be5c5acd8 Alison Wang         2019-03-01   965  			compatible = "fsl,vf610-sai";
f54f7be5c5acd8 Alison Wang         2019-03-01   966  			reg = <0x0 0xf130000 0x0 0x10000>;
f54f7be5c5acd8 Alison Wang         2019-03-01   967  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   968  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   969  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   970  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   971  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   972  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   973  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   974  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   975  					    QORIQ_CLK_PLL_DIV(2)>;
f54f7be5c5acd8 Alison Wang         2019-03-01   976  			clock-names = "bus", "mclk1", "mclk2", "mclk3";
f54f7be5c5acd8 Alison Wang         2019-03-01   977  			dma-names = "tx", "rx";
f54f7be5c5acd8 Alison Wang         2019-03-01   978  			dmas = <&edma0 1 10>,
f54f7be5c5acd8 Alison Wang         2019-03-01   979  			       <&edma0 1 9>;
9c015e13c875fc Michael Walle       2019-11-29   980  			fsl,sai-asynchronous;
f54f7be5c5acd8 Alison Wang         2019-03-01   981  			status = "disabled";
f54f7be5c5acd8 Alison Wang         2019-03-01   982  		};
f54f7be5c5acd8 Alison Wang         2019-03-01   983  
434f9cc1f7a038 Michael Walle       2019-12-10   984  		sai5: audio-controller@f140000 {
434f9cc1f7a038 Michael Walle       2019-12-10   985  			#sound-dai-cells = <0>;
434f9cc1f7a038 Michael Walle       2019-12-10   986  			compatible = "fsl,vf610-sai";
434f9cc1f7a038 Michael Walle       2019-12-10   987  			reg = <0x0 0xf140000 0x0 0x10000>;
434f9cc1f7a038 Michael Walle       2019-12-10   988  			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29   989  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   990  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   991  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   992  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   993  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   994  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29   995  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29   996  					    QORIQ_CLK_PLL_DIV(2)>;
434f9cc1f7a038 Michael Walle       2019-12-10   997  			clock-names = "bus", "mclk1", "mclk2", "mclk3";
434f9cc1f7a038 Michael Walle       2019-12-10   998  			dma-names = "tx", "rx";
434f9cc1f7a038 Michael Walle       2019-12-10   999  			dmas = <&edma0 1 12>,
434f9cc1f7a038 Michael Walle       2019-12-10  1000  			       <&edma0 1 11>;
9c015e13c875fc Michael Walle       2019-11-29  1001  			fsl,sai-asynchronous;
434f9cc1f7a038 Michael Walle       2019-12-10  1002  			status = "disabled";
434f9cc1f7a038 Michael Walle       2019-12-10  1003  		};
434f9cc1f7a038 Michael Walle       2019-12-10  1004  
434f9cc1f7a038 Michael Walle       2019-12-10  1005  		sai6: audio-controller@f150000 {
434f9cc1f7a038 Michael Walle       2019-12-10  1006  			#sound-dai-cells = <0>;
434f9cc1f7a038 Michael Walle       2019-12-10  1007  			compatible = "fsl,vf610-sai";
434f9cc1f7a038 Michael Walle       2019-12-10  1008  			reg = <0x0 0xf150000 0x0 0x10000>;
434f9cc1f7a038 Michael Walle       2019-12-10  1009  			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
99314eb13c74b1 Michael Walle       2020-12-29  1010  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29  1011  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29  1012  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29  1013  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29  1014  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29  1015  					    QORIQ_CLK_PLL_DIV(2)>,
99314eb13c74b1 Michael Walle       2020-12-29  1016  				 <&clockgen QORIQ_CLK_PLATFORM_PLL
99314eb13c74b1 Michael Walle       2020-12-29  1017  					    QORIQ_CLK_PLL_DIV(2)>;
434f9cc1f7a038 Michael Walle       2019-12-10  1018  			clock-names = "bus", "mclk1", "mclk2", "mclk3";
434f9cc1f7a038 Michael Walle       2019-12-10  1019  			dma-names = "tx", "rx";
434f9cc1f7a038 Michael Walle       2019-12-10  1020  			dmas = <&edma0 1 14>,
434f9cc1f7a038 Michael Walle       2019-12-10  1021  			       <&edma0 1 13>;
9c015e13c875fc Michael Walle       2019-11-29  1022  			fsl,sai-asynchronous;
f54f7be5c5acd8 Alison Wang         2019-03-01  1023  			status = "disabled";
f54f7be5c5acd8 Alison Wang         2019-03-01  1024  		};
f54f7be5c5acd8 Alison Wang         2019-03-01  1025  
b4751afb72299d Michael Walle       2021-08-31  1026  		dpclk: clock-controller@f1f0000 {
b4751afb72299d Michael Walle       2021-08-31  1027  			compatible = "fsl,ls1028a-plldig";
b4751afb72299d Michael Walle       2021-08-31  1028  			reg = <0x0 0xf1f0000 0x0 0x10000>;
b4751afb72299d Michael Walle       2021-08-31  1029  			#clock-cells = <0>;
b4751afb72299d Michael Walle       2021-08-31  1030  			clocks = <&osc_27m>;
b4751afb72299d Michael Walle       2021-08-31  1031  		};
b4751afb72299d Michael Walle       2021-08-31  1032  
0b680963083ee6 Fabio Estevam       2019-10-25  1033  		tmu: tmu@1f80000 {
571cebfe8e2b86 Yuantian Tang       2019-08-06  1034  			compatible = "fsl,qoriq-tmu";
571cebfe8e2b86 Yuantian Tang       2019-08-06  1035  			reg = <0x0 0x1f80000 0x0 0x10000>;
571cebfe8e2b86 Yuantian Tang       2019-08-06  1036  			interrupts = <0 23 0x4>;
571cebfe8e2b86 Yuantian Tang       2019-08-06  1037  			fsl,tmu-range = <0xb0000 0xa0026 0x80048 0x70061>;
f43c3a62e7d57e David Heidelberg    2023-12-16  1038  			fsl,tmu-calibration =
f43c3a62e7d57e David Heidelberg    2023-12-16  1039  					<0x00000000 0x00000024>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1040  					<0x00000001 0x0000002b>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1041  					<0x00000002 0x00000031>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1042  					<0x00000003 0x00000038>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1043  					<0x00000004 0x0000003f>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1044  					<0x00000005 0x00000045>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1045  					<0x00000006 0x0000004c>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1046  					<0x00000007 0x00000053>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1047  					<0x00000008 0x00000059>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1048  					<0x00000009 0x00000060>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1049  					<0x0000000a 0x00000066>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1050  					<0x0000000b 0x0000006d>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1051  
f43c3a62e7d57e David Heidelberg    2023-12-16  1052  					<0x00010000 0x0000001c>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1053  					<0x00010001 0x00000024>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1054  					<0x00010002 0x0000002c>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1055  					<0x00010003 0x00000035>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1056  					<0x00010004 0x0000003d>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1057  					<0x00010005 0x00000045>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1058  					<0x00010006 0x0000004d>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1059  					<0x00010007 0x00000055>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1060  					<0x00010008 0x0000005e>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1061  					<0x00010009 0x00000066>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1062  					<0x0001000a 0x0000006e>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1063  
f43c3a62e7d57e David Heidelberg    2023-12-16  1064  					<0x00020000 0x00000018>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1065  					<0x00020001 0x00000022>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1066  					<0x00020002 0x0000002d>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1067  					<0x00020003 0x00000038>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1068  					<0x00020004 0x00000043>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1069  					<0x00020005 0x0000004d>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1070  					<0x00020006 0x00000058>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1071  					<0x00020007 0x00000063>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1072  					<0x00020008 0x0000006e>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1073  
f43c3a62e7d57e David Heidelberg    2023-12-16  1074  					<0x00030000 0x00000010>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1075  					<0x00030001 0x0000001c>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1076  					<0x00030002 0x00000029>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1077  					<0x00030003 0x00000036>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1078  					<0x00030004 0x00000042>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1079  					<0x00030005 0x0000004f>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1080  					<0x00030006 0x0000005b>,
f43c3a62e7d57e David Heidelberg    2023-12-16  1081  					<0x00030007 0x00000068>;
571cebfe8e2b86 Yuantian Tang       2019-08-06  1082  			little-endian;
571cebfe8e2b86 Yuantian Tang       2019-08-06  1083  			#thermal-sensor-cells = <1>;
571cebfe8e2b86 Yuantian Tang       2019-08-06  1084  		};
571cebfe8e2b86 Yuantian Tang       2019-08-06  1085  
927d7f8575422e Claudiu Manoil      2019-02-26  1086  		pcie@1f0000000 { /* Integrated Endpoint Root Complex */
927d7f8575422e Claudiu Manoil      2019-02-26  1087  			compatible = "pci-host-ecam-generic";
927d7f8575422e Claudiu Manoil      2019-02-26  1088  			reg = <0x01 0xf0000000 0x0 0x100000>;
927d7f8575422e Claudiu Manoil      2019-02-26  1089  			#address-cells = <3>;
927d7f8575422e Claudiu Manoil      2019-02-26  1090  			#size-cells = <2>;
927d7f8575422e Claudiu Manoil      2019-02-26  1091  			msi-parent = <&its>;
927d7f8575422e Claudiu Manoil      2019-02-26  1092  			device_type = "pci";
927d7f8575422e Claudiu Manoil      2019-02-26  1093  			bus-range = <0x0 0x0>;
927d7f8575422e Claudiu Manoil      2019-02-26  1094  			dma-coherent;
927d7f8575422e Claudiu Manoil      2019-02-26  1095  			msi-map = <0 &its 0x17 0xe>;
927d7f8575422e Claudiu Manoil      2019-02-26  1096  			iommu-map = <0 &smmu 0x17 0xe>;
927d7f8575422e Claudiu Manoil      2019-02-26  1097  				  /* PF0-6 BAR0 - non-prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1098  			ranges = <0x82000000 0x1 0xf8000000  0x1 0xf8000000  0x0 0x160000
927d7f8575422e Claudiu Manoil      2019-02-26  1099  				  /* PF0-6 BAR2 - prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1100  				  0xc2000000 0x1 0xf8160000  0x1 0xf8160000  0x0 0x070000
927d7f8575422e Claudiu Manoil      2019-02-26  1101  				  /* PF0: VF0-1 BAR0 - non-prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1102  				  0x82000000 0x1 0xf81d0000  0x1 0xf81d0000  0x0 0x020000
927d7f8575422e Claudiu Manoil      2019-02-26  1103  				  /* PF0: VF0-1 BAR2 - prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1104  				  0xc2000000 0x1 0xf81f0000  0x1 0xf81f0000  0x0 0x020000
927d7f8575422e Claudiu Manoil      2019-02-26  1105  				  /* PF1: VF0-1 BAR0 - non-prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1106  				  0x82000000 0x1 0xf8210000  0x1 0xf8210000  0x0 0x020000
927d7f8575422e Claudiu Manoil      2019-02-26  1107  				  /* PF1: VF0-1 BAR2 - prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1108  				  0xc2000000 0x1 0xf8230000  0x1 0xf8230000  0x0 0x020000
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1109  				  /* BAR4 (PF5) - non-prefetchable memory */
6bee93d93111d7 Kornel Duleba       2021-04-07  1110  				  0x82000000 0x1 0xfc000000  0x1 0xfc000000  0x0 0x400000>;
f1ca4e3890544d Rob Herring (Arm    2024-04-18  1111) 			#interrupt-cells = <1>;
f1ca4e3890544d Rob Herring (Arm    2024-04-18  1112) 			interrupt-map-mask = <0 0 0 7>;
f1ca4e3890544d Rob Herring (Arm    2024-04-18  1113) 			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
f1ca4e3890544d Rob Herring (Arm    2024-04-18  1114) 					<0000 0 0 2 &gic 0 0 GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
927d7f8575422e Claudiu Manoil      2019-02-26  1115  
927d7f8575422e Claudiu Manoil      2019-02-26  1116  			enetc_port0: ethernet@0,0 {
fe3726223cc41e Rob Herring (Arm    2024-04-18  1117) 				compatible = "pci1957,e100", "fsl,enetc";
927d7f8575422e Claudiu Manoil      2019-02-26  1118  				reg = <0x000000 0 0 0 0>;
1a4bfe0f517ac9 Vladimir Oltean     2020-02-23  1119  				status = "disabled";
927d7f8575422e Claudiu Manoil      2019-02-26  1120  			};
1a4bfe0f517ac9 Vladimir Oltean     2020-02-23  1121  
927d7f8575422e Claudiu Manoil      2019-02-26  1122  			enetc_port1: ethernet@0,1 {
fe3726223cc41e Rob Herring (Arm    2024-04-18  1123) 				compatible = "pci1957,e100", "fsl,enetc";
927d7f8575422e Claudiu Manoil      2019-02-26  1124  				reg = <0x000100 0 0 0 0>;
1a4bfe0f517ac9 Vladimir Oltean     2020-02-23  1125  				status = "disabled";
927d7f8575422e Claudiu Manoil      2019-02-26  1126  			};
1a4bfe0f517ac9 Vladimir Oltean     2020-02-23  1127  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1128  			enetc_port2: ethernet@0,2 {
fe3726223cc41e Rob Herring (Arm    2024-04-18  1129) 				compatible = "pci1957,e100", "fsl,enetc";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1130  				reg = <0x000200 0 0 0 0>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1131  				phy-mode = "internal";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1132  				status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1133  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1134  				fixed-link {
2c832fe41a8d79 Vladimir Oltean     2021-03-08  1135  					speed = <2500>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1136  					full-duplex;
8fcea7be57365d Vladimir Oltean     2021-09-29  1137  					pause;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1138  				};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1139  			};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1140  
8488d8e90c0398 Claudiu Manoil      2019-08-01  1141  			enetc_mdio_pf3: mdio@0,3 {
fe3726223cc41e Rob Herring (Arm    2024-04-18  1142) 				compatible = "pci1957,ee01", "fsl,enetc-mdio";
8488d8e90c0398 Claudiu Manoil      2019-08-01  1143  				reg = <0x000300 0 0 0 0>;
8488d8e90c0398 Claudiu Manoil      2019-08-01  1144  				#address-cells = <1>;
8488d8e90c0398 Claudiu Manoil      2019-08-01  1145  				#size-cells = <0>;
8488d8e90c0398 Claudiu Manoil      2019-08-01  1146  			};
1a4bfe0f517ac9 Vladimir Oltean     2020-02-23  1147  
49401003e26073 Y.b. Lu             2019-05-23  1148  			ethernet@0,4 {
fe3726223cc41e Rob Herring (Arm    2024-04-18  1149) 				compatible = "pci1957,ee02", "fsl,enetc-ptp";
49401003e26073 Y.b. Lu             2019-05-23  1150  				reg = <0x000400 0 0 0 0>;
99314eb13c74b1 Michael Walle       2020-12-29  1151  				clocks = <&clockgen QORIQ_CLK_HWACCEL 3>;
49401003e26073 Y.b. Lu             2019-05-23  1152  				little-endian;
ab84bad5bb891b Yangbo Lu           2020-02-11  1153  				fsl,extts-fifo;
49401003e26073 Y.b. Lu             2019-05-23  1154  			};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1155  
630952e1f81681 Michael Walle       2020-03-12  1156  			mscc_felix: ethernet-switch@0,5 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1157  				reg = <0x000500 0 0 0 0>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1158  				/* IEP INT_B */
f1ca4e3890544d Rob Herring (Arm    2024-04-18  1159) 				interrupts = <2>;
630952e1f81681 Michael Walle       2020-03-12  1160  				status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1161  
e426d63e752bdb Alex Marginean      2021-12-14  1162  				mscc_felix_ports: ports {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1163  					#address-cells = <1>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1164  					#size-cells = <0>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1165  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1166  					/* External ports */
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1167  					mscc_felix_port0: port@0 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1168  						reg = <0>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1169  						status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1170  					};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1171  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1172  					mscc_felix_port1: port@1 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1173  						reg = <1>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1174  						status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1175  					};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1176  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1177  					mscc_felix_port2: port@2 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1178  						reg = <2>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1179  						status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1180  					};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1181  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1182  					mscc_felix_port3: port@3 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1183  						reg = <3>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1184  						status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1185  					};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1186  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1187  					/* Internal ports */
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1188  					mscc_felix_port4: port@4 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1189  						reg = <4>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1190  						phy-mode = "internal";
b340ee0263f44f Vladimir Oltean     2022-08-31  1191  						ethernet = <&enetc_port2>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1192  						status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1193  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1194  						fixed-link {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1195  							speed = <2500>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1196  							full-duplex;
8fcea7be57365d Vladimir Oltean     2021-09-29  1197  							pause;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1198  						};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1199  					};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1200  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1201  					mscc_felix_port5: port@5 {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1202  						reg = <5>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1203  						phy-mode = "internal";
d72e3b4e76db2a Vladimir Oltean     2022-08-31  1204  						ethernet = <&enetc_port3>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1205  						status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1206  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1207  						fixed-link {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1208  							speed = <1000>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1209  							full-duplex;
8fcea7be57365d Vladimir Oltean     2021-09-29  1210  							pause;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1211  						};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1212  					};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1213  				};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1214  			};
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1215  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1216  			enetc_port3: ethernet@0,6 {
fe3726223cc41e Rob Herring (Arm    2024-04-18  1217) 				compatible = "pci1957,e100", "fsl,enetc";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1218  				reg = <0x000600 0 0 0 0>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1219  				phy-mode = "internal";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1220  				status = "disabled";
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1221  
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1222  				fixed-link {
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1223  					speed = <1000>;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1224  					full-duplex;
8fcea7be57365d Vladimir Oltean     2021-09-29  1225  					pause;
b1520d8b9b0d19 Claudiu Manoil      2020-02-24  1226  				};
49401003e26073 Y.b. Lu             2019-05-23  1227  			};
dfee46f17b4a5e Michael Walle       2021-02-09  1228  
dfee46f17b4a5e Michael Walle       2021-02-09  1229  			rcec@1f,0 {
dfee46f17b4a5e Michael Walle       2021-02-09  1230  				reg = <0x00f800 0 0 0 0>;
dfee46f17b4a5e Michael Walle       2021-02-09  1231  				/* IEP INT_A */
f1ca4e3890544d Rob Herring (Arm    2024-04-18  1232) 				interrupts = <1>;
dfee46f17b4a5e Michael Walle       2021-02-09  1233  			};
927d7f8575422e Claudiu Manoil      2019-02-26  1234  		};
791c88ca57139e Biwen Li            2020-06-24  1235  
b764dc6cc1ba8b Vladimir Oltean     2021-04-17  1236  		/* Integrated Endpoint Register Block */
b764dc6cc1ba8b Vladimir Oltean     2021-04-17  1237  		ierb@1f0800000 {
b764dc6cc1ba8b Vladimir Oltean     2021-04-17  1238  			compatible = "fsl,ls1028a-enetc-ierb";
b764dc6cc1ba8b Vladimir Oltean     2021-04-17  1239  			reg = <0x01 0xf0800000 0x0 0x10000>;
b764dc6cc1ba8b Vladimir Oltean     2021-04-17  1240  		};
b764dc6cc1ba8b Vladimir Oltean     2021-04-17  1241  
71799672ea24d2 Biwen Li            2021-12-14  1242  		pwm0: pwm@2800000 {
71799672ea24d2 Biwen Li            2021-12-14  1243  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1244  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1245  			reg = <0x0 0x2800000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1246  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1247  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1248  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1249  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1250  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1251  		};
71799672ea24d2 Biwen Li            2021-12-14  1252  
71799672ea24d2 Biwen Li            2021-12-14  1253  		pwm1: pwm@2810000 {
71799672ea24d2 Biwen Li            2021-12-14  1254  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1255  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1256  			reg = <0x0 0x2810000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1257  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1258  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1259  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1260  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1261  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1262  		};
71799672ea24d2 Biwen Li            2021-12-14  1263  
71799672ea24d2 Biwen Li            2021-12-14  1264  		pwm2: pwm@2820000 {
71799672ea24d2 Biwen Li            2021-12-14  1265  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1266  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1267  			reg = <0x0 0x2820000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1268  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1269  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1270  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1271  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1272  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1273  		};
71799672ea24d2 Biwen Li            2021-12-14  1274  
71799672ea24d2 Biwen Li            2021-12-14  1275  		pwm3: pwm@2830000 {
71799672ea24d2 Biwen Li            2021-12-14  1276  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1277  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1278  			reg = <0x0 0x2830000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1279  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1280  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1281  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1282  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1283  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1284  		};
71799672ea24d2 Biwen Li            2021-12-14  1285  
71799672ea24d2 Biwen Li            2021-12-14  1286  		pwm4: pwm@2840000 {
71799672ea24d2 Biwen Li            2021-12-14  1287  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1288  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1289  			reg = <0x0 0x2840000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1290  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1291  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1292  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1293  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1294  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1295  		};
71799672ea24d2 Biwen Li            2021-12-14  1296  
71799672ea24d2 Biwen Li            2021-12-14  1297  		pwm5: pwm@2850000 {
71799672ea24d2 Biwen Li            2021-12-14  1298  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1299  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1300  			reg = <0x0 0x2850000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1301  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1302  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1303  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1304  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1305  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1306  		};
71799672ea24d2 Biwen Li            2021-12-14  1307  
71799672ea24d2 Biwen Li            2021-12-14  1308  		pwm6: pwm@2860000 {
71799672ea24d2 Biwen Li            2021-12-14  1309  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1310  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1311  			reg = <0x0 0x2860000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1312  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1313  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1314  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1315  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1316  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1317  		};
71799672ea24d2 Biwen Li            2021-12-14  1318  
71799672ea24d2 Biwen Li            2021-12-14  1319  		pwm7: pwm@2870000 {
71799672ea24d2 Biwen Li            2021-12-14  1320  			compatible = "fsl,vf610-ftm-pwm";
71799672ea24d2 Biwen Li            2021-12-14  1321  			#pwm-cells = <3>;
71799672ea24d2 Biwen Li            2021-12-14  1322  			reg = <0x0 0x2870000 0x0 0x10000>;
71799672ea24d2 Biwen Li            2021-12-14  1323  			clock-names = "ftm_sys", "ftm_ext",
71799672ea24d2 Biwen Li            2021-12-14  1324  				      "ftm_fix", "ftm_cnt_clk_en";
71799672ea24d2 Biwen Li            2021-12-14  1325  			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
71799672ea24d2 Biwen Li            2021-12-14  1326  				 <&rtc_clk>, <&clockgen 4 1>;
71799672ea24d2 Biwen Li            2021-12-14  1327  			status = "disabled";
71799672ea24d2 Biwen Li            2021-12-14  1328  		};
71799672ea24d2 Biwen Li            2021-12-14  1329  
791c88ca57139e Biwen Li            2020-06-24  1330  		rcpm: power-controller@1e34040 {
791c88ca57139e Biwen Li            2020-06-24  1331  			compatible = "fsl,ls1028a-rcpm", "fsl,qoriq-rcpm-2.1+";
791c88ca57139e Biwen Li            2020-06-24  1332  			reg = <0x0 0x1e34040 0x0 0x1c>;
791c88ca57139e Biwen Li            2020-06-24  1333  			#fsl,rcpm-wakeup-cells = <7>;
d92454287ee25d Biwen Li            2020-09-29  1334  			little-endian;
791c88ca57139e Biwen Li            2020-06-24  1335  		};
791c88ca57139e Biwen Li            2020-06-24  1336  
791c88ca57139e Biwen Li            2020-06-24  1337  		ftm_alarm0: timer@2800000 {
791c88ca57139e Biwen Li            2020-06-24  1338  			compatible = "fsl,ls1028a-ftm-alarm";
791c88ca57139e Biwen Li            2020-06-24  1339  			reg = <0x0 0x2800000 0x0 0x10000>;
791c88ca57139e Biwen Li            2020-06-24  1340  			fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0 0x0>;
791c88ca57139e Biwen Li            2020-06-24  1341  			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
dd3d936a1b17d2 Biwen Li            2021-12-14  1342  			status = "disabled";
dd3d936a1b17d2 Biwen Li            2021-12-14  1343  		};
dd3d936a1b17d2 Biwen Li            2021-12-14  1344  
dd3d936a1b17d2 Biwen Li            2021-12-14  1345  		ftm_alarm1: timer@2810000 {
dd3d936a1b17d2 Biwen Li            2021-12-14  1346  			compatible = "fsl,ls1028a-ftm-alarm";
dd3d936a1b17d2 Biwen Li            2021-12-14  1347  			reg = <0x0 0x2810000 0x0 0x10000>;
dd3d936a1b17d2 Biwen Li            2021-12-14  1348  			fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0 0x0>;
dd3d936a1b17d2 Biwen Li            2021-12-14  1349  			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
dd3d936a1b17d2 Biwen Li            2021-12-14  1350  			status = "disabled";
791c88ca57139e Biwen Li            2020-06-24  1351  		};
8897f3255c9c41 Bhaskar Upadhaya    2018-11-14  1352  	};
7f538f199f71b0 Wen He              2019-05-10  1353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
