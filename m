Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF126FBF
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 23:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206274; cv=none; b=DcQYNzCfVc9Ek4BnHUx+qfOyIpKHN0LWr3o6aoq0+u5GyiJEUAThYY9HfFLMqOOibf6gcIZ2OQkLlCl9x04pQwvB777EOAG1+ioJIVT4h04lvuNQP1MMHy7fhOCNTun5pe9iL31KjPFeAqNBMxrJNXrZ3qjgpyb9V05c0pBp9fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206274; c=relaxed/simple;
	bh=AV4j/QHz8aYdbQWkmCD0RybMQOTQheZB2YDfTbgdYUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKHAXavxzsN6HyUI2Id2qzKfuglJB16ND2tNDhTKNfaB+6jB9oapMZv+Kyby3eK9+mu3aGwLQZAt0oJxLg04U0CvGkI3Xf7ZrWRA5EHKhC7vkJdubU8gqGJOFl/0BxAG2IxrVtUcO2wbGdyG9IU4OuHxMpByRH7TPgkqE4E+c6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZEGokVe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZEGokVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743206272; x=1774742272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AV4j/QHz8aYdbQWkmCD0RybMQOTQheZB2YDfTbgdYUM=;
  b=RZEGokVeKYr65YCoa6hDY2XrVvCu4sHBPYftc9Ye7UYkSKEUwjCacQhA
   MA5tgbPTGEdFyJ3yhRvkTZ75gjv+bNlVh96zMw1AYqJLnFTQxZhc2V/lz
   oRVNvjzOk8QjL373rfExsRZqR4wfsvUhbntT/wZDK1WimXRtPC32W5dBZ
   3mwrzmfRako5dihoq0b8GfBqsTRI+1W6p3QfgA8/L/gjPo8gq90YRKwhI
   S6gvg/WMvjHAeM6Yt7P0xUMJivUAX6WhlJ3s9B9BYv/cG3VOTOZCPIMfb
   kd7GmBQb1M3i6hx7NcVSkHmZMD9scQqx0o2nb1e3R8a3e2Gp4qi5rPyiH
   w==;
X-CSE-ConnectionGUID: nN0thkheRsu47jzdPlRd5Q==
X-CSE-MsgGUID: TyPXxy+JQtW3jXuG5IjE8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48452053"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="48452053"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 16:57:51 -0700
X-CSE-ConnectionGUID: iujZ4ZqETEmq71QAc6uF1w==
X-CSE-MsgGUID: DWHNizBWQZKrvlxXxOAaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="148756753"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Mar 2025 16:57:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJa7-0007mQ-2G;
	Fri, 28 Mar 2025 23:57:47 +0000
Date: Sat, 29 Mar 2025 07:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/bcmbca-peripherals-arm 9/14]
 arch/arm/boot/dts/broadcom/bcm63148.dtsi:103.19-110.5: Warning
 (simple_bus_reg): /bus@ff800000/gpio@100: simple-bus unit address format
 error, expected "500"
Message-ID: <202503290728.WXEc2GQQ-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/bcmbca-peripherals-arm
head:   80a24d5a52c1453c91f4424a44bfd717bdb76211
commit: c09876b718f5489124c9fc621364e4518ead4287 [9/14] ARM: dts: bcm63148: Add BCMBCA peripherals
:::::: branch date: 25 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-052-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290728.WXEc2GQQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290728.WXEc2GQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503290728.WXEc2GQQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm63148.dtsi:103.19-110.5: Warning (simple_bus_reg): /bus@ff800000/gpio@100: simple-bus unit address format error, expected "500"

vim +/500 +103 arch/arm/boot/dts/broadcom/bcm63148.dtsi

03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09    8  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09    9  / {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   10  	compatible = "brcm,bcm63148", "brcm,bcmbca";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   11  	#address-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   12  	#size-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   13  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   14  	interrupt-parent = <&gic>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   15  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   16  	cpus {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   17  		#address-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   18  		#size-cells = <0>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   19  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   20  		B15_0: cpu@0 {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   21  			device_type = "cpu";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   22  			compatible = "brcm,brahma-b15";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   23  			reg = <0x0>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   24  			next-level-cache = <&L2_0>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   25  			enable-method = "psci";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   26  		};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   27  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   28  		B15_1: cpu@1 {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   29  			device_type = "cpu";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   30  			compatible = "brcm,brahma-b15";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   31  			reg = <0x1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   32  			next-level-cache = <&L2_0>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   33  			enable-method = "psci";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   34  		};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   35  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   36  		L2_0: l2-cache0 {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   37  			compatible = "cache";
b23024676a2f13 arch/arm/boot/dts/bcm63148.dtsi          Pierre Gondois      2022-11-22   38  			cache-level = <2>;
0db4bb045b038e arch/arm/boot/dts/bcm63148.dtsi          Krzysztof Kozlowski 2023-04-23   39  			cache-unified;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   40  		};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   41  	};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   42  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   43  	timer {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   44  		compatible = "arm,armv7-timer";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   45  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   46  			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   47  			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   48  			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   49  	};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   50  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   51  	pmu: pmu {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   52  		compatible = "arm,cortex-a15-pmu";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   53  		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   54  			<GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   55  		interrupt-affinity = <&B15_0>, <&B15_1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   56  	};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   57  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   58  	clocks: clocks {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   59  		periph_clk: periph-clk {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   60  			compatible = "fixed-clock";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   61  			#clock-cells = <0>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   62  			clock-frequency = <50000000>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   63  		};
7858dded8c1e98 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2023-02-06   64  
7858dded8c1e98 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2023-02-06   65  		hsspi_pll: hsspi-pll {
7858dded8c1e98 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2023-02-06   66  			compatible = "fixed-clock";
7858dded8c1e98 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2023-02-06   67  			#clock-cells = <0>;
7858dded8c1e98 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2023-02-06   68  			clock-frequency = <400000000>;
7858dded8c1e98 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2023-02-06   69  		};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   70  	};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   71  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   72  	psci {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   73  		compatible = "arm,psci-0.2";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   74  		method = "smc";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   75  	};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   76  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   77  	axi@80030000 {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   78  		compatible = "simple-bus";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   79  		#address-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   80  		#size-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   81  		ranges = <0 0x80030000 0x8000>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   82  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   83  		gic: interrupt-controller@1000 {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   84  			compatible = "arm,cortex-a15-gic";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   85  			#interrupt-cells = <3>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   86  			interrupt-controller;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   87  			reg = <0x1000 0x1000>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   88  				<0x2000 0x2000>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   89  				<0x4000 0x2000>,
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   90  				<0x6000 0x2000>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   91  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) |
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   92  					IRQ_TYPE_LEVEL_HIGH)>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   93  		};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   94  	};
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   95  
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   96  	bus@ff800000 {
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   97  		compatible = "simple-bus";
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   98  		#address-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09   99  		#size-cells = <1>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09  100  		ranges = <0 0xfffe8000 0x8000>;
03b7500f5c3485 arch/arm/boot/dts/bcm63148.dtsi          William Zhang       2022-06-09  101  
c09876b718f548 arch/arm/boot/dts/broadcom/bcm63148.dtsi Linus Walleij       2025-03-27  102  		/* GPIOs 0 .. 31 */
c09876b718f548 arch/arm/boot/dts/broadcom/bcm63148.dtsi Linus Walleij       2025-03-27 @103  		gpio0: gpio@100 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
