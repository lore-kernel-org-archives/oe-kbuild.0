Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629C015383D
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 20:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737403502; cv=none; b=CanHbhovUsYuF9ihrKHzBGakKTbbNiAngzW20HQYFuoGM9iW4YiyjBrJHGMljUjRHlFfBz+oJgOcBjhfQwXw3oUxK726nlE+91XhN1E6NLebd03VBUrj9XRkgJDpIJHQWEZbHy4BEovWWoaOYq4HJEc6dzlXltPSiamHqwgg2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737403502; c=relaxed/simple;
	bh=V5nhVc6x0nAn6LBtm/2mrbHDpsKzb2dUDIEIciTLRD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKol/b7i4wv8GpqrRgHz761hxvv3zFi0FcXilc5nxoJhmJjTqlPi1EikxbTS+VePSPbaXTW8sw01j40AQSLJmDW1QP8sYUgQrDoVe+P4nx/5+NUSudFNjzwnVhElNL3yywxVe9JeisWLAtF1hJynGspJo5a8KMo9cMeBjIuvzBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYnZcfDZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYnZcfDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737403500; x=1768939500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5nhVc6x0nAn6LBtm/2mrbHDpsKzb2dUDIEIciTLRD0=;
  b=XYnZcfDZzBaH8WRZCzHcvq+kYFePSqq+gEPh9yO3BsCabnNbw+ZhRpGN
   wfiaVvgQiP92J9s0TpoBwTr7V4hRN8CrVwk6BOSNxgO3N2VuECs5kAjmi
   AUeS/ur1WE5iyHhXC9+BmKX5ShYxWmi7qRBm+/Q7aLeXw5s/dn/+58Vji
   Bmc5on71UAYUP7VWKrIkpLhQ3g48IP1DXH6w4kOcv+s9bsDzHsPwlLg7t
   J4oa0ADL3KFn81tmnsPkNL0Q1z2DXF6yvUuyAWzDCOuPsPWCm3q8Dx4PO
   VCHnlSf882KIphj/UPjdilrC99re2x4cQJn/1KOXEVcJ1mvGo9eDdTm9a
   Q==;
X-CSE-ConnectionGUID: h+rck4cBQgeynI7L9miaqQ==
X-CSE-MsgGUID: 3qZrExCrQFqhE9wANbUM+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37721690"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37721690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 12:05:00 -0800
X-CSE-ConnectionGUID: r7edEi6QQvuG6Wd/X1tz3w==
X-CSE-MsgGUID: +Irm/jdCSw+W3g8bpmqdig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107514526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2025 12:04:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZy12-000WwB-0E;
	Mon, 20 Jan 2025 20:04:56 +0000
Date: Tue, 21 Jan 2025 04:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v12 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Message-ID: <202501210340.MTgMPqqb-lkp@intel.com>
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
In-Reply-To: <20250120-imx-se-if-v12-3-c5ec9754570c@nxp.com>
References: <20250120-imx-se-if-v12-3-c5ec9754570c@nxp.com>
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

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20250120-193050
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250120-imx-se-if-v12-3-c5ec9754570c%40nxp.com
patch subject: [PATCH v12 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave firmware
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210340.MTgMPqqb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210340.MTgMPqqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501210340.MTgMPqqb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8ulp.dtsi:171.11-198.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +171 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

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
226e3933052683 Carlos Song         2024-10-18   31  		spi0 = &lpspi4;
226e3933052683 Carlos Song         2024-10-18   32  		spi1 = &lpspi5;
fe6291e963134d Jacky Bai           2021-11-26   33  	};
fe6291e963134d Jacky Bai           2021-11-26   34  
fe6291e963134d Jacky Bai           2021-11-26   35  	cpus {
fe6291e963134d Jacky Bai           2021-11-26   36  		#address-cells = <2>;
fe6291e963134d Jacky Bai           2021-11-26   37  		#size-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26   38  
fe6291e963134d Jacky Bai           2021-11-26   39  		A35_0: cpu@0 {
fe6291e963134d Jacky Bai           2021-11-26   40  			device_type = "cpu";
fe6291e963134d Jacky Bai           2021-11-26   41  			compatible = "arm,cortex-a35";
fe6291e963134d Jacky Bai           2021-11-26   42  			reg = <0x0 0x0>;
fe6291e963134d Jacky Bai           2021-11-26   43  			enable-method = "psci";
fe6291e963134d Jacky Bai           2021-11-26   44  			next-level-cache = <&A35_L2>;
db2c35aa68efba Peng Fan            2023-07-24   45  			cpu-idle-states = <&cpu_sleep>;
fe6291e963134d Jacky Bai           2021-11-26   46  		};
fe6291e963134d Jacky Bai           2021-11-26   47  
fe6291e963134d Jacky Bai           2021-11-26   48  		A35_1: cpu@1 {
fe6291e963134d Jacky Bai           2021-11-26   49  			device_type = "cpu";
fe6291e963134d Jacky Bai           2021-11-26   50  			compatible = "arm,cortex-a35";
fe6291e963134d Jacky Bai           2021-11-26   51  			reg = <0x0 0x1>;
fe6291e963134d Jacky Bai           2021-11-26   52  			enable-method = "psci";
fe6291e963134d Jacky Bai           2021-11-26   53  			next-level-cache = <&A35_L2>;
db2c35aa68efba Peng Fan            2023-07-24   54  			cpu-idle-states = <&cpu_sleep>;
fe6291e963134d Jacky Bai           2021-11-26   55  		};
fe6291e963134d Jacky Bai           2021-11-26   56  
fe6291e963134d Jacky Bai           2021-11-26   57  		A35_L2: l2-cache0 {
fe6291e963134d Jacky Bai           2021-11-26   58  			compatible = "cache";
3b450831e5f1af Pierre Gondois      2022-11-07   59  			cache-level = <2>;
d2bd947176f855 Krzysztof Kozlowski 2023-04-22   60  			cache-unified;
fe6291e963134d Jacky Bai           2021-11-26   61  		};
db2c35aa68efba Peng Fan            2023-07-24   62  
db2c35aa68efba Peng Fan            2023-07-24   63  		idle-states {
db2c35aa68efba Peng Fan            2023-07-24   64  			entry-method = "psci";
db2c35aa68efba Peng Fan            2023-07-24   65  
db2c35aa68efba Peng Fan            2023-07-24   66  			cpu_sleep: cpu-sleep {
db2c35aa68efba Peng Fan            2023-07-24   67  				compatible = "arm,idle-state";
db2c35aa68efba Peng Fan            2023-07-24   68  				arm,psci-suspend-param = <0x0>;
db2c35aa68efba Peng Fan            2023-07-24   69  				local-timer-stop;
db2c35aa68efba Peng Fan            2023-07-24   70  				entry-latency-us = <1000>;
db2c35aa68efba Peng Fan            2023-07-24   71  				exit-latency-us = <700>;
db2c35aa68efba Peng Fan            2023-07-24   72  				min-residency-us = <2700>;
db2c35aa68efba Peng Fan            2023-07-24   73  			};
db2c35aa68efba Peng Fan            2023-07-24   74  		};
fe6291e963134d Jacky Bai           2021-11-26   75  	};
fe6291e963134d Jacky Bai           2021-11-26   76  
fe6291e963134d Jacky Bai           2021-11-26   77  	gic: interrupt-controller@2d400000 {
fe6291e963134d Jacky Bai           2021-11-26   78  		compatible = "arm,gic-v3";
fe6291e963134d Jacky Bai           2021-11-26   79  		reg = <0x0 0x2d400000 0 0x10000>, /* GIC Dist */
fe6291e963134d Jacky Bai           2021-11-26   80  		      <0x0 0x2d440000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
fe6291e963134d Jacky Bai           2021-11-26   81  		#interrupt-cells = <3>;
fe6291e963134d Jacky Bai           2021-11-26   82  		interrupt-controller;
fe6291e963134d Jacky Bai           2021-11-26   83  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d Jacky Bai           2021-11-26   84  	};
fe6291e963134d Jacky Bai           2021-11-26   85  
ed4b58fa5ae715 Peng Fan            2022-08-31   86  	pmu {
ed4b58fa5ae715 Peng Fan            2022-08-31   87  		compatible = "arm,cortex-a35-pmu";
ed4b58fa5ae715 Peng Fan            2022-08-31   88  		interrupt-parent = <&gic>;
ed4b58fa5ae715 Peng Fan            2022-08-31   89  		interrupts = <GIC_PPI 7
ed4b58fa5ae715 Peng Fan            2022-08-31   90  			     (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
ed4b58fa5ae715 Peng Fan            2022-08-31   91  		interrupt-affinity = <&A35_0>, <&A35_1>;
ed4b58fa5ae715 Peng Fan            2022-08-31   92  	};
ed4b58fa5ae715 Peng Fan            2022-08-31   93  
fe6291e963134d Jacky Bai           2021-11-26   94  	psci {
fe6291e963134d Jacky Bai           2021-11-26   95  		compatible = "arm,psci-1.0";
fe6291e963134d Jacky Bai           2021-11-26   96  		method = "smc";
fe6291e963134d Jacky Bai           2021-11-26   97  	};
fe6291e963134d Jacky Bai           2021-11-26   98  
a9624b4e7ea2fa Peng Fan            2023-07-24   99  	thermal-zones {
a9624b4e7ea2fa Peng Fan            2023-07-24  100  		cpu-thermal {
a9624b4e7ea2fa Peng Fan            2023-07-24  101  			polling-delay-passive = <250>;
a9624b4e7ea2fa Peng Fan            2023-07-24  102  			polling-delay = <2000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  103  			thermal-sensors = <&scmi_sensor 0>;
a9624b4e7ea2fa Peng Fan            2023-07-24  104  
a9624b4e7ea2fa Peng Fan            2023-07-24  105  			trips {
a9624b4e7ea2fa Peng Fan            2023-07-24  106  				cpu_alert0: trip0 {
a9624b4e7ea2fa Peng Fan            2023-07-24  107  					temperature = <85000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  108  					hysteresis = <2000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  109  					type = "passive";
a9624b4e7ea2fa Peng Fan            2023-07-24  110  				};
a9624b4e7ea2fa Peng Fan            2023-07-24  111  
a9624b4e7ea2fa Peng Fan            2023-07-24  112  				cpu_crit0: trip1 {
a9624b4e7ea2fa Peng Fan            2023-07-24  113  					temperature = <95000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  114  					hysteresis = <2000>;
a9624b4e7ea2fa Peng Fan            2023-07-24  115  					type = "critical";
a9624b4e7ea2fa Peng Fan            2023-07-24  116  				};
a9624b4e7ea2fa Peng Fan            2023-07-24  117  			};
a9624b4e7ea2fa Peng Fan            2023-07-24  118  		};
a9624b4e7ea2fa Peng Fan            2023-07-24  119  	};
a9624b4e7ea2fa Peng Fan            2023-07-24  120  
fe6291e963134d Jacky Bai           2021-11-26  121  	timer {
fe6291e963134d Jacky Bai           2021-11-26  122  		compatible = "arm,armv8-timer";
fe6291e963134d Jacky Bai           2021-11-26  123  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
fe6291e963134d Jacky Bai           2021-11-26  124  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
fe6291e963134d Jacky Bai           2021-11-26  125  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
fe6291e963134d Jacky Bai           2021-11-26  126  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
fe6291e963134d Jacky Bai           2021-11-26  127  	};
fe6291e963134d Jacky Bai           2021-11-26  128  
fe6291e963134d Jacky Bai           2021-11-26  129  	frosc: clock-frosc {
fe6291e963134d Jacky Bai           2021-11-26  130  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  131  		clock-frequency = <192000000>;
fe6291e963134d Jacky Bai           2021-11-26  132  		clock-output-names = "frosc";
fe6291e963134d Jacky Bai           2021-11-26  133  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  134  	};
fe6291e963134d Jacky Bai           2021-11-26  135  
fe6291e963134d Jacky Bai           2021-11-26  136  	lposc: clock-lposc {
fe6291e963134d Jacky Bai           2021-11-26  137  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  138  		clock-frequency = <1000000>;
fe6291e963134d Jacky Bai           2021-11-26  139  		clock-output-names = "lposc";
fe6291e963134d Jacky Bai           2021-11-26  140  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  141  	};
fe6291e963134d Jacky Bai           2021-11-26  142  
fe6291e963134d Jacky Bai           2021-11-26  143  	rosc: clock-rosc {
fe6291e963134d Jacky Bai           2021-11-26  144  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  145  		clock-frequency = <32768>;
fe6291e963134d Jacky Bai           2021-11-26  146  		clock-output-names = "rosc";
fe6291e963134d Jacky Bai           2021-11-26  147  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  148  	};
fe6291e963134d Jacky Bai           2021-11-26  149  
fe6291e963134d Jacky Bai           2021-11-26  150  	sosc: clock-sosc {
fe6291e963134d Jacky Bai           2021-11-26  151  		compatible = "fixed-clock";
fe6291e963134d Jacky Bai           2021-11-26  152  		clock-frequency = <24000000>;
fe6291e963134d Jacky Bai           2021-11-26  153  		clock-output-names = "sosc";
fe6291e963134d Jacky Bai           2021-11-26  154  		#clock-cells = <0>;
fe6291e963134d Jacky Bai           2021-11-26  155  	};
fe6291e963134d Jacky Bai           2021-11-26  156  
7a48f2b50afd06 Pankaj Gupta        2025-01-20  157  	sram0: sram@2201f000 {
a38771d7a49baf Peng Fan            2021-12-08  158  		compatible = "mmio-sram";
a38771d7a49baf Peng Fan            2021-12-08  159  		reg = <0x0 0x2201f000 0x0 0x1000>;
a38771d7a49baf Peng Fan            2021-12-08  160  
a38771d7a49baf Peng Fan            2021-12-08  161  		#address-cells = <1>;
a38771d7a49baf Peng Fan            2021-12-08  162  		#size-cells = <1>;
a38771d7a49baf Peng Fan            2021-12-08  163  		ranges = <0 0x0 0x2201f000 0x1000>;
a38771d7a49baf Peng Fan            2021-12-08  164  
b2ca63697b0d9b Peng Fan            2022-08-31  165  		scmi_buf: scmi-sram-section@0 {
a38771d7a49baf Peng Fan            2021-12-08  166  			compatible = "arm,scmi-shmem";
a38771d7a49baf Peng Fan            2021-12-08  167  			reg = <0x0 0x400>;
a38771d7a49baf Peng Fan            2021-12-08  168  		};
a38771d7a49baf Peng Fan            2021-12-08  169  	};
a38771d7a49baf Peng Fan            2021-12-08  170  
a38771d7a49baf Peng Fan            2021-12-08 @171  	firmware {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
