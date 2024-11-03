Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3515A8
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Nov 2024 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730637632; cv=none; b=nEnGr/D50BAbh9j1acCJaCUlWQUzRq7VICKydHWy7cZ3bAyXgoZLcfa94ADN7lhpEeDc+YkaNyqCMuDV7UuvAO40/2MMLCSZQzyiu9nB+7MOE3nnUGmwvwKWyRy/3F4smEkenHeuyX6Z06sOrmbkVXg1Vp8MCjZ7gWlQjYYKY/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730637632; c=relaxed/simple;
	bh=C897ABzqPMqEzELCMBFYG3IEVcDsfD10RbG5IS30RBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssN9011G+xR0/fjkKzEA3+BvqkbghVj4dXc/LFEz5PpTZSjWIDxENp86AFJ0u0Fl/09DZG8NzksrKC77yqrON7IfmpSQ5p18V/F3Z3M7sPdH8VaMVoRoCrK4tTFdJ+bJj8Nb9eTEHElLRow95us2GGVR5QO8ptxzNHSJY1QDS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idMTIrQU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idMTIrQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730637629; x=1762173629;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C897ABzqPMqEzELCMBFYG3IEVcDsfD10RbG5IS30RBE=;
  b=idMTIrQUP1/C1xdnIw3m2GkeXXzlgFHdo0w0PjTyVZeipFI2t6Eu3dYk
   onsfgkbo+2SFbnM0+o2n3r/4CaQ0AK/YPlUtuDhj2lpFigPwVnnAWzXrn
   qu9wUCxrMqyglLE2Gu3UdeJOBAxj3HSiKEcxEKoJ7mlbKJyCLKarqK+Zv
   W1EONb2DpppwQ3jcLkd13d/e80bAb0KhNWgALBJNHWcS7ZNapm2NarHK8
   S15PpYTAXveIG9JyctZP0z+Ga9GtIHAcS3Y1t4mac8bg6mOctbD4gPtnp
   tWuHC6RoALor+/0EX9t3jF6o4BvQge7aDaVdKDjohffH5gFHIwoOe/ffp
   w==;
X-CSE-ConnectionGUID: JhSSMjTkT5SJ2+0UE1SXrg==
X-CSE-MsgGUID: nMBjBHH0SSKcuHqjb15RVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30121845"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30121845"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 04:40:28 -0800
X-CSE-ConnectionGUID: tlsAb+DlTn6U0sBmtiQCLg==
X-CSE-MsgGUID: X3rFZCo6SKCRUyalYp9Vhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="87985331"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2024 04:40:26 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Zu4-000jwj-0u;
	Sun, 03 Nov 2024 12:40:24 +0000
Date: Sun, 3 Nov 2024 20:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: Add Xiaomi Redmi 5A
Message-ID: <202411032023.LvSYTYX4-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241031-msm8917-v2-15-8a075faa89b1@mainlining.org>
References: <20241031-msm8917-v2-15-8a075faa89b1@mainlining.org>
TO: "Barnabás Czémán" <barnabas.czeman@mainlining.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Amit Kucheria <amitk@kernel.org>
TO: Thara Gopinath <thara.gopinath@gmail.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: iommu@lists.linux.dev
CC: "Barnabás Czémán" <barnabas.czeman@mainlining.org>

Hi Barnabás,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f2493655d2d3d5c6958ed996b043c821c23ae8d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Barnab-s-Cz-m-n/dt-bindings-pinctrl-qcom-pmic-gpio-add-PM8937/20241031-093158
base:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
patch link:    https://lore.kernel.org/r/20241031-msm8917-v2-15-8a075faa89b1%40mainlining.org
patch subject: [PATCH v2 15/15] arm64: dts: qcom: Add Xiaomi Redmi 5A
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411032023.LvSYTYX4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411032023.LvSYTYX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411032023.LvSYTYX4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:500.13-505.5: Warning (simple_bus_reg): /soc@0/rng@22000: simple-bus unit address format error, expected "e3000"
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1176.29-1209.5: Warning (simple_bus_reg): /soc@0/iommu@1e00000: simple-bus unit address format error, expected "1e20000"
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1211.28-1229.5: Warning (simple_bus_reg): /soc@0/iommu@1f00000: simple-bus unit address format error, expected "1f08000"
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1537.29-1600.5: Warning (simple_bus_reg): /soc@0/remoteproc@a21b000: simple-bus unit address format error, expected "a204000"
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1090.27-1156.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8937.dtsi:206.9-215.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:537.27-540.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@1d9: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@1d9)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:557.27-560.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@1dc: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@1dc)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:582.25-585.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p1@210)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:592.27-595.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s1-p1@211)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:612.27-615.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s3-p1@214)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:637.26-640.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@230)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1076.11-1087.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +537 arch/arm64/boot/dts/qcom/msm8917.dtsi

f396d8c8a7b9f9 Otto Pflüger 2024-10-31   10  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   11  / {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   12  	interrupt-parent = <&intc>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   13  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   14  	#address-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   15  	#size-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   16  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   17  	aliases {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   18  		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   19  		mmc1 = &sdhc_2; /* SDC2 SD card slot */
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   20  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   21  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   22  	chosen { };
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   23  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   24  	clocks {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   25  		sleep_clk: sleep-clk {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   26  			compatible = "fixed-clock";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   27  			#clock-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   28  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   29  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   30  		xo_board: xo-board {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   31  			compatible = "fixed-clock";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   32  			#clock-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   33  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   34  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   35  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   36  	cpus {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   37  		#address-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   38  		#size-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   39  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   40  		cpu0: cpu@0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   41  			device_type = "cpu";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   42  			compatible = "arm,cortex-a53";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   43  			reg = <0x100>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   44  			next-level-cache = <&l2_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   45  			enable-method = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   46  			clocks = <&apcs>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   47  			operating-points-v2 = <&cpu_opp_table>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   48  			#cooling-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   49  			power-domains = <&cpu_pd0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   50  			power-domain-names = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   51  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   52  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   53  		cpu1: cpu@1 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   54  			device_type = "cpu";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   55  			compatible = "arm,cortex-a53";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   56  			reg = <0x101>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   57  			next-level-cache = <&l2_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   58  			enable-method = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   59  			clocks = <&apcs>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   60  			operating-points-v2 = <&cpu_opp_table>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   61  			#cooling-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   62  			power-domains = <&cpu_pd1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   63  			power-domain-names = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   64  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   65  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   66  		cpu2: cpu@2 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   67  			device_type = "cpu";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   68  			compatible = "arm,cortex-a53";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   69  			reg = <0x102>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   70  			next-level-cache = <&l2_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   71  			enable-method = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   72  			clocks = <&apcs>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   73  			operating-points-v2 = <&cpu_opp_table>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   74  			#cooling-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   75  			power-domains = <&cpu_pd2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   76  			power-domain-names = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   77  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   78  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   79  		cpu3: cpu@3 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   80  			device_type = "cpu";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   81  			compatible = "arm,cortex-a53";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   82  			reg = <0x103>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   83  			next-level-cache = <&l2_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   84  			enable-method = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   85  			clocks = <&apcs>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   86  			operating-points-v2 = <&cpu_opp_table>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   87  			#cooling-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   88  			power-domains = <&cpu_pd3>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   89  			power-domain-names = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   90  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   91  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   92  		cpu-map {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   93  			cluster0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   94  				core0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   95  					cpu = <&cpu0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   96  				};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   97  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   98  				core1 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31   99  					cpu = <&cpu1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  100  				};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  101  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  102  				core2 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  103  					cpu = <&cpu2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  104  				};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  105  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  106  				core3 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  107  					cpu = <&cpu3>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  108  				};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  109  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  110  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  111  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  112  		domain-idle-states {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  113  			cluster_pwrdn: cluster-gdhs {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  114  				compatible = "domain-idle-state";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  115  				arm,psci-suspend-param = <0x41000043>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  116  				entry-latency-us = <240>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  117  				exit-latency-us = <280>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  118  				min-residency-us = <806>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  119  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  120  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  121  			cluster_pc: cluster-power-collapse {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  122  				compatible = "domain-idle-state";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  123  				arm,psci-suspend-param = <0x41000053>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  124  				entry-latency-us = <700>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  125  				exit-latency-us = <1000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  126  				min-residency-us = <6500>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  127  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  128  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  129  			cluster_ret: cluster-retention {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  130  				compatible = "domain-idle-state";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  131  				arm,psci-suspend-param = <0x41000023>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  132  				entry-latency-us = <700>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  133  				exit-latency-us = <650>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  134  				min-residency-us = <1972>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  135  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  136  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  137  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  138  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  139  		idle-states {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  140  			entry-method = "psci";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  141  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  142  			cpu_sleep_0: cpu-sleep-0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  143  				compatible = "arm,idle-state";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  144  				idle-state-name = "standalone-power-collapse";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  145  				arm,psci-suspend-param = <0x40000003>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  146  				entry-latency-us = <125>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  147  				exit-latency-us = <180>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  148  				min-residency-us = <595>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  149  				local-timer-stop;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  150  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  151  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  152  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  153  		l2_0: l2-cache {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  154  			compatible = "cache";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  155  			cache-level = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  156  			cache-unified;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  157  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  158  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  159  		cpu_opp_table: opp-table-cpu {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  160  			compatible = "operating-points-v2";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  161  			opp-shared;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  162  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  163  			opp-960000000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  164  				opp-hz = /bits/ 64 <960000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  165  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  166  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  167  			opp-1094400000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  168  				opp-hz = /bits/ 64 <1094400000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  169  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  170  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  171  			opp-1248000000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  172  				opp-hz = /bits/ 64 <1248000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  173  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  174  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  175  			opp-1401600000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  176  				opp-hz = /bits/ 64 <1401600000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  177  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  178  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  179  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  180  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  181  	firmware {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  182  		scm: scm {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  183  			compatible = "qcom,scm-msm8916", "qcom,scm";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  184  			clocks = <&gcc GCC_CRYPTO_CLK>,
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  185  				 <&gcc GCC_CRYPTO_AXI_CLK>,
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  186  				 <&gcc GCC_CRYPTO_AHB_CLK>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  187  			clock-names = "core", "bus", "iface";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  188  			#reset-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  189  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  190  			qcom,dload-mode = <&tcsr 0x6100>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  191  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  192  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  193  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  194  	memory@80000000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  195  		device_type = "memory";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  196  		/* We expect the bootloader to fill in the reg */
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  197  		reg = <0 0x80000000 0 0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  198  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  199  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  200  	pmu {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  201  		compatible = "arm,cortex-a53-pmu";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  202  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  203  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  204  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  205  	psci {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  206  		compatible = "arm,psci-1.0";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  207  		method = "smc";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  208  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  209  		cluster_pd: power-domain-cluster {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  210  			#power-domain-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  211  			domain-idle-states = <&cluster_pwrdn>, <&cluster_ret>, <&cluster_pc>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  212  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  213  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  214  		cpu_pd0: power-domain-cpu0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  215  			#power-domain-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  216  			power-domains = <&cluster_pd>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  217  			domain-idle-states = <&cpu_sleep_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  218  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  219  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  220  		cpu_pd1: power-domain-cpu1 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  221  			#power-domain-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  222  			power-domains = <&cluster_pd>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  223  			domain-idle-states = <&cpu_sleep_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  224  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  225  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  226  		cpu_pd2: power-domain-cpu2 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  227  			#power-domain-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  228  			power-domains = <&cluster_pd>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  229  			domain-idle-states = <&cpu_sleep_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  230  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  231  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  232  		cpu_pd3: power-domain-cpu3 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  233  			#power-domain-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  234  			power-domains = <&cluster_pd>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  235  			domain-idle-states = <&cpu_sleep_0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  236  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  237  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  238  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  239  	rpm: remoteproc {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  240  		compatible = "qcom,msm8917-rpm-proc", "qcom,rpm-proc";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  241  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  242  		smd-edge {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  243  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  244  			qcom,ipc = <&apcs 8 0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  245  			qcom,smd-edge = <15>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  246  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  247  			rpm_requests: rpm-requests {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  248  				compatible = "qcom,rpm-msm8917", "qcom,smd-rpm";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  249  				qcom,smd-channels = "rpm_requests";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  250  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  251  				rpmcc: clock-controller {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  252  					compatible = "qcom,rpmcc-msm8917", "qcom,rpmcc";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  253  					#clock-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  254  					clocks = <&xo_board>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  255  					clock-names = "xo";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  256  				};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  257  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  258  				rpmpd: power-controller {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  259  					compatible = "qcom,msm8917-rpmpd";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  260  					#power-domain-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  261  					operating-points-v2 = <&rpmpd_opp_table>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  262  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  263  					rpmpd_opp_table: opp-table {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  264  						compatible = "operating-points-v2";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  265  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  266  						rpmpd_opp_ret: opp1 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  267  							opp-level = <RPM_SMD_LEVEL_RETENTION>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  268  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  269  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  270  						rpmpd_opp_ret_plus: opp2 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  271  							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  272  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  273  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  274  						rpmpd_opp_min_svs: opp3 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  275  							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  276  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  277  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  278  						rpmpd_opp_low_svs: opp4 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  279  							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  280  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  281  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  282  						rpmpd_opp_svs: opp5 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  283  							opp-level = <RPM_SMD_LEVEL_SVS>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  284  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  285  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  286  						rpmpd_opp_svs_plus: opp6 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  287  							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  288  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  289  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  290  						rpmpd_opp_nom: opp7 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  291  							opp-level = <RPM_SMD_LEVEL_NOM>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  292  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  293  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  294  						rpmpd_opp_nom_plus: opp8 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  295  							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  296  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  297  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  298  						rpmpd_opp_turbo: opp9 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  299  							opp-level = <RPM_SMD_LEVEL_TURBO>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  300  						};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  301  					};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  302  				};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  303  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  304  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  305  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  306  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  307  	reserved-memory {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  308  		#address-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  309  		#size-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  310  		ranges;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  311  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  312  		reserved@85b00000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  313  			reg = <0x0 0x85b00000 0x0 0x800000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  314  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  315  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  316  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  317  		smem@86300000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  318  			compatible = "qcom,smem";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  319  			reg = <0x0 0x86300000 0x0 0x100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  320  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  321  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  322  			hwlocks = <&tcsr_mutex 3>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  323  			qcom,rpm-msg-ram = <&rpm_msg_ram>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  324  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  325  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  326  		reserved@86400000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  327  			reg = <0x0 0x86400000 0x0 0x400000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  328  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  329  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  330  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  331  		mpss_mem: mpss@86800000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  332  			/*
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  333  			 * The memory region for the mpss firmware is generally
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  334  			 * relocatable and could be allocated dynamically.
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  335  			 * However, many firmware versions tend to fail when
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  336  			 * loaded to some special addresses, so it is hard to
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  337  			 * define reliable alloc-ranges.
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  338  			 *
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  339  			 * alignment = <0x0 0x400000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  340  			 * alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  341  			 */
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  342  			reg = <0x0 0x86800000 0x0 0>; /* size is device-specific */
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  343  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  344  			status = "disabled";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  345  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  346  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  347  		rmtfs@92100000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  348  			compatible = "qcom,rmtfs-mem";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  349  			reg = <0x0 0x92100000 0x0 0x180000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  350  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  351  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  352  			qcom,client-id = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  353  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  354  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  355  		adsp_mem: adsp {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  356  			size = <0x0 0x1100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  357  			alignment = <0x0 0x100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  358  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  359  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  360  			status = "disabled";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  361  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  362  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  363  		mba_mem: mba {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  364  			size = <0x0 0x100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  365  			alignment = <0x0 0x100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  366  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  367  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  368  			status = "disabled";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  369  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  370  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  371  		venus_mem: venus {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  372  			size = <0x0 0x400000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  373  			alignment = <0x0 0x100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  374  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  375  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  376  			status = "disabled";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  377  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  378  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  379  		wcnss_mem: wcnss {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  380  			size = <0x0 0x700000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  381  			alignment = <0x0 0x100000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  382  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  383  			no-map;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  384  			status = "disabled";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  385  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  386  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  387  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  388  	smp2p-adsp {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  389  		compatible = "qcom,smp2p";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  390  		qcom,smem = <443>, <429>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  391  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  392  		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  393  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  394  		mboxes = <&apcs 10>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  395  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  396  		qcom,local-pid = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  397  		qcom,remote-pid = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  398  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  399  		adsp_smp2p_out: master-kernel {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  400  			qcom,entry-name = "master-kernel";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  401  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  402  			#qcom,smem-state-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  403  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  404  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  405  		adsp_smp2p_in: slave-kernel {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  406  			qcom,entry-name = "slave-kernel";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  407  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  408  			interrupt-controller;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  409  			#interrupt-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  410  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  411  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  412  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  413  	smp2p-modem {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  414  		compatible = "qcom,smp2p";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  415  		qcom,smem = <435>, <428>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  416  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  417  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  418  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  419  		qcom,ipc = <&apcs 8 14>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  420  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  421  		qcom,local-pid = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  422  		qcom,remote-pid = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  423  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  424  		modem_smp2p_out: master-kernel {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  425  			qcom,entry-name = "master-kernel";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  426  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  427  			#qcom,smem-state-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  428  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  429  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  430  		modem_smp2p_in: slave-kernel {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  431  			qcom,entry-name = "slave-kernel";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  432  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  433  			interrupt-controller;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  434  			#interrupt-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  435  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  436  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  437  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  438  	smp2p-wcnss {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  439  		compatible = "qcom,smp2p";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  440  		qcom,smem = <451>, <431>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  441  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  442  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  443  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  444  		qcom,ipc = <&apcs 8 18>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  445  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  446  		qcom,local-pid = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  447  		qcom,remote-pid = <4>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  448  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  449  		wcnss_smp2p_out: master-kernel {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  450  			qcom,entry-name = "master-kernel";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  451  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  452  			#qcom,smem-state-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  453  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  454  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  455  		wcnss_smp2p_in: slave-kernel {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  456  			qcom,entry-name = "slave-kernel";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  457  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  458  			interrupt-controller;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  459  			#interrupt-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  460  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  461  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  462  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  463  	smsm {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  464  		compatible = "qcom,smsm";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  465  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  466  		#address-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  467  		#size-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  468  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  469  		mboxes = <0>, <&apcs 13>, <0>, <&apcs 19>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  470  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  471  		apps_smsm: apps@0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  472  			reg = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  473  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  474  			#qcom,smem-state-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  475  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  476  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  477  		hexagon_smsm: hexagon@1 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  478  			reg = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  479  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  480  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  481  			interrupt-controller;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  482  			#interrupt-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  483  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  484  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  485  		wcnss_smsm: wcnss@6 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  486  			reg = <6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  487  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  488  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  489  			interrupt-controller;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  490  			#interrupt-cells = <2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  491  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  492  	};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  493  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  494  	soc: soc@0 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  495  		#address-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  496  		#size-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  497  		ranges = <0 0 0 0xffffffff>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  498  		compatible = "simple-bus";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  499  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  500  		rng@22000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  501  			compatible = "qcom,prng";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  502  			reg = <0xe3000 0x1000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  503  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  504  			clock-names = "core";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  505  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  506  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  507  		rpm_msg_ram: sram@60000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  508  			compatible = "qcom,rpm-msg-ram";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  509  			reg = <0x00060000 0x8000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  510  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  511  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  512  		usb_hs_phy: phy@6c000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  513  			compatible = "qcom,usb-hs-28nm-femtophy";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  514  			reg = <0x6c000 0x200>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  515  			#phy-cells = <0>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  516  			clocks = <&xo_board>,
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  517  				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  518  				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  519  			clock-names = "ref", "ahb", "sleep";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  520  			resets = <&gcc GCC_QUSB2_PHY_BCR>,
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  521  				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  522  			reset-names = "phy", "por";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  523  			status = "disabled";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  524  		};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  525  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  526  		qfprom: qfprom@a4000 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  527  			compatible = "qcom,msm8917-qfprom", "qcom,qfprom";
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  528  			reg = <0x000a4000 0x1000>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  529  			#address-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  530  			#size-cells = <1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  531  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  532  			tsens_base1: base1@1d8 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  533  				reg = <0x1d8 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  534  				bits = <0 8>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  535  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  536  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31 @537  			tsens_s5_p1: s5-p1@1d9 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  538  				reg = <0x1d9 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  539  				bits = <0 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  540  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  541  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  542  			tsens_s5_p2: s5-p2@1d9 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  543  				reg = <0x1d9 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  544  				bits = <6 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  545  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  546  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  547  			tsens_s6_p1: s6-p1@1da {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  548  				reg = <0x1da 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  549  				bits = <4 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  550  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  551  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  552  			tsens_s6_p2: s6-p2@1db {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  553  				reg = <0x1db 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  554  				bits = <2 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  555  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  556  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31 @557  			tsens_s7_p1: s7-p1@1dc {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  558  				reg = <0x1dc 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  559  				bits = <0 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  560  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  561  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  562  			tsens_s7_p2: s7-p2@1dc {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  563  				reg = <0x1dc 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  564  				bits = <6 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  565  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  566  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  567  			tsens_s8_p1: s8-p1@1dd {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  568  				reg = <0x1dd 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  569  				bits = <4 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  570  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  571  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  572  			tsens_s8_p2: s8-p2@1de {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  573  				reg = <0x1de 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  574  				bits = <2 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  575  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  576  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  577  			tsens_base2: base2@1df {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  578  				reg = <0x1df 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  579  				bits = <0 8>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  580  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  581  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31 @582  			tsens_mode: mode@210 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  583  				reg = <0x210 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  584  				bits = <0 3>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  585  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  586  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  587  			tsens_s0_p1: s0-p1@210 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  588  				reg = <0x210 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  589  				bits = <3 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  590  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  591  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31 @592  			tsens_s0_p2: s0-p2@211 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  593  				reg = <0x211 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  594  				bits = <1 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  595  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  596  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  597  			tsens_s1_p1: s1-p1@211 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  598  				reg = <0x211 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  599  				bits = <7 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  600  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  601  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  602  			tsens_s1_p2: s1-p2@212 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  603  				reg = <0x212 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  604  				bits = <5 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  605  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  606  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  607  			tsens_s2_p1: s2-p1@213 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  608  				reg = <0x213 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  609  				bits = <3 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  610  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  611  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31 @612  			tsens_s2_p2: s2-p2@214 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  613  				reg = <0x214 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  614  				bits = <1 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  615  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  616  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  617  			tsens_s3_p1: s3-p1@214 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  618  				reg = <0x214 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  619  				bits = <7 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  620  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  621  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  622  			tsens_s3_p2: s3-p2@215 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  623  				reg = <0x215 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  624  				bits = <5 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  625  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  626  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  627  			tsens_s4_p1: s4-p1@216 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  628  				reg = <0x216 2>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  629  				bits = <3 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  630  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  631  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  632  			tsens_s4_p2: s4-p2@217 {
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  633  				reg = <0x217 1>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  634  				bits = <1 6>;
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  635  			};
f396d8c8a7b9f9 Otto Pflüger 2024-10-31  636  
f396d8c8a7b9f9 Otto Pflüger 2024-10-31 @637  			tsens_s9_p1: s9-p1@230{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
