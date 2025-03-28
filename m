Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B0C1DDA20
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158415; cv=none; b=E9vhPzdJFo0MenjJYP3tT2NmdfFw2H4NMY3vk0I0Ik2IQEUHt/Ya3c/G4v4veXAnVNpf6HT/GWDk+/6nK2mX8jzYp4q8fJfjNlVo83WGdcN7oWNs7hWPa4SkJ/gYYH0grm192zPywtekK1b1fPNkfcEKRRtj2q24meZtb2ua28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158415; c=relaxed/simple;
	bh=IfQU92e0oJuHarAGnYm/CbElx11fVOs5oY/Z6qqJ7Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hh2SaT07zFsUX6Pa6MJX+qLt+U1hoMcIM6mcMjnuFHbNxk+VvnYuhoIz8V9LqlPrfxYvZE+NpRzgCzlMhrBPerPaDlmA1/sLLXBCm83rjw/QczfEgNnpR5cjl9LJOqai8ekPmUXerVswXW/d+ix8PQjkmctCd/YILJcV13KnbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHk86CBo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHk86CBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743158413; x=1774694413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfQU92e0oJuHarAGnYm/CbElx11fVOs5oY/Z6qqJ7Ak=;
  b=LHk86CBoOWObK1pN+CebrKy92N/Wua+m3+Aye7/EhJGDhKza7ywc7m3H
   sgIsOaREnCwwvBBYW84Hcr4l7a2Sokd14h50yNd1i8jWl6Au27hc9KLvy
   1KOc/VyeIdTyu0WhJ4bchFZJMk6wJ0I6NNRqKobSraX8IEKYbpNK3fDgI
   rAU+mNweO9tjbcNwlOCF6gDoAA++DrAhXebRI38jM/2zKDPHA5EL9Ixlw
   5j+L5W+8ZEYCibGn6yPfXgAJHWNeG57m38YXDe2RuCChqed4PQ2KSTDTV
   3QWyq3UxKIYBLBM6tNYW7QaLwQ+vl42TNqXl/fuLyAQYKYO9CMRvnzJCv
   Q==;
X-CSE-ConnectionGUID: 9U38EbOCTtWB17HB0/ZxyQ==
X-CSE-MsgGUID: ror2b5bFRP+2REYNYudIVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44432216"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44432216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:40:12 -0700
X-CSE-ConnectionGUID: 2PNB9PTaQ9+d7Ijz9Fj+CA==
X-CSE-MsgGUID: m8Nki8vzTkGYf2oO9wryfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126335942"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2025 03:40:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty77x-0007Mk-0A;
	Fri, 28 Mar 2025 10:39:58 +0000
Date: Fri, 28 Mar 2025 18:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/bcmbca-peripherals-arm 8/14]
 arch/arm/boot/dts/broadcom/bcm63138.dtsi:195.19-202.5: Warning
 (simple_bus_reg): /ubus@fffe8000/gpio@100: simple-bus unit address format
 error, expected "500"
Message-ID: <202503281859.tKeV2V9T-lkp@intel.com>
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
commit: 08fe20974d426b4a99da0d6ad0b2badf0b6ef5a4 [8/14] ARM: dts: bcm63138: Add BCMBCA peripherals
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago
config: arm-randconfig-052-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281859.tKeV2V9T-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281859.tKeV2V9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503281859.tKeV2V9T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm63138.dtsi:195.19-202.5: Warning (simple_bus_reg): /ubus@fffe8000/gpio@100: simple-bus unit address format error, expected "500"
   arch/arm/boot/dts/broadcom/bcm63138.dtsi:328.10-333.5: Warning (simple_bus_reg): /ubus@fffe8000/reboot: missing or empty reg/ranges property
   arch/arm/boot/dts/broadcom/bcm963138.dtb: armpll@20000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: armpll@20000: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: reset-controller@4800c0: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: reset-controller@4800c0: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: reset-controller@4800e0: '#power-domain-cells' is a required property
--
>> arch/arm/boot/dts/broadcom/bcm63138.dtsi:195.19-202.5: Warning (simple_bus_reg): /ubus@fffe8000/gpio@100: simple-bus unit address format error, expected "500"
   arch/arm/boot/dts/broadcom/bcm63138.dtsi:328.10-333.5: Warning (simple_bus_reg): /ubus@fffe8000/reboot: missing or empty reg/ranges property
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: armpll@20000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: armpll@20000: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: reset-controller@4800c0: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: reset-controller@4800c0: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: reset-controller@4800e0: '#power-domain-cells' is a required property

vim +/500 +195 arch/arm/boot/dts/broadcom/bcm63138.dtsi

46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20    8  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20    9  / {
abe60a3a7afb40 arch/arm/boot/dts/bcm63138.dtsi          Rob Herring      2019-01-09   10  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/bcm63138.dtsi          Rob Herring      2019-01-09   11  	#size-cells = <1>;
a82291fce8aa58 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2022-07-07   12  	compatible = "brcm,bcm63138", "brcm,bcmbca";
a82291fce8aa58 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2022-07-07   13  	model = "Broadcom BCM963138 Reference Board";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   14  	interrupt-parent = <&gic>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   15  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   16  	aliases {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   17  		uart0 = &serial0;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   18  		uart1 = &serial1;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   19  	};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   20  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   21  	cpus {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   22  		#address-cells = <1>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   23  		#size-cells = <0>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   24  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   25  		cpu@0 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   26  			device_type = "cpu";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   27  			compatible = "arm,cortex-a9";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   28  			next-level-cache = <&L2>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   29  			reg = <0>;
9f98802911cf78 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-17   30  			enable-method = "brcm,bcm63138";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   31  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   32  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   33  		cpu@1 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   34  			device_type = "cpu";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   35  			compatible = "arm,cortex-a9";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   36  			next-level-cache = <&L2>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   37  			reg = <1>;
9f98802911cf78 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-17   38  			enable-method = "brcm,bcm63138";
9f98802911cf78 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-17   39  			resets = <&pmb0 4 1>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   40  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   41  	};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   42  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   43  	clocks {
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   44  		/* UBUS peripheral clock */
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   45  		periph_clk: periph_clk {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   46  			#clock-cells = <0>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   47  			compatible = "fixed-clock";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   48  			clock-frequency = <50000000>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   49  			clock-output-names = "periph";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   50  		};
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   51  
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   52  		/* peripheral clock for system timer */
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   53  		axi_clk: axi_clk {
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   54  			#clock-cells = <0>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   55  			compatible = "fixed-factor-clock";
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   56  			clocks = <&armpll>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   57  			clock-div = <2>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   58  			clock-mult = <1>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   59  		};
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   60  
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   61  		/* APB bus clock */
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   62  		apb_clk: apb_clk {
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   63  			#clock-cells = <0>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   64  			compatible = "fixed-factor-clock";
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   65  			clocks = <&armpll>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   66  			clock-div = <4>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   67  			clock-mult = <1>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29   68  		};
7858dded8c1e98 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2023-02-06   69  
7858dded8c1e98 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2023-02-06   70  		hsspi_pll: hsspi-pll {
7858dded8c1e98 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2023-02-06   71  			compatible = "fixed-clock";
7858dded8c1e98 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2023-02-06   72  			#clock-cells = <0>;
7858dded8c1e98 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2023-02-06   73  			clock-frequency = <400000000>;
7858dded8c1e98 arch/arm/boot/dts/bcm63138.dtsi          William Zhang    2023-02-06   74  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   75  	};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   76  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   77  	/* ARM bus */
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   78  	axi@80000000 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   79  		compatible = "simple-bus";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   80  		ranges = <0 0x80000000 0x784000>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   81  		#address-cells = <1>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   82  		#size-cells = <1>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   83  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   84  		L2: cache-controller@1d000 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   85  			compatible = "arm,pl310-cache";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   86  			reg = <0x1d000 0x1000>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   87  			cache-unified;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   88  			cache-level = <2>;
9df11828d9b566 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-02-10   89  			cache-size = <524288>;
9df11828d9b566 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-02-10   90  			cache-sets = <1024>;
9df11828d9b566 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-02-10   91  			cache-line-size = <32>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   92  			interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   93  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   94  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   95  		scu: scu@1e000 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   96  			compatible = "arm,cortex-a9-scu";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   97  			reg = <0x1e000 0x100>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   98  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20   99  
f6bf17291d8fdc arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2019-05-28  100  		gic: interrupt-controller@1f000 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  101  			compatible = "arm,cortex-a9-gic";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  102  			reg = <0x1f000 0x1000
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  103  				0x1e100 0x100>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  104  			#interrupt-cells = <3>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  105  			#address-cells = <0>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  106  			interrupt-controller;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  107  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  108  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  109  		global_timer: timer@1e200 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  110  			compatible = "arm,cortex-a9-global-timer";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  111  			reg = <0x1e200 0x20>;
3ab97942d0213b arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2018-09-19  112  			interrupts = <GIC_PPI 11 IRQ_TYPE_EDGE_RISING>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  113  			clocks = <&axi_clk>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  114  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  115  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  116  		local_timer: local-timer@1e600 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  117  			compatible = "arm,cortex-a9-twd-timer";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  118  			reg = <0x1e600 0x20>;
3ab97942d0213b arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2018-09-19  119  			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
3ab97942d0213b arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2018-09-19  120  						  IRQ_TYPE_EDGE_RISING)>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  121  			clocks = <&axi_clk>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  122  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  123  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  124  		twd_watchdog: watchdog@1e620 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  125  			compatible = "arm,cortex-a9-twd-wdt";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  126  			reg = <0x1e620 0x20>;
3ab97942d0213b arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2018-09-19  127  			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
3ab97942d0213b arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2018-09-19  128  						  IRQ_TYPE_LEVEL_HIGH)>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  129  		};
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  130  
f6bf17291d8fdc arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2019-05-28  131  		armpll: armpll@20000 {
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  132  			#clock-cells = <0>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  133  			compatible = "brcm,bcm63138-armpll";
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  134  			clocks = <&periph_clk>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  135  			reg = <0x20000 0xf00>;
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  136  		};
511d30443a1c3e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-10-29  137  
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  138  		pmb0: reset-controller@4800c0 {
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  139  			compatible = "brcm,bcm63138-pmb";
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  140  			reg = <0x4800c0 0x10>;
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  141  			#reset-cells = <2>;
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  142  		};
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  143  
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  144  		pmb1: reset-controller@4800e0 {
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  145  			compatible = "brcm,bcm63138-pmb";
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  146  			reg = <0x4800e0 0x10>;
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  147  			#reset-cells = <2>;
39afb9809ca2da arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-16  148  		};
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  149  
f6bf17291d8fdc arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2019-05-28  150  		ahci: sata@a000 {
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  151  			compatible = "brcm,bcm63138-ahci", "brcm,sata3-ahci";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  152  			reg-names = "ahci", "top-ctrl";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  153  			reg = <0xa000 0x9ac>, <0x8040 0x24>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  154  			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  155  			#address-cells = <1>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  156  			#size-cells = <0>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  157  			resets = <&pmb0 3 1>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  158  			reset-names = "ahci";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  159  			status = "disabled";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  160  
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  161  			sata0: sata-port@0 {
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  162  				reg = <0>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  163  				phys = <&sata_phy0>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  164  			};
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  165  		};
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  166  
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  167  		sata_phy: sata-phy@8100 {
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  168  			compatible = "brcm,bcm63138-sata-phy", "brcm,phy-sata3";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  169  			reg = <0x8100 0x1e00>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  170  			reg-names = "phy";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  171  			#address-cells = <1>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  172  			#size-cells = <0>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  173  			status = "disabled";
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  174  
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  175  			sata_phy0: sata-phy@0 {
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  176  				reg = <0>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  177  				#phy-cells = <0>;
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  178  			};
2af764dfb5eec7 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-03-20  179  		};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  180  	};
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  181  
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  182  	/* Legacy UBUS base */
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  183  	ubus@fffe8000 {
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  184  		compatible = "simple-bus";
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  185  		#address-cells = <1>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  186  		#size-cells = <1>;
08fe20974d426b arch/arm/boot/dts/broadcom/bcm63138.dtsi Linus Walleij    2025-03-27  187  		ranges = <0 0xfffe8000 0x10000>;
46d4bca0445a05 arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2014-02-20  188  
8ab1428864d39e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-23  189  		timer: timer@80 {
8ab1428864d39e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-23  190  			compatible = "brcm,bcm6328-timer", "syscon";
8ab1428864d39e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-23  191  			reg = <0x80 0x3c>;
8ab1428864d39e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-23  192  		};
8ab1428864d39e arch/arm/boot/dts/bcm63138.dtsi          Florian Fainelli 2015-04-23  193  
08fe20974d426b arch/arm/boot/dts/broadcom/bcm63138.dtsi Linus Walleij    2025-03-27  194  		/* GPIOs 0 .. 31 */
08fe20974d426b arch/arm/boot/dts/broadcom/bcm63138.dtsi Linus Walleij    2025-03-27 @195  		gpio0: gpio@100 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
