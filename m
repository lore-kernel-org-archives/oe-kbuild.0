Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE513AD0
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907708; cv=none; b=Moftwlg+NivAe7xoohp2kjTpMk7pSXBAnHzbxqjJ84tr0+Jnr+3oOA5GTjEOuAo/9S4ak2mkSHK3bHhxjoqE9LpKAi5QtPzlQy8EnNbxBdw6iZ3AcvqWKWsJJjsI9NUsPlKLwyVxgaPLPYEr3N7busD/keK+gbMTVssUdEr9cdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907708; c=relaxed/simple;
	bh=NIe1R77N4VfRUGTyLHrFzL+o+p/nQgB7foCCE2I1zZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRX40SsEHaa5e3reNt9r8mk064PEOyDOGijfWpJ8/c0VGvNXcAcSv0G1S9kWoypy5XCLxFX9H4Gok1CyV33bT0fyjnN4SUhi1m8HjUFp1Ex1qtbB/0b7Bnw9OxM0dZOeR8rHRamjJ/Sm7CZNFZYSMAa83H+1jcN7BU+5M6PNIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGlkuDmM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGlkuDmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735907705; x=1767443705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NIe1R77N4VfRUGTyLHrFzL+o+p/nQgB7foCCE2I1zZU=;
  b=fGlkuDmMDrXsdkdfSvjBlEEzp9ENKhG4+oB32E6GHX8Xvr/R7BSxtoLC
   lvPnW/KS85ItTTSKR6wfUhrQB/tNQyX3IHs9wbGq2YnIIYyANePnOKbUK
   sFbHsZZy0+L5gbkGXGoeUiZYDtGqybKb7sIIiF2LzvXD1s3Z4/nTUVXq/
   uYpwmmcD7QW9ZpsMWqCdADenG3Hq4iM0lvjz/fDc7fBbMvk5q4rswKGGH
   JYlA7H8ZHlN1fX6hR4r20Q+n9/taBZCp0z0U8C1CqQPwsHUn9xRP9GgfX
   PYKkFkU+mYvtMb/rvOpI4SC+T+kfI0lABRON8PNv2ZjZNL1ACXGaI+7Ep
   A==;
X-CSE-ConnectionGUID: KSuwbcFhRZuRPpdcXeonog==
X-CSE-MsgGUID: aAPMsb25S/masbvmxx9g5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="61530551"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="61530551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 04:35:05 -0800
X-CSE-ConnectionGUID: vnTfwnggQlSurANILhjiww==
X-CSE-MsgGUID: vW7muQBrSbWxPDUT8BlGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101972354"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2025 04:35:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTgtJ-0009jT-2j;
	Fri, 03 Jan 2025 12:35:01 +0000
Date: Fri, 3 Jan 2025 20:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/4] arm64: dts: morello: Add support for soc dts
Message-ID: <202501032252.c3F3gWhe-lkp@intel.com>
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
In-Reply-To: <20250102155416.13159-4-vincenzo.frascino@arm.com>
References: <20250102155416.13159-4-vincenzo.frascino@arm.com>
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Russell King <linux@armlinux.org.uk>

Hi Vincenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master arm/for-next arm/fixes v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincenzo-Frascino/dt-bindings-arm-Add-Morello-compatibility/20250102-235709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250102155416.13159-4-vincenzo.frascino%40arm.com
patch subject: [PATCH v3 3/4] arm64: dts: morello: Add support for soc dts
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501032252.c3F3gWhe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032252.c3F3gWhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501032252.c3F3gWhe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/arm/morello.dtsi:204.38-211.5: Warning (simple_bus_reg): /soc/interrupt-controller@2c010000: simple-bus unit address format error, expected "30000000"
>> arch/arm64/boot/dts/arm/morello.dtsi:313.23-330.5: Warning (simple_bus_reg): /soc/sram@45200000: simple-bus unit address format error, expected "6000000"

vim +/30000000 +204 arch/arm64/boot/dts/arm/morello.dtsi

4fd20d03457e9d Vincenzo Frascino 2025-01-02    7  
4fd20d03457e9d Vincenzo Frascino 2025-01-02    8  / {
4fd20d03457e9d Vincenzo Frascino 2025-01-02    9  	interrupt-parent = <&gic>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   10  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   11  	#address-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   12  	#size-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   13  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   14  	chosen { };
4fd20d03457e9d Vincenzo Frascino 2025-01-02   15  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   16  	clocks {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   17  		soc_refclk50mhz: clock-50000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   18  			compatible = "fixed-clock";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   19  			#clock-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   20  			clock-frequency = <50000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   21  			clock-output-names = "apb_pclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   22  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   23  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   24  		soc_refclk85mhz: clock-85000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   25  			compatible = "fixed-clock";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   26  			#clock-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   27  			clock-frequency = <85000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   28  			clock-output-names = "iofpga:aclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   29  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   30  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   31  		soc_uartclk: clock-50000000-uart {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   32  			compatible = "fixed-clock";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   33  			#clock-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   34  			clock-frequency = <50000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   35  			clock-output-names = "uartclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   36  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   37  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   38  		dpu_aclk: dpu-aclk {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   39  			/* 77.1 MHz derived from 24 MHz reference clock */
4fd20d03457e9d Vincenzo Frascino 2025-01-02   40  			compatible = "fixed-clock";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   41  			#clock-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   42  			clock-frequency = <350000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   43  			clock-output-names = "aclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   44  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   45  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   46  		dpu_pixel_clk: dpu-pixel-clk {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   47  			compatible = "fixed-clock";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   48  			#clock-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   49  			clock-frequency = <148500000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   50  			clock-output-names = "pxclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   51  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   52  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   53  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   54  	cpus {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   55  		#address-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   56  		#size-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   57  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   58  		cpu0: cpu0@0 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   59  			compatible = "arm,neoverse-n1";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   60  			reg = <0x0 0x0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   61  			device_type = "cpu";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   62  			enable-method = "psci";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   63  			clocks = <&scmi_dvfs 0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   64  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   65  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   66  		cpu1: cpu1@100 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   67  			compatible = "arm,neoverse-n1";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   68  			reg = <0x0 0x100>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   69  			device_type = "cpu";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   70  			enable-method = "psci";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   71  			clocks = <&scmi_dvfs 0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   72  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   73  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   74  		cpu2: cpu2@10000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   75  			compatible = "arm,neoverse-n1";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   76  			reg = <0x0 0x10000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   77  			device_type = "cpu";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   78  			enable-method = "psci";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   79  			clocks = <&scmi_dvfs 1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   80  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   81  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   82  		cpu3: cpu3@10100 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   83  			compatible = "arm,neoverse-n1";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   84  			reg = <0x0 0x10100>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   85  			device_type = "cpu";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   86  			enable-method = "psci";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   87  			clocks = <&scmi_dvfs 1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   88  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   89  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02   90  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   91  	firmware {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   92  		interrupt-parent = <&gic>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   93  
4fd20d03457e9d Vincenzo Frascino 2025-01-02   94  		scmi {
4fd20d03457e9d Vincenzo Frascino 2025-01-02   95  			compatible = "arm,scmi";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   96  			mbox-names = "tx", "rx";
4fd20d03457e9d Vincenzo Frascino 2025-01-02   97  			mboxes = <&mailbox 1 0>, <&mailbox 1 1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   98  			shmem = <&cpu_scp_hpri0>, <&cpu_scp_hpri1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02   99  			#address-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  100  			#size-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  101  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  102  			scmi_dvfs: protocol@13 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  103  				reg = <0x13>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  104  				#clock-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  105  			};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  106  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  107  			scmi_clk: protocol@14 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  108  				reg = <0x14>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  109  				#clock-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  110  			};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  111  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  112  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  113  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  114  	/* The first bank of memory, memory map is actually provided by UEFI. */
4fd20d03457e9d Vincenzo Frascino 2025-01-02  115  	memory@80000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  116  		device_type = "memory";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  117  		/* [0x80000000-0xffffffff] */
4fd20d03457e9d Vincenzo Frascino 2025-01-02  118  		reg = <0x00000000 0x80000000 0x0 0x7F000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  119  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  120  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  121  	memory@8080000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  122  		device_type = "memory";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  123  		/* [0x8080000000-0x83f7ffffff] */
4fd20d03457e9d Vincenzo Frascino 2025-01-02  124  		reg = <0x00000080 0x80000000 0x3 0x78000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  125  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  126  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  127  	pmu {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  128  		compatible = "arm,armv8-pmuv3";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  129  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  130  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  131  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  132  	psci {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  133  		compatible = "arm,psci-0.2";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  134  		method = "smc";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  135  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  136  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  137  	reserved-memory {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  138  		#address-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  139  		#size-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  140  		ranges;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  141  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  142  		secure-firmware@ff000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  143  			reg = <0 0xff000000 0 0x01000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  144  			no-map;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  145  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  146  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  147  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  148  	spe-pmu {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  149  		compatible = "arm,statistical-profiling-extension-v1";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  150  		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  151  	};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  152  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  153  	soc: soc {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  154  		compatible = "simple-bus";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  155  		#address-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  156  		#size-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  157  		interrupt-parent = <&gic>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  158  		ranges;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  159  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  160  		dp0: display@2cc00000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  161  			#address-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  162  			#size-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  163  			compatible = "arm,mali-d32", "arm,mali-d71";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  164  			reg = <0 0x2cc00000 0 0x20000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  165  			interrupts = <0 69 4>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  166  			clocks = <&dpu_aclk>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  167  			clock-names = "aclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  168  			iommus = <&smmu_dp 0>, <&smmu_dp 1>, <&smmu_dp 2>, <&smmu_dp 3>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  169  				<&smmu_dp 8>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  170  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  171  			pl0: pipeline@0 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  172  				reg = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  173  				clocks = <&dpu_pixel_clk>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  174  				clock-names = "pxclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  175  				port {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  176  					dp_pl0_out0: endpoint {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  177  						remote-endpoint = <&tda998x_0_input>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  178  					};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  179  				};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  180  			};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  181  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  182  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  183  		i2c: i2c@1c0f0000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  184  			compatible = "cdns,i2c-r1p14";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  185  			reg = <0x0 0x1c0f0000 0x0 0x1000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  186  			#address-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  187  			#size-cells = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  188  			clock-frequency = <100000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  189  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  190  			clocks = <&dpu_aclk>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  191  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  192  			hdmi_tx: hdmi-transmitter@70 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  193  				compatible = "nxp,tda998x";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  194  				reg = <0x70>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  195  				video-ports = <0x234501>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  196  				port {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  197  					tda998x_0_input: endpoint {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  198  						remote-endpoint = <&dp_pl0_out0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  199  					};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  200  				};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  201  			};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  202  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  203  
4fd20d03457e9d Vincenzo Frascino 2025-01-02 @204  		gic: interrupt-controller@2c010000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  205  			compatible = "arm,gic-v3";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  206  			#address-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  207  			#interrupt-cells = <3>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  208  			#size-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  209  			ranges;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  210  			interrupt-controller;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  211  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  212  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  213  		smmu_dp: iommu@2ce00000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  214  			compatible = "arm,smmu-v3";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  215  			reg = <0 0x2ce00000 0 0x40000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  216  			interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  217  					<GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  218  					<GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  219  			interrupt-names = "eventq", "gerror", "cmdq-sync";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  220  			#iommu-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  221  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  222  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  223  		smmu_ccix: iommu@4f000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  224  			compatible = "arm,smmu-v3";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  225  			reg = <0 0x4f000000 0 0x40000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  226  			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  227  				     <GIC_SPI 230 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  228  				     <GIC_SPI 41 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  229  				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  230  			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  231  			msi-parent = <&its1 0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  232  			#iommu-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  233  			dma-coherent;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  234  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  235  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  236  		smmu_pcie: iommu@4f400000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  237  			compatible = "arm,smmu-v3";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  238  			reg = <0 0x4f400000 0 0x40000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  239  			interrupts = <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  240  				     <GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  241  				     <GIC_SPI 40 IRQ_TYPE_EDGE_RISING>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  242  				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  243  			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  244  			msi-parent = <&its2 0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  245  			#iommu-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  246  			dma-coherent;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  247  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  248  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  249  		mailbox: mhu@45000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  250  			compatible = "arm,mhu-doorbell", "arm,primecell";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  251  			reg = <0x0 0x45000000 0x0 0x1000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  252  			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  253  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  254  			#mbox-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  255  			clocks = <&soc_refclk50mhz>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  256  			clock-names = "apb_pclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  257  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  258  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  259  		pcie_ctlr: pcie@28c0000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  260  			compatible = "pci-host-ecam-generic";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  261  			device_type = "pci";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  262  			reg = <0x28 0xC0000000 0 0x10000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  263  			ranges = <0x01000000 0x00 0x00000000 0x00 0x6F000000 0x00 0x00800000>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  264  				 <0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x0F000000>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  265  				 <0x42000000 0x09 0x00000000 0x09 0x00000000 0x1F 0xC0000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  266  			bus-range = <0 255>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  267  			linux,pci-domain = <0>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  268  			#address-cells = <3>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  269  			#size-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  270  			dma-coherent;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  271  			#interrupt-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  272  			interrupt-map-mask = <0 0 0 7>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  273  			interrupt-map = <0 0 0 1 &gic 0 0 0 169 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  274  					<0 0 0 2 &gic 0 0 0 170 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  275  					<0 0 0 3 &gic 0 0 0 171 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  276  					<0 0 0 4 &gic 0 0 0 172 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  277  			msi-map = <0 &its_pcie 0 0x10000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  278  			iommu-map = <0 &smmu_pcie 0 0x10000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  279  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  280  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  281  		ccix_pcie_ctlr: pcie@4fc0000000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  282  			compatible = "pci-host-ecam-generic";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  283  			device_type = "pci";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  284  			reg = <0x4F 0xC0000000 0 0x10000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  285  			ranges = <0x01000000 0x00 0x00000000 0x00 0x7F000000 0x00 0x00800000>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  286  				 <0x02000000 0x00 0x70000000 0x00 0x70000000 0x00 0x0F000000>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  287  				 <0x42000000 0x30 0x00000000 0x30 0x00000000 0x1F 0xC0000000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  288  			bus-range = <0 255>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  289  			linux,pci-domain = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  290  			#address-cells = <3>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  291  			#size-cells = <2>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  292  			dma-coherent;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  293  			#interrupt-cells = <1>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  294  			interrupt-map-mask = <0 0 0 7>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  295  			interrupt-map = <0 0 0 1 &gic 0 0 0 201 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  296  					<0 0 0 2 &gic 0 0 0 202 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  297  					<0 0 0 3 &gic 0 0 0 203 IRQ_TYPE_LEVEL_HIGH>,
4fd20d03457e9d Vincenzo Frascino 2025-01-02  298  					<0 0 0 4 &gic 0 0 0 204 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  299  			msi-map = <0 &its_ccix 0 0x10000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  300  			iommu-map = <0 &smmu_ccix 0 0x10000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  301  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  302  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  303  		uart0: serial@2a400000 {
4fd20d03457e9d Vincenzo Frascino 2025-01-02  304  			compatible = "arm,pl011", "arm,primecell";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  305  			reg = <0x0 0x2a400000 0x0 0x1000>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  306  			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  307  			clocks = <&soc_uartclk>, <&soc_refclk50mhz>;
4fd20d03457e9d Vincenzo Frascino 2025-01-02  308  			clock-names = "uartclk", "apb_pclk";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  309  
4fd20d03457e9d Vincenzo Frascino 2025-01-02  310  			status = "disabled";
4fd20d03457e9d Vincenzo Frascino 2025-01-02  311  		};
4fd20d03457e9d Vincenzo Frascino 2025-01-02  312  
4fd20d03457e9d Vincenzo Frascino 2025-01-02 @313  		sram: sram@45200000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
