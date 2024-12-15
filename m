Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC51B4128
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734283868; cv=none; b=OovWdtLZFX9jugeYlMlKS9s+m2SBaH6eCsMS0m2cQagdzAGd787Oap5JXBJ3QyVbkygMG63h0zbLxIpL50hqc6ZPz0EoaJvo0VXTM7MlvaCu/cpmDkJQBuxh7OeM9pSYGQ8/HHJ++SxMVQyTWmD64cJVmPGCxZDfzYJ1d3vnukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734283868; c=relaxed/simple;
	bh=TTnumqeL222nwrChhH/rIf6cJCIGqQeFr5G8xCfHq0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUAsOEp93w4eRl4/4h5UEAxMSPQKAL/fjVDqUlYBON6mbnGXakoqhxHKNqGlyNp0eN4xX0l5hz08qp7LMF6S7Cm1rbuMt2y9TL1ooUGbKZ5UQJoPQYoPWEO32qLjtz2GxhbE0Zh3k1WgCMpq5eC8+dDnw6tEzZUUjupbndXXCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCq/iiSp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCq/iiSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734283863; x=1765819863;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TTnumqeL222nwrChhH/rIf6cJCIGqQeFr5G8xCfHq0o=;
  b=hCq/iiSpxWKD1/vSvu2Z/0zXjPM1LXRWFVJ289gJ6Mcm0BRRr3tK1ZnM
   qM8BZTz+g+uESx2CKW+bDM7vp7u3npAFrT9iwwG5mrQdhl4eFvqtLKX/T
   JLVZcg5XkKLZ/i5GxHQcptUtu/wFiTa4Y1oG4JGLmGbOK3dxIcB3QH/HP
   6uLz9bLajIAljjpKcY5zRQ2nmieFU3myTu6wf/HjH+Eeq79th05c9Q5tK
   I0j1gH3Q1mupjUwiUbe0P1x73dnfYGG9x6P9RFjYE7BCXtrrenrAU6jv/
   kkfFH+luBM2qCJQmlRtYRSmmKqDKWQ8f/an+7mGi2GzkNnnVyDcZFwuED
   Q==;
X-CSE-ConnectionGUID: 0oJebiHXTTCEhonJlDCJ8g==
X-CSE-MsgGUID: HoeE56NsTfaW+dUULaBdSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34823319"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34823319"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 09:31:02 -0800
X-CSE-ConnectionGUID: EhAd5DR6TACQxZYo/4UVgA==
X-CSE-MsgGUID: Bs7ybkGSToyeI3bt9jvjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="97054920"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2024 09:31:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMsSI-000DlW-18;
	Sun, 15 Dec 2024 17:30:58 +0000
Date: Mon, 16 Dec 2024 01:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: Add Xiaomi Redmi 5A
Message-ID: <202412160132.jCczOufD-lkp@intel.com>
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
In-Reply-To: <20241215-msm8917-v9-8-bacaa26f3eef@mainlining.org>
References: <20241215-msm8917-v9-8-bacaa26f3eef@mainlining.org>
TO: "Barnabás Czémán" <barnabas.czeman@mainlining.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
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
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: iommu@lists.linux.dev
CC: "Barnabás Czémán" <barnabas.czeman@mainlining.org>

Hi Barnabás,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1b2ab8149928c1cea2d7eca30cd35bb7fe014053]

url:    https://github.com/intel-lab-lkp/linux/commits/Barnab-s-Cz-m-n/arm64-dts-qcom-Add-PM8937-PMIC/20241215-191920
base:   1b2ab8149928c1cea2d7eca30cd35bb7fe014053
patch link:    https://lore.kernel.org/r/20241215-msm8917-v9-8-bacaa26f3eef%40mainlining.org
patch subject: [PATCH v9 8/8] arm64: dts: qcom: Add Xiaomi Redmi 5A
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-002-20241215 (https://download.01.org/0day-ci/archive/20241216/202412160132.jCczOufD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160132.jCczOufD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412160132.jCczOufD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:1044.27-1110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/pm8937.dtsi:140.9-149.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:490.27-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@1d9: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@1d9)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@1dc: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@1dc)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:535.25-538.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p1@210)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:545.27-548.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s1-p1@211)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:565.27-568.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s3-p1@214)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:590.26-593.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@230)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:1030.11-1041.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1044 arch/arm64/boot/dts/qcom/msm8917.dtsi

18b0acbaeb056f9 Otto Pflüger 2024-12-15     8  
18b0acbaeb056f9 Otto Pflüger 2024-12-15     9  / {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    10  	interrupt-parent = <&intc>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    11  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    12  	#address-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    13  	#size-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    14  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    15  	chosen { };
18b0acbaeb056f9 Otto Pflüger 2024-12-15    16  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    17  	clocks {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    18  		sleep_clk: sleep-clk {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    19  			compatible = "fixed-clock";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    20  			#clock-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    21  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    22  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    23  		xo_board: xo-board {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    24  			compatible = "fixed-clock";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    25  			#clock-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    26  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    27  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    28  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    29  	cpus {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    30  		#address-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    31  		#size-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    32  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    33  		cpu0: cpu@100 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    34  			compatible = "arm,cortex-a53";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    35  			reg = <0x100>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    36  			device_type = "cpu";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    37  			next-level-cache = <&l2_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    38  			enable-method = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    39  			clocks = <&apcs>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    40  			operating-points-v2 = <&cpu_opp_table>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    41  			#cooling-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    42  			power-domains = <&cpu_pd0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    43  			power-domain-names = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    44  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    45  			l2_0: l2-cache {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    46  				compatible = "cache";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    47  				cache-level = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    48  				cache-unified;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    49  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    50  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    51  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    52  		cpu1: cpu@101 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    53  			compatible = "arm,cortex-a53";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    54  			reg = <0x101>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    55  			device_type = "cpu";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    56  			next-level-cache = <&l2_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    57  			enable-method = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    58  			clocks = <&apcs>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    59  			operating-points-v2 = <&cpu_opp_table>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    60  			#cooling-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    61  			power-domains = <&cpu_pd1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    62  			power-domain-names = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    63  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    64  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    65  		cpu2: cpu@102 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    66  			compatible = "arm,cortex-a53";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    67  			reg = <0x102>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    68  			device_type = "cpu";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    69  			next-level-cache = <&l2_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    70  			enable-method = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    71  			clocks = <&apcs>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    72  			operating-points-v2 = <&cpu_opp_table>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    73  			#cooling-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    74  			power-domains = <&cpu_pd2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    75  			power-domain-names = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    76  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    77  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    78  		cpu3: cpu@103 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    79  			compatible = "arm,cortex-a53";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    80  			reg = <0x103>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    81  			device_type = "cpu";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    82  			next-level-cache = <&l2_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    83  			enable-method = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    84  			clocks = <&apcs>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    85  			operating-points-v2 = <&cpu_opp_table>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    86  			#cooling-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    87  			power-domains = <&cpu_pd3>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    88  			power-domain-names = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15    89  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    90  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    91  		cpu-map {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    92  			cluster0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    93  				core0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    94  					cpu = <&cpu0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    95  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15    96  
18b0acbaeb056f9 Otto Pflüger 2024-12-15    97  				core1 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15    98  					cpu = <&cpu1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15    99  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   100  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   101  				core2 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   102  					cpu = <&cpu2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   103  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   104  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   105  				core3 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   106  					cpu = <&cpu3>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   107  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   108  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   109  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   110  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   111  		domain-idle-states {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   112  			cluster_sleep_0: cluster-sleep-0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   113  				compatible = "domain-idle-state";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   114  				arm,psci-suspend-param = <0x41000053>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   115  				entry-latency-us = <700>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   116  				exit-latency-us = <1000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   117  				min-residency-us = <6500>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   118  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   119  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   120  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   121  		idle-states {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   122  			entry-method = "psci";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   123  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   124  			cpu_sleep_0: cpu-sleep-0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   125  				compatible = "arm,idle-state";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   126  				idle-state-name = "standalone-power-collapse";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   127  				arm,psci-suspend-param = <0x40000003>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   128  				entry-latency-us = <125>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   129  				exit-latency-us = <180>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   130  				min-residency-us = <595>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   131  				local-timer-stop;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   132  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   133  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   134  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   135  		cpu_opp_table: opp-table-cpu {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   136  			compatible = "operating-points-v2";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   137  			opp-shared;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   138  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   139  			opp-960000000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   140  				opp-hz = /bits/ 64 <960000000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   141  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   142  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   143  			opp-1094400000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   144  				opp-hz = /bits/ 64 <1094400000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   145  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   146  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   147  			opp-1248000000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   148  				opp-hz = /bits/ 64 <1248000000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   149  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   150  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   151  			opp-1401600000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   152  				opp-hz = /bits/ 64 <1401600000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   153  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   154  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   155  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   156  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   157  	firmware {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   158  		scm: scm {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   159  			compatible = "qcom,scm-msm8916", "qcom,scm";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   160  			clocks = <&gcc GCC_CRYPTO_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   161  				 <&gcc GCC_CRYPTO_AXI_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   162  				 <&gcc GCC_CRYPTO_AHB_CLK>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   163  			clock-names = "core", "bus", "iface";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   164  			#reset-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   165  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   166  			qcom,dload-mode = <&tcsr 0x6100>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   167  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   168  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   169  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   170  	memory@80000000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   171  		/* We expect the bootloader to fill in the reg */
18b0acbaeb056f9 Otto Pflüger 2024-12-15   172  		reg = <0 0x80000000 0 0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   173  		device_type = "memory";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   174  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   175  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   176  	pmu {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   177  		compatible = "arm,cortex-a53-pmu";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   178  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   179  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   180  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   181  	psci {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   182  		compatible = "arm,psci-1.0";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   183  		method = "smc";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   184  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   185  		cluster_pd: power-domain-cluster {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   186  			#power-domain-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   187  			domain-idle-states = <&cluster_sleep_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   188  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   189  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   190  		cpu_pd0: power-domain-cpu0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   191  			#power-domain-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   192  			power-domains = <&cluster_pd>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   193  			domain-idle-states = <&cpu_sleep_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   194  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   195  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   196  		cpu_pd1: power-domain-cpu1 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   197  			#power-domain-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   198  			power-domains = <&cluster_pd>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   199  			domain-idle-states = <&cpu_sleep_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   200  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   201  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   202  		cpu_pd2: power-domain-cpu2 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   203  			#power-domain-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   204  			power-domains = <&cluster_pd>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   205  			domain-idle-states = <&cpu_sleep_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   206  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   207  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   208  		cpu_pd3: power-domain-cpu3 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   209  			#power-domain-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   210  			power-domains = <&cluster_pd>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   211  			domain-idle-states = <&cpu_sleep_0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   212  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   213  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   214  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   215  	rpm: remoteproc {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   216  		compatible = "qcom,msm8917-rpm-proc", "qcom,rpm-proc";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   217  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   218  		smd-edge {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   219  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   220  			qcom,ipc = <&apcs 8 0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   221  			qcom,smd-edge = <15>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   222  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   223  			rpm_requests: rpm-requests {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   224  				compatible = "qcom,rpm-msm8917", "qcom,smd-rpm";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   225  				qcom,smd-channels = "rpm_requests";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   226  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   227  				rpmcc: clock-controller {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   228  					compatible = "qcom,rpmcc-msm8917", "qcom,rpmcc";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   229  					#clock-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   230  					clocks = <&xo_board>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   231  					clock-names = "xo";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   232  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   233  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   234  				rpmpd: power-controller {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   235  					compatible = "qcom,msm8917-rpmpd";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   236  					#power-domain-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   237  					operating-points-v2 = <&rpmpd_opp_table>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   238  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   239  					rpmpd_opp_table: opp-table {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   240  						compatible = "operating-points-v2";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   241  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   242  						rpmpd_opp_ret: opp1 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   243  							opp-level = <RPM_SMD_LEVEL_RETENTION>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   244  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   245  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   246  						rpmpd_opp_ret_plus: opp2 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   247  							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   248  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   249  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   250  						rpmpd_opp_min_svs: opp3 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   251  							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   252  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   253  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   254  						rpmpd_opp_low_svs: opp4 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   255  							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   256  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   257  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   258  						rpmpd_opp_svs: opp5 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   259  							opp-level = <RPM_SMD_LEVEL_SVS>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   260  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   261  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   262  						rpmpd_opp_svs_plus: opp6 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   263  							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   264  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   265  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   266  						rpmpd_opp_nom: opp7 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   267  							opp-level = <RPM_SMD_LEVEL_NOM>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   268  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   269  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   270  						rpmpd_opp_nom_plus: opp8 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   271  							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   272  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   273  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   274  						rpmpd_opp_turbo: opp9 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   275  							opp-level = <RPM_SMD_LEVEL_TURBO>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   276  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   277  					};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   278  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   279  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   280  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   281  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   282  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   283  	reserved-memory {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   284  		ranges;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   285  		#address-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   286  		#size-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   287  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   288  		qseecom_mem: qseecom@85b00000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   289  			reg = <0x0 0x85b00000 0x0 0x800000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   290  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   291  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   292  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   293  		smem@86300000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   294  			compatible = "qcom,smem";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   295  			reg = <0x0 0x86300000 0x0 0x100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   296  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   297  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   298  			hwlocks = <&tcsr_mutex 3>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   299  			qcom,rpm-msg-ram = <&rpm_msg_ram>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   300  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   301  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   302  		reserved@86400000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   303  			reg = <0x0 0x86400000 0x0 0x400000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   304  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   305  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   306  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   307  		rmtfs@92100000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   308  			compatible = "qcom,rmtfs-mem";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   309  			reg = <0x0 0x92100000 0x0 0x180000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   310  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   311  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   312  			qcom,client-id = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   313  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   314  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   315  		adsp_mem: adsp {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   316  			size = <0x0 0x1100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   317  			alignment = <0x0 0x100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   318  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   319  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   320  			status = "disabled";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   321  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   322  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   323  		mba_mem: mba {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   324  			size = <0x0 0x100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   325  			alignment = <0x0 0x100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   326  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   327  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   328  			status = "disabled";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   329  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   330  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   331  		venus_mem: venus {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   332  			size = <0x0 0x400000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   333  			alignment = <0x0 0x100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   334  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   335  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   336  			status = "disabled";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   337  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   338  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   339  		wcnss_mem: wcnss {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   340  			size = <0x0 0x700000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   341  			alignment = <0x0 0x100000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   342  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   343  			no-map;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   344  			status = "disabled";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   345  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   346  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   347  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   348  	smp2p-adsp {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   349  		compatible = "qcom,smp2p";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   350  		qcom,smem = <443>, <429>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   351  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   352  		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   353  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   354  		mboxes = <&apcs 10>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   355  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   356  		qcom,local-pid = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   357  		qcom,remote-pid = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   358  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   359  		adsp_smp2p_out: master-kernel {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   360  			qcom,entry-name = "master-kernel";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   361  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   362  			#qcom,smem-state-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   363  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   364  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   365  		adsp_smp2p_in: slave-kernel {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   366  			qcom,entry-name = "slave-kernel";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   367  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   368  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   369  			#interrupt-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   370  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   371  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   372  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   373  	smp2p-modem {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   374  		compatible = "qcom,smp2p";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   375  		qcom,smem = <435>, <428>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   376  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   377  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   378  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   379  		mboxes = <&apcs 14>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   380  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   381  		qcom,local-pid = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   382  		qcom,remote-pid = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   383  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   384  		modem_smp2p_out: master-kernel {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   385  			qcom,entry-name = "master-kernel";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   386  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   387  			#qcom,smem-state-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   388  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   389  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   390  		modem_smp2p_in: slave-kernel {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   391  			qcom,entry-name = "slave-kernel";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   392  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   393  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   394  			#interrupt-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   395  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   396  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   397  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   398  	smp2p-wcnss {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   399  		compatible = "qcom,smp2p";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   400  		qcom,smem = <451>, <431>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   401  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   402  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   403  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   404  		mboxes = <&apcs 18>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   405  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   406  		qcom,local-pid = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   407  		qcom,remote-pid = <4>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   408  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   409  		wcnss_smp2p_out: master-kernel {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   410  			qcom,entry-name = "master-kernel";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   411  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   412  			#qcom,smem-state-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   413  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   414  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   415  		wcnss_smp2p_in: slave-kernel {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   416  			qcom,entry-name = "slave-kernel";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   417  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   418  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   419  			#interrupt-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   420  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   421  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   422  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   423  	smsm {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   424  		compatible = "qcom,smsm";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   425  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   426  		#address-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   427  		#size-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   428  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   429  		mboxes = <0>, <&apcs 13>, <0>, <&apcs 19>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   430  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   431  		apps_smsm: apps@0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   432  			reg = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   433  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   434  			#qcom,smem-state-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   435  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   436  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   437  		hexagon_smsm: hexagon@1 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   438  			reg = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   439  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   440  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   441  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   442  			#interrupt-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   443  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   444  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   445  		wcnss_smsm: wcnss@6 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   446  			reg = <6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   447  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   448  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   449  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   450  			#interrupt-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   451  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   452  	};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   453  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   454  	soc: soc@0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   455  		compatible = "simple-bus";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   456  		ranges = <0 0 0 0xffffffff>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   457  		#address-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   458  		#size-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   459  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   460  		rpm_msg_ram: sram@60000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   461  			compatible = "qcom,rpm-msg-ram";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   462  			reg = <0x00060000 0x8000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   463  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   464  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   465  		usb_hs_phy: phy@6c000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   466  			compatible = "qcom,usb-hs-28nm-femtophy";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   467  			reg = <0x0006c000 0x200>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   468  			#phy-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   469  			clocks = <&xo_board>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   470  				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   471  				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   472  			clock-names = "ref", "ahb", "sleep";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   473  			resets = <&gcc GCC_QUSB2_PHY_BCR>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   474  				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   475  			reset-names = "phy", "por";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   476  			status = "disabled";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   477  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   478  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   479  		qfprom: qfprom@a4000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   480  			compatible = "qcom,msm8917-qfprom", "qcom,qfprom";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   481  			reg = <0x000a4000 0x1000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   482  			#address-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   483  			#size-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   484  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   485  			tsens_base1: base1@1d8 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   486  				reg = <0x1d8 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   487  				bits = <0 8>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   488  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   489  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   490  			tsens_s5_p1: s5-p1@1d9 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   491  				reg = <0x1d9 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   492  				bits = <0 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   493  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   494  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   495  			tsens_s5_p2: s5-p2@1d9 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   496  				reg = <0x1d9 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   497  				bits = <6 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   498  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   499  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   500  			tsens_s6_p1: s6-p1@1da {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   501  				reg = <0x1da 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   502  				bits = <4 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   503  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   504  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   505  			tsens_s6_p2: s6-p2@1db {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   506  				reg = <0x1db 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   507  				bits = <2 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   508  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   509  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   510  			tsens_s7_p1: s7-p1@1dc {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   511  				reg = <0x1dc 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   512  				bits = <0 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   513  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   514  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   515  			tsens_s7_p2: s7-p2@1dc {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   516  				reg = <0x1dc 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   517  				bits = <6 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   518  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   519  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   520  			tsens_s8_p1: s8-p1@1dd {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   521  				reg = <0x1dd 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   522  				bits = <4 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   523  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   524  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   525  			tsens_s8_p2: s8-p2@1de {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   526  				reg = <0x1de 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   527  				bits = <2 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   528  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   529  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   530  			tsens_base2: base2@1df {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   531  				reg = <0x1df 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   532  				bits = <0 8>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   533  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   534  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   535  			tsens_mode: mode@210 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   536  				reg = <0x210 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   537  				bits = <0 3>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   538  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   539  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   540  			tsens_s0_p1: s0-p1@210 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   541  				reg = <0x210 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   542  				bits = <3 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   543  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   544  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   545  			tsens_s0_p2: s0-p2@211 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   546  				reg = <0x211 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   547  				bits = <1 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   548  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   549  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   550  			tsens_s1_p1: s1-p1@211 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   551  				reg = <0x211 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   552  				bits = <7 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   553  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   554  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   555  			tsens_s1_p2: s1-p2@212 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   556  				reg = <0x212 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   557  				bits = <5 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   558  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   559  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   560  			tsens_s2_p1: s2-p1@213 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   561  				reg = <0x213 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   562  				bits = <3 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   563  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   564  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   565  			tsens_s2_p2: s2-p2@214 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   566  				reg = <0x214 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   567  				bits = <1 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   568  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   569  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   570  			tsens_s3_p1: s3-p1@214 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   571  				reg = <0x214 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   572  				bits = <7 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   573  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   574  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   575  			tsens_s3_p2: s3-p2@215 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   576  				reg = <0x215 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   577  				bits = <5 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   578  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   579  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   580  			tsens_s4_p1: s4-p1@216 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   581  				reg = <0x216 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   582  				bits = <3 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   583  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   584  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   585  			tsens_s4_p2: s4-p2@217 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   586  				reg = <0x217 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   587  				bits = <1 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   588  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   589  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   590  			tsens_s9_p1: s9-p1@230{
18b0acbaeb056f9 Otto Pflüger 2024-12-15   591  				reg = <0x230 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   592  				bits = <0 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   593  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   594  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   595  			tsens_s9_p2: s9-p2@230 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   596  				reg = <0x230 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   597  				bits = <6 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   598  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   599  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   600  			tsens_s10_p1: s10-p1@231 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   601  				reg = <0x231 2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   602  				bits = <4 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   603  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   604  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   605  			tsens_s10_p2: s10-p2@232 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   606  				reg = <0x232 1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   607  				bits = <2 6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   608  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   609  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   610  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   611  		rng@e3000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   612  			compatible = "qcom,prng";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   613  			reg = <0x000e3000 0x1000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   614  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   615  			clock-names = "core";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   616  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   617  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   618  		tsens: thermal-sensor@4a9000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   619  			compatible = "qcom,msm8937-tsens", "qcom,tsens-v1";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   620  			reg = <0x004a9000 0x1000>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   621  			      <0x004a8000 0x1000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   622  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   623  			interrupt-names = "uplow";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   624  			nvmem-cells = <&tsens_mode>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   625  				      <&tsens_base1>, <&tsens_base2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   626  				      <&tsens_s0_p1>, <&tsens_s0_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   627  				      <&tsens_s1_p1>, <&tsens_s1_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   628  				      <&tsens_s2_p1>, <&tsens_s2_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   629  				      <&tsens_s3_p1>, <&tsens_s3_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   630  				      <&tsens_s4_p1>, <&tsens_s4_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   631  				      <&tsens_s5_p1>, <&tsens_s5_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   632  				      <&tsens_s6_p1>, <&tsens_s6_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   633  				      <&tsens_s7_p1>, <&tsens_s7_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   634  				      <&tsens_s8_p1>, <&tsens_s8_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   635  				      <&tsens_s9_p1>, <&tsens_s9_p2>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   636  				      <&tsens_s10_p1>, <&tsens_s10_p2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   637  			nvmem-cell-names = "mode",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   638  					   "base1", "base2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   639  					   "s0_p1", "s0_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   640  					   "s1_p1", "s1_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   641  					   "s2_p1", "s2_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   642  					   "s3_p1", "s3_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   643  					   "s4_p1", "s4_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   644  					   "s5_p1", "s5_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   645  					   "s6_p1", "s6_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   646  					   "s7_p1", "s7_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   647  					   "s8_p1", "s8_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   648  					   "s9_p1", "s9_p2",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   649  					   "s10_p1", "s10_p2";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   650  			#qcom,sensors = <11>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   651  			#thermal-sensor-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   652  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   653  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   654  		restart@4ab000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   655  			compatible = "qcom,pshold";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   656  			reg = <0x004ab000 0x4>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   657  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   658  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   659  		tlmm: pinctrl@1000000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   660  			compatible = "qcom,msm8917-pinctrl";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   661  			reg = <0x01000000 0x300000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   662  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   663  			gpio-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   664  			gpio-ranges = <&tlmm 0 0 134>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   665  			#gpio-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   666  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   667  			#interrupt-cells = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   668  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   669  			blsp1_i2c2_default: blsp1-i2c2-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   670  				pins = "gpio6", "gpio7";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   671  				function = "blsp_i2c2";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   672  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   673  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   674  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   675  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   676  			blsp1_i2c2_sleep: blsp1-i2c2-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   677  				pins = "gpio6", "gpio7";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   678  				function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   679  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   680  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   681  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   682  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   683  			blsp1_i2c3_default: blsp1-i2c3-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   684  				pins = "gpio10", "gpio11";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   685  				function = "blsp_i2c3";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   686  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   687  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   688  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   689  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   690  			blsp1_i2c3_sleep: blsp1-i2c3-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   691  				pins = "gpio10", "gpio11";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   692  				function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   693  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   694  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   695  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   696  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   697  			blsp1_i2c4_default: blsp1-i2c4-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   698  				pins = "gpio14", "gpio15";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   699  				function = "blsp_i2c4";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   700  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   701  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   702  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   703  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   704  			blsp1_i2c4_sleep: blsp1-i2c4-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   705  				pins = "gpio14", "gpio15";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   706  				function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   707  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   708  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   709  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   710  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   711  			blsp2_i2c1_default: blsp2-i2c1-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   712  				pins = "gpio18", "gpio19";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   713  				function = "blsp_i2c5";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   714  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   715  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   716  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   717  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   718  			blsp2_i2c1_sleep: blsp2-i2c1-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   719  				pins = "gpio18", "gpio19";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   720  				function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   721  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   722  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   723  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   724  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   725  			blsp1_spi3_default: blsp1-spi3-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   726  				cs-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   727  					pins = "gpio10";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   728  					function = "blsp_spi3";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   729  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   730  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   731  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   732  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   733  				spi-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   734  					pins = "gpio8", "gpio9", "gpio11";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   735  					function = "blsp_spi3";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   736  					drive-strength = <12>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   737  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   738  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   739  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   740  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   741  			blsp1_spi3_sleep: blsp1-spi3-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   742  				cs-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   743  					pins = "gpio10";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   744  					function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   745  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   746  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   747  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   748  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   749  				spi-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   750  					pins = "gpio8", "gpio9", "gpio11";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   751  					function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   752  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   753  					bias-pull-down;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   754  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   755  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   756  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   757  			blsp2_spi2_default: blsp2-spi2-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   758  				cs0-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   759  					pins = "gpio47";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   760  					function = "blsp_spi6";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   761  					drive-strength = <16>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   762  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   763  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   764  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   765  				cs1-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   766  					pins = "gpio22";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   767  					function = "blsp_spi6";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   768  					drive-strength = <16>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   769  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   770  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   771  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   772  				spi-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   773  					pins = "gpio20", "gpio21", "gpio23";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   774  					function = "blsp_spi6";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   775  					drive-strength = <16>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   776  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   777  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   778  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   779  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   780  			blsp2_spi2_sleep: blsp2-spi2-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   781  				cs0-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   782  					pins = "gpio47";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   783  					function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   784  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   785  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   786  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   787  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   788  				cs1-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   789  					pins = "gpio22";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   790  					function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   791  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   792  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   793  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   794  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   795  				spi-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   796  					pins = "gpio20", "gpio21", "gpio23";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   797  					function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   798  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   799  					bias-pull-down;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   800  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   801  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   802  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   803  			blsp1_uart1_default: blsp1-uart1-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   804  				pins = "gpio0", "gpio1", "gpio2", "gpio3";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   805  				function = "blsp_uart1";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   806  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   807  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   808  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   809  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   810  			blsp1_uart1_sleep: blsp1-uart1-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   811  				pins = "gpio0", "gpio1", "gpio2", "gpio3";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   812  				function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   813  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   814  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   815  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   816  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   817  			blsp1_uart2_default: blsp1-uart2-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   818  				pins = "gpio4", "gpio5";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   819  				function = "blsp_uart2";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   820  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   821  				bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   822  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   823  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   824  			blsp1_uart2_sleep: blsp1-uart2-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   825  				pins = "gpio4", "gpio5";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   826  				function = "gpio";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   827  				drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   828  				bias-pull-down;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   829  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   830  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   831  			sdc1_default: sdc1-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   832  				clk-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   833  					pins = "sdc1_clk";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   834  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   835  					drive-strength = <16>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   836  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   837  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   838  				cmd-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   839  					pins = "sdc1_cmd";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   840  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   841  					drive-strength = <10>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   842  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   843  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   844  				data-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   845  					pins = "sdc1_data";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   846  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   847  					drive-strength = <10>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   848  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   849  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   850  				rclk-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   851  					pins = "sdc1_rclk";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   852  					bias-pull-down;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   853  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   854  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   855  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   856  			sdc1_sleep: sdc1-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   857  				clk-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   858  					pins = "sdc1_clk";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   859  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   860  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   861  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   862  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   863  				cmd-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   864  					pins = "sdc1_cmd";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   865  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   866  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   867  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   868  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   869  				data-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   870  					pins = "sdc1_data";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   871  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   872  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   873  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   874  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   875  				rclk-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   876  					pins = "sdc1_rclk";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   877  					bias-pull-down;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   878  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   879  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   880  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   881  			sdc2_default: sdc2-default-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   882  				clk-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   883  					pins = "sdc2_clk";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   884  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   885  					drive-strength = <16>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   886  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   887  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   888  				cmd-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   889  					pins = "sdc2_cmd";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   890  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   891  					drive-strength = <10>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   892  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   893  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   894  				data-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   895  					pins = "sdc2_data";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   896  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   897  					drive-strength = <10>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   898  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   899  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   900  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   901  			sdc2_sleep: sdc2-sleep-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   902  				clk-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   903  					pins = "sdc2_clk";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   904  					bias-disable;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   905  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   906  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   907  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   908  				cmd-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   909  					pins = "sdc2_cmd";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   910  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   911  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   912  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   913  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   914  				data-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   915  					pins = "sdc2_data";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   916  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   917  					drive-strength = <2>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   918  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   919  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   920  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   921  			wcnss_pin_a: wcnss-active-state {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   922  				wcss-wlan-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   923  					pins = "gpio79", "gpio80";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   924  					function = "wcss_wlan";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   925  					drive-strength = <6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   926  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   927  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   928  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   929  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   930  				wcss-wlan0-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   931  					pins = "gpio78";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   932  					function = "wcss_wlan0";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   933  					drive-strength = <6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   934  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   935  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   936  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   937  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   938  				wcss-wlan1-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   939  					pins = "gpio77";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   940  					function = "wcss_wlan1";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   941  					drive-strength = <6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   942  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   943  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   944  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   945  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   946  				wcss-wlan2-pins {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   947  					pins = "gpio76";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   948  					function = "wcss_wlan2";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   949  					drive-strength = <6>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   950  					bias-pull-up;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   951  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   952  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   953  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   954  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   955  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   956  		gcc: clock-controller@1800000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   957  			compatible = "qcom,gcc-msm8917";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   958  			reg = <0x01800000 0x80000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   959  			#clock-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   960  			#reset-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   961  			#power-domain-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   962  			clocks = <&xo_board>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   963  				 <&sleep_clk>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   964  				 <&mdss_dsi0_phy 1>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   965  				 <&mdss_dsi0_phy 0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   966  			clock-names = "xo",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   967  				      "sleep_clk",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   968  				      "dsi0pll",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   969  				      "dsi0pllbyte";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   970  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   971  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   972  		tcsr_mutex: hwlock@1905000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   973  			compatible = "qcom,tcsr-mutex";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   974  			reg = <0x01905000 0x20000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   975  			#hwlock-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   976  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   977  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   978  		tcsr: syscon@1937000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   979  			compatible = "qcom,tcsr-msm8917", "syscon";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   980  			reg = <0x01937000 0x30000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   981  		};
18b0acbaeb056f9 Otto Pflüger 2024-12-15   982  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   983  		mdss: display-subsystem@1a00000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15   984  			compatible = "qcom,mdss";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   985  			reg = <0x01a00000 0x1000>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   986  			      <0x01ab0000 0x1040>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   987  			reg-names = "mdss_phys", "vbif_phys";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   988  			ranges;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   989  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   990  			power-domains = <&gcc MDSS_GDSC>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   991  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   992  			clocks = <&gcc GCC_MDSS_AHB_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   993  				 <&gcc GCC_MDSS_AXI_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15   994  				 <&gcc GCC_MDSS_VSYNC_CLK>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15   995  			clock-names = "iface",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   996  				      "bus",
18b0acbaeb056f9 Otto Pflüger 2024-12-15   997  				      "vsync";
18b0acbaeb056f9 Otto Pflüger 2024-12-15   998  
18b0acbaeb056f9 Otto Pflüger 2024-12-15   999  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1000  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1001  			interrupt-controller;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1002  			#interrupt-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1003  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1004  			#address-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1005  			#size-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1006  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1007  			status = "disabled";
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1008  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1009  			mdp: display-controller@1a01000 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1010  				compatible = "qcom,msm8917-mdp5", "qcom,mdp5";
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1011  				reg = <0x01a01000 0x89000>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1012  				reg-names = "mdp_phys";
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1013  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1014  				interrupt-parent = <&mdss>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1015  				interrupts = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1016  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1017  				power-domains = <&gcc MDSS_GDSC>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1018  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1019  				clocks = <&gcc GCC_MDSS_AHB_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1020  					 <&gcc GCC_MDSS_AXI_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1021  					 <&gcc GCC_MDSS_MDP_CLK>,
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1022  					 <&gcc GCC_MDSS_VSYNC_CLK>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1023  				clock-names = "iface",
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1024  					      "bus",
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1025  					      "core",
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1026  					      "vsync";
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1027  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1028  				iommus = <&apps_iommu 0x15>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1029  
18b0acbaeb056f9 Otto Pflüger 2024-12-15 @1030  				ports {
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1031  					#address-cells = <1>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1032  					#size-cells = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1033  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1034  					port@0 {
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1035  						reg = <0>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1036  
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1037  						mdp5_intf1_out: endpoint {
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1038  							remote-endpoint = <&mdss_dsi0_in>;
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1039  						};
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1040  					};
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1041  				};
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1042  			};
18b0acbaeb056f9 Otto Pflüger 2024-12-15  1043  
18b0acbaeb056f9 Otto Pflüger 2024-12-15 @1044  			mdss_dsi0: dsi@1a94000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
