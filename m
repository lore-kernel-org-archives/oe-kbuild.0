Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB608C1F
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272100; cv=none; b=h4MesAv6EyuBXyzjA/jldL8YjI7/beu3WgW4Uot8mD0m+5sXm7XeDufnR+tYXsvay76nynk45bdL3EG7mbhngE9RtCPavWs505PWW+s5rkxwB+8paxe5sENMUbeF0dhBHFBNl5nQo3Yru2NLylMdZbiDSjIaPf4efrZQ14LViRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272100; c=relaxed/simple;
	bh=DkayIrMkQRc6nn3PfimqIS0n8gWBlC8Vj9SUGUfU+7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eif4pvYKn0bIbD1zgUzFGsucFUC8SQQ9zgXAOmJ9B+Z3/O05a9S7OylSTMl7YB6vhCjdG0PgmqJTi+dKiApgnR5CZ0d4jwMjYZ+egsqEB8Ao/DxXRMRswld1Uw7aZx//rlV0uSbEoTkaFsqw+iQEr96V3GQXJvWWfxc/VHk2Peg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQ69h655; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQ69h655"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747272098; x=1778808098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkayIrMkQRc6nn3PfimqIS0n8gWBlC8Vj9SUGUfU+7g=;
  b=YQ69h655TFLDXpKVVp5NzYItdaK4FyRxwajSW2ZXNHUKlLEDgWDKqa7t
   iDFSYMRsFDPpH6w9ggGFfaYtpvQnd4Gk85Dy0nhD01E24OiGzr9hZpMeF
   NDQbQI2JdOnTDCYJ3WRsM1qhZlEhNDHOmjbkoR8eW4ZEi8ldwWtUM9uqx
   gaySEq6jysGIxn+O2prGV3AReS38aOGF0kme+NkQxWbd1cr0uXjHvKyOT
   AQndOEuBwMlk2F5UFBycNgbveRpF7S0E6OD7heJmy/H+1v5yFHePqB7mX
   oKK/UXjXSV7Cb5XCfzqa5HWj+lxqhFXQP7WM1LXdlmOC2G1s/R9+WygGf
   w==;
X-CSE-ConnectionGUID: Kk5VS7bWTEmpvYfJ63bcTg==
X-CSE-MsgGUID: VhFk040gQtaNbchTISszlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52997089"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52997089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 18:21:37 -0700
X-CSE-ConnectionGUID: Rb00dvY3SMysSQR4EGQGVw==
X-CSE-MsgGUID: Vh9mUyXzT+qloSuxseIJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138716119"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 18:21:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNHy-000Hkx-1H;
	Thu, 15 May 2025 01:21:34 +0000
Date: Thu, 15 May 2025 09:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] dts: arm64: amlogic: add S7D pinctrl node
Message-ID: <202505150919.86zbc6FJ-lkp@intel.com>
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
In-Reply-To: <20250514-s6-s7-pinctrl-v1-7-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-7-39d368cad250@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-amlogic@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aa94665adc28f3fdc3de2979ac1e98bae961d6ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctl-amlogic-pinctrl-a4-Add-compatible-string-for-S7/20250514-150438
base:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
patch link:    https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-7-39d368cad250%40amlogic.com
patch subject: [PATCH 7/8] dts: arm64: amlogic: add S7D pinctrl node
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150919.86zbc6FJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150919.86zbc6FJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505150919.86zbc6FJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi:99.29-186.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi:99.29-186.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl: simple-bus unit address format error, expected "4000"

vim +99 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi

1a30661c20dee5 Xianwei Zhao 2025-03-17  10  
1a30661c20dee5 Xianwei Zhao 2025-03-17  11  / {
1a30661c20dee5 Xianwei Zhao 2025-03-17  12  	cpus {
1a30661c20dee5 Xianwei Zhao 2025-03-17  13  		#address-cells = <2>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  14  		#size-cells = <0>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  15  
1a30661c20dee5 Xianwei Zhao 2025-03-17  16  		cpu0: cpu@0 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  17  			device_type = "cpu";
1a30661c20dee5 Xianwei Zhao 2025-03-17  18  			compatible = "arm,cortex-a55";
1a30661c20dee5 Xianwei Zhao 2025-03-17  19  			reg = <0x0 0x0>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  20  			enable-method = "psci";
1a30661c20dee5 Xianwei Zhao 2025-03-17  21  		};
1a30661c20dee5 Xianwei Zhao 2025-03-17  22  
1a30661c20dee5 Xianwei Zhao 2025-03-17  23  		cpu1: cpu@100 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  24  			device_type = "cpu";
1a30661c20dee5 Xianwei Zhao 2025-03-17  25  			compatible = "arm,cortex-a55";
1a30661c20dee5 Xianwei Zhao 2025-03-17  26  			reg = <0x0 0x100>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  27  			enable-method = "psci";
1a30661c20dee5 Xianwei Zhao 2025-03-17  28  		};
1a30661c20dee5 Xianwei Zhao 2025-03-17  29  
1a30661c20dee5 Xianwei Zhao 2025-03-17  30  		cpu2: cpu@200 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  31  			device_type = "cpu";
1a30661c20dee5 Xianwei Zhao 2025-03-17  32  			compatible = "arm,cortex-a55";
1a30661c20dee5 Xianwei Zhao 2025-03-17  33  			reg = <0x0 0x200>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  34  			enable-method = "psci";
1a30661c20dee5 Xianwei Zhao 2025-03-17  35  		};
1a30661c20dee5 Xianwei Zhao 2025-03-17  36  
1a30661c20dee5 Xianwei Zhao 2025-03-17  37  		cpu3: cpu@300 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  38  			device_type = "cpu";
1a30661c20dee5 Xianwei Zhao 2025-03-17  39  			compatible = "arm,cortex-a55";
1a30661c20dee5 Xianwei Zhao 2025-03-17  40  			reg = <0x0 0x300>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  41  			enable-method = "psci";
1a30661c20dee5 Xianwei Zhao 2025-03-17  42  		};
1a30661c20dee5 Xianwei Zhao 2025-03-17  43  
1a30661c20dee5 Xianwei Zhao 2025-03-17  44  	};
1a30661c20dee5 Xianwei Zhao 2025-03-17  45  
1a30661c20dee5 Xianwei Zhao 2025-03-17  46  	timer {
1a30661c20dee5 Xianwei Zhao 2025-03-17  47  		compatible = "arm,armv8-timer";
1a30661c20dee5 Xianwei Zhao 2025-03-17  48  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
1a30661c20dee5 Xianwei Zhao 2025-03-17  49  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
1a30661c20dee5 Xianwei Zhao 2025-03-17  50  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
1a30661c20dee5 Xianwei Zhao 2025-03-17  51  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  52  	};
1a30661c20dee5 Xianwei Zhao 2025-03-17  53  
1a30661c20dee5 Xianwei Zhao 2025-03-17  54  	psci {
1a30661c20dee5 Xianwei Zhao 2025-03-17  55  		compatible = "arm,psci-1.0";
1a30661c20dee5 Xianwei Zhao 2025-03-17  56  		method = "smc";
1a30661c20dee5 Xianwei Zhao 2025-03-17  57  	};
1a30661c20dee5 Xianwei Zhao 2025-03-17  58  
1a30661c20dee5 Xianwei Zhao 2025-03-17  59  	xtal: xtal-clk {
1a30661c20dee5 Xianwei Zhao 2025-03-17  60  		compatible = "fixed-clock";
1a30661c20dee5 Xianwei Zhao 2025-03-17  61  		clock-frequency = <24000000>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  62  		clock-output-names = "xtal";
1a30661c20dee5 Xianwei Zhao 2025-03-17  63  		#clock-cells = <0>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  64  	};
1a30661c20dee5 Xianwei Zhao 2025-03-17  65  
1a30661c20dee5 Xianwei Zhao 2025-03-17  66  	soc {
1a30661c20dee5 Xianwei Zhao 2025-03-17  67  		compatible = "simple-bus";
1a30661c20dee5 Xianwei Zhao 2025-03-17  68  		#address-cells = <2>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  69  		#size-cells = <2>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  70  		ranges;
1a30661c20dee5 Xianwei Zhao 2025-03-17  71  
1a30661c20dee5 Xianwei Zhao 2025-03-17  72  		gic: interrupt-controller@fff01000 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  73  			compatible = "arm,gic-400";
1a30661c20dee5 Xianwei Zhao 2025-03-17  74  			#interrupt-cells = <3>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  75  			#address-cells = <0>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  76  			interrupt-controller;
1a30661c20dee5 Xianwei Zhao 2025-03-17  77  			reg = <0x0 0xfff01000 0 0x1000>,
1a30661c20dee5 Xianwei Zhao 2025-03-17  78  			      <0x0 0xfff02000 0 0x0100>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  79  			interrupts = <GIC_PPI 9 0xf04>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  80  		};
1a30661c20dee5 Xianwei Zhao 2025-03-17  81  
1a30661c20dee5 Xianwei Zhao 2025-03-17  82  		apb: bus@fe000000 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  83  			compatible = "simple-bus";
1a30661c20dee5 Xianwei Zhao 2025-03-17  84  			reg = <0x0 0xfe000000 0x0 0x480000>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  85  			#address-cells = <2>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  86  			#size-cells = <2>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  87  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  88  
1a30661c20dee5 Xianwei Zhao 2025-03-17  89  			uart_b: serial@7a000 {
1a30661c20dee5 Xianwei Zhao 2025-03-17  90  				compatible = "amlogic,s7d-uart",
1a30661c20dee5 Xianwei Zhao 2025-03-17  91  					     "amlogic,meson-s4-uart";
1a30661c20dee5 Xianwei Zhao 2025-03-17  92  				reg = <0x0 0x7a000 0x0 0x18>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  93  				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  94  				clocks = <&xtal>, <&xtal>, <&xtal>;
1a30661c20dee5 Xianwei Zhao 2025-03-17  95  				clock-names = "xtal", "pclk", "baud";
1a30661c20dee5 Xianwei Zhao 2025-03-17  96  				status = "disabled";
1a30661c20dee5 Xianwei Zhao 2025-03-17  97  			};
521d46024d85e9 Xianwei Zhao 2025-05-14  98  
521d46024d85e9 Xianwei Zhao 2025-05-14 @99  			periphs_pinctrl: pinctrl {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
