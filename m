Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023A214A6C
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156460; cv=none; b=PGhecJTGmQonLS44OOYFlkaAvnh43YOORQZjQEWmUkwybAYCa4oE4NDX3zHE2xpV+G6vti+BFW8zwHYJyoNE5YzGL6egQFtQKUvWgdzKcQ093xQiCywf/MPM04E7Mmfv1fFJ9tvMWQY343HJ1xFzZuBMGILztU8ZlzR9keTRHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156460; c=relaxed/simple;
	bh=EAT/EFjasQSWuVfvUzOAFd1uJY63D+x49tBzxtw33w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDMuL8tUI9my1/+0bHXVZEOXTx75Acak+bz0ilrBkuknLj9ovVkNuVPDfv5DqSj+q7qBL/+3lphwYdbkLCCq4P0Rp/h2g9YIzPcAgcc2YWG1jq8k8p4XDOK2EIktfbDmamrAaMBRQ1DPbwDronMuWLVhaB7HWgJfXnqhd6b5U68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYX4Kcgw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYX4Kcgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743156458; x=1774692458;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EAT/EFjasQSWuVfvUzOAFd1uJY63D+x49tBzxtw33w8=;
  b=CYX4Kcgw3pYxQAo2gL9EjdVetNZkUjvf7SocJwuDj2C0bnOkJ9LSBhiQ
   JQFDbFLUuiPCRJCBzr0jXXuI4bMvaf6nSZs15CZwcqr827ywOx4K4D9dS
   jyolzUJYowEd4QG0IrCJhC/CVSHKtuPCPUFz/Wz0ZnSmBFjA6LeGScICo
   xFaZsy3e7F0FQ3IMMjPesCinCI8xk0g2g43RnyLD7+NiYdUwVTPKpK2fD
   ONeGGqVPgBcos4gq4Bif1OnEFISQ6XyGHBwmhVC5wuRqV0JBRaEqUFluZ
   WKoVWOU2f/QW/80euDQzWemyqg9Nm1sVXGF/MRDKL24mzWTnyKDIbVpha
   g==;
X-CSE-ConnectionGUID: KYAxOXdsSvWT744fQq6fcQ==
X-CSE-MsgGUID: TnDTWvmMRfKiss/EiR19Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="47247403"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="47247403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:07:37 -0700
X-CSE-ConnectionGUID: a3O2U9/4SdS/uxTrkScrRg==
X-CSE-MsgGUID: 4MqwQ2zvQ1C/CUN9BbwsHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126220778"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Mar 2025 03:07:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty6cY-0007LC-2C;
	Fri, 28 Mar 2025 10:07:28 +0000
Date: Fri, 28 Mar 2025 18:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/bcmbca-peripherals-arm 13/14]
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi:284.3-29: Warning
 (reg_format): /dma-controller@ff859000:reg: property has invalid length (8
 bytes) (#address-cells == 2, #size-cells == 2)
Message-ID: <202503281836.nzlaNR1R-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/bcmbca-peripherals-arm
head:   80a24d5a52c1453c91f4424a44bfd717bdb76211
commit: 983eda6da7c29a7625f43e9934d519e20816464a [13/14] ARM64: dts: bcm6858: Add BCMBCA peripherals
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281836.nzlaNR1R-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281836.nzlaNR1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503281836.nzlaNR1R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi:284.3-29: Warning (reg_format): /dma-controller@ff859000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

vim +284 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi

e663e06bd3f21e Anand Gore          2022-06-01    8  
e663e06bd3f21e Anand Gore          2022-06-01    9  / {
e663e06bd3f21e Anand Gore          2022-06-01   10  	compatible = "brcm,bcm6858", "brcm,bcmbca";
e663e06bd3f21e Anand Gore          2022-06-01   11  	#address-cells = <2>;
e663e06bd3f21e Anand Gore          2022-06-01   12  	#size-cells = <2>;
e663e06bd3f21e Anand Gore          2022-06-01   13  
e663e06bd3f21e Anand Gore          2022-06-01   14  	interrupt-parent = <&gic>;
e663e06bd3f21e Anand Gore          2022-06-01   15  
e663e06bd3f21e Anand Gore          2022-06-01   16  	cpus {
e663e06bd3f21e Anand Gore          2022-06-01   17  		#address-cells = <2>;
e663e06bd3f21e Anand Gore          2022-06-01   18  		#size-cells = <0>;
e663e06bd3f21e Anand Gore          2022-06-01   19  
e663e06bd3f21e Anand Gore          2022-06-01   20  		B53_0: cpu@0 {
e663e06bd3f21e Anand Gore          2022-06-01   21  			compatible = "brcm,brahma-b53";
e663e06bd3f21e Anand Gore          2022-06-01   22  			device_type = "cpu";
e663e06bd3f21e Anand Gore          2022-06-01   23  			reg = <0x0 0x0>;
e663e06bd3f21e Anand Gore          2022-06-01   24  			next-level-cache = <&L2_0>;
e663e06bd3f21e Anand Gore          2022-06-01   25  			enable-method = "psci";
e663e06bd3f21e Anand Gore          2022-06-01   26  		};
e663e06bd3f21e Anand Gore          2022-06-01   27  
e663e06bd3f21e Anand Gore          2022-06-01   28  		B53_1: cpu@1 {
e663e06bd3f21e Anand Gore          2022-06-01   29  			compatible = "brcm,brahma-b53";
e663e06bd3f21e Anand Gore          2022-06-01   30  			device_type = "cpu";
e663e06bd3f21e Anand Gore          2022-06-01   31  			reg = <0x0 0x1>;
e663e06bd3f21e Anand Gore          2022-06-01   32  			next-level-cache = <&L2_0>;
e663e06bd3f21e Anand Gore          2022-06-01   33  			enable-method = "psci";
e663e06bd3f21e Anand Gore          2022-06-01   34  		};
e663e06bd3f21e Anand Gore          2022-06-01   35  
e663e06bd3f21e Anand Gore          2022-06-01   36  		B53_2: cpu@2 {
e663e06bd3f21e Anand Gore          2022-06-01   37  			compatible = "brcm,brahma-b53";
e663e06bd3f21e Anand Gore          2022-06-01   38  			device_type = "cpu";
e663e06bd3f21e Anand Gore          2022-06-01   39  			reg = <0x0 0x2>;
e663e06bd3f21e Anand Gore          2022-06-01   40  			next-level-cache = <&L2_0>;
e663e06bd3f21e Anand Gore          2022-06-01   41  			enable-method = "psci";
e663e06bd3f21e Anand Gore          2022-06-01   42  		};
e663e06bd3f21e Anand Gore          2022-06-01   43  
e663e06bd3f21e Anand Gore          2022-06-01   44  		B53_3: cpu@3 {
e663e06bd3f21e Anand Gore          2022-06-01   45  			compatible = "brcm,brahma-b53";
e663e06bd3f21e Anand Gore          2022-06-01   46  			device_type = "cpu";
e663e06bd3f21e Anand Gore          2022-06-01   47  			reg = <0x0 0x3>;
e663e06bd3f21e Anand Gore          2022-06-01   48  			next-level-cache = <&L2_0>;
e663e06bd3f21e Anand Gore          2022-06-01   49  			enable-method = "psci";
e663e06bd3f21e Anand Gore          2022-06-01   50  		};
e663e06bd3f21e Anand Gore          2022-06-01   51  		L2_0: l2-cache0 {
e663e06bd3f21e Anand Gore          2022-06-01   52  			compatible = "cache";
e567e58d6819ad Pierre Gondois      2022-11-22   53  			cache-level = <2>;
0709e55ed13e25 Krzysztof Kozlowski 2023-04-22   54  			cache-unified;
e663e06bd3f21e Anand Gore          2022-06-01   55  		};
e663e06bd3f21e Anand Gore          2022-06-01   56  	};
e663e06bd3f21e Anand Gore          2022-06-01   57  
e663e06bd3f21e Anand Gore          2022-06-01   58  	timer {
e663e06bd3f21e Anand Gore          2022-06-01   59  		compatible = "arm,armv8-timer";
e663e06bd3f21e Anand Gore          2022-06-01   60  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
e663e06bd3f21e Anand Gore          2022-06-01   61  			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
e663e06bd3f21e Anand Gore          2022-06-01   62  			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
e663e06bd3f21e Anand Gore          2022-06-01   63  			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
e663e06bd3f21e Anand Gore          2022-06-01   64  	};
e663e06bd3f21e Anand Gore          2022-06-01   65  
e663e06bd3f21e Anand Gore          2022-06-01   66  	pmu: pmu {
e663e06bd3f21e Anand Gore          2022-06-01   67  		compatible = "arm,armv8-pmuv3";
e663e06bd3f21e Anand Gore          2022-06-01   68  		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
e663e06bd3f21e Anand Gore          2022-06-01   69  			<GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
e663e06bd3f21e Anand Gore          2022-06-01   70  			<GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
e663e06bd3f21e Anand Gore          2022-06-01   71  			<GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
e663e06bd3f21e Anand Gore          2022-06-01   72  		interrupt-affinity = <&B53_0>, <&B53_1>,
e663e06bd3f21e Anand Gore          2022-06-01   73  			<&B53_2>, <&B53_3>;
e663e06bd3f21e Anand Gore          2022-06-01   74  	};
e663e06bd3f21e Anand Gore          2022-06-01   75  
e663e06bd3f21e Anand Gore          2022-06-01   76  	clocks: clocks {
e663e06bd3f21e Anand Gore          2022-06-01   77  		periph_clk:periph-clk {
e663e06bd3f21e Anand Gore          2022-06-01   78  			compatible = "fixed-clock";
e663e06bd3f21e Anand Gore          2022-06-01   79  			#clock-cells = <0>;
e663e06bd3f21e Anand Gore          2022-06-01   80  			clock-frequency = <200000000>;
e663e06bd3f21e Anand Gore          2022-06-01   81  		};
f5d83b714e304d William Zhang       2023-02-06   82  
f5d83b714e304d William Zhang       2023-02-06   83  		hsspi_pll: hsspi-pll {
f5d83b714e304d William Zhang       2023-02-06   84  			compatible = "fixed-clock";
f5d83b714e304d William Zhang       2023-02-06   85  			#clock-cells = <0>;
f5d83b714e304d William Zhang       2023-02-06   86  			clock-frequency = <400000000>;
f5d83b714e304d William Zhang       2023-02-06   87  		};
e663e06bd3f21e Anand Gore          2022-06-01   88  	};
e663e06bd3f21e Anand Gore          2022-06-01   89  
e663e06bd3f21e Anand Gore          2022-06-01   90  	psci {
e663e06bd3f21e Anand Gore          2022-06-01   91  		compatible = "arm,psci-0.2";
e663e06bd3f21e Anand Gore          2022-06-01   92  		method = "smc";
e663e06bd3f21e Anand Gore          2022-06-01   93  	};
e663e06bd3f21e Anand Gore          2022-06-01   94  
e663e06bd3f21e Anand Gore          2022-06-01   95  	axi@81000000 {
e663e06bd3f21e Anand Gore          2022-06-01   96  		compatible = "simple-bus";
e663e06bd3f21e Anand Gore          2022-06-01   97  		#address-cells = <1>;
e663e06bd3f21e Anand Gore          2022-06-01   98  		#size-cells = <1>;
e663e06bd3f21e Anand Gore          2022-06-01   99  		ranges = <0x0 0x0 0x81000000 0x8000>;
e663e06bd3f21e Anand Gore          2022-06-01  100  
e663e06bd3f21e Anand Gore          2022-06-01  101  		gic: interrupt-controller@1000 {
e663e06bd3f21e Anand Gore          2022-06-01  102  			compatible = "arm,gic-400";
e663e06bd3f21e Anand Gore          2022-06-01  103  			#interrupt-cells = <3>;
e663e06bd3f21e Anand Gore          2022-06-01  104  			interrupt-controller;
e663e06bd3f21e Anand Gore          2022-06-01  105  			reg = <0x1000 0x1000>, /* GICD */
e663e06bd3f21e Anand Gore          2022-06-01  106  				<0x2000 0x2000>, /* GICC */
e663e06bd3f21e Anand Gore          2022-06-01  107  				<0x4000 0x2000>, /* GICH */
e663e06bd3f21e Anand Gore          2022-06-01  108  				<0x6000 0x2000>; /* GICV */
e663e06bd3f21e Anand Gore          2022-06-01  109  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
e663e06bd3f21e Anand Gore          2022-06-01  110  					IRQ_TYPE_LEVEL_HIGH)>;
e663e06bd3f21e Anand Gore          2022-06-01  111  		};
e663e06bd3f21e Anand Gore          2022-06-01  112  	};
e663e06bd3f21e Anand Gore          2022-06-01  113  
983eda6da7c29a Linus Walleij       2025-03-27  114  	/* PERF Peripherals */
e663e06bd3f21e Anand Gore          2022-06-01  115  	bus@ff800000 {
e663e06bd3f21e Anand Gore          2022-06-01  116  		compatible = "simple-bus";
e663e06bd3f21e Anand Gore          2022-06-01  117  		#address-cells = <1>;
e663e06bd3f21e Anand Gore          2022-06-01  118  		#size-cells = <1>;
983eda6da7c29a Linus Walleij       2025-03-27  119  		ranges = <0x0 0x0 0xff800000 0x3000>;
e663e06bd3f21e Anand Gore          2022-06-01  120  
4f9fb09175e87a Rafał Miłecki       2022-11-03  121  		twd: timer-mfd@400 {
4f9fb09175e87a Rafał Miłecki       2022-11-03  122  			compatible = "brcm,bcm4908-twd", "simple-mfd", "syscon";
4f9fb09175e87a Rafał Miłecki       2022-11-03  123  			reg = <0x400 0x4c>;
4f9fb09175e87a Rafał Miłecki       2022-11-03  124  			ranges = <0x0 0x400 0x4c>;
4f9fb09175e87a Rafał Miłecki       2022-11-03  125  
4f9fb09175e87a Rafał Miłecki       2022-11-03  126  			#address-cells = <1>;
4f9fb09175e87a Rafał Miłecki       2022-11-03  127  			#size-cells = <1>;
4f9fb09175e87a Rafał Miłecki       2022-11-03  128  
4f9fb09175e87a Rafał Miłecki       2022-11-03  129  			timer@0 {
4f9fb09175e87a Rafał Miłecki       2022-11-03  130  				compatible = "brcm,bcm63138-timer";
4f9fb09175e87a Rafał Miłecki       2022-11-03  131  				reg = <0x0 0x28>;
4f9fb09175e87a Rafał Miłecki       2022-11-03  132  			};
4f9fb09175e87a Rafał Miłecki       2022-11-03  133  
4f9fb09175e87a Rafał Miłecki       2022-11-03  134  			watchdog@28 {
4f9fb09175e87a Rafał Miłecki       2022-11-03  135  				compatible = "brcm,bcm6345-wdt";
4f9fb09175e87a Rafał Miłecki       2022-11-03  136  				reg = <0x28 0x8>;
4f9fb09175e87a Rafał Miłecki       2022-11-03  137  			};
4f9fb09175e87a Rafał Miłecki       2022-11-03  138  		};
4f9fb09175e87a Rafał Miłecki       2022-11-03  139  
983eda6da7c29a Linus Walleij       2025-03-27  140  		/* GPIOs 0 .. 31 */
983eda6da7c29a Linus Walleij       2025-03-27  141  		gpio0: gpio@500 {
983eda6da7c29a Linus Walleij       2025-03-27  142  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  143  			reg = <0x500 0x04>, <0x520 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  144  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  145  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  146  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  147  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  148  		};
983eda6da7c29a Linus Walleij       2025-03-27  149  
983eda6da7c29a Linus Walleij       2025-03-27  150  		/* GPIOs 32 .. 63 */
983eda6da7c29a Linus Walleij       2025-03-27  151  		gpio1: gpio@504 {
983eda6da7c29a Linus Walleij       2025-03-27  152  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  153  			reg = <0x504 0x04>, <0x524 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  154  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  155  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  156  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  157  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  158  		};
983eda6da7c29a Linus Walleij       2025-03-27  159  
983eda6da7c29a Linus Walleij       2025-03-27  160  		/* GPIOs 64 .. 95 */
983eda6da7c29a Linus Walleij       2025-03-27  161  		gpio2: gpio@508 {
983eda6da7c29a Linus Walleij       2025-03-27  162  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  163  			reg = <0x508 0x04>, <0x528 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  164  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  165  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  166  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  167  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  168  		};
983eda6da7c29a Linus Walleij       2025-03-27  169  
983eda6da7c29a Linus Walleij       2025-03-27  170  		/* GPIOs 96 .. 127 */
983eda6da7c29a Linus Walleij       2025-03-27  171  		gpio3: gpio@50c {
983eda6da7c29a Linus Walleij       2025-03-27  172  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  173  			reg = <0x50c 0x04>, <0x52c 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  174  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  175  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  176  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  177  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  178  		};
983eda6da7c29a Linus Walleij       2025-03-27  179  
983eda6da7c29a Linus Walleij       2025-03-27  180  		/* GPIOs 128 .. 159 */
983eda6da7c29a Linus Walleij       2025-03-27  181  		gpio4: gpio@510 {
983eda6da7c29a Linus Walleij       2025-03-27  182  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  183  			reg = <0x510 0x04>, <0x530 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  184  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  185  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  186  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  187  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  188  		};
983eda6da7c29a Linus Walleij       2025-03-27  189  
983eda6da7c29a Linus Walleij       2025-03-27  190  		/* GPIOs 160 .. 191 */
983eda6da7c29a Linus Walleij       2025-03-27  191  		gpio5: gpio@514 {
983eda6da7c29a Linus Walleij       2025-03-27  192  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  193  			reg = <0x514 0x04>, <0x534 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  194  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  195  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  196  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  197  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  198  		};
983eda6da7c29a Linus Walleij       2025-03-27  199  
983eda6da7c29a Linus Walleij       2025-03-27  200  		/* GPIOs 192 .. 223 */
983eda6da7c29a Linus Walleij       2025-03-27  201  		gpio6: gpio@518 {
983eda6da7c29a Linus Walleij       2025-03-27  202  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  203  			reg = <0x518 0x04>, <0x538 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  204  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  205  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  206  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  207  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  208  		};
983eda6da7c29a Linus Walleij       2025-03-27  209  
983eda6da7c29a Linus Walleij       2025-03-27  210  		/* GPIOs 224 .. 255 */
983eda6da7c29a Linus Walleij       2025-03-27  211  		gpio7: gpio@51c {
983eda6da7c29a Linus Walleij       2025-03-27  212  			compatible = "brcm,bcm6345-gpio";
983eda6da7c29a Linus Walleij       2025-03-27  213  			reg = <0x51c 0x04>, <0x53c 0x04>;
983eda6da7c29a Linus Walleij       2025-03-27  214  			reg-names = "dirout", "dat";
983eda6da7c29a Linus Walleij       2025-03-27  215  			gpio-controller;
983eda6da7c29a Linus Walleij       2025-03-27  216  			#gpio-cells = <2>;
983eda6da7c29a Linus Walleij       2025-03-27  217  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  218  		};
983eda6da7c29a Linus Walleij       2025-03-27  219  
e663e06bd3f21e Anand Gore          2022-06-01  220  		uart0: serial@640 {
e663e06bd3f21e Anand Gore          2022-06-01  221  			compatible = "brcm,bcm6345-uart";
e663e06bd3f21e Anand Gore          2022-06-01  222  			reg = <0x640 0x18>;
e663e06bd3f21e Anand Gore          2022-06-01  223  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
e663e06bd3f21e Anand Gore          2022-06-01  224  			clocks = <&periph_clk>;
e663e06bd3f21e Anand Gore          2022-06-01  225  			clock-names = "refclk";
e663e06bd3f21e Anand Gore          2022-06-01  226  			status = "disabled";
e663e06bd3f21e Anand Gore          2022-06-01  227  		};
f5d83b714e304d William Zhang       2023-02-06  228  
983eda6da7c29a Linus Walleij       2025-03-27  229  		uart1: serial@660 {
983eda6da7c29a Linus Walleij       2025-03-27  230  			compatible = "brcm,bcm6345-uart";
983eda6da7c29a Linus Walleij       2025-03-27  231  			reg = <0x660 0x18>;
983eda6da7c29a Linus Walleij       2025-03-27  232  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
983eda6da7c29a Linus Walleij       2025-03-27  233  			clocks = <&periph_clk>;
983eda6da7c29a Linus Walleij       2025-03-27  234  			clock-names = "refclk";
983eda6da7c29a Linus Walleij       2025-03-27  235  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  236  		};
983eda6da7c29a Linus Walleij       2025-03-27  237  
983eda6da7c29a Linus Walleij       2025-03-27  238  		leds: led-controller@800 {
983eda6da7c29a Linus Walleij       2025-03-27  239  			#address-cells = <1>;
983eda6da7c29a Linus Walleij       2025-03-27  240  			#size-cells = <0>;
983eda6da7c29a Linus Walleij       2025-03-27  241  			compatible = "brcm,bcm63138-leds";
983eda6da7c29a Linus Walleij       2025-03-27  242  			reg = <0x800 0xdc>;
983eda6da7c29a Linus Walleij       2025-03-27  243  			status = "disabled";
983eda6da7c29a Linus Walleij       2025-03-27  244  		};
983eda6da7c29a Linus Walleij       2025-03-27  245  
983eda6da7c29a Linus Walleij       2025-03-27  246  		rng@b80 {
983eda6da7c29a Linus Walleij       2025-03-27  247  			compatible = "brcm,iproc-rng200";
983eda6da7c29a Linus Walleij       2025-03-27  248  			reg = <0xb80 0x28>;
983eda6da7c29a Linus Walleij       2025-03-27  249  			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
983eda6da7c29a Linus Walleij       2025-03-27  250  		};
983eda6da7c29a Linus Walleij       2025-03-27  251  
f5d83b714e304d William Zhang       2023-02-06  252  		hsspi: spi@1000 {
f5d83b714e304d William Zhang       2023-02-06  253  			#address-cells = <1>;
f5d83b714e304d William Zhang       2023-02-06  254  			#size-cells = <0>;
f5d83b714e304d William Zhang       2023-02-06  255  			compatible = "brcm,bcm6858-hsspi", "brcm,bcmbca-hsspi-v1.0";
f5d83b714e304d William Zhang       2023-02-06  256  			reg = <0x1000 0x600>;
f5d83b714e304d William Zhang       2023-02-06  257  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
f5d83b714e304d William Zhang       2023-02-06  258  			clocks = <&hsspi_pll &hsspi_pll>;
f5d83b714e304d William Zhang       2023-02-06  259  			clock-names = "hsspi", "pll";
f5d83b714e304d William Zhang       2023-02-06  260  			num-cs = <8>;
f5d83b714e304d William Zhang       2023-02-06  261  			status = "disabled";
f5d83b714e304d William Zhang       2023-02-06  262  		};
5319667c5ee2ec William Zhang       2024-02-22  263  
5319667c5ee2ec William Zhang       2024-02-22  264  		nand_controller: nand-controller@1800 {
5319667c5ee2ec William Zhang       2024-02-22  265  			#address-cells = <1>;
5319667c5ee2ec William Zhang       2024-02-22  266  			#size-cells = <0>;
5319667c5ee2ec William Zhang       2024-02-22  267  			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
5319667c5ee2ec William Zhang       2024-02-22  268  			reg = <0x1800 0x600>, <0x2000 0x10>;
5319667c5ee2ec William Zhang       2024-02-22  269  			reg-names = "nand", "nand-int-base";
5319667c5ee2ec William Zhang       2024-02-22  270  			status = "disabled";
5319667c5ee2ec William Zhang       2024-02-22  271  
5319667c5ee2ec William Zhang       2024-02-22  272  			nandcs: nand@0 {
5319667c5ee2ec William Zhang       2024-02-22  273  				compatible = "brcm,nandcs";
5319667c5ee2ec William Zhang       2024-02-22  274  				reg = <0>;
5319667c5ee2ec William Zhang       2024-02-22  275  			};
5319667c5ee2ec William Zhang       2024-02-22  276  		};
e663e06bd3f21e Anand Gore          2022-06-01  277  	};
983eda6da7c29a Linus Walleij       2025-03-27  278  
983eda6da7c29a Linus Walleij       2025-03-27  279  	/* This is NOT in the PERF1 Peripheral group on this SoC! */
983eda6da7c29a Linus Walleij       2025-03-27  280  	pl081_dma: dma-controller@ff859000 {
983eda6da7c29a Linus Walleij       2025-03-27  281  		compatible = "arm,pl081", "arm,primecell";
983eda6da7c29a Linus Walleij       2025-03-27  282  		// The magic B105F00D info is missing
983eda6da7c29a Linus Walleij       2025-03-27  283  		arm,primecell-periphid = <0x00041081>;
983eda6da7c29a Linus Walleij       2025-03-27 @284  		reg = <0xff859000 0x1000>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
