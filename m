Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C418A93F
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Jul 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753862204; cv=none; b=CHOOt1ur1MZlHljm/sWLH0E14Wor9IExAt5qznFbw1rNtoKl8li2w/PmfF+GEl/te1DyxYD5d2OXQiSU4tu7l2c42lEJRl/bOG8vS2LGYELRbh3+uzBr+DpBno0EcuuJ6s0kyg7fTrLJz/57C8hRAV4gFqo6FuAwqEI2mwlxZ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753862204; c=relaxed/simple;
	bh=3dheY2YZWhuoXIo/bjjarJiIxsH+Apy/f6a/m0YDn/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AeBxJsWrRlxMcBSqpoAY4RRLHloyj/sfWVHg6nRoj5FkzqjF6rZbqQsVB22CwJjLaHiWMT09hwvbEJxKAUS/y7fZYJ5/MQo2McgZIhc8huxA8OSRbMLEX5Fo+bT3J9MSmlEY9cW2Jaf1kyc4mdKckKgV94zEpne/G6Y/ctsot9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn5wsHzq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn5wsHzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753862190; x=1785398190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dheY2YZWhuoXIo/bjjarJiIxsH+Apy/f6a/m0YDn/o=;
  b=bn5wsHzqEyylIlDrwwQzxaKafH+wOe9mef8a8Z+/k2Jr7K1R3iZBk2XH
   Jifbi/mTbHqpsD3LYLZB1FVsvAayfoyNNLwQjqYCtEVnlY8U83cizYAtU
   tBBPpZPl2QlOKXsqaCNsSrwPv8gG8X/907WYr75byRh+kpfyqg9sUWiNg
   hjKI/pzHM+tcYvZuu9g+HOi66B/GFHvF02VeOwbgLm45fFU+WIUwgOV2p
   bsQnJjQYhoK6OjseEMP6T8XrOi29mgeEAayr5I9zeji2hPs6U3cXjUh4l
   IJ/qNG19RScBIACXD+/kzAKNZbMLnwUVoVJRlZhQ0b1+yFqOCdTJEhGjb
   g==;
X-CSE-ConnectionGUID: gdX6/mb2QVq6Xp+hr9H0pQ==
X-CSE-MsgGUID: caBqE2QGSmWolD7IHfqUcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66852891"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66852891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:56:30 -0700
X-CSE-ConnectionGUID: qv0+rJdHRR6PIEV4QvCB7A==
X-CSE-MsgGUID: mCWugWqrSGqqhcXKPwTURA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193766336"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2025 00:56:27 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh1fl-0002BQ-00;
	Wed, 30 Jul 2025 07:56:25 +0000
Date: Wed, 30 Jul 2025 15:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Flatten the USB nodes
Message-ID: <202507301536.CHX0HL44-lkp@intel.com>
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
In-Reply-To: <20250729-topic-sm8x50-usb-flatten-v1-2-4be74a629136@linaro.org>
References: <20250729-topic-sm8x50-usb-flatten-v1-2-4be74a629136@linaro.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Neil Armstrong <neil.armstrong@linaro.org>

Hi Neil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 54efec8782214652b331c50646013f8526570e8d]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/arm64-dts-qcom-sm8550-Flatten-the-USB-nodes/20250729-230044
base:   54efec8782214652b331c50646013f8526570e8d
patch link:    https://lore.kernel.org/r/20250729-topic-sm8x50-usb-flatten-v1-2-4be74a629136%40linaro.org
patch subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Flatten the USB nodes
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-003-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301536.CHX0HL44-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301536.CHX0HL44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507301536.CHX0HL44-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5295.27-5370.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5654.22-5745.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5654.22-5745.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5654.22-5745.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +5654 arch/arm64/boot/dts/qcom/sm8650.dtsi

d2350377997f36 Neil Armstrong        2023-11-30    30  
d2350377997f36 Neil Armstrong        2023-11-30    31  / {
d2350377997f36 Neil Armstrong        2023-11-30    32  	interrupt-parent = <&intc>;
d2350377997f36 Neil Armstrong        2023-11-30    33  
d2350377997f36 Neil Armstrong        2023-11-30    34  	#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    35  	#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    36  
d2350377997f36 Neil Armstrong        2023-11-30    37  	chosen { };
d2350377997f36 Neil Armstrong        2023-11-30    38  
d2350377997f36 Neil Armstrong        2023-11-30    39  	clocks {
d2350377997f36 Neil Armstrong        2023-11-30    40  		xo_board: xo-board {
d2350377997f36 Neil Armstrong        2023-11-30    41  			compatible = "fixed-clock";
d2350377997f36 Neil Armstrong        2023-11-30    42  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    43  		};
d2350377997f36 Neil Armstrong        2023-11-30    44  
d2350377997f36 Neil Armstrong        2023-11-30    45  		sleep_clk: sleep-clk {
d2350377997f36 Neil Armstrong        2023-11-30    46  			compatible = "fixed-clock";
d2350377997f36 Neil Armstrong        2023-11-30    47  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    48  		};
d2350377997f36 Neil Armstrong        2023-11-30    49  
d2350377997f36 Neil Armstrong        2023-11-30    50  		bi_tcxo_div2: bi-tcxo-div2-clk {
d2350377997f36 Neil Armstrong        2023-11-30    51  			compatible = "fixed-factor-clock";
d2350377997f36 Neil Armstrong        2023-11-30    52  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    53  
d2350377997f36 Neil Armstrong        2023-11-30    54  			clocks = <&rpmhcc RPMH_CXO_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30    55  			clock-mult = <1>;
d2350377997f36 Neil Armstrong        2023-11-30    56  			clock-div = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    57  		};
d2350377997f36 Neil Armstrong        2023-11-30    58  
d2350377997f36 Neil Armstrong        2023-11-30    59  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
d2350377997f36 Neil Armstrong        2023-11-30    60  			compatible = "fixed-factor-clock";
d2350377997f36 Neil Armstrong        2023-11-30    61  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    62  
d2350377997f36 Neil Armstrong        2023-11-30    63  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
d2350377997f36 Neil Armstrong        2023-11-30    64  			clock-mult = <1>;
d2350377997f36 Neil Armstrong        2023-11-30    65  			clock-div = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    66  		};
d2350377997f36 Neil Armstrong        2023-11-30    67  	};
d2350377997f36 Neil Armstrong        2023-11-30    68  
d2350377997f36 Neil Armstrong        2023-11-30    69  	cpus {
d2350377997f36 Neil Armstrong        2023-11-30    70  		#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    71  		#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    72  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    73  		cpu0: cpu@0 {
d2350377997f36 Neil Armstrong        2023-11-30    74  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30    75  			compatible = "arm,cortex-a520";
d2350377997f36 Neil Armstrong        2023-11-30    76  			reg = <0 0>;
d2350377997f36 Neil Armstrong        2023-11-30    77  
d2350377997f36 Neil Armstrong        2023-11-30    78  			clocks = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30    79  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    80  			power-domains = <&cpu_pd0>;
d2350377997f36 Neil Armstrong        2023-11-30    81  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30    82  
d2350377997f36 Neil Armstrong        2023-11-30    83  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    84  			next-level-cache = <&l2_0>;
d2350377997f36 Neil Armstrong        2023-11-30    85  			capacity-dmips-mhz = <1024>;
d2350377997f36 Neil Armstrong        2023-11-30    86  			dynamic-power-coefficient = <100>;
d2350377997f36 Neil Armstrong        2023-11-30    87  
d2350377997f36 Neil Armstrong        2023-11-30    88  			qcom,freq-domain = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30    89  
c24db2c178578a Neil Armstrong        2025-02-11    90  			operating-points-v2 = <&cpu0_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11    91  
c9658c3963b8a5 Neil Armstrong        2025-02-11    92  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11    93  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11    94  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11    95  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11    96  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11    97  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11    98  
d2350377997f36 Neil Armstrong        2023-11-30    99  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   100  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   101  			l2_0: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   102  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   103  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   104  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   105  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   106  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   107  				l3_0: l3-cache {
d2350377997f36 Neil Armstrong        2023-11-30   108  					compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   109  					cache-level = <3>;
d2350377997f36 Neil Armstrong        2023-11-30   110  					cache-unified;
d2350377997f36 Neil Armstrong        2023-11-30   111  				};
d2350377997f36 Neil Armstrong        2023-11-30   112  			};
d2350377997f36 Neil Armstrong        2023-11-30   113  		};
d2350377997f36 Neil Armstrong        2023-11-30   114  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   115  		cpu1: cpu@100 {
d2350377997f36 Neil Armstrong        2023-11-30   116  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   117  			compatible = "arm,cortex-a520";
d2350377997f36 Neil Armstrong        2023-11-30   118  			reg = <0 0x100>;
d2350377997f36 Neil Armstrong        2023-11-30   119  
d2350377997f36 Neil Armstrong        2023-11-30   120  			clocks = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30   121  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   122  			power-domains = <&cpu_pd1>;
d2350377997f36 Neil Armstrong        2023-11-30   123  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   124  
d2350377997f36 Neil Armstrong        2023-11-30   125  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   126  			next-level-cache = <&l2_0>;
d2350377997f36 Neil Armstrong        2023-11-30   127  			capacity-dmips-mhz = <1024>;
d2350377997f36 Neil Armstrong        2023-11-30   128  			dynamic-power-coefficient = <100>;
d2350377997f36 Neil Armstrong        2023-11-30   129  
d2350377997f36 Neil Armstrong        2023-11-30   130  			qcom,freq-domain = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30   131  
c24db2c178578a Neil Armstrong        2025-02-11   132  			operating-points-v2 = <&cpu0_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   133  
c9658c3963b8a5 Neil Armstrong        2025-02-11   134  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   135  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   136  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   137  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   138  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   139  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   140  
d2350377997f36 Neil Armstrong        2023-11-30   141  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   142  		};
d2350377997f36 Neil Armstrong        2023-11-30   143  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   144  		cpu2: cpu@200 {
d2350377997f36 Neil Armstrong        2023-11-30   145  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   146  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   147  			reg = <0 0x200>;
d2350377997f36 Neil Armstrong        2023-11-30   148  
d2350377997f36 Neil Armstrong        2023-11-30   149  			clocks = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   150  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   151  			power-domains = <&cpu_pd2>;
d2350377997f36 Neil Armstrong        2023-11-30   152  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   153  
d2350377997f36 Neil Armstrong        2023-11-30   154  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   155  			next-level-cache = <&l2_200>;
d2350377997f36 Neil Armstrong        2023-11-30   156  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   157  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   158  
d2350377997f36 Neil Armstrong        2023-11-30   159  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   160  
c24db2c178578a Neil Armstrong        2025-02-11   161  			operating-points-v2 = <&cpu2_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   162  
c9658c3963b8a5 Neil Armstrong        2025-02-11   163  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   164  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   165  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   166  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   167  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   168  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   169  
d2350377997f36 Neil Armstrong        2023-11-30   170  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   171  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   172  			l2_200: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   173  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   174  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   175  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   176  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   177  			};
d2350377997f36 Neil Armstrong        2023-11-30   178  		};
d2350377997f36 Neil Armstrong        2023-11-30   179  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   180  		cpu3: cpu@300 {
d2350377997f36 Neil Armstrong        2023-11-30   181  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   182  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   183  			reg = <0 0x300>;
d2350377997f36 Neil Armstrong        2023-11-30   184  
d2350377997f36 Neil Armstrong        2023-11-30   185  			clocks = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   186  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   187  			power-domains = <&cpu_pd3>;
d2350377997f36 Neil Armstrong        2023-11-30   188  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   189  
d2350377997f36 Neil Armstrong        2023-11-30   190  			enable-method = "psci";
4becd72352b686 Pengyu Luo            2025-04-05   191  			next-level-cache = <&l2_300>;
d2350377997f36 Neil Armstrong        2023-11-30   192  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   193  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   194  
d2350377997f36 Neil Armstrong        2023-11-30   195  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   196  
c24db2c178578a Neil Armstrong        2025-02-11   197  			operating-points-v2 = <&cpu2_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   198  
c9658c3963b8a5 Neil Armstrong        2025-02-11   199  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   200  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   201  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   202  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   203  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   204  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   205  
d2350377997f36 Neil Armstrong        2023-11-30   206  			#cooling-cells = <2>;
4becd72352b686 Pengyu Luo            2025-04-05   207  
4becd72352b686 Pengyu Luo            2025-04-05   208  			l2_300: l2-cache {
4becd72352b686 Pengyu Luo            2025-04-05   209  				compatible = "cache";
4becd72352b686 Pengyu Luo            2025-04-05   210  				cache-level = <2>;
4becd72352b686 Pengyu Luo            2025-04-05   211  				cache-unified;
4becd72352b686 Pengyu Luo            2025-04-05   212  				next-level-cache = <&l3_0>;
4becd72352b686 Pengyu Luo            2025-04-05   213  			};
d2350377997f36 Neil Armstrong        2023-11-30   214  		};
d2350377997f36 Neil Armstrong        2023-11-30   215  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   216  		cpu4: cpu@400 {
d2350377997f36 Neil Armstrong        2023-11-30   217  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   218  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   219  			reg = <0 0x400>;
d2350377997f36 Neil Armstrong        2023-11-30   220  
d2350377997f36 Neil Armstrong        2023-11-30   221  			clocks = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   222  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   223  			power-domains = <&cpu_pd4>;
d2350377997f36 Neil Armstrong        2023-11-30   224  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   225  
d2350377997f36 Neil Armstrong        2023-11-30   226  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   227  			next-level-cache = <&l2_400>;
d2350377997f36 Neil Armstrong        2023-11-30   228  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   229  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   230  
d2350377997f36 Neil Armstrong        2023-11-30   231  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   232  
c24db2c178578a Neil Armstrong        2025-02-11   233  			operating-points-v2 = <&cpu2_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   234  
c9658c3963b8a5 Neil Armstrong        2025-02-11   235  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   236  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   237  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   238  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   239  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   240  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   241  
d2350377997f36 Neil Armstrong        2023-11-30   242  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   243  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   244  			l2_400: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   245  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   246  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   247  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   248  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   249  			};
d2350377997f36 Neil Armstrong        2023-11-30   250  		};
d2350377997f36 Neil Armstrong        2023-11-30   251  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   252  		cpu5: cpu@500 {
d2350377997f36 Neil Armstrong        2023-11-30   253  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   254  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   255  			reg = <0 0x500>;
d2350377997f36 Neil Armstrong        2023-11-30   256  
d2350377997f36 Neil Armstrong        2023-11-30   257  			clocks = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   258  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   259  			power-domains = <&cpu_pd5>;
d2350377997f36 Neil Armstrong        2023-11-30   260  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   261  
d2350377997f36 Neil Armstrong        2023-11-30   262  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   263  			next-level-cache = <&l2_500>;
d2350377997f36 Neil Armstrong        2023-11-30   264  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   265  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   266  
d2350377997f36 Neil Armstrong        2023-11-30   267  			qcom,freq-domain = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   268  
c24db2c178578a Neil Armstrong        2025-02-11   269  			operating-points-v2 = <&cpu5_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   270  
c9658c3963b8a5 Neil Armstrong        2025-02-11   271  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   272  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   273  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   274  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   275  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   276  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   277  
d2350377997f36 Neil Armstrong        2023-11-30   278  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   279  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   280  			l2_500: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   281  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   282  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   283  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   284  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   285  			};
d2350377997f36 Neil Armstrong        2023-11-30   286  		};
d2350377997f36 Neil Armstrong        2023-11-30   287  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   288  		cpu6: cpu@600 {
d2350377997f36 Neil Armstrong        2023-11-30   289  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   290  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   291  			reg = <0 0x600>;
d2350377997f36 Neil Armstrong        2023-11-30   292  
d2350377997f36 Neil Armstrong        2023-11-30   293  			clocks = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   294  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   295  			power-domains = <&cpu_pd6>;
d2350377997f36 Neil Armstrong        2023-11-30   296  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   297  
d2350377997f36 Neil Armstrong        2023-11-30   298  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   299  			next-level-cache = <&l2_600>;
d2350377997f36 Neil Armstrong        2023-11-30   300  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   301  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   302  
d2350377997f36 Neil Armstrong        2023-11-30   303  			qcom,freq-domain = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   304  
c24db2c178578a Neil Armstrong        2025-02-11   305  			operating-points-v2 = <&cpu5_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   306  
c9658c3963b8a5 Neil Armstrong        2025-02-11   307  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   308  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   309  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   310  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   311  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   312  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   313  
d2350377997f36 Neil Armstrong        2023-11-30   314  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   315  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   316  			l2_600: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   317  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   318  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   319  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   320  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   321  			};
d2350377997f36 Neil Armstrong        2023-11-30   322  		};
d2350377997f36 Neil Armstrong        2023-11-30   323  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   324  		cpu7: cpu@700 {
d2350377997f36 Neil Armstrong        2023-11-30   325  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   326  			compatible = "arm,cortex-x4";
d2350377997f36 Neil Armstrong        2023-11-30   327  			reg = <0 0x700>;
d2350377997f36 Neil Armstrong        2023-11-30   328  
d2350377997f36 Neil Armstrong        2023-11-30   329  			clocks = <&cpufreq_hw 2>;
d2350377997f36 Neil Armstrong        2023-11-30   330  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   331  			power-domains = <&cpu_pd7>;
d2350377997f36 Neil Armstrong        2023-11-30   332  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   333  
d2350377997f36 Neil Armstrong        2023-11-30   334  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   335  			next-level-cache = <&l2_700>;
d2350377997f36 Neil Armstrong        2023-11-30   336  			capacity-dmips-mhz = <1894>;
d2350377997f36 Neil Armstrong        2023-11-30   337  			dynamic-power-coefficient = <588>;
d2350377997f36 Neil Armstrong        2023-11-30   338  
d2350377997f36 Neil Armstrong        2023-11-30   339  			qcom,freq-domain = <&cpufreq_hw 2>;
d2350377997f36 Neil Armstrong        2023-11-30   340  
c24db2c178578a Neil Armstrong        2025-02-11   341  			operating-points-v2 = <&cpu7_opp_table>;
c24db2c178578a Neil Armstrong        2025-02-11   342  
c9658c3963b8a5 Neil Armstrong        2025-02-11   343  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   344  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   345  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
c9658c3963b8a5 Neil Armstrong        2025-02-11   346  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
c9658c3963b8a5 Neil Armstrong        2025-02-11   347  					<&epss_l3 MASTER_EPSS_L3_APPS
c9658c3963b8a5 Neil Armstrong        2025-02-11   348  					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
c9658c3963b8a5 Neil Armstrong        2025-02-11   349  
d2350377997f36 Neil Armstrong        2023-11-30   350  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   351  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   352  			l2_700: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   353  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   354  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   355  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   356  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   357  			};
d2350377997f36 Neil Armstrong        2023-11-30   358  		};
d2350377997f36 Neil Armstrong        2023-11-30   359  
d2350377997f36 Neil Armstrong        2023-11-30   360  		cpu-map {
d2350377997f36 Neil Armstrong        2023-11-30   361  			cluster0 {
d2350377997f36 Neil Armstrong        2023-11-30   362  				core0 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   363  					cpu = <&cpu0>;
d2350377997f36 Neil Armstrong        2023-11-30   364  				};
d2350377997f36 Neil Armstrong        2023-11-30   365  
d2350377997f36 Neil Armstrong        2023-11-30   366  				core1 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   367  					cpu = <&cpu1>;
d2350377997f36 Neil Armstrong        2023-11-30   368  				};
d2350377997f36 Neil Armstrong        2023-11-30   369  
d2350377997f36 Neil Armstrong        2023-11-30   370  				core2 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   371  					cpu = <&cpu2>;
d2350377997f36 Neil Armstrong        2023-11-30   372  				};
d2350377997f36 Neil Armstrong        2023-11-30   373  
d2350377997f36 Neil Armstrong        2023-11-30   374  				core3 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   375  					cpu = <&cpu3>;
d2350377997f36 Neil Armstrong        2023-11-30   376  				};
d2350377997f36 Neil Armstrong        2023-11-30   377  
d2350377997f36 Neil Armstrong        2023-11-30   378  				core4 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   379  					cpu = <&cpu4>;
d2350377997f36 Neil Armstrong        2023-11-30   380  				};
d2350377997f36 Neil Armstrong        2023-11-30   381  
d2350377997f36 Neil Armstrong        2023-11-30   382  				core5 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   383  					cpu = <&cpu5>;
d2350377997f36 Neil Armstrong        2023-11-30   384  				};
d2350377997f36 Neil Armstrong        2023-11-30   385  
d2350377997f36 Neil Armstrong        2023-11-30   386  				core6 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   387  					cpu = <&cpu6>;
d2350377997f36 Neil Armstrong        2023-11-30   388  				};
d2350377997f36 Neil Armstrong        2023-11-30   389  
d2350377997f36 Neil Armstrong        2023-11-30   390  				core7 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   391  					cpu = <&cpu7>;
d2350377997f36 Neil Armstrong        2023-11-30   392  				};
d2350377997f36 Neil Armstrong        2023-11-30   393  			};
d2350377997f36 Neil Armstrong        2023-11-30   394  		};
d2350377997f36 Neil Armstrong        2023-11-30   395  
d2350377997f36 Neil Armstrong        2023-11-30   396  		idle-states {
d2350377997f36 Neil Armstrong        2023-11-30   397  			entry-method = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   398  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   399  			silver_cpu_sleep_0: cpu-sleep-0-0 {
d2350377997f36 Neil Armstrong        2023-11-30   400  				compatible = "arm,idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   401  				idle-state-name = "silver-rail-power-collapse";
d2350377997f36 Neil Armstrong        2023-11-30   402  				arm,psci-suspend-param = <0x40000004>;
d2350377997f36 Neil Armstrong        2023-11-30   403  				entry-latency-us = <550>;
d2350377997f36 Neil Armstrong        2023-11-30   404  				exit-latency-us = <750>;
d2350377997f36 Neil Armstrong        2023-11-30   405  				min-residency-us = <6700>;
d2350377997f36 Neil Armstrong        2023-11-30   406  				local-timer-stop;
d2350377997f36 Neil Armstrong        2023-11-30   407  			};
d2350377997f36 Neil Armstrong        2023-11-30   408  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   409  			gold_cpu_sleep_0: cpu-sleep-1-0 {
d2350377997f36 Neil Armstrong        2023-11-30   410  				compatible = "arm,idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   411  				idle-state-name = "gold-rail-power-collapse";
d2350377997f36 Neil Armstrong        2023-11-30   412  				arm,psci-suspend-param = <0x40000004>;
d2350377997f36 Neil Armstrong        2023-11-30   413  				entry-latency-us = <600>;
d2350377997f36 Neil Armstrong        2023-11-30   414  				exit-latency-us = <1300>;
d2350377997f36 Neil Armstrong        2023-11-30   415  				min-residency-us = <8136>;
d2350377997f36 Neil Armstrong        2023-11-30   416  				local-timer-stop;
d2350377997f36 Neil Armstrong        2023-11-30   417  			};
d2350377997f36 Neil Armstrong        2023-11-30   418  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   419  			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
d2350377997f36 Neil Armstrong        2023-11-30   420  				compatible = "arm,idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   421  				idle-state-name = "gold-plus-rail-power-collapse";
d2350377997f36 Neil Armstrong        2023-11-30   422  				arm,psci-suspend-param = <0x40000004>;
d2350377997f36 Neil Armstrong        2023-11-30   423  				entry-latency-us = <500>;
d2350377997f36 Neil Armstrong        2023-11-30   424  				exit-latency-us = <1350>;
d2350377997f36 Neil Armstrong        2023-11-30   425  				min-residency-us = <7480>;
d2350377997f36 Neil Armstrong        2023-11-30   426  				local-timer-stop;
d2350377997f36 Neil Armstrong        2023-11-30   427  			};
d2350377997f36 Neil Armstrong        2023-11-30   428  		};
d2350377997f36 Neil Armstrong        2023-11-30   429  
d2350377997f36 Neil Armstrong        2023-11-30   430  		domain-idle-states {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   431  			cluster_sleep_0: cluster-sleep-0 {
d2350377997f36 Neil Armstrong        2023-11-30   432  				compatible = "domain-idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   433  				arm,psci-suspend-param = <0x41000044>;
d2350377997f36 Neil Armstrong        2023-11-30   434  				entry-latency-us = <750>;
d2350377997f36 Neil Armstrong        2023-11-30   435  				exit-latency-us = <2350>;
d2350377997f36 Neil Armstrong        2023-11-30   436  				min-residency-us = <9144>;
d2350377997f36 Neil Armstrong        2023-11-30   437  			};
d2350377997f36 Neil Armstrong        2023-11-30   438  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   439  			cluster_sleep_1: cluster-sleep-1 {
d2350377997f36 Neil Armstrong        2023-11-30   440  				compatible = "domain-idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   441  				arm,psci-suspend-param = <0x4100c344>;
d2350377997f36 Neil Armstrong        2023-11-30   442  				entry-latency-us = <2800>;
d2350377997f36 Neil Armstrong        2023-11-30   443  				exit-latency-us = <4400>;
d2350377997f36 Neil Armstrong        2023-11-30   444  				min-residency-us = <10150>;
d2350377997f36 Neil Armstrong        2023-11-30   445  			};
d2350377997f36 Neil Armstrong        2023-11-30   446  		};
d2350377997f36 Neil Armstrong        2023-11-30   447  	};
d2350377997f36 Neil Armstrong        2023-11-30   448  
aeb520ce520a2f Neil Armstrong        2025-02-27   449  	ete-0 {
256e6937e48a14 Yuanfang Zhang        2025-01-07   450  		compatible = "arm,embedded-trace-extension";
256e6937e48a14 Yuanfang Zhang        2025-01-07   451  
256e6937e48a14 Yuanfang Zhang        2025-01-07   452  		cpu = <&cpu0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   453  
256e6937e48a14 Yuanfang Zhang        2025-01-07   454  		out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07   455  			port {
256e6937e48a14 Yuanfang Zhang        2025-01-07   456  				ete0_out_funnel_ete: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07   457  					remote-endpoint = <&funnel_ete_in_ete0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   458  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07   459  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07   460  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07   461  	};
256e6937e48a14 Yuanfang Zhang        2025-01-07   462  
aeb520ce520a2f Neil Armstrong        2025-02-27   463  	ete-1 {
aeb520ce520a2f Neil Armstrong        2025-02-27   464  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   465  
aeb520ce520a2f Neil Armstrong        2025-02-27   466  		cpu = <&cpu1>;
aeb520ce520a2f Neil Armstrong        2025-02-27   467  
aeb520ce520a2f Neil Armstrong        2025-02-27   468  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   469  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   470  				ete1_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   471  					remote-endpoint = <&funnel_ete_in_ete1>;
aeb520ce520a2f Neil Armstrong        2025-02-27   472  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   473  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   474  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   475  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   476  
aeb520ce520a2f Neil Armstrong        2025-02-27   477  	ete-2 {
aeb520ce520a2f Neil Armstrong        2025-02-27   478  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   479  
aeb520ce520a2f Neil Armstrong        2025-02-27   480  		cpu = <&cpu2>;
aeb520ce520a2f Neil Armstrong        2025-02-27   481  
aeb520ce520a2f Neil Armstrong        2025-02-27   482  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   483  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   484  				ete2_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   485  					remote-endpoint = <&funnel_ete_in_ete2>;
aeb520ce520a2f Neil Armstrong        2025-02-27   486  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   487  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   488  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   489  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   490  
aeb520ce520a2f Neil Armstrong        2025-02-27   491  	ete-3 {
aeb520ce520a2f Neil Armstrong        2025-02-27   492  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   493  
aeb520ce520a2f Neil Armstrong        2025-02-27   494  		cpu = <&cpu3>;
aeb520ce520a2f Neil Armstrong        2025-02-27   495  
aeb520ce520a2f Neil Armstrong        2025-02-27   496  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   497  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   498  				ete3_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   499  					remote-endpoint = <&funnel_ete_in_ete3>;
aeb520ce520a2f Neil Armstrong        2025-02-27   500  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   501  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   502  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   503  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   504  
aeb520ce520a2f Neil Armstrong        2025-02-27   505  	ete-4 {
aeb520ce520a2f Neil Armstrong        2025-02-27   506  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   507  
aeb520ce520a2f Neil Armstrong        2025-02-27   508  		cpu = <&cpu4>;
aeb520ce520a2f Neil Armstrong        2025-02-27   509  
aeb520ce520a2f Neil Armstrong        2025-02-27   510  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   511  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   512  				ete4_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   513  					remote-endpoint = <&funnel_ete_in_ete4>;
aeb520ce520a2f Neil Armstrong        2025-02-27   514  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   515  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   516  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   517  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   518  
aeb520ce520a2f Neil Armstrong        2025-02-27   519  	ete-5 {
aeb520ce520a2f Neil Armstrong        2025-02-27   520  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   521  
aeb520ce520a2f Neil Armstrong        2025-02-27   522  		cpu = <&cpu5>;
aeb520ce520a2f Neil Armstrong        2025-02-27   523  
aeb520ce520a2f Neil Armstrong        2025-02-27   524  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   525  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   526  				ete5_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   527  					remote-endpoint = <&funnel_ete_in_ete5>;
aeb520ce520a2f Neil Armstrong        2025-02-27   528  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   529  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   530  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   531  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   532  
aeb520ce520a2f Neil Armstrong        2025-02-27   533  	ete-6 {
aeb520ce520a2f Neil Armstrong        2025-02-27   534  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   535  
aeb520ce520a2f Neil Armstrong        2025-02-27   536  		cpu = <&cpu6>;
aeb520ce520a2f Neil Armstrong        2025-02-27   537  
aeb520ce520a2f Neil Armstrong        2025-02-27   538  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   539  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   540  				ete6_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   541  					remote-endpoint = <&funnel_ete_in_ete6>;
aeb520ce520a2f Neil Armstrong        2025-02-27   542  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   543  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   544  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   545  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   546  
aeb520ce520a2f Neil Armstrong        2025-02-27   547  	ete-7 {
aeb520ce520a2f Neil Armstrong        2025-02-27   548  		compatible = "arm,embedded-trace-extension";
aeb520ce520a2f Neil Armstrong        2025-02-27   549  
aeb520ce520a2f Neil Armstrong        2025-02-27   550  		cpu = <&cpu7>;
aeb520ce520a2f Neil Armstrong        2025-02-27   551  
aeb520ce520a2f Neil Armstrong        2025-02-27   552  		out-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   553  			port {
aeb520ce520a2f Neil Armstrong        2025-02-27   554  				ete7_out_funnel_ete: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   555  					remote-endpoint = <&funnel_ete_in_ete7>;
aeb520ce520a2f Neil Armstrong        2025-02-27   556  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   557  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   558  		};
aeb520ce520a2f Neil Armstrong        2025-02-27   559  	};
aeb520ce520a2f Neil Armstrong        2025-02-27   560  
256e6937e48a14 Yuanfang Zhang        2025-01-07   561  	funnel-ete {
256e6937e48a14 Yuanfang Zhang        2025-01-07   562  		compatible = "arm,coresight-static-funnel";
256e6937e48a14 Yuanfang Zhang        2025-01-07   563  
256e6937e48a14 Yuanfang Zhang        2025-01-07   564  		in-ports {
aeb520ce520a2f Neil Armstrong        2025-02-27   565  			#address-cells = <1>;
aeb520ce520a2f Neil Armstrong        2025-02-27   566  			#size-cells = <0>;
aeb520ce520a2f Neil Armstrong        2025-02-27   567  
aeb520ce520a2f Neil Armstrong        2025-02-27   568  			port@0 {
aeb520ce520a2f Neil Armstrong        2025-02-27   569  				reg = <0>;
aeb520ce520a2f Neil Armstrong        2025-02-27   570  
256e6937e48a14 Yuanfang Zhang        2025-01-07   571  				funnel_ete_in_ete0: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07   572  					remote-endpoint = <&ete0_out_funnel_ete>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   573  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07   574  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   575  
aeb520ce520a2f Neil Armstrong        2025-02-27   576  			port@1 {
aeb520ce520a2f Neil Armstrong        2025-02-27   577  				reg = <1>;
aeb520ce520a2f Neil Armstrong        2025-02-27   578  
aeb520ce520a2f Neil Armstrong        2025-02-27   579  				funnel_ete_in_ete1: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   580  					remote-endpoint = <&ete1_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   581  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   582  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   583  
aeb520ce520a2f Neil Armstrong        2025-02-27   584  			port@2 {
aeb520ce520a2f Neil Armstrong        2025-02-27   585  				reg = <2>;
aeb520ce520a2f Neil Armstrong        2025-02-27   586  
aeb520ce520a2f Neil Armstrong        2025-02-27   587  				funnel_ete_in_ete2: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   588  					remote-endpoint = <&ete2_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   589  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   590  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   591  
aeb520ce520a2f Neil Armstrong        2025-02-27   592  			port@3 {
aeb520ce520a2f Neil Armstrong        2025-02-27   593  				reg = <3>;
aeb520ce520a2f Neil Armstrong        2025-02-27   594  
aeb520ce520a2f Neil Armstrong        2025-02-27   595  				funnel_ete_in_ete3: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   596  					remote-endpoint = <&ete3_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   597  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   598  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   599  
aeb520ce520a2f Neil Armstrong        2025-02-27   600  			port@4 {
aeb520ce520a2f Neil Armstrong        2025-02-27   601  				reg = <4>;
aeb520ce520a2f Neil Armstrong        2025-02-27   602  
aeb520ce520a2f Neil Armstrong        2025-02-27   603  				funnel_ete_in_ete4: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   604  					remote-endpoint = <&ete4_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   605  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   606  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   607  
aeb520ce520a2f Neil Armstrong        2025-02-27   608  			port@5 {
aeb520ce520a2f Neil Armstrong        2025-02-27   609  				reg = <5>;
aeb520ce520a2f Neil Armstrong        2025-02-27   610  
aeb520ce520a2f Neil Armstrong        2025-02-27   611  				funnel_ete_in_ete5: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   612  					remote-endpoint = <&ete5_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   613  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   614  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   615  
aeb520ce520a2f Neil Armstrong        2025-02-27   616  			port@6 {
aeb520ce520a2f Neil Armstrong        2025-02-27   617  				reg = <6>;
aeb520ce520a2f Neil Armstrong        2025-02-27   618  
aeb520ce520a2f Neil Armstrong        2025-02-27   619  				funnel_ete_in_ete6: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   620  					remote-endpoint = <&ete6_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   621  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   622  			};
aeb520ce520a2f Neil Armstrong        2025-02-27   623  
aeb520ce520a2f Neil Armstrong        2025-02-27   624  			port@7 {
aeb520ce520a2f Neil Armstrong        2025-02-27   625  				reg = <7>;
aeb520ce520a2f Neil Armstrong        2025-02-27   626  
aeb520ce520a2f Neil Armstrong        2025-02-27   627  				funnel_ete_in_ete7: endpoint {
aeb520ce520a2f Neil Armstrong        2025-02-27   628  					remote-endpoint = <&ete7_out_funnel_ete>;
aeb520ce520a2f Neil Armstrong        2025-02-27   629  				};
aeb520ce520a2f Neil Armstrong        2025-02-27   630  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07   631  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07   632  
256e6937e48a14 Yuanfang Zhang        2025-01-07   633  		out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07   634  			port {
256e6937e48a14 Yuanfang Zhang        2025-01-07   635  				funnel_ete_out_funnel_apss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07   636  					remote-endpoint = <&funnel_apss_in_funnel_ete>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   637  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07   638  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07   639  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07   640  	};
256e6937e48a14 Yuanfang Zhang        2025-01-07   641  
d2350377997f36 Neil Armstrong        2023-11-30   642  	firmware {
d2350377997f36 Neil Armstrong        2023-11-30   643  		scm: scm {
d2350377997f36 Neil Armstrong        2023-11-30   644  			compatible = "qcom,scm-sm8650", "qcom,scm";
49e950487b3e55 Mukesh Ojha           2024-05-17   645  			qcom,dload-mode = <&tcsr 0x19000>;
10e02467129518 Neil Armstrong        2023-11-30   646  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   647  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
d2350377997f36 Neil Armstrong        2023-11-30   648  		};
d2350377997f36 Neil Armstrong        2023-11-30   649  	};
d2350377997f36 Neil Armstrong        2023-11-30   650  
10e02467129518 Neil Armstrong        2023-11-30   651  	clk_virt: interconnect-0 {
10e02467129518 Neil Armstrong        2023-11-30   652  		compatible = "qcom,sm8650-clk-virt";
10e02467129518 Neil Armstrong        2023-11-30   653  		#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   654  		qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30   655  	};
10e02467129518 Neil Armstrong        2023-11-30   656  
10e02467129518 Neil Armstrong        2023-11-30   657  	mc_virt: interconnect-1 {
10e02467129518 Neil Armstrong        2023-11-30   658  		compatible = "qcom,sm8650-mc-virt";
10e02467129518 Neil Armstrong        2023-11-30   659  		#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   660  		qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30   661  	};
10e02467129518 Neil Armstrong        2023-11-30   662  
2c885d85dff832 Neil Armstrong        2025-01-15   663  	qup_opp_table_100mhz: opp-table-qup100mhz {
2c885d85dff832 Neil Armstrong        2025-01-15   664  		compatible = "operating-points-v2";
2c885d85dff832 Neil Armstrong        2025-01-15   665  
2c885d85dff832 Neil Armstrong        2025-01-15   666  		opp-75000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   667  			opp-hz = /bits/ 64 <75000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   668  			required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   669  		};
2c885d85dff832 Neil Armstrong        2025-01-15   670  
2c885d85dff832 Neil Armstrong        2025-01-15   671  		opp-100000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   672  			opp-hz = /bits/ 64 <100000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   673  			required-opps = <&rpmhpd_opp_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   674  		};
2c885d85dff832 Neil Armstrong        2025-01-15   675  	};
2c885d85dff832 Neil Armstrong        2025-01-15   676  
2c885d85dff832 Neil Armstrong        2025-01-15   677  	qup_opp_table_120mhz: opp-table-qup120mhz {
2c885d85dff832 Neil Armstrong        2025-01-15   678  		compatible = "operating-points-v2";
2c885d85dff832 Neil Armstrong        2025-01-15   679  
2c885d85dff832 Neil Armstrong        2025-01-15   680  		opp-75000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   681  			opp-hz = /bits/ 64 <75000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   682  			required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   683  		};
2c885d85dff832 Neil Armstrong        2025-01-15   684  
2c885d85dff832 Neil Armstrong        2025-01-15   685  		opp-120000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   686  			opp-hz = /bits/ 64 <120000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   687  			required-opps = <&rpmhpd_opp_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   688  		};
2c885d85dff832 Neil Armstrong        2025-01-15   689  	};
2c885d85dff832 Neil Armstrong        2025-01-15   690  
2c885d85dff832 Neil Armstrong        2025-01-15   691  	qup_opp_table_128mhz: opp-table-qup128mhz {
2c885d85dff832 Neil Armstrong        2025-01-15   692  		compatible = "operating-points-v2";
2c885d85dff832 Neil Armstrong        2025-01-15   693  
2c885d85dff832 Neil Armstrong        2025-01-15   694  		opp-75000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   695  			opp-hz = /bits/ 64 <75000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   696  			required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   697  		};
2c885d85dff832 Neil Armstrong        2025-01-15   698  
2c885d85dff832 Neil Armstrong        2025-01-15   699  		opp-128000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   700  			opp-hz = /bits/ 64 <128000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   701  			required-opps = <&rpmhpd_opp_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   702  		};
2c885d85dff832 Neil Armstrong        2025-01-15   703  	};
2c885d85dff832 Neil Armstrong        2025-01-15   704  
2c885d85dff832 Neil Armstrong        2025-01-15   705  	qup_opp_table_240mhz: opp-table-qup240mhz {
2c885d85dff832 Neil Armstrong        2025-01-15   706  		compatible = "operating-points-v2";
2c885d85dff832 Neil Armstrong        2025-01-15   707  
2c885d85dff832 Neil Armstrong        2025-01-15   708  		opp-150000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   709  			opp-hz = /bits/ 64 <150000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   710  			required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   711  		};
2c885d85dff832 Neil Armstrong        2025-01-15   712  
2c885d85dff832 Neil Armstrong        2025-01-15   713  		opp-240000000 {
2c885d85dff832 Neil Armstrong        2025-01-15   714  			opp-hz = /bits/ 64 <240000000>;
2c885d85dff832 Neil Armstrong        2025-01-15   715  			required-opps = <&rpmhpd_opp_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15   716  		};
2c885d85dff832 Neil Armstrong        2025-01-15   717  	};
2c885d85dff832 Neil Armstrong        2025-01-15   718  
d2350377997f36 Neil Armstrong        2023-11-30   719  	memory@a0000000 {
d2350377997f36 Neil Armstrong        2023-11-30   720  		device_type = "memory";
d2350377997f36 Neil Armstrong        2023-11-30   721  		/* We expect the bootloader to fill in the size */
d2350377997f36 Neil Armstrong        2023-11-30   722  		reg = <0 0xa0000000 0 0>;
d2350377997f36 Neil Armstrong        2023-11-30   723  	};
d2350377997f36 Neil Armstrong        2023-11-30   724  
c24db2c178578a Neil Armstrong        2025-02-11   725  	cpu0_opp_table: opp-table-cpu0 {
c24db2c178578a Neil Armstrong        2025-02-11   726  		compatible = "operating-points-v2";
c24db2c178578a Neil Armstrong        2025-02-11   727  		opp-shared;
c24db2c178578a Neil Armstrong        2025-02-11   728  
c24db2c178578a Neil Armstrong        2025-02-11   729  		opp-307200000 {
c24db2c178578a Neil Armstrong        2025-02-11   730  			opp-hz = /bits/ 64 <307200000>;
c24db2c178578a Neil Armstrong        2025-02-11   731  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   732  		};
c24db2c178578a Neil Armstrong        2025-02-11   733  
c24db2c178578a Neil Armstrong        2025-02-11   734  		opp-364800000 {
c24db2c178578a Neil Armstrong        2025-02-11   735  			opp-hz = /bits/ 64 <364800000>;
c24db2c178578a Neil Armstrong        2025-02-11   736  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   737  		};
c24db2c178578a Neil Armstrong        2025-02-11   738  
c24db2c178578a Neil Armstrong        2025-02-11   739  		opp-460800000 {
c24db2c178578a Neil Armstrong        2025-02-11   740  			opp-hz = /bits/ 64 <460800000>;
c24db2c178578a Neil Armstrong        2025-02-11   741  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (384000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   742  		};
c24db2c178578a Neil Armstrong        2025-02-11   743  
c24db2c178578a Neil Armstrong        2025-02-11   744  		opp-556800000 {
c24db2c178578a Neil Armstrong        2025-02-11   745  			opp-hz = /bits/ 64 <556800000>;
c24db2c178578a Neil Armstrong        2025-02-11   746  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   747  		};
c24db2c178578a Neil Armstrong        2025-02-11   748  
c24db2c178578a Neil Armstrong        2025-02-11   749  		opp-672000000 {
c24db2c178578a Neil Armstrong        2025-02-11   750  			opp-hz = /bits/ 64 <672000000>;
c24db2c178578a Neil Armstrong        2025-02-11   751  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   752  		};
c24db2c178578a Neil Armstrong        2025-02-11   753  
c24db2c178578a Neil Armstrong        2025-02-11   754  		opp-787200000 {
c24db2c178578a Neil Armstrong        2025-02-11   755  			opp-hz = /bits/ 64 <787200000>;
c24db2c178578a Neil Armstrong        2025-02-11   756  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (729600 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   757  		};
c24db2c178578a Neil Armstrong        2025-02-11   758  
c24db2c178578a Neil Armstrong        2025-02-11   759  		opp-902400000 {
c24db2c178578a Neil Armstrong        2025-02-11   760  			opp-hz = /bits/ 64 <902400000>;
c24db2c178578a Neil Armstrong        2025-02-11   761  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   762  		};
c24db2c178578a Neil Armstrong        2025-02-11   763  
c24db2c178578a Neil Armstrong        2025-02-11   764  		opp-1017600000 {
c24db2c178578a Neil Armstrong        2025-02-11   765  			opp-hz = /bits/ 64 <1017600000>;
c24db2c178578a Neil Armstrong        2025-02-11   766  			opp-peak-kBps = <(466000 * 16) (547000 * 4) (940800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   767  		};
c24db2c178578a Neil Armstrong        2025-02-11   768  
c24db2c178578a Neil Armstrong        2025-02-11   769  		opp-1132800000 {
c24db2c178578a Neil Armstrong        2025-02-11   770  			opp-hz = /bits/ 64 <1132800000>;
c24db2c178578a Neil Armstrong        2025-02-11   771  			opp-peak-kBps = <(466000 * 16) (547000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   772  		};
c24db2c178578a Neil Armstrong        2025-02-11   773  
c24db2c178578a Neil Armstrong        2025-02-11   774  		opp-1248000000 {
c24db2c178578a Neil Armstrong        2025-02-11   775  			opp-hz = /bits/ 64 <1248000000>;
c24db2c178578a Neil Armstrong        2025-02-11   776  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1132800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   777  		};
c24db2c178578a Neil Armstrong        2025-02-11   778  
c24db2c178578a Neil Armstrong        2025-02-11   779  		opp-1344000000 {
c24db2c178578a Neil Armstrong        2025-02-11   780  			opp-hz = /bits/ 64 <1344000000>;
c24db2c178578a Neil Armstrong        2025-02-11   781  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   782  		};
c24db2c178578a Neil Armstrong        2025-02-11   783  
c24db2c178578a Neil Armstrong        2025-02-11   784  		opp-1440000000 {
c24db2c178578a Neil Armstrong        2025-02-11   785  			opp-hz = /bits/ 64 <1440000000>;
c24db2c178578a Neil Armstrong        2025-02-11   786  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   787  		};
c24db2c178578a Neil Armstrong        2025-02-11   788  
c24db2c178578a Neil Armstrong        2025-02-11   789  		opp-1459200000 {
c24db2c178578a Neil Armstrong        2025-02-11   790  			opp-hz = /bits/ 64 <1459200000>;
c24db2c178578a Neil Armstrong        2025-02-11   791  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   792  		};
c24db2c178578a Neil Armstrong        2025-02-11   793  
c24db2c178578a Neil Armstrong        2025-02-11   794  		opp-1536000000 {
c24db2c178578a Neil Armstrong        2025-02-11   795  			opp-hz = /bits/ 64 <1536000000>;
c24db2c178578a Neil Armstrong        2025-02-11   796  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   797  		};
c24db2c178578a Neil Armstrong        2025-02-11   798  
c24db2c178578a Neil Armstrong        2025-02-11   799  		opp-1574400000 {
c24db2c178578a Neil Armstrong        2025-02-11   800  			opp-hz = /bits/ 64 <1574400000>;
c24db2c178578a Neil Armstrong        2025-02-11   801  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   802  		};
c24db2c178578a Neil Armstrong        2025-02-11   803  
c24db2c178578a Neil Armstrong        2025-02-11   804  		opp-1651200000 {
c24db2c178578a Neil Armstrong        2025-02-11   805  			opp-hz = /bits/ 64 <1651200000>;
c24db2c178578a Neil Armstrong        2025-02-11   806  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   807  		};
c24db2c178578a Neil Armstrong        2025-02-11   808  
c24db2c178578a Neil Armstrong        2025-02-11   809  		opp-1689600000 {
c24db2c178578a Neil Armstrong        2025-02-11   810  			opp-hz = /bits/ 64 <1689600000>;
c24db2c178578a Neil Armstrong        2025-02-11   811  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   812  		};
c24db2c178578a Neil Armstrong        2025-02-11   813  
c24db2c178578a Neil Armstrong        2025-02-11   814  		opp-1747200000 {
c24db2c178578a Neil Armstrong        2025-02-11   815  			opp-hz = /bits/ 64 <1747200000>;
c24db2c178578a Neil Armstrong        2025-02-11   816  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   817  		};
c24db2c178578a Neil Armstrong        2025-02-11   818  
c24db2c178578a Neil Armstrong        2025-02-11   819  		opp-1804800000 {
c24db2c178578a Neil Armstrong        2025-02-11   820  			opp-hz = /bits/ 64 <1804800000>;
c24db2c178578a Neil Armstrong        2025-02-11   821  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1555200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   822  		};
c24db2c178578a Neil Armstrong        2025-02-11   823  
c24db2c178578a Neil Armstrong        2025-02-11   824  		opp-1843200000 {
c24db2c178578a Neil Armstrong        2025-02-11   825  			opp-hz = /bits/ 64 <1843200000>;
c24db2c178578a Neil Armstrong        2025-02-11   826  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1555200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   827  		};
c24db2c178578a Neil Armstrong        2025-02-11   828  
c24db2c178578a Neil Armstrong        2025-02-11   829  		opp-1920000000 {
c24db2c178578a Neil Armstrong        2025-02-11   830  			opp-hz = /bits/ 64 <1920000000>;
c24db2c178578a Neil Armstrong        2025-02-11   831  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   832  		};
c24db2c178578a Neil Armstrong        2025-02-11   833  
c24db2c178578a Neil Armstrong        2025-02-11   834  		opp-1939200000 {
c24db2c178578a Neil Armstrong        2025-02-11   835  			opp-hz = /bits/ 64 <1939200000>;
c24db2c178578a Neil Armstrong        2025-02-11   836  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   837  		};
c24db2c178578a Neil Armstrong        2025-02-11   838  
c24db2c178578a Neil Armstrong        2025-02-11   839  		opp-2035200000 {
c24db2c178578a Neil Armstrong        2025-02-11   840  			opp-hz = /bits/ 64 <2035200000>;
c24db2c178578a Neil Armstrong        2025-02-11   841  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   842  		};
c24db2c178578a Neil Armstrong        2025-02-11   843  
c24db2c178578a Neil Armstrong        2025-02-11   844  		opp-2150400000 {
c24db2c178578a Neil Armstrong        2025-02-11   845  			opp-hz = /bits/ 64 <2150400000>;
c24db2c178578a Neil Armstrong        2025-02-11   846  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   847  		};
c24db2c178578a Neil Armstrong        2025-02-11   848  
c24db2c178578a Neil Armstrong        2025-02-11   849  		opp-2265600000 {
c24db2c178578a Neil Armstrong        2025-02-11   850  			opp-hz = /bits/ 64 <2265600000>;
c24db2c178578a Neil Armstrong        2025-02-11   851  			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (2035200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   852  		};
c24db2c178578a Neil Armstrong        2025-02-11   853  	};
c24db2c178578a Neil Armstrong        2025-02-11   854  
c24db2c178578a Neil Armstrong        2025-02-11   855  	cpu2_opp_table: opp-table-cpu2 {
c24db2c178578a Neil Armstrong        2025-02-11   856  		compatible = "operating-points-v2";
c24db2c178578a Neil Armstrong        2025-02-11   857  		opp-shared;
c24db2c178578a Neil Armstrong        2025-02-11   858  
c24db2c178578a Neil Armstrong        2025-02-11   859  		opp-460800000 {
c24db2c178578a Neil Armstrong        2025-02-11   860  			opp-hz = /bits/ 64 <460800000>;
c24db2c178578a Neil Armstrong        2025-02-11   861  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   862  		};
c24db2c178578a Neil Armstrong        2025-02-11   863  
c24db2c178578a Neil Armstrong        2025-02-11   864  		opp-499200000 {
c24db2c178578a Neil Armstrong        2025-02-11   865  			opp-hz = /bits/ 64 <499200000>;
c24db2c178578a Neil Armstrong        2025-02-11   866  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   867  		};
c24db2c178578a Neil Armstrong        2025-02-11   868  
c24db2c178578a Neil Armstrong        2025-02-11   869  		opp-576000000 {
c24db2c178578a Neil Armstrong        2025-02-11   870  			opp-hz = /bits/ 64 <576000000>;
c24db2c178578a Neil Armstrong        2025-02-11   871  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   872  		};
c24db2c178578a Neil Armstrong        2025-02-11   873  
c24db2c178578a Neil Armstrong        2025-02-11   874  		opp-614400000 {
c24db2c178578a Neil Armstrong        2025-02-11   875  			opp-hz = /bits/ 64 <614400000>;
c24db2c178578a Neil Armstrong        2025-02-11   876  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   877  		};
c24db2c178578a Neil Armstrong        2025-02-11   878  
c24db2c178578a Neil Armstrong        2025-02-11   879  		opp-691200000 {
c24db2c178578a Neil Armstrong        2025-02-11   880  			opp-hz = /bits/ 64 <691200000>;
c24db2c178578a Neil Armstrong        2025-02-11   881  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   882  		};
c24db2c178578a Neil Armstrong        2025-02-11   883  
c24db2c178578a Neil Armstrong        2025-02-11   884  		opp-729600000 {
c24db2c178578a Neil Armstrong        2025-02-11   885  			opp-hz = /bits/ 64 <729600000>;
c24db2c178578a Neil Armstrong        2025-02-11   886  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   887  		};
c24db2c178578a Neil Armstrong        2025-02-11   888  
c24db2c178578a Neil Armstrong        2025-02-11   889  		opp-806400000 {
c24db2c178578a Neil Armstrong        2025-02-11   890  			opp-hz = /bits/ 64 <806400000>;
c24db2c178578a Neil Armstrong        2025-02-11   891  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   892  		};
c24db2c178578a Neil Armstrong        2025-02-11   893  
c24db2c178578a Neil Armstrong        2025-02-11   894  		opp-844800000 {
c24db2c178578a Neil Armstrong        2025-02-11   895  			opp-hz = /bits/ 64 <844800000>;
c24db2c178578a Neil Armstrong        2025-02-11   896  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   897  		};
c24db2c178578a Neil Armstrong        2025-02-11   898  
c24db2c178578a Neil Armstrong        2025-02-11   899  		opp-902400000 {
c24db2c178578a Neil Armstrong        2025-02-11   900  			opp-hz = /bits/ 64 <902400000>;
c24db2c178578a Neil Armstrong        2025-02-11   901  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   902  		};
c24db2c178578a Neil Armstrong        2025-02-11   903  
c24db2c178578a Neil Armstrong        2025-02-11   904  		opp-960000000 {
c24db2c178578a Neil Armstrong        2025-02-11   905  			opp-hz = /bits/ 64 <960000000>;
c24db2c178578a Neil Armstrong        2025-02-11   906  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   907  		};
c24db2c178578a Neil Armstrong        2025-02-11   908  
c24db2c178578a Neil Armstrong        2025-02-11   909  		opp-1036800000 {
c24db2c178578a Neil Armstrong        2025-02-11   910  			opp-hz = /bits/ 64 <1036800000>;
c24db2c178578a Neil Armstrong        2025-02-11   911  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   912  		};
c24db2c178578a Neil Armstrong        2025-02-11   913  
c24db2c178578a Neil Armstrong        2025-02-11   914  		opp-1075200000 {
c24db2c178578a Neil Armstrong        2025-02-11   915  			opp-hz = /bits/ 64 <1075200000>;
c24db2c178578a Neil Armstrong        2025-02-11   916  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   917  		};
c24db2c178578a Neil Armstrong        2025-02-11   918  
c24db2c178578a Neil Armstrong        2025-02-11   919  		opp-1152000000 {
c24db2c178578a Neil Armstrong        2025-02-11   920  			opp-hz = /bits/ 64 <1152000000>;
c24db2c178578a Neil Armstrong        2025-02-11   921  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   922  		};
c24db2c178578a Neil Armstrong        2025-02-11   923  
c24db2c178578a Neil Armstrong        2025-02-11   924  		opp-1190400000 {
c24db2c178578a Neil Armstrong        2025-02-11   925  			opp-hz = /bits/ 64 <1190400000>;
c24db2c178578a Neil Armstrong        2025-02-11   926  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   927  		};
c24db2c178578a Neil Armstrong        2025-02-11   928  
c24db2c178578a Neil Armstrong        2025-02-11   929  		opp-1267200000 {
c24db2c178578a Neil Armstrong        2025-02-11   930  			opp-hz = /bits/ 64 <1267200000>;
c24db2c178578a Neil Armstrong        2025-02-11   931  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   932  		};
c24db2c178578a Neil Armstrong        2025-02-11   933  
c24db2c178578a Neil Armstrong        2025-02-11   934  		opp-1286400000 {
c24db2c178578a Neil Armstrong        2025-02-11   935  			opp-hz = /bits/ 64 <1286400000>;
c24db2c178578a Neil Armstrong        2025-02-11   936  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   937  		};
c24db2c178578a Neil Armstrong        2025-02-11   938  
c24db2c178578a Neil Armstrong        2025-02-11   939  		opp-1382400000 {
c24db2c178578a Neil Armstrong        2025-02-11   940  			opp-hz = /bits/ 64 <1382400000>;
c24db2c178578a Neil Armstrong        2025-02-11   941  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   942  		};
c24db2c178578a Neil Armstrong        2025-02-11   943  
c24db2c178578a Neil Armstrong        2025-02-11   944  		opp-1401600000 {
c24db2c178578a Neil Armstrong        2025-02-11   945  			opp-hz = /bits/ 64 <1401600000>;
c24db2c178578a Neil Armstrong        2025-02-11   946  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   947  		};
c24db2c178578a Neil Armstrong        2025-02-11   948  
c24db2c178578a Neil Armstrong        2025-02-11   949  		opp-1497600000 {
c24db2c178578a Neil Armstrong        2025-02-11   950  			opp-hz = /bits/ 64 <1497600000>;
c24db2c178578a Neil Armstrong        2025-02-11   951  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   952  		};
c24db2c178578a Neil Armstrong        2025-02-11   953  
c24db2c178578a Neil Armstrong        2025-02-11   954  		opp-1612800000 {
c24db2c178578a Neil Armstrong        2025-02-11   955  			opp-hz = /bits/ 64 <1612800000>;
c24db2c178578a Neil Armstrong        2025-02-11   956  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   957  		};
c24db2c178578a Neil Armstrong        2025-02-11   958  
c24db2c178578a Neil Armstrong        2025-02-11   959  		opp-1708800000 {
c24db2c178578a Neil Armstrong        2025-02-11   960  			opp-hz = /bits/ 64 <1708800000>;
c24db2c178578a Neil Armstrong        2025-02-11   961  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   962  		};
c24db2c178578a Neil Armstrong        2025-02-11   963  
c24db2c178578a Neil Armstrong        2025-02-11   964  		opp-1728000000 {
c24db2c178578a Neil Armstrong        2025-02-11   965  			opp-hz = /bits/ 64 <1728000000>;
c24db2c178578a Neil Armstrong        2025-02-11   966  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   967  		};
c24db2c178578a Neil Armstrong        2025-02-11   968  
c24db2c178578a Neil Armstrong        2025-02-11   969  		opp-1824000000 {
c24db2c178578a Neil Armstrong        2025-02-11   970  			opp-hz = /bits/ 64 <1824000000>;
c24db2c178578a Neil Armstrong        2025-02-11   971  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   972  		};
c24db2c178578a Neil Armstrong        2025-02-11   973  
c24db2c178578a Neil Armstrong        2025-02-11   974  		opp-1843200000 {
c24db2c178578a Neil Armstrong        2025-02-11   975  			opp-hz = /bits/ 64 <1843200000>;
c24db2c178578a Neil Armstrong        2025-02-11   976  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   977  		};
c24db2c178578a Neil Armstrong        2025-02-11   978  
c24db2c178578a Neil Armstrong        2025-02-11   979  		opp-1920000000 {
c24db2c178578a Neil Armstrong        2025-02-11   980  			opp-hz = /bits/ 64 <1920000000>;
c24db2c178578a Neil Armstrong        2025-02-11   981  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   982  		};
c24db2c178578a Neil Armstrong        2025-02-11   983  
c24db2c178578a Neil Armstrong        2025-02-11   984  		opp-1958400000 {
c24db2c178578a Neil Armstrong        2025-02-11   985  			opp-hz = /bits/ 64 <1958400000>;
c24db2c178578a Neil Armstrong        2025-02-11   986  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   987  		};
c24db2c178578a Neil Armstrong        2025-02-11   988  
c24db2c178578a Neil Armstrong        2025-02-11   989  		opp-2035200000 {
c24db2c178578a Neil Armstrong        2025-02-11   990  			opp-hz = /bits/ 64 <2035200000>;
c24db2c178578a Neil Armstrong        2025-02-11   991  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   992  		};
c24db2c178578a Neil Armstrong        2025-02-11   993  
c24db2c178578a Neil Armstrong        2025-02-11   994  		opp-2073600000 {
c24db2c178578a Neil Armstrong        2025-02-11   995  			opp-hz = /bits/ 64 <2073600000>;
c24db2c178578a Neil Armstrong        2025-02-11   996  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11   997  		};
c24db2c178578a Neil Armstrong        2025-02-11   998  
c24db2c178578a Neil Armstrong        2025-02-11   999  		opp-2131200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1000  			opp-hz = /bits/ 64 <2131200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1001  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1002  		};
c24db2c178578a Neil Armstrong        2025-02-11  1003  
c24db2c178578a Neil Armstrong        2025-02-11  1004  		opp-2188800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1005  			opp-hz = /bits/ 64 <2188800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1006  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1007  		};
c24db2c178578a Neil Armstrong        2025-02-11  1008  
c24db2c178578a Neil Armstrong        2025-02-11  1009  		opp-2246400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1010  			opp-hz = /bits/ 64 <2246400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1011  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1012  		};
c24db2c178578a Neil Armstrong        2025-02-11  1013  
c24db2c178578a Neil Armstrong        2025-02-11  1014  		opp-2304000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1015  			opp-hz = /bits/ 64 <2304000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1016  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1017  		};
c24db2c178578a Neil Armstrong        2025-02-11  1018  
c24db2c178578a Neil Armstrong        2025-02-11  1019  		opp-2323200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1020  			opp-hz = /bits/ 64 <2323200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1021  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1022  		};
c24db2c178578a Neil Armstrong        2025-02-11  1023  
c24db2c178578a Neil Armstrong        2025-02-11  1024  		opp-2380800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1025  			opp-hz = /bits/ 64 <2380800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1026  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1027  		};
c24db2c178578a Neil Armstrong        2025-02-11  1028  
c24db2c178578a Neil Armstrong        2025-02-11  1029  		opp-2400000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1030  			opp-hz = /bits/ 64 <2400000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1031  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1032  		};
c24db2c178578a Neil Armstrong        2025-02-11  1033  
c24db2c178578a Neil Armstrong        2025-02-11  1034  		opp-2438400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1035  			opp-hz = /bits/ 64 <2438400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1036  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1037  		};
c24db2c178578a Neil Armstrong        2025-02-11  1038  
c24db2c178578a Neil Armstrong        2025-02-11  1039  		opp-2515200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1040  			opp-hz = /bits/ 64 <2515200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1041  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1042  		};
c24db2c178578a Neil Armstrong        2025-02-11  1043  
c24db2c178578a Neil Armstrong        2025-02-11  1044  		opp-2572800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1045  			opp-hz = /bits/ 64 <2572800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1046  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1047  		};
c24db2c178578a Neil Armstrong        2025-02-11  1048  
c24db2c178578a Neil Armstrong        2025-02-11  1049  		opp-2630400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1050  			opp-hz = /bits/ 64 <2630400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1051  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1052  		};
c24db2c178578a Neil Armstrong        2025-02-11  1053  
c24db2c178578a Neil Armstrong        2025-02-11  1054  		opp-2707200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1055  			opp-hz = /bits/ 64 <2707200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1056  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1057  		};
c24db2c178578a Neil Armstrong        2025-02-11  1058  
c24db2c178578a Neil Armstrong        2025-02-11  1059  		opp-2764800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1060  			opp-hz = /bits/ 64 <2764800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1061  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1062  		};
c24db2c178578a Neil Armstrong        2025-02-11  1063  
c24db2c178578a Neil Armstrong        2025-02-11  1064  		opp-2841600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1065  			opp-hz = /bits/ 64 <2841600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1066  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1067  		};
c24db2c178578a Neil Armstrong        2025-02-11  1068  
c24db2c178578a Neil Armstrong        2025-02-11  1069  		opp-2899200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1070  			opp-hz = /bits/ 64 <2899200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1071  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1072  		};
c24db2c178578a Neil Armstrong        2025-02-11  1073  
c24db2c178578a Neil Armstrong        2025-02-11  1074  		opp-2956800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1075  			opp-hz = /bits/ 64 <2956800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1076  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1077  		};
c24db2c178578a Neil Armstrong        2025-02-11  1078  
c24db2c178578a Neil Armstrong        2025-02-11  1079  		opp-3014400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1080  			opp-hz = /bits/ 64 <3014400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1081  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1082  		};
c24db2c178578a Neil Armstrong        2025-02-11  1083  
c24db2c178578a Neil Armstrong        2025-02-11  1084  		opp-3072000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1085  			opp-hz = /bits/ 64 <3072000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1086  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1087  		};
c24db2c178578a Neil Armstrong        2025-02-11  1088  
c24db2c178578a Neil Armstrong        2025-02-11  1089  		opp-3148800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1090  			opp-hz = /bits/ 64 <3148800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1091  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1092  		};
c24db2c178578a Neil Armstrong        2025-02-11  1093  	};
c24db2c178578a Neil Armstrong        2025-02-11  1094  
c24db2c178578a Neil Armstrong        2025-02-11  1095  	cpu5_opp_table: opp-table-cpu5 {
c24db2c178578a Neil Armstrong        2025-02-11  1096  		compatible = "operating-points-v2";
c24db2c178578a Neil Armstrong        2025-02-11  1097  		opp-shared;
c24db2c178578a Neil Armstrong        2025-02-11  1098  
c24db2c178578a Neil Armstrong        2025-02-11  1099  		opp-460800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1100  			opp-hz = /bits/ 64 <460800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1101  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1102  		};
c24db2c178578a Neil Armstrong        2025-02-11  1103  
c24db2c178578a Neil Armstrong        2025-02-11  1104  		opp-499200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1105  			opp-hz = /bits/ 64 <499200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1106  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1107  		};
c24db2c178578a Neil Armstrong        2025-02-11  1108  
c24db2c178578a Neil Armstrong        2025-02-11  1109  		opp-576000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1110  			opp-hz = /bits/ 64 <576000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1111  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1112  		};
c24db2c178578a Neil Armstrong        2025-02-11  1113  
c24db2c178578a Neil Armstrong        2025-02-11  1114  		opp-614400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1115  			opp-hz = /bits/ 64 <614400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1116  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1117  		};
c24db2c178578a Neil Armstrong        2025-02-11  1118  
c24db2c178578a Neil Armstrong        2025-02-11  1119  		opp-691200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1120  			opp-hz = /bits/ 64 <691200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1121  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1122  		};
c24db2c178578a Neil Armstrong        2025-02-11  1123  
c24db2c178578a Neil Armstrong        2025-02-11  1124  		opp-729600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1125  			opp-hz = /bits/ 64 <729600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1126  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1127  		};
c24db2c178578a Neil Armstrong        2025-02-11  1128  
c24db2c178578a Neil Armstrong        2025-02-11  1129  		opp-806400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1130  			opp-hz = /bits/ 64 <806400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1131  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1132  		};
c24db2c178578a Neil Armstrong        2025-02-11  1133  
c24db2c178578a Neil Armstrong        2025-02-11  1134  		opp-844800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1135  			opp-hz = /bits/ 64 <844800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1136  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1137  		};
c24db2c178578a Neil Armstrong        2025-02-11  1138  
c24db2c178578a Neil Armstrong        2025-02-11  1139  		opp-902400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1140  			opp-hz = /bits/ 64 <902400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1141  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1142  		};
c24db2c178578a Neil Armstrong        2025-02-11  1143  
c24db2c178578a Neil Armstrong        2025-02-11  1144  		opp-960000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1145  			opp-hz = /bits/ 64 <960000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1146  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1147  		};
c24db2c178578a Neil Armstrong        2025-02-11  1148  
c24db2c178578a Neil Armstrong        2025-02-11  1149  		opp-1036800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1150  			opp-hz = /bits/ 64 <1036800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1151  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1152  		};
c24db2c178578a Neil Armstrong        2025-02-11  1153  
c24db2c178578a Neil Armstrong        2025-02-11  1154  		opp-1075200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1155  			opp-hz = /bits/ 64 <1075200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1156  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1157  		};
c24db2c178578a Neil Armstrong        2025-02-11  1158  
c24db2c178578a Neil Armstrong        2025-02-11  1159  		opp-1152000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1160  			opp-hz = /bits/ 64 <1152000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1161  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1162  		};
c24db2c178578a Neil Armstrong        2025-02-11  1163  
c24db2c178578a Neil Armstrong        2025-02-11  1164  		opp-1190400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1165  			opp-hz = /bits/ 64 <1190400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1166  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1167  		};
c24db2c178578a Neil Armstrong        2025-02-11  1168  
c24db2c178578a Neil Armstrong        2025-02-11  1169  		opp-1267200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1170  			opp-hz = /bits/ 64 <1267200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1171  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1172  		};
c24db2c178578a Neil Armstrong        2025-02-11  1173  
c24db2c178578a Neil Armstrong        2025-02-11  1174  		opp-1286400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1175  			opp-hz = /bits/ 64 <1286400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1176  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1177  		};
c24db2c178578a Neil Armstrong        2025-02-11  1178  
c24db2c178578a Neil Armstrong        2025-02-11  1179  		opp-1382400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1180  			opp-hz = /bits/ 64 <1382400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1181  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1182  		};
c24db2c178578a Neil Armstrong        2025-02-11  1183  
c24db2c178578a Neil Armstrong        2025-02-11  1184  		opp-1401600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1185  			opp-hz = /bits/ 64 <1401600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1186  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1187  		};
c24db2c178578a Neil Armstrong        2025-02-11  1188  
c24db2c178578a Neil Armstrong        2025-02-11  1189  		opp-1497600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1190  			opp-hz = /bits/ 64 <1497600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1191  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1192  		};
c24db2c178578a Neil Armstrong        2025-02-11  1193  
c24db2c178578a Neil Armstrong        2025-02-11  1194  		opp-1612800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1195  			opp-hz = /bits/ 64 <1612800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1196  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1197  		};
c24db2c178578a Neil Armstrong        2025-02-11  1198  
c24db2c178578a Neil Armstrong        2025-02-11  1199  		opp-1708800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1200  			opp-hz = /bits/ 64 <1708800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1201  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1202  		};
c24db2c178578a Neil Armstrong        2025-02-11  1203  
c24db2c178578a Neil Armstrong        2025-02-11  1204  		opp-1728000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1205  			opp-hz = /bits/ 64 <1728000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1206  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1207  		};
c24db2c178578a Neil Armstrong        2025-02-11  1208  
c24db2c178578a Neil Armstrong        2025-02-11  1209  		opp-1824000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1210  			opp-hz = /bits/ 64 <1824000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1211  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1212  		};
c24db2c178578a Neil Armstrong        2025-02-11  1213  
c24db2c178578a Neil Armstrong        2025-02-11  1214  		opp-1843200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1215  			opp-hz = /bits/ 64 <1843200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1216  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1217  		};
c24db2c178578a Neil Armstrong        2025-02-11  1218  
c24db2c178578a Neil Armstrong        2025-02-11  1219  		opp-1920000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1220  			opp-hz = /bits/ 64 <1920000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1221  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1222  		};
c24db2c178578a Neil Armstrong        2025-02-11  1223  
c24db2c178578a Neil Armstrong        2025-02-11  1224  		opp-1958400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1225  			opp-hz = /bits/ 64 <1958400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1226  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1227  		};
c24db2c178578a Neil Armstrong        2025-02-11  1228  
c24db2c178578a Neil Armstrong        2025-02-11  1229  		opp-2035200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1230  			opp-hz = /bits/ 64 <2035200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1231  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1232  		};
c24db2c178578a Neil Armstrong        2025-02-11  1233  
c24db2c178578a Neil Armstrong        2025-02-11  1234  		opp-2073600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1235  			opp-hz = /bits/ 64 <2073600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1236  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1237  		};
c24db2c178578a Neil Armstrong        2025-02-11  1238  
c24db2c178578a Neil Armstrong        2025-02-11  1239  		opp-2131200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1240  			opp-hz = /bits/ 64 <2131200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1241  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1242  		};
c24db2c178578a Neil Armstrong        2025-02-11  1243  
c24db2c178578a Neil Armstrong        2025-02-11  1244  		opp-2188800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1245  			opp-hz = /bits/ 64 <2188800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1246  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1247  		};
c24db2c178578a Neil Armstrong        2025-02-11  1248  
c24db2c178578a Neil Armstrong        2025-02-11  1249  		opp-2246400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1250  			opp-hz = /bits/ 64 <2246400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1251  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1252  		};
c24db2c178578a Neil Armstrong        2025-02-11  1253  
c24db2c178578a Neil Armstrong        2025-02-11  1254  		opp-2304000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1255  			opp-hz = /bits/ 64 <2304000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1256  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1257  		};
c24db2c178578a Neil Armstrong        2025-02-11  1258  
c24db2c178578a Neil Armstrong        2025-02-11  1259  		opp-2323200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1260  			opp-hz = /bits/ 64 <2323200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1261  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1262  		};
c24db2c178578a Neil Armstrong        2025-02-11  1263  
c24db2c178578a Neil Armstrong        2025-02-11  1264  		opp-2380800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1265  			opp-hz = /bits/ 64 <2380800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1266  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1267  		};
c24db2c178578a Neil Armstrong        2025-02-11  1268  
c24db2c178578a Neil Armstrong        2025-02-11  1269  		opp-2400000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1270  			opp-hz = /bits/ 64 <2400000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1271  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1272  		};
c24db2c178578a Neil Armstrong        2025-02-11  1273  
c24db2c178578a Neil Armstrong        2025-02-11  1274  		opp-2438400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1275  			opp-hz = /bits/ 64 <2438400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1276  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1277  		};
c24db2c178578a Neil Armstrong        2025-02-11  1278  
c24db2c178578a Neil Armstrong        2025-02-11  1279  		opp-2515200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1280  			opp-hz = /bits/ 64 <2515200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1281  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1282  		};
c24db2c178578a Neil Armstrong        2025-02-11  1283  
c24db2c178578a Neil Armstrong        2025-02-11  1284  		opp-2572800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1285  			opp-hz = /bits/ 64 <2572800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1286  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1287  		};
c24db2c178578a Neil Armstrong        2025-02-11  1288  
c24db2c178578a Neil Armstrong        2025-02-11  1289  		opp-2630400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1290  			opp-hz = /bits/ 64 <2630400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1291  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1292  		};
c24db2c178578a Neil Armstrong        2025-02-11  1293  
c24db2c178578a Neil Armstrong        2025-02-11  1294  		opp-2707200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1295  			opp-hz = /bits/ 64 <2707200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1296  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1297  		};
c24db2c178578a Neil Armstrong        2025-02-11  1298  
c24db2c178578a Neil Armstrong        2025-02-11  1299  		opp-2764800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1300  			opp-hz = /bits/ 64 <2764800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1301  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1302  		};
c24db2c178578a Neil Armstrong        2025-02-11  1303  
c24db2c178578a Neil Armstrong        2025-02-11  1304  		opp-2841600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1305  			opp-hz = /bits/ 64 <2841600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1306  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1307  		};
c24db2c178578a Neil Armstrong        2025-02-11  1308  
c24db2c178578a Neil Armstrong        2025-02-11  1309  		opp-2899200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1310  			opp-hz = /bits/ 64 <2899200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1311  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1312  		};
c24db2c178578a Neil Armstrong        2025-02-11  1313  
c24db2c178578a Neil Armstrong        2025-02-11  1314  		opp-2956800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1315  			opp-hz = /bits/ 64 <2956800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1316  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1317  		};
c24db2c178578a Neil Armstrong        2025-02-11  1318  
c24db2c178578a Neil Armstrong        2025-02-11  1319  		opp-3014400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1320  			opp-hz = /bits/ 64 <3014400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1321  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1322  		};
c24db2c178578a Neil Armstrong        2025-02-11  1323  
c24db2c178578a Neil Armstrong        2025-02-11  1324  		opp-3072000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1325  			opp-hz = /bits/ 64 <3072000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1326  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1327  		};
c24db2c178578a Neil Armstrong        2025-02-11  1328  
c24db2c178578a Neil Armstrong        2025-02-11  1329  		opp-3148800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1330  			opp-hz = /bits/ 64 <3148800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1331  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1332  		};
c24db2c178578a Neil Armstrong        2025-02-11  1333  	};
c24db2c178578a Neil Armstrong        2025-02-11  1334  
c24db2c178578a Neil Armstrong        2025-02-11  1335  	cpu7_opp_table: opp-table-cpu7 {
c24db2c178578a Neil Armstrong        2025-02-11  1336  		compatible = "operating-points-v2";
c24db2c178578a Neil Armstrong        2025-02-11  1337  		opp-shared;
c24db2c178578a Neil Armstrong        2025-02-11  1338  
c24db2c178578a Neil Armstrong        2025-02-11  1339  		opp-480000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1340  			opp-hz = /bits/ 64 <480000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1341  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1342  		};
c24db2c178578a Neil Armstrong        2025-02-11  1343  
c24db2c178578a Neil Armstrong        2025-02-11  1344  		opp-499200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1345  			opp-hz = /bits/ 64 <499200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1346  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1347  		};
c24db2c178578a Neil Armstrong        2025-02-11  1348  
c24db2c178578a Neil Armstrong        2025-02-11  1349  		opp-576000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1350  			opp-hz = /bits/ 64 <576000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1351  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1352  		};
c24db2c178578a Neil Armstrong        2025-02-11  1353  
c24db2c178578a Neil Armstrong        2025-02-11  1354  		opp-614400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1355  			opp-hz = /bits/ 64 <614400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1356  			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1357  		};
c24db2c178578a Neil Armstrong        2025-02-11  1358  
c24db2c178578a Neil Armstrong        2025-02-11  1359  		opp-672000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1360  			opp-hz = /bits/ 64 <672000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1361  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1362  		};
c24db2c178578a Neil Armstrong        2025-02-11  1363  
c24db2c178578a Neil Armstrong        2025-02-11  1364  		opp-729600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1365  			opp-hz = /bits/ 64 <729600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1366  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1367  		};
c24db2c178578a Neil Armstrong        2025-02-11  1368  
c24db2c178578a Neil Armstrong        2025-02-11  1369  		opp-787200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1370  			opp-hz = /bits/ 64 <787200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1371  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1372  		};
c24db2c178578a Neil Armstrong        2025-02-11  1373  
c24db2c178578a Neil Armstrong        2025-02-11  1374  		opp-844800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1375  			opp-hz = /bits/ 64 <844800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1376  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1377  		};
c24db2c178578a Neil Armstrong        2025-02-11  1378  
c24db2c178578a Neil Armstrong        2025-02-11  1379  		opp-902400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1380  			opp-hz = /bits/ 64 <902400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1381  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1382  		};
c24db2c178578a Neil Armstrong        2025-02-11  1383  
c24db2c178578a Neil Armstrong        2025-02-11  1384  		opp-940800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1385  			opp-hz = /bits/ 64 <940800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1386  			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1387  		};
c24db2c178578a Neil Armstrong        2025-02-11  1388  
c24db2c178578a Neil Armstrong        2025-02-11  1389  		opp-1017600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1390  			opp-hz = /bits/ 64 <1017600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1391  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1392  		};
c24db2c178578a Neil Armstrong        2025-02-11  1393  
c24db2c178578a Neil Armstrong        2025-02-11  1394  		opp-1075200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1395  			opp-hz = /bits/ 64 <1075200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1396  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1397  		};
c24db2c178578a Neil Armstrong        2025-02-11  1398  
c24db2c178578a Neil Armstrong        2025-02-11  1399  		opp-1132800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1400  			opp-hz = /bits/ 64 <1132800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1401  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1402  		};
c24db2c178578a Neil Armstrong        2025-02-11  1403  
c24db2c178578a Neil Armstrong        2025-02-11  1404  		opp-1190400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1405  			opp-hz = /bits/ 64 <1190400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1406  			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1407  		};
c24db2c178578a Neil Armstrong        2025-02-11  1408  
c24db2c178578a Neil Armstrong        2025-02-11  1409  		opp-1248000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1410  			opp-hz = /bits/ 64 <1248000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1411  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1412  		};
c24db2c178578a Neil Armstrong        2025-02-11  1413  
c24db2c178578a Neil Armstrong        2025-02-11  1414  		opp-1305600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1415  			opp-hz = /bits/ 64 <1305600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1416  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1417  		};
c24db2c178578a Neil Armstrong        2025-02-11  1418  
c24db2c178578a Neil Armstrong        2025-02-11  1419  		opp-1363200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1420  			opp-hz = /bits/ 64 <1363200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1421  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1422  		};
c24db2c178578a Neil Armstrong        2025-02-11  1423  
c24db2c178578a Neil Armstrong        2025-02-11  1424  		opp-1420800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1425  			opp-hz = /bits/ 64 <1420800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1426  			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1427  		};
c24db2c178578a Neil Armstrong        2025-02-11  1428  
c24db2c178578a Neil Armstrong        2025-02-11  1429  		opp-1478400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1430  			opp-hz = /bits/ 64 <1478400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1431  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1432  		};
c24db2c178578a Neil Armstrong        2025-02-11  1433  
c24db2c178578a Neil Armstrong        2025-02-11  1434  		opp-1555200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1435  			opp-hz = /bits/ 64 <1555200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1436  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1437  		};
c24db2c178578a Neil Armstrong        2025-02-11  1438  
c24db2c178578a Neil Armstrong        2025-02-11  1439  		opp-1593600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1440  			opp-hz = /bits/ 64 <1593600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1441  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1442  		};
c24db2c178578a Neil Armstrong        2025-02-11  1443  
c24db2c178578a Neil Armstrong        2025-02-11  1444  		opp-1670400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1445  			opp-hz = /bits/ 64 <1670400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1446  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1447  		};
c24db2c178578a Neil Armstrong        2025-02-11  1448  
c24db2c178578a Neil Armstrong        2025-02-11  1449  		opp-1708800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1450  			opp-hz = /bits/ 64 <1708800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1451  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1452  		};
c24db2c178578a Neil Armstrong        2025-02-11  1453  
c24db2c178578a Neil Armstrong        2025-02-11  1454  		opp-1804800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1455  			opp-hz = /bits/ 64 <1804800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1456  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1457  		};
c24db2c178578a Neil Armstrong        2025-02-11  1458  
c24db2c178578a Neil Armstrong        2025-02-11  1459  		opp-1824000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1460  			opp-hz = /bits/ 64 <1824000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1461  			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1462  		};
c24db2c178578a Neil Armstrong        2025-02-11  1463  
c24db2c178578a Neil Armstrong        2025-02-11  1464  		opp-1939200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1465  			opp-hz = /bits/ 64 <1939200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1466  			opp-peak-kBps = <(806000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1467  		};
c24db2c178578a Neil Armstrong        2025-02-11  1468  
c24db2c178578a Neil Armstrong        2025-02-11  1469  		opp-2035200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1470  			opp-hz = /bits/ 64 <2035200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1471  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1472  		};
c24db2c178578a Neil Armstrong        2025-02-11  1473  
c24db2c178578a Neil Armstrong        2025-02-11  1474  		opp-2073600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1475  			opp-hz = /bits/ 64 <2073600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1476  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1477  		};
c24db2c178578a Neil Armstrong        2025-02-11  1478  
c24db2c178578a Neil Armstrong        2025-02-11  1479  		opp-2112000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1480  			opp-hz = /bits/ 64 <2112000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1481  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1482  		};
c24db2c178578a Neil Armstrong        2025-02-11  1483  
c24db2c178578a Neil Armstrong        2025-02-11  1484  		opp-2169600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1485  			opp-hz = /bits/ 64 <2169600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1486  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1487  		};
c24db2c178578a Neil Armstrong        2025-02-11  1488  
c24db2c178578a Neil Armstrong        2025-02-11  1489  		opp-2208000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1490  			opp-hz = /bits/ 64 <2208000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1491  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1492  		};
c24db2c178578a Neil Armstrong        2025-02-11  1493  
c24db2c178578a Neil Armstrong        2025-02-11  1494  		opp-2246400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1495  			opp-hz = /bits/ 64 <2246400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1496  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1497  		};
c24db2c178578a Neil Armstrong        2025-02-11  1498  
c24db2c178578a Neil Armstrong        2025-02-11  1499  		opp-2304000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1500  			opp-hz = /bits/ 64 <2304000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1501  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1502  		};
c24db2c178578a Neil Armstrong        2025-02-11  1503  
c24db2c178578a Neil Armstrong        2025-02-11  1504  		opp-2342400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1505  			opp-hz = /bits/ 64 <2342400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1506  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1507  		};
c24db2c178578a Neil Armstrong        2025-02-11  1508  
c24db2c178578a Neil Armstrong        2025-02-11  1509  		opp-2380800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1510  			opp-hz = /bits/ 64 <2380800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1511  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1512  		};
c24db2c178578a Neil Armstrong        2025-02-11  1513  
c24db2c178578a Neil Armstrong        2025-02-11  1514  		opp-2438400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1515  			opp-hz = /bits/ 64 <2438400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1516  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1517  		};
c24db2c178578a Neil Armstrong        2025-02-11  1518  
c24db2c178578a Neil Armstrong        2025-02-11  1519  		opp-2457600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1520  			opp-hz = /bits/ 64 <2457600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1521  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1522  		};
c24db2c178578a Neil Armstrong        2025-02-11  1523  
c24db2c178578a Neil Armstrong        2025-02-11  1524  		opp-2496000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1525  			opp-hz = /bits/ 64 <2496000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1526  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1527  		};
c24db2c178578a Neil Armstrong        2025-02-11  1528  
c24db2c178578a Neil Armstrong        2025-02-11  1529  		opp-2553600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1530  			opp-hz = /bits/ 64 <2553600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1531  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1532  		};
c24db2c178578a Neil Armstrong        2025-02-11  1533  
c24db2c178578a Neil Armstrong        2025-02-11  1534  		opp-2630400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1535  			opp-hz = /bits/ 64 <2630400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1536  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1537  		};
c24db2c178578a Neil Armstrong        2025-02-11  1538  
c24db2c178578a Neil Armstrong        2025-02-11  1539  		opp-2688000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1540  			opp-hz = /bits/ 64 <2688000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1541  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1542  		};
c24db2c178578a Neil Armstrong        2025-02-11  1543  
c24db2c178578a Neil Armstrong        2025-02-11  1544  		opp-2745600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1545  			opp-hz = /bits/ 64 <2745600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1546  			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1547  		};
c24db2c178578a Neil Armstrong        2025-02-11  1548  
c24db2c178578a Neil Armstrong        2025-02-11  1549  		opp-2803200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1550  			opp-hz = /bits/ 64 <2803200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1551  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1552  		};
c24db2c178578a Neil Armstrong        2025-02-11  1553  
c24db2c178578a Neil Armstrong        2025-02-11  1554  		opp-2880000000 {
c24db2c178578a Neil Armstrong        2025-02-11  1555  			opp-hz = /bits/ 64 <2880000000>;
c24db2c178578a Neil Armstrong        2025-02-11  1556  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1557  		};
c24db2c178578a Neil Armstrong        2025-02-11  1558  
c24db2c178578a Neil Armstrong        2025-02-11  1559  		opp-2937600000 {
c24db2c178578a Neil Armstrong        2025-02-11  1560  			opp-hz = /bits/ 64 <2937600000>;
c24db2c178578a Neil Armstrong        2025-02-11  1561  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1562  		};
c24db2c178578a Neil Armstrong        2025-02-11  1563  
c24db2c178578a Neil Armstrong        2025-02-11  1564  		opp-2995200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1565  			opp-hz = /bits/ 64 <2995200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1566  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1567  		};
c24db2c178578a Neil Armstrong        2025-02-11  1568  
c24db2c178578a Neil Armstrong        2025-02-11  1569  		opp-3052800000 {
c24db2c178578a Neil Armstrong        2025-02-11  1570  			opp-hz = /bits/ 64 <3052800000>;
c24db2c178578a Neil Armstrong        2025-02-11  1571  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1572  		};
c24db2c178578a Neil Armstrong        2025-02-11  1573  
c24db2c178578a Neil Armstrong        2025-02-11  1574  		opp-3187200000 {
c24db2c178578a Neil Armstrong        2025-02-11  1575  			opp-hz = /bits/ 64 <3187200000>;
c24db2c178578a Neil Armstrong        2025-02-11  1576  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1577  		};
c24db2c178578a Neil Armstrong        2025-02-11  1578  
c24db2c178578a Neil Armstrong        2025-02-11  1579  		opp-3302400000 {
c24db2c178578a Neil Armstrong        2025-02-11  1580  			opp-hz = /bits/ 64 <3302400000>;
c24db2c178578a Neil Armstrong        2025-02-11  1581  			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
c24db2c178578a Neil Armstrong        2025-02-11  1582  		};
c24db2c178578a Neil Armstrong        2025-02-11  1583  	};
c24db2c178578a Neil Armstrong        2025-02-11  1584  
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1585) 	pmu-a520 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1586) 		compatible = "arm,cortex-a520-pmu";
2c06e0797c3299 Neil Armstrong        2025-02-28  1587  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1588) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1589) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1590) 	pmu-a720 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1591) 		compatible = "arm,cortex-a720-pmu";
2c06e0797c3299 Neil Armstrong        2025-02-28  1592  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1593) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1594) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1595) 	pmu-x4 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17  1596) 		compatible = "arm,cortex-x4-pmu";
2c06e0797c3299 Neil Armstrong        2025-02-28  1597  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster2>;
d2350377997f36 Neil Armstrong        2023-11-30  1598  	};
d2350377997f36 Neil Armstrong        2023-11-30  1599  
d2350377997f36 Neil Armstrong        2023-11-30  1600  	psci {
d2350377997f36 Neil Armstrong        2023-11-30  1601  		compatible = "arm,psci-1.0";
d2350377997f36 Neil Armstrong        2023-11-30  1602  		method = "smc";
d2350377997f36 Neil Armstrong        2023-11-30  1603  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1604  		cpu_pd0: power-domain-cpu0 {
d2350377997f36 Neil Armstrong        2023-11-30  1605  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1606  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1607  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1608  		};
d2350377997f36 Neil Armstrong        2023-11-30  1609  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1610  		cpu_pd1: power-domain-cpu1 {
d2350377997f36 Neil Armstrong        2023-11-30  1611  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1612  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1613  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1614  		};
d2350377997f36 Neil Armstrong        2023-11-30  1615  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1616  		cpu_pd2: power-domain-cpu2 {
d2350377997f36 Neil Armstrong        2023-11-30  1617  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1618  			power-domains = <&cluster_pd>;
9bb5ca464100e7 Luca Weiss            2025-03-14  1619  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1620  		};
d2350377997f36 Neil Armstrong        2023-11-30  1621  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1622  		cpu_pd3: power-domain-cpu3 {
d2350377997f36 Neil Armstrong        2023-11-30  1623  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1624  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1625  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1626  		};
d2350377997f36 Neil Armstrong        2023-11-30  1627  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1628  		cpu_pd4: power-domain-cpu4 {
d2350377997f36 Neil Armstrong        2023-11-30  1629  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1630  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1631  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1632  		};
d2350377997f36 Neil Armstrong        2023-11-30  1633  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1634  		cpu_pd5: power-domain-cpu5 {
d2350377997f36 Neil Armstrong        2023-11-30  1635  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1636  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1637  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1638  		};
d2350377997f36 Neil Armstrong        2023-11-30  1639  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1640  		cpu_pd6: power-domain-cpu6 {
d2350377997f36 Neil Armstrong        2023-11-30  1641  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1642  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1643  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1644  		};
d2350377997f36 Neil Armstrong        2023-11-30  1645  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1646  		cpu_pd7: power-domain-cpu7 {
d2350377997f36 Neil Armstrong        2023-11-30  1647  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1648  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1649  			domain-idle-states = <&gold_plus_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30  1650  		};
d2350377997f36 Neil Armstrong        2023-11-30  1651  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1652  		cluster_pd: power-domain-cluster {
d2350377997f36 Neil Armstrong        2023-11-30  1653  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1654  			domain-idle-states = <&cluster_sleep_0>,
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22  1655  					     <&cluster_sleep_1>;
d2350377997f36 Neil Armstrong        2023-11-30  1656  		};
d2350377997f36 Neil Armstrong        2023-11-30  1657  	};
d2350377997f36 Neil Armstrong        2023-11-30  1658  
d2350377997f36 Neil Armstrong        2023-11-30  1659  	reserved_memory: reserved-memory {
d2350377997f36 Neil Armstrong        2023-11-30  1660  		#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  1661  		#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  1662  		ranges;
d2350377997f36 Neil Armstrong        2023-11-30  1663  
d2350377997f36 Neil Armstrong        2023-11-30  1664  		hyp_mem: hyp@80000000 {
d2350377997f36 Neil Armstrong        2023-11-30  1665  			reg = <0 0x80000000 0 0xe00000>;
d2350377997f36 Neil Armstrong        2023-11-30  1666  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1667  		};
d2350377997f36 Neil Armstrong        2023-11-30  1668  
d2350377997f36 Neil Armstrong        2023-11-30  1669  		cpusys_vm_mem: cpusys-vm@80e00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1670  			reg = <0 0x80e00000 0 0x400000>;
d2350377997f36 Neil Armstrong        2023-11-30  1671  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1672  		};
d2350377997f36 Neil Armstrong        2023-11-30  1673  
d2350377997f36 Neil Armstrong        2023-11-30  1674  		/* Merged xbl_dtlog, xbl_ramdump and aop_image regions */
d2350377997f36 Neil Armstrong        2023-11-30  1675  		xbl_dt_log_merged_mem: xbl-dt-log-merged@81a00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1676  			reg = <0 0x81a00000 0 0x260000>;
d2350377997f36 Neil Armstrong        2023-11-30  1677  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1678  		};
d2350377997f36 Neil Armstrong        2023-11-30  1679  
d2350377997f36 Neil Armstrong        2023-11-30  1680  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
d2350377997f36 Neil Armstrong        2023-11-30  1681  			compatible = "qcom,cmd-db";
d2350377997f36 Neil Armstrong        2023-11-30  1682  			reg = <0 0x81c60000 0 0x20000>;
d2350377997f36 Neil Armstrong        2023-11-30  1683  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1684  		};
d2350377997f36 Neil Armstrong        2023-11-30  1685  
9b1e891179cacd Elliot Berman         2024-03-04  1686  		/* Merged aop_config, tme_crash_dump, tme_log, uefi_log, and chipinfo regions */
d2350377997f36 Neil Armstrong        2023-11-30  1687  		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
9b1e891179cacd Elliot Berman         2024-03-04  1688  			reg = <0 0x81c80000 0 0x75000>;
d2350377997f36 Neil Armstrong        2023-11-30  1689  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1690  		};
d2350377997f36 Neil Armstrong        2023-11-30  1691  
d2350377997f36 Neil Armstrong        2023-11-30  1692  		/* Secdata region can be reused by apps */
d2350377997f36 Neil Armstrong        2023-11-30  1693  
d2350377997f36 Neil Armstrong        2023-11-30  1694  		smem: smem@81d00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1695  			compatible = "qcom,smem";
d2350377997f36 Neil Armstrong        2023-11-30  1696  			reg = <0 0x81d00000 0 0x200000>;
d2350377997f36 Neil Armstrong        2023-11-30  1697  			hwlocks = <&tcsr_mutex 3>;
d2350377997f36 Neil Armstrong        2023-11-30  1698  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1699  		};
d2350377997f36 Neil Armstrong        2023-11-30  1700  
d2350377997f36 Neil Armstrong        2023-11-30  1701  		adsp_mhi_mem: adsp-mhi@81f00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1702  			reg = <0 0x81f00000 0 0x20000>;
d2350377997f36 Neil Armstrong        2023-11-30  1703  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1704  		};
d2350377997f36 Neil Armstrong        2023-11-30  1705  
d2350377997f36 Neil Armstrong        2023-11-30  1706  		pvmfw_mem: pvmfw@824a0000 {
d2350377997f36 Neil Armstrong        2023-11-30  1707  			reg = <0 0x824a0000 0 0x100000>;
d2350377997f36 Neil Armstrong        2023-11-30  1708  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1709  		};
d2350377997f36 Neil Armstrong        2023-11-30  1710  
d2350377997f36 Neil Armstrong        2023-11-30  1711  		global_sync_mem: global-sync@82600000 {
d2350377997f36 Neil Armstrong        2023-11-30  1712  			reg = <0 0x82600000 0 0x100000>;
d2350377997f36 Neil Armstrong        2023-11-30  1713  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1714  		};
d2350377997f36 Neil Armstrong        2023-11-30  1715  
d2350377997f36 Neil Armstrong        2023-11-30  1716  		tz_stat_mem: tz-stat@82700000 {
d2350377997f36 Neil Armstrong        2023-11-30  1717  			reg = <0 0x82700000 0 0x100000>;
d2350377997f36 Neil Armstrong        2023-11-30  1718  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1719  		};
d2350377997f36 Neil Armstrong        2023-11-30  1720  
d2350377997f36 Neil Armstrong        2023-11-30  1721  		qdss_mem: qdss@82800000 {
d2350377997f36 Neil Armstrong        2023-11-30  1722  			reg = <0 0x82800000 0 0x2000000>;
d2350377997f36 Neil Armstrong        2023-11-30  1723  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1724  		};
d2350377997f36 Neil Armstrong        2023-11-30  1725  
af53ecef19ffab Neil Armstrong        2024-01-23  1726  		qlink_logging_mem: qlink-logging@84800000 {
af53ecef19ffab Neil Armstrong        2024-01-23  1727  			reg = <0 0x84800000 0 0x200000>;
af53ecef19ffab Neil Armstrong        2024-01-23  1728  			no-map;
af53ecef19ffab Neil Armstrong        2024-01-23  1729  		};
af53ecef19ffab Neil Armstrong        2024-01-23  1730  
d2350377997f36 Neil Armstrong        2023-11-30  1731  		mpss_dsm_mem: mpss-dsm@86b00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1732  			reg = <0 0x86b00000 0 0x4900000>;
d2350377997f36 Neil Armstrong        2023-11-30  1733  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1734  		};
d2350377997f36 Neil Armstrong        2023-11-30  1735  
d2350377997f36 Neil Armstrong        2023-11-30  1736  		mpss_dsm_mem_2: mpss-dsm-2@8b400000 {
d2350377997f36 Neil Armstrong        2023-11-30  1737  			reg = <0 0x8b400000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30  1738  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1739  		};
d2350377997f36 Neil Armstrong        2023-11-30  1740  
d2350377997f36 Neil Armstrong        2023-11-30  1741  		mpss_mem: mpss@8bc00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1742  			reg = <0 0x8bc00000 0 0xf400000>;
d2350377997f36 Neil Armstrong        2023-11-30  1743  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1744  		};
d2350377997f36 Neil Armstrong        2023-11-30  1745  
d2350377997f36 Neil Armstrong        2023-11-30  1746  		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
d2350377997f36 Neil Armstrong        2023-11-30  1747  			reg = <0 0x9b000000 0 0x80000>;
d2350377997f36 Neil Armstrong        2023-11-30  1748  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1749  		};
d2350377997f36 Neil Armstrong        2023-11-30  1750  
d2350377997f36 Neil Armstrong        2023-11-30  1751  		ipa_fw_mem: ipa-fw@9b080000 {
d2350377997f36 Neil Armstrong        2023-11-30  1752  			reg = <0 0x9b080000 0 0x10000>;
d2350377997f36 Neil Armstrong        2023-11-30  1753  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1754  		};
d2350377997f36 Neil Armstrong        2023-11-30  1755  
d2350377997f36 Neil Armstrong        2023-11-30  1756  		ipa_gsi_mem: ipa-gsi@9b090000 {
d2350377997f36 Neil Armstrong        2023-11-30  1757  			reg = <0 0x9b090000 0 0xa000>;
d2350377997f36 Neil Armstrong        2023-11-30  1758  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1759  		};
d2350377997f36 Neil Armstrong        2023-11-30  1760  
d2350377997f36 Neil Armstrong        2023-11-30  1761  		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
d2350377997f36 Neil Armstrong        2023-11-30  1762  			reg = <0 0x9b09a000 0 0x2000>;
d2350377997f36 Neil Armstrong        2023-11-30  1763  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1764  		};
d2350377997f36 Neil Armstrong        2023-11-30  1765  
d2350377997f36 Neil Armstrong        2023-11-30  1766  		spss_region_mem: spss@9b0a0000 {
d2350377997f36 Neil Armstrong        2023-11-30  1767  			reg = <0 0x9b0a0000 0 0x1e0000>;
d2350377997f36 Neil Armstrong        2023-11-30  1768  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1769  		};
d2350377997f36 Neil Armstrong        2023-11-30  1770  
d2350377997f36 Neil Armstrong        2023-11-30  1771  		/* First part of the "SPU secure shared memory" region */
d2350377997f36 Neil Armstrong        2023-11-30  1772  		spu_tz_shared_mem: spu-tz-shared@9b280000 {
d2350377997f36 Neil Armstrong        2023-11-30  1773  			reg = <0 0x9b280000 0 0x60000>;
d2350377997f36 Neil Armstrong        2023-11-30  1774  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1775  		};
d2350377997f36 Neil Armstrong        2023-11-30  1776  
d2350377997f36 Neil Armstrong        2023-11-30  1777  		/* Second part of the "SPU secure shared memory" region */
d2350377997f36 Neil Armstrong        2023-11-30  1778  		spu_modem_shared_mem: spu-modem-shared@9b2e0000 {
d2350377997f36 Neil Armstrong        2023-11-30  1779  			reg = <0 0x9b2e0000 0 0x20000>;
d2350377997f36 Neil Armstrong        2023-11-30  1780  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1781  		};
d2350377997f36 Neil Armstrong        2023-11-30  1782  
d2350377997f36 Neil Armstrong        2023-11-30  1783  		camera_mem: camera@9b300000 {
d2350377997f36 Neil Armstrong        2023-11-30  1784  			reg = <0 0x9b300000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30  1785  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1786  		};
d2350377997f36 Neil Armstrong        2023-11-30  1787  
d2350377997f36 Neil Armstrong        2023-11-30  1788  		video_mem: video@9bb00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1789  			reg = <0 0x9bb00000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30  1790  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1791  		};
d2350377997f36 Neil Armstrong        2023-11-30  1792  
d2350377997f36 Neil Armstrong        2023-11-30  1793  		cvp_mem: cvp@9c300000 {
d2350377997f36 Neil Armstrong        2023-11-30  1794  			reg = <0 0x9c300000 0 0x700000>;
d2350377997f36 Neil Armstrong        2023-11-30  1795  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1796  		};
d2350377997f36 Neil Armstrong        2023-11-30  1797  
d2350377997f36 Neil Armstrong        2023-11-30  1798  		cdsp_mem: cdsp@9ca00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1799  			reg = <0 0x9ca00000 0 0x1400000>;
d2350377997f36 Neil Armstrong        2023-11-30  1800  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1801  		};
d2350377997f36 Neil Armstrong        2023-11-30  1802  
d2350377997f36 Neil Armstrong        2023-11-30  1803  		q6_cdsp_dtb_mem: q6-cdsp-dtb@9de00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1804  			reg = <0 0x9de00000 0 0x80000>;
d2350377997f36 Neil Armstrong        2023-11-30  1805  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1806  		};
d2350377997f36 Neil Armstrong        2023-11-30  1807  
d2350377997f36 Neil Armstrong        2023-11-30  1808  		q6_adsp_dtb_mem: q6-adsp-dtb@9de80000 {
d2350377997f36 Neil Armstrong        2023-11-30  1809  			reg = <0 0x9de80000 0 0x80000>;
d2350377997f36 Neil Armstrong        2023-11-30  1810  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1811  		};
d2350377997f36 Neil Armstrong        2023-11-30  1812  
d2350377997f36 Neil Armstrong        2023-11-30  1813  		adspslpi_mem: adspslpi@9df00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1814  			reg = <0 0x9df00000 0 0x4080000>;
d2350377997f36 Neil Armstrong        2023-11-30  1815  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1816  		};
d2350377997f36 Neil Armstrong        2023-11-30  1817  
d2350377997f36 Neil Armstrong        2023-11-30  1818  		rmtfs_mem: rmtfs@d7c00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1819  			compatible = "qcom,rmtfs-mem";
d2350377997f36 Neil Armstrong        2023-11-30  1820  			reg = <0 0xd7c00000 0 0x400000>;
d2350377997f36 Neil Armstrong        2023-11-30  1821  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1822  
d2350377997f36 Neil Armstrong        2023-11-30  1823  			qcom,client-id = <1>;
d2350377997f36 Neil Armstrong        2023-11-30  1824  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
d2350377997f36 Neil Armstrong        2023-11-30  1825  		};
d2350377997f36 Neil Armstrong        2023-11-30  1826  
d2350377997f36 Neil Armstrong        2023-11-30  1827  		/* Merged tz_reserved, xbl_sc, cpucp_fw and qtee regions */
d2350377997f36 Neil Armstrong        2023-11-30  1828  		tz_merged_mem: tz-merged@d8000000 {
d2350377997f36 Neil Armstrong        2023-11-30  1829  			reg = <0 0xd8000000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30  1830  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1831  		};
d2350377997f36 Neil Armstrong        2023-11-30  1832  
d2350377997f36 Neil Armstrong        2023-11-30  1833  		hwfence_shbuf: hwfence-shbuf@e6440000 {
d2350377997f36 Neil Armstrong        2023-11-30  1834  			reg = <0 0xe6440000 0 0x2dd000>;
d2350377997f36 Neil Armstrong        2023-11-30  1835  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1836  		};
d2350377997f36 Neil Armstrong        2023-11-30  1837  
d2350377997f36 Neil Armstrong        2023-11-30  1838  		trust_ui_vm_mem: trust-ui-vm@f3800000 {
d2350377997f36 Neil Armstrong        2023-11-30  1839  			reg = <0 0xf3800000 0 0x4400000>;
d2350377997f36 Neil Armstrong        2023-11-30  1840  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1841  		};
d2350377997f36 Neil Armstrong        2023-11-30  1842  
d2350377997f36 Neil Armstrong        2023-11-30  1843  		oem_vm_mem: oem-vm@f7c00000 {
d2350377997f36 Neil Armstrong        2023-11-30  1844  			reg = <0 0xf7c00000 0 0x4c00000>;
d2350377997f36 Neil Armstrong        2023-11-30  1845  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1846  		};
d2350377997f36 Neil Armstrong        2023-11-30  1847  
d2350377997f36 Neil Armstrong        2023-11-30  1848  		llcc_lpi_mem: llcc-lpi@ff800000 {
d2350377997f36 Neil Armstrong        2023-11-30  1849  			reg = <0 0xff800000 0 0x600000>;
d2350377997f36 Neil Armstrong        2023-11-30  1850  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30  1851  		};
d2350377997f36 Neil Armstrong        2023-11-30  1852  	};
d2350377997f36 Neil Armstrong        2023-11-30  1853  
10e02467129518 Neil Armstrong        2023-11-30  1854  	smp2p-adsp {
10e02467129518 Neil Armstrong        2023-11-30  1855  		compatible = "qcom,smp2p";
10e02467129518 Neil Armstrong        2023-11-30  1856  
10e02467129518 Neil Armstrong        2023-11-30  1857  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
10e02467129518 Neil Armstrong        2023-11-30  1858  					     IPCC_MPROC_SIGNAL_SMP2P
10e02467129518 Neil Armstrong        2023-11-30  1859  					     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  1860  
10e02467129518 Neil Armstrong        2023-11-30  1861  		mboxes = <&ipcc IPCC_CLIENT_LPASS
10e02467129518 Neil Armstrong        2023-11-30  1862  				IPCC_MPROC_SIGNAL_SMP2P>;
10e02467129518 Neil Armstrong        2023-11-30  1863  
10e02467129518 Neil Armstrong        2023-11-30  1864  		qcom,smem = <443>, <429>;
10e02467129518 Neil Armstrong        2023-11-30  1865  		qcom,local-pid = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1866  		qcom,remote-pid = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1867  
10e02467129518 Neil Armstrong        2023-11-30  1868  		smp2p_adsp_out: master-kernel {
10e02467129518 Neil Armstrong        2023-11-30  1869  			qcom,entry-name = "master-kernel";
10e02467129518 Neil Armstrong        2023-11-30  1870  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1871  		};
10e02467129518 Neil Armstrong        2023-11-30  1872  
10e02467129518 Neil Armstrong        2023-11-30  1873  		smp2p_adsp_in: slave-kernel {
10e02467129518 Neil Armstrong        2023-11-30  1874  			qcom,entry-name = "slave-kernel";
10e02467129518 Neil Armstrong        2023-11-30  1875  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  1876  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1877  		};
10e02467129518 Neil Armstrong        2023-11-30  1878  	};
10e02467129518 Neil Armstrong        2023-11-30  1879  
10e02467129518 Neil Armstrong        2023-11-30  1880  	smp2p-cdsp {
10e02467129518 Neil Armstrong        2023-11-30  1881  		compatible = "qcom,smp2p";
10e02467129518 Neil Armstrong        2023-11-30  1882  
10e02467129518 Neil Armstrong        2023-11-30  1883  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
10e02467129518 Neil Armstrong        2023-11-30  1884  					     IPCC_MPROC_SIGNAL_SMP2P
10e02467129518 Neil Armstrong        2023-11-30  1885  					     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  1886  
10e02467129518 Neil Armstrong        2023-11-30  1887  		mboxes = <&ipcc IPCC_CLIENT_CDSP
10e02467129518 Neil Armstrong        2023-11-30  1888  				IPCC_MPROC_SIGNAL_SMP2P>;
10e02467129518 Neil Armstrong        2023-11-30  1889  
10e02467129518 Neil Armstrong        2023-11-30  1890  		qcom,smem = <94>, <432>;
10e02467129518 Neil Armstrong        2023-11-30  1891  		qcom,local-pid = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1892  		qcom,remote-pid = <5>;
10e02467129518 Neil Armstrong        2023-11-30  1893  
10e02467129518 Neil Armstrong        2023-11-30  1894  		smp2p_cdsp_out: master-kernel {
10e02467129518 Neil Armstrong        2023-11-30  1895  			qcom,entry-name = "master-kernel";
10e02467129518 Neil Armstrong        2023-11-30  1896  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1897  		};
10e02467129518 Neil Armstrong        2023-11-30  1898  
10e02467129518 Neil Armstrong        2023-11-30  1899  		smp2p_cdsp_in: slave-kernel {
10e02467129518 Neil Armstrong        2023-11-30  1900  			qcom,entry-name = "slave-kernel";
10e02467129518 Neil Armstrong        2023-11-30  1901  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  1902  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1903  		};
10e02467129518 Neil Armstrong        2023-11-30  1904  	};
10e02467129518 Neil Armstrong        2023-11-30  1905  
10e02467129518 Neil Armstrong        2023-11-30  1906  	smp2p-modem {
10e02467129518 Neil Armstrong        2023-11-30  1907  		compatible = "qcom,smp2p";
10e02467129518 Neil Armstrong        2023-11-30  1908  
10e02467129518 Neil Armstrong        2023-11-30  1909  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30  1910  					     IPCC_MPROC_SIGNAL_SMP2P
10e02467129518 Neil Armstrong        2023-11-30  1911  					     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  1912  
10e02467129518 Neil Armstrong        2023-11-30  1913  		mboxes = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30  1914  				IPCC_MPROC_SIGNAL_SMP2P>;
10e02467129518 Neil Armstrong        2023-11-30  1915  
10e02467129518 Neil Armstrong        2023-11-30  1916  		qcom,smem = <435>, <428>;
10e02467129518 Neil Armstrong        2023-11-30  1917  		qcom,local-pid = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1918  		qcom,remote-pid = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1919  
10e02467129518 Neil Armstrong        2023-11-30  1920  		smp2p_modem_out: master-kernel {
10e02467129518 Neil Armstrong        2023-11-30  1921  			qcom,entry-name = "master-kernel";
10e02467129518 Neil Armstrong        2023-11-30  1922  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1923  		};
10e02467129518 Neil Armstrong        2023-11-30  1924  
10e02467129518 Neil Armstrong        2023-11-30  1925  		smp2p_modem_in: slave-kernel {
10e02467129518 Neil Armstrong        2023-11-30  1926  			qcom,entry-name = "slave-kernel";
10e02467129518 Neil Armstrong        2023-11-30  1927  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  1928  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1929  		};
10e02467129518 Neil Armstrong        2023-11-30  1930  
10e02467129518 Neil Armstrong        2023-11-30  1931  		ipa_smp2p_out: ipa-ap-to-modem {
10e02467129518 Neil Armstrong        2023-11-30  1932  			qcom,entry-name = "ipa";
10e02467129518 Neil Armstrong        2023-11-30  1933  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1934  		};
10e02467129518 Neil Armstrong        2023-11-30  1935  
10e02467129518 Neil Armstrong        2023-11-30  1936  		ipa_smp2p_in: ipa-modem-to-ap {
10e02467129518 Neil Armstrong        2023-11-30  1937  			qcom,entry-name = "ipa";
10e02467129518 Neil Armstrong        2023-11-30  1938  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  1939  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1940  		};
10e02467129518 Neil Armstrong        2023-11-30  1941  	};
10e02467129518 Neil Armstrong        2023-11-30  1942  
d2350377997f36 Neil Armstrong        2023-11-30  1943  	soc: soc@0 {
d2350377997f36 Neil Armstrong        2023-11-30  1944  		compatible = "simple-bus";
d2350377997f36 Neil Armstrong        2023-11-30  1945  
d2350377997f36 Neil Armstrong        2023-11-30  1946  		#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  1947  		#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  1948  		dma-ranges = <0 0 0 0 0x10 0>;
d2350377997f36 Neil Armstrong        2023-11-30  1949  		ranges = <0 0 0 0 0x10 0>;
d2350377997f36 Neil Armstrong        2023-11-30  1950  
d2350377997f36 Neil Armstrong        2023-11-30  1951  		gcc: clock-controller@100000 {
d2350377997f36 Neil Armstrong        2023-11-30  1952  			compatible = "qcom,sm8650-gcc";
d2350377997f36 Neil Armstrong        2023-11-30  1953  			reg = <0 0x00100000 0 0x1f4200>;
d2350377997f36 Neil Armstrong        2023-11-30  1954  
d2350377997f36 Neil Armstrong        2023-11-30  1955  			clocks = <&bi_tcxo_div2>,
d2350377997f36 Neil Armstrong        2023-11-30  1956  				 <&bi_tcxo_ao_div2>,
d2350377997f36 Neil Armstrong        2023-11-30  1957  				 <&sleep_clk>,
10e02467129518 Neil Armstrong        2023-11-30  1958  				 <&pcie0_phy>,
d00b42f170dfa4 Neil Armstrong        2024-05-02  1959  				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
d00b42f170dfa4 Neil Armstrong        2024-05-02  1960  				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1961  				 <&ufs_mem_phy 0>,
10e02467129518 Neil Armstrong        2023-11-30  1962  				 <&ufs_mem_phy 1>,
10e02467129518 Neil Armstrong        2023-11-30  1963  				 <&ufs_mem_phy 2>,
10e02467129518 Neil Armstrong        2023-11-30  1964  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30  1965  
d2350377997f36 Neil Armstrong        2023-11-30  1966  			#clock-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30  1967  			#reset-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30  1968  			#power-domain-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30  1969  		};
d2350377997f36 Neil Armstrong        2023-11-30  1970  
d2350377997f36 Neil Armstrong        2023-11-30  1971  		ipcc: mailbox@406000 {
d2350377997f36 Neil Armstrong        2023-11-30  1972  			compatible = "qcom,sm8650-ipcc", "qcom,ipcc";
d2350377997f36 Neil Armstrong        2023-11-30  1973  			reg = <0 0x00406000 0 0x1000>;
d2350377997f36 Neil Armstrong        2023-11-30  1974  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1975  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  1976  			interrupt-controller;
d2350377997f36 Neil Armstrong        2023-11-30  1977  			#interrupt-cells = <3>;
d2350377997f36 Neil Armstrong        2023-11-30  1978  
d2350377997f36 Neil Armstrong        2023-11-30  1979  			#mbox-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  1980  		};
d2350377997f36 Neil Armstrong        2023-11-30  1981  
d2350377997f36 Neil Armstrong        2023-11-30  1982  		gpi_dma2: dma-controller@800000 {
d2350377997f36 Neil Armstrong        2023-11-30  1983  			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
d2350377997f36 Neil Armstrong        2023-11-30  1984  			reg = <0 0x00800000 0 0x60000>;
d2350377997f36 Neil Armstrong        2023-11-30  1985  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1986  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1987  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1988  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1989  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1990  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1991  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1992  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1993  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1994  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1995  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1996  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  1997  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  1998  
d2350377997f36 Neil Armstrong        2023-11-30  1999  			dma-channels = <12>;
d2350377997f36 Neil Armstrong        2023-11-30  2000  			dma-channel-mask = <0x3f>;
d2350377997f36 Neil Armstrong        2023-11-30  2001  			#dma-cells = <3>;
d2350377997f36 Neil Armstrong        2023-11-30  2002  
d2350377997f36 Neil Armstrong        2023-11-30  2003  			iommus = <&apps_smmu 0x436 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2004  
d2350377997f36 Neil Armstrong        2023-11-30  2005  			dma-coherent;
d2350377997f36 Neil Armstrong        2023-11-30  2006  
d2350377997f36 Neil Armstrong        2023-11-30  2007  			status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2008  		};
d2350377997f36 Neil Armstrong        2023-11-30  2009  
d2350377997f36 Neil Armstrong        2023-11-30  2010  		qupv3_id_1: geniqup@8c0000 {
d2350377997f36 Neil Armstrong        2023-11-30  2011  			compatible = "qcom,geni-se-qup";
d2350377997f36 Neil Armstrong        2023-11-30  2012  			reg = <0 0x008c0000 0 0x2000>;
d2350377997f36 Neil Armstrong        2023-11-30  2013  
d2350377997f36 Neil Armstrong        2023-11-30  2014  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
d2350377997f36 Neil Armstrong        2023-11-30  2015  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30  2016  			clock-names = "m-ahb",
d2350377997f36 Neil Armstrong        2023-11-30  2017  				      "s-ahb";
d2350377997f36 Neil Armstrong        2023-11-30  2018  
d2350377997f36 Neil Armstrong        2023-11-30  2019  			iommus = <&apps_smmu 0x423 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2020  
d2350377997f36 Neil Armstrong        2023-11-30  2021  			dma-coherent;
d2350377997f36 Neil Armstrong        2023-11-30  2022  
d2350377997f36 Neil Armstrong        2023-11-30  2023  			#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  2024  			#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  2025  			ranges;
d2350377997f36 Neil Armstrong        2023-11-30  2026  
d2350377997f36 Neil Armstrong        2023-11-30  2027  			status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2028  
10e02467129518 Neil Armstrong        2023-11-30  2029  			i2c8: i2c@880000 {
10e02467129518 Neil Armstrong        2023-11-30  2030  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2031  				reg = <0 0x00880000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2032  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2033  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2034  
10e02467129518 Neil Armstrong        2023-11-30  2035  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30  2036  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2037  
10e02467129518 Neil Armstrong        2023-11-30  2038  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2039  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2040  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2041  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2042  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2043  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2044  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2045  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2046  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2047  
2c885d85dff832 Neil Armstrong        2025-01-15  2048  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2049  
2c885d85dff832 Neil Armstrong        2025-01-15  2050  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2051  
10e02467129518 Neil Armstrong        2023-11-30  2052  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2053  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2054  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2055  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2056  
10e02467129518 Neil Armstrong        2023-11-30  2057  				pinctrl-0 = <&qup_i2c8_data_clk>;
d2350377997f36 Neil Armstrong        2023-11-30  2058  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  2059  
10e02467129518 Neil Armstrong        2023-11-30  2060  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2061  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2062  
d2350377997f36 Neil Armstrong        2023-11-30  2063  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2064  			};
d2350377997f36 Neil Armstrong        2023-11-30  2065  
10e02467129518 Neil Armstrong        2023-11-30  2066  			spi8: spi@880000 {
10e02467129518 Neil Armstrong        2023-11-30  2067  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2068  				reg = <0 0x00880000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2069  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2070  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2071  
10e02467129518 Neil Armstrong        2023-11-30  2072  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2073  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2074  
10e02467129518 Neil Armstrong        2023-11-30  2075  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2076  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2077  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2078  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2079  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2080  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2081  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2082  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2083  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2084  
2c885d85dff832 Neil Armstrong        2025-01-15  2085  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2086  
2c885d85dff832 Neil Armstrong        2025-01-15  2087  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2088  
10e02467129518 Neil Armstrong        2023-11-30  2089  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2090  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2091  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2092  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2093  
10e02467129518 Neil Armstrong        2023-11-30  2094  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2095  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2096  
10e02467129518 Neil Armstrong        2023-11-30  2097  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2098  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2099  
d2350377997f36 Neil Armstrong        2023-11-30  2100  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2101  			};
d2350377997f36 Neil Armstrong        2023-11-30  2102  
10e02467129518 Neil Armstrong        2023-11-30  2103  			i2c9: i2c@884000 {
10e02467129518 Neil Armstrong        2023-11-30  2104  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2105  				reg = <0 0x00884000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2106  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2107  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2108  
10e02467129518 Neil Armstrong        2023-11-30  2109  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2110  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2111  
10e02467129518 Neil Armstrong        2023-11-30  2112  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2113  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2114  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2115  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2116  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2117  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2118  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2119  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2120  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2121  
2c885d85dff832 Neil Armstrong        2025-01-15  2122  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2123  
2c885d85dff832 Neil Armstrong        2025-01-15  2124  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2125  
10e02467129518 Neil Armstrong        2023-11-30  2126  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2127  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2128  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2129  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2130  
10e02467129518 Neil Armstrong        2023-11-30  2131  				pinctrl-0 = <&qup_i2c9_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2132  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  2133  
10e02467129518 Neil Armstrong        2023-11-30  2134  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2135  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2136  
10e02467129518 Neil Armstrong        2023-11-30  2137  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2138  			};
d2350377997f36 Neil Armstrong        2023-11-30  2139  
10e02467129518 Neil Armstrong        2023-11-30  2140  			spi9: spi@884000 {
10e02467129518 Neil Armstrong        2023-11-30  2141  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2142  				reg = <0 0x00884000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2143  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2144  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2145  
10e02467129518 Neil Armstrong        2023-11-30  2146  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2147  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2148  
10e02467129518 Neil Armstrong        2023-11-30  2149  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2150  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2151  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2152  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2153  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2154  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2155  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2156  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2157  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2158  
2c885d85dff832 Neil Armstrong        2025-01-15  2159  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2160  
2c885d85dff832 Neil Armstrong        2025-01-15  2161  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2162  
10e02467129518 Neil Armstrong        2023-11-30  2163  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2164  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2165  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2166  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2167  
10e02467129518 Neil Armstrong        2023-11-30  2168  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2169  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  2170  
10e02467129518 Neil Armstrong        2023-11-30  2171  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2172  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2173  
10e02467129518 Neil Armstrong        2023-11-30  2174  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2175  			};
d2350377997f36 Neil Armstrong        2023-11-30  2176  
10e02467129518 Neil Armstrong        2023-11-30  2177  			i2c10: i2c@888000 {
10e02467129518 Neil Armstrong        2023-11-30  2178  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2179  				reg = <0 0x00888000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2180  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2181  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2182  
10e02467129518 Neil Armstrong        2023-11-30  2183  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2184  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2185  
10e02467129518 Neil Armstrong        2023-11-30  2186  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2187  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2188  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2189  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2190  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2191  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2192  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2193  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2194  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2195  
2c885d85dff832 Neil Armstrong        2025-01-15  2196  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2197  
2c885d85dff832 Neil Armstrong        2025-01-15  2198  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2199  
10e02467129518 Neil Armstrong        2023-11-30  2200  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2201  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2202  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2203  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2204  
10e02467129518 Neil Armstrong        2023-11-30  2205  				pinctrl-0 = <&qup_i2c10_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2206  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2207  
10e02467129518 Neil Armstrong        2023-11-30  2208  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2209  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2210  
d2350377997f36 Neil Armstrong        2023-11-30  2211  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2212  			};
d2350377997f36 Neil Armstrong        2023-11-30  2213  
10e02467129518 Neil Armstrong        2023-11-30  2214  			spi10: spi@888000 {
10e02467129518 Neil Armstrong        2023-11-30  2215  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2216  				reg = <0 0x00888000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2217  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2218  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2219  
10e02467129518 Neil Armstrong        2023-11-30  2220  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2221  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2222  
10e02467129518 Neil Armstrong        2023-11-30  2223  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2224  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2225  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2226  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2227  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2228  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2229  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2230  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2231  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2232  
2c885d85dff832 Neil Armstrong        2025-01-15  2233  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2234  
2c885d85dff832 Neil Armstrong        2025-01-15  2235  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2236  
10e02467129518 Neil Armstrong        2023-11-30  2237  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2238  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2239  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2240  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2241  
10e02467129518 Neil Armstrong        2023-11-30  2242  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2243  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2244  
10e02467129518 Neil Armstrong        2023-11-30  2245  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2246  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2247  
d2350377997f36 Neil Armstrong        2023-11-30  2248  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2249  			};
d2350377997f36 Neil Armstrong        2023-11-30  2250  
10e02467129518 Neil Armstrong        2023-11-30  2251  			i2c11: i2c@88c000 {
10e02467129518 Neil Armstrong        2023-11-30  2252  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2253  				reg = <0 0x0088c000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2254  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2255  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2256  
10e02467129518 Neil Armstrong        2023-11-30  2257  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2258  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2259  
10e02467129518 Neil Armstrong        2023-11-30  2260  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2261  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2262  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2263  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2264  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2265  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2266  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2267  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2268  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2269  
2c885d85dff832 Neil Armstrong        2025-01-15  2270  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2271  
2c885d85dff832 Neil Armstrong        2025-01-15  2272  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2273  
10e02467129518 Neil Armstrong        2023-11-30  2274  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2275  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2276  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2277  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2278  
10e02467129518 Neil Armstrong        2023-11-30  2279  				pinctrl-0 = <&qup_i2c11_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2280  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  2281  
10e02467129518 Neil Armstrong        2023-11-30  2282  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2283  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2284  
d2350377997f36 Neil Armstrong        2023-11-30  2285  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  2286  			};
d2350377997f36 Neil Armstrong        2023-11-30  2287  
10e02467129518 Neil Armstrong        2023-11-30  2288  			spi11: spi@88c000 {
10e02467129518 Neil Armstrong        2023-11-30  2289  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2290  				reg = <0 0x0088c000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2291  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2292  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2293  
10e02467129518 Neil Armstrong        2023-11-30  2294  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2295  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2296  
10e02467129518 Neil Armstrong        2023-11-30  2297  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2298  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2299  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2300  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2301  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2302  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2303  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2304  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2305  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2306  
2c885d85dff832 Neil Armstrong        2025-01-15  2307  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2308  
2c885d85dff832 Neil Armstrong        2025-01-15  2309  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2310  
10e02467129518 Neil Armstrong        2023-11-30  2311  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2312  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2313  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2314  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2315  
10e02467129518 Neil Armstrong        2023-11-30  2316  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2317  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  2318  
10e02467129518 Neil Armstrong        2023-11-30  2319  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2320  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2321  
10e02467129518 Neil Armstrong        2023-11-30  2322  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2323  			};
d2350377997f36 Neil Armstrong        2023-11-30  2324  
10e02467129518 Neil Armstrong        2023-11-30  2325  			i2c12: i2c@890000 {
10e02467129518 Neil Armstrong        2023-11-30  2326  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2327  				reg = <0 0x00890000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2328  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2329  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2330  
10e02467129518 Neil Armstrong        2023-11-30  2331  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2332  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2333  
10e02467129518 Neil Armstrong        2023-11-30  2334  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2335  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2336  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2337  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2338  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2339  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2340  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2341  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2342  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2343  
2c885d85dff832 Neil Armstrong        2025-01-15  2344  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2345  
2c885d85dff832 Neil Armstrong        2025-01-15  2346  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2347  
10e02467129518 Neil Armstrong        2023-11-30  2348  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2349  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2350  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2351  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2352  
10e02467129518 Neil Armstrong        2023-11-30  2353  				pinctrl-0 = <&qup_i2c12_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2354  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2355  
10e02467129518 Neil Armstrong        2023-11-30  2356  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2357  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  2358  
d2350377997f36 Neil Armstrong        2023-11-30  2359  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2360  			};
d2350377997f36 Neil Armstrong        2023-11-30  2361  
10e02467129518 Neil Armstrong        2023-11-30  2362  			spi12: spi@890000 {
10e02467129518 Neil Armstrong        2023-11-30  2363  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2364  				reg = <0 0x00890000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  2365  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2366  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
d2350377997f36 Neil Armstrong        2023-11-30  2367  
10e02467129518 Neil Armstrong        2023-11-30  2368  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2369  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  2370  
10e02467129518 Neil Armstrong        2023-11-30  2371  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2372  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2373  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2374  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2375  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2376  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2377  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2378  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2379  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2380  
2c885d85dff832 Neil Armstrong        2025-01-15  2381  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2382  
2c885d85dff832 Neil Armstrong        2025-01-15  2383  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2384  
10e02467129518 Neil Armstrong        2023-11-30  2385  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2386  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2387  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2388  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2389  
10e02467129518 Neil Armstrong        2023-11-30  2390  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2391  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  2392  
10e02467129518 Neil Armstrong        2023-11-30  2393  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2394  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2395  
10e02467129518 Neil Armstrong        2023-11-30  2396  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2397  			};
10e02467129518 Neil Armstrong        2023-11-30  2398  
10e02467129518 Neil Armstrong        2023-11-30  2399  			i2c13: i2c@894000 {
10e02467129518 Neil Armstrong        2023-11-30  2400  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2401  				reg = <0 0x00894000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2402  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2403  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2404  
10e02467129518 Neil Armstrong        2023-11-30  2405  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2406  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2407  
10e02467129518 Neil Armstrong        2023-11-30  2408  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2409  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2410  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2411  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2412  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2413  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2414  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2415  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2416  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2417  
2c885d85dff832 Neil Armstrong        2025-01-15  2418  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2419  
2c885d85dff832 Neil Armstrong        2025-01-15  2420  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2421  
10e02467129518 Neil Armstrong        2023-11-30  2422  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2423  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2424  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2425  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2426  
10e02467129518 Neil Armstrong        2023-11-30  2427  				pinctrl-0 = <&qup_i2c13_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2428  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2429  
10e02467129518 Neil Armstrong        2023-11-30  2430  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2431  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2432  
10e02467129518 Neil Armstrong        2023-11-30  2433  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2434  			};
10e02467129518 Neil Armstrong        2023-11-30  2435  
10e02467129518 Neil Armstrong        2023-11-30  2436  			spi13: spi@894000 {
10e02467129518 Neil Armstrong        2023-11-30  2437  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2438  				reg = <0 0x00894000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2439  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2440  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2441  
10e02467129518 Neil Armstrong        2023-11-30  2442  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2443  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2444  
10e02467129518 Neil Armstrong        2023-11-30  2445  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2446  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2447  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2448  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2449  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2450  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2451  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2452  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2453  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2454  
2c885d85dff832 Neil Armstrong        2025-01-15  2455  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2456  
2c885d85dff832 Neil Armstrong        2025-01-15  2457  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2458  
10e02467129518 Neil Armstrong        2023-11-30  2459  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2460  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2461  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2462  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2463  
10e02467129518 Neil Armstrong        2023-11-30  2464  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2465  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2466  
10e02467129518 Neil Armstrong        2023-11-30  2467  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2468  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2469  
10e02467129518 Neil Armstrong        2023-11-30  2470  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2471  			};
10e02467129518 Neil Armstrong        2023-11-30  2472  
10e02467129518 Neil Armstrong        2023-11-30  2473  			uart14: serial@898000 {
10e02467129518 Neil Armstrong        2023-11-30  2474  				compatible = "qcom,geni-uart";
10e02467129518 Neil Armstrong        2023-11-30  2475  				reg = <0 0x00898000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2476  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2477  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2478  
10e02467129518 Neil Armstrong        2023-11-30  2479  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2480  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2481  
10e02467129518 Neil Armstrong        2023-11-30  2482  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2483  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2484  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2485  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2486  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2487  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2488  
2c885d85dff832 Neil Armstrong        2025-01-15  2489  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2490  
2c885d85dff832 Neil Armstrong        2025-01-15  2491  				operating-points-v2 = <&qup_opp_table_128mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2492  
10e02467129518 Neil Armstrong        2023-11-30  2493  				pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
10e02467129518 Neil Armstrong        2023-11-30  2494  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2495  
10e02467129518 Neil Armstrong        2023-11-30  2496  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2497  			};
10e02467129518 Neil Armstrong        2023-11-30  2498  
10e02467129518 Neil Armstrong        2023-11-30  2499  			uart15: serial@89c000 {
10e02467129518 Neil Armstrong        2023-11-30  2500  				compatible = "qcom,geni-debug-uart";
10e02467129518 Neil Armstrong        2023-11-30  2501  				reg = <0 0x0089c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2502  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2503  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2504  
10e02467129518 Neil Armstrong        2023-11-30  2505  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2506  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2507  
10e02467129518 Neil Armstrong        2023-11-30  2508  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2509  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2510  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2511  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2512  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2513  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2514  
2c885d85dff832 Neil Armstrong        2025-01-15  2515  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2516  
2c885d85dff832 Neil Armstrong        2025-01-15  2517  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2518  
10e02467129518 Neil Armstrong        2023-11-30  2519  				pinctrl-0 = <&qup_uart15_default>;
10e02467129518 Neil Armstrong        2023-11-30  2520  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2521  
10e02467129518 Neil Armstrong        2023-11-30  2522  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2523  			};
10e02467129518 Neil Armstrong        2023-11-30  2524  		};
10e02467129518 Neil Armstrong        2023-11-30  2525  
10e02467129518 Neil Armstrong        2023-11-30  2526  		i2c_master_hub_0: geniqup@9c0000 {
10e02467129518 Neil Armstrong        2023-11-30  2527  			compatible = "qcom,geni-se-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2528  			reg = <0 0x009c0000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  2529  
10e02467129518 Neil Armstrong        2023-11-30  2530  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2531  			clock-names = "s-ahb";
10e02467129518 Neil Armstrong        2023-11-30  2532  
10e02467129518 Neil Armstrong        2023-11-30  2533  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2534  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2535  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  2536  
10e02467129518 Neil Armstrong        2023-11-30  2537  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2538  
10e02467129518 Neil Armstrong        2023-11-30  2539  			i2c_hub_0: i2c@980000 {
10e02467129518 Neil Armstrong        2023-11-30  2540  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2541  				reg = <0 0x00980000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2542  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2543  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2544  
10e02467129518 Neil Armstrong        2023-11-30  2545  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2546  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2547  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2548  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2549  
10e02467129518 Neil Armstrong        2023-11-30  2550  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2551  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2552  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2553  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2554  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2555  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2556  
2c885d85dff832 Neil Armstrong        2025-01-15  2557  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2558  
2c885d85dff832 Neil Armstrong        2025-01-15  2559  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2560  
10e02467129518 Neil Armstrong        2023-11-30  2561  				pinctrl-0 = <&hub_i2c0_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2562  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2563  
10e02467129518 Neil Armstrong        2023-11-30  2564  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2565  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2566  
10e02467129518 Neil Armstrong        2023-11-30  2567  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2568  			};
10e02467129518 Neil Armstrong        2023-11-30  2569  
10e02467129518 Neil Armstrong        2023-11-30  2570  			i2c_hub_1: i2c@984000 {
10e02467129518 Neil Armstrong        2023-11-30  2571  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2572  				reg = <0 0x00984000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2573  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2574  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2575  
10e02467129518 Neil Armstrong        2023-11-30  2576  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2577  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2578  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2579  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2580  
10e02467129518 Neil Armstrong        2023-11-30  2581  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2582  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2583  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2584  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2585  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2586  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2587  
2c885d85dff832 Neil Armstrong        2025-01-15  2588  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2589  
2c885d85dff832 Neil Armstrong        2025-01-15  2590  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2591  
10e02467129518 Neil Armstrong        2023-11-30  2592  				pinctrl-0 = <&hub_i2c1_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2593  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2594  
10e02467129518 Neil Armstrong        2023-11-30  2595  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2596  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2597  
10e02467129518 Neil Armstrong        2023-11-30  2598  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2599  			};
10e02467129518 Neil Armstrong        2023-11-30  2600  
10e02467129518 Neil Armstrong        2023-11-30  2601  			i2c_hub_2: i2c@988000 {
10e02467129518 Neil Armstrong        2023-11-30  2602  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2603  				reg = <0 0x00988000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2604  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2605  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2606  
10e02467129518 Neil Armstrong        2023-11-30  2607  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2608  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2609  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2610  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2611  
10e02467129518 Neil Armstrong        2023-11-30  2612  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2613  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2614  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2615  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2616  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2617  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2618  
2c885d85dff832 Neil Armstrong        2025-01-15  2619  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2620  
2c885d85dff832 Neil Armstrong        2025-01-15  2621  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2622  
10e02467129518 Neil Armstrong        2023-11-30  2623  				pinctrl-0 = <&hub_i2c2_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2624  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2625  
10e02467129518 Neil Armstrong        2023-11-30  2626  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2627  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2628  
10e02467129518 Neil Armstrong        2023-11-30  2629  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2630  			};
10e02467129518 Neil Armstrong        2023-11-30  2631  
10e02467129518 Neil Armstrong        2023-11-30  2632  			i2c_hub_3: i2c@98c000 {
10e02467129518 Neil Armstrong        2023-11-30  2633  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2634  				reg = <0 0x0098c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2635  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2636  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2637  
10e02467129518 Neil Armstrong        2023-11-30  2638  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2639  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2640  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2641  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2642  
10e02467129518 Neil Armstrong        2023-11-30  2643  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2644  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2645  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2646  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2647  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2648  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2649  
2c885d85dff832 Neil Armstrong        2025-01-15  2650  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2651  
2c885d85dff832 Neil Armstrong        2025-01-15  2652  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2653  
10e02467129518 Neil Armstrong        2023-11-30  2654  				pinctrl-0 = <&hub_i2c3_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2655  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2656  
10e02467129518 Neil Armstrong        2023-11-30  2657  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2658  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2659  
10e02467129518 Neil Armstrong        2023-11-30  2660  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2661  			};
10e02467129518 Neil Armstrong        2023-11-30  2662  
10e02467129518 Neil Armstrong        2023-11-30  2663  			i2c_hub_4: i2c@990000 {
10e02467129518 Neil Armstrong        2023-11-30  2664  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2665  				reg = <0 0x00990000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2666  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2667  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2668  
10e02467129518 Neil Armstrong        2023-11-30  2669  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2670  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2671  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2672  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2673  
10e02467129518 Neil Armstrong        2023-11-30  2674  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2675  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2676  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2677  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2678  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2679  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2680  
2c885d85dff832 Neil Armstrong        2025-01-15  2681  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2682  
2c885d85dff832 Neil Armstrong        2025-01-15  2683  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2684  
10e02467129518 Neil Armstrong        2023-11-30  2685  				pinctrl-0 = <&hub_i2c4_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2686  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2687  
10e02467129518 Neil Armstrong        2023-11-30  2688  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2689  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2690  
10e02467129518 Neil Armstrong        2023-11-30  2691  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2692  			};
10e02467129518 Neil Armstrong        2023-11-30  2693  
10e02467129518 Neil Armstrong        2023-11-30  2694  			i2c_hub_5: i2c@994000 {
10e02467129518 Neil Armstrong        2023-11-30  2695  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2696  				reg = <0 0x00994000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2697  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2698  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2699  
10e02467129518 Neil Armstrong        2023-11-30  2700  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2701  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2702  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2703  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2704  
10e02467129518 Neil Armstrong        2023-11-30  2705  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2706  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2707  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2708  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2709  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2710  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2711  
2c885d85dff832 Neil Armstrong        2025-01-15  2712  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2713  
2c885d85dff832 Neil Armstrong        2025-01-15  2714  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2715  
10e02467129518 Neil Armstrong        2023-11-30  2716  				pinctrl-0 = <&hub_i2c5_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2717  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2718  
10e02467129518 Neil Armstrong        2023-11-30  2719  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2720  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2721  
10e02467129518 Neil Armstrong        2023-11-30  2722  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2723  			};
10e02467129518 Neil Armstrong        2023-11-30  2724  
10e02467129518 Neil Armstrong        2023-11-30  2725  			i2c_hub_6: i2c@998000 {
10e02467129518 Neil Armstrong        2023-11-30  2726  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2727  				reg = <0 0x00998000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2728  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2729  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2730  
10e02467129518 Neil Armstrong        2023-11-30  2731  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2732  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2733  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2734  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2735  
10e02467129518 Neil Armstrong        2023-11-30  2736  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2737  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2738  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2739  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2740  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2741  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2742  
2c885d85dff832 Neil Armstrong        2025-01-15  2743  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2744  
2c885d85dff832 Neil Armstrong        2025-01-15  2745  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2746  
10e02467129518 Neil Armstrong        2023-11-30  2747  				pinctrl-0 = <&hub_i2c6_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2748  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2749  
10e02467129518 Neil Armstrong        2023-11-30  2750  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2751  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2752  
10e02467129518 Neil Armstrong        2023-11-30  2753  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2754  			};
10e02467129518 Neil Armstrong        2023-11-30  2755  
10e02467129518 Neil Armstrong        2023-11-30  2756  			i2c_hub_7: i2c@99c000 {
10e02467129518 Neil Armstrong        2023-11-30  2757  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2758  				reg = <0 0x0099c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2759  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2760  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2761  
10e02467129518 Neil Armstrong        2023-11-30  2762  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2763  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2764  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2765  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2766  
10e02467129518 Neil Armstrong        2023-11-30  2767  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2768  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2769  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2770  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2771  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2772  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2773  
2c885d85dff832 Neil Armstrong        2025-01-15  2774  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2775  
2c885d85dff832 Neil Armstrong        2025-01-15  2776  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2777  
10e02467129518 Neil Armstrong        2023-11-30  2778  				pinctrl-0 = <&hub_i2c7_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2779  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2780  
10e02467129518 Neil Armstrong        2023-11-30  2781  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2782  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2783  
10e02467129518 Neil Armstrong        2023-11-30  2784  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2785  			};
10e02467129518 Neil Armstrong        2023-11-30  2786  
10e02467129518 Neil Armstrong        2023-11-30  2787  			i2c_hub_8: i2c@9a0000 {
10e02467129518 Neil Armstrong        2023-11-30  2788  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2789  				reg = <0 0x009a0000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2790  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2791  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2792  
10e02467129518 Neil Armstrong        2023-11-30  2793  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2794  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2795  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2796  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2797  
10e02467129518 Neil Armstrong        2023-11-30  2798  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2799  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2800  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2801  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2802  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2803  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2804  
2c885d85dff832 Neil Armstrong        2025-01-15  2805  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2806  
2c885d85dff832 Neil Armstrong        2025-01-15  2807  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2808  
10e02467129518 Neil Armstrong        2023-11-30  2809  				pinctrl-0 = <&hub_i2c8_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2810  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2811  
10e02467129518 Neil Armstrong        2023-11-30  2812  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2813  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2814  
10e02467129518 Neil Armstrong        2023-11-30  2815  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2816  			};
10e02467129518 Neil Armstrong        2023-11-30  2817  
10e02467129518 Neil Armstrong        2023-11-30  2818  			i2c_hub_9: i2c@9a4000 {
10e02467129518 Neil Armstrong        2023-11-30  2819  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  2820  				reg = <0 0x009a4000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2821  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2822  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2823  
10e02467129518 Neil Armstrong        2023-11-30  2824  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2825  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2826  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  2827  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  2828  
10e02467129518 Neil Armstrong        2023-11-30  2829  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2830  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2831  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2832  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  2833  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2834  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  2835  
2c885d85dff832 Neil Armstrong        2025-01-15  2836  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2837  
2c885d85dff832 Neil Armstrong        2025-01-15  2838  				required-opps = <&rpmhpd_opp_low_svs>;
2c885d85dff832 Neil Armstrong        2025-01-15  2839  
10e02467129518 Neil Armstrong        2023-11-30  2840  				pinctrl-0 = <&hub_i2c9_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2841  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2842  
10e02467129518 Neil Armstrong        2023-11-30  2843  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2844  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2845  
10e02467129518 Neil Armstrong        2023-11-30  2846  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2847  			};
10e02467129518 Neil Armstrong        2023-11-30  2848  		};
10e02467129518 Neil Armstrong        2023-11-30  2849  
10e02467129518 Neil Armstrong        2023-11-30  2850  		gpi_dma1: dma-controller@a00000 {
10e02467129518 Neil Armstrong        2023-11-30  2851  			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
10e02467129518 Neil Armstrong        2023-11-30  2852  			reg = <0 0x00a00000 0 0x60000>;
10e02467129518 Neil Armstrong        2023-11-30  2853  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2854  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2855  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2856  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2857  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2858  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2859  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2860  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2861  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2862  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2863  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2864  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2865  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2866  
10e02467129518 Neil Armstrong        2023-11-30  2867  			dma-channels = <12>;
10e02467129518 Neil Armstrong        2023-11-30  2868  			dma-channel-mask = <0xc>;
10e02467129518 Neil Armstrong        2023-11-30  2869  			#dma-cells = <3>;
10e02467129518 Neil Armstrong        2023-11-30  2870  
10e02467129518 Neil Armstrong        2023-11-30  2871  			iommus = <&apps_smmu 0xb6 0>;
10e02467129518 Neil Armstrong        2023-11-30  2872  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  2873  
10e02467129518 Neil Armstrong        2023-11-30  2874  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2875  		};
10e02467129518 Neil Armstrong        2023-11-30  2876  
10e02467129518 Neil Armstrong        2023-11-30  2877  		qupv3_id_0: geniqup@ac0000 {
10e02467129518 Neil Armstrong        2023-11-30  2878  			compatible = "qcom,geni-se-qup";
10e02467129518 Neil Armstrong        2023-11-30  2879  			reg = <0 0x00ac0000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  2880  
10e02467129518 Neil Armstrong        2023-11-30  2881  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2882  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2883  			clock-names = "m-ahb",
10e02467129518 Neil Armstrong        2023-11-30  2884  				      "s-ahb";
10e02467129518 Neil Armstrong        2023-11-30  2885  
10e02467129518 Neil Armstrong        2023-11-30  2886  			interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2887  					 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2888  			interconnect-names = "qup-core";
10e02467129518 Neil Armstrong        2023-11-30  2889  
10e02467129518 Neil Armstrong        2023-11-30  2890  			iommus = <&apps_smmu 0xa3 0>;
10e02467129518 Neil Armstrong        2023-11-30  2891  
10e02467129518 Neil Armstrong        2023-11-30  2892  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  2893  
10e02467129518 Neil Armstrong        2023-11-30  2894  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2895  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2896  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  2897  
10e02467129518 Neil Armstrong        2023-11-30  2898  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2899  
10e02467129518 Neil Armstrong        2023-11-30  2900  			i2c0: i2c@a80000 {
10e02467129518 Neil Armstrong        2023-11-30  2901  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2902  				reg = <0 0x00a80000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2903  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2904  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2905  
10e02467129518 Neil Armstrong        2023-11-30  2906  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2907  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2908  
10e02467129518 Neil Armstrong        2023-11-30  2909  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2910  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2911  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2912  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2913  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2914  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2915  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2916  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2917  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2918  
2c885d85dff832 Neil Armstrong        2025-01-15  2919  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2920  
2c885d85dff832 Neil Armstrong        2025-01-15  2921  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2922  
10e02467129518 Neil Armstrong        2023-11-30  2923  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2924  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2925  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2926  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2927  
10e02467129518 Neil Armstrong        2023-11-30  2928  				pinctrl-0 = <&qup_i2c0_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2929  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2930  
10e02467129518 Neil Armstrong        2023-11-30  2931  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2932  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2933  
10e02467129518 Neil Armstrong        2023-11-30  2934  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2935  			};
10e02467129518 Neil Armstrong        2023-11-30  2936  
10e02467129518 Neil Armstrong        2023-11-30  2937  			spi0: spi@a80000 {
10e02467129518 Neil Armstrong        2023-11-30  2938  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2939  				reg = <0 0x00a80000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2940  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2941  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2942  
10e02467129518 Neil Armstrong        2023-11-30  2943  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2944  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2945  
10e02467129518 Neil Armstrong        2023-11-30  2946  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2947  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2948  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2949  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2950  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2951  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2952  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2953  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2954  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2955  
2c885d85dff832 Neil Armstrong        2025-01-15  2956  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2957  
2c885d85dff832 Neil Armstrong        2025-01-15  2958  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2959  
10e02467129518 Neil Armstrong        2023-11-30  2960  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2961  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2962  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2963  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2964  
10e02467129518 Neil Armstrong        2023-11-30  2965  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2966  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2967  
10e02467129518 Neil Armstrong        2023-11-30  2968  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2969  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2970  
10e02467129518 Neil Armstrong        2023-11-30  2971  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2972  			};
10e02467129518 Neil Armstrong        2023-11-30  2973  
10e02467129518 Neil Armstrong        2023-11-30  2974  			i2c1: i2c@a84000 {
10e02467129518 Neil Armstrong        2023-11-30  2975  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2976  				reg = <0 0x00a84000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2977  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  2978  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  2979  
10e02467129518 Neil Armstrong        2023-11-30  2980  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2981  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2982  
10e02467129518 Neil Armstrong        2023-11-30  2983  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2984  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  2985  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  2986  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  2987  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2988  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2989  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2990  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2991  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2992  
2c885d85dff832 Neil Armstrong        2025-01-15  2993  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  2994  
2c885d85dff832 Neil Armstrong        2025-01-15  2995  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  2996  
10e02467129518 Neil Armstrong        2023-11-30  2997  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2998  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2999  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3000  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3001  
10e02467129518 Neil Armstrong        2023-11-30  3002  				pinctrl-0 = <&qup_i2c1_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3003  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3004  
10e02467129518 Neil Armstrong        2023-11-30  3005  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3006  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3007  
10e02467129518 Neil Armstrong        2023-11-30  3008  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3009  			};
10e02467129518 Neil Armstrong        2023-11-30  3010  
10e02467129518 Neil Armstrong        2023-11-30  3011  			spi1: spi@a84000 {
10e02467129518 Neil Armstrong        2023-11-30  3012  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3013  				reg = <0 0x00a84000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3014  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3015  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3016  
10e02467129518 Neil Armstrong        2023-11-30  3017  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3018  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3019  
10e02467129518 Neil Armstrong        2023-11-30  3020  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3021  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3022  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3023  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3024  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3025  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3026  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3027  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3028  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3029  
2c885d85dff832 Neil Armstrong        2025-01-15  3030  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3031  
2c885d85dff832 Neil Armstrong        2025-01-15  3032  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3033  
10e02467129518 Neil Armstrong        2023-11-30  3034  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3035  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3036  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3037  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3038  
10e02467129518 Neil Armstrong        2023-11-30  3039  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3040  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3041  
10e02467129518 Neil Armstrong        2023-11-30  3042  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3043  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3044  
10e02467129518 Neil Armstrong        2023-11-30  3045  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3046  			};
10e02467129518 Neil Armstrong        2023-11-30  3047  
10e02467129518 Neil Armstrong        2023-11-30  3048  			i2c2: i2c@a88000 {
10e02467129518 Neil Armstrong        2023-11-30  3049  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  3050  				reg = <0 0x00a88000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3051  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3052  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3053  
10e02467129518 Neil Armstrong        2023-11-30  3054  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3055  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3056  
10e02467129518 Neil Armstrong        2023-11-30  3057  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3058  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3059  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3060  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3061  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3062  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3063  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3064  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3065  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3066  
2c885d85dff832 Neil Armstrong        2025-01-15  3067  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3068  
2c885d85dff832 Neil Armstrong        2025-01-15  3069  				operating-points-v2 = <&qup_opp_table_240mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3070  
10e02467129518 Neil Armstrong        2023-11-30  3071  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  3072  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  3073  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3074  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3075  
10e02467129518 Neil Armstrong        2023-11-30  3076  				pinctrl-0 = <&qup_i2c2_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3077  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3078  
10e02467129518 Neil Armstrong        2023-11-30  3079  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3080  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3081  
10e02467129518 Neil Armstrong        2023-11-30  3082  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3083  			};
10e02467129518 Neil Armstrong        2023-11-30  3084  
10e02467129518 Neil Armstrong        2023-11-30  3085  			spi2: spi@a88000 {
10e02467129518 Neil Armstrong        2023-11-30  3086  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3087  				reg = <0 0x00a88000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3088  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3089  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3090  
10e02467129518 Neil Armstrong        2023-11-30  3091  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3092  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3093  
10e02467129518 Neil Armstrong        2023-11-30  3094  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3095  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3096  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3097  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3098  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3099  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3100  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3101  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3102  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3103  
2c885d85dff832 Neil Armstrong        2025-01-15  3104  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3105  
2c885d85dff832 Neil Armstrong        2025-01-15  3106  				operating-points-v2 = <&qup_opp_table_240mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3107  
10e02467129518 Neil Armstrong        2023-11-30  3108  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3109  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3110  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3111  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3112  
10e02467129518 Neil Armstrong        2023-11-30  3113  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3114  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3115  
10e02467129518 Neil Armstrong        2023-11-30  3116  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3117  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3118  
10e02467129518 Neil Armstrong        2023-11-30  3119  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3120  			};
10e02467129518 Neil Armstrong        2023-11-30  3121  
10e02467129518 Neil Armstrong        2023-11-30  3122  			i2c3: i2c@a8c000 {
10e02467129518 Neil Armstrong        2023-11-30  3123  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  3124  				reg = <0 0x00a8c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3125  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3126  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3127  
10e02467129518 Neil Armstrong        2023-11-30  3128  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3129  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3130  
10e02467129518 Neil Armstrong        2023-11-30  3131  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3132  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3133  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3134  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3135  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3136  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3137  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3138  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3139  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3140  
2c885d85dff832 Neil Armstrong        2025-01-15  3141  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3142  
2c885d85dff832 Neil Armstrong        2025-01-15  3143  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3144  
10e02467129518 Neil Armstrong        2023-11-30  3145  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  3146  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  3147  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3148  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3149  
10e02467129518 Neil Armstrong        2023-11-30  3150  				pinctrl-0 = <&qup_i2c3_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3151  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3152  
10e02467129518 Neil Armstrong        2023-11-30  3153  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3154  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3155  
10e02467129518 Neil Armstrong        2023-11-30  3156  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3157  			};
10e02467129518 Neil Armstrong        2023-11-30  3158  
10e02467129518 Neil Armstrong        2023-11-30  3159  			spi3: spi@a8c000 {
10e02467129518 Neil Armstrong        2023-11-30  3160  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3161  				reg = <0 0x00a8c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3162  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3163  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3164  
10e02467129518 Neil Armstrong        2023-11-30  3165  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3166  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3167  
10e02467129518 Neil Armstrong        2023-11-30  3168  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3169  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3170  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3171  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3172  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3173  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3174  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3175  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3176  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3177  
2c885d85dff832 Neil Armstrong        2025-01-15  3178  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3179  
2c885d85dff832 Neil Armstrong        2025-01-15  3180  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3181  
10e02467129518 Neil Armstrong        2023-11-30  3182  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3183  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3184  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3185  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3186  
10e02467129518 Neil Armstrong        2023-11-30  3187  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3188  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3189  
10e02467129518 Neil Armstrong        2023-11-30  3190  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3191  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3192  
10e02467129518 Neil Armstrong        2023-11-30  3193  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3194  			};
10e02467129518 Neil Armstrong        2023-11-30  3195  
10e02467129518 Neil Armstrong        2023-11-30  3196  			i2c4: i2c@a90000 {
10e02467129518 Neil Armstrong        2023-11-30  3197  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  3198  				reg = <0 0x00a90000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3199  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3200  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3201  
10e02467129518 Neil Armstrong        2023-11-30  3202  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3203  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3204  
10e02467129518 Neil Armstrong        2023-11-30  3205  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3206  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3207  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3208  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3209  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3210  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3211  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3212  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3213  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3214  
2c885d85dff832 Neil Armstrong        2025-01-15  3215  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3216  
2c885d85dff832 Neil Armstrong        2025-01-15  3217  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3218  
10e02467129518 Neil Armstrong        2023-11-30  3219  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  3220  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  3221  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3222  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3223  
10e02467129518 Neil Armstrong        2023-11-30  3224  				pinctrl-0 = <&qup_i2c4_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3225  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3226  
10e02467129518 Neil Armstrong        2023-11-30  3227  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3228  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3229  
10e02467129518 Neil Armstrong        2023-11-30  3230  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3231  			};
10e02467129518 Neil Armstrong        2023-11-30  3232  
10e02467129518 Neil Armstrong        2023-11-30  3233  			spi4: spi@a90000 {
10e02467129518 Neil Armstrong        2023-11-30  3234  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3235  				reg = <0 0x00a90000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3236  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3237  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3238  
10e02467129518 Neil Armstrong        2023-11-30  3239  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3240  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3241  
10e02467129518 Neil Armstrong        2023-11-30  3242  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3243  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3244  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3245  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3246  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3247  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3248  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3249  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3250  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3251  
2c885d85dff832 Neil Armstrong        2025-01-15  3252  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3253  
2c885d85dff832 Neil Armstrong        2025-01-15  3254  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3255  
10e02467129518 Neil Armstrong        2023-11-30  3256  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3257  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3258  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3259  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3260  
10e02467129518 Neil Armstrong        2023-11-30  3261  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3262  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3263  
10e02467129518 Neil Armstrong        2023-11-30  3264  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3265  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3266  
10e02467129518 Neil Armstrong        2023-11-30  3267  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3268  			};
10e02467129518 Neil Armstrong        2023-11-30  3269  
10e02467129518 Neil Armstrong        2023-11-30  3270  			i2c5: i2c@a94000 {
10e02467129518 Neil Armstrong        2023-11-30  3271  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  3272  				reg = <0 0x00a94000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3273  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3274  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3275  
10e02467129518 Neil Armstrong        2023-11-30  3276  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3277  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3278  
10e02467129518 Neil Armstrong        2023-11-30  3279  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3280  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3281  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3282  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3283  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3284  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3285  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3286  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3287  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3288  
2c885d85dff832 Neil Armstrong        2025-01-15  3289  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3290  
2c885d85dff832 Neil Armstrong        2025-01-15  3291  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3292  
10e02467129518 Neil Armstrong        2023-11-30  3293  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  3294  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  3295  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3296  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3297  
10e02467129518 Neil Armstrong        2023-11-30  3298  				pinctrl-0 = <&qup_i2c5_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3299  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3300  
10e02467129518 Neil Armstrong        2023-11-30  3301  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3302  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3303  
10e02467129518 Neil Armstrong        2023-11-30  3304  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3305  			};
10e02467129518 Neil Armstrong        2023-11-30  3306  
10e02467129518 Neil Armstrong        2023-11-30  3307  			spi5: spi@a94000 {
10e02467129518 Neil Armstrong        2023-11-30  3308  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3309  				reg = <0 0x00a94000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3310  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3311  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3312  
10e02467129518 Neil Armstrong        2023-11-30  3313  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3314  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3315  
10e02467129518 Neil Armstrong        2023-11-30  3316  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3317  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3318  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3319  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3320  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3321  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3322  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3323  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3324  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3325  
2c885d85dff832 Neil Armstrong        2025-01-15  3326  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3327  
2c885d85dff832 Neil Armstrong        2025-01-15  3328  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3329  
10e02467129518 Neil Armstrong        2023-11-30  3330  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3331  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3332  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3333  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3334  
10e02467129518 Neil Armstrong        2023-11-30  3335  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3336  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3337  
10e02467129518 Neil Armstrong        2023-11-30  3338  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3339  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3340  
10e02467129518 Neil Armstrong        2023-11-30  3341  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3342  			};
10e02467129518 Neil Armstrong        2023-11-30  3343  
10e02467129518 Neil Armstrong        2023-11-30  3344  			i2c6: i2c@a98000 {
10e02467129518 Neil Armstrong        2023-11-30  3345  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  3346  				reg = <0 0x00a98000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3347  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3348  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3349  
10e02467129518 Neil Armstrong        2023-11-30  3350  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3351  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3352  
10e02467129518 Neil Armstrong        2023-11-30  3353  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3354  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3355  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3356  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3357  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3358  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3359  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3360  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3361  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3362  
2c885d85dff832 Neil Armstrong        2025-01-15  3363  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3364  
2c885d85dff832 Neil Armstrong        2025-01-15  3365  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3366  
10e02467129518 Neil Armstrong        2023-11-30  3367  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  3368  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  3369  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3370  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3371  
10e02467129518 Neil Armstrong        2023-11-30  3372  				pinctrl-0 = <&qup_i2c6_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3373  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3374  
10e02467129518 Neil Armstrong        2023-11-30  3375  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3376  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3377  
10e02467129518 Neil Armstrong        2023-11-30  3378  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3379  			};
10e02467129518 Neil Armstrong        2023-11-30  3380  
10e02467129518 Neil Armstrong        2023-11-30  3381  			spi6: spi@a98000 {
10e02467129518 Neil Armstrong        2023-11-30  3382  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3383  				reg = <0 0x00a98000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3384  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3385  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3386  
10e02467129518 Neil Armstrong        2023-11-30  3387  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3388  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3389  
10e02467129518 Neil Armstrong        2023-11-30  3390  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3391  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3392  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3393  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3394  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3395  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3396  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3397  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3398  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3399  
2c885d85dff832 Neil Armstrong        2025-01-15  3400  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3401  
2c885d85dff832 Neil Armstrong        2025-01-15  3402  				operating-points-v2 = <&qup_opp_table_120mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3403  
10e02467129518 Neil Armstrong        2023-11-30  3404  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3405  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3406  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3407  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3408  
10e02467129518 Neil Armstrong        2023-11-30  3409  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3410  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3411  
10e02467129518 Neil Armstrong        2023-11-30  3412  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3413  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3414  
10e02467129518 Neil Armstrong        2023-11-30  3415  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3416  			};
10e02467129518 Neil Armstrong        2023-11-30  3417  
10e02467129518 Neil Armstrong        2023-11-30  3418  			i2c7: i2c@a9c000 {
10e02467129518 Neil Armstrong        2023-11-30  3419  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  3420  				reg = <0 0x00a9c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3421  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3422  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3423  
10e02467129518 Neil Armstrong        2023-11-30  3424  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3425  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3426  
10e02467129518 Neil Armstrong        2023-11-30  3427  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3428  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3429  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3430  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3431  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3432  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3433  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3434  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3435  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3436  
2c885d85dff832 Neil Armstrong        2025-01-15  3437  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3438  
2c885d85dff832 Neil Armstrong        2025-01-15  3439  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3440  
10e02467129518 Neil Armstrong        2023-11-30  3441  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  3442  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  3443  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3444  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3445  
10e02467129518 Neil Armstrong        2023-11-30  3446  				pinctrl-0 = <&qup_i2c7_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  3447  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3448  
10e02467129518 Neil Armstrong        2023-11-30  3449  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3450  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3451  
10e02467129518 Neil Armstrong        2023-11-30  3452  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3453  			};
10e02467129518 Neil Armstrong        2023-11-30  3454  
10e02467129518 Neil Armstrong        2023-11-30  3455  			spi7: spi@a9c000 {
10e02467129518 Neil Armstrong        2023-11-30  3456  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  3457  				reg = <0 0x00a9c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  3458  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3459  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3460  
10e02467129518 Neil Armstrong        2023-11-30  3461  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3462  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  3463  
10e02467129518 Neil Armstrong        2023-11-30  3464  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3465  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3466  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3467  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
10e02467129518 Neil Armstrong        2023-11-30  3468  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3469  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3470  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  3471  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  3472  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  3473  
2c885d85dff832 Neil Armstrong        2025-01-15  3474  				power-domains = <&rpmhpd RPMHPD_CX>;
2c885d85dff832 Neil Armstrong        2025-01-15  3475  
2c885d85dff832 Neil Armstrong        2025-01-15  3476  				operating-points-v2 = <&qup_opp_table_100mhz>;
2c885d85dff832 Neil Armstrong        2025-01-15  3477  
10e02467129518 Neil Armstrong        2023-11-30  3478  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  3479  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  3480  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  3481  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  3482  
10e02467129518 Neil Armstrong        2023-11-30  3483  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
10e02467129518 Neil Armstrong        2023-11-30  3484  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  3485  
10e02467129518 Neil Armstrong        2023-11-30  3486  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3487  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3488  
10e02467129518 Neil Armstrong        2023-11-30  3489  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3490  			};
10e02467129518 Neil Armstrong        2023-11-30  3491  		};
10e02467129518 Neil Armstrong        2023-11-30  3492  
10e02467129518 Neil Armstrong        2023-11-30  3493  		cnoc_main: interconnect@1500000 {
10e02467129518 Neil Armstrong        2023-11-30  3494  			compatible = "qcom,sm8650-cnoc-main";
10e02467129518 Neil Armstrong        2023-11-30  3495  			reg = <0 0x01500000 0 0x14080>;
10e02467129518 Neil Armstrong        2023-11-30  3496  
10e02467129518 Neil Armstrong        2023-11-30  3497  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3498  
10e02467129518 Neil Armstrong        2023-11-30  3499  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3500  		};
10e02467129518 Neil Armstrong        2023-11-30  3501  
10e02467129518 Neil Armstrong        2023-11-30  3502  		config_noc: interconnect@1600000 {
10e02467129518 Neil Armstrong        2023-11-30  3503  			compatible = "qcom,sm8650-config-noc";
10e02467129518 Neil Armstrong        2023-11-30  3504  			reg = <0 0x01600000 0 0x6200>;
10e02467129518 Neil Armstrong        2023-11-30  3505  
10e02467129518 Neil Armstrong        2023-11-30  3506  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3507  
10e02467129518 Neil Armstrong        2023-11-30  3508  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3509  		};
10e02467129518 Neil Armstrong        2023-11-30  3510  
10e02467129518 Neil Armstrong        2023-11-30  3511  		system_noc: interconnect@1680000 {
10e02467129518 Neil Armstrong        2023-11-30  3512  			compatible = "qcom,sm8650-system-noc";
10e02467129518 Neil Armstrong        2023-11-30  3513  			reg = <0 0x01680000 0 0x1d080>;
10e02467129518 Neil Armstrong        2023-11-30  3514  
10e02467129518 Neil Armstrong        2023-11-30  3515  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3516  
10e02467129518 Neil Armstrong        2023-11-30  3517  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3518  		};
10e02467129518 Neil Armstrong        2023-11-30  3519  
10e02467129518 Neil Armstrong        2023-11-30  3520  		pcie_noc: interconnect@16c0000 {
10e02467129518 Neil Armstrong        2023-11-30  3521  			compatible = "qcom,sm8650-pcie-anoc";
10e02467129518 Neil Armstrong        2023-11-30  3522  			reg = <0 0x016c0000 0 0x12200>;
10e02467129518 Neil Armstrong        2023-11-30  3523  
10e02467129518 Neil Armstrong        2023-11-30  3524  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3525  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3526  
10e02467129518 Neil Armstrong        2023-11-30  3527  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3528  
10e02467129518 Neil Armstrong        2023-11-30  3529  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3530  		};
10e02467129518 Neil Armstrong        2023-11-30  3531  
10e02467129518 Neil Armstrong        2023-11-30  3532  		aggre1_noc: interconnect@16e0000 {
10e02467129518 Neil Armstrong        2023-11-30  3533  			compatible = "qcom,sm8650-aggre1-noc";
10e02467129518 Neil Armstrong        2023-11-30  3534  			reg = <0 0x016e0000 0 0x16400>;
10e02467129518 Neil Armstrong        2023-11-30  3535  
10e02467129518 Neil Armstrong        2023-11-30  3536  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3537  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3538  
10e02467129518 Neil Armstrong        2023-11-30  3539  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3540  
10e02467129518 Neil Armstrong        2023-11-30  3541  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3542  		};
10e02467129518 Neil Armstrong        2023-11-30  3543  
10e02467129518 Neil Armstrong        2023-11-30  3544  		aggre2_noc: interconnect@1700000 {
10e02467129518 Neil Armstrong        2023-11-30  3545  			compatible = "qcom,sm8650-aggre2-noc";
10e02467129518 Neil Armstrong        2023-11-30  3546  			reg = <0 0x01700000 0 0x1e400>;
10e02467129518 Neil Armstrong        2023-11-30  3547  
10e02467129518 Neil Armstrong        2023-11-30  3548  			clocks = <&rpmhcc RPMH_IPA_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3549  
10e02467129518 Neil Armstrong        2023-11-30  3550  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3551  
10e02467129518 Neil Armstrong        2023-11-30  3552  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3553  		};
10e02467129518 Neil Armstrong        2023-11-30  3554  
10e02467129518 Neil Armstrong        2023-11-30  3555  		mmss_noc: interconnect@1780000 {
10e02467129518 Neil Armstrong        2023-11-30  3556  			compatible = "qcom,sm8650-mmss-noc";
10e02467129518 Neil Armstrong        2023-11-30  3557  			reg = <0 0x01780000 0 0x5b800>;
10e02467129518 Neil Armstrong        2023-11-30  3558  
10e02467129518 Neil Armstrong        2023-11-30  3559  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3560  
10e02467129518 Neil Armstrong        2023-11-30  3561  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3562  		};
10e02467129518 Neil Armstrong        2023-11-30  3563  
10e02467129518 Neil Armstrong        2023-11-30  3564  		rng: rng@10c3000 {
10e02467129518 Neil Armstrong        2023-11-30  3565  			compatible = "qcom,sm8650-trng", "qcom,trng";
10e02467129518 Neil Armstrong        2023-11-30  3566  			reg = <0 0x010c3000 0 0x1000>;
10e02467129518 Neil Armstrong        2023-11-30  3567  		};
10e02467129518 Neil Armstrong        2023-11-30  3568  
2f2120a1525109 Manivannan Sadhasivam 2024-03-21  3569  		pcie0: pcie@1c00000 {
10e02467129518 Neil Armstrong        2023-11-30  3570  			device_type = "pci";
10e02467129518 Neil Armstrong        2023-11-30  3571  			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
10e02467129518 Neil Armstrong        2023-11-30  3572  			reg = <0 0x01c00000 0 0x3000>,
10e02467129518 Neil Armstrong        2023-11-30  3573  			      <0 0x60000000 0 0xf1d>,
10e02467129518 Neil Armstrong        2023-11-30  3574  			      <0 0x60000f20 0 0xa8>,
10e02467129518 Neil Armstrong        2023-11-30  3575  			      <0 0x60001000 0 0x1000>,
10e02467129518 Neil Armstrong        2023-11-30  3576  			      <0 0x60100000 0 0x100000>;
10e02467129518 Neil Armstrong        2023-11-30  3577  			reg-names = "parf", "dbi", "elbi", "atu", "config";
10e02467129518 Neil Armstrong        2023-11-30  3578  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3579  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3580  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3581  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3582  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3583  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3584  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3585  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3586  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3587  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH 0>;
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3588  			interrupt-names = "msi0",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3589  					  "msi1",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3590  					  "msi2",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3591  					  "msi3",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3592  					  "msi4",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3593  					  "msi5",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3594  					  "msi6",
9eb81b31ab62cf Neil Armstrong        2024-11-26  3595  					  "msi7",
9eb81b31ab62cf Neil Armstrong        2024-11-26  3596  					  "global";
10e02467129518 Neil Armstrong        2023-11-30  3597  
10e02467129518 Neil Armstrong        2023-11-30  3598  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3599  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3600  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3601  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3602  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3603  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3604  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3605  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3606  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  3607  				      "cfg",
10e02467129518 Neil Armstrong        2023-11-30  3608  				      "bus_master",
10e02467129518 Neil Armstrong        2023-11-30  3609  				      "bus_slave",
10e02467129518 Neil Armstrong        2023-11-30  3610  				      "slave_q2a",
10e02467129518 Neil Armstrong        2023-11-30  3611  				      "ddrss_sf_tbu",
10e02467129518 Neil Armstrong        2023-11-30  3612  				      "noc_aggr",
10e02467129518 Neil Armstrong        2023-11-30  3613  				      "cnoc_sf_axi";
10e02467129518 Neil Armstrong        2023-11-30  3614  
10e02467129518 Neil Armstrong        2023-11-30  3615  			resets = <&gcc GCC_PCIE_0_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  3616  			reset-names = "pci";
10e02467129518 Neil Armstrong        2023-11-30  3617  
10e02467129518 Neil Armstrong        2023-11-30  3618  			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3619  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3620  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3621  					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  3622  			interconnect-names = "pcie-mem",
10e02467129518 Neil Armstrong        2023-11-30  3623  					     "cpu-pcie";
10e02467129518 Neil Armstrong        2023-11-30  3624  
10e02467129518 Neil Armstrong        2023-11-30  3625  			power-domains = <&gcc PCIE_0_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  3626  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3627  			operating-points-v2 = <&pcie0_opp_table>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3628  
10e02467129518 Neil Armstrong        2023-11-30  3629  			iommu-map = <0     &apps_smmu 0x1400 0x1>,
10e02467129518 Neil Armstrong        2023-11-30  3630  				    <0x100 &apps_smmu 0x1401 0x1>;
10e02467129518 Neil Armstrong        2023-11-30  3631  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3632  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3633  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3634  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3635  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3636  			interrupt-map-mask = <0 0 0 0x7>;
10e02467129518 Neil Armstrong        2023-11-30  3637  			#interrupt-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3638  
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  3639  			msi-map = <0x0 &gic_its 0x1400 0x1>,
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  3640  				  <0x100 &gic_its 0x1401 0x1>;
dfc554d5217163 Manivannan Sadhasivam 2024-02-16  3641  			msi-map-mask = <0xff00>;
a33a532b3b1ecd Neil Armstrong        2024-01-25  3642  
10e02467129518 Neil Armstrong        2023-11-30  3643  			linux,pci-domain = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3644  			num-lanes = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3645  			bus-range = <0 0xff>;
10e02467129518 Neil Armstrong        2023-11-30  3646  
10e02467129518 Neil Armstrong        2023-11-30  3647  			phys = <&pcie0_phy>;
10e02467129518 Neil Armstrong        2023-11-30  3648  			phy-names = "pciephy";
10e02467129518 Neil Armstrong        2023-11-30  3649  
10e02467129518 Neil Armstrong        2023-11-30  3650  			#address-cells = <3>;
10e02467129518 Neil Armstrong        2023-11-30  3651  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3652  			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
10e02467129518 Neil Armstrong        2023-11-30  3653  				 <0x02000000 0 0x60300000 0 0x60300000 0 0x3d00000>;
10e02467129518 Neil Armstrong        2023-11-30  3654  
10e02467129518 Neil Armstrong        2023-11-30  3655  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  3656  
10e02467129518 Neil Armstrong        2023-11-30  3657  			status = "disabled";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3658  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3659  			pcie0_opp_table: opp-table {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3660  				compatible = "operating-points-v2";
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3661  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3662  				/* GEN 1 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3663  				opp-2500000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3664  					opp-hz = /bits/ 64 <2500000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3665  					required-opps = <&rpmhpd_opp_low_svs>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3666  					opp-peak-kBps = <250000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3667  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3668  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3669  				/* GEN 1 x2 and GEN 2 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3670  				opp-5000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3671  					opp-hz = /bits/ 64 <5000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3672  					required-opps = <&rpmhpd_opp_low_svs>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3673  					opp-peak-kBps = <500000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3674  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3675  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3676  				/* GEN 2 x2 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3677  				opp-10000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3678  					opp-hz = /bits/ 64 <10000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3679  					required-opps = <&rpmhpd_opp_low_svs>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3680  					opp-peak-kBps = <1000000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3681  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3682  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3683  				/* GEN 3 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3684  				opp-8000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3685  					opp-hz = /bits/ 64 <8000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3686  					required-opps = <&rpmhpd_opp_nom>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3687  					opp-peak-kBps = <984500 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3688  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3689  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3690  				/* GEN 3 x2 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3691  				opp-16000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3692  					opp-hz = /bits/ 64 <16000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3693  					required-opps = <&rpmhpd_opp_nom>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3694  					opp-peak-kBps = <1969000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3695  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3696  			};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3697  
a05737bf763166 Bartosz Golaszewski   2024-06-05  3698  			pcieport0: pcie@0 {
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3699  				device_type = "pci";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3700  				reg = <0x0 0x0 0x0 0x0 0x0>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3701  				bus-range = <0x01 0xff>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3702  
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3703  				#address-cells = <3>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3704  				#size-cells = <2>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3705  				ranges;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3706  			};
10e02467129518 Neil Armstrong        2023-11-30  3707  		};
10e02467129518 Neil Armstrong        2023-11-30  3708  
10e02467129518 Neil Armstrong        2023-11-30  3709  		pcie0_phy: phy@1c06000 {
10e02467129518 Neil Armstrong        2023-11-30  3710  			compatible = "qcom,sm8650-qmp-gen3x2-pcie-phy";
10e02467129518 Neil Armstrong        2023-11-30  3711  			reg = <0 0x01c06000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  3712  
10e02467129518 Neil Armstrong        2023-11-30  3713  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3714  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3715  				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
10e02467129518 Neil Armstrong        2023-11-30  3716  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3717  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3718  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  3719  				      "cfg_ahb",
10e02467129518 Neil Armstrong        2023-11-30  3720  				      "ref",
10e02467129518 Neil Armstrong        2023-11-30  3721  				      "rchng",
10e02467129518 Neil Armstrong        2023-11-30  3722  				      "pipe";
10e02467129518 Neil Armstrong        2023-11-30  3723  
10e02467129518 Neil Armstrong        2023-11-30  3724  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3725  			assigned-clock-rates = <100000000>;
10e02467129518 Neil Armstrong        2023-11-30  3726  
10e02467129518 Neil Armstrong        2023-11-30  3727  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  3728  			reset-names = "phy";
10e02467129518 Neil Armstrong        2023-11-30  3729  
10e02467129518 Neil Armstrong        2023-11-30  3730  			power-domains = <&gcc PCIE_0_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  3731  
10e02467129518 Neil Armstrong        2023-11-30  3732  			#clock-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3733  			clock-output-names = "pcie0_pipe_clk";
10e02467129518 Neil Armstrong        2023-11-30  3734  
10e02467129518 Neil Armstrong        2023-11-30  3735  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3736  
10e02467129518 Neil Armstrong        2023-11-30  3737  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3738  		};
10e02467129518 Neil Armstrong        2023-11-30  3739  
2f2120a1525109 Manivannan Sadhasivam 2024-03-21  3740  		pcie1: pcie@1c08000 {
10e02467129518 Neil Armstrong        2023-11-30  3741  			device_type = "pci";
10e02467129518 Neil Armstrong        2023-11-30  3742  			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
10e02467129518 Neil Armstrong        2023-11-30  3743  			reg = <0 0x01c08000 0 0x3000>,
10e02467129518 Neil Armstrong        2023-11-30  3744  			      <0 0x40000000 0 0xf1d>,
10e02467129518 Neil Armstrong        2023-11-30  3745  			      <0 0x40000f20 0 0xa8>,
10e02467129518 Neil Armstrong        2023-11-30  3746  			      <0 0x40001000 0 0x1000>,
10e02467129518 Neil Armstrong        2023-11-30  3747  			      <0 0x40100000 0 0x100000>;
10e02467129518 Neil Armstrong        2023-11-30  3748  			reg-names = "parf",
10e02467129518 Neil Armstrong        2023-11-30  3749  				    "dbi",
10e02467129518 Neil Armstrong        2023-11-30  3750  				    "elbi",
10e02467129518 Neil Armstrong        2023-11-30  3751  				    "atu",
10e02467129518 Neil Armstrong        2023-11-30  3752  				    "config";
10e02467129518 Neil Armstrong        2023-11-30  3753  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3754  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3755  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3756  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3757  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3758  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3759  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3760  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3761  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3762  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3763  			interrupt-names = "msi0",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3764  					  "msi1",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3765  					  "msi2",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3766  					  "msi3",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3767  					  "msi4",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3768  					  "msi5",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  3769  					  "msi6",
9eb81b31ab62cf Neil Armstrong        2024-11-26  3770  					  "msi7",
9eb81b31ab62cf Neil Armstrong        2024-11-26  3771  					  "global";
10e02467129518 Neil Armstrong        2023-11-30  3772  
10e02467129518 Neil Armstrong        2023-11-30  3773  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3774  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3775  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3776  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3777  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3778  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3779  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3780  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3781  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  3782  				      "cfg",
10e02467129518 Neil Armstrong        2023-11-30  3783  				      "bus_master",
10e02467129518 Neil Armstrong        2023-11-30  3784  				      "bus_slave",
10e02467129518 Neil Armstrong        2023-11-30  3785  				      "slave_q2a",
10e02467129518 Neil Armstrong        2023-11-30  3786  				      "ddrss_sf_tbu",
10e02467129518 Neil Armstrong        2023-11-30  3787  				      "noc_aggr",
10e02467129518 Neil Armstrong        2023-11-30  3788  				      "cnoc_sf_axi";
10e02467129518 Neil Armstrong        2023-11-30  3789  
10e02467129518 Neil Armstrong        2023-11-30  3790  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3791  			assigned-clock-rates = <19200000>;
10e02467129518 Neil Armstrong        2023-11-30  3792  
10e02467129518 Neil Armstrong        2023-11-30  3793  			resets = <&gcc GCC_PCIE_1_BCR>,
10e02467129518 Neil Armstrong        2023-11-30  3794  				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  3795  			reset-names = "pci",
10e02467129518 Neil Armstrong        2023-11-30  3796  				      "link_down";
10e02467129518 Neil Armstrong        2023-11-30  3797  
10e02467129518 Neil Armstrong        2023-11-30  3798  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3799  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  3800  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  3801  					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  3802  			interconnect-names = "pcie-mem",
10e02467129518 Neil Armstrong        2023-11-30  3803  					     "cpu-pcie";
10e02467129518 Neil Armstrong        2023-11-30  3804  
10e02467129518 Neil Armstrong        2023-11-30  3805  			power-domains = <&gcc PCIE_1_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  3806  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3807  			operating-points-v2 = <&pcie1_opp_table>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3808  
10e02467129518 Neil Armstrong        2023-11-30  3809  			iommu-map = <0     &apps_smmu 0x1480 0x1>,
10e02467129518 Neil Armstrong        2023-11-30  3810  				    <0x100 &apps_smmu 0x1481 0x1>;
10e02467129518 Neil Armstrong        2023-11-30  3811  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3812  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3813  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3814  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3815  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3816  			interrupt-map-mask = <0 0 0 0x7>;
10e02467129518 Neil Armstrong        2023-11-30  3817  			#interrupt-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3818  
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  3819  			msi-map = <0x0 &gic_its 0x1480 0x1>,
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  3820  				  <0x100 &gic_its 0x1481 0x1>;
dfc554d5217163 Manivannan Sadhasivam 2024-02-16  3821  			msi-map-mask = <0xff00>;
a33a532b3b1ecd Neil Armstrong        2024-01-25  3822  
10e02467129518 Neil Armstrong        2023-11-30  3823  			linux,pci-domain = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3824  			num-lanes = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3825  			bus-range = <0 0xff>;
10e02467129518 Neil Armstrong        2023-11-30  3826  
10e02467129518 Neil Armstrong        2023-11-30  3827  			phys = <&pcie1_phy>;
10e02467129518 Neil Armstrong        2023-11-30  3828  			phy-names = "pciephy";
10e02467129518 Neil Armstrong        2023-11-30  3829  
10e02467129518 Neil Armstrong        2023-11-30  3830  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  3831  
10e02467129518 Neil Armstrong        2023-11-30  3832  			#address-cells = <3>;
10e02467129518 Neil Armstrong        2023-11-30  3833  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3834  			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
10e02467129518 Neil Armstrong        2023-11-30  3835  				 <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
10e02467129518 Neil Armstrong        2023-11-30  3836  
10e02467129518 Neil Armstrong        2023-11-30  3837  			status = "disabled";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3838  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3839  			pcie1_opp_table: opp-table {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3840  				compatible = "operating-points-v2";
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3841  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3842  				/* GEN 1 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3843  				opp-2500000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3844  					opp-hz = /bits/ 64 <2500000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3845  					required-opps = <&rpmhpd_opp_low_svs>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3846  					opp-peak-kBps = <250000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3847  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3848  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3849  				/* GEN 1 x2 and GEN 2 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3850  				opp-5000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3851  					opp-hz = /bits/ 64 <5000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3852  					required-opps = <&rpmhpd_opp_low_svs>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3853  					opp-peak-kBps = <500000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3854  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3855  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3856  				/* GEN 2 x2 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3857  				opp-10000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3858  					opp-hz = /bits/ 64 <10000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3859  					required-opps = <&rpmhpd_opp_low_svs>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3860  					opp-peak-kBps = <1000000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3861  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3862  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3863  				/* GEN 3 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3864  				opp-8000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3865  					opp-hz = /bits/ 64 <8000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3866  					required-opps = <&rpmhpd_opp_nom>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3867  					opp-peak-kBps = <984500 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3868  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3869  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3870  				/* GEN 3 x2 and GEN 4 x1 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3871  				opp-16000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3872  					opp-hz = /bits/ 64 <16000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3873  					required-opps = <&rpmhpd_opp_nom>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3874  					opp-peak-kBps = <1969000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3875  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3876  
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3877  				/* GEN 4 x2 */
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3878  				opp-32000000 {
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3879  					opp-hz = /bits/ 64 <32000000>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3880  					required-opps = <&rpmhpd_opp_nom>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3881  					opp-peak-kBps = <3938000 1>;
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3882  				};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3883  			};
5cddecc3d1dce1 Neil Armstrong        2025-01-15  3884  
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3885  			pcie@0 {
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3886  				device_type = "pci";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3887  				reg = <0x0 0x0 0x0 0x0 0x0>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3888  				bus-range = <0x01 0xff>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3889  
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3890  				#address-cells = <3>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3891  				#size-cells = <2>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3892  				ranges;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  3893  			};
10e02467129518 Neil Armstrong        2023-11-30  3894  		};
10e02467129518 Neil Armstrong        2023-11-30  3895  
10e02467129518 Neil Armstrong        2023-11-30  3896  		pcie1_phy: phy@1c0e000 {
10e02467129518 Neil Armstrong        2023-11-30  3897  			compatible = "qcom,sm8650-qmp-gen4x2-pcie-phy";
10e02467129518 Neil Armstrong        2023-11-30  3898  			reg = <0 0x01c0e000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  3899  
10e02467129518 Neil Armstrong        2023-11-30  3900  			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3901  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3902  				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
10e02467129518 Neil Armstrong        2023-11-30  3903  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3904  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3905  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  3906  				      "cfg_ahb",
10e02467129518 Neil Armstrong        2023-11-30  3907  				      "ref",
10e02467129518 Neil Armstrong        2023-11-30  3908  				      "rchng",
10e02467129518 Neil Armstrong        2023-11-30  3909  				      "pipe";
10e02467129518 Neil Armstrong        2023-11-30  3910  
10e02467129518 Neil Armstrong        2023-11-30  3911  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3912  			assigned-clock-rates = <100000000>;
10e02467129518 Neil Armstrong        2023-11-30  3913  
10e02467129518 Neil Armstrong        2023-11-30  3914  			resets = <&gcc GCC_PCIE_1_PHY_BCR>,
10e02467129518 Neil Armstrong        2023-11-30  3915  				 <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  3916  			reset-names = "phy",
10e02467129518 Neil Armstrong        2023-11-30  3917  				      "phy_nocsr";
10e02467129518 Neil Armstrong        2023-11-30  3918  
10e02467129518 Neil Armstrong        2023-11-30  3919  			power-domains = <&gcc PCIE_1_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  3920  
d00b42f170dfa4 Neil Armstrong        2024-05-02  3921  			#clock-cells = <1>;
dc323623c3b87c Dmitry Baryshkov      2024-06-14  3922  			clock-output-names = "pcie1_pipe_clk";
10e02467129518 Neil Armstrong        2023-11-30  3923  
10e02467129518 Neil Armstrong        2023-11-30  3924  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3925  
10e02467129518 Neil Armstrong        2023-11-30  3926  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3927  		};
10e02467129518 Neil Armstrong        2023-11-30  3928  
10e02467129518 Neil Armstrong        2023-11-30  3929  		cryptobam: dma-controller@1dc4000 {
10e02467129518 Neil Armstrong        2023-11-30  3930  			compatible = "qcom,bam-v1.7.0";
10e02467129518 Neil Armstrong        2023-11-30  3931  			reg = <0 0x01dc4000 0 0x28000>;
10e02467129518 Neil Armstrong        2023-11-30  3932  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3933  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3934  
10e02467129518 Neil Armstrong        2023-11-30  3935  			#dma-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3936  
10e02467129518 Neil Armstrong        2023-11-30  3937  			iommus = <&apps_smmu 0x480 0>,
10e02467129518 Neil Armstrong        2023-11-30  3938  				 <&apps_smmu 0x481 0>;
10e02467129518 Neil Armstrong        2023-11-30  3939  
10e02467129518 Neil Armstrong        2023-11-30  3940  			qcom,ee = <0>;
38b88722bce07b Stephan Gerhold       2025-02-12  3941  			qcom,num-ees = <4>;
38b88722bce07b Stephan Gerhold       2025-02-12  3942  			num-channels = <20>;
10e02467129518 Neil Armstrong        2023-11-30  3943  			qcom,controlled-remotely;
10e02467129518 Neil Armstrong        2023-11-30  3944  		};
10e02467129518 Neil Armstrong        2023-11-30  3945  
10e02467129518 Neil Armstrong        2023-11-30  3946  		crypto: crypto@1dfa000 {
10e02467129518 Neil Armstrong        2023-11-30  3947  			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
10e02467129518 Neil Armstrong        2023-11-30  3948  			reg = <0 0x01dfa000 0 0x6000>;
10e02467129518 Neil Armstrong        2023-11-30  3949  
10e02467129518 Neil Armstrong        2023-11-30  3950  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3951  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3952  			interconnect-names = "memory";
10e02467129518 Neil Armstrong        2023-11-30  3953  
10e02467129518 Neil Armstrong        2023-11-30  3954  			dmas = <&cryptobam 4>, <&cryptobam 5>;
10e02467129518 Neil Armstrong        2023-11-30  3955  			dma-names = "rx", "tx";
10e02467129518 Neil Armstrong        2023-11-30  3956  
10e02467129518 Neil Armstrong        2023-11-30  3957  			iommus = <&apps_smmu 0x480 0>,
10e02467129518 Neil Armstrong        2023-11-30  3958  				 <&apps_smmu 0x481 0>;
10e02467129518 Neil Armstrong        2023-11-30  3959  		};
10e02467129518 Neil Armstrong        2023-11-30  3960  
10e02467129518 Neil Armstrong        2023-11-30  3961  		ufs_mem_phy: phy@1d80000 {
10e02467129518 Neil Armstrong        2023-11-30  3962  			compatible = "qcom,sm8650-qmp-ufs-phy";
10e02467129518 Neil Armstrong        2023-11-30  3963  			reg = <0 0x01d80000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  3964  
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  3965  			clocks = <&rpmhcc RPMH_CXO_CLK>,
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  3966  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  3967  				 <&tcsr TCSR_UFS_CLKREF_EN>;
10e02467129518 Neil Armstrong        2023-11-30  3968  			clock-names = "ref",
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  3969  				      "ref_aux",
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  3970  				      "qref";
10e02467129518 Neil Armstrong        2023-11-30  3971  
10e02467129518 Neil Armstrong        2023-11-30  3972  			resets = <&ufs_mem_hc 0>;
10e02467129518 Neil Armstrong        2023-11-30  3973  			reset-names = "ufsphy";
10e02467129518 Neil Armstrong        2023-11-30  3974  
10e02467129518 Neil Armstrong        2023-11-30  3975  			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  3976  
10e02467129518 Neil Armstrong        2023-11-30  3977  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3978  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3979  
10e02467129518 Neil Armstrong        2023-11-30  3980  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3981  		};
10e02467129518 Neil Armstrong        2023-11-30  3982  
15288649e4c037 Manivannan Sadhasivam 2024-05-14  3983  		ufs_mem_hc: ufshc@1d84000 {
10e02467129518 Neil Armstrong        2023-11-30  3984  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
10e02467129518 Neil Armstrong        2023-11-30  3985  			reg = <0 0x01d84000 0 0x3000>;
10e02467129518 Neil Armstrong        2023-11-30  3986  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  3987  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  3988  
10e02467129518 Neil Armstrong        2023-11-30  3989  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3990  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3991  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3992  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3993  				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
10e02467129518 Neil Armstrong        2023-11-30  3994  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3995  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3996  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3997  			clock-names = "core_clk",
10e02467129518 Neil Armstrong        2023-11-30  3998  				      "bus_aggr_clk",
10e02467129518 Neil Armstrong        2023-11-30  3999  				      "iface_clk",
10e02467129518 Neil Armstrong        2023-11-30  4000  				      "core_clk_unipro",
10e02467129518 Neil Armstrong        2023-11-30  4001  				      "ref_clk",
10e02467129518 Neil Armstrong        2023-11-30  4002  				      "tx_lane0_sync_clk",
10e02467129518 Neil Armstrong        2023-11-30  4003  				      "rx_lane0_sync_clk",
10e02467129518 Neil Armstrong        2023-11-30  4004  				      "rx_lane1_sync_clk";
10e02467129518 Neil Armstrong        2023-11-30  4005  
10e02467129518 Neil Armstrong        2023-11-30  4006  			resets = <&gcc GCC_UFS_PHY_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  4007  			reset-names = "rst";
10e02467129518 Neil Armstrong        2023-11-30  4008  
10e02467129518 Neil Armstrong        2023-11-30  4009  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  4010  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  4011  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  4012  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  4013  			interconnect-names = "ufs-ddr",
10e02467129518 Neil Armstrong        2023-11-30  4014  					     "cpu-ufs";
10e02467129518 Neil Armstrong        2023-11-30  4015  
10e02467129518 Neil Armstrong        2023-11-30  4016  			power-domains = <&gcc UFS_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  4017  			required-opps = <&rpmhpd_opp_nom>;
10e02467129518 Neil Armstrong        2023-11-30  4018  
61dcbf45110bb3 Neil Armstrong        2025-01-15  4019  			operating-points-v2 = <&ufs_opp_table>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4020  
10e02467129518 Neil Armstrong        2023-11-30  4021  			iommus = <&apps_smmu 0x60 0>;
10e02467129518 Neil Armstrong        2023-11-30  4022  
10e02467129518 Neil Armstrong        2023-11-30  4023  			lanes-per-direction = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4024  			qcom,ice = <&ice>;
10e02467129518 Neil Armstrong        2023-11-30  4025  
10e02467129518 Neil Armstrong        2023-11-30  4026  			phys = <&ufs_mem_phy>;
10e02467129518 Neil Armstrong        2023-11-30  4027  			phy-names = "ufsphy";
10e02467129518 Neil Armstrong        2023-11-30  4028  
10e02467129518 Neil Armstrong        2023-11-30  4029  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4030  
10e02467129518 Neil Armstrong        2023-11-30  4031  			status = "disabled";
61dcbf45110bb3 Neil Armstrong        2025-01-15  4032  
61dcbf45110bb3 Neil Armstrong        2025-01-15  4033  			ufs_opp_table: opp-table {
61dcbf45110bb3 Neil Armstrong        2025-01-15  4034  				compatible = "operating-points-v2";
61dcbf45110bb3 Neil Armstrong        2025-01-15  4035  
61dcbf45110bb3 Neil Armstrong        2025-01-15  4036  				opp-100000000 {
61dcbf45110bb3 Neil Armstrong        2025-01-15  4037  					opp-hz = /bits/ 64 <100000000>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4038  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4039  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4040  						 /bits/ 64 <100000000>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4041  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4042  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4043  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4044  						 /bits/ 64 <0>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4045  					required-opps = <&rpmhpd_opp_low_svs>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4046  				};
61dcbf45110bb3 Neil Armstrong        2025-01-15  4047  
61dcbf45110bb3 Neil Armstrong        2025-01-15  4048  				opp-201500000 {
61dcbf45110bb3 Neil Armstrong        2025-01-15  4049  					opp-hz = /bits/ 64 <201500000>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4050  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4051  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4052  						 /bits/ 64 <201500000>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4053  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4054  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4055  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4056  						 /bits/ 64 <0>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4057  					required-opps = <&rpmhpd_opp_svs>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4058  				};
61dcbf45110bb3 Neil Armstrong        2025-01-15  4059  
61dcbf45110bb3 Neil Armstrong        2025-01-15  4060  				opp-403000000 {
61dcbf45110bb3 Neil Armstrong        2025-01-15  4061  					opp-hz = /bits/ 64 <403000000>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4062  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4063  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4064  						 /bits/ 64 <403000000>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4065  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4066  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4067  						 /bits/ 64 <0>,
61dcbf45110bb3 Neil Armstrong        2025-01-15  4068  						 /bits/ 64 <0>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4069  					required-opps = <&rpmhpd_opp_nom>;
61dcbf45110bb3 Neil Armstrong        2025-01-15  4070  				};
61dcbf45110bb3 Neil Armstrong        2025-01-15  4071  			};
10e02467129518 Neil Armstrong        2023-11-30  4072  		};
10e02467129518 Neil Armstrong        2023-11-30  4073  
10e02467129518 Neil Armstrong        2023-11-30  4074  		ice: crypto@1d88000 {
10e02467129518 Neil Armstrong        2023-11-30  4075  			compatible = "qcom,sm8650-inline-crypto-engine",
10e02467129518 Neil Armstrong        2023-11-30  4076  				     "qcom,inline-crypto-engine";
88dfd0b5a199c6 Bartosz Golaszewski   2024-10-07  4077  			reg = <0 0x01d88000 0 0x18000>;
10e02467129518 Neil Armstrong        2023-11-30  4078  
10e02467129518 Neil Armstrong        2023-11-30  4079  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  4080  		};
10e02467129518 Neil Armstrong        2023-11-30  4081  
10e02467129518 Neil Armstrong        2023-11-30  4082  		tcsr_mutex: hwlock@1f40000 {
10e02467129518 Neil Armstrong        2023-11-30  4083  			compatible = "qcom,tcsr-mutex";
10e02467129518 Neil Armstrong        2023-11-30  4084  			reg = <0 0x01f40000 0 0x20000>;
10e02467129518 Neil Armstrong        2023-11-30  4085  
10e02467129518 Neil Armstrong        2023-11-30  4086  			#hwlock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4087  		};
10e02467129518 Neil Armstrong        2023-11-30  4088  
10e02467129518 Neil Armstrong        2023-11-30  4089  		tcsr: clock-controller@1fc0000 {
10e02467129518 Neil Armstrong        2023-11-30  4090  			compatible = "qcom,sm8650-tcsr", "syscon";
10e02467129518 Neil Armstrong        2023-11-30  4091  			reg = <0 0x01fc0000 0 0xa0000>;
10e02467129518 Neil Armstrong        2023-11-30  4092  
10e02467129518 Neil Armstrong        2023-11-30  4093  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  4094  
10e02467129518 Neil Armstrong        2023-11-30  4095  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4096  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4097  		};
10e02467129518 Neil Armstrong        2023-11-30  4098  
db33633b05c0b5 Neil Armstrong        2024-03-18  4099  		gpu: gpu@3d00000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4100  			compatible = "qcom,adreno-43051401", "qcom,adreno";
db33633b05c0b5 Neil Armstrong        2024-03-18  4101  			reg = <0x0 0x03d00000 0x0 0x40000>,
0d80ac75cba26f Connor Abbott         2024-04-26  4102  			      <0x0 0x03d9e000 0x0 0x2000>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4103  			      <0x0 0x03d61000 0x0 0x800>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4104  			reg-names = "kgsl_3d0_reg_memory",
db33633b05c0b5 Neil Armstrong        2024-03-18  4105  				    "cx_mem",
db33633b05c0b5 Neil Armstrong        2024-03-18  4106  				    "cx_dbgc";
db33633b05c0b5 Neil Armstrong        2024-03-18  4107  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4108  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4109  
db33633b05c0b5 Neil Armstrong        2024-03-18  4110  			iommus = <&adreno_smmu 0 0x0>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4111  				 <&adreno_smmu 1 0x0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4112  
db33633b05c0b5 Neil Armstrong        2024-03-18  4113  			operating-points-v2 = <&gpu_opp_table>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4114  
db33633b05c0b5 Neil Armstrong        2024-03-18  4115  			qcom,gmu = <&gmu>;
497624ed550604 Konrad Dybcio         2024-05-10  4116  			#cooling-cells = <2>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4117  
63c21d61b46197 Neil Armstrong        2024-12-17  4118  			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
63c21d61b46197 Neil Armstrong        2024-12-17  4119  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
63c21d61b46197 Neil Armstrong        2024-12-17  4120  			interconnect-names = "gfx-mem";
63c21d61b46197 Neil Armstrong        2024-12-17  4121  
db33633b05c0b5 Neil Armstrong        2024-03-18  4122  			status = "disabled";
db33633b05c0b5 Neil Armstrong        2024-03-18  4123  
db33633b05c0b5 Neil Armstrong        2024-03-18  4124  			zap-shader {
db33633b05c0b5 Neil Armstrong        2024-03-18  4125  				memory-region = <&gpu_micro_code_mem>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4126  			};
db33633b05c0b5 Neil Armstrong        2024-03-18  4127  
db33633b05c0b5 Neil Armstrong        2024-03-18  4128  			/* Speedbin needs more work on A740+, keep only lower freqs */
db33633b05c0b5 Neil Armstrong        2024-03-18  4129  			gpu_opp_table: opp-table {
db33633b05c0b5 Neil Armstrong        2024-03-18  4130  				compatible = "operating-points-v2";
db33633b05c0b5 Neil Armstrong        2024-03-18  4131  
db33633b05c0b5 Neil Armstrong        2024-03-18  4132  				opp-231000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4133  					opp-hz = /bits/ 64 <231000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4134  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
63c21d61b46197 Neil Armstrong        2024-12-17  4135  					opp-peak-kBps = <2136718>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4136  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4137  
db33633b05c0b5 Neil Armstrong        2024-03-18  4138  				opp-310000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4139  					opp-hz = /bits/ 64 <310000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4140  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
63c21d61b46197 Neil Armstrong        2024-12-17  4141  					opp-peak-kBps = <2136718>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4142  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4143  
db33633b05c0b5 Neil Armstrong        2024-03-18  4144  				opp-366000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4145  					opp-hz = /bits/ 64 <366000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4146  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
63c21d61b46197 Neil Armstrong        2024-12-17  4147  					opp-peak-kBps = <6074218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4148  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4149  
db33633b05c0b5 Neil Armstrong        2024-03-18  4150  				opp-422000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4151  					opp-hz = /bits/ 64 <422000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4152  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
63c21d61b46197 Neil Armstrong        2024-12-17  4153  					opp-peak-kBps = <8171875>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4154  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4155  
db33633b05c0b5 Neil Armstrong        2024-03-18  4156  				opp-500000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4157  					opp-hz = /bits/ 64 <500000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4158  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
63c21d61b46197 Neil Armstrong        2024-12-17  4159  					opp-peak-kBps = <8171875>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4160  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4161  
db33633b05c0b5 Neil Armstrong        2024-03-18  4162  				opp-578000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4163  					opp-hz = /bits/ 64 <578000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4164  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
63c21d61b46197 Neil Armstrong        2024-12-17  4165  					opp-peak-kBps = <8171875>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4166  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4167  
db33633b05c0b5 Neil Armstrong        2024-03-18  4168  				opp-629000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4169  					opp-hz = /bits/ 64 <629000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4170  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
63c21d61b46197 Neil Armstrong        2024-12-17  4171  					opp-peak-kBps = <10687500>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4172  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4173  
db33633b05c0b5 Neil Armstrong        2024-03-18  4174  				opp-680000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4175  					opp-hz = /bits/ 64 <680000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4176  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
63c21d61b46197 Neil Armstrong        2024-12-17  4177  					opp-peak-kBps = <12449218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4178  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4179  
db33633b05c0b5 Neil Armstrong        2024-03-18  4180  				opp-720000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4181  					opp-hz = /bits/ 64 <720000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4182  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
63c21d61b46197 Neil Armstrong        2024-12-17  4183  					opp-peak-kBps = <12449218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4184  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4185  
db33633b05c0b5 Neil Armstrong        2024-03-18  4186  				opp-770000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4187  					opp-hz = /bits/ 64 <770000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4188  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
63c21d61b46197 Neil Armstrong        2024-12-17  4189  					opp-peak-kBps = <12449218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4190  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4191  
db33633b05c0b5 Neil Armstrong        2024-03-18  4192  				opp-834000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4193  					opp-hz = /bits/ 64 <834000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4194  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
63c21d61b46197 Neil Armstrong        2024-12-17  4195  					opp-peak-kBps = <14398437>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4196  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4197  			};
db33633b05c0b5 Neil Armstrong        2024-03-18  4198  		};
db33633b05c0b5 Neil Armstrong        2024-03-18  4199  
db33633b05c0b5 Neil Armstrong        2024-03-18  4200  		gmu: gmu@3d6a000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4201  			compatible = "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";
db33633b05c0b5 Neil Armstrong        2024-03-18  4202  			reg = <0x0 0x03d6a000 0x0 0x35000>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4203  			      <0x0 0x03d50000 0x0 0x10000>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4204  			      <0x0 0x0b280000 0x0 0x10000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4205  			reg-names = "gmu", "rscc", "gmu_pdc";
db33633b05c0b5 Neil Armstrong        2024-03-18  4206  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4207  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4208  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4209  			interrupt-names = "hfi", "gmu";
db33633b05c0b5 Neil Armstrong        2024-03-18  4210  
db33633b05c0b5 Neil Armstrong        2024-03-18  4211  			clocks = <&gpucc GPU_CC_AHB_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4212  				 <&gpucc GPU_CC_CX_GMU_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4213  				 <&gpucc GPU_CC_CXO_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4214  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4215  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4216  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4217  				 <&gpucc GPU_CC_DEMET_CLK>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4218  			clock-names = "ahb",
db33633b05c0b5 Neil Armstrong        2024-03-18  4219  				      "gmu",
db33633b05c0b5 Neil Armstrong        2024-03-18  4220  				      "cxo",
db33633b05c0b5 Neil Armstrong        2024-03-18  4221  				      "axi",
db33633b05c0b5 Neil Armstrong        2024-03-18  4222  				      "memnoc",
db33633b05c0b5 Neil Armstrong        2024-03-18  4223  				      "hub",
db33633b05c0b5 Neil Armstrong        2024-03-18  4224  				      "demet";
db33633b05c0b5 Neil Armstrong        2024-03-18  4225  
db33633b05c0b5 Neil Armstrong        2024-03-18  4226  			power-domains = <&gpucc GPU_CX_GDSC>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4227  					<&gpucc GPU_GX_GDSC>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4228  			power-domain-names = "cx",
db33633b05c0b5 Neil Armstrong        2024-03-18  4229  					     "gx";
db33633b05c0b5 Neil Armstrong        2024-03-18  4230  
db33633b05c0b5 Neil Armstrong        2024-03-18  4231  			iommus = <&adreno_smmu 5 0x0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4232  
db33633b05c0b5 Neil Armstrong        2024-03-18  4233  			qcom,qmp = <&aoss_qmp>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4234  
db33633b05c0b5 Neil Armstrong        2024-03-18  4235  			operating-points-v2 = <&gmu_opp_table>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4236  
db33633b05c0b5 Neil Armstrong        2024-03-18  4237  			gmu_opp_table: opp-table {
db33633b05c0b5 Neil Armstrong        2024-03-18  4238  				compatible = "operating-points-v2";
db33633b05c0b5 Neil Armstrong        2024-03-18  4239  
db33633b05c0b5 Neil Armstrong        2024-03-18  4240  				opp-260000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4241  					opp-hz = /bits/ 64 <260000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4242  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4243  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4244  
db33633b05c0b5 Neil Armstrong        2024-03-18  4245  				opp-625000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4246  					opp-hz = /bits/ 64 <625000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4247  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4248  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  4249  			};
db33633b05c0b5 Neil Armstrong        2024-03-18  4250  		};
db33633b05c0b5 Neil Armstrong        2024-03-18  4251  
10e02467129518 Neil Armstrong        2023-11-30  4252  		gpucc: clock-controller@3d90000 {
10e02467129518 Neil Armstrong        2023-11-30  4253  			compatible = "qcom,sm8650-gpucc";
10e02467129518 Neil Armstrong        2023-11-30  4254  			reg = <0 0x03d90000 0 0xa000>;
10e02467129518 Neil Armstrong        2023-11-30  4255  
10e02467129518 Neil Armstrong        2023-11-30  4256  			clocks = <&bi_tcxo_div2>,
10e02467129518 Neil Armstrong        2023-11-30  4257  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
10e02467129518 Neil Armstrong        2023-11-30  4258  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
10e02467129518 Neil Armstrong        2023-11-30  4259  
10e02467129518 Neil Armstrong        2023-11-30  4260  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4261  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4262  			#power-domain-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4263  		};
10e02467129518 Neil Armstrong        2023-11-30  4264  
db33633b05c0b5 Neil Armstrong        2024-03-18  4265  		adreno_smmu: iommu@3da0000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  4266  			compatible = "qcom,sm8650-smmu-500", "qcom,adreno-smmu",
db33633b05c0b5 Neil Armstrong        2024-03-18  4267  				     "qcom,smmu-500", "arm,mmu-500";
db33633b05c0b5 Neil Armstrong        2024-03-18  4268  			reg = <0x0 0x03da0000 0x0 0x40000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4269  			#iommu-cells = <2>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4270  			#global-interrupts = <1>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4271  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4272  				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4273  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4274  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4275  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4276  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4277  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4278  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4279  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4280  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4281  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4282  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4283  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4284  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4285  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4286  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4287  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4288  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4289  				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4290  				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4291  				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4292  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4293  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4294  				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4295  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4296  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH 0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4297  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4298  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4299  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  4300  				 <&gpucc GPU_CC_AHB_CLK>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4301  			clock-names = "hlos",
db33633b05c0b5 Neil Armstrong        2024-03-18  4302  				      "bus",
db33633b05c0b5 Neil Armstrong        2024-03-18  4303  				      "iface",
db33633b05c0b5 Neil Armstrong        2024-03-18  4304  				      "ahb";
db33633b05c0b5 Neil Armstrong        2024-03-18  4305  			power-domains = <&gpucc GPU_CX_GDSC>;
db33633b05c0b5 Neil Armstrong        2024-03-18  4306  			dma-coherent;
db33633b05c0b5 Neil Armstrong        2024-03-18  4307  		};
db33633b05c0b5 Neil Armstrong        2024-03-18  4308  
9fdddbd134a688 Neil Armstrong        2023-12-01  4309  		ipa: ipa@3f40000 {
9fdddbd134a688 Neil Armstrong        2023-12-01  4310  			compatible = "qcom,sm8650-ipa", "qcom,sm8550-ipa";
9fdddbd134a688 Neil Armstrong        2023-12-01  4311  
9fdddbd134a688 Neil Armstrong        2023-12-01  4312  			iommus = <&apps_smmu 0x4a0 0x0>,
9fdddbd134a688 Neil Armstrong        2023-12-01  4313  				 <&apps_smmu 0x4a2 0x0>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4314  			reg = <0 0x3f40000 0 0x10000>,
9fdddbd134a688 Neil Armstrong        2023-12-01  4315  			      <0 0x3f50000 0 0x5000>,
9fdddbd134a688 Neil Armstrong        2023-12-01  4316  			      <0 0x3e04000 0 0xfc000>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4317  			reg-names = "ipa-reg",
9fdddbd134a688 Neil Armstrong        2023-12-01  4318  				    "ipa-shared",
9fdddbd134a688 Neil Armstrong        2023-12-01  4319  				    "gsi";
9fdddbd134a688 Neil Armstrong        2023-12-01  4320  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4321  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4322  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
9fdddbd134a688 Neil Armstrong        2023-12-01  4323  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
9fdddbd134a688 Neil Armstrong        2023-12-01  4324  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4325  			interrupt-names = "ipa",
9fdddbd134a688 Neil Armstrong        2023-12-01  4326  					  "gsi",
9fdddbd134a688 Neil Armstrong        2023-12-01  4327  					  "ipa-clock-query",
9fdddbd134a688 Neil Armstrong        2023-12-01  4328  					  "ipa-setup-ready";
9fdddbd134a688 Neil Armstrong        2023-12-01  4329  
9fdddbd134a688 Neil Armstrong        2023-12-01  4330  			clocks = <&rpmhcc RPMH_IPA_CLK>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4331  			clock-names = "core";
9fdddbd134a688 Neil Armstrong        2023-12-01  4332  
ee6dfc9c75d43a Neil Armstrong        2025-01-15  4333  			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
ee6dfc9c75d43a Neil Armstrong        2025-01-15  4334  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  4335  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  4336  					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4337  			interconnect-names = "memory",
9fdddbd134a688 Neil Armstrong        2023-12-01  4338  					     "config";
9fdddbd134a688 Neil Armstrong        2023-12-01  4339  
9fdddbd134a688 Neil Armstrong        2023-12-01  4340  			qcom,qmp = <&aoss_qmp>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4341  
9fdddbd134a688 Neil Armstrong        2023-12-01  4342  			qcom,smem-states = <&ipa_smp2p_out 0>,
9fdddbd134a688 Neil Armstrong        2023-12-01  4343  					   <&ipa_smp2p_out 1>;
9fdddbd134a688 Neil Armstrong        2023-12-01  4344  			qcom,smem-state-names = "ipa-clock-enabled-valid",
9fdddbd134a688 Neil Armstrong        2023-12-01  4345  						"ipa-clock-enabled";
9fdddbd134a688 Neil Armstrong        2023-12-01  4346  
9fdddbd134a688 Neil Armstrong        2023-12-01  4347  			status = "disabled";
9fdddbd134a688 Neil Armstrong        2023-12-01  4348  		};
9fdddbd134a688 Neil Armstrong        2023-12-01  4349  
10e02467129518 Neil Armstrong        2023-11-30  4350  		remoteproc_mpss: remoteproc@4080000 {
10e02467129518 Neil Armstrong        2023-11-30  4351  			compatible = "qcom,sm8650-mpss-pas";
d4fa87daf3dd39 Krzysztof Kozlowski   2024-12-13  4352  			reg = <0x0 0x04080000 0x0 0x10000>;
10e02467129518 Neil Armstrong        2023-11-30  4353  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4354  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING 0>,
10e02467129518 Neil Armstrong        2023-11-30  4355  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  4356  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  4357  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  4358  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  4359  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  4360  			interrupt-names = "wdog",
10e02467129518 Neil Armstrong        2023-11-30  4361  					  "fatal",
10e02467129518 Neil Armstrong        2023-11-30  4362  					  "ready",
10e02467129518 Neil Armstrong        2023-11-30  4363  					  "handover",
10e02467129518 Neil Armstrong        2023-11-30  4364  					  "stop-ack",
10e02467129518 Neil Armstrong        2023-11-30  4365  					  "shutdown-ack";
10e02467129518 Neil Armstrong        2023-11-30  4366  
10e02467129518 Neil Armstrong        2023-11-30  4367  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  4368  			clock-names = "xo";
10e02467129518 Neil Armstrong        2023-11-30  4369  
10e02467129518 Neil Armstrong        2023-11-30  4370  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  4371  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  4372  
10e02467129518 Neil Armstrong        2023-11-30  4373  			power-domains = <&rpmhpd RPMHPD_CX>,
10e02467129518 Neil Armstrong        2023-11-30  4374  					<&rpmhpd RPMHPD_MSS>;
10e02467129518 Neil Armstrong        2023-11-30  4375  			power-domain-names = "cx",
10e02467129518 Neil Armstrong        2023-11-30  4376  					     "mss";
10e02467129518 Neil Armstrong        2023-11-30  4377  
10e02467129518 Neil Armstrong        2023-11-30  4378  			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
af53ecef19ffab Neil Armstrong        2024-01-23  4379  					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
af53ecef19ffab Neil Armstrong        2024-01-23  4380  					<&qlink_logging_mem>;
10e02467129518 Neil Armstrong        2023-11-30  4381  
10e02467129518 Neil Armstrong        2023-11-30  4382  			qcom,qmp = <&aoss_qmp>;
10e02467129518 Neil Armstrong        2023-11-30  4383  
10e02467129518 Neil Armstrong        2023-11-30  4384  			qcom,smem-states = <&smp2p_modem_out 0>;
10e02467129518 Neil Armstrong        2023-11-30  4385  			qcom,smem-state-names = "stop";
10e02467129518 Neil Armstrong        2023-11-30  4386  
10e02467129518 Neil Armstrong        2023-11-30  4387  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  4388  
10e02467129518 Neil Armstrong        2023-11-30  4389  			glink-edge {
10e02467129518 Neil Armstrong        2023-11-30  4390  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30  4391  							     IPCC_MPROC_SIGNAL_GLINK_QMP
10e02467129518 Neil Armstrong        2023-11-30  4392  							     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  4393  
10e02467129518 Neil Armstrong        2023-11-30  4394  				mboxes = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30  4395  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e02467129518 Neil Armstrong        2023-11-30  4396  
10e02467129518 Neil Armstrong        2023-11-30  4397  				qcom,remote-pid = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4398  
10e02467129518 Neil Armstrong        2023-11-30  4399  				label = "mpss";
10e02467129518 Neil Armstrong        2023-11-30  4400  			};
10e02467129518 Neil Armstrong        2023-11-30  4401  		};
10e02467129518 Neil Armstrong        2023-11-30  4402  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4403  		remoteproc_adsp: remoteproc@6800000 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4404  			compatible = "qcom,sm8650-adsp-pas";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4405  			reg = <0x0 0x06800000 0x0 0x10000>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4406  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4407  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4408  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4409  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4410  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4411  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4412  			interrupt-names = "wdog",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4413  					  "fatal",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4414  					  "ready",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4415  					  "handover",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4416  					  "stop-ack";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4417  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4418  			clocks = <&rpmhcc RPMH_CXO_CLK>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4419  			clock-names = "xo";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4420  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4421  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4422  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4423  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4424  			power-domains = <&rpmhpd RPMHPD_LCX>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4425  					<&rpmhpd RPMHPD_LMX>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4426  			power-domain-names = "lcx",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4427  					     "lmx";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4428  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4429  			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4430  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4431  			qcom,qmp = <&aoss_qmp>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4432  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4433  			qcom,smem-states = <&smp2p_adsp_out 0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4434  			qcom,smem-state-names = "stop";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4435  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4436  			status = "disabled";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4437  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4438  			remoteproc_adsp_glink: glink-edge {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4439  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4440  							     IPCC_MPROC_SIGNAL_GLINK_QMP
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4441  							     IRQ_TYPE_EDGE_RISING>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4442  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4443  				mboxes = <&ipcc IPCC_CLIENT_LPASS
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4444  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4445  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4446  				qcom,remote-pid = <2>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4447  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4448  				label = "lpass";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4449  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4450  				fastrpc {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4451  					compatible = "qcom,fastrpc";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4452  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4453  					qcom,glink-channels = "fastrpcglink-apps-dsp";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4454  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4455  					label = "adsp";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4456  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4457  					qcom,non-secure-domain;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4458  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4459  					#address-cells = <1>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4460  					#size-cells = <0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4461  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4462  					compute-cb@3 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4463  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4464  						reg = <3>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4465  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4466  						iommus = <&apps_smmu 0x1003 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4467  							 <&apps_smmu 0x1043 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4468  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4469  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4470  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4471  					compute-cb@4 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4472  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4473  						reg = <4>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4474  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4475  						iommus = <&apps_smmu 0x1004 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4476  							 <&apps_smmu 0x1044 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4477  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4478  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4479  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4480  					compute-cb@5 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4481  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4482  						reg = <5>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4483  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4484  						iommus = <&apps_smmu 0x1005 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4485  							 <&apps_smmu 0x1045 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4486  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4487  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4488  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4489  					compute-cb@6 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4490  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4491  						reg = <6>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4492  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4493  						iommus = <&apps_smmu 0x1006 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4494  							 <&apps_smmu 0x1046 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4495  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4496  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4497  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4498  					compute-cb@7 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4499  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4500  						reg = <7>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4501  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4502  						iommus = <&apps_smmu 0x1007 0x40>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4503  							 <&apps_smmu 0x1067 0x0>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4504  							 <&apps_smmu 0x1087 0x0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4505  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4506  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4507  				};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4508  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4509  				gpr {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4510  					compatible = "qcom,gpr";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4511  					qcom,glink-channels = "adsp_apps";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4512  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4513  					qcom,intents = <512 20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4514  					#address-cells = <1>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4515  					#size-cells = <0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4516  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4517  					q6apm: service@1 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4518  						compatible = "qcom,q6apm";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4519  						reg = <GPR_APM_MODULE_IID>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4520  						#sound-dai-cells = <0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4521  						qcom,protection-domain = "avs/audio",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4522  									 "msm/adsp/audio_pd";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4523  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4524  						q6apmbedai: bedais {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4525  							compatible = "qcom,q6apm-lpass-dais";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4526  							#sound-dai-cells = <1>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4527  						};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4528  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4529  						q6apmdai: dais {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4530  							compatible = "qcom,q6apm-dais";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4531  							iommus = <&apps_smmu 0x1001 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4532  								 <&apps_smmu 0x1061 0x0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4533  						};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4534  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4535  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4536  					q6prm: service@2 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4537  						compatible = "qcom,q6prm";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4538  						reg = <GPR_PRM_MODULE_IID>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4539  						qcom,protection-domain = "avs/audio",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4540  									 "msm/adsp/audio_pd";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4541  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4542  						q6prmcc: clock-controller {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4543  							compatible = "qcom,q6prm-lpass-clocks";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4544  							#clock-cells = <2>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4545  						};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4546  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4547  				};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4548  			};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4549  		};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  4550  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4551  		lpass_wsa2macro: codec@6aa0000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4552  			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4553  			reg = <0 0x06aa0000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4554  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4555  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4556  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4557  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4558  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4559  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4560  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4561  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4562  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4563  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4564  			clock-output-names = "wsa2-mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4565  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4566  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4567  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4568  		swr3: soundwire@6ab0000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4569  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4570  			reg = <0 0x06ab0000 0 0x10000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4571  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4572  			clocks = <&lpass_wsa2macro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4573  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4574  			label = "WSA2";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4575  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4576  			pinctrl-0 = <&wsa2_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4577  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4578  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4579  			qcom,din-ports = <4>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4580  			qcom,dout-ports = <9>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4581  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4582  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4583  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4584  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4585  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4586  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4587  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4588  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4589  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4590  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4591  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4592  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4593  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4594  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4595  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4596  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4597  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4598  		lpass_rxmacro: codec@6ac0000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4599  			compatible = "qcom,sm8650-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4600  			reg = <0 0x06ac0000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4601  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4602  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4603  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4604  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4605  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4606  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4607  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4608  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4609  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4610  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4611  			clock-output-names = "mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4612  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4613  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4614  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4615  		swr1: soundwire@6ad0000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4616  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4617  			reg = <0 0x06ad0000 0 0x10000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4618  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4619  			clocks = <&lpass_rxmacro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4620  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4621  			label = "RX";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4622  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4623  			pinctrl-0 = <&rx_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4624  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4625  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4626  			qcom,din-ports = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4627  			qcom,dout-ports = <11>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4628  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4629  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4630  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4631  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4632  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4633  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4634  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4635  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4636  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4637  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4638  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4639  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4640  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4641  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4642  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4643  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4644  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4645  		lpass_txmacro: codec@6ae0000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4646  			compatible = "qcom,sm8650-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4647  			reg = <0 0x06ae0000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4648  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4649  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4650  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4651  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4652  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4653  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4654  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4655  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4656  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4657  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4658  			clock-output-names = "mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4659  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4660  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4661  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4662  		lpass_wsamacro: codec@6b00000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4663  			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4664  			reg = <0 0x06b00000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4665  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4666  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4667  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4668  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4669  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4670  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4671  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4672  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4673  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4674  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4675  			clock-output-names = "mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4676  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4677  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4678  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4679  		swr0: soundwire@6b10000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4680  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4681  			reg = <0 0x06b10000 0 0x10000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4682  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4683  			clocks = <&lpass_wsamacro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4684  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4685  			label = "WSA";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4686  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4687  			pinctrl-0 = <&wsa_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4688  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4689  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4690  			qcom,din-ports = <4>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4691  			qcom,dout-ports = <9>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4692  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4693  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4694  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4695  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4696  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4697  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4698  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4699  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4700  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4701  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4702  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4703  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4704  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4705  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4706  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4707  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4708  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4709  		swr2: soundwire@6d30000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4710  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4711  			reg = <0 0x06d30000 0 0x10000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4712  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4713  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH 0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4714  			interrupt-names = "core", "wakeup";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4715  			clocks = <&lpass_txmacro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4716  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4717  			label = "TX";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4718  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4719  			pinctrl-0 = <&tx_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4720  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4721  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4722  			qcom,din-ports = <4>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4723  			qcom,dout-ports = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4724  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4725  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4726  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4727  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4728  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4729  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4730  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4731  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4732  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4733  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4734  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4735  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4736  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4737  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4738  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4739  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4740  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4741  		lpass_vamacro: codec@6d44000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4742  			compatible = "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4743  			reg = <0 0x06d44000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4744  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4745  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4746  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4747  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4748  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4749  				      "dcodec";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4750  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4751  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4752  			clock-output-names = "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4753  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4754  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  4755  
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4756  		lpass_tlmm: pinctrl@6e80000 {
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4757  			compatible = "qcom,sm8650-lpass-lpi-pinctrl";
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4758  			reg = <0 0x06e80000 0 0x20000>;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4759  
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4760  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4761  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4762  			clock-names = "core", "audio";
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4763  
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4764  			gpio-controller;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4765  			#gpio-cells = <2>;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4766  			gpio-ranges = <&lpass_tlmm 0 0 23>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4767  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4768  			tx_swr_active: tx-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4769  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4770  					pins = "gpio0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4771  					function = "swr_tx_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4772  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4773  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4774  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4775  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4776  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4777  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4778  					pins = "gpio1", "gpio2", "gpio14";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4779  					function = "swr_tx_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4780  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4781  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4782  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4783  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4784  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4785  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4786  			rx_swr_active: rx-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4787  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4788  					pins = "gpio3";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4789  					function = "swr_rx_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4790  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4791  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4792  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4793  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4794  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4795  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4796  					pins = "gpio4", "gpio5";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4797  					function = "swr_rx_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4798  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4799  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4800  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4801  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4802  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4803  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4804  			dmic01_default: dmic01-default-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4805  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4806  					pins = "gpio6";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4807  					function = "dmic1_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4808  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4809  					output-high;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4810  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4811  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4812  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4813  					pins = "gpio7";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4814  					function = "dmic1_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4815  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4816  					input-enable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4817  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4818  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4819  
94c312767160f0 Krzysztof Kozlowski   2024-02-12  4820  			dmic23_default: dmic23-default-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4821  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4822  					pins = "gpio8";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4823  					function = "dmic2_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4824  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4825  					output-high;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4826  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4827  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4828  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4829  					pins = "gpio9";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4830  					function = "dmic2_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4831  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4832  					input-enable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4833  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4834  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4835  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4836  			wsa_swr_active: wsa-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4837  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4838  					pins = "gpio10";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4839  					function = "wsa_swr_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4840  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4841  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4842  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4843  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4844  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4845  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4846  					pins = "gpio11";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4847  					function = "wsa_swr_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4848  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4849  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4850  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4851  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4852  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4853  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4854  			wsa2_swr_active: wsa2-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4855  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4856  					pins = "gpio15";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4857  					function = "wsa2_swr_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4858  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4859  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4860  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4861  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4862  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4863  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4864  					pins = "gpio16";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4865  					function = "wsa2_swr_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4866  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4867  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4868  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4869  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  4870  			};
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4871  		};
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  4872  
10e02467129518 Neil Armstrong        2023-11-30  4873  		lpass_lpiaon_noc: interconnect@7400000 {
10e02467129518 Neil Armstrong        2023-11-30  4874  			compatible = "qcom,sm8650-lpass-lpiaon-noc";
10e02467129518 Neil Armstrong        2023-11-30  4875  			reg = <0 0x07400000 0 0x19080>;
10e02467129518 Neil Armstrong        2023-11-30  4876  
10e02467129518 Neil Armstrong        2023-11-30  4877  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4878  
10e02467129518 Neil Armstrong        2023-11-30  4879  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  4880  		};
10e02467129518 Neil Armstrong        2023-11-30  4881  
10e02467129518 Neil Armstrong        2023-11-30  4882  		lpass_lpicx_noc: interconnect@7430000 {
10e02467129518 Neil Armstrong        2023-11-30  4883  			compatible = "qcom,sm8650-lpass-lpicx-noc";
10e02467129518 Neil Armstrong        2023-11-30  4884  			reg = <0 0x07430000 0 0x3a200>;
10e02467129518 Neil Armstrong        2023-11-30  4885  
10e02467129518 Neil Armstrong        2023-11-30  4886  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4887  
10e02467129518 Neil Armstrong        2023-11-30  4888  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  4889  		};
10e02467129518 Neil Armstrong        2023-11-30  4890  
10e02467129518 Neil Armstrong        2023-11-30  4891  		lpass_ag_noc: interconnect@7e40000 {
10e02467129518 Neil Armstrong        2023-11-30  4892  			compatible = "qcom,sm8650-lpass-ag-noc";
10e02467129518 Neil Armstrong        2023-11-30  4893  			reg = <0 0x07e40000 0 0xe080>;
10e02467129518 Neil Armstrong        2023-11-30  4894  
10e02467129518 Neil Armstrong        2023-11-30  4895  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4896  
10e02467129518 Neil Armstrong        2023-11-30  4897  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  4898  		};
10e02467129518 Neil Armstrong        2023-11-30  4899  
10e02467129518 Neil Armstrong        2023-11-30  4900  		sdhc_2: mmc@8804000 {
10e02467129518 Neil Armstrong        2023-11-30  4901  			compatible = "qcom,sm8650-sdhci", "qcom,sdhci-msm-v5";
10e02467129518 Neil Armstrong        2023-11-30  4902  			reg = <0 0x08804000 0 0x1000>;
10e02467129518 Neil Armstrong        2023-11-30  4903  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4904  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH 0>,
9ce52e908bd5c0 Neil Armstrong        2025-02-28  4905  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  4906  			interrupt-names = "hc_irq",
10e02467129518 Neil Armstrong        2023-11-30  4907  					  "pwr_irq";
10e02467129518 Neil Armstrong        2023-11-30  4908  
10e02467129518 Neil Armstrong        2023-11-30  4909  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4910  				 <&gcc GCC_SDCC2_APPS_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4911  				 <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  4912  			clock-names = "iface",
10e02467129518 Neil Armstrong        2023-11-30  4913  				      "core",
10e02467129518 Neil Armstrong        2023-11-30  4914  				      "xo";
10e02467129518 Neil Armstrong        2023-11-30  4915  
10e02467129518 Neil Armstrong        2023-11-30  4916  			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  4917  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a4da40505d7238 Neil Armstrong        2025-01-15  4918  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a4da40505d7238 Neil Armstrong        2025-01-15  4919  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
10e02467129518 Neil Armstrong        2023-11-30  4920  			interconnect-names = "sdhc-ddr",
10e02467129518 Neil Armstrong        2023-11-30  4921  					     "cpu-sdhc";
10e02467129518 Neil Armstrong        2023-11-30  4922  
10e02467129518 Neil Armstrong        2023-11-30  4923  			power-domains = <&rpmhpd RPMHPD_CX>;
10e02467129518 Neil Armstrong        2023-11-30  4924  			operating-points-v2 = <&sdhc2_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  4925  
10e02467129518 Neil Armstrong        2023-11-30  4926  			iommus = <&apps_smmu 0x540 0>;
10e02467129518 Neil Armstrong        2023-11-30  4927  
10e02467129518 Neil Armstrong        2023-11-30  4928  			bus-width = <4>;
10e02467129518 Neil Armstrong        2023-11-30  4929  
10e02467129518 Neil Armstrong        2023-11-30  4930  			/* Forbid SDR104/SDR50 - broken hw! */
10e02467129518 Neil Armstrong        2023-11-30  4931  			sdhci-caps-mask = <0x3 0>;
10e02467129518 Neil Armstrong        2023-11-30  4932  
10e02467129518 Neil Armstrong        2023-11-30  4933  			qcom,dll-config = <0x0007642c>;
10e02467129518 Neil Armstrong        2023-11-30  4934  			qcom,ddr-config = <0x80040868>;
10e02467129518 Neil Armstrong        2023-11-30  4935  
10e02467129518 Neil Armstrong        2023-11-30  4936  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  4937  
10e02467129518 Neil Armstrong        2023-11-30  4938  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  4939  
10e02467129518 Neil Armstrong        2023-11-30  4940  			sdhc2_opp_table: opp-table {
10e02467129518 Neil Armstrong        2023-11-30  4941  				compatible = "operating-points-v2";
10e02467129518 Neil Armstrong        2023-11-30  4942  
10e02467129518 Neil Armstrong        2023-11-30  4943  				opp-19200000 {
10e02467129518 Neil Armstrong        2023-11-30  4944  					opp-hz = /bits/ 64 <19200000>;
10e02467129518 Neil Armstrong        2023-11-30  4945  					required-opps = <&rpmhpd_opp_min_svs>;
10e02467129518 Neil Armstrong        2023-11-30  4946  				};
10e02467129518 Neil Armstrong        2023-11-30  4947  
10e02467129518 Neil Armstrong        2023-11-30  4948  				opp-50000000 {
10e02467129518 Neil Armstrong        2023-11-30  4949  					opp-hz = /bits/ 64 <50000000>;
10e02467129518 Neil Armstrong        2023-11-30  4950  					required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  4951  				};
10e02467129518 Neil Armstrong        2023-11-30  4952  
10e02467129518 Neil Armstrong        2023-11-30  4953  				opp-100000000 {
10e02467129518 Neil Armstrong        2023-11-30  4954  					opp-hz = /bits/ 64 <100000000>;
10e02467129518 Neil Armstrong        2023-11-30  4955  					required-opps = <&rpmhpd_opp_svs>;
10e02467129518 Neil Armstrong        2023-11-30  4956  				};
10e02467129518 Neil Armstrong        2023-11-30  4957  
10e02467129518 Neil Armstrong        2023-11-30  4958  				opp-202000000 {
10e02467129518 Neil Armstrong        2023-11-30  4959  					opp-hz = /bits/ 64 <202000000>;
10e02467129518 Neil Armstrong        2023-11-30  4960  					required-opps = <&rpmhpd_opp_svs_l1>;
10e02467129518 Neil Armstrong        2023-11-30  4961  				};
10e02467129518 Neil Armstrong        2023-11-30  4962  			};
10e02467129518 Neil Armstrong        2023-11-30  4963  		};
10e02467129518 Neil Armstrong        2023-11-30  4964  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4965  		iris: video-codec@aa00000 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  4966  			compatible = "qcom,sm8650-iris";
56cf5ad39a5589 Neil Armstrong        2025-06-13  4967  			reg = <0 0x0aa00000 0 0xf0000>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4968  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4969  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4970  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4971  			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4972  					<&videocc VIDEO_CC_MVS0_GDSC>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4973  					<&rpmhpd RPMHPD_MXC>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4974  					<&rpmhpd RPMHPD_MMCX>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4975  			power-domain-names = "venus",
56cf5ad39a5589 Neil Armstrong        2025-06-13  4976  					     "vcodec0",
56cf5ad39a5589 Neil Armstrong        2025-06-13  4977  					     "mxc",
56cf5ad39a5589 Neil Armstrong        2025-06-13  4978  					     "mmcx";
56cf5ad39a5589 Neil Armstrong        2025-06-13  4979  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4980  			operating-points-v2 = <&iris_opp_table>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4981  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4982  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4983  				 <&videocc VIDEO_CC_MVS0C_CLK>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4984  				 <&videocc VIDEO_CC_MVS0_CLK>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4985  			clock-names = "iface",
56cf5ad39a5589 Neil Armstrong        2025-06-13  4986  				      "core",
56cf5ad39a5589 Neil Armstrong        2025-06-13  4987  				      "vcodec0_core";
56cf5ad39a5589 Neil Armstrong        2025-06-13  4988  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4989  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
56cf5ad39a5589 Neil Armstrong        2025-06-13  4990  					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4991  					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
56cf5ad39a5589 Neil Armstrong        2025-06-13  4992  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4993  			interconnect-names = "cpu-cfg",
56cf5ad39a5589 Neil Armstrong        2025-06-13  4994  					     "video-mem";
56cf5ad39a5589 Neil Armstrong        2025-06-13  4995  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4996  			memory-region = <&video_mem>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  4997  
56cf5ad39a5589 Neil Armstrong        2025-06-13  4998  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  4999  				 <&videocc VIDEO_CC_XO_CLK_ARES>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5000  				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5001  			reset-names = "bus",
56cf5ad39a5589 Neil Armstrong        2025-06-13  5002  				      "xo",
56cf5ad39a5589 Neil Armstrong        2025-06-13  5003  				      "core";
56cf5ad39a5589 Neil Armstrong        2025-06-13  5004  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5005  			iommus = <&apps_smmu 0x1940 0>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5006  				 <&apps_smmu 0x1947 0>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5007  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5008  			dma-coherent;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5009  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5010  			/*
56cf5ad39a5589 Neil Armstrong        2025-06-13  5011  			 * IRIS firmware is signed by vendors, only
56cf5ad39a5589 Neil Armstrong        2025-06-13  5012  			 * enable in boards where the proper signed firmware
56cf5ad39a5589 Neil Armstrong        2025-06-13  5013  			 * is available.
56cf5ad39a5589 Neil Armstrong        2025-06-13  5014  			 */
56cf5ad39a5589 Neil Armstrong        2025-06-13  5015  			status = "disabled";
56cf5ad39a5589 Neil Armstrong        2025-06-13  5016  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5017  			iris_opp_table: opp-table {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5018  				compatible = "operating-points-v2";
56cf5ad39a5589 Neil Armstrong        2025-06-13  5019  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5020  				opp-196000000 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5021  					opp-hz = /bits/ 64 <196000000>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5022  					required-opps = <&rpmhpd_opp_low_svs_d1>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5023  							<&rpmhpd_opp_low_svs_d1>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5024  				};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5025  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5026  				opp-300000000 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5027  					opp-hz = /bits/ 64 <300000000>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5028  					required-opps = <&rpmhpd_opp_low_svs>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5029  							<&rpmhpd_opp_low_svs>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5030  				};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5031  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5032  				opp-380000000 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5033  					opp-hz = /bits/ 64 <380000000>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5034  					required-opps = <&rpmhpd_opp_svs>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5035  							<&rpmhpd_opp_svs>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5036  				};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5037  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5038  				opp-435000000 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5039  					opp-hz = /bits/ 64 <435000000>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5040  					required-opps = <&rpmhpd_opp_svs_l1>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5041  							<&rpmhpd_opp_svs_l1>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5042  				};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5043  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5044  				opp-480000000 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5045  					opp-hz = /bits/ 64 <480000000>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5046  					required-opps = <&rpmhpd_opp_nom>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5047  							<&rpmhpd_opp_nom>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5048  				};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5049  
56cf5ad39a5589 Neil Armstrong        2025-06-13  5050  				opp-533333334 {
56cf5ad39a5589 Neil Armstrong        2025-06-13  5051  					opp-hz = /bits/ 64 <533333334>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5052  					required-opps = <&rpmhpd_opp_turbo>,
56cf5ad39a5589 Neil Armstrong        2025-06-13  5053  							<&rpmhpd_opp_turbo>;
56cf5ad39a5589 Neil Armstrong        2025-06-13  5054  				};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5055  			};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5056  		};
56cf5ad39a5589 Neil Armstrong        2025-06-13  5057  
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5058  		videocc: clock-controller@aaf0000 {
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5059  			compatible = "qcom,sm8650-videocc";
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5060  			reg = <0 0x0aaf0000 0 0x10000>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5061  			clocks = <&bi_tcxo_div2>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5062  				 <&gcc GCC_VIDEO_AHB_CLK>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5063  			power-domains = <&rpmhpd RPMHPD_MMCX>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5064  			#clock-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5065  			#reset-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5066  			#power-domain-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5067  		};
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5068  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5069  		cci0: cci@ac15000 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5070  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5071  			reg = <0 0x0ac15000 0 0x1000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  5072  			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5073  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5074  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5075  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5076  				 <&camcc CAM_CC_CCI_0_CLK>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5077  			clock-names = "camnoc_axi",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5078  				      "cpas_ahb",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5079  				      "cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5080  			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5081  			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5082  			pinctrl-names = "default", "sleep";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5083  			status = "disabled";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5084  			#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5085  			#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5086  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5087  			cci0_i2c0: i2c-bus@0 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5088  				reg = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5089  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5090  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5091  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5092  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5093  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5094  			cci0_i2c1: i2c-bus@1 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5095  				reg = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5096  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5097  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5098  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5099  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5100  		};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5101  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5102  		cci1: cci@ac16000 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5103  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5104  			reg = <0 0x0ac16000 0 0x1000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  5105  			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING 0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5106  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5107  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5108  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5109  				 <&camcc CAM_CC_CCI_1_CLK>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5110  			clock-names = "camnoc_axi",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5111  				      "cpas_ahb",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5112  				      "cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5113  			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5114  			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5115  			pinctrl-names = "default", "sleep";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5116  			status = "disabled";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5117  			#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5118  			#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5119  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5120  			cci1_i2c0: i2c-bus@0 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5121  				reg = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5122  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5123  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5124  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5125  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5126  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5127  			cci1_i2c1: i2c-bus@1 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5128  				reg = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5129  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5130  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5131  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5132  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5133  		};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5134  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5135  		cci2: cci@ac17000 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5136  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5137  			reg = <0 0x0ac17000 0 0x1000>;
9ce52e908bd5c0 Neil Armstrong        2025-02-28  5138  			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING 0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5139  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5140  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5141  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5142  				 <&camcc CAM_CC_CCI_2_CLK>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5143  			clock-names = "camnoc_axi",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5144  				      "cpas_ahb",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5145  				      "cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5146  			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5147  			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5148  			pinctrl-names = "default", "sleep";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5149  			status = "disabled";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5150  			#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5151  			#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5152  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5153  			cci2_i2c0: i2c-bus@0 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5154  				reg = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5155  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5156  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5157  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5158  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5159  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5160  			cci2_i2c1: i2c-bus@1 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5161  				reg = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5162  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5163  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5164  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5165  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5166  		};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  5167  
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5168  		camcc: clock-controller@ade0000 {
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5169  			compatible = "qcom,sm8650-camcc";
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5170  			reg = <0 0x0ade0000 0 0x20000>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5171  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5172  				 <&bi_tcxo_div2>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5173  				 <&bi_tcxo_ao_div2>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5174  				 <&sleep_clk>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5175  			power-domains = <&rpmhpd RPMHPD_MMCX>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5176  			#clock-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5177  			#reset-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5178  			#power-domain-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5179  		};
0bdb730e63f662 Jagadeesh Kona        2024-06-02  5180  
10e02467129518 Neil Armstrong        2023-11-30  5181  		mdss: display-subsystem@ae00000 {
10e02467129518 Neil Armstrong        2023-11-30  5182  			compatible = "qcom,sm8650-mdss";
10e02467129518 Neil Armstrong        2023-11-30  5183  			reg = <0 0x0ae00000 0 0x1000>;
10e02467129518 Neil Armstrong        2023-11-30  5184  			reg-names = "mdss";
10e02467129518 Neil Armstrong        2023-11-30  5185  
9ce52e908bd5c0 Neil Armstrong        2025-02-28  5186  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>;
10e02467129518 Neil Armstrong        2023-11-30  5187  
10e02467129518 Neil Armstrong        2023-11-30  5188  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5189  				 <&gcc GCC_DISP_HF_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5190  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5191  
10e02467129518 Neil Armstrong        2023-11-30  5192  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  5193  
10e02467129518 Neil Armstrong        2023-11-30  5194  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
f22be5c1dd3e12 Neil Armstrong        2025-02-27  5195  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f22be5c1dd3e12 Neil Armstrong        2025-02-27  5196  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
f22be5c1dd3e12 Neil Armstrong        2025-02-27  5197  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
f22be5c1dd3e12 Neil Armstrong        2025-02-27  5198  			interconnect-names = "mdp0-mem",
f22be5c1dd3e12 Neil Armstrong        2025-02-27  5199  					     "cpu-cfg";
10e02467129518 Neil Armstrong        2023-11-30  5200  
10e02467129518 Neil Armstrong        2023-11-30  5201  			power-domains = <&dispcc MDSS_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  5202  
10e02467129518 Neil Armstrong        2023-11-30  5203  			iommus = <&apps_smmu 0x1c00 0x2>;
10e02467129518 Neil Armstrong        2023-11-30  5204  
10e02467129518 Neil Armstrong        2023-11-30  5205  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  5206  			#interrupt-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5207  
10e02467129518 Neil Armstrong        2023-11-30  5208  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  5209  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  5210  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  5211  
10e02467129518 Neil Armstrong        2023-11-30  5212  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  5213  
10e02467129518 Neil Armstrong        2023-11-30  5214  			mdss_mdp: display-controller@ae01000 {
10e02467129518 Neil Armstrong        2023-11-30  5215  				compatible = "qcom,sm8650-dpu";
10e02467129518 Neil Armstrong        2023-11-30  5216  				reg = <0 0x0ae01000 0 0x8f000>,
d8203fff4e6849 Dmitry Baryshkov      2025-04-15  5217  				      <0 0x0aeb0000 0 0x3000>;
10e02467129518 Neil Armstrong        2023-11-30  5218  				reg-names = "mdp",
10e02467129518 Neil Armstrong        2023-11-30  5219  					    "vbif";
10e02467129518 Neil Armstrong        2023-11-30  5220  
10e02467129518 Neil Armstrong        2023-11-30  5221  				interrupts-extended = <&mdss 0>;
10e02467129518 Neil Armstrong        2023-11-30  5222  
10e02467129518 Neil Armstrong        2023-11-30  5223  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5224  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5225  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5226  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5227  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5228  				clock-names = "nrt_bus",
10e02467129518 Neil Armstrong        2023-11-30  5229  					      "iface",
10e02467129518 Neil Armstrong        2023-11-30  5230  					      "lut",
10e02467129518 Neil Armstrong        2023-11-30  5231  					      "core",
10e02467129518 Neil Armstrong        2023-11-30  5232  					      "vsync";
10e02467129518 Neil Armstrong        2023-11-30  5233  
10e02467129518 Neil Armstrong        2023-11-30  5234  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5235  				assigned-clock-rates = <19200000>;
10e02467129518 Neil Armstrong        2023-11-30  5236  
10e02467129518 Neil Armstrong        2023-11-30  5237  				operating-points-v2 = <&mdp_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  5238  
10e02467129518 Neil Armstrong        2023-11-30  5239  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  5240  
10e02467129518 Neil Armstrong        2023-11-30  5241  				ports {
10e02467129518 Neil Armstrong        2023-11-30  5242  					#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5243  					#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5244  
10e02467129518 Neil Armstrong        2023-11-30  5245  					port@0 {
10e02467129518 Neil Armstrong        2023-11-30  5246  						reg = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5247  
10e02467129518 Neil Armstrong        2023-11-30  5248  						dpu_intf1_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  5249  							remote-endpoint = <&mdss_dsi0_in>;
10e02467129518 Neil Armstrong        2023-11-30  5250  						};
10e02467129518 Neil Armstrong        2023-11-30  5251  					};
10e02467129518 Neil Armstrong        2023-11-30  5252  
10e02467129518 Neil Armstrong        2023-11-30  5253  					port@1 {
10e02467129518 Neil Armstrong        2023-11-30  5254  						reg = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5255  
10e02467129518 Neil Armstrong        2023-11-30  5256  						dpu_intf2_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  5257  							remote-endpoint = <&mdss_dsi1_in>;
10e02467129518 Neil Armstrong        2023-11-30  5258  						};
10e02467129518 Neil Armstrong        2023-11-30  5259  					};
990b6c928b212d Neil Armstrong        2023-12-08  5260  
990b6c928b212d Neil Armstrong        2023-12-08  5261  					port@2 {
990b6c928b212d Neil Armstrong        2023-12-08  5262  						reg = <2>;
990b6c928b212d Neil Armstrong        2023-12-08  5263  
990b6c928b212d Neil Armstrong        2023-12-08  5264  						dpu_intf0_out: endpoint {
990b6c928b212d Neil Armstrong        2023-12-08  5265  							remote-endpoint = <&mdss_dp0_in>;
990b6c928b212d Neil Armstrong        2023-12-08  5266  						};
990b6c928b212d Neil Armstrong        2023-12-08  5267  					};
10e02467129518 Neil Armstrong        2023-11-30  5268  				};
10e02467129518 Neil Armstrong        2023-11-30  5269  
10e02467129518 Neil Armstrong        2023-11-30  5270  				mdp_opp_table: opp-table {
10e02467129518 Neil Armstrong        2023-11-30  5271  					compatible = "operating-points-v2";
10e02467129518 Neil Armstrong        2023-11-30  5272  
10e02467129518 Neil Armstrong        2023-11-30  5273  					opp-200000000 {
10e02467129518 Neil Armstrong        2023-11-30  5274  						opp-hz = /bits/ 64 <200000000>;
10e02467129518 Neil Armstrong        2023-11-30  5275  						required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  5276  					};
10e02467129518 Neil Armstrong        2023-11-30  5277  
10e02467129518 Neil Armstrong        2023-11-30  5278  					opp-325000000 {
10e02467129518 Neil Armstrong        2023-11-30  5279  						opp-hz = /bits/ 64 <325000000>;
10e02467129518 Neil Armstrong        2023-11-30  5280  						required-opps = <&rpmhpd_opp_svs>;
10e02467129518 Neil Armstrong        2023-11-30  5281  					};
10e02467129518 Neil Armstrong        2023-11-30  5282  
10e02467129518 Neil Armstrong        2023-11-30  5283  					opp-375000000 {
10e02467129518 Neil Armstrong        2023-11-30  5284  						opp-hz = /bits/ 64 <375000000>;
10e02467129518 Neil Armstrong        2023-11-30  5285  						required-opps = <&rpmhpd_opp_svs_l1>;
10e02467129518 Neil Armstrong        2023-11-30  5286  					};
10e02467129518 Neil Armstrong        2023-11-30  5287  
10e02467129518 Neil Armstrong        2023-11-30  5288  					opp-514000000 {
10e02467129518 Neil Armstrong        2023-11-30  5289  						opp-hz = /bits/ 64 <514000000>;
10e02467129518 Neil Armstrong        2023-11-30  5290  						required-opps = <&rpmhpd_opp_nom>;
10e02467129518 Neil Armstrong        2023-11-30  5291  					};
10e02467129518 Neil Armstrong        2023-11-30  5292  				};
10e02467129518 Neil Armstrong        2023-11-30  5293  			};
10e02467129518 Neil Armstrong        2023-11-30  5294  
10e02467129518 Neil Armstrong        2023-11-30  5295  			mdss_dsi0: dsi@ae94000 {
10e02467129518 Neil Armstrong        2023-11-30  5296  				compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
10e02467129518 Neil Armstrong        2023-11-30  5297  				reg = <0 0x0ae94000 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  5298  				reg-names = "dsi_ctrl";
10e02467129518 Neil Armstrong        2023-11-30  5299  
10e02467129518 Neil Armstrong        2023-11-30  5300  				interrupts-extended = <&mdss 4>;
10e02467129518 Neil Armstrong        2023-11-30  5301  
10e02467129518 Neil Armstrong        2023-11-30  5302  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5303  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5304  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5305  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5306  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5307  					 <&gcc GCC_DISP_HF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5308  				clock-names = "byte",
10e02467129518 Neil Armstrong        2023-11-30  5309  					      "byte_intf",
10e02467129518 Neil Armstrong        2023-11-30  5310  					      "pixel",
10e02467129518 Neil Armstrong        2023-11-30  5311  					      "core",
10e02467129518 Neil Armstrong        2023-11-30  5312  					      "iface",
10e02467129518 Neil Armstrong        2023-11-30  5313  					      "bus";
10e02467129518 Neil Armstrong        2023-11-30  5314  
10e02467129518 Neil Armstrong        2023-11-30  5315  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
10e02467129518 Neil Armstrong        2023-11-30  5316  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
314ffec606514c Krzysztof Kozlowski   2025-04-08  5317  				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
314ffec606514c Krzysztof Kozlowski   2025-04-08  5318  							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5319  
10e02467129518 Neil Armstrong        2023-11-30  5320  				operating-points-v2 = <&mdss_dsi_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  5321  
10e02467129518 Neil Armstrong        2023-11-30  5322  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  5323  
10e02467129518 Neil Armstrong        2023-11-30  5324  				phys = <&mdss_dsi0_phy>;
10e02467129518 Neil Armstrong        2023-11-30  5325  				phy-names = "dsi";
10e02467129518 Neil Armstrong        2023-11-30  5326  
10e02467129518 Neil Armstrong        2023-11-30  5327  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5328  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5329  
10e02467129518 Neil Armstrong        2023-11-30  5330  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  5331  
10e02467129518 Neil Armstrong        2023-11-30  5332  				ports {
10e02467129518 Neil Armstrong        2023-11-30  5333  					#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5334  					#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5335  
10e02467129518 Neil Armstrong        2023-11-30  5336  					port@0 {
10e02467129518 Neil Armstrong        2023-11-30  5337  						reg = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5338  
10e02467129518 Neil Armstrong        2023-11-30  5339  						mdss_dsi0_in: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  5340  							remote-endpoint = <&dpu_intf1_out>;
10e02467129518 Neil Armstrong        2023-11-30  5341  						};
10e02467129518 Neil Armstrong        2023-11-30  5342  					};
10e02467129518 Neil Armstrong        2023-11-30  5343  
10e02467129518 Neil Armstrong        2023-11-30  5344  					port@1 {
10e02467129518 Neil Armstrong        2023-11-30  5345  						reg = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5346  
10e02467129518 Neil Armstrong        2023-11-30  5347  						mdss_dsi0_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  5348  						};
10e02467129518 Neil Armstrong        2023-11-30  5349  					};
10e02467129518 Neil Armstrong        2023-11-30  5350  				};
10e02467129518 Neil Armstrong        2023-11-30  5351  
10e02467129518 Neil Armstrong        2023-11-30  5352  				mdss_dsi_opp_table: opp-table {
10e02467129518 Neil Armstrong        2023-11-30  5353  					compatible = "operating-points-v2";
10e02467129518 Neil Armstrong        2023-11-30  5354  
10e02467129518 Neil Armstrong        2023-11-30  5355  					opp-187500000 {
10e02467129518 Neil Armstrong        2023-11-30  5356  						opp-hz = /bits/ 64 <187500000>;
10e02467129518 Neil Armstrong        2023-11-30  5357  						required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  5358  					};
10e02467129518 Neil Armstrong        2023-11-30  5359  
10e02467129518 Neil Armstrong        2023-11-30  5360  					opp-300000000 {
10e02467129518 Neil Armstrong        2023-11-30  5361  						opp-hz = /bits/ 64 <300000000>;
10e02467129518 Neil Armstrong        2023-11-30  5362  						required-opps = <&rpmhpd_opp_svs>;
10e02467129518 Neil Armstrong        2023-11-30  5363  					};
10e02467129518 Neil Armstrong        2023-11-30  5364  
10e02467129518 Neil Armstrong        2023-11-30  5365  					opp-358000000 {
10e02467129518 Neil Armstrong        2023-11-30  5366  						opp-hz = /bits/ 64 <358000000>;
10e02467129518 Neil Armstrong        2023-11-30  5367  						required-opps = <&rpmhpd_opp_svs_l1>;
10e02467129518 Neil Armstrong        2023-11-30  5368  					};
10e02467129518 Neil Armstrong        2023-11-30  5369  				};
10e02467129518 Neil Armstrong        2023-11-30  5370  			};
10e02467129518 Neil Armstrong        2023-11-30  5371  
10e02467129518 Neil Armstrong        2023-11-30  5372  			mdss_dsi0_phy: phy@ae95000 {
10e02467129518 Neil Armstrong        2023-11-30  5373  				compatible = "qcom,sm8650-dsi-phy-4nm";
10e02467129518 Neil Armstrong        2023-11-30  5374  				reg = <0 0x0ae95000 0 0x200>,
10e02467129518 Neil Armstrong        2023-11-30  5375  				      <0 0x0ae95200 0 0x280>,
10e02467129518 Neil Armstrong        2023-11-30  5376  				      <0 0x0ae95500 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  5377  				reg-names = "dsi_phy",
10e02467129518 Neil Armstrong        2023-11-30  5378  					    "dsi_phy_lane",
10e02467129518 Neil Armstrong        2023-11-30  5379  					    "dsi_pll";
10e02467129518 Neil Armstrong        2023-11-30  5380  
10e02467129518 Neil Armstrong        2023-11-30  5381  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5382  					 <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5383  				clock-names = "iface",
10e02467129518 Neil Armstrong        2023-11-30  5384  					      "ref";
10e02467129518 Neil Armstrong        2023-11-30  5385  
10e02467129518 Neil Armstrong        2023-11-30  5386  				#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5387  				#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5388  
10e02467129518 Neil Armstrong        2023-11-30  5389  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  5390  			};
10e02467129518 Neil Armstrong        2023-11-30  5391  
10e02467129518 Neil Armstrong        2023-11-30  5392  			mdss_dsi1: dsi@ae96000 {
10e02467129518 Neil Armstrong        2023-11-30  5393  				compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
10e02467129518 Neil Armstrong        2023-11-30  5394  				reg = <0 0x0ae96000 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  5395  				reg-names = "dsi_ctrl";
10e02467129518 Neil Armstrong        2023-11-30  5396  
10e02467129518 Neil Armstrong        2023-11-30  5397  				interrupts-extended = <&mdss 5>;
10e02467129518 Neil Armstrong        2023-11-30  5398  
10e02467129518 Neil Armstrong        2023-11-30  5399  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5400  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5401  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5402  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5403  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5404  					 <&gcc GCC_DISP_HF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5405  				clock-names = "byte",
10e02467129518 Neil Armstrong        2023-11-30  5406  					      "byte_intf",
10e02467129518 Neil Armstrong        2023-11-30  5407  					      "pixel",
10e02467129518 Neil Armstrong        2023-11-30  5408  					      "core",
10e02467129518 Neil Armstrong        2023-11-30  5409  					      "iface",
10e02467129518 Neil Armstrong        2023-11-30  5410  					      "bus";
10e02467129518 Neil Armstrong        2023-11-30  5411  
10e02467129518 Neil Armstrong        2023-11-30  5412  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
10e02467129518 Neil Armstrong        2023-11-30  5413  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
314ffec606514c Krzysztof Kozlowski   2025-04-08  5414  				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
314ffec606514c Krzysztof Kozlowski   2025-04-08  5415  							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5416  
10e02467129518 Neil Armstrong        2023-11-30  5417  				operating-points-v2 = <&mdss_dsi_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  5418  
10e02467129518 Neil Armstrong        2023-11-30  5419  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  5420  
10e02467129518 Neil Armstrong        2023-11-30  5421  				phys = <&mdss_dsi1_phy>;
10e02467129518 Neil Armstrong        2023-11-30  5422  				phy-names = "dsi";
10e02467129518 Neil Armstrong        2023-11-30  5423  
10e02467129518 Neil Armstrong        2023-11-30  5424  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5425  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5426  
10e02467129518 Neil Armstrong        2023-11-30  5427  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  5428  
10e02467129518 Neil Armstrong        2023-11-30  5429  				ports {
10e02467129518 Neil Armstrong        2023-11-30  5430  					#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5431  					#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5432  
10e02467129518 Neil Armstrong        2023-11-30  5433  					port@0 {
10e02467129518 Neil Armstrong        2023-11-30  5434  						reg = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5435  
10e02467129518 Neil Armstrong        2023-11-30  5436  						mdss_dsi1_in: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  5437  							remote-endpoint = <&dpu_intf2_out>;
10e02467129518 Neil Armstrong        2023-11-30  5438  						};
10e02467129518 Neil Armstrong        2023-11-30  5439  					};
10e02467129518 Neil Armstrong        2023-11-30  5440  
10e02467129518 Neil Armstrong        2023-11-30  5441  					port@1 {
10e02467129518 Neil Armstrong        2023-11-30  5442  						reg = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5443  
10e02467129518 Neil Armstrong        2023-11-30  5444  						mdss_dsi1_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  5445  						};
10e02467129518 Neil Armstrong        2023-11-30  5446  					};
10e02467129518 Neil Armstrong        2023-11-30  5447  				};
10e02467129518 Neil Armstrong        2023-11-30  5448  			};
10e02467129518 Neil Armstrong        2023-11-30  5449  
10e02467129518 Neil Armstrong        2023-11-30  5450  			mdss_dsi1_phy: phy@ae97000 {
10e02467129518 Neil Armstrong        2023-11-30  5451  				compatible = "qcom,sm8650-dsi-phy-4nm";
10e02467129518 Neil Armstrong        2023-11-30  5452  				reg = <0 0x0ae97000 0 0x200>,
10e02467129518 Neil Armstrong        2023-11-30  5453  				      <0 0x0ae97200 0 0x280>,
10e02467129518 Neil Armstrong        2023-11-30  5454  				      <0 0x0ae97500 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  5455  				reg-names = "dsi_phy",
10e02467129518 Neil Armstrong        2023-11-30  5456  					    "dsi_phy_lane",
10e02467129518 Neil Armstrong        2023-11-30  5457  					    "dsi_pll";
10e02467129518 Neil Armstrong        2023-11-30  5458  
10e02467129518 Neil Armstrong        2023-11-30  5459  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5460  					 <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5461  				clock-names = "iface",
10e02467129518 Neil Armstrong        2023-11-30  5462  					      "ref";
10e02467129518 Neil Armstrong        2023-11-30  5463  
10e02467129518 Neil Armstrong        2023-11-30  5464  				#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5465  				#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5466  
10e02467129518 Neil Armstrong        2023-11-30  5467  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  5468  			};
990b6c928b212d Neil Armstrong        2023-12-08  5469  
990b6c928b212d Neil Armstrong        2023-12-08  5470  			mdss_dp0: displayport-controller@af54000 {
990b6c928b212d Neil Armstrong        2023-12-08  5471  				compatible = "qcom,sm8650-dp";
990b6c928b212d Neil Armstrong        2023-12-08  5472  				reg = <0 0xaf54000 0 0x104>,
990b6c928b212d Neil Armstrong        2023-12-08  5473  				      <0 0xaf54200 0 0xc0>,
990b6c928b212d Neil Armstrong        2023-12-08  5474  				      <0 0xaf55000 0 0x770>,
990b6c928b212d Neil Armstrong        2023-12-08  5475  				      <0 0xaf56000 0 0x9c>,
990b6c928b212d Neil Armstrong        2023-12-08  5476  				      <0 0xaf57000 0 0x9c>;
990b6c928b212d Neil Armstrong        2023-12-08  5477  
990b6c928b212d Neil Armstrong        2023-12-08  5478  				interrupts-extended = <&mdss 12>;
990b6c928b212d Neil Armstrong        2023-12-08  5479  
990b6c928b212d Neil Armstrong        2023-12-08  5480  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5481  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5482  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5483  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5484  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
990b6c928b212d Neil Armstrong        2023-12-08  5485  				clock-names = "core_iface",
990b6c928b212d Neil Armstrong        2023-12-08  5486  					      "core_aux",
990b6c928b212d Neil Armstrong        2023-12-08  5487  					      "ctrl_link",
990b6c928b212d Neil Armstrong        2023-12-08  5488  					      "ctrl_link_iface",
990b6c928b212d Neil Armstrong        2023-12-08  5489  					      "stream_pixel";
990b6c928b212d Neil Armstrong        2023-12-08  5490  
990b6c928b212d Neil Armstrong        2023-12-08  5491  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
990b6c928b212d Neil Armstrong        2023-12-08  5492  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
990b6c928b212d Neil Armstrong        2023-12-08  5493  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5494  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
990b6c928b212d Neil Armstrong        2023-12-08  5495  
990b6c928b212d Neil Armstrong        2023-12-08  5496  				operating-points-v2 = <&dp_opp_table>;
990b6c928b212d Neil Armstrong        2023-12-08  5497  
990b6c928b212d Neil Armstrong        2023-12-08  5498  				power-domains = <&rpmhpd RPMHPD_MMCX>;
990b6c928b212d Neil Armstrong        2023-12-08  5499  
990b6c928b212d Neil Armstrong        2023-12-08  5500  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
990b6c928b212d Neil Armstrong        2023-12-08  5501  				phy-names = "dp";
990b6c928b212d Neil Armstrong        2023-12-08  5502  
990b6c928b212d Neil Armstrong        2023-12-08  5503  				#sound-dai-cells = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  5504  
990b6c928b212d Neil Armstrong        2023-12-08  5505  				status = "disabled";
990b6c928b212d Neil Armstrong        2023-12-08  5506  
990b6c928b212d Neil Armstrong        2023-12-08  5507  				dp_opp_table: opp-table {
990b6c928b212d Neil Armstrong        2023-12-08  5508  					compatible = "operating-points-v2";
990b6c928b212d Neil Armstrong        2023-12-08  5509  
990b6c928b212d Neil Armstrong        2023-12-08  5510  					opp-162000000 {
990b6c928b212d Neil Armstrong        2023-12-08  5511  						opp-hz = /bits/ 64 <162000000>;
990b6c928b212d Neil Armstrong        2023-12-08  5512  						required-opps = <&rpmhpd_opp_low_svs_d1>;
990b6c928b212d Neil Armstrong        2023-12-08  5513  					};
990b6c928b212d Neil Armstrong        2023-12-08  5514  
990b6c928b212d Neil Armstrong        2023-12-08  5515  					opp-270000000 {
990b6c928b212d Neil Armstrong        2023-12-08  5516  						opp-hz = /bits/ 64 <270000000>;
990b6c928b212d Neil Armstrong        2023-12-08  5517  						required-opps = <&rpmhpd_opp_low_svs>;
990b6c928b212d Neil Armstrong        2023-12-08  5518  					};
990b6c928b212d Neil Armstrong        2023-12-08  5519  
990b6c928b212d Neil Armstrong        2023-12-08  5520  					opp-540000000 {
990b6c928b212d Neil Armstrong        2023-12-08  5521  						opp-hz = /bits/ 64 <540000000>;
990b6c928b212d Neil Armstrong        2023-12-08  5522  						required-opps = <&rpmhpd_opp_svs_l1>;
990b6c928b212d Neil Armstrong        2023-12-08  5523  					};
990b6c928b212d Neil Armstrong        2023-12-08  5524  
990b6c928b212d Neil Armstrong        2023-12-08  5525  					opp-810000000 {
990b6c928b212d Neil Armstrong        2023-12-08  5526  						opp-hz = /bits/ 64 <810000000>;
990b6c928b212d Neil Armstrong        2023-12-08  5527  						required-opps = <&rpmhpd_opp_nom>;
990b6c928b212d Neil Armstrong        2023-12-08  5528  					};
990b6c928b212d Neil Armstrong        2023-12-08  5529  				};
990b6c928b212d Neil Armstrong        2023-12-08  5530  
990b6c928b212d Neil Armstrong        2023-12-08  5531  				ports {
990b6c928b212d Neil Armstrong        2023-12-08  5532  					#address-cells = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  5533  					#size-cells = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  5534  
990b6c928b212d Neil Armstrong        2023-12-08  5535  					port@0 {
990b6c928b212d Neil Armstrong        2023-12-08  5536  						reg = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  5537  
990b6c928b212d Neil Armstrong        2023-12-08  5538  						mdss_dp0_in: endpoint {
990b6c928b212d Neil Armstrong        2023-12-08  5539  							remote-endpoint = <&dpu_intf0_out>;
990b6c928b212d Neil Armstrong        2023-12-08  5540  						};
990b6c928b212d Neil Armstrong        2023-12-08  5541  					};
990b6c928b212d Neil Armstrong        2023-12-08  5542  
990b6c928b212d Neil Armstrong        2023-12-08  5543  					port@1 {
990b6c928b212d Neil Armstrong        2023-12-08  5544  						reg = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  5545  
990b6c928b212d Neil Armstrong        2023-12-08  5546  						mdss_dp0_out: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  5547  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
990b6c928b212d Neil Armstrong        2023-12-08  5548  						};
990b6c928b212d Neil Armstrong        2023-12-08  5549  					};
990b6c928b212d Neil Armstrong        2023-12-08  5550  				};
990b6c928b212d Neil Armstrong        2023-12-08  5551  			};
10e02467129518 Neil Armstrong        2023-11-30  5552  		};
10e02467129518 Neil Armstrong        2023-11-30  5553  
10e02467129518 Neil Armstrong        2023-11-30  5554  		dispcc: clock-controller@af00000 {
10e02467129518 Neil Armstrong        2023-11-30  5555  			compatible = "qcom,sm8650-dispcc";
10e02467129518 Neil Armstrong        2023-11-30  5556  			reg = <0 0x0af00000 0 0x20000>;
10e02467129518 Neil Armstrong        2023-11-30  5557  
10e02467129518 Neil Armstrong        2023-11-30  5558  			clocks = <&bi_tcxo_div2>,
10e02467129518 Neil Armstrong        2023-11-30  5559  				 <&bi_tcxo_ao_div2>,
10e02467129518 Neil Armstrong        2023-11-30  5560  				 <&gcc GCC_DISP_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5561  				 <&sleep_clk>,
314ffec606514c Krzysztof Kozlowski   2025-04-08  5562  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
314ffec606514c Krzysztof Kozlowski   2025-04-08  5563  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
314ffec606514c Krzysztof Kozlowski   2025-04-08  5564  				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
314ffec606514c Krzysztof Kozlowski   2025-04-08  5565  				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5566  				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  5567  				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5568  				 <0>, /* dp1 */
10e02467129518 Neil Armstrong        2023-11-30  5569  				 <0>,
10e02467129518 Neil Armstrong        2023-11-30  5570  				 <0>, /* dp2 */
10e02467129518 Neil Armstrong        2023-11-30  5571  				 <0>,
10e02467129518 Neil Armstrong        2023-11-30  5572  				 <0>, /* dp3 */
10e02467129518 Neil Armstrong        2023-11-30  5573  				 <0>;
10e02467129518 Neil Armstrong        2023-11-30  5574  
10e02467129518 Neil Armstrong        2023-11-30  5575  			power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  5576  			required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  5577  
10e02467129518 Neil Armstrong        2023-11-30  5578  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5579  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5580  			#power-domain-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5581  		};
10e02467129518 Neil Armstrong        2023-11-30  5582  
10e02467129518 Neil Armstrong        2023-11-30  5583  		usb_1_hsphy: phy@88e3000 {
10e02467129518 Neil Armstrong        2023-11-30  5584  			compatible = "qcom,sm8650-snps-eusb2-phy",
10e02467129518 Neil Armstrong        2023-11-30  5585  				     "qcom,sm8550-snps-eusb2-phy";
10e02467129518 Neil Armstrong        2023-11-30  5586  			reg = <0 0x088e3000 0 0x154>;
10e02467129518 Neil Armstrong        2023-11-30  5587  
10e02467129518 Neil Armstrong        2023-11-30  5588  			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
10e02467129518 Neil Armstrong        2023-11-30  5589  			clock-names = "ref";
10e02467129518 Neil Armstrong        2023-11-30  5590  
10e02467129518 Neil Armstrong        2023-11-30  5591  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  5592  
10e02467129518 Neil Armstrong        2023-11-30  5593  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  5594  
10e02467129518 Neil Armstrong        2023-11-30  5595  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  5596  		};
10e02467129518 Neil Armstrong        2023-11-30  5597  
10e02467129518 Neil Armstrong        2023-11-30  5598  		usb_dp_qmpphy: phy@88e8000 {
10e02467129518 Neil Armstrong        2023-11-30  5599  			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
10e02467129518 Neil Armstrong        2023-11-30  5600  			reg = <0 0x088e8000 0 0x3000>;
10e02467129518 Neil Armstrong        2023-11-30  5601  
10e02467129518 Neil Armstrong        2023-11-30  5602  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5603  				 <&rpmhcc RPMH_CXO_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5604  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  5605  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  5606  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  5607  				      "ref",
10e02467129518 Neil Armstrong        2023-11-30  5608  				      "com_aux",
10e02467129518 Neil Armstrong        2023-11-30  5609  				      "usb3_pipe";
10e02467129518 Neil Armstrong        2023-11-30  5610  
10e02467129518 Neil Armstrong        2023-11-30  5611  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
10e02467129518 Neil Armstrong        2023-11-30  5612  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  5613  			reset-names = "phy",
10e02467129518 Neil Armstrong        2023-11-30  5614  				      "common";
10e02467129518 Neil Armstrong        2023-11-30  5615  
10e02467129518 Neil Armstrong        2023-11-30  5616  			power-domains = <&gcc USB3_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  5617  
10e02467129518 Neil Armstrong        2023-11-30  5618  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5619  			#phy-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  5620  
fbb22a182267c8 Dmitry Baryshkov      2024-04-29  5621  			orientation-switch;
fbb22a182267c8 Dmitry Baryshkov      2024-04-29  5622  
10e02467129518 Neil Armstrong        2023-11-30  5623  			status = "disabled";
990b6c928b212d Neil Armstrong        2023-12-08  5624  
990b6c928b212d Neil Armstrong        2023-12-08  5625  			ports {
990b6c928b212d Neil Armstrong        2023-12-08  5626  				#address-cells = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  5627  				#size-cells = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  5628  
990b6c928b212d Neil Armstrong        2023-12-08  5629  				port@0 {
990b6c928b212d Neil Armstrong        2023-12-08  5630  					reg = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  5631  
990b6c928b212d Neil Armstrong        2023-12-08  5632  					usb_dp_qmpphy_out: endpoint {
990b6c928b212d Neil Armstrong        2023-12-08  5633  					};
990b6c928b212d Neil Armstrong        2023-12-08  5634  				};
990b6c928b212d Neil Armstrong        2023-12-08  5635  
990b6c928b212d Neil Armstrong        2023-12-08  5636  				port@1 {
990b6c928b212d Neil Armstrong        2023-12-08  5637  					reg = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  5638  
990b6c928b212d Neil Armstrong        2023-12-08  5639  					usb_dp_qmpphy_usb_ss_in: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  5640  						remote-endpoint = <&usb_1_dwc3_ss>;
990b6c928b212d Neil Armstrong        2023-12-08  5641  					};
990b6c928b212d Neil Armstrong        2023-12-08  5642  				};
990b6c928b212d Neil Armstrong        2023-12-08  5643  
990b6c928b212d Neil Armstrong        2023-12-08  5644  				port@2 {
990b6c928b212d Neil Armstrong        2023-12-08  5645  					reg = <2>;
990b6c928b212d Neil Armstrong        2023-12-08  5646  
990b6c928b212d Neil Armstrong        2023-12-08  5647  					usb_dp_qmpphy_dp_in: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  5648  						remote-endpoint = <&mdss_dp0_out>;
990b6c928b212d Neil Armstrong        2023-12-08  5649  					};
990b6c928b212d Neil Armstrong        2023-12-08  5650  				};
990b6c928b212d Neil Armstrong        2023-12-08  5651  			};
10e02467129518 Neil Armstrong        2023-11-30  5652  		};
10e02467129518 Neil Armstrong        2023-11-30  5653  
82de9f234348c8 Neil Armstrong        2025-07-29 @5654  		usb_1: usb@a600000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
