Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60621AD9EB
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725865607; cv=none; b=InfWoTto6CUAjCcQOx824cH4yt+G4ZXcfgsrKoDj04RvYcLWC39gbpu0TGkfr65L4qV49BnfSbgSCSm94B2lMa5upfalQvfaTsD0BK7PseK+OU55wUKPAUmic7h2+6dwj+Pf5NAwB84P9L0Yaxf+zZ0kZGoG5+wen2idg2YJlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725865607; c=relaxed/simple;
	bh=XvvyEX67KkPKJ3netqR7uyBXAtdNkPmSJmxIbhWTW6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sveg3L8izOcE2R+GZNf3Wu2WQrF0ewNCiOaq4n1hkKR5WInyYwkA+3d7FH64kIDoqKR2QWzI0Y5U52Kd2gmXZVzzM6gWwKK7S+xTrUSw6JcbV2KpZHrEV/WAPGHJjyg7GuQFI3dijOiPf2SH0IEY0k7zjVCoTLgy5cbWvx5v8Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moVNwIQv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moVNwIQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725865604; x=1757401604;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XvvyEX67KkPKJ3netqR7uyBXAtdNkPmSJmxIbhWTW6c=;
  b=moVNwIQv51b3NoMtCTK/5wM023zaPP+hza+xoKDy0rQ7w0MCP5/L2pam
   a4Q7BCW1Gki5OMjnQjk+nBxpAC2KLHO6dURlql3HI9kk0Vjl+jao4LYFX
   BJmVOtQJSbv5Lq2ALfUPLDtp6UfBX0MJdn2UnK8Nw8mj6doWhqKewdxXD
   wFBn23aaFTHam7emzSepPX3/VrJSFGPPty3hXJYEd9uGXRliu0Zb45PYE
   e+rC7s2MngjaE3FnqW40W+Ui7g+WKDBBPJ4rKbbuN9ufkToSEmiSOMXqs
   VYdaTF5+Rg+1cMDfVeKrG2xC4qK3ZLgelyO6Yub4pJED58QGp9Fn+i1+n
   g==;
X-CSE-ConnectionGUID: YggWa3xRQmO6vBaQetfjAw==
X-CSE-MsgGUID: sHO++78XR0e/QviTe7K96g==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27464536"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="27464536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 00:06:43 -0700
X-CSE-ConnectionGUID: tZb4CVvVR8KufOV8afYK2A==
X-CSE-MsgGUID: yOhCyJrlS4e7iFIX0Zjdrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="71369958"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Sep 2024 00:06:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snYTv-000ER0-1D;
	Mon, 09 Sep 2024 07:06:39 +0000
Date: Mon, 9 Sep 2024 15:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: Add Amlogic C3 PWM
Message-ID: <202409091410.wIJOEK54-lkp@intel.com>
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
In-Reply-To: <20240906-c3-pwm-v1-2-acaf17fad247@amlogic.com>
References: <20240906-c3-pwm-v1-2-acaf17fad247@amlogic.com>
TO: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-amlogic@lists.infradead.org
CC: Kelvin Zhang <kelvin.zhang@amlogic.com>

Hi Kelvin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ad40aff1edffeccc412cde93894196dca7bc739e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kelvin-Zhang-via-B4-Relay/dt-bindings-pwm-amlogic-Document-C3-PWM/20240906-205219
base:   ad40aff1edffeccc412cde93894196dca7bc739e
patch link:    https://lore.kernel.org/r/20240906-c3-pwm-v1-2-acaf17fad247%40amlogic.com
patch subject: [PATCH 2/2] arm64: dts: amlogic: Add Amlogic C3 PWM
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240909/202409091410.wIJOEK54-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091410.wIJOEK54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409091410.wIJOEK54-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:787.22-795.6: Warning (simple_bus_reg): /soc/bus@fe000000/pwm@54000: simple-bus unit address format error, expected "d2f0"

vim +/d2f0 +787 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi

02310be6f08007 Xianwei Zhao   2023-05-15   15  
02310be6f08007 Xianwei Zhao   2023-05-15   16  / {
02310be6f08007 Xianwei Zhao   2023-05-15   17  	cpus {
02310be6f08007 Xianwei Zhao   2023-05-15   18  		#address-cells = <2>;
02310be6f08007 Xianwei Zhao   2023-05-15   19  		#size-cells = <0>;
02310be6f08007 Xianwei Zhao   2023-05-15   20  
02310be6f08007 Xianwei Zhao   2023-05-15   21  		cpu0: cpu@0 {
02310be6f08007 Xianwei Zhao   2023-05-15   22  			device_type = "cpu";
02310be6f08007 Xianwei Zhao   2023-05-15   23  			compatible = "arm,cortex-a35";
02310be6f08007 Xianwei Zhao   2023-05-15   24  			reg = <0x0 0x0>;
02310be6f08007 Xianwei Zhao   2023-05-15   25  			enable-method = "psci";
02310be6f08007 Xianwei Zhao   2023-05-15   26  		};
02310be6f08007 Xianwei Zhao   2023-05-15   27  
02310be6f08007 Xianwei Zhao   2023-05-15   28  		cpu1: cpu@1 {
02310be6f08007 Xianwei Zhao   2023-05-15   29  			device_type = "cpu";
02310be6f08007 Xianwei Zhao   2023-05-15   30  			compatible = "arm,cortex-a35";
02310be6f08007 Xianwei Zhao   2023-05-15   31  			reg = <0x0 0x1>;
02310be6f08007 Xianwei Zhao   2023-05-15   32  			enable-method = "psci";
02310be6f08007 Xianwei Zhao   2023-05-15   33  		};
02310be6f08007 Xianwei Zhao   2023-05-15   34  	};
02310be6f08007 Xianwei Zhao   2023-05-15   35  
02310be6f08007 Xianwei Zhao   2023-05-15   36  	timer {
02310be6f08007 Xianwei Zhao   2023-05-15   37  		compatible = "arm,armv8-timer";
02310be6f08007 Xianwei Zhao   2023-05-15   38  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao   2023-05-15   39  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao   2023-05-15   40  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao   2023-05-15   41  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
02310be6f08007 Xianwei Zhao   2023-05-15   42  	};
02310be6f08007 Xianwei Zhao   2023-05-15   43  
02310be6f08007 Xianwei Zhao   2023-05-15   44  	psci {
02310be6f08007 Xianwei Zhao   2023-05-15   45  		compatible = "arm,psci-1.0";
02310be6f08007 Xianwei Zhao   2023-05-15   46  		method = "smc";
02310be6f08007 Xianwei Zhao   2023-05-15   47  	};
02310be6f08007 Xianwei Zhao   2023-05-15   48  
02310be6f08007 Xianwei Zhao   2023-05-15   49  	xtal: xtal-clk {
02310be6f08007 Xianwei Zhao   2023-05-15   50  		compatible = "fixed-clock";
02310be6f08007 Xianwei Zhao   2023-05-15   51  		clock-frequency = <24000000>;
02310be6f08007 Xianwei Zhao   2023-05-15   52  		clock-output-names = "xtal";
02310be6f08007 Xianwei Zhao   2023-05-15   53  		#clock-cells = <0>;
02310be6f08007 Xianwei Zhao   2023-05-15   54  	};
02310be6f08007 Xianwei Zhao   2023-05-15   55  
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   56  	sm: secure-monitor {
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   57  		compatible = "amlogic,meson-gxbb-sm";
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   58  
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   59  		pwrc: power-controller {
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   60  			compatible = "amlogic,c3-pwrc";
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   61  			#power-domain-cells = <1>;
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   62  		};
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   63  	};
22a9b2a488c3f0 Xianwei Zhao   2023-07-07   64  
ca55a30d27cb37 Xianwei Zhao   2024-09-02   65  	sram@7f50e00 {
520b792e83171e Xianwei Zhao   2024-08-30   66  		compatible = "mmio-sram";
520b792e83171e Xianwei Zhao   2024-08-30   67  		reg = <0x0 0x07f50e00 0x0 0x100>;
520b792e83171e Xianwei Zhao   2024-08-30   68  		#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30   69  		#size-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30   70  		ranges = <0 0x0 0x07f50e00 0x100>;
520b792e83171e Xianwei Zhao   2024-08-30   71  
520b792e83171e Xianwei Zhao   2024-08-30   72  		scmi_shmem: sram@0 {
520b792e83171e Xianwei Zhao   2024-08-30   73  			compatible = "arm,scmi-shmem";
520b792e83171e Xianwei Zhao   2024-08-30   74  			reg = <0x0 0x100>;
520b792e83171e Xianwei Zhao   2024-08-30   75  		};
520b792e83171e Xianwei Zhao   2024-08-30   76  	};
520b792e83171e Xianwei Zhao   2024-08-30   77  
520b792e83171e Xianwei Zhao   2024-08-30   78  	firmware {
520b792e83171e Xianwei Zhao   2024-08-30   79  		scmi: scmi {
520b792e83171e Xianwei Zhao   2024-08-30   80  			compatible = "arm,scmi-smc";
520b792e83171e Xianwei Zhao   2024-08-30   81  			arm,smc-id = <0x820000C1>;
520b792e83171e Xianwei Zhao   2024-08-30   82  			shmem = <&scmi_shmem>;
520b792e83171e Xianwei Zhao   2024-08-30   83  			#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30   84  			#size-cells = <0>;
520b792e83171e Xianwei Zhao   2024-08-30   85  
520b792e83171e Xianwei Zhao   2024-08-30   86  			scmi_clk: protocol@14 {
520b792e83171e Xianwei Zhao   2024-08-30   87  				reg = <0x14>;
520b792e83171e Xianwei Zhao   2024-08-30   88  				#clock-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30   89  			};
520b792e83171e Xianwei Zhao   2024-08-30   90  		};
520b792e83171e Xianwei Zhao   2024-08-30   91  	};
520b792e83171e Xianwei Zhao   2024-08-30   92  
02310be6f08007 Xianwei Zhao   2023-05-15   93  	soc {
02310be6f08007 Xianwei Zhao   2023-05-15   94  		compatible = "simple-bus";
02310be6f08007 Xianwei Zhao   2023-05-15   95  		#address-cells = <2>;
02310be6f08007 Xianwei Zhao   2023-05-15   96  		#size-cells = <2>;
02310be6f08007 Xianwei Zhao   2023-05-15   97  		ranges;
02310be6f08007 Xianwei Zhao   2023-05-15   98  
02310be6f08007 Xianwei Zhao   2023-05-15   99  		gic: interrupt-controller@fff01000 {
02310be6f08007 Xianwei Zhao   2023-05-15  100  			compatible = "arm,gic-400";
02310be6f08007 Xianwei Zhao   2023-05-15  101  			#interrupt-cells = <3>;
02310be6f08007 Xianwei Zhao   2023-05-15  102  			#address-cells = <0>;
02310be6f08007 Xianwei Zhao   2023-05-15  103  			interrupt-controller;
02310be6f08007 Xianwei Zhao   2023-05-15  104  			reg = <0x0 0xfff01000 0 0x1000>,
02310be6f08007 Xianwei Zhao   2023-05-15  105  			      <0x0 0xfff02000 0 0x2000>,
02310be6f08007 Xianwei Zhao   2023-05-15  106  			      <0x0 0xfff04000 0 0x2000>,
02310be6f08007 Xianwei Zhao   2023-05-15  107  			      <0x0 0xfff06000 0 0x2000>;
02310be6f08007 Xianwei Zhao   2023-05-15  108  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
02310be6f08007 Xianwei Zhao   2023-05-15  109  		};
02310be6f08007 Xianwei Zhao   2023-05-15  110  
02310be6f08007 Xianwei Zhao   2023-05-15  111  		apb4: bus@fe000000 {
02310be6f08007 Xianwei Zhao   2023-05-15  112  			compatible = "simple-bus";
02310be6f08007 Xianwei Zhao   2023-05-15  113  			reg = <0x0 0xfe000000 0x0 0x480000>;
02310be6f08007 Xianwei Zhao   2023-05-15  114  			#address-cells = <2>;
02310be6f08007 Xianwei Zhao   2023-05-15  115  			#size-cells = <2>;
02310be6f08007 Xianwei Zhao   2023-05-15  116  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
02310be6f08007 Xianwei Zhao   2023-05-15  117  
520b792e83171e Xianwei Zhao   2024-08-30  118  			clkc_periphs: clock-controller@0 {
520b792e83171e Xianwei Zhao   2024-08-30  119  				compatible = "amlogic,c3-peripherals-clkc";
520b792e83171e Xianwei Zhao   2024-08-30  120  				reg = <0x0 0x0 0x0 0x49c>;
520b792e83171e Xianwei Zhao   2024-08-30  121  				#clock-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  122  				clocks = <&xtal>,
520b792e83171e Xianwei Zhao   2024-08-30  123  					 <&scmi_clk CLKID_OSC>,
520b792e83171e Xianwei Zhao   2024-08-30  124  					 <&scmi_clk CLKID_FIXED_PLL_OSC>,
520b792e83171e Xianwei Zhao   2024-08-30  125  					 <&clkc_pll CLKID_FCLK_DIV2>,
520b792e83171e Xianwei Zhao   2024-08-30  126  					 <&clkc_pll CLKID_FCLK_DIV2P5>,
520b792e83171e Xianwei Zhao   2024-08-30  127  					 <&clkc_pll CLKID_FCLK_DIV3>,
520b792e83171e Xianwei Zhao   2024-08-30  128  					 <&clkc_pll CLKID_FCLK_DIV4>,
520b792e83171e Xianwei Zhao   2024-08-30  129  					 <&clkc_pll CLKID_FCLK_DIV5>,
520b792e83171e Xianwei Zhao   2024-08-30  130  					 <&clkc_pll CLKID_FCLK_DIV7>,
520b792e83171e Xianwei Zhao   2024-08-30  131  					 <&clkc_pll CLKID_GP0_PLL>,
520b792e83171e Xianwei Zhao   2024-08-30  132  					 <&scmi_clk CLKID_GP1_PLL_OSC>,
520b792e83171e Xianwei Zhao   2024-08-30  133  					 <&clkc_pll CLKID_HIFI_PLL>,
520b792e83171e Xianwei Zhao   2024-08-30  134  					 <&scmi_clk CLKID_SYS_CLK>,
520b792e83171e Xianwei Zhao   2024-08-30  135  					 <&scmi_clk CLKID_AXI_CLK>,
520b792e83171e Xianwei Zhao   2024-08-30  136  					 <&scmi_clk CLKID_SYS_PLL_DIV16>,
520b792e83171e Xianwei Zhao   2024-08-30  137  					 <&scmi_clk CLKID_CPU_CLK_DIV16>;
520b792e83171e Xianwei Zhao   2024-08-30  138  				clock-names = "xtal_24m",
520b792e83171e Xianwei Zhao   2024-08-30  139  					      "oscin",
520b792e83171e Xianwei Zhao   2024-08-30  140  					      "fix",
520b792e83171e Xianwei Zhao   2024-08-30  141  					      "fdiv2",
520b792e83171e Xianwei Zhao   2024-08-30  142  					      "fdiv2p5",
520b792e83171e Xianwei Zhao   2024-08-30  143  					      "fdiv3",
520b792e83171e Xianwei Zhao   2024-08-30  144  					      "fdiv4",
520b792e83171e Xianwei Zhao   2024-08-30  145  					      "fdiv5",
520b792e83171e Xianwei Zhao   2024-08-30  146  					      "fdiv7",
520b792e83171e Xianwei Zhao   2024-08-30  147  					      "gp0",
520b792e83171e Xianwei Zhao   2024-08-30  148  					      "gp1",
520b792e83171e Xianwei Zhao   2024-08-30  149  					      "hifi",
520b792e83171e Xianwei Zhao   2024-08-30  150  					      "sysclk",
520b792e83171e Xianwei Zhao   2024-08-30  151  					      "axiclk",
520b792e83171e Xianwei Zhao   2024-08-30  152  					      "sysplldiv16",
520b792e83171e Xianwei Zhao   2024-08-30  153  					      "cpudiv16";
520b792e83171e Xianwei Zhao   2024-08-30  154  			};
520b792e83171e Xianwei Zhao   2024-08-30  155  
1e75c2276a4fa0 Zelong Dong    2023-09-14  156  			reset: reset-controller@2000 {
1e75c2276a4fa0 Zelong Dong    2023-09-14  157  				compatible = "amlogic,c3-reset";
1e75c2276a4fa0 Zelong Dong    2023-09-14  158  				reg = <0x0 0x2000 0x0 0x98>;
1e75c2276a4fa0 Zelong Dong    2023-09-14  159  				#reset-cells = <1>;
1e75c2276a4fa0 Zelong Dong    2023-09-14  160  			};
1e75c2276a4fa0 Zelong Dong    2023-09-14  161  
a30c7a73b0ad50 Huqiang Qin    2023-10-27  162  			watchdog@2100 {
a30c7a73b0ad50 Huqiang Qin    2023-10-27  163  				compatible = "amlogic,c3-wdt", "amlogic,t7-wdt";
a30c7a73b0ad50 Huqiang Qin    2023-10-27  164  				reg = <0x0 0x2100 0x0 0x10>;
a30c7a73b0ad50 Huqiang Qin    2023-10-27  165  				clocks = <&xtal>;
a30c7a73b0ad50 Huqiang Qin    2023-10-27  166  			};
a30c7a73b0ad50 Huqiang Qin    2023-10-27  167  
cac34b2b3f5a9d Huqiang Qin    2023-07-20  168  			periphs_pinctrl: pinctrl@4000 {
cac34b2b3f5a9d Huqiang Qin    2023-07-20  169  				compatible = "amlogic,c3-periphs-pinctrl";
cac34b2b3f5a9d Huqiang Qin    2023-07-20  170  				#address-cells = <2>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  171  				#size-cells = <2>;
ca55a30d27cb37 Xianwei Zhao   2024-09-02  172  				ranges = <0x0 0x0 0x0 0x4000 0x0 0x02de>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  173  
ca55a30d27cb37 Xianwei Zhao   2024-09-02  174  				gpio: bank@0 {
ca55a30d27cb37 Xianwei Zhao   2024-09-02  175  					reg = <0x0 0x0 0x0 0x004c>,
ca55a30d27cb37 Xianwei Zhao   2024-09-02  176  					      <0x0 0x100 0x0 0x01de>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  177  					reg-names = "mux", "gpio";
cac34b2b3f5a9d Huqiang Qin    2023-07-20  178  					gpio-controller;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  179  					#gpio-cells = <2>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  180  					gpio-ranges = <&periphs_pinctrl 0 0 55>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  181  				};
520b792e83171e Xianwei Zhao   2024-08-30  182  
520b792e83171e Xianwei Zhao   2024-08-30  183  				i2c0_pins1: i2c0-pins1 {
520b792e83171e Xianwei Zhao   2024-08-30  184  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  185  						groups = "i2c0_sda_e",
520b792e83171e Xianwei Zhao   2024-08-30  186  							 "i2c0_scl_e";
520b792e83171e Xianwei Zhao   2024-08-30  187  						function = "i2c0";
520b792e83171e Xianwei Zhao   2024-08-30  188  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  189  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  190  					};
520b792e83171e Xianwei Zhao   2024-08-30  191  				};
520b792e83171e Xianwei Zhao   2024-08-30  192  
520b792e83171e Xianwei Zhao   2024-08-30  193  				i2c0_pins2: i2c0-pins2 {
520b792e83171e Xianwei Zhao   2024-08-30  194  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  195  						groups = "i2c0_sda_d",
520b792e83171e Xianwei Zhao   2024-08-30  196  							 "i2c0_scl_d";
520b792e83171e Xianwei Zhao   2024-08-30  197  						function = "i2c0";
520b792e83171e Xianwei Zhao   2024-08-30  198  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  199  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  200  					};
520b792e83171e Xianwei Zhao   2024-08-30  201  				};
520b792e83171e Xianwei Zhao   2024-08-30  202  
520b792e83171e Xianwei Zhao   2024-08-30  203  				i2c1_pins1: i2c1-pins1 {
520b792e83171e Xianwei Zhao   2024-08-30  204  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  205  						groups = "i2c1_sda_x",
520b792e83171e Xianwei Zhao   2024-08-30  206  							 "i2c1_scl_x";
520b792e83171e Xianwei Zhao   2024-08-30  207  						function = "i2c1";
520b792e83171e Xianwei Zhao   2024-08-30  208  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  209  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  210  					};
520b792e83171e Xianwei Zhao   2024-08-30  211  				};
520b792e83171e Xianwei Zhao   2024-08-30  212  
520b792e83171e Xianwei Zhao   2024-08-30  213  				i2c1_pins2: i2c1-pins2 {
520b792e83171e Xianwei Zhao   2024-08-30  214  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  215  						groups = "i2c1_sda_d",
520b792e83171e Xianwei Zhao   2024-08-30  216  							 "i2c1_scl_d";
520b792e83171e Xianwei Zhao   2024-08-30  217  						function = "i2c1";
520b792e83171e Xianwei Zhao   2024-08-30  218  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  219  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  220  					};
520b792e83171e Xianwei Zhao   2024-08-30  221  				};
520b792e83171e Xianwei Zhao   2024-08-30  222  
520b792e83171e Xianwei Zhao   2024-08-30  223  				i2c1_pins3: i2c1-pins3 {
520b792e83171e Xianwei Zhao   2024-08-30  224  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  225  						groups = "i2c1_sda_a",
520b792e83171e Xianwei Zhao   2024-08-30  226  							 "i2c1_scl_a";
520b792e83171e Xianwei Zhao   2024-08-30  227  						function = "i2c1";
520b792e83171e Xianwei Zhao   2024-08-30  228  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  229  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  230  					};
520b792e83171e Xianwei Zhao   2024-08-30  231  				};
520b792e83171e Xianwei Zhao   2024-08-30  232  
520b792e83171e Xianwei Zhao   2024-08-30  233  				i2c1_pins4: i2c1-pins4 {
520b792e83171e Xianwei Zhao   2024-08-30  234  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  235  						groups = "i2c1_sda_b",
520b792e83171e Xianwei Zhao   2024-08-30  236  							 "i2c1_scl_b";
520b792e83171e Xianwei Zhao   2024-08-30  237  						function = "i2c1";
520b792e83171e Xianwei Zhao   2024-08-30  238  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  239  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  240  					};
520b792e83171e Xianwei Zhao   2024-08-30  241  				};
520b792e83171e Xianwei Zhao   2024-08-30  242  
520b792e83171e Xianwei Zhao   2024-08-30  243  				i2c2_pins1: i2c2-pins1 {
520b792e83171e Xianwei Zhao   2024-08-30  244  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  245  						groups = "i2c2_sda",
520b792e83171e Xianwei Zhao   2024-08-30  246  							 "i2c2_scl";
520b792e83171e Xianwei Zhao   2024-08-30  247  						function = "i2c2";
520b792e83171e Xianwei Zhao   2024-08-30  248  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  249  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  250  					};
520b792e83171e Xianwei Zhao   2024-08-30  251  				};
520b792e83171e Xianwei Zhao   2024-08-30  252  
520b792e83171e Xianwei Zhao   2024-08-30  253  				i2c3_pins1: i2c3-pins1 {
520b792e83171e Xianwei Zhao   2024-08-30  254  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  255  						groups = "i2c3_sda_c",
520b792e83171e Xianwei Zhao   2024-08-30  256  							 "i2c3_scl_c";
520b792e83171e Xianwei Zhao   2024-08-30  257  						function = "i2c3";
520b792e83171e Xianwei Zhao   2024-08-30  258  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  259  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  260  					};
520b792e83171e Xianwei Zhao   2024-08-30  261  				};
520b792e83171e Xianwei Zhao   2024-08-30  262  
520b792e83171e Xianwei Zhao   2024-08-30  263  				i2c3_pins2: i2c3-pins2 {
520b792e83171e Xianwei Zhao   2024-08-30  264  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  265  						groups = "i2c3_sda_x",
520b792e83171e Xianwei Zhao   2024-08-30  266  							 "i2c3_scl_x";
520b792e83171e Xianwei Zhao   2024-08-30  267  						function = "i2c3";
520b792e83171e Xianwei Zhao   2024-08-30  268  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  269  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  270  					};
520b792e83171e Xianwei Zhao   2024-08-30  271  				};
520b792e83171e Xianwei Zhao   2024-08-30  272  
520b792e83171e Xianwei Zhao   2024-08-30  273  				i2c3_pins3: i2c3-pins3 {
520b792e83171e Xianwei Zhao   2024-08-30  274  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  275  						groups = "i2c3_sda_d",
520b792e83171e Xianwei Zhao   2024-08-30  276  							 "i2c3_scl_d";
520b792e83171e Xianwei Zhao   2024-08-30  277  						function = "i2c3";
520b792e83171e Xianwei Zhao   2024-08-30  278  						bias-disable;
520b792e83171e Xianwei Zhao   2024-08-30  279  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  280  					};
520b792e83171e Xianwei Zhao   2024-08-30  281  				};
520b792e83171e Xianwei Zhao   2024-08-30  282  
520b792e83171e Xianwei Zhao   2024-08-30  283  				nand_pins: nand-pins {
520b792e83171e Xianwei Zhao   2024-08-30  284  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  285  						groups = "emmc_nand_d0",
520b792e83171e Xianwei Zhao   2024-08-30  286  							 "emmc_nand_d1",
520b792e83171e Xianwei Zhao   2024-08-30  287  							 "emmc_nand_d2",
520b792e83171e Xianwei Zhao   2024-08-30  288  							 "emmc_nand_d3",
520b792e83171e Xianwei Zhao   2024-08-30  289  							 "emmc_nand_d4",
520b792e83171e Xianwei Zhao   2024-08-30  290  							 "emmc_nand_d5",
520b792e83171e Xianwei Zhao   2024-08-30  291  							 "emmc_nand_d6",
520b792e83171e Xianwei Zhao   2024-08-30  292  							 "emmc_nand_d7",
520b792e83171e Xianwei Zhao   2024-08-30  293  							 "nand_ce0",
520b792e83171e Xianwei Zhao   2024-08-30  294  							 "nand_ale",
520b792e83171e Xianwei Zhao   2024-08-30  295  							 "nand_cle",
520b792e83171e Xianwei Zhao   2024-08-30  296  							 "nand_wen_clk",
520b792e83171e Xianwei Zhao   2024-08-30  297  							 "nand_ren_wr";
520b792e83171e Xianwei Zhao   2024-08-30  298  						function = "nand";
520b792e83171e Xianwei Zhao   2024-08-30  299  						input-enable;
520b792e83171e Xianwei Zhao   2024-08-30  300  					};
520b792e83171e Xianwei Zhao   2024-08-30  301  				};
520b792e83171e Xianwei Zhao   2024-08-30  302  
520b792e83171e Xianwei Zhao   2024-08-30  303  				sdcard_pins: sdcard-pins {
520b792e83171e Xianwei Zhao   2024-08-30  304  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  305  						groups = "sdcard_d0",
520b792e83171e Xianwei Zhao   2024-08-30  306  							 "sdcard_d1",
520b792e83171e Xianwei Zhao   2024-08-30  307  							 "sdcard_d2",
520b792e83171e Xianwei Zhao   2024-08-30  308  							 "sdcard_d3",
520b792e83171e Xianwei Zhao   2024-08-30  309  							 "sdcard_clk",
520b792e83171e Xianwei Zhao   2024-08-30  310  							 "sdcard_cmd";
520b792e83171e Xianwei Zhao   2024-08-30  311  						function = "sdcard";
520b792e83171e Xianwei Zhao   2024-08-30  312  						bias-pull-up;
520b792e83171e Xianwei Zhao   2024-08-30  313  						drive-strength-microamp = <4000>;
520b792e83171e Xianwei Zhao   2024-08-30  314  					};
520b792e83171e Xianwei Zhao   2024-08-30  315  				};
520b792e83171e Xianwei Zhao   2024-08-30  316  
520b792e83171e Xianwei Zhao   2024-08-30  317  				sdcard_clk_gate_pins: sdcard-clk-cmd-pins {
520b792e83171e Xianwei Zhao   2024-08-30  318  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  319  						groups = "GPIOC_4";
520b792e83171e Xianwei Zhao   2024-08-30  320  						function = "gpio_periphs";
520b792e83171e Xianwei Zhao   2024-08-30  321  						bias-pull-down;
520b792e83171e Xianwei Zhao   2024-08-30  322  						drive-strength-microamp = <4000>;
520b792e83171e Xianwei Zhao   2024-08-30  323  					};
520b792e83171e Xianwei Zhao   2024-08-30  324  				};
520b792e83171e Xianwei Zhao   2024-08-30  325  
520b792e83171e Xianwei Zhao   2024-08-30  326  				sdio_m_clk_gate_pins: sdio-m-clk-cmd-pins {
520b792e83171e Xianwei Zhao   2024-08-30  327  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  328  						groups = "sdio_clk";
520b792e83171e Xianwei Zhao   2024-08-30  329  						function = "sdio";
520b792e83171e Xianwei Zhao   2024-08-30  330  						bias-pull-down;
520b792e83171e Xianwei Zhao   2024-08-30  331  						drive-strength-microamp = <4000>;
520b792e83171e Xianwei Zhao   2024-08-30  332  					};
520b792e83171e Xianwei Zhao   2024-08-30  333  				};
520b792e83171e Xianwei Zhao   2024-08-30  334  
520b792e83171e Xianwei Zhao   2024-08-30  335  				sdio_m_pins: sdio-m-all-pins {
520b792e83171e Xianwei Zhao   2024-08-30  336  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  337  						groups = "sdio_d0",
520b792e83171e Xianwei Zhao   2024-08-30  338  							 "sdio_d1",
520b792e83171e Xianwei Zhao   2024-08-30  339  							 "sdio_d2",
520b792e83171e Xianwei Zhao   2024-08-30  340  							 "sdio_d3",
520b792e83171e Xianwei Zhao   2024-08-30  341  							 "sdio_clk",
520b792e83171e Xianwei Zhao   2024-08-30  342  							 "sdio_cmd";
520b792e83171e Xianwei Zhao   2024-08-30  343  						function = "sdio";
520b792e83171e Xianwei Zhao   2024-08-30  344  						input-enable;
520b792e83171e Xianwei Zhao   2024-08-30  345  						bias-pull-up;
520b792e83171e Xianwei Zhao   2024-08-30  346  						drive-strength-microamp = <4000>;
520b792e83171e Xianwei Zhao   2024-08-30  347  					};
520b792e83171e Xianwei Zhao   2024-08-30  348  				};
520b792e83171e Xianwei Zhao   2024-08-30  349  
520b792e83171e Xianwei Zhao   2024-08-30  350  				spicc0_pins1: spicc0-pins1 {
520b792e83171e Xianwei Zhao   2024-08-30  351  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  352  						groups = "spi_a_mosi_b",
520b792e83171e Xianwei Zhao   2024-08-30  353  							 "spi_a_miso_b",
520b792e83171e Xianwei Zhao   2024-08-30  354  							 "spi_a_clk_b";
520b792e83171e Xianwei Zhao   2024-08-30  355  						function = "spi_a";
520b792e83171e Xianwei Zhao   2024-08-30  356  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  357  					};
520b792e83171e Xianwei Zhao   2024-08-30  358  				};
520b792e83171e Xianwei Zhao   2024-08-30  359  
520b792e83171e Xianwei Zhao   2024-08-30  360  				spicc0_pins2: spicc0-pins2 {
520b792e83171e Xianwei Zhao   2024-08-30  361  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  362  						groups = "spi_a_mosi_c",
520b792e83171e Xianwei Zhao   2024-08-30  363  							 "spi_a_miso_c",
520b792e83171e Xianwei Zhao   2024-08-30  364  							 "spi_a_clk_c";
520b792e83171e Xianwei Zhao   2024-08-30  365  						function = "spi_a";
520b792e83171e Xianwei Zhao   2024-08-30  366  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  367  					};
520b792e83171e Xianwei Zhao   2024-08-30  368  				};
520b792e83171e Xianwei Zhao   2024-08-30  369  
520b792e83171e Xianwei Zhao   2024-08-30  370  				spicc0_pins3: spicc0-pins3 {
520b792e83171e Xianwei Zhao   2024-08-30  371  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  372  						groups = "spi_a_mosi_x",
520b792e83171e Xianwei Zhao   2024-08-30  373  							 "spi_a_miso_x",
520b792e83171e Xianwei Zhao   2024-08-30  374  							 "spi_a_clk_x";
520b792e83171e Xianwei Zhao   2024-08-30  375  						function = "spi_a";
520b792e83171e Xianwei Zhao   2024-08-30  376  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  377  					};
520b792e83171e Xianwei Zhao   2024-08-30  378  				};
520b792e83171e Xianwei Zhao   2024-08-30  379  
520b792e83171e Xianwei Zhao   2024-08-30  380  				spicc1_pins1: spicc1-pins1 {
520b792e83171e Xianwei Zhao   2024-08-30  381  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  382  						groups = "spi_b_mosi_d",
520b792e83171e Xianwei Zhao   2024-08-30  383  							 "spi_b_miso_d",
520b792e83171e Xianwei Zhao   2024-08-30  384  							 "spi_b_clk_d";
520b792e83171e Xianwei Zhao   2024-08-30  385  						function = "spi_b";
520b792e83171e Xianwei Zhao   2024-08-30  386  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  387  					};
520b792e83171e Xianwei Zhao   2024-08-30  388  				};
520b792e83171e Xianwei Zhao   2024-08-30  389  
520b792e83171e Xianwei Zhao   2024-08-30  390  				spicc1_pins2: spicc1-pins2 {
520b792e83171e Xianwei Zhao   2024-08-30  391  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  392  						groups = "spi_b_mosi_x",
520b792e83171e Xianwei Zhao   2024-08-30  393  							 "spi_b_miso_x",
520b792e83171e Xianwei Zhao   2024-08-30  394  							 "spi_b_clk_x";
520b792e83171e Xianwei Zhao   2024-08-30  395  						function = "spi_b";
520b792e83171e Xianwei Zhao   2024-08-30  396  						drive-strength-microamp = <3000>;
520b792e83171e Xianwei Zhao   2024-08-30  397  					};
520b792e83171e Xianwei Zhao   2024-08-30  398  				};
520b792e83171e Xianwei Zhao   2024-08-30  399  
520b792e83171e Xianwei Zhao   2024-08-30  400  				spifc_pins: spifc-pins {
520b792e83171e Xianwei Zhao   2024-08-30  401  					mux {
520b792e83171e Xianwei Zhao   2024-08-30  402  						groups = "spif_mo",
520b792e83171e Xianwei Zhao   2024-08-30  403  							 "spif_mi",
520b792e83171e Xianwei Zhao   2024-08-30  404  							 "spif_clk",
520b792e83171e Xianwei Zhao   2024-08-30  405  							 "spif_cs",
520b792e83171e Xianwei Zhao   2024-08-30  406  							 "spif_hold",
520b792e83171e Xianwei Zhao   2024-08-30  407  							 "spif_wp",
520b792e83171e Xianwei Zhao   2024-08-30  408  							 "spif_clk_loop";
520b792e83171e Xianwei Zhao   2024-08-30  409  						function = "spif";
520b792e83171e Xianwei Zhao   2024-08-30  410  						drive-strength-microamp = <4000>;
520b792e83171e Xianwei Zhao   2024-08-30  411  					};
520b792e83171e Xianwei Zhao   2024-08-30  412  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  413  
1dacfcef67806a Kelvin Zhang   2024-09-06  414  				pwm_a_pins1: pwm-a-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  415  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  416  						groups = "pwm_a";
1dacfcef67806a Kelvin Zhang   2024-09-06  417  						function = "pwm_a";
1dacfcef67806a Kelvin Zhang   2024-09-06  418  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  419  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  420  
1dacfcef67806a Kelvin Zhang   2024-09-06  421  				pwm_b_pins1: pwm-b-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  422  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  423  						groups = "pwm_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  424  						function = "pwm_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  425  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  426  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  427  
1dacfcef67806a Kelvin Zhang   2024-09-06  428  				pwm_c_pins1: pwm-c-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  429  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  430  						groups = "pwm_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  431  						function = "pwm_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  432  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  433  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  434  
1dacfcef67806a Kelvin Zhang   2024-09-06  435  				pwm_d_pins1: pwm-d-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  436  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  437  						groups = "pwm_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  438  						function = "pwm_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  439  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  440  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  441  
1dacfcef67806a Kelvin Zhang   2024-09-06  442  				pwm_e_pins1: pwm-e-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  443  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  444  						groups = "pwm_e";
1dacfcef67806a Kelvin Zhang   2024-09-06  445  						function = "pwm_e";
1dacfcef67806a Kelvin Zhang   2024-09-06  446  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  447  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  448  
1dacfcef67806a Kelvin Zhang   2024-09-06  449  				pwm_f_pins1: pwm-f-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  450  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  451  						groups = "pwm_f";
1dacfcef67806a Kelvin Zhang   2024-09-06  452  						function = "pwm_f";
1dacfcef67806a Kelvin Zhang   2024-09-06  453  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  454  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  455  
1dacfcef67806a Kelvin Zhang   2024-09-06  456  				pwm_g_pins1: pwm-g-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  457  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  458  						groups = "pwm_g_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  459  						function = "pwm_g";
1dacfcef67806a Kelvin Zhang   2024-09-06  460  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  461  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  462  
1dacfcef67806a Kelvin Zhang   2024-09-06  463  				pwm_g_pins2: pwm-g-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  464  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  465  						groups = "pwm_g_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  466  						function = "pwm_g";
1dacfcef67806a Kelvin Zhang   2024-09-06  467  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  468  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  469  
1dacfcef67806a Kelvin Zhang   2024-09-06  470  				pwm_g_pins3: pwm-g-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  471  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  472  						groups = "pwm_g_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  473  						function = "pwm_g";
1dacfcef67806a Kelvin Zhang   2024-09-06  474  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  475  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  476  
1dacfcef67806a Kelvin Zhang   2024-09-06  477  				pwm_g_pins4: pwm-g-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  478  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  479  						groups = "pwm_g_x0";
1dacfcef67806a Kelvin Zhang   2024-09-06  480  						function = "pwm_g";
1dacfcef67806a Kelvin Zhang   2024-09-06  481  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  482  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  483  
1dacfcef67806a Kelvin Zhang   2024-09-06  484  				pwm_g_pins5: pwm-g-pins5 {
1dacfcef67806a Kelvin Zhang   2024-09-06  485  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  486  						groups = "pwm_g_x8";
1dacfcef67806a Kelvin Zhang   2024-09-06  487  						function = "pwm_g";
1dacfcef67806a Kelvin Zhang   2024-09-06  488  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  489  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  490  
1dacfcef67806a Kelvin Zhang   2024-09-06  491  				pwm_h_pins1: pwm-h-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  492  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  493  						groups = "pwm_h_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  494  						function = "pwm_h";
1dacfcef67806a Kelvin Zhang   2024-09-06  495  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  496  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  497  
1dacfcef67806a Kelvin Zhang   2024-09-06  498  				pwm_h_pins2: pwm-h-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  499  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  500  						groups = "pwm_h_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  501  						function = "pwm_h";
1dacfcef67806a Kelvin Zhang   2024-09-06  502  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  503  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  504  
1dacfcef67806a Kelvin Zhang   2024-09-06  505  				pwm_h_pins3: pwm-h-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  506  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  507  						groups = "pwm_h_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  508  						function = "pwm_h";
1dacfcef67806a Kelvin Zhang   2024-09-06  509  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  510  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  511  
1dacfcef67806a Kelvin Zhang   2024-09-06  512  				pwm_h_pins4: pwm-h-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  513  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  514  						groups = "pwm_h_x1";
1dacfcef67806a Kelvin Zhang   2024-09-06  515  						function = "pwm_h";
1dacfcef67806a Kelvin Zhang   2024-09-06  516  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  517  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  518  
1dacfcef67806a Kelvin Zhang   2024-09-06  519  				pwm_h_pins5: pwm-h-pins5 {
1dacfcef67806a Kelvin Zhang   2024-09-06  520  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  521  						groups = "pwm_h_x9";
1dacfcef67806a Kelvin Zhang   2024-09-06  522  						function = "pwm_h";
1dacfcef67806a Kelvin Zhang   2024-09-06  523  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  524  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  525  
1dacfcef67806a Kelvin Zhang   2024-09-06  526  				pwm_i_pins1: pwm-i-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  527  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  528  						groups = "pwm_i_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  529  						function = "pwm_i";
1dacfcef67806a Kelvin Zhang   2024-09-06  530  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  531  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  532  
1dacfcef67806a Kelvin Zhang   2024-09-06  533  				pwm_i_pins2: pwm-i-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  534  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  535  						groups = "pwm_i_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  536  						function = "pwm_i";
1dacfcef67806a Kelvin Zhang   2024-09-06  537  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  538  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  539  
1dacfcef67806a Kelvin Zhang   2024-09-06  540  				pwm_i_pins3: pwm-i-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  541  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  542  						groups = "pwm_i_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  543  						function = "pwm_i";
1dacfcef67806a Kelvin Zhang   2024-09-06  544  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  545  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  546  
1dacfcef67806a Kelvin Zhang   2024-09-06  547  				pwm_i_pins4: pwm-i-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  548  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  549  						groups = "pwm_i_x2";
1dacfcef67806a Kelvin Zhang   2024-09-06  550  						function = "pwm_i";
1dacfcef67806a Kelvin Zhang   2024-09-06  551  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  552  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  553  
1dacfcef67806a Kelvin Zhang   2024-09-06  554  				pwm_i_pins5: pwm-i-pins5 {
1dacfcef67806a Kelvin Zhang   2024-09-06  555  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  556  						groups = "pwm_i_x10";
1dacfcef67806a Kelvin Zhang   2024-09-06  557  						function = "pwm_i";
1dacfcef67806a Kelvin Zhang   2024-09-06  558  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  559  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  560  
1dacfcef67806a Kelvin Zhang   2024-09-06  561  				pwm_j_pins1: pwm-j-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  562  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  563  						groups = "pwm_j_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  564  						function = "pwm_j";
1dacfcef67806a Kelvin Zhang   2024-09-06  565  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  566  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  567  
1dacfcef67806a Kelvin Zhang   2024-09-06  568  				pwm_j_pins2: pwm-j-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  569  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  570  						groups = "pwm_j_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  571  						function = "pwm_j";
1dacfcef67806a Kelvin Zhang   2024-09-06  572  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  573  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  574  
1dacfcef67806a Kelvin Zhang   2024-09-06  575  				pwm_j_pins3: pwm-j-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  576  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  577  						groups = "pwm_j_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  578  						function = "pwm_j";
1dacfcef67806a Kelvin Zhang   2024-09-06  579  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  580  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  581  
1dacfcef67806a Kelvin Zhang   2024-09-06  582  				pwm_j_pins4: pwm-j-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  583  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  584  						groups = "pwm_j_x3";
1dacfcef67806a Kelvin Zhang   2024-09-06  585  						function = "pwm_j";
1dacfcef67806a Kelvin Zhang   2024-09-06  586  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  587  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  588  
1dacfcef67806a Kelvin Zhang   2024-09-06  589  				pwm_j_pins5: pwm-j-pins5 {
1dacfcef67806a Kelvin Zhang   2024-09-06  590  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  591  						groups = "pwm_j_x12";
1dacfcef67806a Kelvin Zhang   2024-09-06  592  						function = "pwm_j";
1dacfcef67806a Kelvin Zhang   2024-09-06  593  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  594  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  595  
1dacfcef67806a Kelvin Zhang   2024-09-06  596  				pwm_k_pins1: pwm-k-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  597  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  598  						groups = "pwm_k_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  599  						function = "pwm_k";
1dacfcef67806a Kelvin Zhang   2024-09-06  600  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  601  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  602  
1dacfcef67806a Kelvin Zhang   2024-09-06  603  				pwm_k_pins2: pwm-k-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  604  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  605  						groups = "pwm_k_d";
1dacfcef67806a Kelvin Zhang   2024-09-06  606  						function = "pwm_k";
1dacfcef67806a Kelvin Zhang   2024-09-06  607  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  608  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  609  
1dacfcef67806a Kelvin Zhang   2024-09-06  610  				pwm_k_pins3: pwm-k-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  611  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  612  						groups = "pwm_k_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  613  						function = "pwm_k";
1dacfcef67806a Kelvin Zhang   2024-09-06  614  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  615  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  616  
1dacfcef67806a Kelvin Zhang   2024-09-06  617  				pwm_k_pins4: pwm-k-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  618  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  619  						groups = "pwm_k_x4";
1dacfcef67806a Kelvin Zhang   2024-09-06  620  						function = "pwm_k";
1dacfcef67806a Kelvin Zhang   2024-09-06  621  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  622  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  623  
1dacfcef67806a Kelvin Zhang   2024-09-06  624  				pwm_k_pins5: pwm-k-pins5 {
1dacfcef67806a Kelvin Zhang   2024-09-06  625  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  626  						groups = "pwm_k_x13";
1dacfcef67806a Kelvin Zhang   2024-09-06  627  						function = "pwm_k";
1dacfcef67806a Kelvin Zhang   2024-09-06  628  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  629  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  630  
1dacfcef67806a Kelvin Zhang   2024-09-06  631  				pwm_l_pins1: pwm-l-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  632  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  633  						groups = "pwm_l_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  634  						function = "pwm_l";
1dacfcef67806a Kelvin Zhang   2024-09-06  635  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  636  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  637  
1dacfcef67806a Kelvin Zhang   2024-09-06  638  				pwm_l_pins2: pwm-l-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  639  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  640  						groups = "pwm_l_x";
1dacfcef67806a Kelvin Zhang   2024-09-06  641  						function = "pwm_l";
1dacfcef67806a Kelvin Zhang   2024-09-06  642  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  643  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  644  
1dacfcef67806a Kelvin Zhang   2024-09-06  645  				pwm_l_pins3: pwm-l-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  646  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  647  						groups = "pwm_l_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  648  						function = "pwm_l";
1dacfcef67806a Kelvin Zhang   2024-09-06  649  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  650  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  651  
1dacfcef67806a Kelvin Zhang   2024-09-06  652  				pwm_l_pins4: pwm-l-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  653  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  654  						groups = "pwm_l_a";
1dacfcef67806a Kelvin Zhang   2024-09-06  655  						function = "pwm_l";
1dacfcef67806a Kelvin Zhang   2024-09-06  656  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  657  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  658  
1dacfcef67806a Kelvin Zhang   2024-09-06  659  				pwm_m_pins1: pwm-m-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  660  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  661  						groups = "pwm_m_c";
1dacfcef67806a Kelvin Zhang   2024-09-06  662  						function = "pwm_m";
1dacfcef67806a Kelvin Zhang   2024-09-06  663  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  664  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  665  
1dacfcef67806a Kelvin Zhang   2024-09-06  666  				pwm_m_pins2: pwm-m-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  667  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  668  						groups = "pwm_m_x";
1dacfcef67806a Kelvin Zhang   2024-09-06  669  						function = "pwm_m";
1dacfcef67806a Kelvin Zhang   2024-09-06  670  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  671  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  672  
1dacfcef67806a Kelvin Zhang   2024-09-06  673  				pwm_m_pins3: pwm-m-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  674  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  675  						groups = "pwm_m_a";
1dacfcef67806a Kelvin Zhang   2024-09-06  676  						function = "pwm_m";
1dacfcef67806a Kelvin Zhang   2024-09-06  677  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  678  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  679  
1dacfcef67806a Kelvin Zhang   2024-09-06  680  				pwm_m_pins4: pwm-m-pins4 {
1dacfcef67806a Kelvin Zhang   2024-09-06  681  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  682  						groups = "pwm_m_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  683  						function = "pwm_m";
1dacfcef67806a Kelvin Zhang   2024-09-06  684  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  685  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  686  
1dacfcef67806a Kelvin Zhang   2024-09-06  687  				pwm_n_pins1: pwm-n-pins1 {
1dacfcef67806a Kelvin Zhang   2024-09-06  688  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  689  						groups = "pwm_n_x";
1dacfcef67806a Kelvin Zhang   2024-09-06  690  						function = "pwm_n";
1dacfcef67806a Kelvin Zhang   2024-09-06  691  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  692  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  693  
1dacfcef67806a Kelvin Zhang   2024-09-06  694  				pwm_n_pins2: pwm-n-pins2 {
1dacfcef67806a Kelvin Zhang   2024-09-06  695  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  696  						groups = "pwm_n_a";
1dacfcef67806a Kelvin Zhang   2024-09-06  697  						function = "pwm_n";
1dacfcef67806a Kelvin Zhang   2024-09-06  698  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  699  				};
1dacfcef67806a Kelvin Zhang   2024-09-06  700  
1dacfcef67806a Kelvin Zhang   2024-09-06  701  				pwm_n_pins3: pwm-n-pins3 {
1dacfcef67806a Kelvin Zhang   2024-09-06  702  					mux {
1dacfcef67806a Kelvin Zhang   2024-09-06  703  						groups = "pwm_n_b";
1dacfcef67806a Kelvin Zhang   2024-09-06  704  						function = "pwm_n";
1dacfcef67806a Kelvin Zhang   2024-09-06  705  					};
1dacfcef67806a Kelvin Zhang   2024-09-06  706  				};
cac34b2b3f5a9d Huqiang Qin    2023-07-20  707  			};
cac34b2b3f5a9d Huqiang Qin    2023-07-20  708  
cac34b2b3f5a9d Huqiang Qin    2023-07-20  709  			gpio_intc: interrupt-controller@4080 {
e5d4d006a8c550 Neil Armstrong 2024-06-06  710  				compatible = "amlogic,c3-gpio-intc", "amlogic,meson-gpio-intc";
cac34b2b3f5a9d Huqiang Qin    2023-07-20  711  				reg = <0x0 0x4080 0x0 0x0020>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  712  				interrupt-controller;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  713  				#interrupt-cells = <2>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  714  				amlogic,channel-interrupts =
cac34b2b3f5a9d Huqiang Qin    2023-07-20  715  					<10 11 12 13 14 15 16 17 18 19 20 21>;
cac34b2b3f5a9d Huqiang Qin    2023-07-20  716  			};
cac34b2b3f5a9d Huqiang Qin    2023-07-20  717  
520b792e83171e Xianwei Zhao   2024-08-30  718  			clkc_pll: clock-controller@8000 {
520b792e83171e Xianwei Zhao   2024-08-30  719  				compatible = "amlogic,c3-pll-clkc";
520b792e83171e Xianwei Zhao   2024-08-30  720  				reg = <0x0 0x8000 0x0 0x1a4>;
520b792e83171e Xianwei Zhao   2024-08-30  721  				#clock-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  722  				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
520b792e83171e Xianwei Zhao   2024-08-30  723  					 <&scmi_clk CLKID_MCLK_PLL_OSC>,
520b792e83171e Xianwei Zhao   2024-08-30  724  					 <&scmi_clk CLKID_FIXED_PLL_OSC>;
520b792e83171e Xianwei Zhao   2024-08-30  725  				clock-names = "top",
520b792e83171e Xianwei Zhao   2024-08-30  726  					      "mclk",
520b792e83171e Xianwei Zhao   2024-08-30  727  					      "fix";
520b792e83171e Xianwei Zhao   2024-08-30  728  			};
520b792e83171e Xianwei Zhao   2024-08-30  729  
520b792e83171e Xianwei Zhao   2024-08-30  730  			eth_phy: mdio-multiplexer@28000 {
520b792e83171e Xianwei Zhao   2024-08-30  731  				compatible = "amlogic,g12a-mdio-mux";
520b792e83171e Xianwei Zhao   2024-08-30  732  				reg = <0x0 0x28000 0x0 0xa4>;
520b792e83171e Xianwei Zhao   2024-08-30  733  
520b792e83171e Xianwei Zhao   2024-08-30  734  				clocks = <&clkc_periphs CLKID_SYS_ETH_PHY>,
520b792e83171e Xianwei Zhao   2024-08-30  735  					 <&xtal>,
520b792e83171e Xianwei Zhao   2024-08-30  736  					 <&clkc_pll CLKID_FCLK_50M>;
520b792e83171e Xianwei Zhao   2024-08-30  737  				clock-names = "pclk", "clkin0", "clkin1";
520b792e83171e Xianwei Zhao   2024-08-30  738  				mdio-parent-bus = <&mdio0>;
520b792e83171e Xianwei Zhao   2024-08-30  739  				#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  740  				#size-cells = <0>;
520b792e83171e Xianwei Zhao   2024-08-30  741  
520b792e83171e Xianwei Zhao   2024-08-30  742  				ext_mdio: mdio@0 {
520b792e83171e Xianwei Zhao   2024-08-30  743  					reg = <0>;
520b792e83171e Xianwei Zhao   2024-08-30  744  					#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  745  					#size-cells = <0>;
520b792e83171e Xianwei Zhao   2024-08-30  746  				};
520b792e83171e Xianwei Zhao   2024-08-30  747  
520b792e83171e Xianwei Zhao   2024-08-30  748  				int_mdio: mdio@1 {
520b792e83171e Xianwei Zhao   2024-08-30  749  					reg = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  750  					#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  751  					#size-cells = <0>;
520b792e83171e Xianwei Zhao   2024-08-30  752  
520b792e83171e Xianwei Zhao   2024-08-30  753  					internal_ephy: ethernet_phy@8 {
520b792e83171e Xianwei Zhao   2024-08-30  754  						compatible = "ethernet-phy-id0180.3301",
520b792e83171e Xianwei Zhao   2024-08-30  755  							     "ethernet-phy-ieee802.3-c22";
520b792e83171e Xianwei Zhao   2024-08-30  756  						interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
520b792e83171e Xianwei Zhao   2024-08-30  757  						reg = <8>;
520b792e83171e Xianwei Zhao   2024-08-30  758  						max-speed = <100>;
520b792e83171e Xianwei Zhao   2024-08-30  759  					};
520b792e83171e Xianwei Zhao   2024-08-30  760  				};
520b792e83171e Xianwei Zhao   2024-08-30  761  			};
520b792e83171e Xianwei Zhao   2024-08-30  762  
520b792e83171e Xianwei Zhao   2024-08-30  763  			spicc0: spi@50000 {
520b792e83171e Xianwei Zhao   2024-08-30  764  				compatible = "amlogic,meson-g12a-spicc";
520b792e83171e Xianwei Zhao   2024-08-30  765  				reg = <0x0 0x50000 0x0 0x44>;
520b792e83171e Xianwei Zhao   2024-08-30  766  				interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
520b792e83171e Xianwei Zhao   2024-08-30  767  				clocks = <&clkc_periphs CLKID_SYS_SPICC_0>,
520b792e83171e Xianwei Zhao   2024-08-30  768  					 <&clkc_periphs CLKID_SPICC_A>;
520b792e83171e Xianwei Zhao   2024-08-30  769  				clock-names = "core", "pclk";
520b792e83171e Xianwei Zhao   2024-08-30  770  				#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  771  				#size-cells = <0>;
520b792e83171e Xianwei Zhao   2024-08-30  772  				status = "disabled";
520b792e83171e Xianwei Zhao   2024-08-30  773  			};
520b792e83171e Xianwei Zhao   2024-08-30  774  
520b792e83171e Xianwei Zhao   2024-08-30  775  			spicc1: spi@52000 {
520b792e83171e Xianwei Zhao   2024-08-30  776  				compatible = "amlogic,meson-g12a-spicc";
520b792e83171e Xianwei Zhao   2024-08-30  777  				reg = <0x0 0x52000 0x0 0x44>;
520b792e83171e Xianwei Zhao   2024-08-30  778  				interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
520b792e83171e Xianwei Zhao   2024-08-30  779  				clocks = <&clkc_periphs CLKID_SYS_SPICC_1>,
520b792e83171e Xianwei Zhao   2024-08-30  780  					 <&clkc_periphs CLKID_SPICC_B>;
520b792e83171e Xianwei Zhao   2024-08-30  781  				clock-names = "core", "pclk";
520b792e83171e Xianwei Zhao   2024-08-30  782  				#address-cells = <1>;
520b792e83171e Xianwei Zhao   2024-08-30  783  				#size-cells = <0>;
520b792e83171e Xianwei Zhao   2024-08-30  784  				status = "disabled";
520b792e83171e Xianwei Zhao   2024-08-30  785  			};
520b792e83171e Xianwei Zhao   2024-08-30  786  
1dacfcef67806a Kelvin Zhang   2024-09-06 @787  			pwm_mn: pwm@54000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
