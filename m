Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926591D015D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726325531; cv=none; b=eQWJPlE/htmW0P9f9D767IpqFyNwcGlmFiHqqhvb2E7qz/0ZIqgVdYRStkbA+zlQULxMhu/dVB6iCL59Ls8wYOhl75hC1pfL/iVR8JwgsR6WXVicNF81V/uJJEPwKrEAx8TNbt0FpFE2C552Wqim+hlcaZQamXnBGbnFxWH5BEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726325531; c=relaxed/simple;
	bh=zXvuJx9lDNNSLx9qd8D2mfBhh9CmdpJ/Jutc7I4bMqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWnEsoI1jDgaIvYxEPTzhg9mdsEAM6bcJUDirb52TfoaJLTRailWg/nqrKwx1vgb1fZ2cIREJgPtp67sb4Uh/nbkirQSJ8fWjybXvRRwRQ/G9lEwMS/h568cMmrOdO4Z9WOX27XDs+5EjCtofUMTCruYp11nHLbYeUfB66AxU1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLdx6mud; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLdx6mud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726325529; x=1757861529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXvuJx9lDNNSLx9qd8D2mfBhh9CmdpJ/Jutc7I4bMqk=;
  b=VLdx6mudAm656euDIFoqyF/97vcjnz8CjxV4jqNDiPjpWsxdtOyMGrsl
   TpPRuXLQ2P2hcclEs8aw/7rIsaTGfNA8e8SO75S8xW6bcunuleAOvptES
   Ik3cEQgkXT7KBE6qz7bybJH93eVJfOtOg2i1Sjg82gEIGaOy2oaUdyPW+
   wnEMlx9IpVlKH0bjvMu6gc3JheQ/IckNrZO/0rrHX2vYihi/8BmrNf0lN
   NSCVlUMz1bWJbP6XMbvCCkTezB7pF70rJr7JodZ+NO/dqWnS4yAwB1qmx
   gNB2WI5H9cTuBbQvsrQLPwSTVkTTAmezMMHYoWrARcVc/9oVpsqrG/Hdw
   Q==;
X-CSE-ConnectionGUID: 0xEoykx2S4uWRNOXsg3ExA==
X-CSE-MsgGUID: 9Fd1C44FRY+wDTdcSKjSOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="50634051"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="50634051"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:52:06 -0700
X-CSE-ConnectionGUID: qui9fj5AS6qAYu7VSLPJfg==
X-CSE-MsgGUID: ewCGREHcQmmoFWJ2ZW47Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72529411"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2024 07:52:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spU82-0007r8-0v;
	Sat, 14 Sep 2024 14:52:02 +0000
Date: Sat, 14 Sep 2024 22:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 19/21] arm64: dts: adi: sc598: add device tree
Message-ID: <202409142227.G2feVa8Y-lkp@intel.com>
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
In-Reply-To: <20240912-test-v1-19-458fa57c8ccf@analog.com>
References: <20240912-test-v1-19-458fa57c8ccf@analog.com>
TO: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Greg Malysa <greg.malysa@timesys.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Utsav Agarwal <Utsav.Agarwal@analog.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Olof Johansson <olof@lixom.net>
TO: soc@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: Arturs Artamonovs <arturs.artamonovs@analog.com>
CC: adsp-linux@analog.com
CC: "Nathan Barrett-Morrison" <nathan.morrison@timesys.com>

Hi Arturs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-19-458fa57c8ccf%40analog.com
patch subject: [PATCH 19/21] arm64: dts: adi: sc598: add device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409142227.G2feVa8Y-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142227.G2feVa8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409142227.G2feVa8Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/adi/sc59x-64.dtsi:64.28-69.5: Warning (unit_address_vs_reg): /clocks/oscillator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/adi/sc59x-64.dtsi:71.28-76.5: Warning (unit_address_vs_reg): /clocks/oscillator@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/adi/sc59x-64.dtsi:226.30-232.5: Warning (avoid_unnecessary_addr_size): /scb-bus/pinctrl@31004600: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +64 arch/arm64/boot/dts/adi/sc59x-64.dtsi

b67e4b493385a8 Arturs Artamonovs 2024-09-12   10  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   11  / {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   12  	model = "ADI 64-bit SC59X";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   13  	compatible = "adi,sc59x-64";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   14  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   15  	interrupt-parent = <&gic>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   16  	#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   17  	#size-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   18  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   19  	chosen { };
b67e4b493385a8 Arturs Artamonovs 2024-09-12   20  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   21  	aliases {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   22  		serial0 = &uart0;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   23  		serial2 = &uart2;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   24  		serial3 = &uart3;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   25  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   26  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   27  	cpus {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   28  		#address-cells = <0x2>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   29  		#size-cells = <0x0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   30  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   31  		cpu0: cpu@0 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   32  			device_type = "cpu";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   33  			compatible = "arm,cortex-a55";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   34  			reg = <0x0 0x0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   35  			enable-method = "spin-table";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   36  			cpu-release-addr = <0x0 0xdeadbeef>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   37  			clocks = <&clk ADSP_SC598_CLK_ARM>, <&clk ADSP_SC598_CLK_DDR>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   38  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   39  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   40  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   41  	pmu {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   42  		compatible = "arm,armv8-pmuv3";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   43  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   44  		interrupt-parent = <&gic>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   45  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   46  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   47  	gic: interrupt-controller@31200000 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   48  		compatible = "arm,gic-v3";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   49  		#interrupt-cells = <3>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   50  		interrupt-controller;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   51  		reg = <0x31200000 0x40000>, /* GIC Dist */
b67e4b493385a8 Arturs Artamonovs 2024-09-12   52  		      <0x31240000 0x40000>; /* GICR */
b67e4b493385a8 Arturs Artamonovs 2024-09-12   53  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   54  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   55  	timer {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   56  		compatible = "arm,armv8-timer";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   57  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
b67e4b493385a8 Arturs Artamonovs 2024-09-12   58  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
b67e4b493385a8 Arturs Artamonovs 2024-09-12   59  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
b67e4b493385a8 Arturs Artamonovs 2024-09-12   60  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
b67e4b493385a8 Arturs Artamonovs 2024-09-12   61  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   62  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   63  	clocks {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  @64  		sys_clkin0: oscillator@1 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   65  			compatible = "fixed-clock";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   66  			#clock-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   67  			clock-frequency = <25000000>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   68  			clock-output-names = "sys_clkin0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   69  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   70  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   71  		sys_clkin1: oscillator@2 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   72  			compatible = "fixed-clock";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   73  			#clock-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   74  			clock-frequency = <25000000>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   75  			clock-output-names = "sys_clkin1";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   76  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   77  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   78  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   79  	clk: clocks@3108d000 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   80  		compatible = "adi,sc598-clocks";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   81  		reg = <0x3108d000 0x1000>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12   82  		      <0x3108e000 0x1000>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12   83  		      <0x3108f000 0x1000>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12   84  		      <0x310a9000 0x1000>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   85  		#clock-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   86  		clocks = <&sys_clkin0>, <&sys_clkin1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   87  		clock-names = "sys_clkin0", "sys_clkin1";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   88  		status = "okay";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   89  	};
b67e4b493385a8 Arturs Artamonovs 2024-09-12   90  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   91  	scb: scb-bus {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   92  		compatible = "simple-bus";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   93  		#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   94  		#size-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   95  		ranges;
b67e4b493385a8 Arturs Artamonovs 2024-09-12   96  
b67e4b493385a8 Arturs Artamonovs 2024-09-12   97  		rcu: rcu@3108c000 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12   98  			compatible = "adi,reset-controller";
b67e4b493385a8 Arturs Artamonovs 2024-09-12   99  			reg = <0x3108c000 0x1000>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  100  			status = "okay";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  101  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  102  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  103  		sec: sec@31089000 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  104  			compatible = "adi,system-event-controller";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  105  			reg = <0x31089000 0x1000>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  106  			adi,rcu = <&rcu>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  107  			status = "okay";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  108  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  109  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  110  		uart0: uart@31003000 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  111  			compatible = "adi,uart";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  112  			reg = <0x31003000 0x40>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  113  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  114  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  115  			interrupt-parent = <&gic>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  116  			interrupt-names = "tx", "rx", "status";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  117  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  118  				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  119  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  120  			adi,use-edbo;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  121  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  122  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  123  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  124  		uart1: uart@31003400 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  125  			compatible = "adi,uart";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  126  			reg = <0x31003400 0x40>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  127  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  128  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  129  			interrupt-parent = <&gic>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  130  			interrupt-names = "tx", "rx", "status";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  131  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  132  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  133  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  134  			adi,use-edbo;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  135  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  136  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  137  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  138  		uart2: uart@31003800 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  139  			compatible = "adi,uart";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  140  			reg = <0x31003800 0x40>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  141  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  142  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  143  			interrupt-parent = <&gic>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  144  			interrupt-names = "tx", "rx", "status";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  145  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  146  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  147  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  148  			adi,use-edbo;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  149  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  150  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  151  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  152  		uart3: uart@31003c00 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  153  			compatible = "adi,uart";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  154  			reg = <0x31003C00 0x40>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  155  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  156  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  157  			interrupt-parent = <&gic>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  158  			interrupt-names = "tx", "rx", "status";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  159  			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  160  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
b67e4b493385a8 Arturs Artamonovs 2024-09-12  161  				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  162  			adi,use-edbo;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  163  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  164  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  165  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  166  		i2c0: twi@31001400 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  167  			#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  168  			#size-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  169  			compatible = "adi,twi";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  170  			reg = <0x31001400 0xFF>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  171  			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  172  			clock-khz = <100>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  173  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  174  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  175  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  176  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  177  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  178  		i2c1: twi@31001500 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  179  			#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  180  			#size-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  181  			compatible = "adi,twi";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  182  			reg = <0x31001500 0xFF>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  183  			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  184  			clock-khz = <100>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  185  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  186  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  187  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  188  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  189  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  190  		i2c3: twi@31001000 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  191  			#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  192  			#size-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  193  			compatible = "adi,twi";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  194  			reg = <0x31001000 0xFF>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  195  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  196  			clock-khz = <100>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  197  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  198  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  199  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  200  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  201  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  202  		i2c4: twi@31001100 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  203  			#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  204  			#size-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  205  			compatible = "adi,twi";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  206  			reg = <0x31001100 0xFF>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  207  			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  208  			clock-khz = <100>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  209  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  210  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  211  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  212  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  213  
b67e4b493385a8 Arturs Artamonovs 2024-09-12  214  		i2c5: twi@31001200 {
b67e4b493385a8 Arturs Artamonovs 2024-09-12  215  			#address-cells = <1>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  216  			#size-cells = <0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  217  			compatible = "adi,twi";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  218  			reg = <0x31001200 0xFF>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  219  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  220  			clock-khz = <100>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  221  			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
b67e4b493385a8 Arturs Artamonovs 2024-09-12  222  			clock-names = "sclk0";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  223  			status = "disabled";
b67e4b493385a8 Arturs Artamonovs 2024-09-12  224  		};
b67e4b493385a8 Arturs Artamonovs 2024-09-12  225  
b67e4b493385a8 Arturs Artamonovs 2024-09-12 @226  		pinctrl0: pinctrl@31004600 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
