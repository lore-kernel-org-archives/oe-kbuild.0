Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413CE2309A3
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802588; cv=none; b=BoZCJwOGp4cWXOqsl058uqUMH6pItPAOlf2GDIezfoGDEI4kJ5iqYKfJrzTNcnkM3Scs4haf+y8+ETlgZFi0aTQSSmcUxtGZBBKLvg/H4g4gNRn2fUjpntl1eruYHZD3Fk8jqONrVTvJyxaUC1bcgAgjWL3UUuNKlX5Zsl+0Q4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802588; c=relaxed/simple;
	bh=myA2AqvyoXu3UM+inlOhQ22ivP1F8xsbns87ob6P8Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEtgEqZtw1EPb4IaXo+gdTNk0BjVZfBjPHIdOn5PsNkun2m5URQe5g0AF0zgn2KlKeiteKr0jny6ZjUoSTMRzajq90j2SA9LuhMcxXbg73pfcH37JpEHC/xGtKEfDum0kqOMod/OqJBbGLgWhACe75XNP7lz924665hAW+nMnMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS1kQ5u8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS1kQ5u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746802586; x=1778338586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myA2AqvyoXu3UM+inlOhQ22ivP1F8xsbns87ob6P8Tk=;
  b=dS1kQ5u8wJp9HvrMG3wohQXmO7WlTZ+S56plWcYOMwYuglsfWtjGjzax
   3MZMxudmmRgQbbFod7hhSy2oo0M/VRsxmLwB92c4ONFlGTsH5TAzuxhEj
   glG1FggkmGk7xEPN6n4/SqM0dhSo8cONtFFnEVPtimYIIEMM5N2CZxLtV
   3v2whamiZ0SrHLVIxnlE6FEroidB6L2X3IQNAZf8sSfGC/EWFO5G84x8S
   6YzD+OvLdvZdUdySVZ9imR03uWB7BbTjWiQb5P8JybUoa7dJfop06SZgV
   umkeXrTp65AtIdwDiBZ0LeoDnF1vyIm7YQQheyAYo2iEqE7Bc2BKrC0Sv
   A==;
X-CSE-ConnectionGUID: JavjcD26T2etfMTes2zVfQ==
X-CSE-MsgGUID: v+w1phWUTeOAL8SmUK3uwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59977511"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="59977511"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 07:56:26 -0700
X-CSE-ConnectionGUID: Q1shfOzESq6Xaa4MD48WtA==
X-CSE-MsgGUID: tNCE0YlpQ4S0nkjMYidlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="167719638"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2025 07:56:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDP9C-000CBD-0a;
	Fri, 09 May 2025 14:56:22 +0000
Date: Fri, 9 May 2025 22:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <202505092201.vuNUBwFc-lkp@intel.com>
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
In-Reply-To: <20250507-am62lx-v5-3-4b57ea878e62@ti.com>
References: <20250507-am62lx-v5-3-4b57ea878e62@ti.com>
TO: Bryan Brattlof <bb@ti.com>
TO: Nishanth Menon <nm@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bryan Brattlof <bb@ti.com>

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ed6f779e213070572e53e9801e4a6e510d7bc208]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-Brattlof/dt-bindings-arm-ti-Add-binding-for-AM62L-SoCs/20250508-111107
base:   ed6f779e213070572e53e9801e4a6e510d7bc208
patch link:    https://lore.kernel.org/r/20250507-am62lx-v5-3-4b57ea878e62%40ti.com
patch subject: [PATCH v5 3/3] arm64: dts: ti: k3-am62l: add initial reference board file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505092201.vuNUBwFc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092201.vuNUBwFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505092201.vuNUBwFc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62l.dtsi:101.30-113.5: Warning (simple_bus_reg): /bus@f0000/bus@43000000: simple-bus unit address format error, expected "a80000"
>> arch/arm64/boot/dts/ti/k3-am62l-main.dtsi:232.19-256.4: Warning (simple_bus_reg): /bus@f0000/bus@fc00000: simple-bus unit address format error, expected "100"

vim +/a80000 +101 arch/arm64/boot/dts/ti/k3-am62l.dtsi

5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   14  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   15  / {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   16  	model = "Texas Instruments K3 AM62L3 SoC";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   17  	compatible = "ti,am62l3";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   18  	interrupt-parent = <&gic500>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   19  	#address-cells = <2>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   20  	#size-cells = <2>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   21  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   22  	firmware {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   23  		optee {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   24  			compatible = "linaro,optee-tz";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   25  			method = "smc";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   26  		};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   27  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   28  		psci: psci {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   29  			compatible = "arm,psci-1.0";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   30  			method = "smc";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   31  		};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   32  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   33  		scmi: scmi {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   34  			compatible = "arm,scmi-smc";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   35  			arm,smc-id = <0x82004000>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   36  			shmem = <&scmi_shmem>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   37  			#address-cells = <1>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   38  			#size-cells = <0>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   39  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   40  			scmi_clk: protocol@14 {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   41  				reg = <0x14>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   42  				#clock-cells = <1>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   43  				bootph-all;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   44  			};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   45  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   46  			scmi_pds: protocol@11 {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   47  				reg = <0x11>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   48  				#power-domain-cells = <1>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   49  				bootph-all;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   50  			};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   51  		};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   52  	};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   53  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   54  	a53_timer0: timer-cl0-cpu0 {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   55  		compatible = "arm,armv8-timer";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   56  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   57  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   58  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   59  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   60  	};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   61  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   62  	pmu: pmu {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   63  		compatible = "arm,cortex-a53-pmu";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   64  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   65  	};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   66  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   67  	cbass_main: bus@f0000 {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   68  		compatible = "simple-bus";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   69  		ranges = <0x00 0x00600000 0x00 0x00600000 0x00 0x00010100>, /* GPIO */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   70  			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First Peripheral Window */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   71  			 <0x00 0x00a40000 0x00 0x00a40000 0x00 0x00000400>, /* Timesync Router */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   72  			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* CPSW */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   73  			 <0x00 0x09000000 0x00 0x09000000 0x00 0x00400000>, /* CTRL MMRs */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   74  			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x1a001400>, /* Second Peripheral Window */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   75  			 <0x00 0x301c0000 0x00 0x301c0000 0x00 0x00001000>, /* DPHY-TX */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   76  			 <0x00 0x30200000 0x00 0x30200000 0x00 0x0000b000>, /* DSS */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   77  			 <0x00 0x30270000 0x00 0x30270000 0x00 0x00390000>, /* DSI Wrapper */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   78  			 <0x00 0x30500000 0x00 0x30500000 0x00 0x00100000>, /* DSI Config */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   79  			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core Window */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   80  			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core Window */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   81  			 <0x00 0x3b000000 0x00 0x3b000000 0x00 0x00000400>, /* GPMC0 */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   82  			 <0x00 0x45810000 0x00 0x45810000 0x00 0x03170000>, /* DMSS */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   83  			 <0x00 0x50000000 0x00 0x50000000 0x00 0x08000000>, /* GPMC DATA */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   84  			 <0x00 0x60000000 0x00 0x60000000 0x00 0x08000000>, /* FSS DAT1 */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   85  			 <0x00 0x70800000 0x00 0x70800000 0x00 0x00018000>, /* OCSRAM */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   86  			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   87  			 <0x04 0x00000000 0x04 0x00000000 0x01 0x00000000>, /* FSS DAT0 */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   88  			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS DAT3 */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   89  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   90  			 /* Wakeup Domain Range */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   91  			 <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00034000>, /* GTC */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   92  			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   93  			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDGCFG */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   94  			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   95  			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   96  			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   97  			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   98  		#address-cells = <2>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07   99  		#size-cells = <2>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  100  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07 @101  		cbass_wakeup:  bus@43000000 {
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  102  			compatible = "simple-bus";
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  103  			 ranges = <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00034000>, /* GTC */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  104  				  <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  105  				  <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDGCFG */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  106  				  <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  107  				  <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  108  				  <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  109  				  <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  110  			#address-cells = <2>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  111  			#size-cells = <2>;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  112  			bootph-all;
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  113  		};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  114  	};
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  115  
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  116  	#include "k3-am62l-thermal.dtsi"
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  117  };
5c91f2d6b1283d Vignesh Raghavendra 2025-05-07  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
