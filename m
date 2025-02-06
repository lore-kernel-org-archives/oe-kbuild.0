Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A7F2144A8
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Feb 2025 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738827828; cv=none; b=V9LAuWCSXnZIj/Avs1ut4JcYCVDQQRbnXbUkhiaF+FsB0JFqxBm+ol/RpOgZFpB++mABqbTrIffHl8WI6FD8rUoiv6Gwl3gY+86KOXWB+Vdt223P6kI3uHlxBvD1fistFkVGNIQ1MV9jMaKlkpVPNnLACHiyi0ArurK2rYwSykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738827828; c=relaxed/simple;
	bh=QglIZDx4Ib6TK5RG0K/NCFekwLEt/l9rjAS9yYoUJeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRH9879mA8qlElZ5b2oyr8i++vVqz6YVW/pbOV+m7MvtDTbBIVd1C3xxfB9cQgwFszFk9jtKykGO8iXVa6Eb029wJiWkXHL8OLAFVzy71nZ3P7bjoMajs2MIjunvJjoRtTUGJDbnnBDXiXkMqJPIsO2yyXDq8jRP2aeOdupnIhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSPmLThv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSPmLThv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738827826; x=1770363826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QglIZDx4Ib6TK5RG0K/NCFekwLEt/l9rjAS9yYoUJeI=;
  b=jSPmLThvLiE/wvfbcriuA8BZcO0OYmViOF1q9jG1rz+u+ObTBc4mndel
   lwQjDlbUZEubCIAO6NYZEK/ZoECKZPBUsM1lA3Z3bFs8NYgOaMRUp+g7d
   m7uXTd8xntMIs8EY3foiz3Yqx8YabPN9GyFhdzAWOsDWFjZ181U8wm9ef
   t5Sf5FiOGoShktN0ItwMpm2w5YmrWucMKa6VTorIMAAwar3PSIBnpjn9i
   6wYLQ8ItH5N2RUazgA74EL8WqfSra4CWJd88WTZ8WdomtDdPx/N+rJzcC
   j4almtdP1BSS4ZoU/Fnx1PwWGvfu+CSCuZK3JbqjWlXYgcbFfynkltr5F
   w==;
X-CSE-ConnectionGUID: sqFF4eMlRyiwGtrl4vszag==
X-CSE-MsgGUID: WCFvrN62SP6FWRcW59Qv0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61892560"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="61892560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 23:43:45 -0800
X-CSE-ConnectionGUID: P9wRR694S/etPwkncbsjEA==
X-CSE-MsgGUID: 5zgzLUcZRiy8ZGqfHZ15Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="110963248"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2025 23:43:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfwY1-000waI-0q;
	Thu, 06 Feb 2025 07:43:41 +0000
Date: Thu, 6 Feb 2025 15:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: microchip: Move address/size-cells properties
 to SoC dtsi
Message-ID: <202502061532.M7AqzgQ7-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250205 (https://download.01.org/0day-ci/archive/20250206/202502061532.M7AqzgQ7-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061532.M7AqzgQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502061532.M7AqzgQ7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91rm9200.dtsi:213.29-225.6: Warning (avoid_unnecessary_addr_size): /ahb/apb/ethernet@fffbc000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['atmel,at91rm9200ek', 'atmel,at91rm9200'] is too long
   	['atmel,at91rm9200ek', 'atmel,at91rm9200'] is too short
   	'atmel,at91rm9200' was expected
   	'atmel,at91rm9200ek' is not one of ['olimex,sam9-l9260']
   	'atmel,at91rm9200ek' is not one of ['overkiz,kizboxmini-base', 'overkiz,kizboxmini-mb', 'overkiz,kizboxmini-rd', 'overkiz,smartkiz', 'gardena,smart-gateway-at91sam']
   	'atmel,at91rm9200ek' is not one of ['atmel,at91sam9g15', 'atmel,at91sam9g25', 'atmel,at91sam9g35', 'atmel,at91sam9x25', 'atmel,at91sam9x35']
   	'overkiz,kizbox3-hs' was expected
   	'microchip,sama5d27-wlsom1' was expected

vim +213 arch/arm/boot/dts/microchip/at91rm9200.dtsi

fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   17  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   18  / {
abe60a3a7afb40 arch/arm/boot/dts/at91rm9200.dtsi           Rob Herring                      2019-01-09   19  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/at91rm9200.dtsi           Rob Herring                      2019-01-09   20  	#size-cells = <1>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   21  	model = "Atmel AT91RM9200 family SoC";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   22  	compatible = "atmel,at91rm9200";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   23  	interrupt-parent = <&aic>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   24  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   25  	aliases {
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   26  		serial0 = &dbgu;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   27  		serial1 = &usart0;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   28  		serial2 = &usart1;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   29  		serial3 = &usart2;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   30  		serial4 = &usart3;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   31  		gpio0 = &pioA;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   32  		gpio1 = &pioB;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   33  		gpio2 = &pioC;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   34  		gpio3 = &pioD;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   35  		tcb0 = &tcb0;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   36  		tcb1 = &tcb1;
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08   37  		i2c0 = &i2c0;
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04   38  		ssc0 = &ssc0;
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04   39  		ssc1 = &ssc1;
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04   40  		ssc2 = &ssc2;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   41  	};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   42  	cpus {
58f984941d4524 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   43  		#address-cells = <1>;
e757a6ee3e6fc1 arch/arm/boot/dts/at91rm9200.dtsi           Lorenzo Pieralisi                2013-04-18   44  		#size-cells = <0>;
e757a6ee3e6fc1 arch/arm/boot/dts/at91rm9200.dtsi           Lorenzo Pieralisi                2013-04-18   45  
58f984941d4524 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   46  		cpu@0 {
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   47  			compatible = "arm,arm920t";
e757a6ee3e6fc1 arch/arm/boot/dts/at91rm9200.dtsi           Lorenzo Pieralisi                2013-04-18   48  			device_type = "cpu";
58f984941d4524 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   49  			reg = <0>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   50  		};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   51  	};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   52  
996710a8956e43 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   53  	memory@20000000 {
abe60a3a7afb40 arch/arm/boot/dts/at91rm9200.dtsi           Rob Herring                      2019-01-09   54  		device_type = "memory";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   55  		reg = <0x20000000 0x04000000>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   56  	};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   57  
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   58  	clocks {
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   59  		slow_xtal: slow_xtal {
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   60  			compatible = "fixed-clock";
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   61  			#clock-cells = <0>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   62  			clock-frequency = <0>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   63  		};
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   64  
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   65  		main_xtal: main_xtal {
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   66  			compatible = "fixed-clock";
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   67  			#clock-cells = <0>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   68  			clock-frequency = <0>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   69  		};
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   70  	};
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03   71  
8dccafaa281aa1 arch/arm/boot/dts/at91rm9200.dtsi           Rob Herring                      2017-10-13   72  	sram: sram@200000 {
f04660e48b201b arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13   73  		compatible = "mmio-sram";
f04660e48b201b arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13   74  		reg = <0x00200000 0x4000>;
cd6228b782ae16 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   75  		#address-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   76  		#size-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-08-31   77  		ranges = <0 0x00200000 0x4000>;
f04660e48b201b arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13   78  	};
f04660e48b201b arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13   79  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   80  	ahb {
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   81  		compatible = "simple-bus";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   82  		#address-cells = <1>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   83  		#size-cells = <1>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   84  		ranges;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   85  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   86  		apb {
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   87  			compatible = "simple-bus";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   88  			#address-cells = <1>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   89  			#size-cells = <1>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   90  			ranges;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   91  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   92  			aic: interrupt-controller@fffff000 {
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   93  				#interrupt-cells = <3>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   94  				compatible = "atmel,at91rm9200-aic";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   95  				interrupt-controller;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   96  				reg = <0xfffff000 0x200>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   97  				atmel,external-irqs = <25 26 27 28 29 30 31>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   98  			};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28   99  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  100  			ramc0: ramc@ffffff00 {
0506b2986c0971 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-03-16  101  				compatible = "atmel,at91rm9200-sdramc", "syscon";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  102  				reg = <0xffffff00 0x100>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  103  			};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  104  
d08f92bdfb2dc4 arch/arm/boot/dts/at91rm9200.dtsi           Claudiu Beznea                   2023-05-17  105  			pmc: clock-controller@fffffc00 {
620f50332232b0 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-10-12  106  				compatible = "atmel,at91rm9200-pmc", "syscon";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  107  				reg = <0xfffffc00 0x100>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03  108  				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  109  				#clock-cells = <2>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  110  				clocks = <&slow_xtal>, <&main_xtal>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  111  				clock-names = "slow_xtal", "main_xtal";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  112  			};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  113  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  114  			st: timer@fffffd00 {
b595809b9842aa arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-03-12  115  				compatible = "atmel,at91rm9200-st", "syscon", "simple-mfd";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  116  				reg = <0xfffffd00 0x100>;
5e8b3bc392180c arch/arm/boot/dts/at91rm9200.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  117  				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
07e15f2155a6cc arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-07-29  118  				clocks = <&slow_xtal>;
b595809b9842aa arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-03-12  119  
b595809b9842aa arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-03-12  120  				watchdog {
b595809b9842aa arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-03-12  121  					compatible = "atmel,at91rm9200-wdt";
b595809b9842aa arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-03-12  122  				};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  123  			};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  124  
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  125  			rtc: rtc@fffffe00 {
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  126  				compatible = "atmel,at91rm9200-rtc";
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  127  				reg = <0xfffffe00 0x40>;
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  128  				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
07e15f2155a6cc arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-07-29  129  				clocks = <&slow_xtal>;
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  130  				status = "disabled";
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  131  			};
e39f00e5d28969 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-01-13  132  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  133  			tcb0: timer@fffa0000 {
d26e82974d3921 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2016-06-07  134  				compatible = "atmel,at91rm9200-tcb", "simple-mfd", "syscon";
d26e82974d3921 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2016-06-07  135  				#address-cells = <1>;
d26e82974d3921 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2016-06-07  136  				#size-cells = <0>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  137  				reg = <0xfffa0000 0x100>;
dc1890b95e5088 arch/arm/boot/dts/microchip/at91rm9200.dtsi Krzysztof Kozlowski              2023-07-30  138  				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 0>,
dc1890b95e5088 arch/arm/boot/dts/microchip/at91rm9200.dtsi Krzysztof Kozlowski              2023-07-30  139  					     <18 IRQ_TYPE_LEVEL_HIGH 0>,
dc1890b95e5088 arch/arm/boot/dts/microchip/at91rm9200.dtsi Krzysztof Kozlowski              2023-07-30  140  					     <19 IRQ_TYPE_LEVEL_HIGH 0>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  141  				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&pmc PMC_TYPE_PERIPHERAL 18>, <&pmc PMC_TYPE_PERIPHERAL 19>, <&slow_xtal>;
07e15f2155a6cc arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-07-29  142  				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  143  			};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  144  
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  145  			tcb1: timer@fffa4000 {
d26e82974d3921 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2016-06-07  146  				compatible = "atmel,at91rm9200-tcb", "simple-mfd", "syscon";
d26e82974d3921 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2016-06-07  147  				#address-cells = <1>;
d26e82974d3921 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2016-06-07  148  				#size-cells = <0>;
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  149  				reg = <0xfffa4000 0x100>;
dc1890b95e5088 arch/arm/boot/dts/microchip/at91rm9200.dtsi Krzysztof Kozlowski              2023-07-30  150  				interrupts = <20 IRQ_TYPE_LEVEL_HIGH 0>,
dc1890b95e5088 arch/arm/boot/dts/microchip/at91rm9200.dtsi Krzysztof Kozlowski              2023-07-30  151  					     <21 IRQ_TYPE_LEVEL_HIGH 0>,
dc1890b95e5088 arch/arm/boot/dts/microchip/at91rm9200.dtsi Krzysztof Kozlowski              2023-07-30  152  					     <22 IRQ_TYPE_LEVEL_HIGH 0>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  153  				clocks = <&pmc PMC_TYPE_PERIPHERAL 20>, <&pmc PMC_TYPE_PERIPHERAL 21>, <&pmc PMC_TYPE_PERIPHERAL 22>, <&slow_xtal>;
07e15f2155a6cc arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2015-07-29  154  				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  155  			};
fe975cf6d0d18b arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-10-28  156  
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  157  			i2c0: i2c@fffb8000 {
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  158  				compatible = "atmel,at91rm9200-i2c";
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  159  				reg = <0xfffb8000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/at91rm9200.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  160  				interrupts = <12 IRQ_TYPE_LEVEL_HIGH 6>;
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  161  				pinctrl-names = "default";
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  162  				pinctrl-0 = <&pinctrl_twi>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  163  				clocks = <&pmc PMC_TYPE_PERIPHERAL 12>;
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  164  				#address-cells = <1>;
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  165  				#size-cells = <0>;
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  166  				status = "disabled";
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  167  			};
2d25210ddd116e arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2013-02-08  168  
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  169  			mmc0: mmc@fffb4000 {
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  170  				compatible = "atmel,hsmci";
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  171  				reg = <0xfffb4000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/at91rm9200.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  172  				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 0>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  173  				clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03  174  				clock-names = "mci_clk";
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  175  				#address-cells = <1>;
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  176  				#size-cells = <0>;
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  177  				status = "disabled";
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  178  			};
4e4c963ea95866 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  179  
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  180  			ssc0: ssc@fffd0000 {
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  181  				compatible = "atmel,at91rm9200-ssc";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  182  				reg = <0xfffd0000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/at91rm9200.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  183  				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 5>;
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  184  				pinctrl-names = "default";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  185  				pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  186  				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03  187  				clock-names = "pclk";
0db090d5428e53 arch/arm/boot/dts/at91rm9200.dtsi           Michael Opdenacker               2015-10-13  188  				status = "disabled";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  189  			};
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  190  
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  191  			ssc1: ssc@fffd4000 {
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  192  				compatible = "atmel,at91rm9200-ssc";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  193  				reg = <0xfffd4000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/at91rm9200.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  194  				interrupts = <15 IRQ_TYPE_LEVEL_HIGH 5>;
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  195  				pinctrl-names = "default";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  196  				pinctrl-0 = <&pinctrl_ssc1_tx &pinctrl_ssc1_rx>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  197  				clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03  198  				clock-names = "pclk";
0db090d5428e53 arch/arm/boot/dts/at91rm9200.dtsi           Michael Opdenacker               2015-10-13  199  				status = "disabled";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  200  			};
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  201  
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  202  			ssc2: ssc@fffd8000 {
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  203  				compatible = "atmel,at91rm9200-ssc";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  204  				reg = <0xfffd8000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/at91rm9200.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  205  				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 5>;
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  206  				pinctrl-names = "default";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  207  				pinctrl-0 = <&pinctrl_ssc2_tx &pinctrl_ssc2_rx>;
0e0e528d8260f1 arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2020-03-24  208  				clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
68580013adeb3f arch/arm/boot/dts/at91rm9200.dtsi           Alexandre Belloni                2014-05-03  209  				clock-names = "pclk";
0db090d5428e53 arch/arm/boot/dts/at91rm9200.dtsi           Michael Opdenacker               2015-10-13  210  				status = "disabled";
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  211  			};
883a07f69cc7c6 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04  212  
ce3b2630fd4737 arch/arm/boot/dts/at91rm9200.dtsi           Joachim Eastwood                 2012-12-04 @213  			macb0: ethernet@fffbc000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
