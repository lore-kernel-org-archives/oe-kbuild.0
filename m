Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D722D9EF0
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749930509; cv=none; b=MwfQo2OgrLroGkOA3J/Sycnxpxrck+tS6ai7AaHgcHzCy8NvozUZSLo9G+142ErVE7/tHNy+a1qJ0/QtrhOv2ai9DhTiuR1OEALFNUjs7NUwkSo8JN2/W67CAThzTkTwXDS2d7gkR9ROuUVrE8rPZfDzFRFPvSeR4cFUdCqYLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749930509; c=relaxed/simple;
	bh=nphl3WrVTmpkfDRLIRITFBujH8fmhhHt5x0Jn8Dkeeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPccdksBaBbACxhGqoOBt394H0dcg/bMxH4K01220Tt43Uf+avCMI4HAKo7EwkdvAq4AOSC4oiY8KYsYYHZ+RUmtnoMKEVfe+z8CoupDjG8C+osb0H/V0QZqPrWEcQJiY2WcyIpjmon3ik6/xzrh71I8broC1Kf1VoMPphroUPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErpDTqg5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErpDTqg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749930507; x=1781466507;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nphl3WrVTmpkfDRLIRITFBujH8fmhhHt5x0Jn8Dkeeo=;
  b=ErpDTqg5N0SD6nb4/DYZszGByzP9nBS6ETk0qK60va74VMofWZ5anhKN
   5WFxaPAzxSwR9/J0RvW4thDO8MH75OgbaKE1g9uVBvhMMBnIKE4aeuJ20
   RgkBwpoE9HYb3wlt44+tAqlNoqcHq1+Btvt/4EjNkY1TnJsYlS/JAomEe
   VGBK7A2AH+KkscvXw3rekeSNInxrgt6EMxQ36fKuWjmzPv+MrQhAVKf40
   jeJDXLnjvMRRNT68WrfhTDi9Y2MBPSRJaLWTAFq5O4rFufzapIF2zvTgN
   /e3HccDldF2C15j9ZFuulYfFboQKYsAFor2Q0cswBkI4sGUPZqQg9i7N9
   w==;
X-CSE-ConnectionGUID: dkTE6ddLQs+T6t9Rk/PEuQ==
X-CSE-MsgGUID: 4g4RYGk2THakvxEdByE2eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52103371"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52103371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 12:48:26 -0700
X-CSE-ConnectionGUID: jcvm2yXOS7+2+wZwzWMF2w==
X-CSE-MsgGUID: +T1DBXTUQ9O6lLBMkb2+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="179106717"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2025 12:48:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQWrW-000DoY-28;
	Sat, 14 Jun 2025 19:48:22 +0000
Date: Sun, 15 Jun 2025 03:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFT 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges
 to reflect hardware behavior
Message-ID: <202506150338.Mv6WyliL-lkp@intel.com>
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
In-Reply-To: <20250613-tmpv-v1-1-4023aa386d17@nxp.com>
References: <20250613-tmpv-v1-1-4023aa386d17@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-toshiba-Update-SoC-and-PCIe-ranges-to-reflect-hardware-behavior/20250614-053830
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250613-tmpv-v1-1-4023aa386d17%40nxp.com
patch subject: [PATCH RFT 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges to reflect hardware behavior
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-001-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150338.Mv6WyliL-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150338.Mv6WyliL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506150338.Mv6WyliL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:145.6-521.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

vim +145 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi

48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   15  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   16  / {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   17  	compatible = "toshiba,tmpv7708";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   18  	#address-cells = <2>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   19  	#size-cells = <2>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   20  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   21  	cpus {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   22  		#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   23  		#size-cells = <0>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   24  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   25  		cpu-map {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   26  			cluster0 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   27  				core0 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   28  					cpu = <&cpu0>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   29  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   30  				core1 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   31  					cpu = <&cpu1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   32  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   33  				core2 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   34  					cpu = <&cpu2>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   35  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   36  				core3 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   37  					cpu = <&cpu3>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   38  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   39  			};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   40  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   41  			cluster1 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   42  				core0 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   43  					cpu = <&cpu4>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   44  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   45  				core1 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   46  					cpu = <&cpu5>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   47  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   48  				core2 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   49  					cpu = <&cpu6>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   50  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   51  				core3 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   52  					cpu = <&cpu7>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   53  				};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   54  			};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   55  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   56  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   57  		cpu0: cpu@0 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   58  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   59  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   60  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   61  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   62  			reg = <0x00>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   63  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   64  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   65  		cpu1: cpu@1 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   66  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   67  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   68  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   69  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   70  			reg = <0x01>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   71  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   72  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   73  		cpu2: cpu@2 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   74  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   75  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   76  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   77  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   78  			reg = <0x02>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   79  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   80  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   81  		cpu3: cpu@3 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   82  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   83  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   84  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   85  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   86  			reg = <0x03>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   87  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   88  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   89  		cpu4: cpu@100 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   90  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   91  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   92  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   93  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   94  			reg = <0x100>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   95  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   96  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   97  		cpu5: cpu@101 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   98  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28   99  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  100  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  101  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  102  			reg = <0x101>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  103  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  104  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  105  		cpu6: cpu@102 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  106  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  107  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  108  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  109  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  110  			reg = <0x102>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  111  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  112  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  113  		cpu7: cpu@103 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  114  			compatible = "arm,cortex-a53";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  115  			device_type = "cpu";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  116  			enable-method = "spin-table";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  117  			cpu-release-addr = <0x0 0x81100000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  118  			reg = <0x103>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  119  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  120  	};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  121  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  122  	timer {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  123  		compatible = "arm,armv8-timer";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  124  		interrupt-parent = <&gic>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  125  		interrupts =
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  126  			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  127  			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  128  			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  129  			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  130  	};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  131  
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  132  	extclk100mhz: extclk100mhz {
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  133  		compatible = "fixed-clock";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  134  		#clock-cells = <0>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  135  		clock-frequency = <100000000>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  136  		clock-output-names = "extclk100mhz";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  137  	};
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  138  
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  139  	osc2_clk: osc2-clk {
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  140  		compatible = "fixed-clock";
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  141  		clock-frequency = <20000000>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  142  		#clock-cells = <0>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  143  	};
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  144  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28 @145  	soc {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  146  		#address-cells = <2>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  147  		#size-cells = <2>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  148  		compatible = "simple-bus";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  149  		interrupt-parent = <&gic>;
b8f8d534a97f60 Frank Li          2025-06-13  150  		ranges = /* register 1:1 map */
b8f8d534a97f60 Frank Li          2025-06-13  151  			 <0x0 0x24000000 0x0 0x24000000 0x0 0x10000000>,
b8f8d534a97f60 Frank Li          2025-06-13  152  			 /*
b8f8d534a97f60 Frank Li          2025-06-13  153  			  * bus fabric mask address bit 30 and 31 to 0
b8f8d534a97f60 Frank Li          2025-06-13  154  			  * before send to PCIe controller.
b8f8d534a97f60 Frank Li          2025-06-13  155  			  *
b8f8d534a97f60 Frank Li          2025-06-13  156  			  * PCIe map address 0 to cpu's 0x40000000
b8f8d534a97f60 Frank Li          2025-06-13  157  			  */
b8f8d534a97f60 Frank Li          2025-06-13  158  			 <0x0 0x00000000 0x0 0x40000000 0x0 0x40000000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  159  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  160  		gic: interrupt-controller@24001000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  161  			compatible = "arm,gic-400";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  162  			interrupt-controller;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  163  			#interrupt-cells = <3>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  164  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  165  			reg = <0 0x24001000 0 0x1000>,
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  166  			      <0 0x24002000 0 0x2000>,
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  167  			      <0 0x24004000 0 0x2000>,
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  168  			      <0 0x24006000 0 0x2000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  169  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  170  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  171  		pmux: pmux@24190000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  172  			compatible = "toshiba,tmpv7708-pinctrl";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  173  			reg = <0 0x24190000 0 0x10000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  174  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  175  
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  176  		gpio: gpio@28020000 {
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  177  			compatible = "toshiba,gpio-tmpv7708";
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  178  			reg = <0 0x28020000 0 0x1000>;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  179  			#gpio-cells = <0x2>;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  180  			gpio-ranges = <&pmux 0 0 32>;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  181  			gpio-controller;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  182  			interrupt-controller;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  183  			#interrupt-cells = <2>;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  184  			interrupt-parent = <&gic>;
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  185  		};
0109a17564fc75 Nobuhiro Iwamatsu 2020-12-17  186  
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  187  		pipllct: clock-controller@24220000 {
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  188  			compatible = "toshiba,tmpv7708-pipllct";
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  189  			reg = <0 0x24220000 0 0x820>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  190  			#clock-cells = <1>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  191  			clocks = <&osc2_clk>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  192  		};
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  193  
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  194  		pismu: syscon@24200000 {
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  195  			compatible = "toshiba,tmpv7708-pismu", "syscon";
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  196  			reg = <0 0x24200000 0 0x2140>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  197  			#clock-cells = <1>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  198  			#reset-cells = <1>;
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  199  		};
34f7c6e7d43960 Nobuhiro Iwamatsu 2021-04-20  200  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  201  		uart0: serial@28200000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  202  			compatible = "arm,pl011", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  203  			reg = <0 0x28200000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  204  			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  205  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  206  			pinctrl-0 = <&uart0_pins>;
6e7fd890f1d6ac Rob Herring       2024-08-26  207  			clocks = <&pismu TMPV770X_CLK_PIUART0>, <&pismu TMPV770X_CLK_PIUART0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  208  			clock-names = "uartclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  209  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  210  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  211  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  212  		uart1: serial@28201000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  213  			compatible = "arm,pl011", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  214  			reg = <0 0x28201000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  215  			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  216  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  217  			pinctrl-0 = <&uart1_pins>;
6e7fd890f1d6ac Rob Herring       2024-08-26  218  			clocks = <&pismu TMPV770X_CLK_PIUART1>, <&pismu TMPV770X_CLK_PIUART1>;
6e7fd890f1d6ac Rob Herring       2024-08-26  219  			clock-names = "uartclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  220  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  221  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  222  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  223  		uart2: serial@28202000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  224  			compatible = "arm,pl011", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  225  			reg = <0 0x28202000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  226  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  227  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  228  			pinctrl-0 = <&uart2_pins>;
6e7fd890f1d6ac Rob Herring       2024-08-26  229  			clocks = <&pismu TMPV770X_CLK_PIUART2>, <&pismu TMPV770X_CLK_PIUART2>;
6e7fd890f1d6ac Rob Herring       2024-08-26  230  			clock-names = "uartclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  231  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  232  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  233  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  234  		uart3: serial@28203000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  235  			compatible = "arm,pl011", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  236  			reg = <0 0x28203000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  237  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  238  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  239  			pinctrl-0 = <&uart3_pins>;
6e7fd890f1d6ac Rob Herring       2024-08-26  240  			clocks = <&pismu TMPV770X_CLK_PIUART2>, <&pismu TMPV770X_CLK_PIUART2>;
6e7fd890f1d6ac Rob Herring       2024-08-26  241  			clock-names = "uartclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  242  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  243  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  244  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  245  		i2c0: i2c@28030000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  246  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  247  			reg = <0 0x28030000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  248  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  249  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  250  			pinctrl-0 = <&i2c0_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  251  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  252  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  253  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  254  			clocks = <&pismu TMPV770X_CLK_PII2C0>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  255  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  256  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  257  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  258  		i2c1: i2c@28031000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  259  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  260  			reg = <0 0x28031000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  261  			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  262  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  263  			pinctrl-0 = <&i2c1_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  264  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  265  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  266  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  267  			clocks = <&pismu TMPV770X_CLK_PII2C1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  268  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  269  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  270  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  271  		i2c2: i2c@28032000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  272  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  273  			reg = <0 0x28032000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  274  			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  275  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  276  			pinctrl-0 = <&i2c2_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  277  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  278  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  279  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  280  			clocks = <&pismu TMPV770X_CLK_PII2C2>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  281  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  282  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  283  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  284  		i2c3: i2c@28033000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  285  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  286  			reg = <0 0x28033000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  287  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  288  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  289  			pinctrl-0 = <&i2c3_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  290  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  291  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  292  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  293  			clocks = <&pismu TMPV770X_CLK_PII2C3>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  294  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  295  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  296  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  297  		i2c4: i2c@28034000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  298  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  299  			reg = <0 0x28034000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  300  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  301  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  302  			pinctrl-0 = <&i2c4_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  303  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  304  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  305  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  306  			clocks = <&pismu TMPV770X_CLK_PII2C4>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  307  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  308  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  309  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  310  		i2c5: i2c@28035000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  311  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  312  			reg = <0 0x28035000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  313  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  314  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  315  			pinctrl-0 = <&i2c5_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  316  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  317  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  318  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  319  			clocks = <&pismu TMPV770X_CLK_PII2C5>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  320  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  321  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  322  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  323  		i2c6: i2c@28036000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  324  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  325  			reg = <0 0x28036000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  326  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  327  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  328  			pinctrl-0 = <&i2c6_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  329  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  330  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  331  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  332  			clocks = <&pismu TMPV770X_CLK_PII2C6>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  333  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  334  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  335  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  336  		i2c7: i2c@28037000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  337  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  338  			reg = <0 0x28037000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  339  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  340  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  341  			pinctrl-0 = <&i2c7_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  342  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  343  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  344  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  345  			clocks = <&pismu TMPV770X_CLK_PII2C7>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  346  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  347  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  348  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  349  		i2c8: i2c@28038000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  350  			compatible = "snps,designware-i2c";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  351  			reg = <0 0x28038000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  352  			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  353  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  354  			pinctrl-0 = <&i2c8_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  355  			clock-frequency = <400000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  356  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  357  			#size-cells = <0>;
0e7cd4395be5f4 Nobuhiro Iwamatsu 2022-04-21  358  			clocks = <&pismu TMPV770X_CLK_PII2C8>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  359  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  360  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  361  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  362  		spi0: spi@28140000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  363  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  364  			reg = <0 0x28140000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  365  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  366  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  367  			pinctrl-0 = <&spi0_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  368  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  369  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  370  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  371  			clocks = <&pismu TMPV770X_CLK_PISPI1>, <&pismu TMPV770X_CLK_PISPI1>;
6e7fd890f1d6ac Rob Herring       2024-08-26  372  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  373  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  374  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  375  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  376  		spi1: spi@28141000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  377  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  378  			reg = <0 0x28141000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  379  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  380  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  381  			pinctrl-0 = <&spi1_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  382  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  383  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  384  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  385  			clocks = <&pismu TMPV770X_CLK_PISPI1>, <&pismu TMPV770X_CLK_PISPI1>;
6e7fd890f1d6ac Rob Herring       2024-08-26  386  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  387  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  388  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  389  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  390  		spi2: spi@28142000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  391  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  392  			reg = <0 0x28142000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  393  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  394  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  395  			pinctrl-0 = <&spi2_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  396  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  397  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  398  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  399  			clocks = <&pismu TMPV770X_CLK_PISPI2>, <&pismu TMPV770X_CLK_PISPI2>;
6e7fd890f1d6ac Rob Herring       2024-08-26  400  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  401  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  402  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  403  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  404  		spi3: spi@28143000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  405  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  406  			reg = <0 0x28143000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  407  			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  408  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  409  			pinctrl-0 = <&spi3_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  410  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  411  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  412  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  413  			clocks = <&pismu TMPV770X_CLK_PISPI3>, <&pismu TMPV770X_CLK_PISPI3>;
6e7fd890f1d6ac Rob Herring       2024-08-26  414  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  415  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  416  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  417  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  418  		spi4: spi@28144000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  419  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  420  			reg = <0 0x28144000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  421  			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  422  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  423  			pinctrl-0 = <&spi4_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  424  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  425  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  426  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  427  			clocks = <&pismu TMPV770X_CLK_PISPI4>, <&pismu TMPV770X_CLK_PISPI4>;
6e7fd890f1d6ac Rob Herring       2024-08-26  428  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  429  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  430  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  431  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  432  		spi5: spi@28145000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  433  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  434  			reg = <0 0x28145000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  435  			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  436  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  437  			pinctrl-0 = <&spi5_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  438  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  439  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  440  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  441  			clocks = <&pismu TMPV770X_CLK_PISPI5>, <&pismu TMPV770X_CLK_PISPI5>;
6e7fd890f1d6ac Rob Herring       2024-08-26  442  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  443  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  444  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  445  
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  446  		spi6: spi@28146000 {
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  447  			compatible = "arm,pl022", "arm,primecell";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  448  			reg = <0 0x28146000 0 0x1000>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  449  			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  450  			pinctrl-names = "default";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  451  			pinctrl-0 = <&spi6_pins>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  452  			num-cs = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  453  			#address-cells = <1>;
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  454  			#size-cells = <0>;
6e7fd890f1d6ac Rob Herring       2024-08-26  455  			clocks = <&pismu TMPV770X_CLK_PISPI6>, <&pismu TMPV770X_CLK_PISPI6>;
6e7fd890f1d6ac Rob Herring       2024-08-26  456  			clock-names = "sspclk", "apb_pclk";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  457  			status = "disabled";
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  458  		};
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  459  
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  460  		piether: ethernet@28000000 {
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  461  			compatible = "toshiba,visconti-dwmac", "snps,dwmac-4.20a";
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  462  			reg = <0 0x28000000 0 0x10000>;
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  463  			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  464  			interrupt-names = "macirq";
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  465  			snps,txpbl = <4>;
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  466  			snps,rxpbl = <4>;
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  467  			snps,tso;
c8a93f913109e5 Nobuhiro Iwamatsu 2022-04-22  468  			clocks = <&pismu TMPV770X_CLK_PIETHER_BUS>, <&pismu TMPV770X_CLK_PIETHER_125M>;
c8a93f913109e5 Nobuhiro Iwamatsu 2022-04-22  469  			clock-names = "stmmaceth", "phy_ref_clk";
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  470  			status = "disabled";
ec8a42e7343234 Nobuhiro Iwamatsu 2021-02-16  471  		};
82851fce6107d5 Linus Torvalds    2021-02-20  472  
4fd18fc3875721 Nobuhiro Iwamatsu 2020-12-01  473  		wdt: wdt@28330000 {
4fd18fc3875721 Nobuhiro Iwamatsu 2020-12-01  474  			compatible = "toshiba,visconti-wdt";
4fd18fc3875721 Nobuhiro Iwamatsu 2020-12-01  475  			reg = <0 0x28330000 0 0x1000>;
27b754902dab93 Nobuhiro Iwamatsu 2022-04-21  476  			clocks = <&pismu TMPV770X_CLK_WDTCLK>;
4fd18fc3875721 Nobuhiro Iwamatsu 2020-12-01  477  			status = "disabled";
4fd18fc3875721 Nobuhiro Iwamatsu 2020-12-01  478  		};
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  479  
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  480  		pwm: pwm@241c0000 {
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  481  			compatible = "toshiba,visconti-pwm";
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  482  			reg = <0 0x241c0000 0 0x1000>;
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  483  			pinctrl-names = "default";
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  484  			pinctrl-0 = <&pwm_mux>;
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  485  			#pwm-cells = <2>;
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  486  			status = "disabled";
172cdcaefea5c2 Nobuhiro Iwamatsu 2021-06-08  487  		};
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  488  
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  489  		pcie: pcie@28400000 {
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  490  			compatible = "toshiba,visconti-pcie";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  491  			reg = <0x0 0x28400000 0x0 0x00400000>,
b8f8d534a97f60 Frank Li          2025-06-13  492  			      <0x0 0x30000000 0x0 0x10000000>,
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  493  			      <0x0 0x28050000 0x0 0x00010000>,
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  494  			      <0x0 0x24200000 0x0 0x00002000>,
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  495  			      <0x0 0x24162000 0x0 0x00001000>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  496  			reg-names = "dbi", "config", "ulreg", "smu", "mpu";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  497  			device_type = "pci";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  498  			bus-range = <0x00 0xff>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  499  			num-lanes = <2>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  500  			num-viewport = <8>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  501  
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  502  			#address-cells = <3>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  503  			#size-cells = <2>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  504  			#interrupt-cells = <1>;
b8f8d534a97f60 Frank Li          2025-06-13  505  			ranges = <0x81000000 0 0x00000000 0 0x00000000 0 0x00010000
b8f8d534a97f60 Frank Li          2025-06-13  506  				  0x82000000 0 0x10000000 0 0x10000000 0 0x20000000>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  507  			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  508  				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  509  			interrupt-names = "msi", "intr";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  510  			interrupt-map-mask = <0 0 0 7>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  511  			interrupt-map =
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  512  				<0 0 0 1 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  513  				 0 0 0 2 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  514  				 0 0 0 3 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  515  				 0 0 0 4 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  516  			max-link-speed = <2>;
5d3b6ede2c6c80 Nobuhiro Iwamatsu 2022-04-21  517  			clocks = <&extclk100mhz>, <&pismu TMPV770X_CLK_PCIE_MSTR>, <&pismu TMPV770X_CLK_PCIE_AUX>;
5d3b6ede2c6c80 Nobuhiro Iwamatsu 2022-04-21  518  			clock-names = "ref", "core", "aux";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  519  			status = "disabled";
6beeaf48db6c54 Nobuhiro Iwamatsu 2021-09-07  520  		};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  521  	};
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  522  };
48dea9a700c872 Nobuhiro Iwamatsu 2020-04-28  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
