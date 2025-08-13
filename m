Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A36262D0B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 02:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053317; cv=none; b=IPUb3/Ns/DaxGUko7fRZTacolNbVp/FSlh/FjQL299CAtDQXSgZnunFvTroVh9I4/3GHyRdTYJ59Objrrl1TfD1T8yc3+WDQYI/W4GU8ua31A9DOKKUeAPdI5n8pJUZnyeKmyLptkit3iHBRW/6hFb05NG/ZMbiMj3tlhTbkEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053317; c=relaxed/simple;
	bh=2EbVgxAlRk+X2/Pu4XNPDVKmDiJYwOEOAgyjC1DccRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsuw6XocexLUjG+SuKYC6RzU5BHBsQSpBlNvnhKsJVOiLr/Q8CJ+LBYMD5lWG/ootoiPz269ljwhOPVAo1+I4J6dsU94X6mQz7CvxcN6VGK+b/XuFfSGE+TScQy4aIZXD9tH81VR7zXY/ksckE2B0yb25z777uuChmpJ+PBEBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzOt+59F; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzOt+59F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755053313; x=1786589313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2EbVgxAlRk+X2/Pu4XNPDVKmDiJYwOEOAgyjC1DccRY=;
  b=jzOt+59F8K1IZy3GGNUFCjYpN42SwCqNuzlkv/d3j31c5b9nQLwy4MAO
   DHa4gm/rYz+B/1ZXzub2gVqF9iWBX8O5PuFRXJRdranvyhbq4IjmM4AkU
   pCyLz60HQxovD6T82uDj4x7hW46Vbilx0A806iDUp8oMUIrMiGXLNvFK6
   rXtxesR7HpLryeDnls+ufx0IAeTp/QUMTLlLp4jEbNAtX5dkEE9B3RpT+
   58uui22x604geSrxwXWSZU2U97MAgLqxIxqWot/SqdXj7ma3bKvLxVCp0
   EC4rsFNVuwRzxrfAGSzdi+C7GzwMhc5lPKkoYIOhvGtGpBMKh+TRxicQS
   A==;
X-CSE-ConnectionGUID: QdvZf/UsSQWB23WIdouunQ==
X-CSE-MsgGUID: vMPqdwP5SK+IT+6cQti42Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56363781"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56363781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 19:48:33 -0700
X-CSE-ConnectionGUID: PXjnwZR1QRWBLdH5NewFKw==
X-CSE-MsgGUID: rnwyh+z3QX+9SABi6g28lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165852583"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2025 19:48:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um1Wu-0009Ts-1v;
	Wed, 13 Aug 2025 02:48:08 +0000
Date: Wed, 13 Aug 2025 10:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Message-ID: <202508131023.fAHmoKTY-lkp@intel.com>
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
In-Reply-To: <20250812081923.1019345-3-guoniu.zhou@oss.nxp.com>
References: <20250812081923.1019345-3-guoniu.zhou@oss.nxp.com>
TO: guoniu.zhou@oss.nxp.com
TO: linux-media@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: imx@lists.linux.dev
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: rmfrfs@gmail.com
CC: laurent.pinchart@ideasonboard.com
CC: martink@posteo.de
CC: kernel@puri.sm
CC: mchehab@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: shawnguo@kernel.org
CC: s.hauer@pengutronix.de
CC: kernel@pengutronix.de
CC: festevam@gmail.com
CC: frank.li@nxp.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d968e50b5c26642754492dea23cbd3592bde62d8]

url:    https://github.com/intel-lab-lkp/linux/commits/guoniu-zhou-oss-nxp-com/media-dt-bindings-nxp-imx8mq-mipi-csi2-Add-i-MX8ULP-compatible-string/20250812-162838
base:   d968e50b5c26642754492dea23cbd3592bde62d8
patch link:    https://lore.kernel.org/r/20250812081923.1019345-3-guoniu.zhou%40oss.nxp.com
patch subject: [PATCH 2/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250813/202508131023.fAHmoKTY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131023.fAHmoKTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508131023.fAHmoKTY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8ulp.dtsi:855.11-865.7: Warning (graph_child_address): /soc@0/bus@2d800000/isi@2dac0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +855 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

fe6291e963134d3 Jacky Bai           2021-11-26   14  
fe6291e963134d3 Jacky Bai           2021-11-26   15  / {
fe6291e963134d3 Jacky Bai           2021-11-26   16  	interrupt-parent = <&gic>;
fe6291e963134d3 Jacky Bai           2021-11-26   17  	#address-cells = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26   18  	#size-cells = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26   19  
fe6291e963134d3 Jacky Bai           2021-11-26   20  	aliases {
683d7ffb7daaab1 Wei Fang            2022-07-27   21  		ethernet0 = &fec;
fe6291e963134d3 Jacky Bai           2021-11-26   22  		gpio0 = &gpiod;
fe6291e963134d3 Jacky Bai           2021-11-26   23  		gpio1 = &gpioe;
fe6291e963134d3 Jacky Bai           2021-11-26   24  		gpio2 = &gpiof;
fe6291e963134d3 Jacky Bai           2021-11-26   25  		mmc0 = &usdhc0;
fe6291e963134d3 Jacky Bai           2021-11-26   26  		mmc1 = &usdhc1;
fe6291e963134d3 Jacky Bai           2021-11-26   27  		mmc2 = &usdhc2;
fe6291e963134d3 Jacky Bai           2021-11-26   28  		serial0 = &lpuart4;
fe6291e963134d3 Jacky Bai           2021-11-26   29  		serial1 = &lpuart5;
fe6291e963134d3 Jacky Bai           2021-11-26   30  		serial2 = &lpuart6;
fe6291e963134d3 Jacky Bai           2021-11-26   31  		serial3 = &lpuart7;
226e39330526838 Carlos Song         2024-10-18   32  		spi0 = &lpspi4;
226e39330526838 Carlos Song         2024-10-18   33  		spi1 = &lpspi5;
fe6291e963134d3 Jacky Bai           2021-11-26   34  	};
fe6291e963134d3 Jacky Bai           2021-11-26   35  
fe6291e963134d3 Jacky Bai           2021-11-26   36  	cpus {
fe6291e963134d3 Jacky Bai           2021-11-26   37  		#address-cells = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26   38  		#size-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26   39  
fe6291e963134d3 Jacky Bai           2021-11-26   40  		A35_0: cpu@0 {
fe6291e963134d3 Jacky Bai           2021-11-26   41  			device_type = "cpu";
fe6291e963134d3 Jacky Bai           2021-11-26   42  			compatible = "arm,cortex-a35";
fe6291e963134d3 Jacky Bai           2021-11-26   43  			reg = <0x0 0x0>;
fe6291e963134d3 Jacky Bai           2021-11-26   44  			enable-method = "psci";
fe6291e963134d3 Jacky Bai           2021-11-26   45  			next-level-cache = <&A35_L2>;
db2c35aa68efba9 Peng Fan            2023-07-24   46  			cpu-idle-states = <&cpu_sleep>;
fe6291e963134d3 Jacky Bai           2021-11-26   47  		};
fe6291e963134d3 Jacky Bai           2021-11-26   48  
fe6291e963134d3 Jacky Bai           2021-11-26   49  		A35_1: cpu@1 {
fe6291e963134d3 Jacky Bai           2021-11-26   50  			device_type = "cpu";
fe6291e963134d3 Jacky Bai           2021-11-26   51  			compatible = "arm,cortex-a35";
fe6291e963134d3 Jacky Bai           2021-11-26   52  			reg = <0x0 0x1>;
fe6291e963134d3 Jacky Bai           2021-11-26   53  			enable-method = "psci";
fe6291e963134d3 Jacky Bai           2021-11-26   54  			next-level-cache = <&A35_L2>;
db2c35aa68efba9 Peng Fan            2023-07-24   55  			cpu-idle-states = <&cpu_sleep>;
fe6291e963134d3 Jacky Bai           2021-11-26   56  		};
fe6291e963134d3 Jacky Bai           2021-11-26   57  
fe6291e963134d3 Jacky Bai           2021-11-26   58  		A35_L2: l2-cache0 {
fe6291e963134d3 Jacky Bai           2021-11-26   59  			compatible = "cache";
3b450831e5f1af0 Pierre Gondois      2022-11-07   60  			cache-level = <2>;
d2bd947176f855e Krzysztof Kozlowski 2023-04-22   61  			cache-unified;
fe6291e963134d3 Jacky Bai           2021-11-26   62  		};
db2c35aa68efba9 Peng Fan            2023-07-24   63  
db2c35aa68efba9 Peng Fan            2023-07-24   64  		idle-states {
db2c35aa68efba9 Peng Fan            2023-07-24   65  			entry-method = "psci";
db2c35aa68efba9 Peng Fan            2023-07-24   66  
db2c35aa68efba9 Peng Fan            2023-07-24   67  			cpu_sleep: cpu-sleep {
db2c35aa68efba9 Peng Fan            2023-07-24   68  				compatible = "arm,idle-state";
db2c35aa68efba9 Peng Fan            2023-07-24   69  				arm,psci-suspend-param = <0x0>;
db2c35aa68efba9 Peng Fan            2023-07-24   70  				local-timer-stop;
db2c35aa68efba9 Peng Fan            2023-07-24   71  				entry-latency-us = <1000>;
db2c35aa68efba9 Peng Fan            2023-07-24   72  				exit-latency-us = <700>;
db2c35aa68efba9 Peng Fan            2023-07-24   73  				min-residency-us = <2700>;
db2c35aa68efba9 Peng Fan            2023-07-24   74  			};
db2c35aa68efba9 Peng Fan            2023-07-24   75  		};
fe6291e963134d3 Jacky Bai           2021-11-26   76  	};
fe6291e963134d3 Jacky Bai           2021-11-26   77  
fe6291e963134d3 Jacky Bai           2021-11-26   78  	gic: interrupt-controller@2d400000 {
fe6291e963134d3 Jacky Bai           2021-11-26   79  		compatible = "arm,gic-v3";
fe6291e963134d3 Jacky Bai           2021-11-26   80  		reg = <0x0 0x2d400000 0 0x10000>, /* GIC Dist */
fe6291e963134d3 Jacky Bai           2021-11-26   81  		      <0x0 0x2d440000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
fe6291e963134d3 Jacky Bai           2021-11-26   82  		#interrupt-cells = <3>;
fe6291e963134d3 Jacky Bai           2021-11-26   83  		interrupt-controller;
fe6291e963134d3 Jacky Bai           2021-11-26   84  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26   85  	};
fe6291e963134d3 Jacky Bai           2021-11-26   86  
ed4b58fa5ae7155 Peng Fan            2022-08-31   87  	pmu {
ed4b58fa5ae7155 Peng Fan            2022-08-31   88  		compatible = "arm,cortex-a35-pmu";
ed4b58fa5ae7155 Peng Fan            2022-08-31   89  		interrupt-parent = <&gic>;
ed4b58fa5ae7155 Peng Fan            2022-08-31   90  		interrupts = <GIC_PPI 7
ed4b58fa5ae7155 Peng Fan            2022-08-31   91  			     (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
ed4b58fa5ae7155 Peng Fan            2022-08-31   92  		interrupt-affinity = <&A35_0>, <&A35_1>;
ed4b58fa5ae7155 Peng Fan            2022-08-31   93  	};
ed4b58fa5ae7155 Peng Fan            2022-08-31   94  
fe6291e963134d3 Jacky Bai           2021-11-26   95  	psci {
fe6291e963134d3 Jacky Bai           2021-11-26   96  		compatible = "arm,psci-1.0";
fe6291e963134d3 Jacky Bai           2021-11-26   97  		method = "smc";
fe6291e963134d3 Jacky Bai           2021-11-26   98  	};
fe6291e963134d3 Jacky Bai           2021-11-26   99  
a9624b4e7ea2fa4 Peng Fan            2023-07-24  100  	thermal-zones {
a9624b4e7ea2fa4 Peng Fan            2023-07-24  101  		cpu-thermal {
a9624b4e7ea2fa4 Peng Fan            2023-07-24  102  			polling-delay-passive = <250>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  103  			polling-delay = <2000>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  104  			thermal-sensors = <&scmi_sensor 0>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  105  
a9624b4e7ea2fa4 Peng Fan            2023-07-24  106  			trips {
a9624b4e7ea2fa4 Peng Fan            2023-07-24  107  				cpu_alert0: trip0 {
a9624b4e7ea2fa4 Peng Fan            2023-07-24  108  					temperature = <85000>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  109  					hysteresis = <2000>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  110  					type = "passive";
a9624b4e7ea2fa4 Peng Fan            2023-07-24  111  				};
a9624b4e7ea2fa4 Peng Fan            2023-07-24  112  
a9624b4e7ea2fa4 Peng Fan            2023-07-24  113  				cpu_crit0: trip1 {
a9624b4e7ea2fa4 Peng Fan            2023-07-24  114  					temperature = <95000>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  115  					hysteresis = <2000>;
a9624b4e7ea2fa4 Peng Fan            2023-07-24  116  					type = "critical";
a9624b4e7ea2fa4 Peng Fan            2023-07-24  117  				};
a9624b4e7ea2fa4 Peng Fan            2023-07-24  118  			};
a9624b4e7ea2fa4 Peng Fan            2023-07-24  119  		};
a9624b4e7ea2fa4 Peng Fan            2023-07-24  120  	};
a9624b4e7ea2fa4 Peng Fan            2023-07-24  121  
fe6291e963134d3 Jacky Bai           2021-11-26  122  	timer {
fe6291e963134d3 Jacky Bai           2021-11-26  123  		compatible = "arm,armv8-timer";
fe6291e963134d3 Jacky Bai           2021-11-26  124  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
fe6291e963134d3 Jacky Bai           2021-11-26  125  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
fe6291e963134d3 Jacky Bai           2021-11-26  126  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
fe6291e963134d3 Jacky Bai           2021-11-26  127  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
fe6291e963134d3 Jacky Bai           2021-11-26  128  	};
fe6291e963134d3 Jacky Bai           2021-11-26  129  
fe6291e963134d3 Jacky Bai           2021-11-26  130  	frosc: clock-frosc {
fe6291e963134d3 Jacky Bai           2021-11-26  131  		compatible = "fixed-clock";
fe6291e963134d3 Jacky Bai           2021-11-26  132  		clock-frequency = <192000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  133  		clock-output-names = "frosc";
fe6291e963134d3 Jacky Bai           2021-11-26  134  		#clock-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26  135  	};
fe6291e963134d3 Jacky Bai           2021-11-26  136  
fe6291e963134d3 Jacky Bai           2021-11-26  137  	lposc: clock-lposc {
fe6291e963134d3 Jacky Bai           2021-11-26  138  		compatible = "fixed-clock";
fe6291e963134d3 Jacky Bai           2021-11-26  139  		clock-frequency = <1000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  140  		clock-output-names = "lposc";
fe6291e963134d3 Jacky Bai           2021-11-26  141  		#clock-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26  142  	};
fe6291e963134d3 Jacky Bai           2021-11-26  143  
fe6291e963134d3 Jacky Bai           2021-11-26  144  	rosc: clock-rosc {
fe6291e963134d3 Jacky Bai           2021-11-26  145  		compatible = "fixed-clock";
fe6291e963134d3 Jacky Bai           2021-11-26  146  		clock-frequency = <32768>;
fe6291e963134d3 Jacky Bai           2021-11-26  147  		clock-output-names = "rosc";
fe6291e963134d3 Jacky Bai           2021-11-26  148  		#clock-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26  149  	};
fe6291e963134d3 Jacky Bai           2021-11-26  150  
fe6291e963134d3 Jacky Bai           2021-11-26  151  	sosc: clock-sosc {
fe6291e963134d3 Jacky Bai           2021-11-26  152  		compatible = "fixed-clock";
fe6291e963134d3 Jacky Bai           2021-11-26  153  		clock-frequency = <24000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  154  		clock-output-names = "sosc";
fe6291e963134d3 Jacky Bai           2021-11-26  155  		#clock-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26  156  	};
fe6291e963134d3 Jacky Bai           2021-11-26  157  
a38771d7a49baf6 Peng Fan            2021-12-08  158  	sram@2201f000 {
a38771d7a49baf6 Peng Fan            2021-12-08  159  		compatible = "mmio-sram";
a38771d7a49baf6 Peng Fan            2021-12-08  160  		reg = <0x0 0x2201f000 0x0 0x1000>;
a38771d7a49baf6 Peng Fan            2021-12-08  161  
a38771d7a49baf6 Peng Fan            2021-12-08  162  		#address-cells = <1>;
a38771d7a49baf6 Peng Fan            2021-12-08  163  		#size-cells = <1>;
a38771d7a49baf6 Peng Fan            2021-12-08  164  		ranges = <0 0x0 0x2201f000 0x1000>;
a38771d7a49baf6 Peng Fan            2021-12-08  165  
b2ca63697b0d9b4 Peng Fan            2022-08-31  166  		scmi_buf: scmi-sram-section@0 {
a38771d7a49baf6 Peng Fan            2021-12-08  167  			compatible = "arm,scmi-shmem";
a38771d7a49baf6 Peng Fan            2021-12-08  168  			reg = <0x0 0x400>;
a38771d7a49baf6 Peng Fan            2021-12-08  169  		};
a38771d7a49baf6 Peng Fan            2021-12-08  170  	};
a38771d7a49baf6 Peng Fan            2021-12-08  171  
a38771d7a49baf6 Peng Fan            2021-12-08  172  	firmware {
a38771d7a49baf6 Peng Fan            2021-12-08  173  		scmi {
a38771d7a49baf6 Peng Fan            2021-12-08  174  			compatible = "arm,scmi-smc";
a38771d7a49baf6 Peng Fan            2021-12-08  175  			arm,smc-id = <0xc20000fe>;
a38771d7a49baf6 Peng Fan            2021-12-08  176  			#address-cells = <1>;
a38771d7a49baf6 Peng Fan            2021-12-08  177  			#size-cells = <0>;
a38771d7a49baf6 Peng Fan            2021-12-08  178  			shmem = <&scmi_buf>;
a38771d7a49baf6 Peng Fan            2021-12-08  179  
a38771d7a49baf6 Peng Fan            2021-12-08  180  			scmi_devpd: protocol@11 {
a38771d7a49baf6 Peng Fan            2021-12-08  181  				reg = <0x11>;
a38771d7a49baf6 Peng Fan            2021-12-08  182  				#power-domain-cells = <1>;
a38771d7a49baf6 Peng Fan            2021-12-08  183  			};
a38771d7a49baf6 Peng Fan            2021-12-08  184  
a38771d7a49baf6 Peng Fan            2021-12-08  185  			scmi_sensor: protocol@15 {
a38771d7a49baf6 Peng Fan            2021-12-08  186  				reg = <0x15>;
45d941f67b000b6 Sudeep Holla        2022-02-11  187  				#thermal-sensor-cells = <1>;
a38771d7a49baf6 Peng Fan            2021-12-08  188  			};
a38771d7a49baf6 Peng Fan            2021-12-08  189  		};
a38771d7a49baf6 Peng Fan            2021-12-08  190  	};
a38771d7a49baf6 Peng Fan            2021-12-08  191  
5b9435d646d1cbf Peng Fan            2023-07-24  192  	cm33: remoteproc-cm33 {
5b9435d646d1cbf Peng Fan            2023-07-24  193  		compatible = "fsl,imx8ulp-cm33";
5b9435d646d1cbf Peng Fan            2023-07-24  194  		status = "disabled";
5b9435d646d1cbf Peng Fan            2023-07-24  195  	};
5b9435d646d1cbf Peng Fan            2023-07-24  196  
fcdef92ba63975d Fabio Estevam       2022-06-14  197  	soc: soc@0 {
fe6291e963134d3 Jacky Bai           2021-11-26  198  		compatible = "simple-bus";
fe6291e963134d3 Jacky Bai           2021-11-26  199  		#address-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  200  		#size-cells = <1>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  201  		ranges = <0x0 0x0 0x0 0x40000000>,
ef89fd56bdfcf5d Haibo Chen          2023-07-24  202  			 <0x60000000 0x0 0x60000000 0x1000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  203  
d2209e658468330 Peng Fan            2022-08-31  204  		s4muap: mailbox@27020000 {
d2209e658468330 Peng Fan            2022-08-31  205  			compatible = "fsl,imx8ulp-mu-s4";
d2209e658468330 Peng Fan            2022-08-31  206  			reg = <0x27020000 0x10000>;
d2209e658468330 Peng Fan            2022-08-31  207  			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
d2209e658468330 Peng Fan            2022-08-31  208  			#mbox-cells = <2>;
d2209e658468330 Peng Fan            2022-08-31  209  		};
d2209e658468330 Peng Fan            2022-08-31  210  
fe6291e963134d3 Jacky Bai           2021-11-26  211  		per_bridge3: bus@29000000 {
fe6291e963134d3 Jacky Bai           2021-11-26  212  			compatible = "simple-bus";
fe6291e963134d3 Jacky Bai           2021-11-26  213  			reg = <0x29000000 0x800000>;
fe6291e963134d3 Jacky Bai           2021-11-26  214  			#address-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  215  			#size-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  216  			ranges;
fe6291e963134d3 Jacky Bai           2021-11-26  217  
28879c0c09387b3 Shengjiu Wang       2024-10-22  218  			edma1: dma-controller@29010000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  219  				compatible = "fsl,imx8ulp-edma";
28879c0c09387b3 Shengjiu Wang       2024-10-22  220  				reg = <0x29010000 0x210000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  221  				#dma-cells = <3>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  222  				dma-channels = <32>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  223  				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  224  					     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  225  					     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  226  					     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  227  					     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  228  					     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  229  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  230  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  231  					     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  232  					     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  233  					     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  234  					     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  235  					     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  236  					     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  237  					     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  238  					     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  239  					     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  240  					     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  241  					     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  242  					     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  243  					     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  244  					     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  245  					     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  246  					     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  247  					     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  248  					     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  249  					     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  250  					     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  251  					     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  252  					     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  253  					     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  254  					     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  255  				clocks = <&pcc3 IMX8ULP_CLK_DMA1_MP>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  256  					<&pcc3 IMX8ULP_CLK_DMA1_CH0>, <&pcc3 IMX8ULP_CLK_DMA1_CH1>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  257  					<&pcc3 IMX8ULP_CLK_DMA1_CH2>, <&pcc3 IMX8ULP_CLK_DMA1_CH3>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  258  					<&pcc3 IMX8ULP_CLK_DMA1_CH4>, <&pcc3 IMX8ULP_CLK_DMA1_CH5>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  259  					<&pcc3 IMX8ULP_CLK_DMA1_CH6>, <&pcc3 IMX8ULP_CLK_DMA1_CH7>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  260  					<&pcc3 IMX8ULP_CLK_DMA1_CH8>, <&pcc3 IMX8ULP_CLK_DMA1_CH9>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  261  					<&pcc3 IMX8ULP_CLK_DMA1_CH10>, <&pcc3 IMX8ULP_CLK_DMA1_CH11>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  262  					<&pcc3 IMX8ULP_CLK_DMA1_CH12>, <&pcc3 IMX8ULP_CLK_DMA1_CH13>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  263  					<&pcc3 IMX8ULP_CLK_DMA1_CH14>, <&pcc3 IMX8ULP_CLK_DMA1_CH15>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  264  					<&pcc3 IMX8ULP_CLK_DMA1_CH16>, <&pcc3 IMX8ULP_CLK_DMA1_CH17>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  265  					<&pcc3 IMX8ULP_CLK_DMA1_CH18>, <&pcc3 IMX8ULP_CLK_DMA1_CH19>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  266  					<&pcc3 IMX8ULP_CLK_DMA1_CH20>, <&pcc3 IMX8ULP_CLK_DMA1_CH21>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  267  					<&pcc3 IMX8ULP_CLK_DMA1_CH22>, <&pcc3 IMX8ULP_CLK_DMA1_CH23>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  268  					<&pcc3 IMX8ULP_CLK_DMA1_CH24>, <&pcc3 IMX8ULP_CLK_DMA1_CH25>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  269  					<&pcc3 IMX8ULP_CLK_DMA1_CH26>, <&pcc3 IMX8ULP_CLK_DMA1_CH27>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  270  					<&pcc3 IMX8ULP_CLK_DMA1_CH28>, <&pcc3 IMX8ULP_CLK_DMA1_CH29>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  271  					<&pcc3 IMX8ULP_CLK_DMA1_CH30>, <&pcc3 IMX8ULP_CLK_DMA1_CH31>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  272  				clock-names = "dma", "ch00","ch01", "ch02", "ch03",
28879c0c09387b3 Shengjiu Wang       2024-10-22  273  						"ch04", "ch05", "ch06", "ch07",
28879c0c09387b3 Shengjiu Wang       2024-10-22  274  						"ch08", "ch09", "ch10", "ch11",
28879c0c09387b3 Shengjiu Wang       2024-10-22  275  						"ch12", "ch13", "ch14", "ch15",
28879c0c09387b3 Shengjiu Wang       2024-10-22  276  						"ch16", "ch17", "ch18", "ch19",
28879c0c09387b3 Shengjiu Wang       2024-10-22  277  						"ch20", "ch21", "ch22", "ch23",
28879c0c09387b3 Shengjiu Wang       2024-10-22  278  						"ch24", "ch25", "ch26", "ch27",
28879c0c09387b3 Shengjiu Wang       2024-10-22  279  						"ch28", "ch29", "ch30", "ch31";
28879c0c09387b3 Shengjiu Wang       2024-10-22  280  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  281  
d2209e658468330 Peng Fan            2022-08-31  282  			mu: mailbox@29220000 {
d2209e658468330 Peng Fan            2022-08-31  283  				compatible = "fsl,imx8ulp-mu";
d2209e658468330 Peng Fan            2022-08-31  284  				reg = <0x29220000 0x10000>;
d2209e658468330 Peng Fan            2022-08-31  285  				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
d2209e658468330 Peng Fan            2022-08-31  286  				#mbox-cells = <2>;
d2209e658468330 Peng Fan            2022-08-31  287  				status = "disabled";
d2209e658468330 Peng Fan            2022-08-31  288  			};
d2209e658468330 Peng Fan            2022-08-31  289  
d2209e658468330 Peng Fan            2022-08-31  290  			mu3: mailbox@29230000 {
d2209e658468330 Peng Fan            2022-08-31  291  				compatible = "fsl,imx8ulp-mu";
d2209e658468330 Peng Fan            2022-08-31  292  				reg = <0x29230000 0x10000>;
d2209e658468330 Peng Fan            2022-08-31  293  				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
d2209e658468330 Peng Fan            2022-08-31  294  				clocks = <&pcc3 IMX8ULP_CLK_MU3_A>;
d2209e658468330 Peng Fan            2022-08-31  295  				#mbox-cells = <2>;
d2209e658468330 Peng Fan            2022-08-31  296  				status = "disabled";
d2209e658468330 Peng Fan            2022-08-31  297  			};
d2209e658468330 Peng Fan            2022-08-31  298  
fe6291e963134d3 Jacky Bai           2021-11-26  299  			wdog3: watchdog@292a0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  300  				compatible = "fsl,imx8ulp-wdt", "fsl,imx7ulp-wdt";
fe6291e963134d3 Jacky Bai           2021-11-26  301  				reg = <0x292a0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  302  				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  303  				clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
fe6291e963134d3 Jacky Bai           2021-11-26  304  				assigned-clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
fe6291e963134d3 Jacky Bai           2021-11-26  305  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
fe6291e963134d3 Jacky Bai           2021-11-26  306  				timeout-sec = <40>;
fe6291e963134d3 Jacky Bai           2021-11-26  307  			};
fe6291e963134d3 Jacky Bai           2021-11-26  308  
fe6291e963134d3 Jacky Bai           2021-11-26  309  			cgc1: clock-controller@292c0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  310  				compatible = "fsl,imx8ulp-cgc1";
fe6291e963134d3 Jacky Bai           2021-11-26  311  				reg = <0x292c0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  312  				#clock-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  313  			};
fe6291e963134d3 Jacky Bai           2021-11-26  314  
fe6291e963134d3 Jacky Bai           2021-11-26  315  			pcc3: clock-controller@292d0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  316  				compatible = "fsl,imx8ulp-pcc3";
fe6291e963134d3 Jacky Bai           2021-11-26  317  				reg = <0x292d0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  318  				#clock-cells = <1>;
5fa383a25fd8a16 Peng Fan            2022-08-31  319  				#reset-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  320  			};
fe6291e963134d3 Jacky Bai           2021-11-26  321  
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  322  			crypto: crypto@292e0000 {
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  323  				compatible = "fsl,sec-v4.0";
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  324  				reg = <0x292e0000 0x10000>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  325  				ranges = <0 0x292e0000 0x10000>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  326  				#address-cells = <1>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  327  				#size-cells = <1>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  328  
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  329  				sec_jr0: jr@1000 {
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  330  					compatible = "fsl,sec-v4.0-job-ring";
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  331  					reg = <0x1000 0x1000>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  332  					interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  333  				};
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  334  
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  335  				sec_jr1: jr@2000 {
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  336  					compatible = "fsl,sec-v4.0-job-ring";
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  337  					reg = <0x2000 0x1000>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  338  					interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  339  				};
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  340  
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  341  				sec_jr2: jr@3000 {
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  342  					compatible = "fsl,sec-v4.0-job-ring";
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  343  					reg = <0x3000 0x1000>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  344  					interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  345  				};
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  346  
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  347  				sec_jr3: jr@4000 {
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  348  					compatible = "fsl,sec-v4.0-job-ring";
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  349  					reg = <0x4000 0x1000>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  350  					interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  351  				};
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  352  			};
e6b73eb23f0b6e5 Pankaj Gupta        2024-04-09  353  
fe6291e963134d3 Jacky Bai           2021-11-26  354  			tpm5: tpm@29340000 {
fe6291e963134d3 Jacky Bai           2021-11-26  355  				compatible = "fsl,imx8ulp-tpm", "fsl,imx7ulp-tpm";
fe6291e963134d3 Jacky Bai           2021-11-26  356  				reg = <0x29340000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  357  				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  358  				clocks = <&pcc3 IMX8ULP_CLK_TPM5>,
fe6291e963134d3 Jacky Bai           2021-11-26  359  					 <&pcc3 IMX8ULP_CLK_TPM5>;
fe6291e963134d3 Jacky Bai           2021-11-26  360  				clock-names = "ipg", "per";
fe6291e963134d3 Jacky Bai           2021-11-26  361  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  362  			};
fe6291e963134d3 Jacky Bai           2021-11-26  363  
fe6291e963134d3 Jacky Bai           2021-11-26  364  			lpi2c4: i2c@29370000 {
fe6291e963134d3 Jacky Bai           2021-11-26  365  				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
fe6291e963134d3 Jacky Bai           2021-11-26  366  				reg = <0x29370000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  367  				interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  368  				clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>,
fe6291e963134d3 Jacky Bai           2021-11-26  369  					 <&pcc3 IMX8ULP_CLK_LPI2C4>;
fe6291e963134d3 Jacky Bai           2021-11-26  370  				clock-names = "per", "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  371  				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  372  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
fe6291e963134d3 Jacky Bai           2021-11-26  373  				assigned-clock-rates = <48000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  374  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  375  			};
fe6291e963134d3 Jacky Bai           2021-11-26  376  
fe6291e963134d3 Jacky Bai           2021-11-26  377  			lpi2c5: i2c@29380000 {
fe6291e963134d3 Jacky Bai           2021-11-26  378  				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
fe6291e963134d3 Jacky Bai           2021-11-26  379  				reg = <0x29380000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  380  				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  381  				clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>,
fe6291e963134d3 Jacky Bai           2021-11-26  382  					 <&pcc3 IMX8ULP_CLK_LPI2C5>;
fe6291e963134d3 Jacky Bai           2021-11-26  383  				clock-names = "per", "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  384  				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  385  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
fe6291e963134d3 Jacky Bai           2021-11-26  386  				assigned-clock-rates = <48000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  387  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  388  			};
fe6291e963134d3 Jacky Bai           2021-11-26  389  
fe6291e963134d3 Jacky Bai           2021-11-26  390  			lpuart4: serial@29390000 {
fe6291e963134d3 Jacky Bai           2021-11-26  391  				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
fe6291e963134d3 Jacky Bai           2021-11-26  392  				reg = <0x29390000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  393  				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  394  				clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
fe6291e963134d3 Jacky Bai           2021-11-26  395  				clock-names = "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  396  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  397  			};
fe6291e963134d3 Jacky Bai           2021-11-26  398  
fe6291e963134d3 Jacky Bai           2021-11-26  399  			lpuart5: serial@293a0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  400  				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
fe6291e963134d3 Jacky Bai           2021-11-26  401  				reg = <0x293a0000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  402  				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  403  				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
fe6291e963134d3 Jacky Bai           2021-11-26  404  				clock-names = "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  405  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  406  			};
fe6291e963134d3 Jacky Bai           2021-11-26  407  
fe6291e963134d3 Jacky Bai           2021-11-26  408  			lpspi4: spi@293b0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  409  				#address-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  410  				#size-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26  411  				compatible = "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
fe6291e963134d3 Jacky Bai           2021-11-26  412  				reg = <0x293b0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  413  				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  414  				clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>,
fe6291e963134d3 Jacky Bai           2021-11-26  415  					 <&pcc3 IMX8ULP_CLK_LPSPI4>;
fe6291e963134d3 Jacky Bai           2021-11-26  416  				clock-names = "per", "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  417  				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  418  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  419  				assigned-clock-rates = <48000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  420  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  421  			};
fe6291e963134d3 Jacky Bai           2021-11-26  422  
fe6291e963134d3 Jacky Bai           2021-11-26  423  			lpspi5: spi@293c0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  424  				#address-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  425  				#size-cells = <0>;
fe6291e963134d3 Jacky Bai           2021-11-26  426  				compatible = "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
fe6291e963134d3 Jacky Bai           2021-11-26  427  				reg = <0x293c0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  428  				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  429  				clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>,
fe6291e963134d3 Jacky Bai           2021-11-26  430  					 <&pcc3 IMX8ULP_CLK_LPSPI5>;
fe6291e963134d3 Jacky Bai           2021-11-26  431  				clock-names = "per", "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  432  				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  433  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  434  				assigned-clock-rates = <48000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  435  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  436  			};
fe6291e963134d3 Jacky Bai           2021-11-26  437  		};
fe6291e963134d3 Jacky Bai           2021-11-26  438  
fe6291e963134d3 Jacky Bai           2021-11-26  439  		per_bridge4: bus@29800000 {
fe6291e963134d3 Jacky Bai           2021-11-26  440  			compatible = "simple-bus";
fe6291e963134d3 Jacky Bai           2021-11-26  441  			reg = <0x29800000 0x800000>;
fe6291e963134d3 Jacky Bai           2021-11-26  442  			#address-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  443  			#size-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  444  			ranges;
fe6291e963134d3 Jacky Bai           2021-11-26  445  
fe6291e963134d3 Jacky Bai           2021-11-26  446  			pcc4: clock-controller@29800000 {
fe6291e963134d3 Jacky Bai           2021-11-26  447  				compatible = "fsl,imx8ulp-pcc4";
fe6291e963134d3 Jacky Bai           2021-11-26  448  				reg = <0x29800000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  449  				#clock-cells = <1>;
5fa383a25fd8a16 Peng Fan            2022-08-31  450  				#reset-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  451  			};
fe6291e963134d3 Jacky Bai           2021-11-26  452  
ef89fd56bdfcf5d Haibo Chen          2023-07-24  453  			flexspi2: spi@29810000 {
409dc5196d5b6eb Haibo Chen          2024-09-05  454  				compatible = "nxp,imx8ulp-fspi";
ef89fd56bdfcf5d Haibo Chen          2023-07-24  455  				reg = <0x29810000 0x10000>, <0x60000000 0x10000000>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  456  				reg-names = "fspi_base", "fspi_mmap";
ef89fd56bdfcf5d Haibo Chen          2023-07-24  457  				#address-cells = <1>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  458  				#size-cells = <0>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  459  				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  460  				clocks = <&pcc4 IMX8ULP_CLK_FLEXSPI2>,
ef89fd56bdfcf5d Haibo Chen          2023-07-24  461  					 <&pcc4 IMX8ULP_CLK_FLEXSPI2>;
43211f6232f70bb Fabio Estevam       2023-09-07  462  				clock-names = "fspi_en", "fspi";
ef89fd56bdfcf5d Haibo Chen          2023-07-24  463  				assigned-clocks = <&pcc4 IMX8ULP_CLK_FLEXSPI2>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  464  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV2>;
ef89fd56bdfcf5d Haibo Chen          2023-07-24  465  				status = "disabled";
ef89fd56bdfcf5d Haibo Chen          2023-07-24  466  			};
ef89fd56bdfcf5d Haibo Chen          2023-07-24  467  
fe6291e963134d3 Jacky Bai           2021-11-26  468  			lpi2c6: i2c@29840000 {
fe6291e963134d3 Jacky Bai           2021-11-26  469  				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
fe6291e963134d3 Jacky Bai           2021-11-26  470  				reg = <0x29840000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  471  				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  472  				clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>,
fe6291e963134d3 Jacky Bai           2021-11-26  473  					 <&pcc4 IMX8ULP_CLK_LPI2C6>;
fe6291e963134d3 Jacky Bai           2021-11-26  474  				clock-names = "per", "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  475  				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  476  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
fe6291e963134d3 Jacky Bai           2021-11-26  477  				assigned-clock-rates = <48000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  478  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  479  			};
fe6291e963134d3 Jacky Bai           2021-11-26  480  
fe6291e963134d3 Jacky Bai           2021-11-26  481  			lpi2c7: i2c@29850000 {
fe6291e963134d3 Jacky Bai           2021-11-26  482  				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
fe6291e963134d3 Jacky Bai           2021-11-26  483  				reg = <0x29850000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  484  				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  485  				clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>,
fe6291e963134d3 Jacky Bai           2021-11-26  486  					 <&pcc4 IMX8ULP_CLK_LPI2C7>;
fe6291e963134d3 Jacky Bai           2021-11-26  487  				clock-names = "per", "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  488  				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>;
0acd1b1cf3454d5 Clark Wang          2022-08-31  489  				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
fe6291e963134d3 Jacky Bai           2021-11-26  490  				assigned-clock-rates = <48000000>;
fe6291e963134d3 Jacky Bai           2021-11-26  491  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  492  			};
fe6291e963134d3 Jacky Bai           2021-11-26  493  
fe6291e963134d3 Jacky Bai           2021-11-26  494  			lpuart6: serial@29860000 {
fe6291e963134d3 Jacky Bai           2021-11-26  495  				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
fe6291e963134d3 Jacky Bai           2021-11-26  496  				reg = <0x29860000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  497  				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  498  				clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
fe6291e963134d3 Jacky Bai           2021-11-26  499  				clock-names = "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  500  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  501  			};
fe6291e963134d3 Jacky Bai           2021-11-26  502  
fe6291e963134d3 Jacky Bai           2021-11-26  503  			lpuart7: serial@29870000 {
fe6291e963134d3 Jacky Bai           2021-11-26  504  				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
fe6291e963134d3 Jacky Bai           2021-11-26  505  				reg = <0x29870000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  506  				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  507  				clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
fe6291e963134d3 Jacky Bai           2021-11-26  508  				clock-names = "ipg";
fe6291e963134d3 Jacky Bai           2021-11-26  509  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  510  			};
fe6291e963134d3 Jacky Bai           2021-11-26  511  
28879c0c09387b3 Shengjiu Wang       2024-10-22  512  			sai4: sai@29880000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  513  				compatible = "fsl,imx8ulp-sai";
28879c0c09387b3 Shengjiu Wang       2024-10-22  514  				reg = <0x29880000 0x10000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  515  				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  516  				clocks = <&pcc4 IMX8ULP_CLK_SAI4>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  517  					 <&cgc1 IMX8ULP_CLK_SAI4_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  518  					 <&cgc1 IMX8ULP_CLK_DUMMY>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  519  				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
28879c0c09387b3 Shengjiu Wang       2024-10-22  520  				dmas = <&edma1 67 0 1>, <&edma1 68 0 0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  521  				dma-names = "rx", "tx";
28879c0c09387b3 Shengjiu Wang       2024-10-22  522  				#sound-dai-cells = <0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  523  				fsl,dataline = <0 0x03 0x03>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  524  				status = "disabled";
28879c0c09387b3 Shengjiu Wang       2024-10-22  525  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  526  
28879c0c09387b3 Shengjiu Wang       2024-10-22  527  			sai5: sai@29890000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  528  				compatible = "fsl,imx8ulp-sai";
28879c0c09387b3 Shengjiu Wang       2024-10-22  529  				reg = <0x29890000 0x10000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  530  				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  531  				clocks = <&pcc4 IMX8ULP_CLK_SAI5>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  532  					 <&cgc1 IMX8ULP_CLK_SAI5_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  533  					 <&cgc1 IMX8ULP_CLK_DUMMY>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  534  				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
28879c0c09387b3 Shengjiu Wang       2024-10-22  535  				dmas = <&edma1 69 0 1>, <&edma1 70 0 0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  536  				dma-names = "rx", "tx";
28879c0c09387b3 Shengjiu Wang       2024-10-22  537  				#sound-dai-cells = <0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  538  				fsl,dataline = <0 0x0f 0x0f>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  539  				status = "disabled";
28879c0c09387b3 Shengjiu Wang       2024-10-22  540  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  541  
fe6291e963134d3 Jacky Bai           2021-11-26  542  			iomuxc1: pinctrl@298c0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  543  				compatible = "fsl,imx8ulp-iomuxc1";
fe6291e963134d3 Jacky Bai           2021-11-26  544  				reg = <0x298c0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  545  			};
fe6291e963134d3 Jacky Bai           2021-11-26  546  
fe6291e963134d3 Jacky Bai           2021-11-26  547  			usdhc0: mmc@298d0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  548  				compatible = "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
fe6291e963134d3 Jacky Bai           2021-11-26  549  				reg = <0x298d0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  550  				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  551  				clocks = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
fe6291e963134d3 Jacky Bai           2021-11-26  552  					 <&cgc1 IMX8ULP_CLK_XBAR_AD_DIVPLAT>,
fe6291e963134d3 Jacky Bai           2021-11-26  553  					 <&pcc4 IMX8ULP_CLK_USDHC0>;
fe6291e963134d3 Jacky Bai           2021-11-26  554  				clock-names = "ipg", "ahb", "per";
03eb813dac25d47 Peng Fan            2021-12-08  555  				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC0>;
97803407518dd58 Peng Fan            2023-07-24  556  				assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV1>,
97803407518dd58 Peng Fan            2023-07-24  557  						  <&pcc4 IMX8ULP_CLK_USDHC0>;
97803407518dd58 Peng Fan            2023-07-24  558  				assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV1>;
97803407518dd58 Peng Fan            2023-07-24  559  				assigned-clock-rates = <389283840>, <389283840>;
fe6291e963134d3 Jacky Bai           2021-11-26  560  				fsl,tuning-start-tap = <20>;
fe6291e963134d3 Jacky Bai           2021-11-26  561  				fsl,tuning-step = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26  562  				bus-width = <4>;
fe6291e963134d3 Jacky Bai           2021-11-26  563  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  564  			};
fe6291e963134d3 Jacky Bai           2021-11-26  565  
fe6291e963134d3 Jacky Bai           2021-11-26  566  			usdhc1: mmc@298e0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  567  				compatible = "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
fe6291e963134d3 Jacky Bai           2021-11-26  568  				reg = <0x298e0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  569  				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  570  				clocks = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
fe6291e963134d3 Jacky Bai           2021-11-26  571  					 <&cgc1 IMX8ULP_CLK_NIC_PER_DIVPLAT>,
fe6291e963134d3 Jacky Bai           2021-11-26  572  					 <&pcc4 IMX8ULP_CLK_USDHC1>;
fe6291e963134d3 Jacky Bai           2021-11-26  573  				clock-names = "ipg", "ahb", "per";
03eb813dac25d47 Peng Fan            2021-12-08  574  				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC1>;
97803407518dd58 Peng Fan            2023-07-24  575  				assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV2>,
97803407518dd58 Peng Fan            2023-07-24  576  						  <&pcc4 IMX8ULP_CLK_USDHC1>;
97803407518dd58 Peng Fan            2023-07-24  577  				assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV2>;
97803407518dd58 Peng Fan            2023-07-24  578  				assigned-clock-rates = <194641920>, <194641920>;
fe6291e963134d3 Jacky Bai           2021-11-26  579  				fsl,tuning-start-tap = <20>;
fe6291e963134d3 Jacky Bai           2021-11-26  580  				fsl,tuning-step = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26  581  				bus-width = <4>;
fe6291e963134d3 Jacky Bai           2021-11-26  582  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  583  			};
fe6291e963134d3 Jacky Bai           2021-11-26  584  
fe6291e963134d3 Jacky Bai           2021-11-26  585  			usdhc2: mmc@298f0000 {
fe6291e963134d3 Jacky Bai           2021-11-26  586  				compatible = "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
fe6291e963134d3 Jacky Bai           2021-11-26  587  				reg = <0x298f0000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  588  				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  589  				clocks = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
fe6291e963134d3 Jacky Bai           2021-11-26  590  					 <&cgc1 IMX8ULP_CLK_NIC_PER_DIVPLAT>,
fe6291e963134d3 Jacky Bai           2021-11-26  591  					 <&pcc4 IMX8ULP_CLK_USDHC2>;
fe6291e963134d3 Jacky Bai           2021-11-26  592  				clock-names = "ipg", "ahb", "per";
03eb813dac25d47 Peng Fan            2021-12-08  593  				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC2_USB1>;
97803407518dd58 Peng Fan            2023-07-24  594  				assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV2>,
97803407518dd58 Peng Fan            2023-07-24  595  						  <&pcc4 IMX8ULP_CLK_USDHC2>;
97803407518dd58 Peng Fan            2023-07-24  596  				assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD3_DIV2>;
97803407518dd58 Peng Fan            2023-07-24  597  				assigned-clock-rates = <194641920>, <194641920>;
fe6291e963134d3 Jacky Bai           2021-11-26  598  				fsl,tuning-start-tap = <20>;
fe6291e963134d3 Jacky Bai           2021-11-26  599  				fsl,tuning-step = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26  600  				bus-width = <4>;
fe6291e963134d3 Jacky Bai           2021-11-26  601  				status = "disabled";
fe6291e963134d3 Jacky Bai           2021-11-26  602  			};
683d7ffb7daaab1 Wei Fang            2022-07-27  603  
95049bf5e63f4f7 Xu Yang             2024-04-03  604  			usbotg1: usb@29900000 {
95049bf5e63f4f7 Xu Yang             2024-04-03  605  				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
95049bf5e63f4f7 Xu Yang             2024-04-03  606  				reg = <0x29900000 0x200>;
95049bf5e63f4f7 Xu Yang             2024-04-03  607  				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
95049bf5e63f4f7 Xu Yang             2024-04-03  608  				clocks = <&pcc4 IMX8ULP_CLK_USB0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  609  				power-domains = <&scmi_devpd IMX8ULP_PD_USB0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  610  				phys = <&usbphy1>;
95049bf5e63f4f7 Xu Yang             2024-04-03  611  				fsl,usbmisc = <&usbmisc1 0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  612  				ahb-burst-config = <0x0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  613  				tx-burst-size-dword = <0x8>;
95049bf5e63f4f7 Xu Yang             2024-04-03  614  				rx-burst-size-dword = <0x8>;
95049bf5e63f4f7 Xu Yang             2024-04-03  615  				status = "disabled";
95049bf5e63f4f7 Xu Yang             2024-04-03  616  			};
95049bf5e63f4f7 Xu Yang             2024-04-03  617  
95049bf5e63f4f7 Xu Yang             2024-04-03  618  			usbmisc1: usbmisc@29900200 {
95049bf5e63f4f7 Xu Yang             2024-04-03  619  				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
95049bf5e63f4f7 Xu Yang             2024-04-03  620  					     "fsl,imx6q-usbmisc";
95049bf5e63f4f7 Xu Yang             2024-04-03  621  				reg = <0x29900200 0x200>;
95049bf5e63f4f7 Xu Yang             2024-04-03  622  				#index-cells = <1>;
95049bf5e63f4f7 Xu Yang             2024-04-03  623  				status = "disabled";
95049bf5e63f4f7 Xu Yang             2024-04-03  624  			};
95049bf5e63f4f7 Xu Yang             2024-04-03  625  
95049bf5e63f4f7 Xu Yang             2024-04-03  626  			usbphy1: usb-phy@29910000 {
95049bf5e63f4f7 Xu Yang             2024-04-03  627  				compatible = "fsl,imx8ulp-usbphy", "fsl,imx7ulp-usbphy";
95049bf5e63f4f7 Xu Yang             2024-04-03  628  				reg = <0x29910000 0x10000>;
95049bf5e63f4f7 Xu Yang             2024-04-03  629  				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
95049bf5e63f4f7 Xu Yang             2024-04-03  630  				clocks = <&pcc4 IMX8ULP_CLK_USB0_PHY>;
95049bf5e63f4f7 Xu Yang             2024-04-03  631  				#phy-cells = <0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  632  				status = "disabled";
95049bf5e63f4f7 Xu Yang             2024-04-03  633  			};
95049bf5e63f4f7 Xu Yang             2024-04-03  634  
95049bf5e63f4f7 Xu Yang             2024-04-03  635  			usbotg2: usb@29920000 {
95049bf5e63f4f7 Xu Yang             2024-04-03  636  				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
95049bf5e63f4f7 Xu Yang             2024-04-03  637  				reg = <0x29920000 0x200>;
95049bf5e63f4f7 Xu Yang             2024-04-03  638  				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
95049bf5e63f4f7 Xu Yang             2024-04-03  639  				clocks = <&pcc4 IMX8ULP_CLK_USB1>;
95049bf5e63f4f7 Xu Yang             2024-04-03  640  				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC2_USB1>;
95049bf5e63f4f7 Xu Yang             2024-04-03  641  				phys = <&usbphy2>;
95049bf5e63f4f7 Xu Yang             2024-04-03  642  				fsl,usbmisc = <&usbmisc2 0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  643  				ahb-burst-config = <0x0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  644  				tx-burst-size-dword = <0x8>;
95049bf5e63f4f7 Xu Yang             2024-04-03  645  				rx-burst-size-dword = <0x8>;
95049bf5e63f4f7 Xu Yang             2024-04-03  646  				status = "disabled";
95049bf5e63f4f7 Xu Yang             2024-04-03  647  			};
95049bf5e63f4f7 Xu Yang             2024-04-03  648  
95049bf5e63f4f7 Xu Yang             2024-04-03  649  			usbmisc2: usbmisc@29920200 {
95049bf5e63f4f7 Xu Yang             2024-04-03  650  				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
95049bf5e63f4f7 Xu Yang             2024-04-03  651  					     "fsl,imx6q-usbmisc";
95049bf5e63f4f7 Xu Yang             2024-04-03  652  				reg = <0x29920200 0x200>;
95049bf5e63f4f7 Xu Yang             2024-04-03  653  				#index-cells = <1>;
95049bf5e63f4f7 Xu Yang             2024-04-03  654  				status = "disabled";
95049bf5e63f4f7 Xu Yang             2024-04-03  655  			};
95049bf5e63f4f7 Xu Yang             2024-04-03  656  
95049bf5e63f4f7 Xu Yang             2024-04-03  657  			usbphy2: usb-phy@29930000 {
95049bf5e63f4f7 Xu Yang             2024-04-03  658  				compatible = "fsl,imx8ulp-usbphy", "fsl,imx7ulp-usbphy";
95049bf5e63f4f7 Xu Yang             2024-04-03  659  				reg = <0x29930000 0x10000>;
95049bf5e63f4f7 Xu Yang             2024-04-03  660  				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
95049bf5e63f4f7 Xu Yang             2024-04-03  661  				clocks = <&pcc4 IMX8ULP_CLK_USB1_PHY>;
95049bf5e63f4f7 Xu Yang             2024-04-03  662  				#phy-cells = <0>;
95049bf5e63f4f7 Xu Yang             2024-04-03  663  				status = "disabled";
95049bf5e63f4f7 Xu Yang             2024-04-03  664  			};
95049bf5e63f4f7 Xu Yang             2024-04-03  665  
683d7ffb7daaab1 Wei Fang            2022-07-27  666  			fec: ethernet@29950000 {
683d7ffb7daaab1 Wei Fang            2022-07-27  667  				compatible = "fsl,imx8ulp-fec", "fsl,imx6ul-fec", "fsl,imx6q-fec";
683d7ffb7daaab1 Wei Fang            2022-07-27  668  				reg = <0x29950000 0x10000>;
683d7ffb7daaab1 Wei Fang            2022-07-27  669  				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
683d7ffb7daaab1 Wei Fang            2022-07-27  670  				interrupt-names = "int0";
683d7ffb7daaab1 Wei Fang            2022-07-27  671  				fsl,num-tx-queues = <1>;
683d7ffb7daaab1 Wei Fang            2022-07-27  672  				fsl,num-rx-queues = <1>;
683d7ffb7daaab1 Wei Fang            2022-07-27  673  				status = "disabled";
683d7ffb7daaab1 Wei Fang            2022-07-27  674  			};
fe6291e963134d3 Jacky Bai           2021-11-26  675  		};
fe6291e963134d3 Jacky Bai           2021-11-26  676  
8ae06f136639097 Haibo Chen          2023-11-15  677  		gpioe: gpio@2d000000 {
ac7bcf48ddbae7a Peng Fan            2023-10-01  678  				compatible = "fsl,imx8ulp-gpio";
ac7bcf48ddbae7a Peng Fan            2023-10-01  679  				reg = <0x2d000000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  680  				gpio-controller;
fe6291e963134d3 Jacky Bai           2021-11-26  681  				#gpio-cells = <2>;
ac7bcf48ddbae7a Peng Fan            2023-10-01  682  				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
ac7bcf48ddbae7a Peng Fan            2023-10-01  683  					     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  684  				interrupt-controller;
fe6291e963134d3 Jacky Bai           2021-11-26  685  				#interrupt-cells = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26  686  				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>,
fe6291e963134d3 Jacky Bai           2021-11-26  687  					 <&pcc4 IMX8ULP_CLK_PCTLE>;
fe6291e963134d3 Jacky Bai           2021-11-26  688  				clock-names = "gpio", "port";
fe6291e963134d3 Jacky Bai           2021-11-26  689  				gpio-ranges = <&iomuxc1 0 32 24>;
fe6291e963134d3 Jacky Bai           2021-11-26  690  		};
fe6291e963134d3 Jacky Bai           2021-11-26  691  
8ae06f136639097 Haibo Chen          2023-11-15  692  		gpiof: gpio@2d010000 {
ac7bcf48ddbae7a Peng Fan            2023-10-01  693  				compatible = "fsl,imx8ulp-gpio";
ac7bcf48ddbae7a Peng Fan            2023-10-01  694  				reg = <0x2d010000 0x1000>;
fe6291e963134d3 Jacky Bai           2021-11-26  695  				gpio-controller;
fe6291e963134d3 Jacky Bai           2021-11-26  696  				#gpio-cells = <2>;
ac7bcf48ddbae7a Peng Fan            2023-10-01  697  				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
ac7bcf48ddbae7a Peng Fan            2023-10-01  698  					     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
fe6291e963134d3 Jacky Bai           2021-11-26  699  				interrupt-controller;
fe6291e963134d3 Jacky Bai           2021-11-26  700  				#interrupt-cells = <2>;
fe6291e963134d3 Jacky Bai           2021-11-26  701  				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>,
fe6291e963134d3 Jacky Bai           2021-11-26  702  					 <&pcc4 IMX8ULP_CLK_PCTLF>;
fe6291e963134d3 Jacky Bai           2021-11-26  703  				clock-names = "gpio", "port";
fe6291e963134d3 Jacky Bai           2021-11-26  704  				gpio-ranges = <&iomuxc1 0 64 32>;
fe6291e963134d3 Jacky Bai           2021-11-26  705  		};
fe6291e963134d3 Jacky Bai           2021-11-26  706  
fe6291e963134d3 Jacky Bai           2021-11-26  707  		per_bridge5: bus@2d800000 {
fe6291e963134d3 Jacky Bai           2021-11-26  708  			compatible = "simple-bus";
fe6291e963134d3 Jacky Bai           2021-11-26  709  			reg = <0x2d800000 0x800000>;
fe6291e963134d3 Jacky Bai           2021-11-26  710  			#address-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  711  			#size-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  712  			ranges;
fe6291e963134d3 Jacky Bai           2021-11-26  713  
28879c0c09387b3 Shengjiu Wang       2024-10-22  714  			edma2: dma-controller@2d800000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  715  				compatible = "fsl,imx8ulp-edma";
28879c0c09387b3 Shengjiu Wang       2024-10-22  716  				reg = <0x2d800000 0x210000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  717  				#dma-cells = <3>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  718  				dma-channels = <32>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  719  				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  720  					     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  721  					     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  722  					     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  723  					     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  724  					     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  725  					     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  726  					     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  727  					     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  728  					     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  729  					     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  730  					     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  731  					     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  732  					     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  733  					     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  734  					     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  735  					     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  736  					     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  737  					     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  738  					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  739  					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  740  					     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  741  					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  742  					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  743  					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  744  					     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  745  					     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  746  					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  747  					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  748  					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  749  					     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  750  					     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  751  				clocks = <&pcc5 IMX8ULP_CLK_DMA2_MP>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  752  					<&pcc5 IMX8ULP_CLK_DMA2_CH0>, <&pcc5 IMX8ULP_CLK_DMA2_CH1>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  753  					<&pcc5 IMX8ULP_CLK_DMA2_CH2>, <&pcc5 IMX8ULP_CLK_DMA2_CH3>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  754  					<&pcc5 IMX8ULP_CLK_DMA2_CH4>, <&pcc5 IMX8ULP_CLK_DMA2_CH5>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  755  					<&pcc5 IMX8ULP_CLK_DMA2_CH6>, <&pcc5 IMX8ULP_CLK_DMA2_CH7>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  756  					<&pcc5 IMX8ULP_CLK_DMA2_CH8>, <&pcc5 IMX8ULP_CLK_DMA2_CH9>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  757  					<&pcc5 IMX8ULP_CLK_DMA2_CH10>, <&pcc5 IMX8ULP_CLK_DMA2_CH11>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  758  					<&pcc5 IMX8ULP_CLK_DMA2_CH12>, <&pcc5 IMX8ULP_CLK_DMA2_CH13>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  759  					<&pcc5 IMX8ULP_CLK_DMA2_CH14>, <&pcc5 IMX8ULP_CLK_DMA2_CH15>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  760  					<&pcc5 IMX8ULP_CLK_DMA2_CH16>, <&pcc5 IMX8ULP_CLK_DMA2_CH17>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  761  					<&pcc5 IMX8ULP_CLK_DMA2_CH18>, <&pcc5 IMX8ULP_CLK_DMA2_CH19>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  762  					<&pcc5 IMX8ULP_CLK_DMA2_CH20>, <&pcc5 IMX8ULP_CLK_DMA2_CH21>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  763  					<&pcc5 IMX8ULP_CLK_DMA2_CH22>, <&pcc5 IMX8ULP_CLK_DMA2_CH23>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  764  					<&pcc5 IMX8ULP_CLK_DMA2_CH24>, <&pcc5 IMX8ULP_CLK_DMA2_CH25>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  765  					<&pcc5 IMX8ULP_CLK_DMA2_CH26>, <&pcc5 IMX8ULP_CLK_DMA2_CH27>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  766  					<&pcc5 IMX8ULP_CLK_DMA2_CH28>, <&pcc5 IMX8ULP_CLK_DMA2_CH29>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  767  					<&pcc5 IMX8ULP_CLK_DMA2_CH30>, <&pcc5 IMX8ULP_CLK_DMA2_CH31>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  768  				clock-names = "dma", "ch00","ch01", "ch02", "ch03",
28879c0c09387b3 Shengjiu Wang       2024-10-22  769  						"ch04", "ch05", "ch06", "ch07",
28879c0c09387b3 Shengjiu Wang       2024-10-22  770  						"ch08", "ch09", "ch10", "ch11",
28879c0c09387b3 Shengjiu Wang       2024-10-22  771  						"ch12", "ch13", "ch14", "ch15",
28879c0c09387b3 Shengjiu Wang       2024-10-22  772  						"ch16", "ch17", "ch18", "ch19",
28879c0c09387b3 Shengjiu Wang       2024-10-22  773  						"ch20", "ch21", "ch22", "ch23",
28879c0c09387b3 Shengjiu Wang       2024-10-22  774  						"ch24", "ch25", "ch26", "ch27",
28879c0c09387b3 Shengjiu Wang       2024-10-22  775  						"ch28", "ch29", "ch30", "ch31";
28879c0c09387b3 Shengjiu Wang       2024-10-22  776  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  777  
fe6291e963134d3 Jacky Bai           2021-11-26  778  			cgc2: clock-controller@2da60000 {
fe6291e963134d3 Jacky Bai           2021-11-26  779  				compatible = "fsl,imx8ulp-cgc2";
fe6291e963134d3 Jacky Bai           2021-11-26  780  				reg = <0x2da60000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  781  				#clock-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  782  			};
fe6291e963134d3 Jacky Bai           2021-11-26  783  
fe6291e963134d3 Jacky Bai           2021-11-26  784  			pcc5: clock-controller@2da70000 {
fe6291e963134d3 Jacky Bai           2021-11-26  785  				compatible = "fsl,imx8ulp-pcc5";
fe6291e963134d3 Jacky Bai           2021-11-26  786  				reg = <0x2da70000 0x10000>;
fe6291e963134d3 Jacky Bai           2021-11-26  787  				#clock-cells = <1>;
5fa383a25fd8a16 Peng Fan            2022-08-31  788  				#reset-cells = <1>;
fe6291e963134d3 Jacky Bai           2021-11-26  789  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  790  
28879c0c09387b3 Shengjiu Wang       2024-10-22  791  			sai6: sai@2da90000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  792  				compatible = "fsl,imx8ulp-sai";
28879c0c09387b3 Shengjiu Wang       2024-10-22  793  				reg = <0x2da90000 0x10000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  794  				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  795  				clocks = <&pcc5 IMX8ULP_CLK_SAI6>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  796  					 <&cgc2 IMX8ULP_CLK_SAI6_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  797  					 <&cgc1 IMX8ULP_CLK_DUMMY>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  798  				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
28879c0c09387b3 Shengjiu Wang       2024-10-22  799  				dmas = <&edma2 71 0 1>, <&edma2 72 0 0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  800  				dma-names = "rx", "tx";
28879c0c09387b3 Shengjiu Wang       2024-10-22  801  				#sound-dai-cells = <0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  802  				fsl,dataline = <0 0x0f 0x0f>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  803  				status = "disabled";
28879c0c09387b3 Shengjiu Wang       2024-10-22  804  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  805  
28879c0c09387b3 Shengjiu Wang       2024-10-22  806  			sai7: sai@2daa0000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  807  				compatible = "fsl,imx8ulp-sai";
28879c0c09387b3 Shengjiu Wang       2024-10-22  808  				reg = <0x2daa0000 0x10000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  809  				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  810  				clocks = <&pcc5 IMX8ULP_CLK_SAI7>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  811  					 <&cgc2 IMX8ULP_CLK_SAI7_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
28879c0c09387b3 Shengjiu Wang       2024-10-22  812  					 <&cgc1 IMX8ULP_CLK_DUMMY>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  813  				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
28879c0c09387b3 Shengjiu Wang       2024-10-22  814  				dmas = <&edma2 73 0 1>, <&edma2 74 0 0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  815  				dma-names = "rx", "tx";
28879c0c09387b3 Shengjiu Wang       2024-10-22  816  				#sound-dai-cells = <0>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  817  				fsl,dataline = <0 0x0f 0x0f>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  818  				status = "disabled";
28879c0c09387b3 Shengjiu Wang       2024-10-22  819  			};
28879c0c09387b3 Shengjiu Wang       2024-10-22  820  
28879c0c09387b3 Shengjiu Wang       2024-10-22  821  			spdif: spdif@2dab0000 {
28879c0c09387b3 Shengjiu Wang       2024-10-22  822  				compatible = "fsl,imx8ulp-spdif";
28879c0c09387b3 Shengjiu Wang       2024-10-22  823  				reg = <0x2dab0000 0x10000>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  824  				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  825  				clocks = <&pcc5 IMX8ULP_CLK_SPDIF>, /* core */
28879c0c09387b3 Shengjiu Wang       2024-10-22  826  					 <&sosc>, /* 0, extal */
28879c0c09387b3 Shengjiu Wang       2024-10-22  827  					 <&cgc2 IMX8ULP_CLK_SPDIF_SEL>, /* 1, tx */
28879c0c09387b3 Shengjiu Wang       2024-10-22  828  					 <&cgc1 IMX8ULP_CLK_DUMMY>, /* 2, tx1 */
28879c0c09387b3 Shengjiu Wang       2024-10-22  829  					 <&cgc1 IMX8ULP_CLK_DUMMY>, /* 3, tx2 */
28879c0c09387b3 Shengjiu Wang       2024-10-22  830  					 <&cgc1 IMX8ULP_CLK_DUMMY>, /* 4, tx3 */
28879c0c09387b3 Shengjiu Wang       2024-10-22  831  					 <&pcc5 IMX8ULP_CLK_SPDIF>, /* 5, sys */
28879c0c09387b3 Shengjiu Wang       2024-10-22  832  					 <&cgc1 IMX8ULP_CLK_DUMMY>, /* 6, tx4 */
28879c0c09387b3 Shengjiu Wang       2024-10-22  833  					 <&cgc1 IMX8ULP_CLK_DUMMY>, /* 7, tx5 */
28879c0c09387b3 Shengjiu Wang       2024-10-22  834  					 <&cgc1 IMX8ULP_CLK_DUMMY>; /* spba */
28879c0c09387b3 Shengjiu Wang       2024-10-22  835  				clock-names = "core", "rxtx0",
28879c0c09387b3 Shengjiu Wang       2024-10-22  836  					      "rxtx1", "rxtx2",
28879c0c09387b3 Shengjiu Wang       2024-10-22  837  					      "rxtx3", "rxtx4",
28879c0c09387b3 Shengjiu Wang       2024-10-22  838  					      "rxtx5", "rxtx6",
28879c0c09387b3 Shengjiu Wang       2024-10-22  839  					      "rxtx7", "spba";
28879c0c09387b3 Shengjiu Wang       2024-10-22  840  				dmas = <&edma2 75 0 5>, <&edma2 76 0 4>;
28879c0c09387b3 Shengjiu Wang       2024-10-22  841  				dma-names = "rx", "tx";
28879c0c09387b3 Shengjiu Wang       2024-10-22  842  				status = "disabled";
28879c0c09387b3 Shengjiu Wang       2024-10-22  843  			};
b3ab3efab3251ba Guoniu Zhou         2025-08-12  844  
b3ab3efab3251ba Guoniu Zhou         2025-08-12  845  			isi: isi@2dac0000 {
b3ab3efab3251ba Guoniu Zhou         2025-08-12  846  				compatible = "fsl,imx8ulp-isi";
b3ab3efab3251ba Guoniu Zhou         2025-08-12  847  				reg = <0x2dac0000 0x10000>;
b3ab3efab3251ba Guoniu Zhou         2025-08-12  848  				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
b3ab3efab3251ba Guoniu Zhou         2025-08-12  849  				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
b3ab3efab3251ba Guoniu Zhou         2025-08-12  850  					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
b3ab3efab3251ba Guoniu Zhou         2025-08-12  851  				clock-names = "axi", "apb";
b3ab3efab3251ba Guoniu Zhou         2025-08-12  852  				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
b3ab3efab3251ba Guoniu Zhou         2025-08-12  853  				status = "disabled";
b3ab3efab3251ba Guoniu Zhou         2025-08-12  854  
b3ab3efab3251ba Guoniu Zhou         2025-08-12 @855  				ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
