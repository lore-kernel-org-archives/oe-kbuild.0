Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BA11DD0E9
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170106; cv=none; b=PfKUiNRroE1hqh58VCe4I0Ium84LrzvZXKVmdrir8mXFkl8/4ah6KSRH5BCkAUcAMU7VfCd3GXJxhqbpCq9zkhiMbXtiVgIhOCyZjpIZRJV5zwrONhIty965K0bzd+mOnsg/SqMsO9n/wxoXuw9fycmkjrHPccutf10S7mYiwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170106; c=relaxed/simple;
	bh=5N55mt7QaVhrQFPwfua4stgiaydqPmAEw87bxcBlDuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpbfEbV4eRC4/Vm2gDSxyzK9x/pmOu3CMTp4ZyS4ph/oHcw7SbGi6YJEElhIKDpq7cwBJ7lnqk0ZlTDaJamJz1mTwsyBH3Va+Nf8p3MPmMTSRnzZ57YmvBd2Tn/QMCYVYJtqqpiFJV++rRGng5exyOiAW9jCgaNaF5gRaFQgJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+1SVWJa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+1SVWJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170103; x=1760706103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5N55mt7QaVhrQFPwfua4stgiaydqPmAEw87bxcBlDuU=;
  b=P+1SVWJa3Qq1ZbJKGMBehyHhvDBT78kq/5r5vPj+WoOJETSHylwwsIBG
   2Rm0Wk4ERtTOw9fCU5qZy1w9OXgADJ7Nqn4+InJBCRv+bmkZYhZSgRF24
   IA2+PXGJ1zTWDlNeOAb6Y4TCyZCQE3GvRo/I+PlhOn4wnpNU25WfWbe1I
   CMKAZOotZy6cu2VyVwQOREE1bGi8qc3etybmoKtSpKOa0Ad5TXHPY7x1m
   b74XPGnZTxZanKYLFzPfyZ+TZmlnYHZQk6TUlG5k2VW8Kum2JmDdG2NJ1
   P8pe+f3FBulUJkd46ktYbX/UwzkH3t9dKzNEyS/ChIXfE08xgoddJD5qL
   w==;
X-CSE-ConnectionGUID: nvJ5HFxrTHmNUGXcwBydog==
X-CSE-MsgGUID: 2vx8d2QwTUW6UXidoqWSRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28606543"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28606543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:01:41 -0700
X-CSE-ConnectionGUID: SpAi5EDqSBGqpm76Vo20Ww==
X-CSE-MsgGUID: vxY4hVBJQd2MiikQnFDPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83186858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2024 06:01:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Q81-000MKx-0A;
	Thu, 17 Oct 2024 13:01:21 +0000
Date: Thu, 17 Oct 2024 21:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Message-ID: <202410172027.P9HUVmQB-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241016-imx-se-if-v9-3-fd8fa0c04eab@nxp.com>
References: <20241016-imx-se-if-v9-3-fd8fa0c04eab@nxp.com>
TO: Pankaj Gupta <pankaj.gupta@nxp.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Pankaj Gupta <pankaj.gupta@nxp.com>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20241017-002539
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241016-imx-se-if-v9-3-fd8fa0c04eab%40nxp.com
patch subject: [PATCH v9 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave firmware
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-001-20241017 (https://download.01.org/0day-ci/archive/20241017/202410172027.P9HUVmQB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410172027.P9HUVmQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410172027.P9HUVmQB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8ulp.dtsi:169.11-196.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +169 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

fe6291e963134d Jacky Bai           2021-11-26   13  
fe6291e963134d Jacky Bai           2021-11-26   14  / {
fe6291e963134d Jacky Bai           2021-11-26   15  	interrupt-parent = <&gic>;
fe6291e963134d Jacky Bai           2021-11-26   16  	#address-cells = <2>;
fe6291e963134d Jacky Bai           2021-11-26   17  	#size-cells = <2>;
fe6291e963134d Jacky Bai           2021-11-26   18  
fe6291e963134d Jacky Bai           2021-11-26   19  	aliases {
683d7ffb7daaab Wei Fang            2022-07-27   20  		ethernet0 = &fec;
fe6291e963134d Jacky Bai           2021-11-26   21  		gpio0 = &gpiod;
fe6291e963134d Jacky Bai           2021-11-26   22  		gpio1 = &gpioe;
fe6291e963134d Jacky Bai           2021-11-26   23  		gpio2 = &gpiof;
fe6291e963134d Jacky Bai           2021-11-26   24  		mmc0 = &usdhc0;
fe6291e963134d Jacky Bai           2021-11-26   25  		mmc1 = &usdhc1;
fe6291e963134d Jacky Bai           2021-11-26   26  		mmc2 = &usdhc2;
fe6291e963134d Jacky Bai           2021-11-26   27  		serial0 = &lpuart4;
fe6291e963134d Jacky Bai           2021-11-26   28  		serial1 = &lpuart5;
fe6291e963134d Jacky Bai           2021-11-26   29  		serial2 = &lpuart6;
fe6291e963134d Jacky Bai           2021-11-26   30  		serial3 = &lpuart7;
fe6291e963134d Jacky Bai           2021-11-26   31  	};
fe6291e963134d Jacky Bai           2021-11-26   32  
fe6291e963134d Jacky Bai           2021-11-26   33  	cpus {
fe6291e963134d Jacky Bai           2021-11-26   34  		#address-cells = <2>;
fe6291e963134d Jacky Bai           2021-11-26   35  		#size-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26   36  
fe6291e963134d Jacky Bai           2021-11-26   37  		A35_0: cpu@0 {
fe6291e963134d Jacky Bai           2021-11-26   38  			device_type = "cpu";
fe6291e963134d Jacky Bai           2021-11-26   39  			compatible = "arm,cortex-a35";
fe6291e963134d Jacky Bai           2021-11-26   40  			reg = <0x0 0x0>;
fe6291e963134d Jacky Bai           2021-11-26   41  			enable-method = "psci";
fe6291e963134d Jacky Bai           2021-11-26   42  			next-level-cache = <&A35_L2>;
db2c35aa68efba Peng Fan            2023-07-24   43  			cpu-idle-states = <&cpu_sleep>;
fe6291e963134d Jacky Bai           2021-11-26   44  		};
fe6291e963134d Jacky Bai           2021-11-26   45  
fe6291e963134d Jacky Bai           2021-11-26   46  		A35_1: cpu@1 {
fe6291e963134d Jacky Bai           2021-11-26   47  			device_type = "cpu";
fe6291e963134d Jacky Bai           2021-11-26   48  			compatible = "arm,cortex-a35";
fe6291e963134d Jacky Bai           2021-11-26   49  			reg = <0x0 0x1>;
fe6291e963134d Jacky Bai           2021-11-26   50  			enable-method = "psci";
fe6291e963134d Jacky Bai           2021-11-26   51  			next-level-cache = <&A35_L2>;
db2c35aa68efba Peng Fan            2023-07-24   52  			cpu-idle-states = <&cpu_sleep>;
fe6291e963134d Jacky Bai           2021-11-26   53  		};
fe6291e963134d Jacky Bai           2021-11-26   54  
fe6291e963134d Jacky Bai           2021-11-26   55  		A35_L2: l2-cache0 {
fe6291e963134d Jacky Bai           2021-11-26   56  			compatible = "cache";
3b450831e5f1af Pierre Gondois      2022-11-07   57  			cache-level = <2>;
d2bd947176f855 Krzysztof Kozlowski 2023-04-22   58  			cache-unified;
fe6291e963134d Jacky Bai           2021-11-26   59  		};
db2c35aa68efba Peng Fan            2023-07-24   60  
db2c35aa68efba Peng Fan            2023-07-24   61  		idle-states {
db2c35aa68efba Peng Fan            2023-07-24   62  			entry-method = "psci";
db2c35aa68efba Peng Fan            2023-07-24   63  
db2c35aa68efba Peng Fan            2023-07-24   64  			cpu_sleep: cpu-sleep {
db2c35aa68efba Peng Fan            2023-07-24   65  				compatible = "arm,idle-state";
db2c35aa68efba Peng Fan            2023-07-24   66  				arm,psci-suspend-param = <0x0>;
db2c35aa68efba Peng Fan            2023-07-24   67  				local-timer-stop;
db2c35aa68efba Peng Fan            2023-07-24   68  				entry-latency-us = <1000>;
db2c35aa68efba Peng Fan            2023-07-24   69  				exit-latency-us = <700>;
db2c35aa68efba Peng Fan            2023-07-24   70  				min-residency-us = <2700>;
db2c35aa68efba Peng Fan            2023-07-24   71  			};
db2c35aa68efba Peng Fan            2023-07-24   72  		};
fe6291e963134d Jacky Bai           2021-11-26   73  	};
fe6291e963134d Jacky Bai           2021-11-26   74  
fe6291e963134d Jacky Bai           2021-11-26   75  	gic: interrupt-controller@2d400000 {
fe6291e963134d Jacky Bai           2021-11-26   76  		compatible = "arm,gic-v3";
fe6291e963134d Jacky Bai           2021-11-26   77  		reg = <0x0 0x2d400000 0 0x10000>, /* GIC Dist */
fe6291e963134d Jacky Bai           2021-11-26   78  		      <0x0 0x2d440000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
fe6291e963134d Jacky Bai           2021-11-26   79  		#interrupt-cells = <3>;
fe6291e963134d Jacky Bai           2021-11-26   80  		interrupt-controller;
fe6291e963134d Jacky Bai           2021-11-26   81  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d Jacky Bai           2021-11-26   82  	};
fe6291e963134d Jacky Bai           2021-11-26   83  
ed4b58fa5ae715 Peng Fan            2022-08-31   84  	pmu {
ed4b58fa5ae715 Peng Fan            2022-08-31   85  		compatible = "arm,cortex-a35-pmu";
ed4b58fa5ae715 Peng Fan            2022-08-31   86  		interrupt-parent = <&gic>;
ed4b58fa5ae715 Peng Fan            2022-08-31   87  		interrupts = <GIC_PPI 7
ed4b58fa5ae715 Peng Fan            2022-08-31   88  			     (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
ed4b58fa5ae715 Peng Fan            2022-08-31   89  		interrupt-affinity = <&A35_0>, <&A35_1>;
ed4b58fa5ae715 Peng Fan            2022-08-31   90  	};
ed4b58fa5ae715 Peng Fan            2022-08-31   91  
fe6291e963134d Jacky Bai           2021-11-26   92  	psci {
fe6291e963134d Jacky Bai           2021-11-26   93  		compatible = "arm,psci-1.0";
fe6291e963134d Jacky Bai           2021-11-26   94  		method = "smc";
fe6291e963134d Jacky Bai           2021-11-26   95  	};
fe6291e963134d Jacky Bai           2021-11-26   96  
a9624b4e7ea2fa Peng Fan            2023-07-24   97  	thermal-zones {
a9624b4e7ea2fa Peng Fan            2023-07-24   98  		cpu-thermal {
a9624b4e7ea2fa Peng Fan            2023-07-24   99  			polling-delay-passive = <250>;
a9624b4e7ea2fa Peng Fan            2023-07-24  100  			polling-delay = <2000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  101  			thermal-sensors = <&scmi_sensor 0>;
a9624b4e7ea2fa Peng Fan            2023-07-24  102  
a9624b4e7ea2fa Peng Fan            2023-07-24  103  			trips {
a9624b4e7ea2fa Peng Fan            2023-07-24  104  				cpu_alert0: trip0 {
a9624b4e7ea2fa Peng Fan            2023-07-24  105  					temperature = <85000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  106  					hysteresis = <2000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  107  					type = "passive";
a9624b4e7ea2fa Peng Fan            2023-07-24  108  				};
a9624b4e7ea2fa Peng Fan            2023-07-24  109  
a9624b4e7ea2fa Peng Fan            2023-07-24  110  				cpu_crit0: trip1 {
a9624b4e7ea2fa Peng Fan            2023-07-24  111  					temperature = <95000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  112  					hysteresis = <2000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  113  					type = "critical";
a9624b4e7ea2fa Peng Fan            2023-07-24  114  				};
a9624b4e7ea2fa Peng Fan            2023-07-24  115  			};
a9624b4e7ea2fa Peng Fan            2023-07-24  116  		};
a9624b4e7ea2fa Peng Fan            2023-07-24  117  	};
a9624b4e7ea2fa Peng Fan            2023-07-24  118  
fe6291e963134d Jacky Bai           2021-11-26  119  	timer {
fe6291e963134d Jacky Bai           2021-11-26  120  		compatible = "arm,armv8-timer";
fe6291e963134d Jacky Bai           2021-11-26  121  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
fe6291e963134d Jacky Bai           2021-11-26  122  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
fe6291e963134d Jacky Bai           2021-11-26  123  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
fe6291e963134d Jacky Bai           2021-11-26  124  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
fe6291e963134d Jacky Bai           2021-11-26  125  	};
fe6291e963134d Jacky Bai           2021-11-26  126  
fe6291e963134d Jacky Bai           2021-11-26  127  	frosc: clock-frosc {
fe6291e963134d Jacky Bai           2021-11-26  128  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  129  		clock-frequency = <192000000>;
fe6291e963134d Jacky Bai           2021-11-26  130  		clock-output-names = "frosc";
fe6291e963134d Jacky Bai           2021-11-26  131  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  132  	};
fe6291e963134d Jacky Bai           2021-11-26  133  
fe6291e963134d Jacky Bai           2021-11-26  134  	lposc: clock-lposc {
fe6291e963134d Jacky Bai           2021-11-26  135  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  136  		clock-frequency = <1000000>;
fe6291e963134d Jacky Bai           2021-11-26  137  		clock-output-names = "lposc";
fe6291e963134d Jacky Bai           2021-11-26  138  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  139  	};
fe6291e963134d Jacky Bai           2021-11-26  140  
fe6291e963134d Jacky Bai           2021-11-26  141  	rosc: clock-rosc {
fe6291e963134d Jacky Bai           2021-11-26  142  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  143  		clock-frequency = <32768>;
fe6291e963134d Jacky Bai           2021-11-26  144  		clock-output-names = "rosc";
fe6291e963134d Jacky Bai           2021-11-26  145  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  146  	};
fe6291e963134d Jacky Bai           2021-11-26  147  
fe6291e963134d Jacky Bai           2021-11-26  148  	sosc: clock-sosc {
fe6291e963134d Jacky Bai           2021-11-26  149  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  150  		clock-frequency = <24000000>;
fe6291e963134d Jacky Bai           2021-11-26  151  		clock-output-names = "sosc";
fe6291e963134d Jacky Bai           2021-11-26  152  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  153  	};
fe6291e963134d Jacky Bai           2021-11-26  154  
7c6e27034e39eb Pankaj Gupta        2024-10-16  155  	sram0: sram@2201f000 {
a38771d7a49baf Peng Fan            2021-12-08  156  		compatible = "mmio-sram";
a38771d7a49baf Peng Fan            2021-12-08  157  		reg = <0x0 0x2201f000 0x0 0x1000>;
a38771d7a49baf Peng Fan            2021-12-08  158  
a38771d7a49baf Peng Fan            2021-12-08  159  		#address-cells = <1>;
a38771d7a49baf Peng Fan            2021-12-08  160  		#size-cells = <1>;
a38771d7a49baf Peng Fan            2021-12-08  161  		ranges = <0 0x0 0x2201f000 0x1000>;
a38771d7a49baf Peng Fan            2021-12-08  162  
b2ca63697b0d9b Peng Fan            2022-08-31  163  		scmi_buf: scmi-sram-section@0 {
a38771d7a49baf Peng Fan            2021-12-08  164  			compatible = "arm,scmi-shmem";
a38771d7a49baf Peng Fan            2021-12-08  165  			reg = <0x0 0x400>;
a38771d7a49baf Peng Fan            2021-12-08  166  		};
a38771d7a49baf Peng Fan            2021-12-08  167  	};
a38771d7a49baf Peng Fan            2021-12-08  168  
a38771d7a49baf Peng Fan            2021-12-08 @169  	firmware {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
