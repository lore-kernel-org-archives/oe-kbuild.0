Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B31FCCF1
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778492; cv=none; b=t7XHqyqFxZhr2zsj1+k9IwhdQcfGFWe6uI/hTdMFPgH5nz8iLXrr9dZDJMMKTTzKfqpG/mtJR/mFHmb99oBkuNY6G6f5TmOQ+TVtNCAl5svK96D4l/rx4EtKpnT2jfzjdVZSKTxe+cdbX/iQiqf8qAv18Ak3spLeFQd/PTbDT14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778492; c=relaxed/simple;
	bh=4bo/UsA2xCYeW5YNqmvx/K68lMuKtZpeRJyCXE0SN84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9P0SaHKryNe1STF1jNjQvRTotSJVJhP0OFMDTj7hPBJ3kUtGtoE85SFeHf5cHx/k8gf+BE0h3H1iK8cdDhkzPPMdw2EM4WNWWh4SU1ZvhHbeEeWlt6PNbyAtT8wk/5AFA4IPhhB0mMF3t/Yx3nRmt3PsCh1a3vlgLUhpsvbDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoH2f6PY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoH2f6PY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738778490; x=1770314490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bo/UsA2xCYeW5YNqmvx/K68lMuKtZpeRJyCXE0SN84=;
  b=HoH2f6PYQqUi1XO8JCHE399Vx4Kp3TRkhdvBYvmbYoejsyfIH7vnnt5M
   TXgWZtHVUCThJSSDM3gD2hhmd5F0YaUWBpVlrPkljx2+G8W3N0FV9U7xK
   HBAtPz5T1KGfDXSqXpE+0fr5vmrOLPmMSC3wmPPnLILwPUtJrCEZUHPft
   Kt2JAQwNcvUdag2RzIVUyU5GuE42rr7XauI/KbFYFOpyefAKa6iDlRgIA
   9Cq1MlkA4D95fZzURIEwT2e9OinPtjAWrwfaN6c7wrLJBvDmzf2CDfcby
   KLDb9L0IJOLDOFIcR95WhmJKHZUtnV+/c1bTmaRRJ6/fNUlRtVzt/6MiH
   A==;
X-CSE-ConnectionGUID: yl7bXv7ySWWpWYAK/IzOKQ==
X-CSE-MsgGUID: jvYRI4XgT92xRxKtJzgXnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50750707"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="50750707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 10:01:28 -0800
X-CSE-ConnectionGUID: l5qOBnmcS9GZs79jQoSLqw==
X-CSE-MsgGUID: bhuZwst+RAy2AyVBEJGrAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110819795"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2025 10:01:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfji9-000vsl-11;
	Wed, 05 Feb 2025 18:01:17 +0000
Date: Thu, 6 Feb 2025 02:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: microchip: Move address/size-cells properties
 to SoC dtsi
Message-ID: <202502060115.gfw1q0KW-lkp@intel.com>
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
In-Reply-To: <20250204165205.2375940-1-ada@thorsis.com>
References: <20250204165205.2375940-1-ada@thorsis.com>
TO: Alexander Dahl <ada@thorsis.com>
TO: devicetree@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Peter Rosin <peda@axentia.se>
CC: linux-kernel@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Dahl/ARM-dts-microchip-Move-address-size-cells-properties-to-SoC-dtsi/20250205-005445
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250204165205.2375940-1-ada%40thorsis.com
patch subject: [PATCH] ARM: dts: microchip: Move address/size-cells properties to SoC dtsi
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm-sama7_defconfig (https://download.01.org/0day-ci/archive/20250206/202502060115.gfw1q0KW-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060115.gfw1q0KW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502060115.gfw1q0KW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/sama5d2.dtsi:382.29-393.6: Warning (avoid_unnecessary_addr_size): /ahb/apb/ethernet@f8008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi:66.29-77.6: Warning (avoid_unnecessary_addr_size): /ahb/apb/ethernet@f0028000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +382 arch/arm/boot/dts/microchip/sama5d2.dtsi

e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   14  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   15  / {
abe60a3a7afb40 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2019-01-09   16  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2019-01-09   17  	#size-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   18  	model = "Atmel SAMA5D2 family SoC";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   19  	compatible = "atmel,sama5d2";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   20  	interrupt-parent = <&aic>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   21  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   22  	aliases {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   23  		serial0 = &uart1;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   24  		serial1 = &uart3;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   25  	};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   26  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   27  	cpus {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   28  		#address-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   29  		#size-cells = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   30  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   31  		cpu@0 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   32  			device_type = "cpu";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   33  			compatible = "arm,cortex-a5";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   34  			reg = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   35  			next-level-cache = <&L2>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   36  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   37  	};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   38  
fcac40c94d48f6 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-01   39  	pmu {
fcac40c94d48f6 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-01   40  		compatible = "arm,cortex-a5-pmu";
fcac40c94d48f6 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-01   41  		interrupts = <2 IRQ_TYPE_LEVEL_HIGH 0>;
fcac40c94d48f6 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-01   42  	};
fcac40c94d48f6 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-01   43  
4d930c421e3b4f arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2021-04-02   44  	etb@740000 {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   45  		compatible = "arm,coresight-etb10", "arm,primecell";
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   46  		reg = <0x740000 0x1000>;
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   47  
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12   48  		clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   49  		clock-names = "apb_pclk";
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   50  
97181516b0785d arch/arm/boot/dts/sama5d2.dtsi Suzuki K Poulose  2018-09-12   51  		in-ports {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   52  			port {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   53  				etb_in: endpoint {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   54  					remote-endpoint = <&etm_out>;
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   55  				};
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   56  			};
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   57  		};
97181516b0785d arch/arm/boot/dts/sama5d2.dtsi Suzuki K Poulose  2018-09-12   58  	};
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   59  
e4379d649e0e54 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2021-04-08   60  	etm@73c000 {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   61  		compatible = "arm,coresight-etm3x", "arm,primecell";
e4379d649e0e54 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2021-04-08   62  		reg = <0x73c000 0x1000>;
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   63  
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12   64  		clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   65  		clock-names = "apb_pclk";
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   66  
97181516b0785d arch/arm/boot/dts/sama5d2.dtsi Suzuki K Poulose  2018-09-12   67  		out-ports {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   68  			port {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   69  				etm_out: endpoint {
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   70  					remote-endpoint = <&etb_in>;
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   71  				};
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   72  			};
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   73  		};
97181516b0785d arch/arm/boot/dts/sama5d2.dtsi Suzuki K Poulose  2018-09-12   74  	};
e46f48ad86f448 arch/arm/boot/dts/sama5d2.dtsi Olivier Schonken  2016-07-05   75  
996710a8956e43 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31   76  	memory@20000000 {
abe60a3a7afb40 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2019-01-09   77  		device_type = "memory";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   78  		reg = <0x20000000 0x20000000>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   79  	};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   80  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   81  	clocks {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   82  		slow_xtal: slow_xtal {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   83  			compatible = "fixed-clock";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   84  			#clock-cells = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   85  			clock-frequency = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   86  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   87  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   88  		main_xtal: main_xtal {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   89  			compatible = "fixed-clock";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   90  			#clock-cells = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   91  			clock-frequency = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   92  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   93  	};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   94  
8dccafaa281aa1 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2017-10-13   95  	ns_sram: sram@200000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   96  		compatible = "mmio-sram";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18   97  		reg = <0x00200000 0x20000>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31   98  		#address-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31   99  		#size-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31  100  		ranges = <0 0x00200000 0x20000>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  101  	};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  102  
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  103  	resistive_touch: resistive-touch {
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  104  		compatible = "resistive-adc-touch";
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  105  		io-channels = <&adc AT91_SAMA5D2_ADC_X_CHANNEL>,
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  106  			      <&adc AT91_SAMA5D2_ADC_Y_CHANNEL>,
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  107  			      <&adc AT91_SAMA5D2_ADC_P_CHANNEL>;
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  108  		io-channel-names = "x", "y", "pressure";
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  109  		touchscreen-min-pressure = <50000>;
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  110  		status = "disabled";
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  111  	};
005627ea13c9c6 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2022-06-15  112  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  113  	ahb {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  114  		compatible = "simple-bus";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  115  		#address-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  116  		#size-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  117  		ranges;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  118  
8dccafaa281aa1 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2017-10-13  119  		nfc_sram: sram@100000 {
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  120  			compatible = "mmio-sram";
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  121  			no-memory-wc;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  122  			reg = <0x00100000 0x2400>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31  123  			#address-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31  124  			#size-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31  125  			ranges = <0 0x00100000 0x2400>;
cd6228b782ae16 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2020-08-31  126  
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  127  		};
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  128  
8dccafaa281aa1 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2017-10-13  129  		usb0: gadget@300000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  130  			compatible = "atmel,sama5d3-udc";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  131  			reg = <0x00300000 0x100000
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  132  			       0xfc02c000 0x400>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  133  			interrupts = <42 IRQ_TYPE_LEVEL_HIGH 2>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  134  			clocks = <&pmc PMC_TYPE_PERIPHERAL 42>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  135  			clock-names = "pclk", "hclk";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  136  			status = "disabled";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  137  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  138  
8dccafaa281aa1 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2017-10-13  139  		usb1: ohci@400000 {
9e10889a317734 arch/arm/boot/dts/sama5d2.dtsi Romain Izard      2017-02-17  140  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  141  			reg = <0x00400000 0x100000>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  142  			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  143  			clocks = <&pmc PMC_TYPE_PERIPHERAL 41>, <&pmc PMC_TYPE_PERIPHERAL 41>, <&pmc PMC_TYPE_SYSTEM 6>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  144  			clock-names = "ohci_clk", "hclk", "uhpck";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  145  			status = "disabled";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  146  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  147  
8dccafaa281aa1 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2017-10-13  148  		usb2: ehci@500000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  149  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  150  			reg = <0x00500000 0x100000>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  151  			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  152  			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 41>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  153  			clock-names = "usb_clk", "ehci_clk";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  154  			status = "disabled";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  155  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  156  
8dccafaa281aa1 arch/arm/boot/dts/sama5d2.dtsi Rob Herring       2017-10-13  157  		L2: cache-controller@a00000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  158  			compatible = "arm,pl310-cache";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  159  			reg = <0x00a00000 0x1000>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  160  			interrupts = <63 IRQ_TYPE_LEVEL_HIGH 4>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  161  			cache-unified;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  162  			cache-level = <2>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  163  		};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  164  
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  165  		ebi: ebi@10000000 {
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  166  			compatible = "atmel,sama5d3-ebi";
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  167  			#address-cells = <2>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  168  			#size-cells = <1>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  169  			atmel,smc = <&hsmc>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  170  			reg = <0x10000000 0x10000000
8ff235fe7a8c4a arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2017-07-07  171  			       0x60000000 0x30000000>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  172  			ranges = <0x0 0x0 0x10000000 0x10000000
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  173  				  0x1 0x0 0x60000000 0x10000000
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  174  				  0x2 0x0 0x70000000 0x10000000
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  175  				  0x3 0x0 0x80000000 0x10000000>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  176  			clocks = <&pmc PMC_TYPE_CORE PMC_MCK2>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  177  			status = "disabled";
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  178  
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  179  			nand_controller: nand-controller {
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  180  				compatible = "atmel,sama5d3-nand-controller";
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  181  				atmel,nfc-sram = <&nfc_sram>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  182  				atmel,nfc-io = <&nfc_io>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  183  				ecc-engine = <&pmecc>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  184  				#address-cells = <2>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  185  				#size-cells = <1>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  186  				ranges;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  187  				status = "disabled";
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  188  			};
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  189  		};
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  190  
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  191  		sdmmc0: sdio-host@a0000000 {
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  192  			compatible = "atmel,sama5d2-sdhci";
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  193  			reg = <0xa0000000 0x300>;
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  194  			interrupts = <31 IRQ_TYPE_LEVEL_HIGH 0>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  195  			clocks = <&pmc PMC_TYPE_PERIPHERAL 31>, <&pmc PMC_TYPE_GCK 31>, <&pmc PMC_TYPE_CORE PMC_MAIN>;
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  196  			clock-names = "hclock", "multclk", "baseclk";
bbd73c02e7d19e arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2019-11-28  197  			assigned-clocks = <&pmc PMC_TYPE_GCK 31>;
bbd73c02e7d19e arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2019-11-28  198  			assigned-clock-rates = <480000000>;
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  199  			status = "disabled";
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  200  		};
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  201  
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  202  		sdmmc1: sdio-host@b0000000 {
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  203  			compatible = "atmel,sama5d2-sdhci";
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  204  			reg = <0xb0000000 0x300>;
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  205  			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 0>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  206  			clocks = <&pmc PMC_TYPE_PERIPHERAL 32>, <&pmc PMC_TYPE_GCK 32>, <&pmc PMC_TYPE_CORE PMC_MAIN>;
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  207  			clock-names = "hclock", "multclk", "baseclk";
bbd73c02e7d19e arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2019-11-28  208  			assigned-clocks = <&pmc PMC_TYPE_GCK 32>;
bbd73c02e7d19e arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2019-11-28  209  			assigned-clock-rates = <480000000>;
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  210  			status = "disabled";
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  211  		};
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  212  
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  213  		nfc_io: nfc-io@c0000000 {
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  214  			compatible = "atmel,sama5d3-nfc-io", "syscon";
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  215  			reg = <0xc0000000 0x8000000>;
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  216  		};
d9c41bf30cf8ce arch/arm/boot/dts/sama5d2.dtsi Boris Brezillon   2017-05-30  217  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  218  		apb {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  219  			compatible = "simple-bus";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  220  			#address-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  221  			#size-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  222  			ranges;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  223  
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  224  			hlcdc: hlcdc@f0000000 {
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  225  				compatible = "atmel,sama5d2-hlcdc";
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  226  				reg = <0xf0000000 0x2000>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  227  				interrupts = <45 IRQ_TYPE_LEVEL_HIGH 0>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  228  				clocks = <&pmc PMC_TYPE_PERIPHERAL 45>, <&pmc PMC_TYPE_SYSTEM 3>, <&clk32k>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  229  				clock-names = "periph_clk","sys_clk", "slow_clk";
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  230  				status = "disabled";
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  231  
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  232  				hlcdc-display-controller {
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  233  					compatible = "atmel,hlcdc-display-controller";
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  234  					#address-cells = <1>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  235  					#size-cells = <0>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  236  
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  237  					port@0 {
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  238  						#address-cells = <1>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  239  						#size-cells = <0>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  240  						reg = <0>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  241  					};
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  242  				};
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  243  
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  244  				hlcdc_pwm: hlcdc-pwm {
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  245  					compatible = "atmel,hlcdc-pwm";
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  246  					#pwm-cells = <3>;
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  247  				};
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  248  			};
fd718627b31dfc arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-03-10  249  
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  250  			isc: isc@f0008000 {
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  251  				compatible = "atmel,sama5d2-isc";
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  252  				reg = <0xf0008000 0x4000>;
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  253  				interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  254  				clocks = <&pmc PMC_TYPE_PERIPHERAL 46>, <&pmc PMC_TYPE_SYSTEM 18>, <&pmc PMC_TYPE_GCK 46>;
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  255  				clock-names = "hclock", "iscck", "gck";
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  256  				#clock-cells = <0>;
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  257  				clock-output-names = "isc-mck";
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  258  				status = "disabled";
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  259  			};
68671d5fd14870 arch/arm/boot/dts/sama5d2.dtsi Songjun Wu        2017-07-06  260  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  261  			ramc0: ramc@f000c000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  262  				compatible = "atmel,sama5d3-ddramc";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  263  				reg = <0xf000c000 0x200>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  264  				clocks = <&pmc PMC_TYPE_SYSTEM 2>, <&pmc PMC_TYPE_PERIPHERAL 13>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  265  				clock-names = "ddrck", "mpddr";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  266  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  267  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  268  			dma0: dma-controller@f0010000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  269  				compatible = "atmel,sama5d4-dma";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  270  				reg = <0xf0010000 0x1000>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  271  				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  272  				#dma-cells = <1>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  273  				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  274  				clock-names = "dma_clk";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  275  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  276  
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  277  			/* Place dma1 here despite its address */
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  278  			dma1: dma-controller@f0004000 {
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  279  				compatible = "atmel,sama5d4-dma";
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  280  				reg = <0xf0004000 0x1000>;
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  281  				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 0>;
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  282  				#dma-cells = <1>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  283  				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  284  				clock-names = "dma_clk";
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  285  			};
22eb6cc2221357 arch/arm/boot/dts/sama5d2.dtsi Nicolas Ferre     2016-12-01  286  
d08f92bdfb2dc4 arch/arm/boot/dts/sama5d2.dtsi Claudiu Beznea    2023-05-17  287  			pmc: clock-controller@f0014000 {
620f50332232b0 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2015-10-12  288  				compatible = "atmel,sama5d2-pmc", "syscon";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  289  				reg = <0xf0014000 0x160>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  290  				interrupts = <74 IRQ_TYPE_LEVEL_HIGH 7>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  291  				#clock-cells = <2>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  292  				clocks = <&clk32k>, <&main_xtal>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  293  				clock-names = "slow_clk", "main_xtal";
512fc048e4fdc3 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-10-16  294  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  295  
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  296  			qspi0: spi@f0020000 {
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  297  				compatible = "atmel,sama5d2-qspi";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  298  				reg = <0xf0020000 0x100>, <0xd0000000 0x08000000>;
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  299  				reg-names = "qspi_base", "qspi_mmap";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  300  				interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  301  				clocks = <&pmc PMC_TYPE_PERIPHERAL 52>;
cf4060f1bb6434 arch/arm/boot/dts/sama5d2.dtsi Tudor Ambarus     2021-12-09  302  				clock-names = "pclk";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  303  				#address-cells = <1>;
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  304  				#size-cells = <0>;
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  305  				status = "disabled";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  306  			};
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  307  
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  308  			qspi1: spi@f0024000 {
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  309  				compatible = "atmel,sama5d2-qspi";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  310  				reg = <0xf0024000 0x100>, <0xd8000000 0x08000000>;
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  311  				reg-names = "qspi_base", "qspi_mmap";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  312  				interrupts = <53 IRQ_TYPE_LEVEL_HIGH 7>;
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  313  				clocks = <&pmc PMC_TYPE_PERIPHERAL 53>;
cf4060f1bb6434 arch/arm/boot/dts/sama5d2.dtsi Tudor Ambarus     2021-12-09  314  				clock-names = "pclk";
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  315  				#address-cells = <1>;
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  316  				#size-cells = <0>;
b23612d1e10da0 arch/arm/boot/dts/sama5d2.dtsi Cyrille Pitchen   2017-07-06  317  				status = "disabled";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  318  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  319  
4b6140b96dfe4a arch/arm/boot/dts/sama5d2.dtsi Tudor Ambarus     2022-02-08  320  			sha: crypto@f0028000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  321  				compatible = "atmel,at91sam9g46-sha";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  322  				reg = <0xf0028000 0x100>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  323  				interrupts = <12 IRQ_TYPE_LEVEL_HIGH 0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  324  				dmas = <&dma0
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  325  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  326  					 AT91_XDMAC_DT_PERID(30))>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  327  				dma-names = "tx";
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  328  				clocks = <&pmc PMC_TYPE_PERIPHERAL 12>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  329  				clock-names = "sha_clk";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  330  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  331  
4b6140b96dfe4a arch/arm/boot/dts/sama5d2.dtsi Tudor Ambarus     2022-02-08  332  			aes: crypto@f002c000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  333  				compatible = "atmel,at91sam9g46-aes";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  334  				reg = <0xf002c000 0x100>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  335  				interrupts = <9 IRQ_TYPE_LEVEL_HIGH 0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  336  				dmas = <&dma0
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  337  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  338  					 AT91_XDMAC_DT_PERID(26))>,
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  339  				       <&dma0
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  340  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  341  					 AT91_XDMAC_DT_PERID(27))>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  342  				dma-names = "tx", "rx";
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  343  				clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  344  				clock-names = "aes_clk";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  345  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  346  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  347  			spi0: spi@f8000000 {
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  348  				compatible = "atmel,at91rm9200-spi";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  349  				reg = <0xf8000000 0x100>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  350  				interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  351  				dmas = <&dma0
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  352  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  353  					 AT91_XDMAC_DT_PERID(6))>,
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  354  				       <&dma0
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  355  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  356  					 AT91_XDMAC_DT_PERID(7))>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  357  				dma-names = "tx", "rx";
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  358  				clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  359  				clock-names = "spi_clk";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  360  				atmel,fifo-size = <16>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  361  				#address-cells = <1>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  362  				#size-cells = <0>;
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  363  				status = "disabled";
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  364  			};
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18  365  
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  366  			ssc0: ssc@f8004000 {
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  367  				compatible = "atmel,at91sam9g45-ssc";
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  368  				reg = <0xf8004000 0x4000>;
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  369  				interrupts = <43 IRQ_TYPE_LEVEL_HIGH 4>;
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  370  				dmas = <&dma0
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  371  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  372  					AT91_XDMAC_DT_PERID(21))>,
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  373  				       <&dma0
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  374  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  375  					AT91_XDMAC_DT_PERID(22))>;
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  376  				dma-names = "tx", "rx";
b6055787684976 arch/arm/boot/dts/sama5d2.dtsi Alexandre Belloni 2018-06-12  377  				clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  378  				clock-names = "pclk";
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  379  				status = "disabled";
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  380  			};
6c1652af61f0a2 arch/arm/boot/dts/sama5d2.dtsi Alex              2016-12-04  381  
e30cf8d3221ab6 arch/arm/boot/dts/sama5d2.dtsi Ludovic Desroches 2015-06-18 @382  			macb0: ethernet@f8008000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
