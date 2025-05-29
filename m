Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA651632C8
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539794; cv=none; b=QbYIdeJnHsvqIjDLjajTFycFoTyxhZmIoJDBMuPIz7hrkSe3f9yVbqTCfDfu8wAUqFG3j8dRtF6nu3ec/68Xm3D4zdB/G681M48MbOmg2Qin05B8cZ+J1194cQeV+4Jl1bmUOiqhvdX7ZZ7JVnX8Lcnl7MStBwMB1hrWN1tnmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539794; c=relaxed/simple;
	bh=hO06viuh1VWKSyO/cYqxhMG6wKMToNYHq6NznfBseVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DOdqDz9HUf77LErwBBH1m6+QfaqWr/Z1jbNrVUgSb0g6OxaWUajyVS2MZ81bwUT0BGa/Bv+3BTwoLFRGfXtxtx94rh+bT4BB3LccWWPvpx348W9q7dcCH4NHC0CVpzYXrWG8PEPg+2dYLCu8XV96dTJLH00mpgczz8iSOGy1yVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkGLULxk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkGLULxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748539781; x=1780075781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hO06viuh1VWKSyO/cYqxhMG6wKMToNYHq6NznfBseVw=;
  b=RkGLULxkc5x+XFosGMbKvtfxLA/1jgPP55dmzMbJ9ytGX/KHOAknMThL
   7FsP8kCuh26pKc3x2cnJgYTSfvg3fGHXKx0urwpYHj1/NkIi/HXTFIGDz
   gAzWkdEwKu8RM5Xen5civRM6uF/i3aoVjyLbPX2uo+IURqPrfGd2Xt6ex
   s+9lT8scgazFTXYP+m/zg5vK+YCENoaQuArTd4sEK5uI7eulg17XuZ6ka
   gXL1U2keTLBP6nkgN4eEy85fwBan5uSq4FqAMSMb3t1nHw2+aRj4AOJKj
   LdwhXOsFY8uK+Gr/a7ZMbca3ju0VbsQoz3R5kFCnwJuvC54WFYFFOaLAs
   w==;
X-CSE-ConnectionGUID: AuuQCuiUSUiUOIEQ4WvbYw==
X-CSE-MsgGUID: s1Cfzx4PSAiXmtMV2Avx/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50315465"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="50315465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 10:29:40 -0700
X-CSE-ConnectionGUID: jrcG8CwBTy69dta7RdkZRg==
X-CSE-MsgGUID: qz1iLl9mRRikjrVBCLh6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="144268065"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 May 2025 10:29:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKh4R-000Wwu-1F;
	Thu, 29 May 2025 17:29:35 +0000
Date: Fri, 30 May 2025 01:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <202505300138.EYlDvVYO-lkp@intel.com>
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
In-Reply-To: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
References: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
TO: Yingchao Deng <quic_yingdeng@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Yingchao Deng <quic_yingdeng@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Yingchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yingchao-Deng/arm64-dts-qcom-Add-coresight-node-for-SM8650/20250529-170012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250529085650.3594253-1-quic_yingdeng%40quicinc.com
patch subject: [PATCH] arm64: dts: qcom: Add coresight node for SM8650
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-004-20250530 (https://download.01.org/0day-ci/archive/20250530/202505300138.EYlDvVYO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300138.EYlDvVYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505300138.EYlDvVYO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5219.12-5224.7: Warning (unit_address_vs_reg): /soc@0/replicator@10046000/out-ports/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5403.12-5408.7: Warning (unit_address_vs_reg): /soc@0/replicator@10b06000/out-ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3756.27-3831.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5215.14-5225.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10046000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5399.14-5409.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10b06000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5219.12-5224.7: Warning (unit_address_vs_reg): /soc@0/replicator@10046000/out-ports/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5403.12-5408.7: Warning (unit_address_vs_reg): /soc@0/replicator@10b06000/out-ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5215.14-5225.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10046000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5399.14-5409.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10b06000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +5219 arch/arm64/boot/dts/qcom/sm8650.dtsi

d2350377997f36 Neil Armstrong        2023-11-30    28  
d2350377997f36 Neil Armstrong        2023-11-30    29  / {
d2350377997f36 Neil Armstrong        2023-11-30    30  	interrupt-parent = <&intc>;
d2350377997f36 Neil Armstrong        2023-11-30    31  
d2350377997f36 Neil Armstrong        2023-11-30    32  	#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    33  	#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    34  
d2350377997f36 Neil Armstrong        2023-11-30    35  	chosen { };
d2350377997f36 Neil Armstrong        2023-11-30    36  
d2350377997f36 Neil Armstrong        2023-11-30    37  	clocks {
d2350377997f36 Neil Armstrong        2023-11-30    38  		xo_board: xo-board {
d2350377997f36 Neil Armstrong        2023-11-30    39  			compatible = "fixed-clock";
d2350377997f36 Neil Armstrong        2023-11-30    40  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    41  		};
d2350377997f36 Neil Armstrong        2023-11-30    42  
d2350377997f36 Neil Armstrong        2023-11-30    43  		sleep_clk: sleep-clk {
d2350377997f36 Neil Armstrong        2023-11-30    44  			compatible = "fixed-clock";
d2350377997f36 Neil Armstrong        2023-11-30    45  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    46  		};
d2350377997f36 Neil Armstrong        2023-11-30    47  
d2350377997f36 Neil Armstrong        2023-11-30    48  		bi_tcxo_div2: bi-tcxo-div2-clk {
d2350377997f36 Neil Armstrong        2023-11-30    49  			compatible = "fixed-factor-clock";
d2350377997f36 Neil Armstrong        2023-11-30    50  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    51  
d2350377997f36 Neil Armstrong        2023-11-30    52  			clocks = <&rpmhcc RPMH_CXO_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30    53  			clock-mult = <1>;
d2350377997f36 Neil Armstrong        2023-11-30    54  			clock-div = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    55  		};
d2350377997f36 Neil Armstrong        2023-11-30    56  
d2350377997f36 Neil Armstrong        2023-11-30    57  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
d2350377997f36 Neil Armstrong        2023-11-30    58  			compatible = "fixed-factor-clock";
d2350377997f36 Neil Armstrong        2023-11-30    59  			#clock-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    60  
d2350377997f36 Neil Armstrong        2023-11-30    61  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
d2350377997f36 Neil Armstrong        2023-11-30    62  			clock-mult = <1>;
d2350377997f36 Neil Armstrong        2023-11-30    63  			clock-div = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    64  		};
d2350377997f36 Neil Armstrong        2023-11-30    65  	};
d2350377997f36 Neil Armstrong        2023-11-30    66  
d2350377997f36 Neil Armstrong        2023-11-30    67  	cpus {
d2350377997f36 Neil Armstrong        2023-11-30    68  		#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    69  		#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30    70  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    71  		cpu0: cpu@0 {
d2350377997f36 Neil Armstrong        2023-11-30    72  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30    73  			compatible = "arm,cortex-a520";
d2350377997f36 Neil Armstrong        2023-11-30    74  			reg = <0 0>;
d2350377997f36 Neil Armstrong        2023-11-30    75  
d2350377997f36 Neil Armstrong        2023-11-30    76  			clocks = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30    77  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    78  			power-domains = <&cpu_pd0>;
d2350377997f36 Neil Armstrong        2023-11-30    79  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30    80  
d2350377997f36 Neil Armstrong        2023-11-30    81  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    82  			next-level-cache = <&l2_0>;
d2350377997f36 Neil Armstrong        2023-11-30    83  			capacity-dmips-mhz = <1024>;
d2350377997f36 Neil Armstrong        2023-11-30    84  			dynamic-power-coefficient = <100>;
d2350377997f36 Neil Armstrong        2023-11-30    85  
d2350377997f36 Neil Armstrong        2023-11-30    86  			qcom,freq-domain = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30    87  
d2350377997f36 Neil Armstrong        2023-11-30    88  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    89  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    90  			l2_0: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30    91  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30    92  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30    93  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    94  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30    95  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22    96  				l3_0: l3-cache {
d2350377997f36 Neil Armstrong        2023-11-30    97  					compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30    98  					cache-level = <3>;
d2350377997f36 Neil Armstrong        2023-11-30    99  					cache-unified;
d2350377997f36 Neil Armstrong        2023-11-30   100  				};
d2350377997f36 Neil Armstrong        2023-11-30   101  			};
d2350377997f36 Neil Armstrong        2023-11-30   102  		};
d2350377997f36 Neil Armstrong        2023-11-30   103  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   104  		cpu1: cpu@100 {
d2350377997f36 Neil Armstrong        2023-11-30   105  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   106  			compatible = "arm,cortex-a520";
d2350377997f36 Neil Armstrong        2023-11-30   107  			reg = <0 0x100>;
d2350377997f36 Neil Armstrong        2023-11-30   108  
d2350377997f36 Neil Armstrong        2023-11-30   109  			clocks = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30   110  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   111  			power-domains = <&cpu_pd1>;
d2350377997f36 Neil Armstrong        2023-11-30   112  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   113  
d2350377997f36 Neil Armstrong        2023-11-30   114  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   115  			next-level-cache = <&l2_0>;
d2350377997f36 Neil Armstrong        2023-11-30   116  			capacity-dmips-mhz = <1024>;
d2350377997f36 Neil Armstrong        2023-11-30   117  			dynamic-power-coefficient = <100>;
d2350377997f36 Neil Armstrong        2023-11-30   118  
d2350377997f36 Neil Armstrong        2023-11-30   119  			qcom,freq-domain = <&cpufreq_hw 0>;
d2350377997f36 Neil Armstrong        2023-11-30   120  
d2350377997f36 Neil Armstrong        2023-11-30   121  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   122  		};
d2350377997f36 Neil Armstrong        2023-11-30   123  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   124  		cpu2: cpu@200 {
d2350377997f36 Neil Armstrong        2023-11-30   125  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   126  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   127  			reg = <0 0x200>;
d2350377997f36 Neil Armstrong        2023-11-30   128  
d2350377997f36 Neil Armstrong        2023-11-30   129  			clocks = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   130  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   131  			power-domains = <&cpu_pd2>;
d2350377997f36 Neil Armstrong        2023-11-30   132  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   133  
d2350377997f36 Neil Armstrong        2023-11-30   134  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   135  			next-level-cache = <&l2_200>;
d2350377997f36 Neil Armstrong        2023-11-30   136  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   137  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   138  
d2350377997f36 Neil Armstrong        2023-11-30   139  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   140  
d2350377997f36 Neil Armstrong        2023-11-30   141  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   142  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   143  			l2_200: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   144  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   145  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   146  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   147  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   148  			};
d2350377997f36 Neil Armstrong        2023-11-30   149  		};
d2350377997f36 Neil Armstrong        2023-11-30   150  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   151  		cpu3: cpu@300 {
d2350377997f36 Neil Armstrong        2023-11-30   152  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   153  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   154  			reg = <0 0x300>;
d2350377997f36 Neil Armstrong        2023-11-30   155  
d2350377997f36 Neil Armstrong        2023-11-30   156  			clocks = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   157  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   158  			power-domains = <&cpu_pd3>;
d2350377997f36 Neil Armstrong        2023-11-30   159  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   160  
d2350377997f36 Neil Armstrong        2023-11-30   161  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   162  			next-level-cache = <&l2_200>;
d2350377997f36 Neil Armstrong        2023-11-30   163  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   164  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   165  
d2350377997f36 Neil Armstrong        2023-11-30   166  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   167  
d2350377997f36 Neil Armstrong        2023-11-30   168  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   169  		};
d2350377997f36 Neil Armstrong        2023-11-30   170  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   171  		cpu4: cpu@400 {
d2350377997f36 Neil Armstrong        2023-11-30   172  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   173  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   174  			reg = <0 0x400>;
d2350377997f36 Neil Armstrong        2023-11-30   175  
d2350377997f36 Neil Armstrong        2023-11-30   176  			clocks = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   177  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   178  			power-domains = <&cpu_pd4>;
d2350377997f36 Neil Armstrong        2023-11-30   179  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   180  
d2350377997f36 Neil Armstrong        2023-11-30   181  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   182  			next-level-cache = <&l2_400>;
d2350377997f36 Neil Armstrong        2023-11-30   183  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   184  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   185  
d2350377997f36 Neil Armstrong        2023-11-30   186  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f36 Neil Armstrong        2023-11-30   187  
d2350377997f36 Neil Armstrong        2023-11-30   188  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   189  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   190  			l2_400: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   191  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   192  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   193  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   194  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   195  			};
d2350377997f36 Neil Armstrong        2023-11-30   196  		};
d2350377997f36 Neil Armstrong        2023-11-30   197  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   198  		cpu5: cpu@500 {
d2350377997f36 Neil Armstrong        2023-11-30   199  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   200  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   201  			reg = <0 0x500>;
d2350377997f36 Neil Armstrong        2023-11-30   202  
d2350377997f36 Neil Armstrong        2023-11-30   203  			clocks = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   204  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   205  			power-domains = <&cpu_pd5>;
d2350377997f36 Neil Armstrong        2023-11-30   206  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   207  
d2350377997f36 Neil Armstrong        2023-11-30   208  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   209  			next-level-cache = <&l2_500>;
d2350377997f36 Neil Armstrong        2023-11-30   210  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   211  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   212  
d2350377997f36 Neil Armstrong        2023-11-30   213  			qcom,freq-domain = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   214  
d2350377997f36 Neil Armstrong        2023-11-30   215  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   216  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   217  			l2_500: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   218  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   219  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   220  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   221  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   222  			};
d2350377997f36 Neil Armstrong        2023-11-30   223  		};
d2350377997f36 Neil Armstrong        2023-11-30   224  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   225  		cpu6: cpu@600 {
d2350377997f36 Neil Armstrong        2023-11-30   226  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   227  			compatible = "arm,cortex-a720";
d2350377997f36 Neil Armstrong        2023-11-30   228  			reg = <0 0x600>;
d2350377997f36 Neil Armstrong        2023-11-30   229  
d2350377997f36 Neil Armstrong        2023-11-30   230  			clocks = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   231  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   232  			power-domains = <&cpu_pd6>;
d2350377997f36 Neil Armstrong        2023-11-30   233  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   234  
d2350377997f36 Neil Armstrong        2023-11-30   235  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   236  			next-level-cache = <&l2_600>;
d2350377997f36 Neil Armstrong        2023-11-30   237  			capacity-dmips-mhz = <1792>;
d2350377997f36 Neil Armstrong        2023-11-30   238  			dynamic-power-coefficient = <238>;
d2350377997f36 Neil Armstrong        2023-11-30   239  
d2350377997f36 Neil Armstrong        2023-11-30   240  			qcom,freq-domain = <&cpufreq_hw 1>;
d2350377997f36 Neil Armstrong        2023-11-30   241  
d2350377997f36 Neil Armstrong        2023-11-30   242  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   243  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   244  			l2_600: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   245  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   246  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   247  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   248  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   249  			};
d2350377997f36 Neil Armstrong        2023-11-30   250  		};
d2350377997f36 Neil Armstrong        2023-11-30   251  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   252  		cpu7: cpu@700 {
d2350377997f36 Neil Armstrong        2023-11-30   253  			device_type = "cpu";
d2350377997f36 Neil Armstrong        2023-11-30   254  			compatible = "arm,cortex-x4";
d2350377997f36 Neil Armstrong        2023-11-30   255  			reg = <0 0x700>;
d2350377997f36 Neil Armstrong        2023-11-30   256  
d2350377997f36 Neil Armstrong        2023-11-30   257  			clocks = <&cpufreq_hw 2>;
d2350377997f36 Neil Armstrong        2023-11-30   258  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   259  			power-domains = <&cpu_pd7>;
d2350377997f36 Neil Armstrong        2023-11-30   260  			power-domain-names = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   261  
d2350377997f36 Neil Armstrong        2023-11-30   262  			enable-method = "psci";
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   263  			next-level-cache = <&l2_700>;
d2350377997f36 Neil Armstrong        2023-11-30   264  			capacity-dmips-mhz = <1894>;
d2350377997f36 Neil Armstrong        2023-11-30   265  			dynamic-power-coefficient = <588>;
d2350377997f36 Neil Armstrong        2023-11-30   266  
d2350377997f36 Neil Armstrong        2023-11-30   267  			qcom,freq-domain = <&cpufreq_hw 2>;
d2350377997f36 Neil Armstrong        2023-11-30   268  
d2350377997f36 Neil Armstrong        2023-11-30   269  			#cooling-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   270  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   271  			l2_700: l2-cache {
d2350377997f36 Neil Armstrong        2023-11-30   272  				compatible = "cache";
d2350377997f36 Neil Armstrong        2023-11-30   273  				cache-level = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   274  				cache-unified;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   275  				next-level-cache = <&l3_0>;
d2350377997f36 Neil Armstrong        2023-11-30   276  			};
d2350377997f36 Neil Armstrong        2023-11-30   277  		};
d2350377997f36 Neil Armstrong        2023-11-30   278  
d2350377997f36 Neil Armstrong        2023-11-30   279  		cpu-map {
d2350377997f36 Neil Armstrong        2023-11-30   280  			cluster0 {
d2350377997f36 Neil Armstrong        2023-11-30   281  				core0 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   282  					cpu = <&cpu0>;
d2350377997f36 Neil Armstrong        2023-11-30   283  				};
d2350377997f36 Neil Armstrong        2023-11-30   284  
d2350377997f36 Neil Armstrong        2023-11-30   285  				core1 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   286  					cpu = <&cpu1>;
d2350377997f36 Neil Armstrong        2023-11-30   287  				};
d2350377997f36 Neil Armstrong        2023-11-30   288  
d2350377997f36 Neil Armstrong        2023-11-30   289  				core2 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   290  					cpu = <&cpu2>;
d2350377997f36 Neil Armstrong        2023-11-30   291  				};
d2350377997f36 Neil Armstrong        2023-11-30   292  
d2350377997f36 Neil Armstrong        2023-11-30   293  				core3 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   294  					cpu = <&cpu3>;
d2350377997f36 Neil Armstrong        2023-11-30   295  				};
d2350377997f36 Neil Armstrong        2023-11-30   296  
d2350377997f36 Neil Armstrong        2023-11-30   297  				core4 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   298  					cpu = <&cpu4>;
d2350377997f36 Neil Armstrong        2023-11-30   299  				};
d2350377997f36 Neil Armstrong        2023-11-30   300  
d2350377997f36 Neil Armstrong        2023-11-30   301  				core5 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   302  					cpu = <&cpu5>;
d2350377997f36 Neil Armstrong        2023-11-30   303  				};
d2350377997f36 Neil Armstrong        2023-11-30   304  
d2350377997f36 Neil Armstrong        2023-11-30   305  				core6 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   306  					cpu = <&cpu6>;
d2350377997f36 Neil Armstrong        2023-11-30   307  				};
d2350377997f36 Neil Armstrong        2023-11-30   308  
d2350377997f36 Neil Armstrong        2023-11-30   309  				core7 {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   310  					cpu = <&cpu7>;
d2350377997f36 Neil Armstrong        2023-11-30   311  				};
d2350377997f36 Neil Armstrong        2023-11-30   312  			};
d2350377997f36 Neil Armstrong        2023-11-30   313  		};
d2350377997f36 Neil Armstrong        2023-11-30   314  
d2350377997f36 Neil Armstrong        2023-11-30   315  		idle-states {
d2350377997f36 Neil Armstrong        2023-11-30   316  			entry-method = "psci";
d2350377997f36 Neil Armstrong        2023-11-30   317  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   318  			silver_cpu_sleep_0: cpu-sleep-0-0 {
d2350377997f36 Neil Armstrong        2023-11-30   319  				compatible = "arm,idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   320  				idle-state-name = "silver-rail-power-collapse";
d2350377997f36 Neil Armstrong        2023-11-30   321  				arm,psci-suspend-param = <0x40000004>;
d2350377997f36 Neil Armstrong        2023-11-30   322  				entry-latency-us = <550>;
d2350377997f36 Neil Armstrong        2023-11-30   323  				exit-latency-us = <750>;
d2350377997f36 Neil Armstrong        2023-11-30   324  				min-residency-us = <6700>;
d2350377997f36 Neil Armstrong        2023-11-30   325  				local-timer-stop;
d2350377997f36 Neil Armstrong        2023-11-30   326  			};
d2350377997f36 Neil Armstrong        2023-11-30   327  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   328  			gold_cpu_sleep_0: cpu-sleep-1-0 {
d2350377997f36 Neil Armstrong        2023-11-30   329  				compatible = "arm,idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   330  				idle-state-name = "gold-rail-power-collapse";
d2350377997f36 Neil Armstrong        2023-11-30   331  				arm,psci-suspend-param = <0x40000004>;
d2350377997f36 Neil Armstrong        2023-11-30   332  				entry-latency-us = <600>;
d2350377997f36 Neil Armstrong        2023-11-30   333  				exit-latency-us = <1300>;
d2350377997f36 Neil Armstrong        2023-11-30   334  				min-residency-us = <8136>;
d2350377997f36 Neil Armstrong        2023-11-30   335  				local-timer-stop;
d2350377997f36 Neil Armstrong        2023-11-30   336  			};
d2350377997f36 Neil Armstrong        2023-11-30   337  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   338  			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
d2350377997f36 Neil Armstrong        2023-11-30   339  				compatible = "arm,idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   340  				idle-state-name = "gold-plus-rail-power-collapse";
d2350377997f36 Neil Armstrong        2023-11-30   341  				arm,psci-suspend-param = <0x40000004>;
d2350377997f36 Neil Armstrong        2023-11-30   342  				entry-latency-us = <500>;
d2350377997f36 Neil Armstrong        2023-11-30   343  				exit-latency-us = <1350>;
d2350377997f36 Neil Armstrong        2023-11-30   344  				min-residency-us = <7480>;
d2350377997f36 Neil Armstrong        2023-11-30   345  				local-timer-stop;
d2350377997f36 Neil Armstrong        2023-11-30   346  			};
d2350377997f36 Neil Armstrong        2023-11-30   347  		};
d2350377997f36 Neil Armstrong        2023-11-30   348  
d2350377997f36 Neil Armstrong        2023-11-30   349  		domain-idle-states {
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   350  			cluster_sleep_0: cluster-sleep-0 {
d2350377997f36 Neil Armstrong        2023-11-30   351  				compatible = "domain-idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   352  				arm,psci-suspend-param = <0x41000044>;
d2350377997f36 Neil Armstrong        2023-11-30   353  				entry-latency-us = <750>;
d2350377997f36 Neil Armstrong        2023-11-30   354  				exit-latency-us = <2350>;
d2350377997f36 Neil Armstrong        2023-11-30   355  				min-residency-us = <9144>;
d2350377997f36 Neil Armstrong        2023-11-30   356  			};
d2350377997f36 Neil Armstrong        2023-11-30   357  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   358  			cluster_sleep_1: cluster-sleep-1 {
d2350377997f36 Neil Armstrong        2023-11-30   359  				compatible = "domain-idle-state";
d2350377997f36 Neil Armstrong        2023-11-30   360  				arm,psci-suspend-param = <0x4100c344>;
d2350377997f36 Neil Armstrong        2023-11-30   361  				entry-latency-us = <2800>;
d2350377997f36 Neil Armstrong        2023-11-30   362  				exit-latency-us = <4400>;
d2350377997f36 Neil Armstrong        2023-11-30   363  				min-residency-us = <10150>;
d2350377997f36 Neil Armstrong        2023-11-30   364  			};
d2350377997f36 Neil Armstrong        2023-11-30   365  		};
d2350377997f36 Neil Armstrong        2023-11-30   366  	};
d2350377997f36 Neil Armstrong        2023-11-30   367  
256e6937e48a14 Yuanfang Zhang        2025-01-07   368  	ete0 {
256e6937e48a14 Yuanfang Zhang        2025-01-07   369  		compatible = "arm,embedded-trace-extension";
256e6937e48a14 Yuanfang Zhang        2025-01-07   370  
256e6937e48a14 Yuanfang Zhang        2025-01-07   371  		cpu = <&cpu0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   372  
256e6937e48a14 Yuanfang Zhang        2025-01-07   373  		out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07   374  			port {
256e6937e48a14 Yuanfang Zhang        2025-01-07   375  				ete0_out_funnel_ete: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07   376  					remote-endpoint = <&funnel_ete_in_ete0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   377  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07   378  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07   379  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07   380  	};
256e6937e48a14 Yuanfang Zhang        2025-01-07   381  
256e6937e48a14 Yuanfang Zhang        2025-01-07   382  	funnel-ete {
256e6937e48a14 Yuanfang Zhang        2025-01-07   383  		compatible = "arm,coresight-static-funnel";
256e6937e48a14 Yuanfang Zhang        2025-01-07   384  
256e6937e48a14 Yuanfang Zhang        2025-01-07   385  		in-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07   386  			port {
256e6937e48a14 Yuanfang Zhang        2025-01-07   387  				funnel_ete_in_ete0: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07   388  					remote-endpoint = <&ete0_out_funnel_ete>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   389  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07   390  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07   391  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07   392  
256e6937e48a14 Yuanfang Zhang        2025-01-07   393  		out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07   394  			port {
256e6937e48a14 Yuanfang Zhang        2025-01-07   395  				funnel_ete_out_funnel_apss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07   396  					remote-endpoint = <&funnel_apss_in_funnel_ete>;
256e6937e48a14 Yuanfang Zhang        2025-01-07   397  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07   398  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07   399  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07   400  	};
256e6937e48a14 Yuanfang Zhang        2025-01-07   401  
d2350377997f36 Neil Armstrong        2023-11-30   402  	firmware {
d2350377997f36 Neil Armstrong        2023-11-30   403  		scm: scm {
d2350377997f36 Neil Armstrong        2023-11-30   404  			compatible = "qcom,scm-sm8650", "qcom,scm";
49e950487b3e55 Mukesh Ojha           2024-05-17   405  			qcom,dload-mode = <&tcsr 0x19000>;
10e02467129518 Neil Armstrong        2023-11-30   406  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   407  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
d2350377997f36 Neil Armstrong        2023-11-30   408  		};
d2350377997f36 Neil Armstrong        2023-11-30   409  	};
d2350377997f36 Neil Armstrong        2023-11-30   410  
10e02467129518 Neil Armstrong        2023-11-30   411  	clk_virt: interconnect-0 {
10e02467129518 Neil Armstrong        2023-11-30   412  		compatible = "qcom,sm8650-clk-virt";
10e02467129518 Neil Armstrong        2023-11-30   413  		#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   414  		qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30   415  	};
10e02467129518 Neil Armstrong        2023-11-30   416  
10e02467129518 Neil Armstrong        2023-11-30   417  	mc_virt: interconnect-1 {
10e02467129518 Neil Armstrong        2023-11-30   418  		compatible = "qcom,sm8650-mc-virt";
10e02467129518 Neil Armstrong        2023-11-30   419  		#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   420  		qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30   421  	};
10e02467129518 Neil Armstrong        2023-11-30   422  
d2350377997f36 Neil Armstrong        2023-11-30   423  	memory@a0000000 {
d2350377997f36 Neil Armstrong        2023-11-30   424  		device_type = "memory";
d2350377997f36 Neil Armstrong        2023-11-30   425  		/* We expect the bootloader to fill in the size */
d2350377997f36 Neil Armstrong        2023-11-30   426  		reg = <0 0xa0000000 0 0>;
d2350377997f36 Neil Armstrong        2023-11-30   427  	};
d2350377997f36 Neil Armstrong        2023-11-30   428  
c8a346e408cb2e Rob Herring (Arm      2024-04-17   429) 	pmu-a520 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   430) 		compatible = "arm,cortex-a520-pmu";
c8a346e408cb2e Rob Herring (Arm      2024-04-17   431) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17   432) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17   433) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17   434) 	pmu-a720 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   435) 		compatible = "arm,cortex-a720-pmu";
c8a346e408cb2e Rob Herring (Arm      2024-04-17   436) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17   437) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17   438) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17   439) 	pmu-x4 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   440) 		compatible = "arm,cortex-x4-pmu";
d2350377997f36 Neil Armstrong        2023-11-30   441  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
d2350377997f36 Neil Armstrong        2023-11-30   442  	};
d2350377997f36 Neil Armstrong        2023-11-30   443  
d2350377997f36 Neil Armstrong        2023-11-30   444  	psci {
d2350377997f36 Neil Armstrong        2023-11-30   445  		compatible = "arm,psci-1.0";
d2350377997f36 Neil Armstrong        2023-11-30   446  		method = "smc";
d2350377997f36 Neil Armstrong        2023-11-30   447  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   448  		cpu_pd0: power-domain-cpu0 {
d2350377997f36 Neil Armstrong        2023-11-30   449  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   450  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   451  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   452  		};
d2350377997f36 Neil Armstrong        2023-11-30   453  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   454  		cpu_pd1: power-domain-cpu1 {
d2350377997f36 Neil Armstrong        2023-11-30   455  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   456  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   457  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   458  		};
d2350377997f36 Neil Armstrong        2023-11-30   459  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   460  		cpu_pd2: power-domain-cpu2 {
d2350377997f36 Neil Armstrong        2023-11-30   461  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   462  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   463  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   464  		};
d2350377997f36 Neil Armstrong        2023-11-30   465  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   466  		cpu_pd3: power-domain-cpu3 {
d2350377997f36 Neil Armstrong        2023-11-30   467  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   468  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   469  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   470  		};
d2350377997f36 Neil Armstrong        2023-11-30   471  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   472  		cpu_pd4: power-domain-cpu4 {
d2350377997f36 Neil Armstrong        2023-11-30   473  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   474  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   475  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   476  		};
d2350377997f36 Neil Armstrong        2023-11-30   477  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   478  		cpu_pd5: power-domain-cpu5 {
d2350377997f36 Neil Armstrong        2023-11-30   479  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   480  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   481  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   482  		};
d2350377997f36 Neil Armstrong        2023-11-30   483  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   484  		cpu_pd6: power-domain-cpu6 {
d2350377997f36 Neil Armstrong        2023-11-30   485  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   486  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   487  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   488  		};
d2350377997f36 Neil Armstrong        2023-11-30   489  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   490  		cpu_pd7: power-domain-cpu7 {
d2350377997f36 Neil Armstrong        2023-11-30   491  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   492  			power-domains = <&cluster_pd>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   493  			domain-idle-states = <&gold_plus_cpu_sleep_0>;
d2350377997f36 Neil Armstrong        2023-11-30   494  		};
d2350377997f36 Neil Armstrong        2023-11-30   495  
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   496  		cluster_pd: power-domain-cluster {
d2350377997f36 Neil Armstrong        2023-11-30   497  			#power-domain-cells = <0>;
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   498  			domain-idle-states = <&cluster_sleep_0>,
20eb2057b3e46f Krzysztof Kozlowski   2024-10-22   499  					     <&cluster_sleep_1>;
d2350377997f36 Neil Armstrong        2023-11-30   500  		};
d2350377997f36 Neil Armstrong        2023-11-30   501  	};
d2350377997f36 Neil Armstrong        2023-11-30   502  
d2350377997f36 Neil Armstrong        2023-11-30   503  	reserved_memory: reserved-memory {
d2350377997f36 Neil Armstrong        2023-11-30   504  		#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   505  		#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   506  		ranges;
d2350377997f36 Neil Armstrong        2023-11-30   507  
d2350377997f36 Neil Armstrong        2023-11-30   508  		hyp_mem: hyp@80000000 {
d2350377997f36 Neil Armstrong        2023-11-30   509  			reg = <0 0x80000000 0 0xe00000>;
d2350377997f36 Neil Armstrong        2023-11-30   510  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   511  		};
d2350377997f36 Neil Armstrong        2023-11-30   512  
d2350377997f36 Neil Armstrong        2023-11-30   513  		cpusys_vm_mem: cpusys-vm@80e00000 {
d2350377997f36 Neil Armstrong        2023-11-30   514  			reg = <0 0x80e00000 0 0x400000>;
d2350377997f36 Neil Armstrong        2023-11-30   515  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   516  		};
d2350377997f36 Neil Armstrong        2023-11-30   517  
d2350377997f36 Neil Armstrong        2023-11-30   518  		/* Merged xbl_dtlog, xbl_ramdump and aop_image regions */
d2350377997f36 Neil Armstrong        2023-11-30   519  		xbl_dt_log_merged_mem: xbl-dt-log-merged@81a00000 {
d2350377997f36 Neil Armstrong        2023-11-30   520  			reg = <0 0x81a00000 0 0x260000>;
d2350377997f36 Neil Armstrong        2023-11-30   521  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   522  		};
d2350377997f36 Neil Armstrong        2023-11-30   523  
d2350377997f36 Neil Armstrong        2023-11-30   524  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
d2350377997f36 Neil Armstrong        2023-11-30   525  			compatible = "qcom,cmd-db";
d2350377997f36 Neil Armstrong        2023-11-30   526  			reg = <0 0x81c60000 0 0x20000>;
d2350377997f36 Neil Armstrong        2023-11-30   527  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   528  		};
d2350377997f36 Neil Armstrong        2023-11-30   529  
9b1e891179cacd Elliot Berman         2024-03-04   530  		/* Merged aop_config, tme_crash_dump, tme_log, uefi_log, and chipinfo regions */
d2350377997f36 Neil Armstrong        2023-11-30   531  		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
9b1e891179cacd Elliot Berman         2024-03-04   532  			reg = <0 0x81c80000 0 0x75000>;
d2350377997f36 Neil Armstrong        2023-11-30   533  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   534  		};
d2350377997f36 Neil Armstrong        2023-11-30   535  
d2350377997f36 Neil Armstrong        2023-11-30   536  		/* Secdata region can be reused by apps */
d2350377997f36 Neil Armstrong        2023-11-30   537  
d2350377997f36 Neil Armstrong        2023-11-30   538  		smem: smem@81d00000 {
d2350377997f36 Neil Armstrong        2023-11-30   539  			compatible = "qcom,smem";
d2350377997f36 Neil Armstrong        2023-11-30   540  			reg = <0 0x81d00000 0 0x200000>;
d2350377997f36 Neil Armstrong        2023-11-30   541  			hwlocks = <&tcsr_mutex 3>;
d2350377997f36 Neil Armstrong        2023-11-30   542  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   543  		};
d2350377997f36 Neil Armstrong        2023-11-30   544  
d2350377997f36 Neil Armstrong        2023-11-30   545  		adsp_mhi_mem: adsp-mhi@81f00000 {
d2350377997f36 Neil Armstrong        2023-11-30   546  			reg = <0 0x81f00000 0 0x20000>;
d2350377997f36 Neil Armstrong        2023-11-30   547  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   548  		};
d2350377997f36 Neil Armstrong        2023-11-30   549  
d2350377997f36 Neil Armstrong        2023-11-30   550  		pvmfw_mem: pvmfw@824a0000 {
d2350377997f36 Neil Armstrong        2023-11-30   551  			reg = <0 0x824a0000 0 0x100000>;
d2350377997f36 Neil Armstrong        2023-11-30   552  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   553  		};
d2350377997f36 Neil Armstrong        2023-11-30   554  
d2350377997f36 Neil Armstrong        2023-11-30   555  		global_sync_mem: global-sync@82600000 {
d2350377997f36 Neil Armstrong        2023-11-30   556  			reg = <0 0x82600000 0 0x100000>;
d2350377997f36 Neil Armstrong        2023-11-30   557  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   558  		};
d2350377997f36 Neil Armstrong        2023-11-30   559  
d2350377997f36 Neil Armstrong        2023-11-30   560  		tz_stat_mem: tz-stat@82700000 {
d2350377997f36 Neil Armstrong        2023-11-30   561  			reg = <0 0x82700000 0 0x100000>;
d2350377997f36 Neil Armstrong        2023-11-30   562  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   563  		};
d2350377997f36 Neil Armstrong        2023-11-30   564  
d2350377997f36 Neil Armstrong        2023-11-30   565  		qdss_mem: qdss@82800000 {
d2350377997f36 Neil Armstrong        2023-11-30   566  			reg = <0 0x82800000 0 0x2000000>;
d2350377997f36 Neil Armstrong        2023-11-30   567  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   568  		};
d2350377997f36 Neil Armstrong        2023-11-30   569  
af53ecef19ffab Neil Armstrong        2024-01-23   570  		qlink_logging_mem: qlink-logging@84800000 {
af53ecef19ffab Neil Armstrong        2024-01-23   571  			reg = <0 0x84800000 0 0x200000>;
af53ecef19ffab Neil Armstrong        2024-01-23   572  			no-map;
af53ecef19ffab Neil Armstrong        2024-01-23   573  		};
af53ecef19ffab Neil Armstrong        2024-01-23   574  
d2350377997f36 Neil Armstrong        2023-11-30   575  		mpss_dsm_mem: mpss-dsm@86b00000 {
d2350377997f36 Neil Armstrong        2023-11-30   576  			reg = <0 0x86b00000 0 0x4900000>;
d2350377997f36 Neil Armstrong        2023-11-30   577  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   578  		};
d2350377997f36 Neil Armstrong        2023-11-30   579  
d2350377997f36 Neil Armstrong        2023-11-30   580  		mpss_dsm_mem_2: mpss-dsm-2@8b400000 {
d2350377997f36 Neil Armstrong        2023-11-30   581  			reg = <0 0x8b400000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30   582  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   583  		};
d2350377997f36 Neil Armstrong        2023-11-30   584  
d2350377997f36 Neil Armstrong        2023-11-30   585  		mpss_mem: mpss@8bc00000 {
d2350377997f36 Neil Armstrong        2023-11-30   586  			reg = <0 0x8bc00000 0 0xf400000>;
d2350377997f36 Neil Armstrong        2023-11-30   587  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   588  		};
d2350377997f36 Neil Armstrong        2023-11-30   589  
d2350377997f36 Neil Armstrong        2023-11-30   590  		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
d2350377997f36 Neil Armstrong        2023-11-30   591  			reg = <0 0x9b000000 0 0x80000>;
d2350377997f36 Neil Armstrong        2023-11-30   592  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   593  		};
d2350377997f36 Neil Armstrong        2023-11-30   594  
d2350377997f36 Neil Armstrong        2023-11-30   595  		ipa_fw_mem: ipa-fw@9b080000 {
d2350377997f36 Neil Armstrong        2023-11-30   596  			reg = <0 0x9b080000 0 0x10000>;
d2350377997f36 Neil Armstrong        2023-11-30   597  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   598  		};
d2350377997f36 Neil Armstrong        2023-11-30   599  
d2350377997f36 Neil Armstrong        2023-11-30   600  		ipa_gsi_mem: ipa-gsi@9b090000 {
d2350377997f36 Neil Armstrong        2023-11-30   601  			reg = <0 0x9b090000 0 0xa000>;
d2350377997f36 Neil Armstrong        2023-11-30   602  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   603  		};
d2350377997f36 Neil Armstrong        2023-11-30   604  
d2350377997f36 Neil Armstrong        2023-11-30   605  		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
d2350377997f36 Neil Armstrong        2023-11-30   606  			reg = <0 0x9b09a000 0 0x2000>;
d2350377997f36 Neil Armstrong        2023-11-30   607  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   608  		};
d2350377997f36 Neil Armstrong        2023-11-30   609  
d2350377997f36 Neil Armstrong        2023-11-30   610  		spss_region_mem: spss@9b0a0000 {
d2350377997f36 Neil Armstrong        2023-11-30   611  			reg = <0 0x9b0a0000 0 0x1e0000>;
d2350377997f36 Neil Armstrong        2023-11-30   612  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   613  		};
d2350377997f36 Neil Armstrong        2023-11-30   614  
d2350377997f36 Neil Armstrong        2023-11-30   615  		/* First part of the "SPU secure shared memory" region */
d2350377997f36 Neil Armstrong        2023-11-30   616  		spu_tz_shared_mem: spu-tz-shared@9b280000 {
d2350377997f36 Neil Armstrong        2023-11-30   617  			reg = <0 0x9b280000 0 0x60000>;
d2350377997f36 Neil Armstrong        2023-11-30   618  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   619  		};
d2350377997f36 Neil Armstrong        2023-11-30   620  
d2350377997f36 Neil Armstrong        2023-11-30   621  		/* Second part of the "SPU secure shared memory" region */
d2350377997f36 Neil Armstrong        2023-11-30   622  		spu_modem_shared_mem: spu-modem-shared@9b2e0000 {
d2350377997f36 Neil Armstrong        2023-11-30   623  			reg = <0 0x9b2e0000 0 0x20000>;
d2350377997f36 Neil Armstrong        2023-11-30   624  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   625  		};
d2350377997f36 Neil Armstrong        2023-11-30   626  
d2350377997f36 Neil Armstrong        2023-11-30   627  		camera_mem: camera@9b300000 {
d2350377997f36 Neil Armstrong        2023-11-30   628  			reg = <0 0x9b300000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30   629  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   630  		};
d2350377997f36 Neil Armstrong        2023-11-30   631  
d2350377997f36 Neil Armstrong        2023-11-30   632  		video_mem: video@9bb00000 {
d2350377997f36 Neil Armstrong        2023-11-30   633  			reg = <0 0x9bb00000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30   634  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   635  		};
d2350377997f36 Neil Armstrong        2023-11-30   636  
d2350377997f36 Neil Armstrong        2023-11-30   637  		cvp_mem: cvp@9c300000 {
d2350377997f36 Neil Armstrong        2023-11-30   638  			reg = <0 0x9c300000 0 0x700000>;
d2350377997f36 Neil Armstrong        2023-11-30   639  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   640  		};
d2350377997f36 Neil Armstrong        2023-11-30   641  
d2350377997f36 Neil Armstrong        2023-11-30   642  		cdsp_mem: cdsp@9ca00000 {
d2350377997f36 Neil Armstrong        2023-11-30   643  			reg = <0 0x9ca00000 0 0x1400000>;
d2350377997f36 Neil Armstrong        2023-11-30   644  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   645  		};
d2350377997f36 Neil Armstrong        2023-11-30   646  
d2350377997f36 Neil Armstrong        2023-11-30   647  		q6_cdsp_dtb_mem: q6-cdsp-dtb@9de00000 {
d2350377997f36 Neil Armstrong        2023-11-30   648  			reg = <0 0x9de00000 0 0x80000>;
d2350377997f36 Neil Armstrong        2023-11-30   649  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   650  		};
d2350377997f36 Neil Armstrong        2023-11-30   651  
d2350377997f36 Neil Armstrong        2023-11-30   652  		q6_adsp_dtb_mem: q6-adsp-dtb@9de80000 {
d2350377997f36 Neil Armstrong        2023-11-30   653  			reg = <0 0x9de80000 0 0x80000>;
d2350377997f36 Neil Armstrong        2023-11-30   654  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   655  		};
d2350377997f36 Neil Armstrong        2023-11-30   656  
d2350377997f36 Neil Armstrong        2023-11-30   657  		adspslpi_mem: adspslpi@9df00000 {
d2350377997f36 Neil Armstrong        2023-11-30   658  			reg = <0 0x9df00000 0 0x4080000>;
d2350377997f36 Neil Armstrong        2023-11-30   659  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   660  		};
d2350377997f36 Neil Armstrong        2023-11-30   661  
d2350377997f36 Neil Armstrong        2023-11-30   662  		rmtfs_mem: rmtfs@d7c00000 {
d2350377997f36 Neil Armstrong        2023-11-30   663  			compatible = "qcom,rmtfs-mem";
d2350377997f36 Neil Armstrong        2023-11-30   664  			reg = <0 0xd7c00000 0 0x400000>;
d2350377997f36 Neil Armstrong        2023-11-30   665  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   666  
d2350377997f36 Neil Armstrong        2023-11-30   667  			qcom,client-id = <1>;
d2350377997f36 Neil Armstrong        2023-11-30   668  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
d2350377997f36 Neil Armstrong        2023-11-30   669  		};
d2350377997f36 Neil Armstrong        2023-11-30   670  
d2350377997f36 Neil Armstrong        2023-11-30   671  		/* Merged tz_reserved, xbl_sc, cpucp_fw and qtee regions */
d2350377997f36 Neil Armstrong        2023-11-30   672  		tz_merged_mem: tz-merged@d8000000 {
d2350377997f36 Neil Armstrong        2023-11-30   673  			reg = <0 0xd8000000 0 0x800000>;
d2350377997f36 Neil Armstrong        2023-11-30   674  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   675  		};
d2350377997f36 Neil Armstrong        2023-11-30   676  
d2350377997f36 Neil Armstrong        2023-11-30   677  		hwfence_shbuf: hwfence-shbuf@e6440000 {
d2350377997f36 Neil Armstrong        2023-11-30   678  			reg = <0 0xe6440000 0 0x2dd000>;
d2350377997f36 Neil Armstrong        2023-11-30   679  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   680  		};
d2350377997f36 Neil Armstrong        2023-11-30   681  
d2350377997f36 Neil Armstrong        2023-11-30   682  		trust_ui_vm_mem: trust-ui-vm@f3800000 {
d2350377997f36 Neil Armstrong        2023-11-30   683  			reg = <0 0xf3800000 0 0x4400000>;
d2350377997f36 Neil Armstrong        2023-11-30   684  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   685  		};
d2350377997f36 Neil Armstrong        2023-11-30   686  
d2350377997f36 Neil Armstrong        2023-11-30   687  		oem_vm_mem: oem-vm@f7c00000 {
d2350377997f36 Neil Armstrong        2023-11-30   688  			reg = <0 0xf7c00000 0 0x4c00000>;
d2350377997f36 Neil Armstrong        2023-11-30   689  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   690  		};
d2350377997f36 Neil Armstrong        2023-11-30   691  
d2350377997f36 Neil Armstrong        2023-11-30   692  		llcc_lpi_mem: llcc-lpi@ff800000 {
d2350377997f36 Neil Armstrong        2023-11-30   693  			reg = <0 0xff800000 0 0x600000>;
d2350377997f36 Neil Armstrong        2023-11-30   694  			no-map;
d2350377997f36 Neil Armstrong        2023-11-30   695  		};
d2350377997f36 Neil Armstrong        2023-11-30   696  	};
d2350377997f36 Neil Armstrong        2023-11-30   697  
10e02467129518 Neil Armstrong        2023-11-30   698  	smp2p-adsp {
10e02467129518 Neil Armstrong        2023-11-30   699  		compatible = "qcom,smp2p";
10e02467129518 Neil Armstrong        2023-11-30   700  
10e02467129518 Neil Armstrong        2023-11-30   701  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
10e02467129518 Neil Armstrong        2023-11-30   702  					     IPCC_MPROC_SIGNAL_SMP2P
10e02467129518 Neil Armstrong        2023-11-30   703  					     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30   704  
10e02467129518 Neil Armstrong        2023-11-30   705  		mboxes = <&ipcc IPCC_CLIENT_LPASS
10e02467129518 Neil Armstrong        2023-11-30   706  				IPCC_MPROC_SIGNAL_SMP2P>;
10e02467129518 Neil Armstrong        2023-11-30   707  
10e02467129518 Neil Armstrong        2023-11-30   708  		qcom,smem = <443>, <429>;
10e02467129518 Neil Armstrong        2023-11-30   709  		qcom,local-pid = <0>;
10e02467129518 Neil Armstrong        2023-11-30   710  		qcom,remote-pid = <2>;
10e02467129518 Neil Armstrong        2023-11-30   711  
10e02467129518 Neil Armstrong        2023-11-30   712  		smp2p_adsp_out: master-kernel {
10e02467129518 Neil Armstrong        2023-11-30   713  			qcom,entry-name = "master-kernel";
10e02467129518 Neil Armstrong        2023-11-30   714  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   715  		};
10e02467129518 Neil Armstrong        2023-11-30   716  
10e02467129518 Neil Armstrong        2023-11-30   717  		smp2p_adsp_in: slave-kernel {
10e02467129518 Neil Armstrong        2023-11-30   718  			qcom,entry-name = "slave-kernel";
10e02467129518 Neil Armstrong        2023-11-30   719  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30   720  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   721  		};
10e02467129518 Neil Armstrong        2023-11-30   722  	};
10e02467129518 Neil Armstrong        2023-11-30   723  
10e02467129518 Neil Armstrong        2023-11-30   724  	smp2p-cdsp {
10e02467129518 Neil Armstrong        2023-11-30   725  		compatible = "qcom,smp2p";
10e02467129518 Neil Armstrong        2023-11-30   726  
10e02467129518 Neil Armstrong        2023-11-30   727  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
10e02467129518 Neil Armstrong        2023-11-30   728  					     IPCC_MPROC_SIGNAL_SMP2P
10e02467129518 Neil Armstrong        2023-11-30   729  					     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30   730  
10e02467129518 Neil Armstrong        2023-11-30   731  		mboxes = <&ipcc IPCC_CLIENT_CDSP
10e02467129518 Neil Armstrong        2023-11-30   732  				IPCC_MPROC_SIGNAL_SMP2P>;
10e02467129518 Neil Armstrong        2023-11-30   733  
10e02467129518 Neil Armstrong        2023-11-30   734  		qcom,smem = <94>, <432>;
10e02467129518 Neil Armstrong        2023-11-30   735  		qcom,local-pid = <0>;
10e02467129518 Neil Armstrong        2023-11-30   736  		qcom,remote-pid = <5>;
10e02467129518 Neil Armstrong        2023-11-30   737  
10e02467129518 Neil Armstrong        2023-11-30   738  		smp2p_cdsp_out: master-kernel {
10e02467129518 Neil Armstrong        2023-11-30   739  			qcom,entry-name = "master-kernel";
10e02467129518 Neil Armstrong        2023-11-30   740  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   741  		};
10e02467129518 Neil Armstrong        2023-11-30   742  
10e02467129518 Neil Armstrong        2023-11-30   743  		smp2p_cdsp_in: slave-kernel {
10e02467129518 Neil Armstrong        2023-11-30   744  			qcom,entry-name = "slave-kernel";
10e02467129518 Neil Armstrong        2023-11-30   745  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30   746  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   747  		};
10e02467129518 Neil Armstrong        2023-11-30   748  	};
10e02467129518 Neil Armstrong        2023-11-30   749  
10e02467129518 Neil Armstrong        2023-11-30   750  	smp2p-modem {
10e02467129518 Neil Armstrong        2023-11-30   751  		compatible = "qcom,smp2p";
10e02467129518 Neil Armstrong        2023-11-30   752  
10e02467129518 Neil Armstrong        2023-11-30   753  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30   754  					     IPCC_MPROC_SIGNAL_SMP2P
10e02467129518 Neil Armstrong        2023-11-30   755  					     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30   756  
10e02467129518 Neil Armstrong        2023-11-30   757  		mboxes = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30   758  				IPCC_MPROC_SIGNAL_SMP2P>;
10e02467129518 Neil Armstrong        2023-11-30   759  
10e02467129518 Neil Armstrong        2023-11-30   760  		qcom,smem = <435>, <428>;
10e02467129518 Neil Armstrong        2023-11-30   761  		qcom,local-pid = <0>;
10e02467129518 Neil Armstrong        2023-11-30   762  		qcom,remote-pid = <1>;
10e02467129518 Neil Armstrong        2023-11-30   763  
10e02467129518 Neil Armstrong        2023-11-30   764  		smp2p_modem_out: master-kernel {
10e02467129518 Neil Armstrong        2023-11-30   765  			qcom,entry-name = "master-kernel";
10e02467129518 Neil Armstrong        2023-11-30   766  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   767  		};
10e02467129518 Neil Armstrong        2023-11-30   768  
10e02467129518 Neil Armstrong        2023-11-30   769  		smp2p_modem_in: slave-kernel {
10e02467129518 Neil Armstrong        2023-11-30   770  			qcom,entry-name = "slave-kernel";
10e02467129518 Neil Armstrong        2023-11-30   771  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30   772  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   773  		};
10e02467129518 Neil Armstrong        2023-11-30   774  
10e02467129518 Neil Armstrong        2023-11-30   775  		ipa_smp2p_out: ipa-ap-to-modem {
10e02467129518 Neil Armstrong        2023-11-30   776  			qcom,entry-name = "ipa";
10e02467129518 Neil Armstrong        2023-11-30   777  			#qcom,smem-state-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   778  		};
10e02467129518 Neil Armstrong        2023-11-30   779  
10e02467129518 Neil Armstrong        2023-11-30   780  		ipa_smp2p_in: ipa-modem-to-ap {
10e02467129518 Neil Armstrong        2023-11-30   781  			qcom,entry-name = "ipa";
10e02467129518 Neil Armstrong        2023-11-30   782  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30   783  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30   784  		};
10e02467129518 Neil Armstrong        2023-11-30   785  	};
10e02467129518 Neil Armstrong        2023-11-30   786  
d2350377997f36 Neil Armstrong        2023-11-30   787  	soc: soc@0 {
d2350377997f36 Neil Armstrong        2023-11-30   788  		compatible = "simple-bus";
d2350377997f36 Neil Armstrong        2023-11-30   789  
d2350377997f36 Neil Armstrong        2023-11-30   790  		#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   791  		#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   792  		dma-ranges = <0 0 0 0 0x10 0>;
d2350377997f36 Neil Armstrong        2023-11-30   793  		ranges = <0 0 0 0 0x10 0>;
d2350377997f36 Neil Armstrong        2023-11-30   794  
d2350377997f36 Neil Armstrong        2023-11-30   795  		gcc: clock-controller@100000 {
d2350377997f36 Neil Armstrong        2023-11-30   796  			compatible = "qcom,sm8650-gcc";
d2350377997f36 Neil Armstrong        2023-11-30   797  			reg = <0 0x00100000 0 0x1f4200>;
d2350377997f36 Neil Armstrong        2023-11-30   798  
d2350377997f36 Neil Armstrong        2023-11-30   799  			clocks = <&bi_tcxo_div2>,
d2350377997f36 Neil Armstrong        2023-11-30   800  				 <&bi_tcxo_ao_div2>,
d2350377997f36 Neil Armstrong        2023-11-30   801  				 <&sleep_clk>,
10e02467129518 Neil Armstrong        2023-11-30   802  				 <&pcie0_phy>,
d00b42f170dfa4 Neil Armstrong        2024-05-02   803  				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
d00b42f170dfa4 Neil Armstrong        2024-05-02   804  				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30   805  				 <&ufs_mem_phy 0>,
10e02467129518 Neil Armstrong        2023-11-30   806  				 <&ufs_mem_phy 1>,
10e02467129518 Neil Armstrong        2023-11-30   807  				 <&ufs_mem_phy 2>,
10e02467129518 Neil Armstrong        2023-11-30   808  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30   809  
d2350377997f36 Neil Armstrong        2023-11-30   810  			#clock-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30   811  			#reset-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30   812  			#power-domain-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30   813  		};
d2350377997f36 Neil Armstrong        2023-11-30   814  
d2350377997f36 Neil Armstrong        2023-11-30   815  		ipcc: mailbox@406000 {
d2350377997f36 Neil Armstrong        2023-11-30   816  			compatible = "qcom,sm8650-ipcc", "qcom,ipcc";
d2350377997f36 Neil Armstrong        2023-11-30   817  			reg = <0 0x00406000 0 0x1000>;
d2350377997f36 Neil Armstrong        2023-11-30   818  
d2350377997f36 Neil Armstrong        2023-11-30   819  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30   820  			interrupt-controller;
d2350377997f36 Neil Armstrong        2023-11-30   821  			#interrupt-cells = <3>;
d2350377997f36 Neil Armstrong        2023-11-30   822  
d2350377997f36 Neil Armstrong        2023-11-30   823  			#mbox-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   824  		};
d2350377997f36 Neil Armstrong        2023-11-30   825  
d2350377997f36 Neil Armstrong        2023-11-30   826  		gpi_dma2: dma-controller@800000 {
d2350377997f36 Neil Armstrong        2023-11-30   827  			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
d2350377997f36 Neil Armstrong        2023-11-30   828  			reg = <0 0x00800000 0 0x60000>;
d2350377997f36 Neil Armstrong        2023-11-30   829  
d2350377997f36 Neil Armstrong        2023-11-30   830  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   831  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   832  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   833  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   834  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   835  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   836  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   837  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   838  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   839  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   840  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f36 Neil Armstrong        2023-11-30   841  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30   842  
d2350377997f36 Neil Armstrong        2023-11-30   843  			dma-channels = <12>;
d2350377997f36 Neil Armstrong        2023-11-30   844  			dma-channel-mask = <0x3f>;
d2350377997f36 Neil Armstrong        2023-11-30   845  			#dma-cells = <3>;
d2350377997f36 Neil Armstrong        2023-11-30   846  
d2350377997f36 Neil Armstrong        2023-11-30   847  			iommus = <&apps_smmu 0x436 0>;
d2350377997f36 Neil Armstrong        2023-11-30   848  
d2350377997f36 Neil Armstrong        2023-11-30   849  			dma-coherent;
d2350377997f36 Neil Armstrong        2023-11-30   850  
d2350377997f36 Neil Armstrong        2023-11-30   851  			status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30   852  		};
d2350377997f36 Neil Armstrong        2023-11-30   853  
d2350377997f36 Neil Armstrong        2023-11-30   854  		qupv3_id_1: geniqup@8c0000 {
d2350377997f36 Neil Armstrong        2023-11-30   855  			compatible = "qcom,geni-se-qup";
d2350377997f36 Neil Armstrong        2023-11-30   856  			reg = <0 0x008c0000 0 0x2000>;
d2350377997f36 Neil Armstrong        2023-11-30   857  
d2350377997f36 Neil Armstrong        2023-11-30   858  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
d2350377997f36 Neil Armstrong        2023-11-30   859  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30   860  			clock-names = "m-ahb",
d2350377997f36 Neil Armstrong        2023-11-30   861  				      "s-ahb";
d2350377997f36 Neil Armstrong        2023-11-30   862  
d2350377997f36 Neil Armstrong        2023-11-30   863  			iommus = <&apps_smmu 0x423 0>;
d2350377997f36 Neil Armstrong        2023-11-30   864  
d2350377997f36 Neil Armstrong        2023-11-30   865  			dma-coherent;
d2350377997f36 Neil Armstrong        2023-11-30   866  
d2350377997f36 Neil Armstrong        2023-11-30   867  			#address-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   868  			#size-cells = <2>;
d2350377997f36 Neil Armstrong        2023-11-30   869  			ranges;
d2350377997f36 Neil Armstrong        2023-11-30   870  
d2350377997f36 Neil Armstrong        2023-11-30   871  			status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30   872  
10e02467129518 Neil Armstrong        2023-11-30   873  			i2c8: i2c@880000 {
10e02467129518 Neil Armstrong        2023-11-30   874  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30   875  				reg = <0 0x00880000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30   876  
10e02467129518 Neil Armstrong        2023-11-30   877  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30   878  
10e02467129518 Neil Armstrong        2023-11-30   879  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
d2350377997f36 Neil Armstrong        2023-11-30   880  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30   881  
10e02467129518 Neil Armstrong        2023-11-30   882  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   883  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   884  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   885  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   886  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   887  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30   888  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30   889  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30   890  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30   891  
10e02467129518 Neil Armstrong        2023-11-30   892  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30   893  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30   894  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30   895  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30   896  
10e02467129518 Neil Armstrong        2023-11-30   897  				pinctrl-0 = <&qup_i2c8_data_clk>;
d2350377997f36 Neil Armstrong        2023-11-30   898  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30   899  
10e02467129518 Neil Armstrong        2023-11-30   900  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   901  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30   902  
d2350377997f36 Neil Armstrong        2023-11-30   903  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30   904  			};
d2350377997f36 Neil Armstrong        2023-11-30   905  
10e02467129518 Neil Armstrong        2023-11-30   906  			spi8: spi@880000 {
10e02467129518 Neil Armstrong        2023-11-30   907  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30   908  				reg = <0 0x00880000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30   909  
10e02467129518 Neil Armstrong        2023-11-30   910  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30   911  
10e02467129518 Neil Armstrong        2023-11-30   912  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
10e02467129518 Neil Armstrong        2023-11-30   913  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30   914  
10e02467129518 Neil Armstrong        2023-11-30   915  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   916  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   917  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   918  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   919  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   920  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30   921  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30   922  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30   923  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30   924  
10e02467129518 Neil Armstrong        2023-11-30   925  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30   926  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30   927  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30   928  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30   929  
10e02467129518 Neil Armstrong        2023-11-30   930  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
10e02467129518 Neil Armstrong        2023-11-30   931  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30   932  
10e02467129518 Neil Armstrong        2023-11-30   933  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   934  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30   935  
d2350377997f36 Neil Armstrong        2023-11-30   936  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30   937  			};
d2350377997f36 Neil Armstrong        2023-11-30   938  
10e02467129518 Neil Armstrong        2023-11-30   939  			i2c9: i2c@884000 {
10e02467129518 Neil Armstrong        2023-11-30   940  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30   941  				reg = <0 0x00884000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30   942  
10e02467129518 Neil Armstrong        2023-11-30   943  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30   944  
10e02467129518 Neil Armstrong        2023-11-30   945  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30   946  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30   947  
10e02467129518 Neil Armstrong        2023-11-30   948  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   949  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   950  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   951  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   952  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   953  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30   954  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30   955  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30   956  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30   957  
10e02467129518 Neil Armstrong        2023-11-30   958  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30   959  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30   960  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30   961  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30   962  
10e02467129518 Neil Armstrong        2023-11-30   963  				pinctrl-0 = <&qup_i2c9_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30   964  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30   965  
10e02467129518 Neil Armstrong        2023-11-30   966  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30   967  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30   968  
10e02467129518 Neil Armstrong        2023-11-30   969  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30   970  			};
d2350377997f36 Neil Armstrong        2023-11-30   971  
10e02467129518 Neil Armstrong        2023-11-30   972  			spi9: spi@884000 {
10e02467129518 Neil Armstrong        2023-11-30   973  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30   974  				reg = <0 0x00884000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30   975  
10e02467129518 Neil Armstrong        2023-11-30   976  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30   977  
10e02467129518 Neil Armstrong        2023-11-30   978  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30   979  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30   980  
10e02467129518 Neil Armstrong        2023-11-30   981  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   982  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   983  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   984  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30   985  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30   986  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30   987  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30   988  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30   989  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30   990  
10e02467129518 Neil Armstrong        2023-11-30   991  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30   992  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30   993  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30   994  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30   995  
10e02467129518 Neil Armstrong        2023-11-30   996  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
10e02467129518 Neil Armstrong        2023-11-30   997  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30   998  
10e02467129518 Neil Armstrong        2023-11-30   999  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1000  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  1001  
10e02467129518 Neil Armstrong        2023-11-30  1002  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  1003  			};
d2350377997f36 Neil Armstrong        2023-11-30  1004  
10e02467129518 Neil Armstrong        2023-11-30  1005  			i2c10: i2c@888000 {
10e02467129518 Neil Armstrong        2023-11-30  1006  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1007  				reg = <0 0x00888000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  1008  
10e02467129518 Neil Armstrong        2023-11-30  1009  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30  1010  
10e02467129518 Neil Armstrong        2023-11-30  1011  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1012  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  1013  
10e02467129518 Neil Armstrong        2023-11-30  1014  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1015  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1016  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1017  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1018  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1019  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1020  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1021  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1022  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1023  
10e02467129518 Neil Armstrong        2023-11-30  1024  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1025  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1026  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1027  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1028  
10e02467129518 Neil Armstrong        2023-11-30  1029  				pinctrl-0 = <&qup_i2c10_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1030  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1031  
10e02467129518 Neil Armstrong        2023-11-30  1032  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1033  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  1034  
d2350377997f36 Neil Armstrong        2023-11-30  1035  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  1036  			};
d2350377997f36 Neil Armstrong        2023-11-30  1037  
10e02467129518 Neil Armstrong        2023-11-30  1038  			spi10: spi@888000 {
10e02467129518 Neil Armstrong        2023-11-30  1039  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1040  				reg = <0 0x00888000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  1041  
10e02467129518 Neil Armstrong        2023-11-30  1042  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30  1043  
10e02467129518 Neil Armstrong        2023-11-30  1044  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1045  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  1046  
10e02467129518 Neil Armstrong        2023-11-30  1047  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1048  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1049  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1050  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1051  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1052  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1053  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1054  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1055  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1056  
10e02467129518 Neil Armstrong        2023-11-30  1057  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1058  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1059  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1060  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1061  
10e02467129518 Neil Armstrong        2023-11-30  1062  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1063  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1064  
10e02467129518 Neil Armstrong        2023-11-30  1065  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1066  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  1067  
d2350377997f36 Neil Armstrong        2023-11-30  1068  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  1069  			};
d2350377997f36 Neil Armstrong        2023-11-30  1070  
10e02467129518 Neil Armstrong        2023-11-30  1071  			i2c11: i2c@88c000 {
10e02467129518 Neil Armstrong        2023-11-30  1072  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1073  				reg = <0 0x0088c000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  1074  
10e02467129518 Neil Armstrong        2023-11-30  1075  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30  1076  
10e02467129518 Neil Armstrong        2023-11-30  1077  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1078  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  1079  
10e02467129518 Neil Armstrong        2023-11-30  1080  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1081  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1082  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1083  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1084  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1085  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1086  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1087  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1088  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1089  
10e02467129518 Neil Armstrong        2023-11-30  1090  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1091  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1092  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1093  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1094  
10e02467129518 Neil Armstrong        2023-11-30  1095  				pinctrl-0 = <&qup_i2c11_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1096  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  1097  
10e02467129518 Neil Armstrong        2023-11-30  1098  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1099  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  1100  
d2350377997f36 Neil Armstrong        2023-11-30  1101  				status = "disabled";
d2350377997f36 Neil Armstrong        2023-11-30  1102  			};
d2350377997f36 Neil Armstrong        2023-11-30  1103  
10e02467129518 Neil Armstrong        2023-11-30  1104  			spi11: spi@88c000 {
10e02467129518 Neil Armstrong        2023-11-30  1105  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1106  				reg = <0 0x0088c000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  1107  
10e02467129518 Neil Armstrong        2023-11-30  1108  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30  1109  
10e02467129518 Neil Armstrong        2023-11-30  1110  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1111  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  1112  
10e02467129518 Neil Armstrong        2023-11-30  1113  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1114  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1115  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1116  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1117  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1118  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1119  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1120  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1121  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1122  
10e02467129518 Neil Armstrong        2023-11-30  1123  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1124  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1125  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1126  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1127  
10e02467129518 Neil Armstrong        2023-11-30  1128  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1129  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  1130  
10e02467129518 Neil Armstrong        2023-11-30  1131  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1132  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  1133  
10e02467129518 Neil Armstrong        2023-11-30  1134  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1135  			};
d2350377997f36 Neil Armstrong        2023-11-30  1136  
10e02467129518 Neil Armstrong        2023-11-30  1137  			i2c12: i2c@890000 {
10e02467129518 Neil Armstrong        2023-11-30  1138  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1139  				reg = <0 0x00890000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1140  
10e02467129518 Neil Armstrong        2023-11-30  1141  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1142  
10e02467129518 Neil Armstrong        2023-11-30  1143  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1144  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1145  
10e02467129518 Neil Armstrong        2023-11-30  1146  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1147  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1148  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1149  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1150  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1151  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1152  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1153  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1154  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1155  
10e02467129518 Neil Armstrong        2023-11-30  1156  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1157  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1158  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1159  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1160  
10e02467129518 Neil Armstrong        2023-11-30  1161  				pinctrl-0 = <&qup_i2c12_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1162  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1163  
10e02467129518 Neil Armstrong        2023-11-30  1164  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1165  				#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  1166  
d2350377997f36 Neil Armstrong        2023-11-30  1167  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1168  			};
d2350377997f36 Neil Armstrong        2023-11-30  1169  
10e02467129518 Neil Armstrong        2023-11-30  1170  			spi12: spi@890000 {
10e02467129518 Neil Armstrong        2023-11-30  1171  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1172  				reg = <0 0x00890000 0 0x4000>;
d2350377997f36 Neil Armstrong        2023-11-30  1173  
10e02467129518 Neil Armstrong        2023-11-30  1174  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f36 Neil Armstrong        2023-11-30  1175  
10e02467129518 Neil Armstrong        2023-11-30  1176  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1177  				clock-names = "se";
d2350377997f36 Neil Armstrong        2023-11-30  1178  
10e02467129518 Neil Armstrong        2023-11-30  1179  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1180  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1181  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1182  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1183  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1184  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1185  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1186  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1187  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1188  
10e02467129518 Neil Armstrong        2023-11-30  1189  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1190  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1191  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1192  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1193  
10e02467129518 Neil Armstrong        2023-11-30  1194  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1195  				pinctrl-names = "default";
d2350377997f36 Neil Armstrong        2023-11-30  1196  
10e02467129518 Neil Armstrong        2023-11-30  1197  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1198  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1199  
10e02467129518 Neil Armstrong        2023-11-30  1200  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1201  			};
10e02467129518 Neil Armstrong        2023-11-30  1202  
10e02467129518 Neil Armstrong        2023-11-30  1203  			i2c13: i2c@894000 {
10e02467129518 Neil Armstrong        2023-11-30  1204  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1205  				reg = <0 0x00894000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1206  
10e02467129518 Neil Armstrong        2023-11-30  1207  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1208  
10e02467129518 Neil Armstrong        2023-11-30  1209  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1210  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1211  
10e02467129518 Neil Armstrong        2023-11-30  1212  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1213  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1214  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1215  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1216  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1217  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1218  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1219  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1220  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1221  
10e02467129518 Neil Armstrong        2023-11-30  1222  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1223  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1224  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1225  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1226  
10e02467129518 Neil Armstrong        2023-11-30  1227  				pinctrl-0 = <&qup_i2c13_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1228  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1229  
10e02467129518 Neil Armstrong        2023-11-30  1230  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1231  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1232  
10e02467129518 Neil Armstrong        2023-11-30  1233  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1234  			};
10e02467129518 Neil Armstrong        2023-11-30  1235  
10e02467129518 Neil Armstrong        2023-11-30  1236  			spi13: spi@894000 {
10e02467129518 Neil Armstrong        2023-11-30  1237  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1238  				reg = <0 0x00894000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1239  
10e02467129518 Neil Armstrong        2023-11-30  1240  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1241  
10e02467129518 Neil Armstrong        2023-11-30  1242  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1243  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1244  
10e02467129518 Neil Armstrong        2023-11-30  1245  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1246  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1247  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1248  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1249  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1250  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1251  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1252  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1253  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1254  
10e02467129518 Neil Armstrong        2023-11-30  1255  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1256  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1257  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1258  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1259  
10e02467129518 Neil Armstrong        2023-11-30  1260  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1261  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1262  
10e02467129518 Neil Armstrong        2023-11-30  1263  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1264  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1265  
10e02467129518 Neil Armstrong        2023-11-30  1266  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1267  			};
10e02467129518 Neil Armstrong        2023-11-30  1268  
10e02467129518 Neil Armstrong        2023-11-30  1269  			uart14: serial@898000 {
10e02467129518 Neil Armstrong        2023-11-30  1270  				compatible = "qcom,geni-uart";
10e02467129518 Neil Armstrong        2023-11-30  1271  				reg = <0 0x00898000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1272  
10e02467129518 Neil Armstrong        2023-11-30  1273  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1274  
10e02467129518 Neil Armstrong        2023-11-30  1275  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1276  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1277  
10e02467129518 Neil Armstrong        2023-11-30  1278  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1279  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1280  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1281  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1282  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1283  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1284  
10e02467129518 Neil Armstrong        2023-11-30  1285  				pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
10e02467129518 Neil Armstrong        2023-11-30  1286  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1287  
10e02467129518 Neil Armstrong        2023-11-30  1288  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1289  			};
10e02467129518 Neil Armstrong        2023-11-30  1290  
10e02467129518 Neil Armstrong        2023-11-30  1291  			uart15: serial@89c000 {
10e02467129518 Neil Armstrong        2023-11-30  1292  				compatible = "qcom,geni-debug-uart";
10e02467129518 Neil Armstrong        2023-11-30  1293  				reg = <0 0x0089c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1294  
10e02467129518 Neil Armstrong        2023-11-30  1295  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1296  
10e02467129518 Neil Armstrong        2023-11-30  1297  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1298  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1299  
10e02467129518 Neil Armstrong        2023-11-30  1300  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1301  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1302  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1303  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1304  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1305  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1306  
10e02467129518 Neil Armstrong        2023-11-30  1307  				pinctrl-0 = <&qup_uart15_default>;
10e02467129518 Neil Armstrong        2023-11-30  1308  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1309  
10e02467129518 Neil Armstrong        2023-11-30  1310  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1311  			};
10e02467129518 Neil Armstrong        2023-11-30  1312  		};
10e02467129518 Neil Armstrong        2023-11-30  1313  
10e02467129518 Neil Armstrong        2023-11-30  1314  		i2c_master_hub_0: geniqup@9c0000 {
10e02467129518 Neil Armstrong        2023-11-30  1315  			compatible = "qcom,geni-se-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1316  			reg = <0 0x009c0000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  1317  
10e02467129518 Neil Armstrong        2023-11-30  1318  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1319  			clock-names = "s-ahb";
10e02467129518 Neil Armstrong        2023-11-30  1320  
10e02467129518 Neil Armstrong        2023-11-30  1321  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1322  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1323  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  1324  
10e02467129518 Neil Armstrong        2023-11-30  1325  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1326  
10e02467129518 Neil Armstrong        2023-11-30  1327  			i2c_hub_0: i2c@980000 {
10e02467129518 Neil Armstrong        2023-11-30  1328  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1329  				reg = <0 0x00980000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1330  
10e02467129518 Neil Armstrong        2023-11-30  1331  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1332  
10e02467129518 Neil Armstrong        2023-11-30  1333  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1334  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1335  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1336  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1337  
10e02467129518 Neil Armstrong        2023-11-30  1338  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1339  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1340  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1341  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1342  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1343  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1344  
10e02467129518 Neil Armstrong        2023-11-30  1345  				pinctrl-0 = <&hub_i2c0_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1346  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1347  
10e02467129518 Neil Armstrong        2023-11-30  1348  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1349  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1350  
10e02467129518 Neil Armstrong        2023-11-30  1351  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1352  			};
10e02467129518 Neil Armstrong        2023-11-30  1353  
10e02467129518 Neil Armstrong        2023-11-30  1354  			i2c_hub_1: i2c@984000 {
10e02467129518 Neil Armstrong        2023-11-30  1355  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1356  				reg = <0 0x00984000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1357  
10e02467129518 Neil Armstrong        2023-11-30  1358  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1359  
10e02467129518 Neil Armstrong        2023-11-30  1360  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1361  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1362  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1363  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1364  
10e02467129518 Neil Armstrong        2023-11-30  1365  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1366  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1367  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1368  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1369  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1370  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1371  
10e02467129518 Neil Armstrong        2023-11-30  1372  				pinctrl-0 = <&hub_i2c1_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1373  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1374  
10e02467129518 Neil Armstrong        2023-11-30  1375  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1376  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1377  
10e02467129518 Neil Armstrong        2023-11-30  1378  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1379  			};
10e02467129518 Neil Armstrong        2023-11-30  1380  
10e02467129518 Neil Armstrong        2023-11-30  1381  			i2c_hub_2: i2c@988000 {
10e02467129518 Neil Armstrong        2023-11-30  1382  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1383  				reg = <0 0x00988000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1384  
10e02467129518 Neil Armstrong        2023-11-30  1385  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1386  
10e02467129518 Neil Armstrong        2023-11-30  1387  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1388  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1389  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1390  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1391  
10e02467129518 Neil Armstrong        2023-11-30  1392  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1393  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1394  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1395  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1396  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1397  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1398  
10e02467129518 Neil Armstrong        2023-11-30  1399  				pinctrl-0 = <&hub_i2c2_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1400  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1401  
10e02467129518 Neil Armstrong        2023-11-30  1402  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1403  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1404  
10e02467129518 Neil Armstrong        2023-11-30  1405  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1406  			};
10e02467129518 Neil Armstrong        2023-11-30  1407  
10e02467129518 Neil Armstrong        2023-11-30  1408  			i2c_hub_3: i2c@98c000 {
10e02467129518 Neil Armstrong        2023-11-30  1409  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1410  				reg = <0 0x0098c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1411  
10e02467129518 Neil Armstrong        2023-11-30  1412  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1413  
10e02467129518 Neil Armstrong        2023-11-30  1414  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1415  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1416  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1417  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1418  
10e02467129518 Neil Armstrong        2023-11-30  1419  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1420  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1421  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1422  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1423  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1424  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1425  
10e02467129518 Neil Armstrong        2023-11-30  1426  				pinctrl-0 = <&hub_i2c3_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1427  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1428  
10e02467129518 Neil Armstrong        2023-11-30  1429  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1430  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1431  
10e02467129518 Neil Armstrong        2023-11-30  1432  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1433  			};
10e02467129518 Neil Armstrong        2023-11-30  1434  
10e02467129518 Neil Armstrong        2023-11-30  1435  			i2c_hub_4: i2c@990000 {
10e02467129518 Neil Armstrong        2023-11-30  1436  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1437  				reg = <0 0x00990000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1438  
10e02467129518 Neil Armstrong        2023-11-30  1439  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1440  
10e02467129518 Neil Armstrong        2023-11-30  1441  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1442  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1443  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1444  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1445  
10e02467129518 Neil Armstrong        2023-11-30  1446  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1447  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1448  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1449  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1450  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1451  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1452  
10e02467129518 Neil Armstrong        2023-11-30  1453  				pinctrl-0 = <&hub_i2c4_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1454  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1455  
10e02467129518 Neil Armstrong        2023-11-30  1456  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1457  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1458  
10e02467129518 Neil Armstrong        2023-11-30  1459  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1460  			};
10e02467129518 Neil Armstrong        2023-11-30  1461  
10e02467129518 Neil Armstrong        2023-11-30  1462  			i2c_hub_5: i2c@994000 {
10e02467129518 Neil Armstrong        2023-11-30  1463  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1464  				reg = <0 0x00994000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1465  
10e02467129518 Neil Armstrong        2023-11-30  1466  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1467  
10e02467129518 Neil Armstrong        2023-11-30  1468  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1469  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1470  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1471  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1472  
10e02467129518 Neil Armstrong        2023-11-30  1473  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1474  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1475  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1476  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1477  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1478  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1479  
10e02467129518 Neil Armstrong        2023-11-30  1480  				pinctrl-0 = <&hub_i2c5_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1481  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1482  
10e02467129518 Neil Armstrong        2023-11-30  1483  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1484  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1485  
10e02467129518 Neil Armstrong        2023-11-30  1486  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1487  			};
10e02467129518 Neil Armstrong        2023-11-30  1488  
10e02467129518 Neil Armstrong        2023-11-30  1489  			i2c_hub_6: i2c@998000 {
10e02467129518 Neil Armstrong        2023-11-30  1490  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1491  				reg = <0 0x00998000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1492  
10e02467129518 Neil Armstrong        2023-11-30  1493  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1494  
10e02467129518 Neil Armstrong        2023-11-30  1495  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1496  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1497  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1498  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1499  
10e02467129518 Neil Armstrong        2023-11-30  1500  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1501  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1502  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1503  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1504  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1505  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1506  
10e02467129518 Neil Armstrong        2023-11-30  1507  				pinctrl-0 = <&hub_i2c6_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1508  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1509  
10e02467129518 Neil Armstrong        2023-11-30  1510  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1511  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1512  
10e02467129518 Neil Armstrong        2023-11-30  1513  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1514  			};
10e02467129518 Neil Armstrong        2023-11-30  1515  
10e02467129518 Neil Armstrong        2023-11-30  1516  			i2c_hub_7: i2c@99c000 {
10e02467129518 Neil Armstrong        2023-11-30  1517  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1518  				reg = <0 0x0099c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1519  
10e02467129518 Neil Armstrong        2023-11-30  1520  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1521  
10e02467129518 Neil Armstrong        2023-11-30  1522  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1523  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1524  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1525  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1526  
10e02467129518 Neil Armstrong        2023-11-30  1527  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1528  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1529  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1530  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1531  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1532  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1533  
10e02467129518 Neil Armstrong        2023-11-30  1534  				pinctrl-0 = <&hub_i2c7_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1535  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1536  
10e02467129518 Neil Armstrong        2023-11-30  1537  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1538  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1539  
10e02467129518 Neil Armstrong        2023-11-30  1540  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1541  			};
10e02467129518 Neil Armstrong        2023-11-30  1542  
10e02467129518 Neil Armstrong        2023-11-30  1543  			i2c_hub_8: i2c@9a0000 {
10e02467129518 Neil Armstrong        2023-11-30  1544  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1545  				reg = <0 0x009a0000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1546  
10e02467129518 Neil Armstrong        2023-11-30  1547  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1548  
10e02467129518 Neil Armstrong        2023-11-30  1549  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1550  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1551  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1552  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1553  
10e02467129518 Neil Armstrong        2023-11-30  1554  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1555  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1556  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1557  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1558  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1559  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1560  
10e02467129518 Neil Armstrong        2023-11-30  1561  				pinctrl-0 = <&hub_i2c8_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1562  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1563  
10e02467129518 Neil Armstrong        2023-11-30  1564  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1565  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1566  
10e02467129518 Neil Armstrong        2023-11-30  1567  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1568  			};
10e02467129518 Neil Armstrong        2023-11-30  1569  
10e02467129518 Neil Armstrong        2023-11-30  1570  			i2c_hub_9: i2c@9a4000 {
10e02467129518 Neil Armstrong        2023-11-30  1571  				compatible = "qcom,geni-i2c-master-hub";
10e02467129518 Neil Armstrong        2023-11-30  1572  				reg = <0 0x009a4000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1573  
10e02467129518 Neil Armstrong        2023-11-30  1574  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1575  
10e02467129518 Neil Armstrong        2023-11-30  1576  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1577  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1578  				clock-names = "se",
10e02467129518 Neil Armstrong        2023-11-30  1579  					      "core";
10e02467129518 Neil Armstrong        2023-11-30  1580  
10e02467129518 Neil Armstrong        2023-11-30  1581  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1582  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1583  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1584  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1585  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1586  						     "qup-config";
10e02467129518 Neil Armstrong        2023-11-30  1587  
10e02467129518 Neil Armstrong        2023-11-30  1588  				pinctrl-0 = <&hub_i2c9_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1589  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1590  
10e02467129518 Neil Armstrong        2023-11-30  1591  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1592  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1593  
10e02467129518 Neil Armstrong        2023-11-30  1594  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1595  			};
10e02467129518 Neil Armstrong        2023-11-30  1596  		};
10e02467129518 Neil Armstrong        2023-11-30  1597  
10e02467129518 Neil Armstrong        2023-11-30  1598  		gpi_dma1: dma-controller@a00000 {
10e02467129518 Neil Armstrong        2023-11-30  1599  			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
10e02467129518 Neil Armstrong        2023-11-30  1600  			reg = <0 0x00a00000 0 0x60000>;
10e02467129518 Neil Armstrong        2023-11-30  1601  
10e02467129518 Neil Armstrong        2023-11-30  1602  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1603  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1604  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1605  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1606  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1607  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1608  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1609  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1610  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1611  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1612  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  1613  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1614  
10e02467129518 Neil Armstrong        2023-11-30  1615  			dma-channels = <12>;
10e02467129518 Neil Armstrong        2023-11-30  1616  			dma-channel-mask = <0xc>;
10e02467129518 Neil Armstrong        2023-11-30  1617  			#dma-cells = <3>;
10e02467129518 Neil Armstrong        2023-11-30  1618  
10e02467129518 Neil Armstrong        2023-11-30  1619  			iommus = <&apps_smmu 0xb6 0>;
10e02467129518 Neil Armstrong        2023-11-30  1620  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  1621  
10e02467129518 Neil Armstrong        2023-11-30  1622  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1623  		};
10e02467129518 Neil Armstrong        2023-11-30  1624  
10e02467129518 Neil Armstrong        2023-11-30  1625  		qupv3_id_0: geniqup@ac0000 {
10e02467129518 Neil Armstrong        2023-11-30  1626  			compatible = "qcom,geni-se-qup";
10e02467129518 Neil Armstrong        2023-11-30  1627  			reg = <0 0x00ac0000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  1628  
10e02467129518 Neil Armstrong        2023-11-30  1629  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  1630  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1631  			clock-names = "m-ahb",
10e02467129518 Neil Armstrong        2023-11-30  1632  				      "s-ahb";
10e02467129518 Neil Armstrong        2023-11-30  1633  
10e02467129518 Neil Armstrong        2023-11-30  1634  			interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1635  					 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1636  			interconnect-names = "qup-core";
10e02467129518 Neil Armstrong        2023-11-30  1637  
10e02467129518 Neil Armstrong        2023-11-30  1638  			iommus = <&apps_smmu 0xa3 0>;
10e02467129518 Neil Armstrong        2023-11-30  1639  
10e02467129518 Neil Armstrong        2023-11-30  1640  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  1641  
10e02467129518 Neil Armstrong        2023-11-30  1642  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1643  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  1644  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  1645  
10e02467129518 Neil Armstrong        2023-11-30  1646  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1647  
10e02467129518 Neil Armstrong        2023-11-30  1648  			i2c0: i2c@a80000 {
10e02467129518 Neil Armstrong        2023-11-30  1649  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1650  				reg = <0 0x00a80000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1651  
10e02467129518 Neil Armstrong        2023-11-30  1652  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1653  
10e02467129518 Neil Armstrong        2023-11-30  1654  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1655  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1656  
10e02467129518 Neil Armstrong        2023-11-30  1657  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1658  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1659  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1660  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1661  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1662  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1663  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1664  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1665  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1666  
10e02467129518 Neil Armstrong        2023-11-30  1667  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1668  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1669  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1670  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1671  
10e02467129518 Neil Armstrong        2023-11-30  1672  				pinctrl-0 = <&qup_i2c0_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1673  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1674  
10e02467129518 Neil Armstrong        2023-11-30  1675  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1676  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1677  
10e02467129518 Neil Armstrong        2023-11-30  1678  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1679  			};
10e02467129518 Neil Armstrong        2023-11-30  1680  
10e02467129518 Neil Armstrong        2023-11-30  1681  			spi0: spi@a80000 {
10e02467129518 Neil Armstrong        2023-11-30  1682  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1683  				reg = <0 0x00a80000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1684  
10e02467129518 Neil Armstrong        2023-11-30  1685  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1686  
10e02467129518 Neil Armstrong        2023-11-30  1687  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1688  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1689  
10e02467129518 Neil Armstrong        2023-11-30  1690  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1691  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1692  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1693  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1694  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1695  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1696  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1697  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1698  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1699  
10e02467129518 Neil Armstrong        2023-11-30  1700  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1701  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1702  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1703  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1704  
10e02467129518 Neil Armstrong        2023-11-30  1705  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1706  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1707  
10e02467129518 Neil Armstrong        2023-11-30  1708  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1709  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1710  
10e02467129518 Neil Armstrong        2023-11-30  1711  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1712  			};
10e02467129518 Neil Armstrong        2023-11-30  1713  
10e02467129518 Neil Armstrong        2023-11-30  1714  			i2c1: i2c@a84000 {
10e02467129518 Neil Armstrong        2023-11-30  1715  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1716  				reg = <0 0x00a84000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1717  
10e02467129518 Neil Armstrong        2023-11-30  1718  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1719  
10e02467129518 Neil Armstrong        2023-11-30  1720  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1721  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1722  
10e02467129518 Neil Armstrong        2023-11-30  1723  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1724  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1725  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1726  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1727  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1728  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1729  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1730  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1731  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1732  
10e02467129518 Neil Armstrong        2023-11-30  1733  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1734  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1735  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1736  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1737  
10e02467129518 Neil Armstrong        2023-11-30  1738  				pinctrl-0 = <&qup_i2c1_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1739  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1740  
10e02467129518 Neil Armstrong        2023-11-30  1741  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1742  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1743  
10e02467129518 Neil Armstrong        2023-11-30  1744  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1745  			};
10e02467129518 Neil Armstrong        2023-11-30  1746  
10e02467129518 Neil Armstrong        2023-11-30  1747  			spi1: spi@a84000 {
10e02467129518 Neil Armstrong        2023-11-30  1748  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1749  				reg = <0 0x00a84000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1750  
10e02467129518 Neil Armstrong        2023-11-30  1751  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1752  
10e02467129518 Neil Armstrong        2023-11-30  1753  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1754  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1755  
10e02467129518 Neil Armstrong        2023-11-30  1756  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1757  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1758  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1759  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1760  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1761  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1762  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1763  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1764  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1765  
10e02467129518 Neil Armstrong        2023-11-30  1766  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1767  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1768  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1769  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1770  
10e02467129518 Neil Armstrong        2023-11-30  1771  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1772  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1773  
10e02467129518 Neil Armstrong        2023-11-30  1774  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1775  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1776  
10e02467129518 Neil Armstrong        2023-11-30  1777  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1778  			};
10e02467129518 Neil Armstrong        2023-11-30  1779  
10e02467129518 Neil Armstrong        2023-11-30  1780  			i2c2: i2c@a88000 {
10e02467129518 Neil Armstrong        2023-11-30  1781  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1782  				reg = <0 0x00a88000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1783  
10e02467129518 Neil Armstrong        2023-11-30  1784  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1785  
10e02467129518 Neil Armstrong        2023-11-30  1786  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1787  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1788  
10e02467129518 Neil Armstrong        2023-11-30  1789  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1790  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1791  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1792  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1793  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1794  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1795  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1796  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1797  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1798  
10e02467129518 Neil Armstrong        2023-11-30  1799  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1800  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1801  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1802  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1803  
10e02467129518 Neil Armstrong        2023-11-30  1804  				pinctrl-0 = <&qup_i2c2_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1805  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1806  
10e02467129518 Neil Armstrong        2023-11-30  1807  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1808  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1809  
10e02467129518 Neil Armstrong        2023-11-30  1810  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1811  			};
10e02467129518 Neil Armstrong        2023-11-30  1812  
10e02467129518 Neil Armstrong        2023-11-30  1813  			spi2: spi@a88000 {
10e02467129518 Neil Armstrong        2023-11-30  1814  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1815  				reg = <0 0x00a88000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1816  
10e02467129518 Neil Armstrong        2023-11-30  1817  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1818  
10e02467129518 Neil Armstrong        2023-11-30  1819  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1820  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1821  
10e02467129518 Neil Armstrong        2023-11-30  1822  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1823  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1824  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1825  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1826  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1827  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1828  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1829  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1830  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1831  
10e02467129518 Neil Armstrong        2023-11-30  1832  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1833  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1834  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1835  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1836  
10e02467129518 Neil Armstrong        2023-11-30  1837  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1838  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1839  
10e02467129518 Neil Armstrong        2023-11-30  1840  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1841  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1842  
10e02467129518 Neil Armstrong        2023-11-30  1843  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1844  			};
10e02467129518 Neil Armstrong        2023-11-30  1845  
10e02467129518 Neil Armstrong        2023-11-30  1846  			i2c3: i2c@a8c000 {
10e02467129518 Neil Armstrong        2023-11-30  1847  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1848  				reg = <0 0x00a8c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1849  
10e02467129518 Neil Armstrong        2023-11-30  1850  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1851  
10e02467129518 Neil Armstrong        2023-11-30  1852  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1853  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1854  
10e02467129518 Neil Armstrong        2023-11-30  1855  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1856  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1857  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1858  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1859  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1860  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1861  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1862  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1863  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1864  
10e02467129518 Neil Armstrong        2023-11-30  1865  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1866  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1867  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1868  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1869  
10e02467129518 Neil Armstrong        2023-11-30  1870  				pinctrl-0 = <&qup_i2c3_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1871  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1872  
10e02467129518 Neil Armstrong        2023-11-30  1873  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1874  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1875  
10e02467129518 Neil Armstrong        2023-11-30  1876  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1877  			};
10e02467129518 Neil Armstrong        2023-11-30  1878  
10e02467129518 Neil Armstrong        2023-11-30  1879  			spi3: spi@a8c000 {
10e02467129518 Neil Armstrong        2023-11-30  1880  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1881  				reg = <0 0x00a8c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1882  
10e02467129518 Neil Armstrong        2023-11-30  1883  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1884  
10e02467129518 Neil Armstrong        2023-11-30  1885  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1886  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1887  
10e02467129518 Neil Armstrong        2023-11-30  1888  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1889  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1890  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1891  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1892  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1893  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1894  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1895  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1896  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1897  
10e02467129518 Neil Armstrong        2023-11-30  1898  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1899  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1900  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1901  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1902  
10e02467129518 Neil Armstrong        2023-11-30  1903  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1904  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1905  
10e02467129518 Neil Armstrong        2023-11-30  1906  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1907  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1908  
10e02467129518 Neil Armstrong        2023-11-30  1909  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1910  			};
10e02467129518 Neil Armstrong        2023-11-30  1911  
10e02467129518 Neil Armstrong        2023-11-30  1912  			i2c4: i2c@a90000 {
10e02467129518 Neil Armstrong        2023-11-30  1913  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1914  				reg = <0 0x00a90000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1915  
10e02467129518 Neil Armstrong        2023-11-30  1916  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1917  
10e02467129518 Neil Armstrong        2023-11-30  1918  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1919  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1920  
10e02467129518 Neil Armstrong        2023-11-30  1921  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1922  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1923  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1924  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1925  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1926  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1927  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1928  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1929  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1930  
10e02467129518 Neil Armstrong        2023-11-30  1931  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1932  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1933  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1934  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1935  
10e02467129518 Neil Armstrong        2023-11-30  1936  				pinctrl-0 = <&qup_i2c4_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  1937  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1938  
10e02467129518 Neil Armstrong        2023-11-30  1939  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1940  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1941  
10e02467129518 Neil Armstrong        2023-11-30  1942  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1943  			};
10e02467129518 Neil Armstrong        2023-11-30  1944  
10e02467129518 Neil Armstrong        2023-11-30  1945  			spi4: spi@a90000 {
10e02467129518 Neil Armstrong        2023-11-30  1946  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  1947  				reg = <0 0x00a90000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1948  
10e02467129518 Neil Armstrong        2023-11-30  1949  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1950  
10e02467129518 Neil Armstrong        2023-11-30  1951  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1952  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1953  
10e02467129518 Neil Armstrong        2023-11-30  1954  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1955  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1956  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1957  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1958  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1959  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1960  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1961  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1962  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1963  
10e02467129518 Neil Armstrong        2023-11-30  1964  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  1965  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  1966  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  1967  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  1968  
10e02467129518 Neil Armstrong        2023-11-30  1969  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
10e02467129518 Neil Armstrong        2023-11-30  1970  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  1971  
10e02467129518 Neil Armstrong        2023-11-30  1972  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  1973  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  1974  
10e02467129518 Neil Armstrong        2023-11-30  1975  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  1976  			};
10e02467129518 Neil Armstrong        2023-11-30  1977  
10e02467129518 Neil Armstrong        2023-11-30  1978  			i2c5: i2c@a94000 {
10e02467129518 Neil Armstrong        2023-11-30  1979  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  1980  				reg = <0 0x00a94000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  1981  
10e02467129518 Neil Armstrong        2023-11-30  1982  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  1983  
10e02467129518 Neil Armstrong        2023-11-30  1984  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  1985  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  1986  
10e02467129518 Neil Armstrong        2023-11-30  1987  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1988  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1989  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1990  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  1991  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  1992  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  1993  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  1994  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  1995  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  1996  
10e02467129518 Neil Armstrong        2023-11-30  1997  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  1998  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  1999  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2000  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2001  
10e02467129518 Neil Armstrong        2023-11-30  2002  				pinctrl-0 = <&qup_i2c5_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2003  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2004  
10e02467129518 Neil Armstrong        2023-11-30  2005  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2006  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2007  
10e02467129518 Neil Armstrong        2023-11-30  2008  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2009  			};
10e02467129518 Neil Armstrong        2023-11-30  2010  
10e02467129518 Neil Armstrong        2023-11-30  2011  			spi5: spi@a94000 {
10e02467129518 Neil Armstrong        2023-11-30  2012  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2013  				reg = <0 0x00a94000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2014  
10e02467129518 Neil Armstrong        2023-11-30  2015  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2016  
10e02467129518 Neil Armstrong        2023-11-30  2017  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2018  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2019  
10e02467129518 Neil Armstrong        2023-11-30  2020  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2021  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2022  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2023  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2024  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2025  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2026  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2027  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2028  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2029  
10e02467129518 Neil Armstrong        2023-11-30  2030  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2031  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2032  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2033  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2034  
10e02467129518 Neil Armstrong        2023-11-30  2035  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2036  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2037  
10e02467129518 Neil Armstrong        2023-11-30  2038  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2039  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2040  
10e02467129518 Neil Armstrong        2023-11-30  2041  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2042  			};
10e02467129518 Neil Armstrong        2023-11-30  2043  
10e02467129518 Neil Armstrong        2023-11-30  2044  			i2c6: i2c@a98000 {
10e02467129518 Neil Armstrong        2023-11-30  2045  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2046  				reg = <0 0x00a98000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2047  
10e02467129518 Neil Armstrong        2023-11-30  2048  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2049  
10e02467129518 Neil Armstrong        2023-11-30  2050  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2051  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2052  
10e02467129518 Neil Armstrong        2023-11-30  2053  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2054  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2055  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2056  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2057  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2058  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2059  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2060  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2061  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2062  
10e02467129518 Neil Armstrong        2023-11-30  2063  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2064  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2065  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2066  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2067  
10e02467129518 Neil Armstrong        2023-11-30  2068  				pinctrl-0 = <&qup_i2c6_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2069  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2070  
10e02467129518 Neil Armstrong        2023-11-30  2071  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2072  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2073  
10e02467129518 Neil Armstrong        2023-11-30  2074  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2075  			};
10e02467129518 Neil Armstrong        2023-11-30  2076  
10e02467129518 Neil Armstrong        2023-11-30  2077  			spi6: spi@a98000 {
10e02467129518 Neil Armstrong        2023-11-30  2078  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2079  				reg = <0 0x00a98000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2080  
10e02467129518 Neil Armstrong        2023-11-30  2081  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2082  
10e02467129518 Neil Armstrong        2023-11-30  2083  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2084  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2085  
10e02467129518 Neil Armstrong        2023-11-30  2086  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2087  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2088  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2089  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2090  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2091  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2092  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2093  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2094  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2095  
10e02467129518 Neil Armstrong        2023-11-30  2096  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2097  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2098  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2099  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2100  
10e02467129518 Neil Armstrong        2023-11-30  2101  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2102  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2103  
10e02467129518 Neil Armstrong        2023-11-30  2104  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2105  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2106  
10e02467129518 Neil Armstrong        2023-11-30  2107  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2108  			};
10e02467129518 Neil Armstrong        2023-11-30  2109  
10e02467129518 Neil Armstrong        2023-11-30  2110  			i2c7: i2c@a9c000 {
10e02467129518 Neil Armstrong        2023-11-30  2111  				compatible = "qcom,geni-i2c";
10e02467129518 Neil Armstrong        2023-11-30  2112  				reg = <0 0x00a9c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2113  
10e02467129518 Neil Armstrong        2023-11-30  2114  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2115  
10e02467129518 Neil Armstrong        2023-11-30  2116  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2117  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2118  
10e02467129518 Neil Armstrong        2023-11-30  2119  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2120  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2121  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2122  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2123  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2124  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2125  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2126  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2127  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2128  
10e02467129518 Neil Armstrong        2023-11-30  2129  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
10e02467129518 Neil Armstrong        2023-11-30  2130  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
10e02467129518 Neil Armstrong        2023-11-30  2131  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2132  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2133  
10e02467129518 Neil Armstrong        2023-11-30  2134  				pinctrl-0 = <&qup_i2c7_data_clk>;
10e02467129518 Neil Armstrong        2023-11-30  2135  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2136  
10e02467129518 Neil Armstrong        2023-11-30  2137  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2138  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2139  
10e02467129518 Neil Armstrong        2023-11-30  2140  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2141  			};
10e02467129518 Neil Armstrong        2023-11-30  2142  
10e02467129518 Neil Armstrong        2023-11-30  2143  			spi7: spi@a9c000 {
10e02467129518 Neil Armstrong        2023-11-30  2144  				compatible = "qcom,geni-spi";
10e02467129518 Neil Armstrong        2023-11-30  2145  				reg = <0 0x00a9c000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  2146  
10e02467129518 Neil Armstrong        2023-11-30  2147  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2148  
10e02467129518 Neil Armstrong        2023-11-30  2149  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2150  				clock-names = "se";
10e02467129518 Neil Armstrong        2023-11-30  2151  
10e02467129518 Neil Armstrong        2023-11-30  2152  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2153  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2154  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2155  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2156  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2157  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2158  				interconnect-names = "qup-core",
10e02467129518 Neil Armstrong        2023-11-30  2159  						     "qup-config",
10e02467129518 Neil Armstrong        2023-11-30  2160  						     "qup-memory";
10e02467129518 Neil Armstrong        2023-11-30  2161  
10e02467129518 Neil Armstrong        2023-11-30  2162  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
10e02467129518 Neil Armstrong        2023-11-30  2163  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
10e02467129518 Neil Armstrong        2023-11-30  2164  				dma-names = "tx",
10e02467129518 Neil Armstrong        2023-11-30  2165  					    "rx";
10e02467129518 Neil Armstrong        2023-11-30  2166  
10e02467129518 Neil Armstrong        2023-11-30  2167  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
10e02467129518 Neil Armstrong        2023-11-30  2168  				pinctrl-names = "default";
10e02467129518 Neil Armstrong        2023-11-30  2169  
10e02467129518 Neil Armstrong        2023-11-30  2170  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2171  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2172  
10e02467129518 Neil Armstrong        2023-11-30  2173  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2174  			};
10e02467129518 Neil Armstrong        2023-11-30  2175  		};
10e02467129518 Neil Armstrong        2023-11-30  2176  
10e02467129518 Neil Armstrong        2023-11-30  2177  		cnoc_main: interconnect@1500000 {
10e02467129518 Neil Armstrong        2023-11-30  2178  			compatible = "qcom,sm8650-cnoc-main";
10e02467129518 Neil Armstrong        2023-11-30  2179  			reg = <0 0x01500000 0 0x14080>;
10e02467129518 Neil Armstrong        2023-11-30  2180  
10e02467129518 Neil Armstrong        2023-11-30  2181  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2182  
10e02467129518 Neil Armstrong        2023-11-30  2183  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2184  		};
10e02467129518 Neil Armstrong        2023-11-30  2185  
10e02467129518 Neil Armstrong        2023-11-30  2186  		config_noc: interconnect@1600000 {
10e02467129518 Neil Armstrong        2023-11-30  2187  			compatible = "qcom,sm8650-config-noc";
10e02467129518 Neil Armstrong        2023-11-30  2188  			reg = <0 0x01600000 0 0x6200>;
10e02467129518 Neil Armstrong        2023-11-30  2189  
10e02467129518 Neil Armstrong        2023-11-30  2190  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2191  
10e02467129518 Neil Armstrong        2023-11-30  2192  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2193  		};
10e02467129518 Neil Armstrong        2023-11-30  2194  
10e02467129518 Neil Armstrong        2023-11-30  2195  		system_noc: interconnect@1680000 {
10e02467129518 Neil Armstrong        2023-11-30  2196  			compatible = "qcom,sm8650-system-noc";
10e02467129518 Neil Armstrong        2023-11-30  2197  			reg = <0 0x01680000 0 0x1d080>;
10e02467129518 Neil Armstrong        2023-11-30  2198  
10e02467129518 Neil Armstrong        2023-11-30  2199  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2200  
10e02467129518 Neil Armstrong        2023-11-30  2201  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2202  		};
10e02467129518 Neil Armstrong        2023-11-30  2203  
10e02467129518 Neil Armstrong        2023-11-30  2204  		pcie_noc: interconnect@16c0000 {
10e02467129518 Neil Armstrong        2023-11-30  2205  			compatible = "qcom,sm8650-pcie-anoc";
10e02467129518 Neil Armstrong        2023-11-30  2206  			reg = <0 0x016c0000 0 0x12200>;
10e02467129518 Neil Armstrong        2023-11-30  2207  
10e02467129518 Neil Armstrong        2023-11-30  2208  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2209  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2210  
10e02467129518 Neil Armstrong        2023-11-30  2211  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2212  
10e02467129518 Neil Armstrong        2023-11-30  2213  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2214  		};
10e02467129518 Neil Armstrong        2023-11-30  2215  
10e02467129518 Neil Armstrong        2023-11-30  2216  		aggre1_noc: interconnect@16e0000 {
10e02467129518 Neil Armstrong        2023-11-30  2217  			compatible = "qcom,sm8650-aggre1-noc";
10e02467129518 Neil Armstrong        2023-11-30  2218  			reg = <0 0x016e0000 0 0x16400>;
10e02467129518 Neil Armstrong        2023-11-30  2219  
10e02467129518 Neil Armstrong        2023-11-30  2220  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2221  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2222  
10e02467129518 Neil Armstrong        2023-11-30  2223  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2224  
10e02467129518 Neil Armstrong        2023-11-30  2225  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2226  		};
10e02467129518 Neil Armstrong        2023-11-30  2227  
10e02467129518 Neil Armstrong        2023-11-30  2228  		aggre2_noc: interconnect@1700000 {
10e02467129518 Neil Armstrong        2023-11-30  2229  			compatible = "qcom,sm8650-aggre2-noc";
10e02467129518 Neil Armstrong        2023-11-30  2230  			reg = <0 0x01700000 0 0x1e400>;
10e02467129518 Neil Armstrong        2023-11-30  2231  
10e02467129518 Neil Armstrong        2023-11-30  2232  			clocks = <&rpmhcc RPMH_IPA_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2233  
10e02467129518 Neil Armstrong        2023-11-30  2234  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2235  
10e02467129518 Neil Armstrong        2023-11-30  2236  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2237  		};
10e02467129518 Neil Armstrong        2023-11-30  2238  
10e02467129518 Neil Armstrong        2023-11-30  2239  		mmss_noc: interconnect@1780000 {
10e02467129518 Neil Armstrong        2023-11-30  2240  			compatible = "qcom,sm8650-mmss-noc";
10e02467129518 Neil Armstrong        2023-11-30  2241  			reg = <0 0x01780000 0 0x5b800>;
10e02467129518 Neil Armstrong        2023-11-30  2242  
10e02467129518 Neil Armstrong        2023-11-30  2243  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  2244  
10e02467129518 Neil Armstrong        2023-11-30  2245  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2246  		};
10e02467129518 Neil Armstrong        2023-11-30  2247  
10e02467129518 Neil Armstrong        2023-11-30  2248  		rng: rng@10c3000 {
10e02467129518 Neil Armstrong        2023-11-30  2249  			compatible = "qcom,sm8650-trng", "qcom,trng";
10e02467129518 Neil Armstrong        2023-11-30  2250  			reg = <0 0x010c3000 0 0x1000>;
10e02467129518 Neil Armstrong        2023-11-30  2251  		};
10e02467129518 Neil Armstrong        2023-11-30  2252  
2f2120a1525109 Manivannan Sadhasivam 2024-03-21  2253  		pcie0: pcie@1c00000 {
10e02467129518 Neil Armstrong        2023-11-30  2254  			device_type = "pci";
10e02467129518 Neil Armstrong        2023-11-30  2255  			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
10e02467129518 Neil Armstrong        2023-11-30  2256  			reg = <0 0x01c00000 0 0x3000>,
10e02467129518 Neil Armstrong        2023-11-30  2257  			      <0 0x60000000 0 0xf1d>,
10e02467129518 Neil Armstrong        2023-11-30  2258  			      <0 0x60000f20 0 0xa8>,
10e02467129518 Neil Armstrong        2023-11-30  2259  			      <0 0x60001000 0 0x1000>,
10e02467129518 Neil Armstrong        2023-11-30  2260  			      <0 0x60100000 0 0x100000>;
10e02467129518 Neil Armstrong        2023-11-30  2261  			reg-names = "parf", "dbi", "elbi", "atu", "config";
10e02467129518 Neil Armstrong        2023-11-30  2262  
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2263  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2264  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2265  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2266  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2267  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2268  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2269  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
9eb81b31ab62cf Neil Armstrong        2024-11-26  2270  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
9eb81b31ab62cf Neil Armstrong        2024-11-26  2271  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2272  			interrupt-names = "msi0",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2273  					  "msi1",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2274  					  "msi2",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2275  					  "msi3",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2276  					  "msi4",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2277  					  "msi5",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2278  					  "msi6",
9eb81b31ab62cf Neil Armstrong        2024-11-26  2279  					  "msi7",
9eb81b31ab62cf Neil Armstrong        2024-11-26  2280  					  "global";
10e02467129518 Neil Armstrong        2023-11-30  2281  
10e02467129518 Neil Armstrong        2023-11-30  2282  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2283  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2284  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2285  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2286  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2287  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2288  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2289  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2290  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  2291  				      "cfg",
10e02467129518 Neil Armstrong        2023-11-30  2292  				      "bus_master",
10e02467129518 Neil Armstrong        2023-11-30  2293  				      "bus_slave",
10e02467129518 Neil Armstrong        2023-11-30  2294  				      "slave_q2a",
10e02467129518 Neil Armstrong        2023-11-30  2295  				      "ddrss_sf_tbu",
10e02467129518 Neil Armstrong        2023-11-30  2296  				      "noc_aggr",
10e02467129518 Neil Armstrong        2023-11-30  2297  				      "cnoc_sf_axi";
10e02467129518 Neil Armstrong        2023-11-30  2298  
10e02467129518 Neil Armstrong        2023-11-30  2299  			resets = <&gcc GCC_PCIE_0_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  2300  			reset-names = "pci";
10e02467129518 Neil Armstrong        2023-11-30  2301  
10e02467129518 Neil Armstrong        2023-11-30  2302  			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2303  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2304  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2305  					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2306  			interconnect-names = "pcie-mem",
10e02467129518 Neil Armstrong        2023-11-30  2307  					     "cpu-pcie";
10e02467129518 Neil Armstrong        2023-11-30  2308  
10e02467129518 Neil Armstrong        2023-11-30  2309  			power-domains = <&gcc PCIE_0_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  2310  
10e02467129518 Neil Armstrong        2023-11-30  2311  			iommu-map = <0     &apps_smmu 0x1400 0x1>,
10e02467129518 Neil Armstrong        2023-11-30  2312  				    <0x100 &apps_smmu 0x1401 0x1>;
10e02467129518 Neil Armstrong        2023-11-30  2313  
10e02467129518 Neil Armstrong        2023-11-30  2314  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  2315  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  2316  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  2317  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2318  			interrupt-map-mask = <0 0 0 0x7>;
10e02467129518 Neil Armstrong        2023-11-30  2319  			#interrupt-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2320  
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  2321  			msi-map = <0x0 &gic_its 0x1400 0x1>,
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  2322  				  <0x100 &gic_its 0x1401 0x1>;
dfc554d5217163 Manivannan Sadhasivam 2024-02-16  2323  			msi-map-mask = <0xff00>;
a33a532b3b1ecd Neil Armstrong        2024-01-25  2324  
10e02467129518 Neil Armstrong        2023-11-30  2325  			linux,pci-domain = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2326  			num-lanes = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2327  			bus-range = <0 0xff>;
10e02467129518 Neil Armstrong        2023-11-30  2328  
10e02467129518 Neil Armstrong        2023-11-30  2329  			phys = <&pcie0_phy>;
10e02467129518 Neil Armstrong        2023-11-30  2330  			phy-names = "pciephy";
10e02467129518 Neil Armstrong        2023-11-30  2331  
10e02467129518 Neil Armstrong        2023-11-30  2332  			#address-cells = <3>;
10e02467129518 Neil Armstrong        2023-11-30  2333  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2334  			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
10e02467129518 Neil Armstrong        2023-11-30  2335  				 <0x02000000 0 0x60300000 0 0x60300000 0 0x3d00000>;
10e02467129518 Neil Armstrong        2023-11-30  2336  
10e02467129518 Neil Armstrong        2023-11-30  2337  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  2338  
10e02467129518 Neil Armstrong        2023-11-30  2339  			status = "disabled";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2340  
a05737bf763166 Bartosz Golaszewski   2024-06-05  2341  			pcieport0: pcie@0 {
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2342  				device_type = "pci";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2343  				reg = <0x0 0x0 0x0 0x0 0x0>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2344  				bus-range = <0x01 0xff>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2345  
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2346  				#address-cells = <3>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2347  				#size-cells = <2>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2348  				ranges;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2349  			};
10e02467129518 Neil Armstrong        2023-11-30  2350  		};
10e02467129518 Neil Armstrong        2023-11-30  2351  
10e02467129518 Neil Armstrong        2023-11-30  2352  		pcie0_phy: phy@1c06000 {
10e02467129518 Neil Armstrong        2023-11-30  2353  			compatible = "qcom,sm8650-qmp-gen3x2-pcie-phy";
10e02467129518 Neil Armstrong        2023-11-30  2354  			reg = <0 0x01c06000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  2355  
10e02467129518 Neil Armstrong        2023-11-30  2356  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2357  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2358  				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
10e02467129518 Neil Armstrong        2023-11-30  2359  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2360  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2361  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  2362  				      "cfg_ahb",
10e02467129518 Neil Armstrong        2023-11-30  2363  				      "ref",
10e02467129518 Neil Armstrong        2023-11-30  2364  				      "rchng",
10e02467129518 Neil Armstrong        2023-11-30  2365  				      "pipe";
10e02467129518 Neil Armstrong        2023-11-30  2366  
10e02467129518 Neil Armstrong        2023-11-30  2367  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2368  			assigned-clock-rates = <100000000>;
10e02467129518 Neil Armstrong        2023-11-30  2369  
10e02467129518 Neil Armstrong        2023-11-30  2370  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  2371  			reset-names = "phy";
10e02467129518 Neil Armstrong        2023-11-30  2372  
10e02467129518 Neil Armstrong        2023-11-30  2373  			power-domains = <&gcc PCIE_0_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  2374  
10e02467129518 Neil Armstrong        2023-11-30  2375  			#clock-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2376  			clock-output-names = "pcie0_pipe_clk";
10e02467129518 Neil Armstrong        2023-11-30  2377  
10e02467129518 Neil Armstrong        2023-11-30  2378  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2379  
10e02467129518 Neil Armstrong        2023-11-30  2380  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2381  		};
10e02467129518 Neil Armstrong        2023-11-30  2382  
2f2120a1525109 Manivannan Sadhasivam 2024-03-21  2383  		pcie1: pcie@1c08000 {
10e02467129518 Neil Armstrong        2023-11-30  2384  			device_type = "pci";
10e02467129518 Neil Armstrong        2023-11-30  2385  			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
10e02467129518 Neil Armstrong        2023-11-30  2386  			reg = <0 0x01c08000 0 0x3000>,
10e02467129518 Neil Armstrong        2023-11-30  2387  			      <0 0x40000000 0 0xf1d>,
10e02467129518 Neil Armstrong        2023-11-30  2388  			      <0 0x40000f20 0 0xa8>,
10e02467129518 Neil Armstrong        2023-11-30  2389  			      <0 0x40001000 0 0x1000>,
10e02467129518 Neil Armstrong        2023-11-30  2390  			      <0 0x40100000 0 0x100000>;
10e02467129518 Neil Armstrong        2023-11-30  2391  			reg-names = "parf",
10e02467129518 Neil Armstrong        2023-11-30  2392  				    "dbi",
10e02467129518 Neil Armstrong        2023-11-30  2393  				    "elbi",
10e02467129518 Neil Armstrong        2023-11-30  2394  				    "atu",
10e02467129518 Neil Armstrong        2023-11-30  2395  				    "config";
10e02467129518 Neil Armstrong        2023-11-30  2396  
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2397  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2398  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2399  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2400  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2401  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2402  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2403  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
9eb81b31ab62cf Neil Armstrong        2024-11-26  2404  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
9eb81b31ab62cf Neil Armstrong        2024-11-26  2405  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2406  			interrupt-names = "msi0",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2407  					  "msi1",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2408  					  "msi2",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2409  					  "msi3",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2410  					  "msi4",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2411  					  "msi5",
7ee7c0f326d6c9 Krzysztof Kozlowski   2024-01-26  2412  					  "msi6",
9eb81b31ab62cf Neil Armstrong        2024-11-26  2413  					  "msi7",
9eb81b31ab62cf Neil Armstrong        2024-11-26  2414  					  "global";
10e02467129518 Neil Armstrong        2023-11-30  2415  
10e02467129518 Neil Armstrong        2023-11-30  2416  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2417  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2418  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2419  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2420  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2421  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2422  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2423  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2424  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  2425  				      "cfg",
10e02467129518 Neil Armstrong        2023-11-30  2426  				      "bus_master",
10e02467129518 Neil Armstrong        2023-11-30  2427  				      "bus_slave",
10e02467129518 Neil Armstrong        2023-11-30  2428  				      "slave_q2a",
10e02467129518 Neil Armstrong        2023-11-30  2429  				      "ddrss_sf_tbu",
10e02467129518 Neil Armstrong        2023-11-30  2430  				      "noc_aggr",
10e02467129518 Neil Armstrong        2023-11-30  2431  				      "cnoc_sf_axi";
10e02467129518 Neil Armstrong        2023-11-30  2432  
10e02467129518 Neil Armstrong        2023-11-30  2433  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2434  			assigned-clock-rates = <19200000>;
10e02467129518 Neil Armstrong        2023-11-30  2435  
10e02467129518 Neil Armstrong        2023-11-30  2436  			resets = <&gcc GCC_PCIE_1_BCR>,
10e02467129518 Neil Armstrong        2023-11-30  2437  				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  2438  			reset-names = "pci",
10e02467129518 Neil Armstrong        2023-11-30  2439  				      "link_down";
10e02467129518 Neil Armstrong        2023-11-30  2440  
10e02467129518 Neil Armstrong        2023-11-30  2441  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2442  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2443  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2444  					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2445  			interconnect-names = "pcie-mem",
10e02467129518 Neil Armstrong        2023-11-30  2446  					     "cpu-pcie";
10e02467129518 Neil Armstrong        2023-11-30  2447  
10e02467129518 Neil Armstrong        2023-11-30  2448  			power-domains = <&gcc PCIE_1_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  2449  
10e02467129518 Neil Armstrong        2023-11-30  2450  			iommu-map = <0     &apps_smmu 0x1480 0x1>,
10e02467129518 Neil Armstrong        2023-11-30  2451  				    <0x100 &apps_smmu 0x1481 0x1>;
10e02467129518 Neil Armstrong        2023-11-30  2452  
10e02467129518 Neil Armstrong        2023-11-30  2453  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  2454  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  2455  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  2456  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2457  			interrupt-map-mask = <0 0 0 0x7>;
10e02467129518 Neil Armstrong        2023-11-30  2458  			#interrupt-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2459  
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  2460  			msi-map = <0x0 &gic_its 0x1480 0x1>,
6d3bd106ad6038 Manivannan Sadhasivam 2024-03-18  2461  				  <0x100 &gic_its 0x1481 0x1>;
dfc554d5217163 Manivannan Sadhasivam 2024-02-16  2462  			msi-map-mask = <0xff00>;
a33a532b3b1ecd Neil Armstrong        2024-01-25  2463  
10e02467129518 Neil Armstrong        2023-11-30  2464  			linux,pci-domain = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2465  			num-lanes = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2466  			bus-range = <0 0xff>;
10e02467129518 Neil Armstrong        2023-11-30  2467  
10e02467129518 Neil Armstrong        2023-11-30  2468  			phys = <&pcie1_phy>;
10e02467129518 Neil Armstrong        2023-11-30  2469  			phy-names = "pciephy";
10e02467129518 Neil Armstrong        2023-11-30  2470  
10e02467129518 Neil Armstrong        2023-11-30  2471  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  2472  
10e02467129518 Neil Armstrong        2023-11-30  2473  			#address-cells = <3>;
10e02467129518 Neil Armstrong        2023-11-30  2474  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2475  			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
10e02467129518 Neil Armstrong        2023-11-30  2476  				 <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
10e02467129518 Neil Armstrong        2023-11-30  2477  
10e02467129518 Neil Armstrong        2023-11-30  2478  			status = "disabled";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2479  
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2480  			pcie@0 {
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2481  				device_type = "pci";
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2482  				reg = <0x0 0x0 0x0 0x0 0x0>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2483  				bus-range = <0x01 0xff>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2484  
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2485  				#address-cells = <3>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2486  				#size-cells = <2>;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2487  				ranges;
cf3e010d7f4c20 Manivannan Sadhasivam 2024-03-21  2488  			};
10e02467129518 Neil Armstrong        2023-11-30  2489  		};
10e02467129518 Neil Armstrong        2023-11-30  2490  
10e02467129518 Neil Armstrong        2023-11-30  2491  		pcie1_phy: phy@1c0e000 {
10e02467129518 Neil Armstrong        2023-11-30  2492  			compatible = "qcom,sm8650-qmp-gen4x2-pcie-phy";
10e02467129518 Neil Armstrong        2023-11-30  2493  			reg = <0 0x01c0e000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  2494  
10e02467129518 Neil Armstrong        2023-11-30  2495  			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2496  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2497  				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
10e02467129518 Neil Armstrong        2023-11-30  2498  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2499  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2500  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  2501  				      "cfg_ahb",
10e02467129518 Neil Armstrong        2023-11-30  2502  				      "ref",
10e02467129518 Neil Armstrong        2023-11-30  2503  				      "rchng",
10e02467129518 Neil Armstrong        2023-11-30  2504  				      "pipe";
10e02467129518 Neil Armstrong        2023-11-30  2505  
10e02467129518 Neil Armstrong        2023-11-30  2506  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2507  			assigned-clock-rates = <100000000>;
10e02467129518 Neil Armstrong        2023-11-30  2508  
10e02467129518 Neil Armstrong        2023-11-30  2509  			resets = <&gcc GCC_PCIE_1_PHY_BCR>,
10e02467129518 Neil Armstrong        2023-11-30  2510  				 <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  2511  			reset-names = "phy",
10e02467129518 Neil Armstrong        2023-11-30  2512  				      "phy_nocsr";
10e02467129518 Neil Armstrong        2023-11-30  2513  
10e02467129518 Neil Armstrong        2023-11-30  2514  			power-domains = <&gcc PCIE_1_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  2515  
d00b42f170dfa4 Neil Armstrong        2024-05-02  2516  			#clock-cells = <1>;
dc323623c3b87c Dmitry Baryshkov      2024-06-14  2517  			clock-output-names = "pcie1_pipe_clk";
10e02467129518 Neil Armstrong        2023-11-30  2518  
10e02467129518 Neil Armstrong        2023-11-30  2519  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2520  
10e02467129518 Neil Armstrong        2023-11-30  2521  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2522  		};
10e02467129518 Neil Armstrong        2023-11-30  2523  
10e02467129518 Neil Armstrong        2023-11-30  2524  		cryptobam: dma-controller@1dc4000 {
10e02467129518 Neil Armstrong        2023-11-30  2525  			compatible = "qcom,bam-v1.7.0";
10e02467129518 Neil Armstrong        2023-11-30  2526  			reg = <0 0x01dc4000 0 0x28000>;
10e02467129518 Neil Armstrong        2023-11-30  2527  
10e02467129518 Neil Armstrong        2023-11-30  2528  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2529  
10e02467129518 Neil Armstrong        2023-11-30  2530  			#dma-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2531  
10e02467129518 Neil Armstrong        2023-11-30  2532  			iommus = <&apps_smmu 0x480 0>,
10e02467129518 Neil Armstrong        2023-11-30  2533  				 <&apps_smmu 0x481 0>;
10e02467129518 Neil Armstrong        2023-11-30  2534  
10e02467129518 Neil Armstrong        2023-11-30  2535  			qcom,ee = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2536  			qcom,controlled-remotely;
10e02467129518 Neil Armstrong        2023-11-30  2537  		};
10e02467129518 Neil Armstrong        2023-11-30  2538  
10e02467129518 Neil Armstrong        2023-11-30  2539  		crypto: crypto@1dfa000 {
10e02467129518 Neil Armstrong        2023-11-30  2540  			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
10e02467129518 Neil Armstrong        2023-11-30  2541  			reg = <0 0x01dfa000 0 0x6000>;
10e02467129518 Neil Armstrong        2023-11-30  2542  
10e02467129518 Neil Armstrong        2023-11-30  2543  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2544  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2545  			interconnect-names = "memory";
10e02467129518 Neil Armstrong        2023-11-30  2546  
10e02467129518 Neil Armstrong        2023-11-30  2547  			dmas = <&cryptobam 4>, <&cryptobam 5>;
10e02467129518 Neil Armstrong        2023-11-30  2548  			dma-names = "rx", "tx";
10e02467129518 Neil Armstrong        2023-11-30  2549  
10e02467129518 Neil Armstrong        2023-11-30  2550  			iommus = <&apps_smmu 0x480 0>,
10e02467129518 Neil Armstrong        2023-11-30  2551  				 <&apps_smmu 0x481 0>;
10e02467129518 Neil Armstrong        2023-11-30  2552  		};
10e02467129518 Neil Armstrong        2023-11-30  2553  
10e02467129518 Neil Armstrong        2023-11-30  2554  		ufs_mem_phy: phy@1d80000 {
10e02467129518 Neil Armstrong        2023-11-30  2555  			compatible = "qcom,sm8650-qmp-ufs-phy";
10e02467129518 Neil Armstrong        2023-11-30  2556  			reg = <0 0x01d80000 0 0x2000>;
10e02467129518 Neil Armstrong        2023-11-30  2557  
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  2558  			clocks = <&rpmhcc RPMH_CXO_CLK>,
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  2559  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  2560  				 <&tcsr TCSR_UFS_CLKREF_EN>;
10e02467129518 Neil Armstrong        2023-11-30  2561  			clock-names = "ref",
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  2562  				      "ref_aux",
0f9b8054bb4abd Manivannan Sadhasivam 2024-01-31  2563  				      "qref";
10e02467129518 Neil Armstrong        2023-11-30  2564  
10e02467129518 Neil Armstrong        2023-11-30  2565  			resets = <&ufs_mem_hc 0>;
10e02467129518 Neil Armstrong        2023-11-30  2566  			reset-names = "ufsphy";
10e02467129518 Neil Armstrong        2023-11-30  2567  
10e02467129518 Neil Armstrong        2023-11-30  2568  			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  2569  
10e02467129518 Neil Armstrong        2023-11-30  2570  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2571  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  2572  
10e02467129518 Neil Armstrong        2023-11-30  2573  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2574  		};
10e02467129518 Neil Armstrong        2023-11-30  2575  
15288649e4c037 Manivannan Sadhasivam 2024-05-14  2576  		ufs_mem_hc: ufshc@1d84000 {
10e02467129518 Neil Armstrong        2023-11-30  2577  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
10e02467129518 Neil Armstrong        2023-11-30  2578  			reg = <0 0x01d84000 0 0x3000>;
10e02467129518 Neil Armstrong        2023-11-30  2579  
10e02467129518 Neil Armstrong        2023-11-30  2580  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  2581  
10e02467129518 Neil Armstrong        2023-11-30  2582  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2583  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2584  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2585  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2586  				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
10e02467129518 Neil Armstrong        2023-11-30  2587  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2588  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  2589  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2590  			clock-names = "core_clk",
10e02467129518 Neil Armstrong        2023-11-30  2591  				      "bus_aggr_clk",
10e02467129518 Neil Armstrong        2023-11-30  2592  				      "iface_clk",
10e02467129518 Neil Armstrong        2023-11-30  2593  				      "core_clk_unipro",
10e02467129518 Neil Armstrong        2023-11-30  2594  				      "ref_clk",
10e02467129518 Neil Armstrong        2023-11-30  2595  				      "tx_lane0_sync_clk",
10e02467129518 Neil Armstrong        2023-11-30  2596  				      "rx_lane0_sync_clk",
10e02467129518 Neil Armstrong        2023-11-30  2597  				      "rx_lane1_sync_clk";
10e02467129518 Neil Armstrong        2023-11-30  2598  			freq-table-hz = <100000000 403000000>,
10e02467129518 Neil Armstrong        2023-11-30  2599  					<0 0>,
10e02467129518 Neil Armstrong        2023-11-30  2600  					<0 0>,
10e02467129518 Neil Armstrong        2023-11-30  2601  					<100000000 403000000>,
10e02467129518 Neil Armstrong        2023-11-30  2602  					<100000000 403000000>,
10e02467129518 Neil Armstrong        2023-11-30  2603  					<0 0>,
10e02467129518 Neil Armstrong        2023-11-30  2604  					<0 0>,
10e02467129518 Neil Armstrong        2023-11-30  2605  					<0 0>;
10e02467129518 Neil Armstrong        2023-11-30  2606  
10e02467129518 Neil Armstrong        2023-11-30  2607  			resets = <&gcc GCC_UFS_PHY_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  2608  			reset-names = "rst";
10e02467129518 Neil Armstrong        2023-11-30  2609  
10e02467129518 Neil Armstrong        2023-11-30  2610  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2611  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  2612  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2613  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2614  			interconnect-names = "ufs-ddr",
10e02467129518 Neil Armstrong        2023-11-30  2615  					     "cpu-ufs";
10e02467129518 Neil Armstrong        2023-11-30  2616  
10e02467129518 Neil Armstrong        2023-11-30  2617  			power-domains = <&gcc UFS_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  2618  			required-opps = <&rpmhpd_opp_nom>;
10e02467129518 Neil Armstrong        2023-11-30  2619  
10e02467129518 Neil Armstrong        2023-11-30  2620  			iommus = <&apps_smmu 0x60 0>;
10e02467129518 Neil Armstrong        2023-11-30  2621  
10e02467129518 Neil Armstrong        2023-11-30  2622  			lanes-per-direction = <2>;
10e02467129518 Neil Armstrong        2023-11-30  2623  			qcom,ice = <&ice>;
10e02467129518 Neil Armstrong        2023-11-30  2624  
10e02467129518 Neil Armstrong        2023-11-30  2625  			phys = <&ufs_mem_phy>;
10e02467129518 Neil Armstrong        2023-11-30  2626  			phy-names = "ufsphy";
10e02467129518 Neil Armstrong        2023-11-30  2627  
10e02467129518 Neil Armstrong        2023-11-30  2628  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2629  
10e02467129518 Neil Armstrong        2023-11-30  2630  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2631  		};
10e02467129518 Neil Armstrong        2023-11-30  2632  
10e02467129518 Neil Armstrong        2023-11-30  2633  		ice: crypto@1d88000 {
10e02467129518 Neil Armstrong        2023-11-30  2634  			compatible = "qcom,sm8650-inline-crypto-engine",
10e02467129518 Neil Armstrong        2023-11-30  2635  				     "qcom,inline-crypto-engine";
88dfd0b5a199c6 Bartosz Golaszewski   2024-10-07  2636  			reg = <0 0x01d88000 0 0x18000>;
10e02467129518 Neil Armstrong        2023-11-30  2637  
10e02467129518 Neil Armstrong        2023-11-30  2638  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2639  		};
10e02467129518 Neil Armstrong        2023-11-30  2640  
10e02467129518 Neil Armstrong        2023-11-30  2641  		tcsr_mutex: hwlock@1f40000 {
10e02467129518 Neil Armstrong        2023-11-30  2642  			compatible = "qcom,tcsr-mutex";
10e02467129518 Neil Armstrong        2023-11-30  2643  			reg = <0 0x01f40000 0 0x20000>;
10e02467129518 Neil Armstrong        2023-11-30  2644  
10e02467129518 Neil Armstrong        2023-11-30  2645  			#hwlock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2646  		};
10e02467129518 Neil Armstrong        2023-11-30  2647  
10e02467129518 Neil Armstrong        2023-11-30  2648  		tcsr: clock-controller@1fc0000 {
10e02467129518 Neil Armstrong        2023-11-30  2649  			compatible = "qcom,sm8650-tcsr", "syscon";
10e02467129518 Neil Armstrong        2023-11-30  2650  			reg = <0 0x01fc0000 0 0xa0000>;
10e02467129518 Neil Armstrong        2023-11-30  2651  
10e02467129518 Neil Armstrong        2023-11-30  2652  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2653  
10e02467129518 Neil Armstrong        2023-11-30  2654  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2655  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2656  		};
10e02467129518 Neil Armstrong        2023-11-30  2657  
db33633b05c0b5 Neil Armstrong        2024-03-18  2658  		gpu: gpu@3d00000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2659  			compatible = "qcom,adreno-43051401", "qcom,adreno";
db33633b05c0b5 Neil Armstrong        2024-03-18  2660  			reg = <0x0 0x03d00000 0x0 0x40000>,
0d80ac75cba26f Connor Abbott         2024-04-26  2661  			      <0x0 0x03d9e000 0x0 0x2000>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2662  			      <0x0 0x03d61000 0x0 0x800>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2663  			reg-names = "kgsl_3d0_reg_memory",
db33633b05c0b5 Neil Armstrong        2024-03-18  2664  				    "cx_mem",
db33633b05c0b5 Neil Armstrong        2024-03-18  2665  				    "cx_dbgc";
db33633b05c0b5 Neil Armstrong        2024-03-18  2666  
db33633b05c0b5 Neil Armstrong        2024-03-18  2667  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2668  
db33633b05c0b5 Neil Armstrong        2024-03-18  2669  			iommus = <&adreno_smmu 0 0x0>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2670  				 <&adreno_smmu 1 0x0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2671  
db33633b05c0b5 Neil Armstrong        2024-03-18  2672  			operating-points-v2 = <&gpu_opp_table>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2673  
db33633b05c0b5 Neil Armstrong        2024-03-18  2674  			qcom,gmu = <&gmu>;
497624ed550604 Konrad Dybcio         2024-05-10  2675  			#cooling-cells = <2>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2676  
63c21d61b46197 Neil Armstrong        2024-12-17  2677  			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
63c21d61b46197 Neil Armstrong        2024-12-17  2678  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
63c21d61b46197 Neil Armstrong        2024-12-17  2679  			interconnect-names = "gfx-mem";
63c21d61b46197 Neil Armstrong        2024-12-17  2680  
db33633b05c0b5 Neil Armstrong        2024-03-18  2681  			status = "disabled";
db33633b05c0b5 Neil Armstrong        2024-03-18  2682  
db33633b05c0b5 Neil Armstrong        2024-03-18  2683  			zap-shader {
db33633b05c0b5 Neil Armstrong        2024-03-18  2684  				memory-region = <&gpu_micro_code_mem>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2685  			};
db33633b05c0b5 Neil Armstrong        2024-03-18  2686  
db33633b05c0b5 Neil Armstrong        2024-03-18  2687  			/* Speedbin needs more work on A740+, keep only lower freqs */
db33633b05c0b5 Neil Armstrong        2024-03-18  2688  			gpu_opp_table: opp-table {
db33633b05c0b5 Neil Armstrong        2024-03-18  2689  				compatible = "operating-points-v2";
db33633b05c0b5 Neil Armstrong        2024-03-18  2690  
db33633b05c0b5 Neil Armstrong        2024-03-18  2691  				opp-231000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2692  					opp-hz = /bits/ 64 <231000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2693  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
63c21d61b46197 Neil Armstrong        2024-12-17  2694  					opp-peak-kBps = <2136718>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2695  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2696  
db33633b05c0b5 Neil Armstrong        2024-03-18  2697  				opp-310000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2698  					opp-hz = /bits/ 64 <310000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2699  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
63c21d61b46197 Neil Armstrong        2024-12-17  2700  					opp-peak-kBps = <2136718>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2701  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2702  
db33633b05c0b5 Neil Armstrong        2024-03-18  2703  				opp-366000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2704  					opp-hz = /bits/ 64 <366000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2705  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
63c21d61b46197 Neil Armstrong        2024-12-17  2706  					opp-peak-kBps = <6074218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2707  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2708  
db33633b05c0b5 Neil Armstrong        2024-03-18  2709  				opp-422000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2710  					opp-hz = /bits/ 64 <422000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2711  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
63c21d61b46197 Neil Armstrong        2024-12-17  2712  					opp-peak-kBps = <8171875>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2713  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2714  
db33633b05c0b5 Neil Armstrong        2024-03-18  2715  				opp-500000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2716  					opp-hz = /bits/ 64 <500000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2717  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
63c21d61b46197 Neil Armstrong        2024-12-17  2718  					opp-peak-kBps = <8171875>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2719  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2720  
db33633b05c0b5 Neil Armstrong        2024-03-18  2721  				opp-578000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2722  					opp-hz = /bits/ 64 <578000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2723  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
63c21d61b46197 Neil Armstrong        2024-12-17  2724  					opp-peak-kBps = <8171875>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2725  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2726  
db33633b05c0b5 Neil Armstrong        2024-03-18  2727  				opp-629000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2728  					opp-hz = /bits/ 64 <629000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2729  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
63c21d61b46197 Neil Armstrong        2024-12-17  2730  					opp-peak-kBps = <10687500>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2731  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2732  
db33633b05c0b5 Neil Armstrong        2024-03-18  2733  				opp-680000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2734  					opp-hz = /bits/ 64 <680000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2735  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
63c21d61b46197 Neil Armstrong        2024-12-17  2736  					opp-peak-kBps = <12449218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2737  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2738  
db33633b05c0b5 Neil Armstrong        2024-03-18  2739  				opp-720000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2740  					opp-hz = /bits/ 64 <720000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2741  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
63c21d61b46197 Neil Armstrong        2024-12-17  2742  					opp-peak-kBps = <12449218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2743  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2744  
db33633b05c0b5 Neil Armstrong        2024-03-18  2745  				opp-770000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2746  					opp-hz = /bits/ 64 <770000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2747  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
63c21d61b46197 Neil Armstrong        2024-12-17  2748  					opp-peak-kBps = <12449218>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2749  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2750  
db33633b05c0b5 Neil Armstrong        2024-03-18  2751  				opp-834000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2752  					opp-hz = /bits/ 64 <834000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2753  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
63c21d61b46197 Neil Armstrong        2024-12-17  2754  					opp-peak-kBps = <14398437>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2755  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2756  			};
db33633b05c0b5 Neil Armstrong        2024-03-18  2757  		};
db33633b05c0b5 Neil Armstrong        2024-03-18  2758  
db33633b05c0b5 Neil Armstrong        2024-03-18  2759  		gmu: gmu@3d6a000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2760  			compatible = "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";
db33633b05c0b5 Neil Armstrong        2024-03-18  2761  			reg = <0x0 0x03d6a000 0x0 0x35000>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2762  			      <0x0 0x03d50000 0x0 0x10000>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2763  			      <0x0 0x0b280000 0x0 0x10000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2764  			reg-names = "gmu", "rscc", "gmu_pdc";
db33633b05c0b5 Neil Armstrong        2024-03-18  2765  
db33633b05c0b5 Neil Armstrong        2024-03-18  2766  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2767  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2768  			interrupt-names = "hfi", "gmu";
db33633b05c0b5 Neil Armstrong        2024-03-18  2769  
db33633b05c0b5 Neil Armstrong        2024-03-18  2770  			clocks = <&gpucc GPU_CC_AHB_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2771  				 <&gpucc GPU_CC_CX_GMU_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2772  				 <&gpucc GPU_CC_CXO_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2773  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2774  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2775  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2776  				 <&gpucc GPU_CC_DEMET_CLK>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2777  			clock-names = "ahb",
db33633b05c0b5 Neil Armstrong        2024-03-18  2778  				      "gmu",
db33633b05c0b5 Neil Armstrong        2024-03-18  2779  				      "cxo",
db33633b05c0b5 Neil Armstrong        2024-03-18  2780  				      "axi",
db33633b05c0b5 Neil Armstrong        2024-03-18  2781  				      "memnoc",
db33633b05c0b5 Neil Armstrong        2024-03-18  2782  				      "hub",
db33633b05c0b5 Neil Armstrong        2024-03-18  2783  				      "demet";
db33633b05c0b5 Neil Armstrong        2024-03-18  2784  
db33633b05c0b5 Neil Armstrong        2024-03-18  2785  			power-domains = <&gpucc GPU_CX_GDSC>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2786  					<&gpucc GPU_GX_GDSC>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2787  			power-domain-names = "cx",
db33633b05c0b5 Neil Armstrong        2024-03-18  2788  					     "gx";
db33633b05c0b5 Neil Armstrong        2024-03-18  2789  
db33633b05c0b5 Neil Armstrong        2024-03-18  2790  			iommus = <&adreno_smmu 5 0x0>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2791  
db33633b05c0b5 Neil Armstrong        2024-03-18  2792  			qcom,qmp = <&aoss_qmp>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2793  
db33633b05c0b5 Neil Armstrong        2024-03-18  2794  			operating-points-v2 = <&gmu_opp_table>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2795  
db33633b05c0b5 Neil Armstrong        2024-03-18  2796  			gmu_opp_table: opp-table {
db33633b05c0b5 Neil Armstrong        2024-03-18  2797  				compatible = "operating-points-v2";
db33633b05c0b5 Neil Armstrong        2024-03-18  2798  
db33633b05c0b5 Neil Armstrong        2024-03-18  2799  				opp-260000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2800  					opp-hz = /bits/ 64 <260000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2801  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2802  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2803  
db33633b05c0b5 Neil Armstrong        2024-03-18  2804  				opp-625000000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2805  					opp-hz = /bits/ 64 <625000000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2806  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2807  				};
db33633b05c0b5 Neil Armstrong        2024-03-18  2808  			};
db33633b05c0b5 Neil Armstrong        2024-03-18  2809  		};
db33633b05c0b5 Neil Armstrong        2024-03-18  2810  
10e02467129518 Neil Armstrong        2023-11-30  2811  		gpucc: clock-controller@3d90000 {
10e02467129518 Neil Armstrong        2023-11-30  2812  			compatible = "qcom,sm8650-gpucc";
10e02467129518 Neil Armstrong        2023-11-30  2813  			reg = <0 0x03d90000 0 0xa000>;
10e02467129518 Neil Armstrong        2023-11-30  2814  
10e02467129518 Neil Armstrong        2023-11-30  2815  			clocks = <&bi_tcxo_div2>,
10e02467129518 Neil Armstrong        2023-11-30  2816  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
10e02467129518 Neil Armstrong        2023-11-30  2817  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
10e02467129518 Neil Armstrong        2023-11-30  2818  
10e02467129518 Neil Armstrong        2023-11-30  2819  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2820  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2821  			#power-domain-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2822  		};
10e02467129518 Neil Armstrong        2023-11-30  2823  
db33633b05c0b5 Neil Armstrong        2024-03-18  2824  		adreno_smmu: iommu@3da0000 {
db33633b05c0b5 Neil Armstrong        2024-03-18  2825  			compatible = "qcom,sm8650-smmu-500", "qcom,adreno-smmu",
db33633b05c0b5 Neil Armstrong        2024-03-18  2826  				     "qcom,smmu-500", "arm,mmu-500";
db33633b05c0b5 Neil Armstrong        2024-03-18  2827  			reg = <0x0 0x03da0000 0x0 0x40000>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2828  			#iommu-cells = <2>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2829  			#global-interrupts = <1>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2830  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2831  				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2832  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2833  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2834  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2835  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2836  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2837  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2838  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2839  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2840  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2841  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2842  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2843  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2844  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2845  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2846  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2847  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2848  				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2849  				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2850  				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2851  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2852  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2853  				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2854  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2855  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2856  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2857  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2858  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
db33633b05c0b5 Neil Armstrong        2024-03-18  2859  				 <&gpucc GPU_CC_AHB_CLK>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2860  			clock-names = "hlos",
db33633b05c0b5 Neil Armstrong        2024-03-18  2861  				      "bus",
db33633b05c0b5 Neil Armstrong        2024-03-18  2862  				      "iface",
db33633b05c0b5 Neil Armstrong        2024-03-18  2863  				      "ahb";
db33633b05c0b5 Neil Armstrong        2024-03-18  2864  			power-domains = <&gpucc GPU_CX_GDSC>;
db33633b05c0b5 Neil Armstrong        2024-03-18  2865  			dma-coherent;
db33633b05c0b5 Neil Armstrong        2024-03-18  2866  		};
db33633b05c0b5 Neil Armstrong        2024-03-18  2867  
9fdddbd134a688 Neil Armstrong        2023-12-01  2868  		ipa: ipa@3f40000 {
9fdddbd134a688 Neil Armstrong        2023-12-01  2869  			compatible = "qcom,sm8650-ipa", "qcom,sm8550-ipa";
9fdddbd134a688 Neil Armstrong        2023-12-01  2870  
9fdddbd134a688 Neil Armstrong        2023-12-01  2871  			iommus = <&apps_smmu 0x4a0 0x0>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2872  				 <&apps_smmu 0x4a2 0x0>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2873  			reg = <0 0x3f40000 0 0x10000>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2874  			      <0 0x3f50000 0 0x5000>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2875  			      <0 0x3e04000 0 0xfc000>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2876  			reg-names = "ipa-reg",
9fdddbd134a688 Neil Armstrong        2023-12-01  2877  				    "ipa-shared",
9fdddbd134a688 Neil Armstrong        2023-12-01  2878  				    "gsi";
9fdddbd134a688 Neil Armstrong        2023-12-01  2879  
9fdddbd134a688 Neil Armstrong        2023-12-01  2880  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2881  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2882  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2883  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2884  			interrupt-names = "ipa",
9fdddbd134a688 Neil Armstrong        2023-12-01  2885  					  "gsi",
9fdddbd134a688 Neil Armstrong        2023-12-01  2886  					  "ipa-clock-query",
9fdddbd134a688 Neil Armstrong        2023-12-01  2887  					  "ipa-setup-ready";
9fdddbd134a688 Neil Armstrong        2023-12-01  2888  
9fdddbd134a688 Neil Armstrong        2023-12-01  2889  			clocks = <&rpmhcc RPMH_IPA_CLK>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2890  			clock-names = "core";
9fdddbd134a688 Neil Armstrong        2023-12-01  2891  
9fdddbd134a688 Neil Armstrong        2023-12-01  2892  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2893  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2894  			interconnect-names = "memory",
9fdddbd134a688 Neil Armstrong        2023-12-01  2895  					     "config";
9fdddbd134a688 Neil Armstrong        2023-12-01  2896  
9fdddbd134a688 Neil Armstrong        2023-12-01  2897  			qcom,qmp = <&aoss_qmp>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2898  
9fdddbd134a688 Neil Armstrong        2023-12-01  2899  			qcom,smem-states = <&ipa_smp2p_out 0>,
9fdddbd134a688 Neil Armstrong        2023-12-01  2900  					   <&ipa_smp2p_out 1>;
9fdddbd134a688 Neil Armstrong        2023-12-01  2901  			qcom,smem-state-names = "ipa-clock-enabled-valid",
9fdddbd134a688 Neil Armstrong        2023-12-01  2902  						"ipa-clock-enabled";
9fdddbd134a688 Neil Armstrong        2023-12-01  2903  
9fdddbd134a688 Neil Armstrong        2023-12-01  2904  			status = "disabled";
9fdddbd134a688 Neil Armstrong        2023-12-01  2905  		};
9fdddbd134a688 Neil Armstrong        2023-12-01  2906  
10e02467129518 Neil Armstrong        2023-11-30  2907  		remoteproc_mpss: remoteproc@4080000 {
10e02467129518 Neil Armstrong        2023-11-30  2908  			compatible = "qcom,sm8650-mpss-pas";
d4fa87daf3dd39 Krzysztof Kozlowski   2024-12-13  2909  			reg = <0x0 0x04080000 0x0 0x10000>;
10e02467129518 Neil Armstrong        2023-11-30  2910  
10e02467129518 Neil Armstrong        2023-11-30  2911  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  2912  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  2913  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  2914  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  2915  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  2916  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  2917  			interrupt-names = "wdog",
10e02467129518 Neil Armstrong        2023-11-30  2918  					  "fatal",
10e02467129518 Neil Armstrong        2023-11-30  2919  					  "ready",
10e02467129518 Neil Armstrong        2023-11-30  2920  					  "handover",
10e02467129518 Neil Armstrong        2023-11-30  2921  					  "stop-ack",
10e02467129518 Neil Armstrong        2023-11-30  2922  					  "shutdown-ack";
10e02467129518 Neil Armstrong        2023-11-30  2923  
10e02467129518 Neil Armstrong        2023-11-30  2924  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  2925  			clock-names = "xo";
10e02467129518 Neil Armstrong        2023-11-30  2926  
10e02467129518 Neil Armstrong        2023-11-30  2927  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  2928  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  2929  
10e02467129518 Neil Armstrong        2023-11-30  2930  			power-domains = <&rpmhpd RPMHPD_CX>,
10e02467129518 Neil Armstrong        2023-11-30  2931  					<&rpmhpd RPMHPD_MSS>;
10e02467129518 Neil Armstrong        2023-11-30  2932  			power-domain-names = "cx",
10e02467129518 Neil Armstrong        2023-11-30  2933  					     "mss";
10e02467129518 Neil Armstrong        2023-11-30  2934  
10e02467129518 Neil Armstrong        2023-11-30  2935  			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
af53ecef19ffab Neil Armstrong        2024-01-23  2936  					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
af53ecef19ffab Neil Armstrong        2024-01-23  2937  					<&qlink_logging_mem>;
10e02467129518 Neil Armstrong        2023-11-30  2938  
10e02467129518 Neil Armstrong        2023-11-30  2939  			qcom,qmp = <&aoss_qmp>;
10e02467129518 Neil Armstrong        2023-11-30  2940  
10e02467129518 Neil Armstrong        2023-11-30  2941  			qcom,smem-states = <&smp2p_modem_out 0>;
10e02467129518 Neil Armstrong        2023-11-30  2942  			qcom,smem-state-names = "stop";
10e02467129518 Neil Armstrong        2023-11-30  2943  
10e02467129518 Neil Armstrong        2023-11-30  2944  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  2945  
10e02467129518 Neil Armstrong        2023-11-30  2946  			glink-edge {
10e02467129518 Neil Armstrong        2023-11-30  2947  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30  2948  							     IPCC_MPROC_SIGNAL_GLINK_QMP
10e02467129518 Neil Armstrong        2023-11-30  2949  							     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  2950  
10e02467129518 Neil Armstrong        2023-11-30  2951  				mboxes = <&ipcc IPCC_CLIENT_MPSS
10e02467129518 Neil Armstrong        2023-11-30  2952  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e02467129518 Neil Armstrong        2023-11-30  2953  
10e02467129518 Neil Armstrong        2023-11-30  2954  				qcom,remote-pid = <1>;
10e02467129518 Neil Armstrong        2023-11-30  2955  
10e02467129518 Neil Armstrong        2023-11-30  2956  				label = "mpss";
10e02467129518 Neil Armstrong        2023-11-30  2957  			};
10e02467129518 Neil Armstrong        2023-11-30  2958  		};
10e02467129518 Neil Armstrong        2023-11-30  2959  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2960  		remoteproc_adsp: remoteproc@6800000 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2961  			compatible = "qcom,sm8650-adsp-pas";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2962  			reg = <0x0 0x06800000 0x0 0x10000>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2963  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2964  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2965  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2966  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2967  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2968  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2969  			interrupt-names = "wdog",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2970  					  "fatal",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2971  					  "ready",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2972  					  "handover",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2973  					  "stop-ack";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2974  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2975  			clocks = <&rpmhcc RPMH_CXO_CLK>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2976  			clock-names = "xo";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2977  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2978  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2979  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2980  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2981  			power-domains = <&rpmhpd RPMHPD_LCX>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2982  					<&rpmhpd RPMHPD_LMX>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2983  			power-domain-names = "lcx",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2984  					     "lmx";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2985  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2986  			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2987  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2988  			qcom,qmp = <&aoss_qmp>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2989  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2990  			qcom,smem-states = <&smp2p_adsp_out 0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2991  			qcom,smem-state-names = "stop";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2992  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2993  			status = "disabled";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2994  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2995  			remoteproc_adsp_glink: glink-edge {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2996  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2997  							     IPCC_MPROC_SIGNAL_GLINK_QMP
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2998  							     IRQ_TYPE_EDGE_RISING>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  2999  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3000  				mboxes = <&ipcc IPCC_CLIENT_LPASS
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3001  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3002  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3003  				qcom,remote-pid = <2>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3004  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3005  				label = "lpass";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3006  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3007  				fastrpc {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3008  					compatible = "qcom,fastrpc";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3009  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3010  					qcom,glink-channels = "fastrpcglink-apps-dsp";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3011  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3012  					label = "adsp";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3013  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3014  					qcom,non-secure-domain;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3015  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3016  					#address-cells = <1>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3017  					#size-cells = <0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3018  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3019  					compute-cb@3 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3020  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3021  						reg = <3>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3022  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3023  						iommus = <&apps_smmu 0x1003 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3024  							 <&apps_smmu 0x1043 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3025  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3026  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3027  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3028  					compute-cb@4 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3029  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3030  						reg = <4>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3031  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3032  						iommus = <&apps_smmu 0x1004 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3033  							 <&apps_smmu 0x1044 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3034  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3035  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3036  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3037  					compute-cb@5 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3038  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3039  						reg = <5>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3040  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3041  						iommus = <&apps_smmu 0x1005 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3042  							 <&apps_smmu 0x1045 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3043  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3044  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3045  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3046  					compute-cb@6 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3047  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3048  						reg = <6>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3049  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3050  						iommus = <&apps_smmu 0x1006 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3051  							 <&apps_smmu 0x1046 0x20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3052  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3053  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3054  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3055  					compute-cb@7 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3056  						compatible = "qcom,fastrpc-compute-cb";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3057  						reg = <7>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3058  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3059  						iommus = <&apps_smmu 0x1007 0x40>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3060  							 <&apps_smmu 0x1067 0x0>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3061  							 <&apps_smmu 0x1087 0x0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3062  						dma-coherent;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3063  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3064  				};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3065  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3066  				gpr {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3067  					compatible = "qcom,gpr";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3068  					qcom,glink-channels = "adsp_apps";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3069  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3070  					qcom,intents = <512 20>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3071  					#address-cells = <1>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3072  					#size-cells = <0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3073  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3074  					q6apm: service@1 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3075  						compatible = "qcom,q6apm";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3076  						reg = <GPR_APM_MODULE_IID>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3077  						#sound-dai-cells = <0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3078  						qcom,protection-domain = "avs/audio",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3079  									 "msm/adsp/audio_pd";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3080  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3081  						q6apmbedai: bedais {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3082  							compatible = "qcom,q6apm-lpass-dais";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3083  							#sound-dai-cells = <1>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3084  						};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3085  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3086  						q6apmdai: dais {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3087  							compatible = "qcom,q6apm-dais";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3088  							iommus = <&apps_smmu 0x1001 0x80>,
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3089  								 <&apps_smmu 0x1061 0x0>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3090  						};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3091  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3092  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3093  					q6prm: service@2 {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3094  						compatible = "qcom,q6prm";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3095  						reg = <GPR_PRM_MODULE_IID>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3096  						qcom,protection-domain = "avs/audio",
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3097  									 "msm/adsp/audio_pd";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3098  
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3099  						q6prmcc: clock-controller {
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3100  							compatible = "qcom,q6prm-lpass-clocks";
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3101  							#clock-cells = <2>;
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3102  						};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3103  					};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3104  				};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3105  			};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3106  		};
b6ddc5c37323f7 Krzysztof Kozlowski   2024-12-13  3107  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3108  		lpass_wsa2macro: codec@6aa0000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3109  			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3110  			reg = <0 0x06aa0000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3111  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3112  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3113  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3114  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3115  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3116  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3117  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3118  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3119  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3120  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3121  			clock-output-names = "wsa2-mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3122  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3123  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3124  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3125  		swr3: soundwire@6ab0000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3126  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3127  			reg = <0 0x06ab0000 0 0x10000>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3128  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3129  			clocks = <&lpass_wsa2macro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3130  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3131  			label = "WSA2";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3132  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3133  			pinctrl-0 = <&wsa2_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3134  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3135  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3136  			qcom,din-ports = <4>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3137  			qcom,dout-ports = <9>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3138  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3139  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3140  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3141  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3142  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3143  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3144  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3145  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3146  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3147  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3148  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3149  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3150  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3151  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3152  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3153  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3154  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3155  		lpass_rxmacro: codec@6ac0000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3156  			compatible = "qcom,sm8650-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3157  			reg = <0 0x06ac0000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3158  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3159  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3160  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3161  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3162  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3163  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3164  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3165  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3166  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3167  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3168  			clock-output-names = "mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3169  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3170  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3171  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3172  		swr1: soundwire@6ad0000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3173  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3174  			reg = <0 0x06ad0000 0 0x10000>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3175  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3176  			clocks = <&lpass_rxmacro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3177  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3178  			label = "RX";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3179  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3180  			pinctrl-0 = <&rx_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3181  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3182  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3183  			qcom,din-ports = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3184  			qcom,dout-ports = <11>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3185  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3186  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3187  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3188  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3189  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3190  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3191  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3192  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3193  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3194  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3195  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3196  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3197  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3198  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3199  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3200  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3201  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3202  		lpass_txmacro: codec@6ae0000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3203  			compatible = "qcom,sm8650-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3204  			reg = <0 0x06ae0000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3205  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3206  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3207  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3208  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3209  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3210  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3211  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3212  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3213  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3214  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3215  			clock-output-names = "mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3216  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3217  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3218  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3219  		lpass_wsamacro: codec@6b00000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3220  			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3221  			reg = <0 0x06b00000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3222  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3223  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3224  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3225  				 <&lpass_vamacro>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3226  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3227  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3228  				      "dcodec",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3229  				      "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3230  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3231  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3232  			clock-output-names = "mclk";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3233  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3234  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3235  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3236  		swr0: soundwire@6b10000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3237  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3238  			reg = <0 0x06b10000 0 0x10000>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3239  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3240  			clocks = <&lpass_wsamacro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3241  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3242  			label = "WSA";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3243  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3244  			pinctrl-0 = <&wsa_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3245  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3246  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3247  			qcom,din-ports = <4>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3248  			qcom,dout-ports = <9>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3249  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3250  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3251  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3252  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3253  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3254  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3255  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3256  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3257  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3258  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3259  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3260  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3261  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3262  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3263  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3264  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3265  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3266  		swr2: soundwire@6d30000 {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3267  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3268  			reg = <0 0x06d30000 0 0x10000>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3269  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3270  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3271  			interrupt-names = "core", "wakeup";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3272  			clocks = <&lpass_txmacro>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3273  			clock-names = "iface";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3274  			label = "TX";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3275  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3276  			pinctrl-0 = <&tx_swr_active>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3277  			pinctrl-names = "default";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3278  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3279  			qcom,din-ports = <4>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3280  			qcom,dout-ports = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3281  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3282  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3283  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3284  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3285  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3286  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3287  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3288  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3289  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3290  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3291  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3292  			#address-cells = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3293  			#size-cells = <0>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3294  			#sound-dai-cells = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3295  			status = "disabled";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3296  		};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3297  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3298  		lpass_vamacro: codec@6d44000 {
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3299  			compatible = "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3300  			reg = <0 0x06d44000 0 0x1000>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3301  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3302  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3303  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3304  			clock-names = "mclk",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3305  				      "macro",
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3306  				      "dcodec";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3307  
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3308  			#clock-cells = <0>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3309  			clock-output-names = "fsgen";
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3310  			#sound-dai-cells = <1>;
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3311  		};
58872a54e4a858 Krzysztof Kozlowski   2023-12-04  3312  
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3313  		lpass_tlmm: pinctrl@6e80000 {
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3314  			compatible = "qcom,sm8650-lpass-lpi-pinctrl";
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3315  			reg = <0 0x06e80000 0 0x20000>;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3316  
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3317  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3318  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3319  			clock-names = "core", "audio";
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3320  
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3321  			gpio-controller;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3322  			#gpio-cells = <2>;
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3323  			gpio-ranges = <&lpass_tlmm 0 0 23>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3324  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3325  			tx_swr_active: tx-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3326  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3327  					pins = "gpio0";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3328  					function = "swr_tx_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3329  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3330  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3331  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3332  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3333  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3334  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3335  					pins = "gpio1", "gpio2", "gpio14";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3336  					function = "swr_tx_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3337  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3338  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3339  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3340  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3341  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3342  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3343  			rx_swr_active: rx-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3344  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3345  					pins = "gpio3";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3346  					function = "swr_rx_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3347  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3348  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3349  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3350  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3351  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3352  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3353  					pins = "gpio4", "gpio5";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3354  					function = "swr_rx_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3355  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3356  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3357  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3358  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3359  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3360  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3361  			dmic01_default: dmic01-default-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3362  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3363  					pins = "gpio6";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3364  					function = "dmic1_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3365  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3366  					output-high;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3367  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3368  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3369  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3370  					pins = "gpio7";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3371  					function = "dmic1_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3372  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3373  					input-enable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3374  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3375  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3376  
94c312767160f0 Krzysztof Kozlowski   2024-02-12  3377  			dmic23_default: dmic23-default-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3378  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3379  					pins = "gpio8";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3380  					function = "dmic2_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3381  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3382  					output-high;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3383  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3384  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3385  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3386  					pins = "gpio9";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3387  					function = "dmic2_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3388  					drive-strength = <8>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3389  					input-enable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3390  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3391  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3392  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3393  			wsa_swr_active: wsa-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3394  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3395  					pins = "gpio10";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3396  					function = "wsa_swr_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3397  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3398  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3399  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3400  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3401  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3402  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3403  					pins = "gpio11";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3404  					function = "wsa_swr_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3405  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3406  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3407  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3408  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3409  			};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3410  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3411  			wsa2_swr_active: wsa2-swr-active-state {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3412  				clk-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3413  					pins = "gpio15";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3414  					function = "wsa2_swr_clk";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3415  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3416  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3417  					bias-disable;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3418  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3419  
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3420  				data-pins {
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3421  					pins = "gpio16";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3422  					function = "wsa2_swr_data";
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3423  					drive-strength = <2>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3424  					slew-rate = <1>;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3425  					bias-bus-hold;
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3426  				};
6a45a90c0c475b Krzysztof Kozlowski   2023-12-04  3427  			};
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3428  		};
2d6bc13321c902 Krzysztof Kozlowski   2023-12-04  3429  
10e02467129518 Neil Armstrong        2023-11-30  3430  		lpass_lpiaon_noc: interconnect@7400000 {
10e02467129518 Neil Armstrong        2023-11-30  3431  			compatible = "qcom,sm8650-lpass-lpiaon-noc";
10e02467129518 Neil Armstrong        2023-11-30  3432  			reg = <0 0x07400000 0 0x19080>;
10e02467129518 Neil Armstrong        2023-11-30  3433  
10e02467129518 Neil Armstrong        2023-11-30  3434  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3435  
10e02467129518 Neil Armstrong        2023-11-30  3436  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3437  		};
10e02467129518 Neil Armstrong        2023-11-30  3438  
10e02467129518 Neil Armstrong        2023-11-30  3439  		lpass_lpicx_noc: interconnect@7430000 {
10e02467129518 Neil Armstrong        2023-11-30  3440  			compatible = "qcom,sm8650-lpass-lpicx-noc";
10e02467129518 Neil Armstrong        2023-11-30  3441  			reg = <0 0x07430000 0 0x3a200>;
10e02467129518 Neil Armstrong        2023-11-30  3442  
10e02467129518 Neil Armstrong        2023-11-30  3443  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3444  
10e02467129518 Neil Armstrong        2023-11-30  3445  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3446  		};
10e02467129518 Neil Armstrong        2023-11-30  3447  
10e02467129518 Neil Armstrong        2023-11-30  3448  		lpass_ag_noc: interconnect@7e40000 {
10e02467129518 Neil Armstrong        2023-11-30  3449  			compatible = "qcom,sm8650-lpass-ag-noc";
10e02467129518 Neil Armstrong        2023-11-30  3450  			reg = <0 0x07e40000 0 0xe080>;
10e02467129518 Neil Armstrong        2023-11-30  3451  
10e02467129518 Neil Armstrong        2023-11-30  3452  			#interconnect-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3453  
10e02467129518 Neil Armstrong        2023-11-30  3454  			qcom,bcm-voters = <&apps_bcm_voter>;
10e02467129518 Neil Armstrong        2023-11-30  3455  		};
10e02467129518 Neil Armstrong        2023-11-30  3456  
10e02467129518 Neil Armstrong        2023-11-30  3457  		sdhc_2: mmc@8804000 {
10e02467129518 Neil Armstrong        2023-11-30  3458  			compatible = "qcom,sm8650-sdhci", "qcom,sdhci-msm-v5";
10e02467129518 Neil Armstrong        2023-11-30  3459  			reg = <0 0x08804000 0 0x1000>;
10e02467129518 Neil Armstrong        2023-11-30  3460  
10e02467129518 Neil Armstrong        2023-11-30  3461  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  3462  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  3463  			interrupt-names = "hc_irq",
10e02467129518 Neil Armstrong        2023-11-30  3464  					  "pwr_irq";
10e02467129518 Neil Armstrong        2023-11-30  3465  
10e02467129518 Neil Armstrong        2023-11-30  3466  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3467  				 <&gcc GCC_SDCC2_APPS_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3468  				 <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3469  			clock-names = "iface",
10e02467129518 Neil Armstrong        2023-11-30  3470  				      "core",
10e02467129518 Neil Armstrong        2023-11-30  3471  				      "xo";
10e02467129518 Neil Armstrong        2023-11-30  3472  
10e02467129518 Neil Armstrong        2023-11-30  3473  			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3474  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e02467129518 Neil Armstrong        2023-11-30  3475  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3476  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
10e02467129518 Neil Armstrong        2023-11-30  3477  			interconnect-names = "sdhc-ddr",
10e02467129518 Neil Armstrong        2023-11-30  3478  					     "cpu-sdhc";
10e02467129518 Neil Armstrong        2023-11-30  3479  
10e02467129518 Neil Armstrong        2023-11-30  3480  			power-domains = <&rpmhpd RPMHPD_CX>;
10e02467129518 Neil Armstrong        2023-11-30  3481  			operating-points-v2 = <&sdhc2_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  3482  
10e02467129518 Neil Armstrong        2023-11-30  3483  			iommus = <&apps_smmu 0x540 0>;
10e02467129518 Neil Armstrong        2023-11-30  3484  
10e02467129518 Neil Armstrong        2023-11-30  3485  			bus-width = <4>;
10e02467129518 Neil Armstrong        2023-11-30  3486  
10e02467129518 Neil Armstrong        2023-11-30  3487  			/* Forbid SDR104/SDR50 - broken hw! */
10e02467129518 Neil Armstrong        2023-11-30  3488  			sdhci-caps-mask = <0x3 0>;
10e02467129518 Neil Armstrong        2023-11-30  3489  
10e02467129518 Neil Armstrong        2023-11-30  3490  			qcom,dll-config = <0x0007642c>;
10e02467129518 Neil Armstrong        2023-11-30  3491  			qcom,ddr-config = <0x80040868>;
10e02467129518 Neil Armstrong        2023-11-30  3492  
10e02467129518 Neil Armstrong        2023-11-30  3493  			dma-coherent;
10e02467129518 Neil Armstrong        2023-11-30  3494  
10e02467129518 Neil Armstrong        2023-11-30  3495  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3496  
10e02467129518 Neil Armstrong        2023-11-30  3497  			sdhc2_opp_table: opp-table {
10e02467129518 Neil Armstrong        2023-11-30  3498  				compatible = "operating-points-v2";
10e02467129518 Neil Armstrong        2023-11-30  3499  
10e02467129518 Neil Armstrong        2023-11-30  3500  				opp-19200000 {
10e02467129518 Neil Armstrong        2023-11-30  3501  					opp-hz = /bits/ 64 <19200000>;
10e02467129518 Neil Armstrong        2023-11-30  3502  					required-opps = <&rpmhpd_opp_min_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3503  				};
10e02467129518 Neil Armstrong        2023-11-30  3504  
10e02467129518 Neil Armstrong        2023-11-30  3505  				opp-50000000 {
10e02467129518 Neil Armstrong        2023-11-30  3506  					opp-hz = /bits/ 64 <50000000>;
10e02467129518 Neil Armstrong        2023-11-30  3507  					required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3508  				};
10e02467129518 Neil Armstrong        2023-11-30  3509  
10e02467129518 Neil Armstrong        2023-11-30  3510  				opp-100000000 {
10e02467129518 Neil Armstrong        2023-11-30  3511  					opp-hz = /bits/ 64 <100000000>;
10e02467129518 Neil Armstrong        2023-11-30  3512  					required-opps = <&rpmhpd_opp_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3513  				};
10e02467129518 Neil Armstrong        2023-11-30  3514  
10e02467129518 Neil Armstrong        2023-11-30  3515  				opp-202000000 {
10e02467129518 Neil Armstrong        2023-11-30  3516  					opp-hz = /bits/ 64 <202000000>;
10e02467129518 Neil Armstrong        2023-11-30  3517  					required-opps = <&rpmhpd_opp_svs_l1>;
10e02467129518 Neil Armstrong        2023-11-30  3518  				};
10e02467129518 Neil Armstrong        2023-11-30  3519  			};
10e02467129518 Neil Armstrong        2023-11-30  3520  		};
10e02467129518 Neil Armstrong        2023-11-30  3521  
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3522  		videocc: clock-controller@aaf0000 {
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3523  			compatible = "qcom,sm8650-videocc";
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3524  			reg = <0 0x0aaf0000 0 0x10000>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3525  			clocks = <&bi_tcxo_div2>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3526  				 <&gcc GCC_VIDEO_AHB_CLK>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3527  			power-domains = <&rpmhpd RPMHPD_MMCX>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3528  			#clock-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3529  			#reset-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3530  			#power-domain-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3531  		};
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3532  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3533  		cci0: cci@ac15000 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3534  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3535  			reg = <0 0x0ac15000 0 0x1000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3536  			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3537  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3538  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3539  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3540  				 <&camcc CAM_CC_CCI_0_CLK>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3541  			clock-names = "camnoc_axi",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3542  				      "cpas_ahb",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3543  				      "cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3544  			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3545  			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3546  			pinctrl-names = "default", "sleep";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3547  			status = "disabled";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3548  			#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3549  			#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3550  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3551  			cci0_i2c0: i2c-bus@0 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3552  				reg = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3553  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3554  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3555  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3556  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3557  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3558  			cci0_i2c1: i2c-bus@1 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3559  				reg = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3560  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3561  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3562  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3563  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3564  		};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3565  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3566  		cci1: cci@ac16000 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3567  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3568  			reg = <0 0x0ac16000 0 0x1000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3569  			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3570  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3571  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3572  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3573  				 <&camcc CAM_CC_CCI_1_CLK>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3574  			clock-names = "camnoc_axi",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3575  				      "cpas_ahb",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3576  				      "cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3577  			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3578  			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3579  			pinctrl-names = "default", "sleep";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3580  			status = "disabled";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3581  			#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3582  			#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3583  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3584  			cci1_i2c0: i2c-bus@0 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3585  				reg = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3586  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3587  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3588  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3589  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3590  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3591  			cci1_i2c1: i2c-bus@1 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3592  				reg = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3593  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3594  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3595  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3596  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3597  		};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3598  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3599  		cci2: cci@ac17000 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3600  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3601  			reg = <0 0x0ac17000 0 0x1000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3602  			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3603  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3604  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3605  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3606  				 <&camcc CAM_CC_CCI_2_CLK>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3607  			clock-names = "camnoc_axi",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3608  				      "cpas_ahb",
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3609  				      "cci";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3610  			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3611  			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3612  			pinctrl-names = "default", "sleep";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3613  			status = "disabled";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3614  			#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3615  			#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3616  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3617  			cci2_i2c0: i2c-bus@0 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3618  				reg = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3619  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3620  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3621  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3622  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3623  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3624  			cci2_i2c1: i2c-bus@1 {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3625  				reg = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3626  				clock-frequency = <1000000>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3627  				#address-cells = <1>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3628  				#size-cells = <0>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3629  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3630  		};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  3631  
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3632  		camcc: clock-controller@ade0000 {
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3633  			compatible = "qcom,sm8650-camcc";
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3634  			reg = <0 0x0ade0000 0 0x20000>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3635  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3636  				 <&bi_tcxo_div2>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3637  				 <&bi_tcxo_ao_div2>,
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3638  				 <&sleep_clk>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3639  			power-domains = <&rpmhpd RPMHPD_MMCX>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3640  			#clock-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3641  			#reset-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3642  			#power-domain-cells = <1>;
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3643  		};
0bdb730e63f662 Jagadeesh Kona        2024-06-02  3644  
10e02467129518 Neil Armstrong        2023-11-30  3645  		mdss: display-subsystem@ae00000 {
10e02467129518 Neil Armstrong        2023-11-30  3646  			compatible = "qcom,sm8650-mdss";
10e02467129518 Neil Armstrong        2023-11-30  3647  			reg = <0 0x0ae00000 0 0x1000>;
10e02467129518 Neil Armstrong        2023-11-30  3648  			reg-names = "mdss";
10e02467129518 Neil Armstrong        2023-11-30  3649  
10e02467129518 Neil Armstrong        2023-11-30  3650  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  3651  
10e02467129518 Neil Armstrong        2023-11-30  3652  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3653  				 <&gcc GCC_DISP_HF_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3654  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3655  
10e02467129518 Neil Armstrong        2023-11-30  3656  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  3657  
10e02467129518 Neil Armstrong        2023-11-30  3658  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
10e02467129518 Neil Armstrong        2023-11-30  3659  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
9fa33cbca3d284 Dmitry Baryshkov      2024-10-26  3660  			interconnect-names = "mdp0-mem";
10e02467129518 Neil Armstrong        2023-11-30  3661  
10e02467129518 Neil Armstrong        2023-11-30  3662  			power-domains = <&dispcc MDSS_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  3663  
10e02467129518 Neil Armstrong        2023-11-30  3664  			iommus = <&apps_smmu 0x1c00 0x2>;
10e02467129518 Neil Armstrong        2023-11-30  3665  
10e02467129518 Neil Armstrong        2023-11-30  3666  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  3667  			#interrupt-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3668  
10e02467129518 Neil Armstrong        2023-11-30  3669  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3670  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  3671  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  3672  
10e02467129518 Neil Armstrong        2023-11-30  3673  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3674  
10e02467129518 Neil Armstrong        2023-11-30  3675  			mdss_mdp: display-controller@ae01000 {
10e02467129518 Neil Armstrong        2023-11-30  3676  				compatible = "qcom,sm8650-dpu";
10e02467129518 Neil Armstrong        2023-11-30  3677  				reg = <0 0x0ae01000 0 0x8f000>,
10e02467129518 Neil Armstrong        2023-11-30  3678  				      <0 0x0aeb0000 0 0x2008>;
10e02467129518 Neil Armstrong        2023-11-30  3679  				reg-names = "mdp",
10e02467129518 Neil Armstrong        2023-11-30  3680  					    "vbif";
10e02467129518 Neil Armstrong        2023-11-30  3681  
10e02467129518 Neil Armstrong        2023-11-30  3682  				interrupts-extended = <&mdss 0>;
10e02467129518 Neil Armstrong        2023-11-30  3683  
10e02467129518 Neil Armstrong        2023-11-30  3684  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3685  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3686  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3687  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3688  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3689  				clock-names = "nrt_bus",
10e02467129518 Neil Armstrong        2023-11-30  3690  					      "iface",
10e02467129518 Neil Armstrong        2023-11-30  3691  					      "lut",
10e02467129518 Neil Armstrong        2023-11-30  3692  					      "core",
10e02467129518 Neil Armstrong        2023-11-30  3693  					      "vsync";
10e02467129518 Neil Armstrong        2023-11-30  3694  
10e02467129518 Neil Armstrong        2023-11-30  3695  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3696  				assigned-clock-rates = <19200000>;
10e02467129518 Neil Armstrong        2023-11-30  3697  
10e02467129518 Neil Armstrong        2023-11-30  3698  				operating-points-v2 = <&mdp_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  3699  
10e02467129518 Neil Armstrong        2023-11-30  3700  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  3701  
10e02467129518 Neil Armstrong        2023-11-30  3702  				ports {
10e02467129518 Neil Armstrong        2023-11-30  3703  					#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3704  					#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3705  
10e02467129518 Neil Armstrong        2023-11-30  3706  					port@0 {
10e02467129518 Neil Armstrong        2023-11-30  3707  						reg = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3708  
10e02467129518 Neil Armstrong        2023-11-30  3709  						dpu_intf1_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  3710  							remote-endpoint = <&mdss_dsi0_in>;
10e02467129518 Neil Armstrong        2023-11-30  3711  						};
10e02467129518 Neil Armstrong        2023-11-30  3712  					};
10e02467129518 Neil Armstrong        2023-11-30  3713  
10e02467129518 Neil Armstrong        2023-11-30  3714  					port@1 {
10e02467129518 Neil Armstrong        2023-11-30  3715  						reg = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3716  
10e02467129518 Neil Armstrong        2023-11-30  3717  						dpu_intf2_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  3718  							remote-endpoint = <&mdss_dsi1_in>;
10e02467129518 Neil Armstrong        2023-11-30  3719  						};
10e02467129518 Neil Armstrong        2023-11-30  3720  					};
990b6c928b212d Neil Armstrong        2023-12-08  3721  
990b6c928b212d Neil Armstrong        2023-12-08  3722  					port@2 {
990b6c928b212d Neil Armstrong        2023-12-08  3723  						reg = <2>;
990b6c928b212d Neil Armstrong        2023-12-08  3724  
990b6c928b212d Neil Armstrong        2023-12-08  3725  						dpu_intf0_out: endpoint {
990b6c928b212d Neil Armstrong        2023-12-08  3726  							remote-endpoint = <&mdss_dp0_in>;
990b6c928b212d Neil Armstrong        2023-12-08  3727  						};
990b6c928b212d Neil Armstrong        2023-12-08  3728  					};
10e02467129518 Neil Armstrong        2023-11-30  3729  				};
10e02467129518 Neil Armstrong        2023-11-30  3730  
10e02467129518 Neil Armstrong        2023-11-30  3731  				mdp_opp_table: opp-table {
10e02467129518 Neil Armstrong        2023-11-30  3732  					compatible = "operating-points-v2";
10e02467129518 Neil Armstrong        2023-11-30  3733  
10e02467129518 Neil Armstrong        2023-11-30  3734  					opp-200000000 {
10e02467129518 Neil Armstrong        2023-11-30  3735  						opp-hz = /bits/ 64 <200000000>;
10e02467129518 Neil Armstrong        2023-11-30  3736  						required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3737  					};
10e02467129518 Neil Armstrong        2023-11-30  3738  
10e02467129518 Neil Armstrong        2023-11-30  3739  					opp-325000000 {
10e02467129518 Neil Armstrong        2023-11-30  3740  						opp-hz = /bits/ 64 <325000000>;
10e02467129518 Neil Armstrong        2023-11-30  3741  						required-opps = <&rpmhpd_opp_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3742  					};
10e02467129518 Neil Armstrong        2023-11-30  3743  
10e02467129518 Neil Armstrong        2023-11-30  3744  					opp-375000000 {
10e02467129518 Neil Armstrong        2023-11-30  3745  						opp-hz = /bits/ 64 <375000000>;
10e02467129518 Neil Armstrong        2023-11-30  3746  						required-opps = <&rpmhpd_opp_svs_l1>;
10e02467129518 Neil Armstrong        2023-11-30  3747  					};
10e02467129518 Neil Armstrong        2023-11-30  3748  
10e02467129518 Neil Armstrong        2023-11-30  3749  					opp-514000000 {
10e02467129518 Neil Armstrong        2023-11-30  3750  						opp-hz = /bits/ 64 <514000000>;
10e02467129518 Neil Armstrong        2023-11-30  3751  						required-opps = <&rpmhpd_opp_nom>;
10e02467129518 Neil Armstrong        2023-11-30  3752  					};
10e02467129518 Neil Armstrong        2023-11-30  3753  				};
10e02467129518 Neil Armstrong        2023-11-30  3754  			};
10e02467129518 Neil Armstrong        2023-11-30  3755  
10e02467129518 Neil Armstrong        2023-11-30  3756  			mdss_dsi0: dsi@ae94000 {
10e02467129518 Neil Armstrong        2023-11-30  3757  				compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
10e02467129518 Neil Armstrong        2023-11-30  3758  				reg = <0 0x0ae94000 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  3759  				reg-names = "dsi_ctrl";
10e02467129518 Neil Armstrong        2023-11-30  3760  
10e02467129518 Neil Armstrong        2023-11-30  3761  				interrupts-extended = <&mdss 4>;
10e02467129518 Neil Armstrong        2023-11-30  3762  
10e02467129518 Neil Armstrong        2023-11-30  3763  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3764  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3765  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3766  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3767  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3768  					 <&gcc GCC_DISP_HF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3769  				clock-names = "byte",
10e02467129518 Neil Armstrong        2023-11-30  3770  					      "byte_intf",
10e02467129518 Neil Armstrong        2023-11-30  3771  					      "pixel",
10e02467129518 Neil Armstrong        2023-11-30  3772  					      "core",
10e02467129518 Neil Armstrong        2023-11-30  3773  					      "iface",
10e02467129518 Neil Armstrong        2023-11-30  3774  					      "bus";
10e02467129518 Neil Armstrong        2023-11-30  3775  
10e02467129518 Neil Armstrong        2023-11-30  3776  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
10e02467129518 Neil Armstrong        2023-11-30  3777  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
10e02467129518 Neil Armstrong        2023-11-30  3778  				assigned-clock-parents = <&mdss_dsi0_phy 0>,
10e02467129518 Neil Armstrong        2023-11-30  3779  							 <&mdss_dsi0_phy 1>;
10e02467129518 Neil Armstrong        2023-11-30  3780  
10e02467129518 Neil Armstrong        2023-11-30  3781  				operating-points-v2 = <&mdss_dsi_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  3782  
10e02467129518 Neil Armstrong        2023-11-30  3783  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  3784  
10e02467129518 Neil Armstrong        2023-11-30  3785  				phys = <&mdss_dsi0_phy>;
10e02467129518 Neil Armstrong        2023-11-30  3786  				phy-names = "dsi";
10e02467129518 Neil Armstrong        2023-11-30  3787  
10e02467129518 Neil Armstrong        2023-11-30  3788  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3789  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3790  
10e02467129518 Neil Armstrong        2023-11-30  3791  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3792  
10e02467129518 Neil Armstrong        2023-11-30  3793  				ports {
10e02467129518 Neil Armstrong        2023-11-30  3794  					#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3795  					#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3796  
10e02467129518 Neil Armstrong        2023-11-30  3797  					port@0 {
10e02467129518 Neil Armstrong        2023-11-30  3798  						reg = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3799  
10e02467129518 Neil Armstrong        2023-11-30  3800  						mdss_dsi0_in: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  3801  							remote-endpoint = <&dpu_intf1_out>;
10e02467129518 Neil Armstrong        2023-11-30  3802  						};
10e02467129518 Neil Armstrong        2023-11-30  3803  					};
10e02467129518 Neil Armstrong        2023-11-30  3804  
10e02467129518 Neil Armstrong        2023-11-30  3805  					port@1 {
10e02467129518 Neil Armstrong        2023-11-30  3806  						reg = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3807  
10e02467129518 Neil Armstrong        2023-11-30  3808  						mdss_dsi0_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  3809  						};
10e02467129518 Neil Armstrong        2023-11-30  3810  					};
10e02467129518 Neil Armstrong        2023-11-30  3811  				};
10e02467129518 Neil Armstrong        2023-11-30  3812  
10e02467129518 Neil Armstrong        2023-11-30  3813  				mdss_dsi_opp_table: opp-table {
10e02467129518 Neil Armstrong        2023-11-30  3814  					compatible = "operating-points-v2";
10e02467129518 Neil Armstrong        2023-11-30  3815  
10e02467129518 Neil Armstrong        2023-11-30  3816  					opp-187500000 {
10e02467129518 Neil Armstrong        2023-11-30  3817  						opp-hz = /bits/ 64 <187500000>;
10e02467129518 Neil Armstrong        2023-11-30  3818  						required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3819  					};
10e02467129518 Neil Armstrong        2023-11-30  3820  
10e02467129518 Neil Armstrong        2023-11-30  3821  					opp-300000000 {
10e02467129518 Neil Armstrong        2023-11-30  3822  						opp-hz = /bits/ 64 <300000000>;
10e02467129518 Neil Armstrong        2023-11-30  3823  						required-opps = <&rpmhpd_opp_svs>;
10e02467129518 Neil Armstrong        2023-11-30  3824  					};
10e02467129518 Neil Armstrong        2023-11-30  3825  
10e02467129518 Neil Armstrong        2023-11-30  3826  					opp-358000000 {
10e02467129518 Neil Armstrong        2023-11-30  3827  						opp-hz = /bits/ 64 <358000000>;
10e02467129518 Neil Armstrong        2023-11-30  3828  						required-opps = <&rpmhpd_opp_svs_l1>;
10e02467129518 Neil Armstrong        2023-11-30  3829  					};
10e02467129518 Neil Armstrong        2023-11-30  3830  				};
10e02467129518 Neil Armstrong        2023-11-30  3831  			};
10e02467129518 Neil Armstrong        2023-11-30  3832  
10e02467129518 Neil Armstrong        2023-11-30  3833  			mdss_dsi0_phy: phy@ae95000 {
10e02467129518 Neil Armstrong        2023-11-30  3834  				compatible = "qcom,sm8650-dsi-phy-4nm";
10e02467129518 Neil Armstrong        2023-11-30  3835  				reg = <0 0x0ae95000 0 0x200>,
10e02467129518 Neil Armstrong        2023-11-30  3836  				      <0 0x0ae95200 0 0x280>,
10e02467129518 Neil Armstrong        2023-11-30  3837  				      <0 0x0ae95500 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  3838  				reg-names = "dsi_phy",
10e02467129518 Neil Armstrong        2023-11-30  3839  					    "dsi_phy_lane",
10e02467129518 Neil Armstrong        2023-11-30  3840  					    "dsi_pll";
10e02467129518 Neil Armstrong        2023-11-30  3841  
10e02467129518 Neil Armstrong        2023-11-30  3842  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3843  					 <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3844  				clock-names = "iface",
10e02467129518 Neil Armstrong        2023-11-30  3845  					      "ref";
10e02467129518 Neil Armstrong        2023-11-30  3846  
10e02467129518 Neil Armstrong        2023-11-30  3847  				#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3848  				#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3849  
10e02467129518 Neil Armstrong        2023-11-30  3850  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3851  			};
10e02467129518 Neil Armstrong        2023-11-30  3852  
10e02467129518 Neil Armstrong        2023-11-30  3853  			mdss_dsi1: dsi@ae96000 {
10e02467129518 Neil Armstrong        2023-11-30  3854  				compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
10e02467129518 Neil Armstrong        2023-11-30  3855  				reg = <0 0x0ae96000 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  3856  				reg-names = "dsi_ctrl";
10e02467129518 Neil Armstrong        2023-11-30  3857  
10e02467129518 Neil Armstrong        2023-11-30  3858  				interrupts-extended = <&mdss 5>;
10e02467129518 Neil Armstrong        2023-11-30  3859  
10e02467129518 Neil Armstrong        2023-11-30  3860  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3861  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3862  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3863  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3864  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3865  					 <&gcc GCC_DISP_HF_AXI_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3866  				clock-names = "byte",
10e02467129518 Neil Armstrong        2023-11-30  3867  					      "byte_intf",
10e02467129518 Neil Armstrong        2023-11-30  3868  					      "pixel",
10e02467129518 Neil Armstrong        2023-11-30  3869  					      "core",
10e02467129518 Neil Armstrong        2023-11-30  3870  					      "iface",
10e02467129518 Neil Armstrong        2023-11-30  3871  					      "bus";
10e02467129518 Neil Armstrong        2023-11-30  3872  
10e02467129518 Neil Armstrong        2023-11-30  3873  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
10e02467129518 Neil Armstrong        2023-11-30  3874  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
10e02467129518 Neil Armstrong        2023-11-30  3875  				assigned-clock-parents = <&mdss_dsi1_phy 0>,
10e02467129518 Neil Armstrong        2023-11-30  3876  							 <&mdss_dsi1_phy 1>;
10e02467129518 Neil Armstrong        2023-11-30  3877  
10e02467129518 Neil Armstrong        2023-11-30  3878  				operating-points-v2 = <&mdss_dsi_opp_table>;
10e02467129518 Neil Armstrong        2023-11-30  3879  
10e02467129518 Neil Armstrong        2023-11-30  3880  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  3881  
10e02467129518 Neil Armstrong        2023-11-30  3882  				phys = <&mdss_dsi1_phy>;
10e02467129518 Neil Armstrong        2023-11-30  3883  				phy-names = "dsi";
10e02467129518 Neil Armstrong        2023-11-30  3884  
10e02467129518 Neil Armstrong        2023-11-30  3885  				#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3886  				#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3887  
10e02467129518 Neil Armstrong        2023-11-30  3888  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3889  
10e02467129518 Neil Armstrong        2023-11-30  3890  				ports {
10e02467129518 Neil Armstrong        2023-11-30  3891  					#address-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3892  					#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3893  
10e02467129518 Neil Armstrong        2023-11-30  3894  					port@0 {
10e02467129518 Neil Armstrong        2023-11-30  3895  						reg = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3896  
10e02467129518 Neil Armstrong        2023-11-30  3897  						mdss_dsi1_in: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  3898  							remote-endpoint = <&dpu_intf2_out>;
10e02467129518 Neil Armstrong        2023-11-30  3899  						};
10e02467129518 Neil Armstrong        2023-11-30  3900  					};
10e02467129518 Neil Armstrong        2023-11-30  3901  
10e02467129518 Neil Armstrong        2023-11-30  3902  					port@1 {
10e02467129518 Neil Armstrong        2023-11-30  3903  						reg = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3904  
10e02467129518 Neil Armstrong        2023-11-30  3905  						mdss_dsi1_out: endpoint {
10e02467129518 Neil Armstrong        2023-11-30  3906  						};
10e02467129518 Neil Armstrong        2023-11-30  3907  					};
10e02467129518 Neil Armstrong        2023-11-30  3908  				};
10e02467129518 Neil Armstrong        2023-11-30  3909  			};
10e02467129518 Neil Armstrong        2023-11-30  3910  
10e02467129518 Neil Armstrong        2023-11-30  3911  			mdss_dsi1_phy: phy@ae97000 {
10e02467129518 Neil Armstrong        2023-11-30  3912  				compatible = "qcom,sm8650-dsi-phy-4nm";
10e02467129518 Neil Armstrong        2023-11-30  3913  				reg = <0 0x0ae97000 0 0x200>,
10e02467129518 Neil Armstrong        2023-11-30  3914  				      <0 0x0ae97200 0 0x280>,
10e02467129518 Neil Armstrong        2023-11-30  3915  				      <0 0x0ae97500 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  3916  				reg-names = "dsi_phy",
10e02467129518 Neil Armstrong        2023-11-30  3917  					    "dsi_phy_lane",
10e02467129518 Neil Armstrong        2023-11-30  3918  					    "dsi_pll";
10e02467129518 Neil Armstrong        2023-11-30  3919  
10e02467129518 Neil Armstrong        2023-11-30  3920  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  3921  					 <&rpmhcc RPMH_CXO_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  3922  				clock-names = "iface",
10e02467129518 Neil Armstrong        2023-11-30  3923  					      "ref";
10e02467129518 Neil Armstrong        2023-11-30  3924  
10e02467129518 Neil Armstrong        2023-11-30  3925  				#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  3926  				#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  3927  
10e02467129518 Neil Armstrong        2023-11-30  3928  				status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  3929  			};
990b6c928b212d Neil Armstrong        2023-12-08  3930  
990b6c928b212d Neil Armstrong        2023-12-08  3931  			mdss_dp0: displayport-controller@af54000 {
990b6c928b212d Neil Armstrong        2023-12-08  3932  				compatible = "qcom,sm8650-dp";
990b6c928b212d Neil Armstrong        2023-12-08  3933  				reg = <0 0xaf54000 0 0x104>,
990b6c928b212d Neil Armstrong        2023-12-08  3934  				      <0 0xaf54200 0 0xc0>,
990b6c928b212d Neil Armstrong        2023-12-08  3935  				      <0 0xaf55000 0 0x770>,
990b6c928b212d Neil Armstrong        2023-12-08  3936  				      <0 0xaf56000 0 0x9c>,
990b6c928b212d Neil Armstrong        2023-12-08  3937  				      <0 0xaf57000 0 0x9c>;
990b6c928b212d Neil Armstrong        2023-12-08  3938  
990b6c928b212d Neil Armstrong        2023-12-08  3939  				interrupts-extended = <&mdss 12>;
990b6c928b212d Neil Armstrong        2023-12-08  3940  
990b6c928b212d Neil Armstrong        2023-12-08  3941  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  3942  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  3943  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  3944  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  3945  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
990b6c928b212d Neil Armstrong        2023-12-08  3946  				clock-names = "core_iface",
990b6c928b212d Neil Armstrong        2023-12-08  3947  					      "core_aux",
990b6c928b212d Neil Armstrong        2023-12-08  3948  					      "ctrl_link",
990b6c928b212d Neil Armstrong        2023-12-08  3949  					      "ctrl_link_iface",
990b6c928b212d Neil Armstrong        2023-12-08  3950  					      "stream_pixel";
990b6c928b212d Neil Armstrong        2023-12-08  3951  
990b6c928b212d Neil Armstrong        2023-12-08  3952  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
990b6c928b212d Neil Armstrong        2023-12-08  3953  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
990b6c928b212d Neil Armstrong        2023-12-08  3954  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  3955  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
990b6c928b212d Neil Armstrong        2023-12-08  3956  
990b6c928b212d Neil Armstrong        2023-12-08  3957  				operating-points-v2 = <&dp_opp_table>;
990b6c928b212d Neil Armstrong        2023-12-08  3958  
990b6c928b212d Neil Armstrong        2023-12-08  3959  				power-domains = <&rpmhpd RPMHPD_MMCX>;
990b6c928b212d Neil Armstrong        2023-12-08  3960  
990b6c928b212d Neil Armstrong        2023-12-08  3961  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
990b6c928b212d Neil Armstrong        2023-12-08  3962  				phy-names = "dp";
990b6c928b212d Neil Armstrong        2023-12-08  3963  
990b6c928b212d Neil Armstrong        2023-12-08  3964  				#sound-dai-cells = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  3965  
990b6c928b212d Neil Armstrong        2023-12-08  3966  				status = "disabled";
990b6c928b212d Neil Armstrong        2023-12-08  3967  
990b6c928b212d Neil Armstrong        2023-12-08  3968  				dp_opp_table: opp-table {
990b6c928b212d Neil Armstrong        2023-12-08  3969  					compatible = "operating-points-v2";
990b6c928b212d Neil Armstrong        2023-12-08  3970  
990b6c928b212d Neil Armstrong        2023-12-08  3971  					opp-162000000 {
990b6c928b212d Neil Armstrong        2023-12-08  3972  						opp-hz = /bits/ 64 <162000000>;
990b6c928b212d Neil Armstrong        2023-12-08  3973  						required-opps = <&rpmhpd_opp_low_svs_d1>;
990b6c928b212d Neil Armstrong        2023-12-08  3974  					};
990b6c928b212d Neil Armstrong        2023-12-08  3975  
990b6c928b212d Neil Armstrong        2023-12-08  3976  					opp-270000000 {
990b6c928b212d Neil Armstrong        2023-12-08  3977  						opp-hz = /bits/ 64 <270000000>;
990b6c928b212d Neil Armstrong        2023-12-08  3978  						required-opps = <&rpmhpd_opp_low_svs>;
990b6c928b212d Neil Armstrong        2023-12-08  3979  					};
990b6c928b212d Neil Armstrong        2023-12-08  3980  
990b6c928b212d Neil Armstrong        2023-12-08  3981  					opp-540000000 {
990b6c928b212d Neil Armstrong        2023-12-08  3982  						opp-hz = /bits/ 64 <540000000>;
990b6c928b212d Neil Armstrong        2023-12-08  3983  						required-opps = <&rpmhpd_opp_svs_l1>;
990b6c928b212d Neil Armstrong        2023-12-08  3984  					};
990b6c928b212d Neil Armstrong        2023-12-08  3985  
990b6c928b212d Neil Armstrong        2023-12-08  3986  					opp-810000000 {
990b6c928b212d Neil Armstrong        2023-12-08  3987  						opp-hz = /bits/ 64 <810000000>;
990b6c928b212d Neil Armstrong        2023-12-08  3988  						required-opps = <&rpmhpd_opp_nom>;
990b6c928b212d Neil Armstrong        2023-12-08  3989  					};
990b6c928b212d Neil Armstrong        2023-12-08  3990  				};
990b6c928b212d Neil Armstrong        2023-12-08  3991  
990b6c928b212d Neil Armstrong        2023-12-08  3992  				ports {
990b6c928b212d Neil Armstrong        2023-12-08  3993  					#address-cells = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  3994  					#size-cells = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  3995  
990b6c928b212d Neil Armstrong        2023-12-08  3996  					port@0 {
990b6c928b212d Neil Armstrong        2023-12-08  3997  						reg = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  3998  
990b6c928b212d Neil Armstrong        2023-12-08  3999  						mdss_dp0_in: endpoint {
990b6c928b212d Neil Armstrong        2023-12-08  4000  							remote-endpoint = <&dpu_intf0_out>;
990b6c928b212d Neil Armstrong        2023-12-08  4001  						};
990b6c928b212d Neil Armstrong        2023-12-08  4002  					};
990b6c928b212d Neil Armstrong        2023-12-08  4003  
990b6c928b212d Neil Armstrong        2023-12-08  4004  					port@1 {
990b6c928b212d Neil Armstrong        2023-12-08  4005  						reg = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  4006  
990b6c928b212d Neil Armstrong        2023-12-08  4007  						mdss_dp0_out: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  4008  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
990b6c928b212d Neil Armstrong        2023-12-08  4009  						};
990b6c928b212d Neil Armstrong        2023-12-08  4010  					};
990b6c928b212d Neil Armstrong        2023-12-08  4011  				};
990b6c928b212d Neil Armstrong        2023-12-08  4012  			};
10e02467129518 Neil Armstrong        2023-11-30  4013  		};
10e02467129518 Neil Armstrong        2023-11-30  4014  
10e02467129518 Neil Armstrong        2023-11-30  4015  		dispcc: clock-controller@af00000 {
10e02467129518 Neil Armstrong        2023-11-30  4016  			compatible = "qcom,sm8650-dispcc";
10e02467129518 Neil Armstrong        2023-11-30  4017  			reg = <0 0x0af00000 0 0x20000>;
10e02467129518 Neil Armstrong        2023-11-30  4018  
10e02467129518 Neil Armstrong        2023-11-30  4019  			clocks = <&bi_tcxo_div2>,
10e02467129518 Neil Armstrong        2023-11-30  4020  				 <&bi_tcxo_ao_div2>,
10e02467129518 Neil Armstrong        2023-11-30  4021  				 <&gcc GCC_DISP_AHB_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4022  				 <&sleep_clk>,
10e02467129518 Neil Armstrong        2023-11-30  4023  				 <&mdss_dsi0_phy 0>,
10e02467129518 Neil Armstrong        2023-11-30  4024  				 <&mdss_dsi0_phy 1>,
10e02467129518 Neil Armstrong        2023-11-30  4025  				 <&mdss_dsi1_phy 0>,
10e02467129518 Neil Armstrong        2023-11-30  4026  				 <&mdss_dsi1_phy 1>,
990b6c928b212d Neil Armstrong        2023-12-08  4027  				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
990b6c928b212d Neil Armstrong        2023-12-08  4028  				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4029  				 <0>, /* dp1 */
10e02467129518 Neil Armstrong        2023-11-30  4030  				 <0>,
10e02467129518 Neil Armstrong        2023-11-30  4031  				 <0>, /* dp2 */
10e02467129518 Neil Armstrong        2023-11-30  4032  				 <0>,
10e02467129518 Neil Armstrong        2023-11-30  4033  				 <0>, /* dp3 */
10e02467129518 Neil Armstrong        2023-11-30  4034  				 <0>;
10e02467129518 Neil Armstrong        2023-11-30  4035  
10e02467129518 Neil Armstrong        2023-11-30  4036  			power-domains = <&rpmhpd RPMHPD_MMCX>;
10e02467129518 Neil Armstrong        2023-11-30  4037  			required-opps = <&rpmhpd_opp_low_svs>;
10e02467129518 Neil Armstrong        2023-11-30  4038  
10e02467129518 Neil Armstrong        2023-11-30  4039  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4040  			#reset-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4041  			#power-domain-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4042  		};
10e02467129518 Neil Armstrong        2023-11-30  4043  
10e02467129518 Neil Armstrong        2023-11-30  4044  		usb_1_hsphy: phy@88e3000 {
10e02467129518 Neil Armstrong        2023-11-30  4045  			compatible = "qcom,sm8650-snps-eusb2-phy",
10e02467129518 Neil Armstrong        2023-11-30  4046  				     "qcom,sm8550-snps-eusb2-phy";
10e02467129518 Neil Armstrong        2023-11-30  4047  			reg = <0 0x088e3000 0 0x154>;
10e02467129518 Neil Armstrong        2023-11-30  4048  
10e02467129518 Neil Armstrong        2023-11-30  4049  			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
10e02467129518 Neil Armstrong        2023-11-30  4050  			clock-names = "ref";
10e02467129518 Neil Armstrong        2023-11-30  4051  
10e02467129518 Neil Armstrong        2023-11-30  4052  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  4053  
10e02467129518 Neil Armstrong        2023-11-30  4054  			#phy-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  4055  
10e02467129518 Neil Armstrong        2023-11-30  4056  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  4057  		};
10e02467129518 Neil Armstrong        2023-11-30  4058  
10e02467129518 Neil Armstrong        2023-11-30  4059  		usb_dp_qmpphy: phy@88e8000 {
10e02467129518 Neil Armstrong        2023-11-30  4060  			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
10e02467129518 Neil Armstrong        2023-11-30  4061  			reg = <0 0x088e8000 0 0x3000>;
10e02467129518 Neil Armstrong        2023-11-30  4062  
10e02467129518 Neil Armstrong        2023-11-30  4063  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4064  				 <&rpmhcc RPMH_CXO_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4065  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4066  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  4067  			clock-names = "aux",
10e02467129518 Neil Armstrong        2023-11-30  4068  				      "ref",
10e02467129518 Neil Armstrong        2023-11-30  4069  				      "com_aux",
10e02467129518 Neil Armstrong        2023-11-30  4070  				      "usb3_pipe";
10e02467129518 Neil Armstrong        2023-11-30  4071  
10e02467129518 Neil Armstrong        2023-11-30  4072  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
10e02467129518 Neil Armstrong        2023-11-30  4073  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  4074  			reset-names = "phy",
10e02467129518 Neil Armstrong        2023-11-30  4075  				      "common";
10e02467129518 Neil Armstrong        2023-11-30  4076  
10e02467129518 Neil Armstrong        2023-11-30  4077  			power-domains = <&gcc USB3_PHY_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  4078  
10e02467129518 Neil Armstrong        2023-11-30  4079  			#clock-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4080  			#phy-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4081  
fbb22a182267c8 Dmitry Baryshkov      2024-04-29  4082  			orientation-switch;
fbb22a182267c8 Dmitry Baryshkov      2024-04-29  4083  
10e02467129518 Neil Armstrong        2023-11-30  4084  			status = "disabled";
990b6c928b212d Neil Armstrong        2023-12-08  4085  
990b6c928b212d Neil Armstrong        2023-12-08  4086  			ports {
990b6c928b212d Neil Armstrong        2023-12-08  4087  				#address-cells = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  4088  				#size-cells = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  4089  
990b6c928b212d Neil Armstrong        2023-12-08  4090  				port@0 {
990b6c928b212d Neil Armstrong        2023-12-08  4091  					reg = <0>;
990b6c928b212d Neil Armstrong        2023-12-08  4092  
990b6c928b212d Neil Armstrong        2023-12-08  4093  					usb_dp_qmpphy_out: endpoint {
990b6c928b212d Neil Armstrong        2023-12-08  4094  					};
990b6c928b212d Neil Armstrong        2023-12-08  4095  				};
990b6c928b212d Neil Armstrong        2023-12-08  4096  
990b6c928b212d Neil Armstrong        2023-12-08  4097  				port@1 {
990b6c928b212d Neil Armstrong        2023-12-08  4098  					reg = <1>;
990b6c928b212d Neil Armstrong        2023-12-08  4099  
990b6c928b212d Neil Armstrong        2023-12-08  4100  					usb_dp_qmpphy_usb_ss_in: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  4101  						remote-endpoint = <&usb_1_dwc3_ss>;
990b6c928b212d Neil Armstrong        2023-12-08  4102  					};
990b6c928b212d Neil Armstrong        2023-12-08  4103  				};
990b6c928b212d Neil Armstrong        2023-12-08  4104  
990b6c928b212d Neil Armstrong        2023-12-08  4105  				port@2 {
990b6c928b212d Neil Armstrong        2023-12-08  4106  					reg = <2>;
990b6c928b212d Neil Armstrong        2023-12-08  4107  
990b6c928b212d Neil Armstrong        2023-12-08  4108  					usb_dp_qmpphy_dp_in: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  4109  						remote-endpoint = <&mdss_dp0_out>;
990b6c928b212d Neil Armstrong        2023-12-08  4110  					};
990b6c928b212d Neil Armstrong        2023-12-08  4111  				};
990b6c928b212d Neil Armstrong        2023-12-08  4112  			};
10e02467129518 Neil Armstrong        2023-11-30  4113  		};
10e02467129518 Neil Armstrong        2023-11-30  4114  
10e02467129518 Neil Armstrong        2023-11-30  4115  		usb_1: usb@a6f8800 {
10e02467129518 Neil Armstrong        2023-11-30  4116  			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
10e02467129518 Neil Armstrong        2023-11-30  4117  			reg = <0 0x0a6f8800 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  4118  
9f42f7380f6757 Neil Armstrong        2024-03-14  4119  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
9f42f7380f6757 Neil Armstrong        2024-03-14  4120  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
9f42f7380f6757 Neil Armstrong        2024-03-14  4121  					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
10e02467129518 Neil Armstrong        2023-11-30  4122  					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
9f42f7380f6757 Neil Armstrong        2024-03-14  4123  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
9f42f7380f6757 Neil Armstrong        2024-03-14  4124  			interrupt-names = "pwr_event",
9f42f7380f6757 Neil Armstrong        2024-03-14  4125  					  "hs_phy_irq",
9f42f7380f6757 Neil Armstrong        2024-03-14  4126  					  "dp_hs_phy_irq",
10e02467129518 Neil Armstrong        2023-11-30  4127  					  "dm_hs_phy_irq",
9f42f7380f6757 Neil Armstrong        2024-03-14  4128  					  "ss_phy_irq";
10e02467129518 Neil Armstrong        2023-11-30  4129  
10e02467129518 Neil Armstrong        2023-11-30  4130  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4131  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4132  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4133  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4134  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4135  				 <&tcsr TCSR_USB3_CLKREF_EN>;
10e02467129518 Neil Armstrong        2023-11-30  4136  			clock-names = "cfg_noc",
10e02467129518 Neil Armstrong        2023-11-30  4137  				      "core",
10e02467129518 Neil Armstrong        2023-11-30  4138  				      "iface",
10e02467129518 Neil Armstrong        2023-11-30  4139  				      "sleep",
10e02467129518 Neil Armstrong        2023-11-30  4140  				      "mock_utmi",
10e02467129518 Neil Armstrong        2023-11-30  4141  				      "xo";
10e02467129518 Neil Armstrong        2023-11-30  4142  
10e02467129518 Neil Armstrong        2023-11-30  4143  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
10e02467129518 Neil Armstrong        2023-11-30  4144  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
10e02467129518 Neil Armstrong        2023-11-30  4145  			assigned-clock-rates = <19200000>, <200000000>;
10e02467129518 Neil Armstrong        2023-11-30  4146  
10e02467129518 Neil Armstrong        2023-11-30  4147  			resets = <&gcc GCC_USB30_PRIM_BCR>;
10e02467129518 Neil Armstrong        2023-11-30  4148  
10e02467129518 Neil Armstrong        2023-11-30  4149  			power-domains = <&gcc USB30_PRIM_GDSC>;
10e02467129518 Neil Armstrong        2023-11-30  4150  			required-opps = <&rpmhpd_opp_nom>;
10e02467129518 Neil Armstrong        2023-11-30  4151  
10e02467129518 Neil Armstrong        2023-11-30  4152  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4153  			#size-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4154  			ranges;
10e02467129518 Neil Armstrong        2023-11-30  4155  
10e02467129518 Neil Armstrong        2023-11-30  4156  			status = "disabled";
10e02467129518 Neil Armstrong        2023-11-30  4157  
10e02467129518 Neil Armstrong        2023-11-30  4158  			usb_1_dwc3: usb@a600000 {
10e02467129518 Neil Armstrong        2023-11-30  4159  				compatible = "snps,dwc3";
10e02467129518 Neil Armstrong        2023-11-30  4160  				reg = <0 0x0a600000 0 0xcd00>;
10e02467129518 Neil Armstrong        2023-11-30  4161  
10e02467129518 Neil Armstrong        2023-11-30  4162  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  4163  
10e02467129518 Neil Armstrong        2023-11-30  4164  				iommus = <&apps_smmu 0x40 0>;
10e02467129518 Neil Armstrong        2023-11-30  4165  
10e02467129518 Neil Armstrong        2023-11-30  4166  				phys = <&usb_1_hsphy>,
10e02467129518 Neil Armstrong        2023-11-30  4167  				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
10e02467129518 Neil Armstrong        2023-11-30  4168  				phy-names = "usb2-phy",
10e02467129518 Neil Armstrong        2023-11-30  4169  					    "usb3-phy";
10e02467129518 Neil Armstrong        2023-11-30  4170  
10e02467129518 Neil Armstrong        2023-11-30  4171  				snps,hird-threshold = /bits/ 8 <0x0>;
10e02467129518 Neil Armstrong        2023-11-30  4172  				snps,usb2-gadget-lpm-disable;
10e02467129518 Neil Armstrong        2023-11-30  4173  				snps,dis_u2_susphy_quirk;
d2350377997f36 Neil Armstrong        2023-11-30  4174  				snps,dis_enblslpm_quirk;
d2350377997f36 Neil Armstrong        2023-11-30  4175  				snps,dis-u1-entry-quirk;
d2350377997f36 Neil Armstrong        2023-11-30  4176  				snps,dis-u2-entry-quirk;
d2350377997f36 Neil Armstrong        2023-11-30  4177  				snps,is-utmi-l1-suspend;
d2350377997f36 Neil Armstrong        2023-11-30  4178  				snps,usb3_lpm_capable;
d2350377997f36 Neil Armstrong        2023-11-30  4179  				snps,usb2-lpm-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4180  				snps,has-lpm-erratum;
d2350377997f36 Neil Armstrong        2023-11-30  4181  				tx-fifo-resize;
d2350377997f36 Neil Armstrong        2023-11-30  4182  
d2350377997f36 Neil Armstrong        2023-11-30  4183  				dma-coherent;
d2350377997f36 Neil Armstrong        2023-11-30  4184  
d2350377997f36 Neil Armstrong        2023-11-30  4185  				ports {
d2350377997f36 Neil Armstrong        2023-11-30  4186  					#address-cells = <1>;
d2350377997f36 Neil Armstrong        2023-11-30  4187  					#size-cells = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  4188  
d2350377997f36 Neil Armstrong        2023-11-30  4189  					port@0 {
d2350377997f36 Neil Armstrong        2023-11-30  4190  						reg = <0>;
d2350377997f36 Neil Armstrong        2023-11-30  4191  
d2350377997f36 Neil Armstrong        2023-11-30  4192  						usb_1_dwc3_hs: endpoint {
d2350377997f36 Neil Armstrong        2023-11-30  4193  						};
d2350377997f36 Neil Armstrong        2023-11-30  4194  					};
d2350377997f36 Neil Armstrong        2023-11-30  4195  
d2350377997f36 Neil Armstrong        2023-11-30  4196  					port@1 {
d2350377997f36 Neil Armstrong        2023-11-30  4197  						reg = <1>;
d2350377997f36 Neil Armstrong        2023-11-30  4198  
d2350377997f36 Neil Armstrong        2023-11-30  4199  						usb_1_dwc3_ss: endpoint {
65931e59e03991 Dmitry Baryshkov      2024-04-29  4200  							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
d2350377997f36 Neil Armstrong        2023-11-30  4201  						};
d2350377997f36 Neil Armstrong        2023-11-30  4202  					};
d2350377997f36 Neil Armstrong        2023-11-30  4203  				};
d2350377997f36 Neil Armstrong        2023-11-30  4204  			};
d2350377997f36 Neil Armstrong        2023-11-30  4205  		};
d2350377997f36 Neil Armstrong        2023-11-30  4206  
d2350377997f36 Neil Armstrong        2023-11-30  4207  		pdc: interrupt-controller@b220000 {
d2350377997f36 Neil Armstrong        2023-11-30  4208  			compatible = "qcom,sm8650-pdc", "qcom,pdc";
d2350377997f36 Neil Armstrong        2023-11-30  4209  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
d2350377997f36 Neil Armstrong        2023-11-30  4210  
d2350377997f36 Neil Armstrong        2023-11-30  4211  			interrupt-parent = <&intc>;
d2350377997f36 Neil Armstrong        2023-11-30  4212  
10e02467129518 Neil Armstrong        2023-11-30  4213  			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
10e02467129518 Neil Armstrong        2023-11-30  4214  					  <125 63 1>, <126 716 12>,
10e02467129518 Neil Armstrong        2023-11-30  4215  					  <138 251 5>, <143 244 4>;
10e02467129518 Neil Armstrong        2023-11-30  4216  
10e02467129518 Neil Armstrong        2023-11-30  4217  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4218  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  4219  		};
10e02467129518 Neil Armstrong        2023-11-30  4220  
10e02467129518 Neil Armstrong        2023-11-30  4221  		tsens0: thermal-sensor@c228000 {
10e02467129518 Neil Armstrong        2023-11-30  4222  			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
10e02467129518 Neil Armstrong        2023-11-30  4223  			reg = <0 0x0c228000 0 0x1000>, /* TM */
10e02467129518 Neil Armstrong        2023-11-30  4224  			      <0 0x0c222000 0 0x1000>; /* SROT */
10e02467129518 Neil Armstrong        2023-11-30  4225  
10e02467129518 Neil Armstrong        2023-11-30  4226  			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  4227  				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  4228  			interrupt-names = "uplow",
10e02467129518 Neil Armstrong        2023-11-30  4229  					  "critical";
10e02467129518 Neil Armstrong        2023-11-30  4230  
10e02467129518 Neil Armstrong        2023-11-30  4231  			#qcom,sensors = <15>;
10e02467129518 Neil Armstrong        2023-11-30  4232  
10e02467129518 Neil Armstrong        2023-11-30  4233  			#thermal-sensor-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4234  		};
10e02467129518 Neil Armstrong        2023-11-30  4235  
10e02467129518 Neil Armstrong        2023-11-30  4236  		tsens1: thermal-sensor@c229000 {
10e02467129518 Neil Armstrong        2023-11-30  4237  			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
10e02467129518 Neil Armstrong        2023-11-30  4238  			reg = <0 0x0c229000 0 0x1000>, /* TM */
10e02467129518 Neil Armstrong        2023-11-30  4239  			      <0 0x0c223000 0 0x1000>; /* SROT */
10e02467129518 Neil Armstrong        2023-11-30  4240  
10e02467129518 Neil Armstrong        2023-11-30  4241  			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  4242  				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  4243  			interrupt-names = "uplow",
10e02467129518 Neil Armstrong        2023-11-30  4244  					  "critical";
10e02467129518 Neil Armstrong        2023-11-30  4245  
10e02467129518 Neil Armstrong        2023-11-30  4246  			#qcom,sensors = <16>;
10e02467129518 Neil Armstrong        2023-11-30  4247  
10e02467129518 Neil Armstrong        2023-11-30  4248  			#thermal-sensor-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4249  		};
10e02467129518 Neil Armstrong        2023-11-30  4250  
10e02467129518 Neil Armstrong        2023-11-30  4251  		tsens2: thermal-sensor@c22a000 {
10e02467129518 Neil Armstrong        2023-11-30  4252  			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
10e02467129518 Neil Armstrong        2023-11-30  4253  			reg = <0 0x0c22a000 0 0x1000>, /* TM */
10e02467129518 Neil Armstrong        2023-11-30  4254  			      <0 0x0c224000 0 0x1000>; /* SROT */
10e02467129518 Neil Armstrong        2023-11-30  4255  
10e02467129518 Neil Armstrong        2023-11-30  4256  			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
10e02467129518 Neil Armstrong        2023-11-30  4257  				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  4258  			interrupt-names = "uplow",
10e02467129518 Neil Armstrong        2023-11-30  4259  					  "critical";
10e02467129518 Neil Armstrong        2023-11-30  4260  
10e02467129518 Neil Armstrong        2023-11-30  4261  			#qcom,sensors = <13>;
10e02467129518 Neil Armstrong        2023-11-30  4262  
10e02467129518 Neil Armstrong        2023-11-30  4263  			#thermal-sensor-cells = <1>;
10e02467129518 Neil Armstrong        2023-11-30  4264  		};
10e02467129518 Neil Armstrong        2023-11-30  4265  
10e02467129518 Neil Armstrong        2023-11-30  4266  		aoss_qmp: power-management@c300000 {
10e02467129518 Neil Armstrong        2023-11-30  4267  			compatible = "qcom,sm8650-aoss-qmp", "qcom,aoss-qmp";
10e02467129518 Neil Armstrong        2023-11-30  4268  			reg = <0 0x0c300000 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  4269  
10e02467129518 Neil Armstrong        2023-11-30  4270  			interrupt-parent = <&ipcc>;
10e02467129518 Neil Armstrong        2023-11-30  4271  			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
10e02467129518 Neil Armstrong        2023-11-30  4272  						     IRQ_TYPE_EDGE_RISING>;
10e02467129518 Neil Armstrong        2023-11-30  4273  
10e02467129518 Neil Armstrong        2023-11-30  4274  			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e02467129518 Neil Armstrong        2023-11-30  4275  
10e02467129518 Neil Armstrong        2023-11-30  4276  			#clock-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  4277  		};
10e02467129518 Neil Armstrong        2023-11-30  4278  
10e02467129518 Neil Armstrong        2023-11-30  4279  		sram@c3f0000 {
10e02467129518 Neil Armstrong        2023-11-30  4280  			compatible = "qcom,rpmh-stats";
10e02467129518 Neil Armstrong        2023-11-30  4281  			reg = <0 0x0c3f0000 0 0x400>;
10e02467129518 Neil Armstrong        2023-11-30  4282  		};
10e02467129518 Neil Armstrong        2023-11-30  4283  
10e02467129518 Neil Armstrong        2023-11-30  4284  		spmi_bus: spmi@c400000 {
10e02467129518 Neil Armstrong        2023-11-30  4285  			compatible = "qcom,spmi-pmic-arb";
10e02467129518 Neil Armstrong        2023-11-30  4286  			reg = <0 0x0c400000 0 0x3000>,
a4f82b8045e3c7 Abel Vesa             2024-02-21  4287  			      <0 0x0c500000 0 0x400000>,
10e02467129518 Neil Armstrong        2023-11-30  4288  			      <0 0x0c440000 0 0x80000>,
10e02467129518 Neil Armstrong        2023-11-30  4289  			      <0 0x0c4c0000 0 0x20000>,
10e02467129518 Neil Armstrong        2023-11-30  4290  			      <0 0x0c42d000 0 0x4000>;
10e02467129518 Neil Armstrong        2023-11-30  4291  			reg-names = "core",
10e02467129518 Neil Armstrong        2023-11-30  4292  				    "chnls",
10e02467129518 Neil Armstrong        2023-11-30  4293  				    "obsrvr",
10e02467129518 Neil Armstrong        2023-11-30  4294  				    "intr",
10e02467129518 Neil Armstrong        2023-11-30  4295  				    "cnfg";
10e02467129518 Neil Armstrong        2023-11-30  4296  
10e02467129518 Neil Armstrong        2023-11-30  4297  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  4298  			interrupt-names = "periph_irq";
10e02467129518 Neil Armstrong        2023-11-30  4299  
10e02467129518 Neil Armstrong        2023-11-30  4300  			qcom,ee = <0>;
10e02467129518 Neil Armstrong        2023-11-30  4301  			qcom,channel = <0>;
10e02467129518 Neil Armstrong        2023-11-30  4302  			qcom,bus-id = <0>;
10e02467129518 Neil Armstrong        2023-11-30  4303  
10e02467129518 Neil Armstrong        2023-11-30  4304  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  4305  			#interrupt-cells = <4>;
10e02467129518 Neil Armstrong        2023-11-30  4306  
10e02467129518 Neil Armstrong        2023-11-30  4307  			#address-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4308  			#size-cells = <0>;
10e02467129518 Neil Armstrong        2023-11-30  4309  		};
10e02467129518 Neil Armstrong        2023-11-30  4310  
10e02467129518 Neil Armstrong        2023-11-30  4311  		tlmm: pinctrl@f100000 {
10e02467129518 Neil Armstrong        2023-11-30  4312  			compatible = "qcom,sm8650-tlmm";
10e02467129518 Neil Armstrong        2023-11-30  4313  			reg = <0 0x0f100000 0 0x300000>;
10e02467129518 Neil Armstrong        2023-11-30  4314  
10e02467129518 Neil Armstrong        2023-11-30  4315  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
10e02467129518 Neil Armstrong        2023-11-30  4316  
10e02467129518 Neil Armstrong        2023-11-30  4317  			gpio-controller;
10e02467129518 Neil Armstrong        2023-11-30  4318  			#gpio-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4319  
10e02467129518 Neil Armstrong        2023-11-30  4320  			interrupt-controller;
10e02467129518 Neil Armstrong        2023-11-30  4321  			#interrupt-cells = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4322  
10e02467129518 Neil Armstrong        2023-11-30  4323  			gpio-ranges = <&tlmm 0 0 211>;
10e02467129518 Neil Armstrong        2023-11-30  4324  
10e02467129518 Neil Armstrong        2023-11-30  4325  			wakeup-parent = <&pdc>;
10e02467129518 Neil Armstrong        2023-11-30  4326  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4327  			cci0_0_default: cci0-0-default-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4328  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4329  					pins = "gpio113";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4330  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4331  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4332  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4333  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4334  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4335  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4336  					pins = "gpio114";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4337  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4338  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4339  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4340  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4341  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4342  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4343  			cci0_0_sleep: cci0-0-sleep-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4344  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4345  					pins = "gpio113";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4346  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4347  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4348  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4349  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4350  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4351  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4352  					pins = "gpio114";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4353  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4354  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4355  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4356  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4357  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4358  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4359  			cci0_1_default: cci0-1-default-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4360  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4361  					pins = "gpio115";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4362  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4363  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4364  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4365  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4366  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4367  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4368  					pins = "gpio116";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4369  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4370  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4371  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4372  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4373  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4374  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4375  			cci0_1_sleep: cci0-1-sleep-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4376  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4377  					pins = "gpio115";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4378  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4379  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4380  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4381  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4382  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4383  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4384  					pins = "gpio116";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4385  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4386  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4387  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4388  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4389  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4390  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4391  			cci1_0_default: cci1-0-default-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4392  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4393  					pins = "gpio117";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4394  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4395  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4396  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4397  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4398  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4399  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4400  					pins = "gpio118";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4401  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4402  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4403  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4404  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4405  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4406  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4407  			cci1_0_sleep: cci1-0-sleep-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4408  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4409  					pins = "gpio117";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4410  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4411  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4412  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4413  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4414  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4415  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4416  					pins = "gpio118";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4417  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4418  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4419  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4420  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4421  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4422  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4423  			cci1_1_default: cci1-1-default-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4424  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4425  					pins = "gpio12";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4426  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4427  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4428  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4429  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4430  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4431  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4432  					pins = "gpio13";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4433  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4434  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4435  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4436  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4437  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4438  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4439  			cci1_1_sleep: cci1-1-sleep-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4440  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4441  					pins = "gpio12";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4442  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4443  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4444  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4445  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4446  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4447  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4448  					pins = "gpio13";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4449  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4450  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4451  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4452  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4453  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4454  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4455  			cci2_0_default: cci2-0-default-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4456  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4457  					pins = "gpio112";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4458  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4459  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4460  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4461  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4462  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4463  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4464  					pins = "gpio153";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4465  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4466  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4467  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4468  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4469  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4470  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4471  			cci2_0_sleep: cci2-0-sleep-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4472  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4473  					pins = "gpio112";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4474  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4475  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4476  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4477  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4478  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4479  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4480  					pins = "gpio153";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4481  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4482  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4483  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4484  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4485  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4486  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4487  			cci2_1_default: cci2-1-default-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4488  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4489  					pins = "gpio119";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4490  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4491  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4492  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4493  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4494  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4495  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4496  					pins = "gpio120";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4497  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4498  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4499  					bias-pull-up = <2200>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4500  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4501  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4502  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4503  			cci2_1_sleep: cci2-1-sleep-state {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4504  				sda-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4505  					pins = "gpio119";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4506  					function = "cci_i2c_sda";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4507  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4508  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4509  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4510  
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4511  				scl-pins {
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4512  					pins = "gpio120";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4513  					function = "cci_i2c_scl";
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4514  					drive-strength = <2>;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4515  					bias-pull-down;
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4516  				};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4517  			};
9e2ebc5817c94b Vladimir Zapolskiy    2024-06-13  4518  
10e02467129518 Neil Armstrong        2023-11-30  4519  			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4520  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4521  				pins = "gpio64", "gpio65";
10e02467129518 Neil Armstrong        2023-11-30  4522  				function = "i2chub0_se0";
10e02467129518 Neil Armstrong        2023-11-30  4523  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4524  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4525  			};
10e02467129518 Neil Armstrong        2023-11-30  4526  
10e02467129518 Neil Armstrong        2023-11-30  4527  			hub_i2c1_data_clk: hub-i2c1-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4528  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4529  				pins = "gpio66", "gpio67";
10e02467129518 Neil Armstrong        2023-11-30  4530  				function = "i2chub0_se1";
10e02467129518 Neil Armstrong        2023-11-30  4531  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4532  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4533  			};
10e02467129518 Neil Armstrong        2023-11-30  4534  
10e02467129518 Neil Armstrong        2023-11-30  4535  			hub_i2c2_data_clk: hub-i2c2-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4536  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4537  				pins = "gpio68", "gpio69";
10e02467129518 Neil Armstrong        2023-11-30  4538  				function = "i2chub0_se2";
10e02467129518 Neil Armstrong        2023-11-30  4539  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4540  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4541  			};
10e02467129518 Neil Armstrong        2023-11-30  4542  
10e02467129518 Neil Armstrong        2023-11-30  4543  			hub_i2c3_data_clk: hub-i2c3-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4544  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4545  				pins = "gpio70", "gpio71";
10e02467129518 Neil Armstrong        2023-11-30  4546  				function = "i2chub0_se3";
10e02467129518 Neil Armstrong        2023-11-30  4547  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4548  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4549  			};
10e02467129518 Neil Armstrong        2023-11-30  4550  
10e02467129518 Neil Armstrong        2023-11-30  4551  			hub_i2c4_data_clk: hub-i2c4-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4552  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4553  				pins = "gpio72", "gpio73";
10e02467129518 Neil Armstrong        2023-11-30  4554  				function = "i2chub0_se4";
10e02467129518 Neil Armstrong        2023-11-30  4555  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4556  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4557  			};
10e02467129518 Neil Armstrong        2023-11-30  4558  
10e02467129518 Neil Armstrong        2023-11-30  4559  			hub_i2c5_data_clk: hub-i2c5-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4560  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4561  				pins = "gpio74", "gpio75";
10e02467129518 Neil Armstrong        2023-11-30  4562  				function = "i2chub0_se5";
10e02467129518 Neil Armstrong        2023-11-30  4563  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4564  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4565  			};
10e02467129518 Neil Armstrong        2023-11-30  4566  
10e02467129518 Neil Armstrong        2023-11-30  4567  			hub_i2c6_data_clk: hub-i2c6-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4568  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4569  				pins = "gpio76", "gpio77";
10e02467129518 Neil Armstrong        2023-11-30  4570  				function = "i2chub0_se6";
10e02467129518 Neil Armstrong        2023-11-30  4571  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4572  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4573  			};
10e02467129518 Neil Armstrong        2023-11-30  4574  
10e02467129518 Neil Armstrong        2023-11-30  4575  			hub_i2c7_data_clk: hub-i2c7-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4576  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4577  				pins = "gpio78", "gpio79";
10e02467129518 Neil Armstrong        2023-11-30  4578  				function = "i2chub0_se7";
10e02467129518 Neil Armstrong        2023-11-30  4579  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4580  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4581  			};
10e02467129518 Neil Armstrong        2023-11-30  4582  
10e02467129518 Neil Armstrong        2023-11-30  4583  			hub_i2c8_data_clk: hub-i2c8-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4584  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4585  				pins = "gpio206", "gpio207";
10e02467129518 Neil Armstrong        2023-11-30  4586  				function = "i2chub0_se8";
10e02467129518 Neil Armstrong        2023-11-30  4587  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4588  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4589  			};
10e02467129518 Neil Armstrong        2023-11-30  4590  
10e02467129518 Neil Armstrong        2023-11-30  4591  			hub_i2c9_data_clk: hub-i2c9-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4592  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4593  				pins = "gpio80", "gpio81";
10e02467129518 Neil Armstrong        2023-11-30  4594  				function = "i2chub0_se9";
10e02467129518 Neil Armstrong        2023-11-30  4595  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4596  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4597  			};
10e02467129518 Neil Armstrong        2023-11-30  4598  
10e02467129518 Neil Armstrong        2023-11-30  4599  			pcie0_default_state: pcie0-default-state {
10e02467129518 Neil Armstrong        2023-11-30  4600  				perst-pins {
10e02467129518 Neil Armstrong        2023-11-30  4601  					pins = "gpio94";
10e02467129518 Neil Armstrong        2023-11-30  4602  					function = "gpio";
10e02467129518 Neil Armstrong        2023-11-30  4603  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4604  					bias-pull-down;
10e02467129518 Neil Armstrong        2023-11-30  4605  				};
10e02467129518 Neil Armstrong        2023-11-30  4606  
10e02467129518 Neil Armstrong        2023-11-30  4607  				clkreq-pins {
10e02467129518 Neil Armstrong        2023-11-30  4608  					pins = "gpio95";
10e02467129518 Neil Armstrong        2023-11-30  4609  					function = "pcie0_clk_req_n";
10e02467129518 Neil Armstrong        2023-11-30  4610  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4611  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4612  				};
10e02467129518 Neil Armstrong        2023-11-30  4613  
10e02467129518 Neil Armstrong        2023-11-30  4614  				wake-pins {
10e02467129518 Neil Armstrong        2023-11-30  4615  					pins = "gpio96";
10e02467129518 Neil Armstrong        2023-11-30  4616  					function = "gpio";
10e02467129518 Neil Armstrong        2023-11-30  4617  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4618  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4619  				};
10e02467129518 Neil Armstrong        2023-11-30  4620  			};
10e02467129518 Neil Armstrong        2023-11-30  4621  
10e02467129518 Neil Armstrong        2023-11-30  4622  			pcie1_default_state: pcie1-default-state {
10e02467129518 Neil Armstrong        2023-11-30  4623  				perst-pins {
10e02467129518 Neil Armstrong        2023-11-30  4624  					pins = "gpio97";
10e02467129518 Neil Armstrong        2023-11-30  4625  					function = "gpio";
10e02467129518 Neil Armstrong        2023-11-30  4626  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4627  					bias-pull-down;
10e02467129518 Neil Armstrong        2023-11-30  4628  				};
10e02467129518 Neil Armstrong        2023-11-30  4629  
10e02467129518 Neil Armstrong        2023-11-30  4630  				clkreq-pins {
10e02467129518 Neil Armstrong        2023-11-30  4631  					pins = "gpio98";
10e02467129518 Neil Armstrong        2023-11-30  4632  					function = "pcie1_clk_req_n";
10e02467129518 Neil Armstrong        2023-11-30  4633  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4634  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4635  				};
10e02467129518 Neil Armstrong        2023-11-30  4636  
10e02467129518 Neil Armstrong        2023-11-30  4637  				wake-pins {
10e02467129518 Neil Armstrong        2023-11-30  4638  					pins = "gpio99";
10e02467129518 Neil Armstrong        2023-11-30  4639  					function = "gpio";
10e02467129518 Neil Armstrong        2023-11-30  4640  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4641  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4642  				};
10e02467129518 Neil Armstrong        2023-11-30  4643  			};
10e02467129518 Neil Armstrong        2023-11-30  4644  
10e02467129518 Neil Armstrong        2023-11-30  4645  			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4646  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4647  				pins = "gpio32", "gpio33";
10e02467129518 Neil Armstrong        2023-11-30  4648  				function = "qup1_se0";
10e02467129518 Neil Armstrong        2023-11-30  4649  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4650  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4651  			};
10e02467129518 Neil Armstrong        2023-11-30  4652  
10e02467129518 Neil Armstrong        2023-11-30  4653  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4654  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4655  				pins = "gpio36", "gpio37";
10e02467129518 Neil Armstrong        2023-11-30  4656  				function = "qup1_se1";
10e02467129518 Neil Armstrong        2023-11-30  4657  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4658  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4659  			};
10e02467129518 Neil Armstrong        2023-11-30  4660  
10e02467129518 Neil Armstrong        2023-11-30  4661  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4662  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4663  				pins = "gpio40", "gpio41";
10e02467129518 Neil Armstrong        2023-11-30  4664  				function = "qup1_se2";
10e02467129518 Neil Armstrong        2023-11-30  4665  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4666  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4667  			};
10e02467129518 Neil Armstrong        2023-11-30  4668  
10e02467129518 Neil Armstrong        2023-11-30  4669  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4670  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4671  				pins = "gpio44", "gpio45";
10e02467129518 Neil Armstrong        2023-11-30  4672  				function = "qup1_se3";
10e02467129518 Neil Armstrong        2023-11-30  4673  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4674  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4675  			};
10e02467129518 Neil Armstrong        2023-11-30  4676  
10e02467129518 Neil Armstrong        2023-11-30  4677  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4678  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4679  				pins = "gpio48", "gpio49";
10e02467129518 Neil Armstrong        2023-11-30  4680  				function = "qup1_se4";
10e02467129518 Neil Armstrong        2023-11-30  4681  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4682  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4683  			};
10e02467129518 Neil Armstrong        2023-11-30  4684  
10e02467129518 Neil Armstrong        2023-11-30  4685  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4686  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4687  				pins = "gpio52", "gpio53";
10e02467129518 Neil Armstrong        2023-11-30  4688  				function = "qup1_se5";
10e02467129518 Neil Armstrong        2023-11-30  4689  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4690  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4691  			};
10e02467129518 Neil Armstrong        2023-11-30  4692  
10e02467129518 Neil Armstrong        2023-11-30  4693  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4694  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4695  				pins = "gpio56", "gpio57";
10e02467129518 Neil Armstrong        2023-11-30  4696  				function = "qup1_se6";
10e02467129518 Neil Armstrong        2023-11-30  4697  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4698  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4699  			};
10e02467129518 Neil Armstrong        2023-11-30  4700  
10e02467129518 Neil Armstrong        2023-11-30  4701  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4702  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4703  				pins = "gpio60", "gpio61";
10e02467129518 Neil Armstrong        2023-11-30  4704  				function = "qup1_se7";
10e02467129518 Neil Armstrong        2023-11-30  4705  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4706  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4707  			};
10e02467129518 Neil Armstrong        2023-11-30  4708  
10e02467129518 Neil Armstrong        2023-11-30  4709  			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4710  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4711  				pins = "gpio0", "gpio1";
10e02467129518 Neil Armstrong        2023-11-30  4712  				function = "qup2_se0";
10e02467129518 Neil Armstrong        2023-11-30  4713  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4714  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4715  			};
10e02467129518 Neil Armstrong        2023-11-30  4716  
10e02467129518 Neil Armstrong        2023-11-30  4717  			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4718  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4719  				pins = "gpio4", "gpio5";
10e02467129518 Neil Armstrong        2023-11-30  4720  				function = "qup2_se1";
10e02467129518 Neil Armstrong        2023-11-30  4721  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4722  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4723  			};
10e02467129518 Neil Armstrong        2023-11-30  4724  
10e02467129518 Neil Armstrong        2023-11-30  4725  			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4726  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4727  				pins = "gpio8", "gpio9";
10e02467129518 Neil Armstrong        2023-11-30  4728  				function = "qup2_se2";
10e02467129518 Neil Armstrong        2023-11-30  4729  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4730  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4731  			};
10e02467129518 Neil Armstrong        2023-11-30  4732  
10e02467129518 Neil Armstrong        2023-11-30  4733  			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4734  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4735  				pins = "gpio12", "gpio13";
10e02467129518 Neil Armstrong        2023-11-30  4736  				function = "qup2_se3";
10e02467129518 Neil Armstrong        2023-11-30  4737  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4738  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4739  			};
10e02467129518 Neil Armstrong        2023-11-30  4740  
10e02467129518 Neil Armstrong        2023-11-30  4741  			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4742  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4743  				pins = "gpio16", "gpio17";
10e02467129518 Neil Armstrong        2023-11-30  4744  				function = "qup2_se4";
10e02467129518 Neil Armstrong        2023-11-30  4745  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4746  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4747  			};
10e02467129518 Neil Armstrong        2023-11-30  4748  
10e02467129518 Neil Armstrong        2023-11-30  4749  			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4750  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4751  				pins = "gpio20", "gpio21";
10e02467129518 Neil Armstrong        2023-11-30  4752  				function = "qup2_se5";
10e02467129518 Neil Armstrong        2023-11-30  4753  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4754  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4755  			};
10e02467129518 Neil Armstrong        2023-11-30  4756  
10e02467129518 Neil Armstrong        2023-11-30  4757  			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4758  				/* SDA, SCL */
10e02467129518 Neil Armstrong        2023-11-30  4759  				pins = "gpio24", "gpio25";
10e02467129518 Neil Armstrong        2023-11-30  4760  				function = "qup2_se6";
10e02467129518 Neil Armstrong        2023-11-30  4761  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4762  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4763  			};
10e02467129518 Neil Armstrong        2023-11-30  4764  
10e02467129518 Neil Armstrong        2023-11-30  4765  			qup_spi0_cs: qup-spi0-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4766  				pins = "gpio35";
10e02467129518 Neil Armstrong        2023-11-30  4767  				function = "qup1_se0";
10e02467129518 Neil Armstrong        2023-11-30  4768  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4769  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4770  			};
10e02467129518 Neil Armstrong        2023-11-30  4771  
10e02467129518 Neil Armstrong        2023-11-30  4772  			qup_spi0_data_clk: qup-spi0-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4773  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4774  				pins = "gpio32", "gpio33", "gpio34";
10e02467129518 Neil Armstrong        2023-11-30  4775  				function = "qup1_se0";
10e02467129518 Neil Armstrong        2023-11-30  4776  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4777  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4778  			};
10e02467129518 Neil Armstrong        2023-11-30  4779  
10e02467129518 Neil Armstrong        2023-11-30  4780  			qup_spi1_cs: qup-spi1-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4781  				pins = "gpio39";
10e02467129518 Neil Armstrong        2023-11-30  4782  				function = "qup1_se1";
10e02467129518 Neil Armstrong        2023-11-30  4783  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4784  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4785  			};
d2350377997f36 Neil Armstrong        2023-11-30  4786  
10e02467129518 Neil Armstrong        2023-11-30  4787  			qup_spi1_data_clk: qup-spi1-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4788  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4789  				pins = "gpio36", "gpio37", "gpio38";
10e02467129518 Neil Armstrong        2023-11-30  4790  				function = "qup1_se1";
10e02467129518 Neil Armstrong        2023-11-30  4791  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4792  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4793  			};
d2350377997f36 Neil Armstrong        2023-11-30  4794  
10e02467129518 Neil Armstrong        2023-11-30  4795  			qup_spi2_cs: qup-spi2-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4796  				pins = "gpio43";
10e02467129518 Neil Armstrong        2023-11-30  4797  				function = "qup1_se2";
10e02467129518 Neil Armstrong        2023-11-30  4798  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4799  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4800  			};
d2350377997f36 Neil Armstrong        2023-11-30  4801  
10e02467129518 Neil Armstrong        2023-11-30  4802  			qup_spi2_data_clk: qup-spi2-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4803  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4804  				pins = "gpio40", "gpio41", "gpio42";
10e02467129518 Neil Armstrong        2023-11-30  4805  				function = "qup1_se2";
10e02467129518 Neil Armstrong        2023-11-30  4806  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4807  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4808  			};
d2350377997f36 Neil Armstrong        2023-11-30  4809  
10e02467129518 Neil Armstrong        2023-11-30  4810  			qup_spi3_cs: qup-spi3-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4811  				pins = "gpio47";
10e02467129518 Neil Armstrong        2023-11-30  4812  				function = "qup1_se3";
10e02467129518 Neil Armstrong        2023-11-30  4813  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4814  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4815  			};
d2350377997f36 Neil Armstrong        2023-11-30  4816  
10e02467129518 Neil Armstrong        2023-11-30  4817  			qup_spi3_data_clk: qup-spi3-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4818  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4819  				pins = "gpio44", "gpio45", "gpio46";
10e02467129518 Neil Armstrong        2023-11-30  4820  				function = "qup1_se3";
10e02467129518 Neil Armstrong        2023-11-30  4821  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4822  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4823  			};
d2350377997f36 Neil Armstrong        2023-11-30  4824  
10e02467129518 Neil Armstrong        2023-11-30  4825  			qup_spi4_cs: qup-spi4-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4826  				pins = "gpio51";
10e02467129518 Neil Armstrong        2023-11-30  4827  				function = "qup1_se4";
10e02467129518 Neil Armstrong        2023-11-30  4828  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4829  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4830  			};
d2350377997f36 Neil Armstrong        2023-11-30  4831  
10e02467129518 Neil Armstrong        2023-11-30  4832  			qup_spi4_data_clk: qup-spi4-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4833  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4834  				pins = "gpio48", "gpio49", "gpio50";
10e02467129518 Neil Armstrong        2023-11-30  4835  				function = "qup1_se4";
10e02467129518 Neil Armstrong        2023-11-30  4836  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4837  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4838  			};
d2350377997f36 Neil Armstrong        2023-11-30  4839  
10e02467129518 Neil Armstrong        2023-11-30  4840  			qup_spi5_cs: qup-spi5-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4841  				pins = "gpio55";
10e02467129518 Neil Armstrong        2023-11-30  4842  				function = "qup1_se5";
10e02467129518 Neil Armstrong        2023-11-30  4843  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4844  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4845  			};
d2350377997f36 Neil Armstrong        2023-11-30  4846  
10e02467129518 Neil Armstrong        2023-11-30  4847  			qup_spi5_data_clk: qup-spi5-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4848  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4849  				pins = "gpio52", "gpio53", "gpio54";
10e02467129518 Neil Armstrong        2023-11-30  4850  				function = "qup1_se5";
10e02467129518 Neil Armstrong        2023-11-30  4851  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4852  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4853  			};
d2350377997f36 Neil Armstrong        2023-11-30  4854  
10e02467129518 Neil Armstrong        2023-11-30  4855  			qup_spi6_cs: qup-spi6-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4856  				pins = "gpio59";
10e02467129518 Neil Armstrong        2023-11-30  4857  				function = "qup1_se6";
10e02467129518 Neil Armstrong        2023-11-30  4858  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4859  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4860  			};
d2350377997f36 Neil Armstrong        2023-11-30  4861  
10e02467129518 Neil Armstrong        2023-11-30  4862  			qup_spi6_data_clk: qup-spi6-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4863  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4864  				pins = "gpio56", "gpio57", "gpio58";
10e02467129518 Neil Armstrong        2023-11-30  4865  				function = "qup1_se6";
10e02467129518 Neil Armstrong        2023-11-30  4866  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4867  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4868  			};
d2350377997f36 Neil Armstrong        2023-11-30  4869  
10e02467129518 Neil Armstrong        2023-11-30  4870  			qup_spi7_cs: qup-spi7-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4871  				pins = "gpio63";
10e02467129518 Neil Armstrong        2023-11-30  4872  				function = "qup1_se7";
10e02467129518 Neil Armstrong        2023-11-30  4873  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4874  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4875  			};
d2350377997f36 Neil Armstrong        2023-11-30  4876  
10e02467129518 Neil Armstrong        2023-11-30  4877  			qup_spi7_data_clk: qup-spi7-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4878  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4879  				pins = "gpio60", "gpio61", "gpio62";
10e02467129518 Neil Armstrong        2023-11-30  4880  				function = "qup1_se7";
10e02467129518 Neil Armstrong        2023-11-30  4881  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4882  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4883  			};
d2350377997f36 Neil Armstrong        2023-11-30  4884  
10e02467129518 Neil Armstrong        2023-11-30  4885  			qup_spi8_cs: qup-spi8-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4886  				pins = "gpio3";
10e02467129518 Neil Armstrong        2023-11-30  4887  				function = "qup2_se0";
10e02467129518 Neil Armstrong        2023-11-30  4888  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4889  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4890  			};
d2350377997f36 Neil Armstrong        2023-11-30  4891  
10e02467129518 Neil Armstrong        2023-11-30  4892  			qup_spi8_data_clk: qup-spi8-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4893  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4894  				pins = "gpio0", "gpio1", "gpio2";
10e02467129518 Neil Armstrong        2023-11-30  4895  				function = "qup2_se0";
10e02467129518 Neil Armstrong        2023-11-30  4896  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4897  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4898  			};
d2350377997f36 Neil Armstrong        2023-11-30  4899  
10e02467129518 Neil Armstrong        2023-11-30  4900  			qup_spi9_cs: qup-spi9-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4901  				pins = "gpio7";
10e02467129518 Neil Armstrong        2023-11-30  4902  				function = "qup2_se1";
10e02467129518 Neil Armstrong        2023-11-30  4903  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4904  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4905  			};
d2350377997f36 Neil Armstrong        2023-11-30  4906  
10e02467129518 Neil Armstrong        2023-11-30  4907  			qup_spi9_data_clk: qup-spi9-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4908  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4909  				pins = "gpio4", "gpio5", "gpio6";
10e02467129518 Neil Armstrong        2023-11-30  4910  				function = "qup2_se1";
10e02467129518 Neil Armstrong        2023-11-30  4911  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4912  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4913  			};
d2350377997f36 Neil Armstrong        2023-11-30  4914  
10e02467129518 Neil Armstrong        2023-11-30  4915  			qup_spi10_cs: qup-spi10-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4916  				pins = "gpio11";
10e02467129518 Neil Armstrong        2023-11-30  4917  				function = "qup2_se2";
10e02467129518 Neil Armstrong        2023-11-30  4918  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4919  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4920  			};
d2350377997f36 Neil Armstrong        2023-11-30  4921  
10e02467129518 Neil Armstrong        2023-11-30  4922  			qup_spi10_data_clk: qup-spi10-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4923  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4924  				pins = "gpio8", "gpio9", "gpio10";
10e02467129518 Neil Armstrong        2023-11-30  4925  				function = "qup2_se2";
10e02467129518 Neil Armstrong        2023-11-30  4926  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4927  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4928  			};
d2350377997f36 Neil Armstrong        2023-11-30  4929  
10e02467129518 Neil Armstrong        2023-11-30  4930  			qup_spi11_cs: qup-spi11-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4931  				pins = "gpio15";
10e02467129518 Neil Armstrong        2023-11-30  4932  				function = "qup2_se3";
10e02467129518 Neil Armstrong        2023-11-30  4933  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4934  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4935  			};
d2350377997f36 Neil Armstrong        2023-11-30  4936  
10e02467129518 Neil Armstrong        2023-11-30  4937  			qup_spi11_data_clk: qup-spi11-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4938  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4939  				pins = "gpio12", "gpio13", "gpio14";
10e02467129518 Neil Armstrong        2023-11-30  4940  				function = "qup2_se3";
10e02467129518 Neil Armstrong        2023-11-30  4941  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4942  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4943  			};
d2350377997f36 Neil Armstrong        2023-11-30  4944  
10e02467129518 Neil Armstrong        2023-11-30  4945  			qup_spi12_cs: qup-spi12-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4946  				pins = "gpio19";
10e02467129518 Neil Armstrong        2023-11-30  4947  				function = "qup2_se4";
10e02467129518 Neil Armstrong        2023-11-30  4948  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4949  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4950  			};
d2350377997f36 Neil Armstrong        2023-11-30  4951  
10e02467129518 Neil Armstrong        2023-11-30  4952  			qup_spi12_data_clk: qup-spi12-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4953  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4954  				pins = "gpio16", "gpio17", "gpio18";
10e02467129518 Neil Armstrong        2023-11-30  4955  				function = "qup2_se4";
10e02467129518 Neil Armstrong        2023-11-30  4956  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4957  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  4958  			};
d2350377997f36 Neil Armstrong        2023-11-30  4959  
10e02467129518 Neil Armstrong        2023-11-30  4960  			qup_spi13_cs: qup-spi13-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4961  				pins = "gpio23";
10e02467129518 Neil Armstrong        2023-11-30  4962  				function = "qup2_se5";
10e02467129518 Neil Armstrong        2023-11-30  4963  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4964  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4965  			};
d2350377997f36 Neil Armstrong        2023-11-30  4966  
10e02467129518 Neil Armstrong        2023-11-30  4967  			qup_spi13_data_clk: qup-spi13-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4968  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4969  				pins = "gpio20", "gpio21", "gpio22";
10e02467129518 Neil Armstrong        2023-11-30  4970  				function = "qup2_se5";
10e02467129518 Neil Armstrong        2023-11-30  4971  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4972  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4973  			};
d2350377997f36 Neil Armstrong        2023-11-30  4974  
10e02467129518 Neil Armstrong        2023-11-30  4975  			qup_spi14_cs: qup-spi14-cs-state {
10e02467129518 Neil Armstrong        2023-11-30  4976  				pins = "gpio27";
10e02467129518 Neil Armstrong        2023-11-30  4977  				function = "qup2_se6";
10e02467129518 Neil Armstrong        2023-11-30  4978  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4979  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4980  			};
d2350377997f36 Neil Armstrong        2023-11-30  4981  
10e02467129518 Neil Armstrong        2023-11-30  4982  			qup_spi14_data_clk: qup-spi14-data-clk-state {
10e02467129518 Neil Armstrong        2023-11-30  4983  				/* MISO, MOSI, CLK */
10e02467129518 Neil Armstrong        2023-11-30  4984  				pins = "gpio24", "gpio25", "gpio26";
10e02467129518 Neil Armstrong        2023-11-30  4985  				function = "qup2_se6";
10e02467129518 Neil Armstrong        2023-11-30  4986  				drive-strength = <6>;
10e02467129518 Neil Armstrong        2023-11-30  4987  				bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  4988  			};
d2350377997f36 Neil Armstrong        2023-11-30  4989  
10e02467129518 Neil Armstrong        2023-11-30  4990  			qup_uart14_default: qup-uart14-default-state {
10e02467129518 Neil Armstrong        2023-11-30  4991  				/* TX, RX */
10e02467129518 Neil Armstrong        2023-11-30  4992  				pins = "gpio26", "gpio27";
10e02467129518 Neil Armstrong        2023-11-30  4993  				function = "qup2_se6";
10e02467129518 Neil Armstrong        2023-11-30  4994  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  4995  				bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  4996  			};
d2350377997f36 Neil Armstrong        2023-11-30  4997  
10e02467129518 Neil Armstrong        2023-11-30  4998  			qup_uart14_cts_rts: qup-uart14-cts-rts-state {
10e02467129518 Neil Armstrong        2023-11-30  4999  				/* CTS, RTS */
10e02467129518 Neil Armstrong        2023-11-30  5000  				pins = "gpio24", "gpio25";
10e02467129518 Neil Armstrong        2023-11-30  5001  				function = "qup2_se6";
10e02467129518 Neil Armstrong        2023-11-30  5002  				drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  5003  				bias-pull-down;
10e02467129518 Neil Armstrong        2023-11-30  5004  			};
d2350377997f36 Neil Armstrong        2023-11-30  5005  
d2350377997f36 Neil Armstrong        2023-11-30  5006  			qup_uart15_default: qup-uart15-default-state {
d2350377997f36 Neil Armstrong        2023-11-30  5007  				/* TX, RX */
d2350377997f36 Neil Armstrong        2023-11-30  5008  				pins = "gpio30", "gpio31";
d2350377997f36 Neil Armstrong        2023-11-30  5009  				function = "qup2_se7";
d2350377997f36 Neil Armstrong        2023-11-30  5010  				drive-strength = <2>;
d2350377997f36 Neil Armstrong        2023-11-30  5011  				bias-disable;
d2350377997f36 Neil Armstrong        2023-11-30  5012  			};
10e02467129518 Neil Armstrong        2023-11-30  5013  
10e02467129518 Neil Armstrong        2023-11-30  5014  			sdc2_sleep: sdc2-sleep-state {
10e02467129518 Neil Armstrong        2023-11-30  5015  				clk-pins {
10e02467129518 Neil Armstrong        2023-11-30  5016  					pins = "sdc2_clk";
10e02467129518 Neil Armstrong        2023-11-30  5017  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  5018  					bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  5019  				};
10e02467129518 Neil Armstrong        2023-11-30  5020  
10e02467129518 Neil Armstrong        2023-11-30  5021  				cmd-pins {
10e02467129518 Neil Armstrong        2023-11-30  5022  					pins = "sdc2_cmd";
10e02467129518 Neil Armstrong        2023-11-30  5023  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  5024  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  5025  				};
10e02467129518 Neil Armstrong        2023-11-30  5026  
10e02467129518 Neil Armstrong        2023-11-30  5027  				data-pins {
10e02467129518 Neil Armstrong        2023-11-30  5028  					pins = "sdc2_data";
10e02467129518 Neil Armstrong        2023-11-30  5029  					drive-strength = <2>;
10e02467129518 Neil Armstrong        2023-11-30  5030  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  5031  				};
10e02467129518 Neil Armstrong        2023-11-30  5032  			};
10e02467129518 Neil Armstrong        2023-11-30  5033  
10e02467129518 Neil Armstrong        2023-11-30  5034  			sdc2_default: sdc2-default-state {
10e02467129518 Neil Armstrong        2023-11-30  5035  				clk-pins {
10e02467129518 Neil Armstrong        2023-11-30  5036  					pins = "sdc2_clk";
10e02467129518 Neil Armstrong        2023-11-30  5037  					drive-strength = <16>;
10e02467129518 Neil Armstrong        2023-11-30  5038  					bias-disable;
10e02467129518 Neil Armstrong        2023-11-30  5039  				};
10e02467129518 Neil Armstrong        2023-11-30  5040  
10e02467129518 Neil Armstrong        2023-11-30  5041  				cmd-pins {
10e02467129518 Neil Armstrong        2023-11-30  5042  					pins = "sdc2_cmd";
10e02467129518 Neil Armstrong        2023-11-30  5043  					drive-strength = <10>;
10e02467129518 Neil Armstrong        2023-11-30  5044  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  5045  				};
10e02467129518 Neil Armstrong        2023-11-30  5046  
10e02467129518 Neil Armstrong        2023-11-30  5047  				data-pins {
10e02467129518 Neil Armstrong        2023-11-30  5048  					pins = "sdc2_data";
10e02467129518 Neil Armstrong        2023-11-30  5049  					drive-strength = <10>;
10e02467129518 Neil Armstrong        2023-11-30  5050  					bias-pull-up;
10e02467129518 Neil Armstrong        2023-11-30  5051  				};
10e02467129518 Neil Armstrong        2023-11-30  5052  			};
d2350377997f36 Neil Armstrong        2023-11-30  5053  		};
d2350377997f36 Neil Armstrong        2023-11-30  5054  
7305c711800ce1 Yingchao Deng         2025-05-29  5055  		ctcu@10001000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5056  			compatible = "qcom,sa8775p-ctcu";
7305c711800ce1 Yingchao Deng         2025-05-29  5057  			reg = <0x0 0x10001000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5058  
7305c711800ce1 Yingchao Deng         2025-05-29  5059  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5060  			clock-names = "apb";
7305c711800ce1 Yingchao Deng         2025-05-29  5061  
7305c711800ce1 Yingchao Deng         2025-05-29  5062  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5063  				#address-cells = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5064  				#size-cells = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5065  
7305c711800ce1 Yingchao Deng         2025-05-29  5066  				port@0 {
7305c711800ce1 Yingchao Deng         2025-05-29  5067  					reg = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5068  					ctcu_in0: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5069  					remote-endpoint = <&etr0_out>;
7305c711800ce1 Yingchao Deng         2025-05-29  5070  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5071  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5072  
7305c711800ce1 Yingchao Deng         2025-05-29  5073  				port@1 {
7305c711800ce1 Yingchao Deng         2025-05-29  5074  					reg = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5075  					ctcu_in1: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5076  					remote-endpoint = <&etr1_out>;
7305c711800ce1 Yingchao Deng         2025-05-29  5077  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5078  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5079  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5080  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5081  
7305c711800ce1 Yingchao Deng         2025-05-29  5082  		stm@10002000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5083  			compatible = "arm,coresight-stm", "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5084  			reg = <0x0 0x10002000 0x0 0x1000>,
7305c711800ce1 Yingchao Deng         2025-05-29  5085  				<0x0 0x16280000 0x0 0x180000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5086  			reg-names = "stm-base", "stm-stimulus-base";
7305c711800ce1 Yingchao Deng         2025-05-29  5087  
7305c711800ce1 Yingchao Deng         2025-05-29  5088  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5089  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5090  
7305c711800ce1 Yingchao Deng         2025-05-29  5091  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5092  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5093  					stm_out_funnel_in0: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5094  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5095  						<&funnel_in0_in_stm>;
7305c711800ce1 Yingchao Deng         2025-05-29  5096  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5097  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5098  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5099  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5100  
7305c711800ce1 Yingchao Deng         2025-05-29  5101  		funnel@10041000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5102  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5103  			reg = <0x0 0x10041000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5104  
7305c711800ce1 Yingchao Deng         2025-05-29  5105  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5106  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5107  
7305c711800ce1 Yingchao Deng         2025-05-29  5108  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5109  				#address-cells = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5110  				#size-cells = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5111  
7305c711800ce1 Yingchao Deng         2025-05-29  5112  				port@7 {
7305c711800ce1 Yingchao Deng         2025-05-29  5113  					reg = <7>;
7305c711800ce1 Yingchao Deng         2025-05-29  5114  					funnel_in0_in_stm: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5115  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5116  						<&stm_out_funnel_in0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5117  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5118  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5119  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5120  
7305c711800ce1 Yingchao Deng         2025-05-29  5121  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5122  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5123  					funnel_in0_out_funnel_qdss: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5124  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5125  						<&funnel_qdss_in_funnel_in0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5126  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5127  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5128  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5129  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5130  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5131  		funnel@10042000 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5132  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5133  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5134  			reg = <0x0 0x10042000 0x0 0x1000>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5135  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5136  			clocks = <&aoss_qmp>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5137  			clock-names = "apb_pclk";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5138  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5139  			in-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5140  				#address-cells = <1>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5141  				#size-cells = <0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5142  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5143  				port@4 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5144  					reg = <4>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5145  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5146  					funnel_in1_in_funnel_apss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5147  						remote-endpoint = <&funnel_apss_out_funnel_in1>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5148  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5149  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5150  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5151  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5152  			out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5153  				port {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5154  					funnel_in1_out_funnel_qdss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5155  						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5156  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5157  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5158  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5159  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5160  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5161  		funnel@10045000 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5162  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5163  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5164  			reg = <0x0 0x10045000 0x0 0x1000>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5165  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5166  			clocks = <&aoss_qmp>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5167  			clock-names = "apb_pclk";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5168  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5169  			in-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5170  				#address-cells = <1>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5171  				#size-cells = <0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5172  
7305c711800ce1 Yingchao Deng         2025-05-29  5173  				port@0 {
7305c711800ce1 Yingchao Deng         2025-05-29  5174  					reg = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5175  
7305c711800ce1 Yingchao Deng         2025-05-29  5176  					funnel_qdss_in_funnel_in0: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5177  						remote-endpoint = <&funnel_in0_out_funnel_qdss>;
7305c711800ce1 Yingchao Deng         2025-05-29  5178  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5179  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5180  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5181  				port@1 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5182  					reg = <1>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5183  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5184  					funnel_qdss_in_funnel_in1: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5185  						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5186  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5187  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5188  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5189  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5190  			out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5191  				port {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5192  					funnel_qdss_out_funnel_aoss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5193  						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5194  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5195  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5196  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5197  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5198  
7305c711800ce1 Yingchao Deng         2025-05-29  5199  		replicator@10046000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5200  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5201  			reg = <0x0 0x10046000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5202  
7305c711800ce1 Yingchao Deng         2025-05-29  5203  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5204  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5205  
7305c711800ce1 Yingchao Deng         2025-05-29  5206  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5207  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5208  					replicator_qdss_in_replicator_swao: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5209  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5210  						<&replicator_swao_out_replicator_qdss>;
7305c711800ce1 Yingchao Deng         2025-05-29  5211  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5212  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5213  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5214  
7305c711800ce1 Yingchao Deng         2025-05-29 @5215  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5216  				#address-cells = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5217  				#size-cells = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5218  
7305c711800ce1 Yingchao Deng         2025-05-29 @5219  				port@0 {
7305c711800ce1 Yingchao Deng         2025-05-29  5220  					replicator_qdss_out_replicator_etr: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5221  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5222  						<&replicator_etr_in_replicator_qdss>;
7305c711800ce1 Yingchao Deng         2025-05-29  5223  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5224  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5225  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5226  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5227  
7305c711800ce1 Yingchao Deng         2025-05-29  5228  		tmc@10048000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5229  			compatible = "arm,coresight-tmc", "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5230  			reg = <0x0 0x10048000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5231  
7305c711800ce1 Yingchao Deng         2025-05-29  5232  			iommus = <&apps_smmu 0x04e0 0>,
7305c711800ce1 Yingchao Deng         2025-05-29  5233  				<&apps_smmu 0x04c0 0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5234  			dma-coherent;
7305c711800ce1 Yingchao Deng         2025-05-29  5235  			arm,scatter-gather;
7305c711800ce1 Yingchao Deng         2025-05-29  5236  
7305c711800ce1 Yingchao Deng         2025-05-29  5237  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5238  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5239  
7305c711800ce1 Yingchao Deng         2025-05-29  5240  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5241  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5242  					tmc_etr_in_replicator_etr: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5243  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5244  						<&replicator_etr_out_tmc_etr>;
7305c711800ce1 Yingchao Deng         2025-05-29  5245  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5246  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5247  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5248  
7305c711800ce1 Yingchao Deng         2025-05-29  5249  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5250  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5251  					etr0_out: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5252  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5253  						<&ctcu_in0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5254  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5255  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5256  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5257  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5258  
7305c711800ce1 Yingchao Deng         2025-05-29  5259  		replicator@1004e000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5260  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5261  			reg = <0x0 0x1004e000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5262  
7305c711800ce1 Yingchao Deng         2025-05-29  5263  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5264  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5265  
7305c711800ce1 Yingchao Deng         2025-05-29  5266  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5267  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5268  					replicator_etr_in_replicator_qdss: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5269  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5270  						<&replicator_qdss_out_replicator_etr>;
7305c711800ce1 Yingchao Deng         2025-05-29  5271  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5272  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5273  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5274  
7305c711800ce1 Yingchao Deng         2025-05-29  5275  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5276  				#address-cells = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5277  				#size-cells = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5278  
7305c711800ce1 Yingchao Deng         2025-05-29  5279  				port@0 {
7305c711800ce1 Yingchao Deng         2025-05-29  5280  					reg = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5281  					replicator_etr_out_tmc_etr: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5282  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5283  						<&tmc_etr_in_replicator_etr>;
7305c711800ce1 Yingchao Deng         2025-05-29  5284  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5285  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5286  				port@1 {
7305c711800ce1 Yingchao Deng         2025-05-29  5287  					reg = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5288  					replicator_etr_out_tmc_etr1: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5289  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5290  						<&tmc_etr1_in_replicator_etr>;
7305c711800ce1 Yingchao Deng         2025-05-29  5291  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5292  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5293  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5294  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5295  
7305c711800ce1 Yingchao Deng         2025-05-29  5296  		tmc@1004f000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5297  			compatible = "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5298  			reg = <0x0 0x1004f000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5299  
7305c711800ce1 Yingchao Deng         2025-05-29  5300  			iommus = <&apps_smmu 0x0500 0x0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5301  			dma-coherent;
7305c711800ce1 Yingchao Deng         2025-05-29  5302  			arm,scatter-gather;
7305c711800ce1 Yingchao Deng         2025-05-29  5303  
7305c711800ce1 Yingchao Deng         2025-05-29  5304  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5305  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5306  
7305c711800ce1 Yingchao Deng         2025-05-29  5307  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5308  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5309  					tmc_etr1_in_replicator_etr: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5310  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5311  						<&replicator_etr_out_tmc_etr1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5312  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5313  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5314  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5315  
7305c711800ce1 Yingchao Deng         2025-05-29  5316  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5317  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5318  					etr1_out: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5319  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5320  						<&ctcu_in1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5321  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5322  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5323  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5324  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5325  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5326  		funnel@10b04000 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5327  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5328  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5329  			reg = <0x0 0x10b04000 0x0 0x1000>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5330  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5331  			clocks = <&aoss_qmp>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5332  			clock-names = "apb_pclk";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5333  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5334  			in-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5335  				#address-cells = <1>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5336  				#size-cells = <0>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5337  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5338  				port@7 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5339  					reg = <7>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5340  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5341  					funnel_aoss_in_funnel_qdss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5342  						remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5343  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5344  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5345  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5346  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5347  			out-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5348  				port {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5349  					funnel_aoss_out_tmc_etf: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5350  						remote-endpoint = <&tmc_etf_in_funnel_aoss>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5351  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5352  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5353  			};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5354  		};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5355  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5356  		tmc@10b05000 {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5357  			compatible = "arm,coresight-tmc", "arm,primecell";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5358  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5359  			reg = <0x0 0x10b05000 0x0 0x1000>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5360  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5361  			clocks = <&aoss_qmp>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5362  			clock-names = "apb_pclk";
256e6937e48a14 Yuanfang Zhang        2025-01-07  5363  
256e6937e48a14 Yuanfang Zhang        2025-01-07  5364  			in-ports {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5365  				port {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5366  					tmc_etf_in_funnel_aoss: endpoint {
256e6937e48a14 Yuanfang Zhang        2025-01-07  5367  						remote-endpoint = <&funnel_aoss_out_tmc_etf>;
256e6937e48a14 Yuanfang Zhang        2025-01-07  5368  					};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5369  				};
256e6937e48a14 Yuanfang Zhang        2025-01-07  5370  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5371  
7305c711800ce1 Yingchao Deng         2025-05-29  5372  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5373  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5374  					tmc_etf_out_replicator_swao: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5375  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5376  						<&replicator_swao_in_tmc_etf>;
7305c711800ce1 Yingchao Deng         2025-05-29  5377  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5378  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5379  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5380  		};
7305c711800ce1 Yingchao Deng         2025-05-29  5381  
7305c711800ce1 Yingchao Deng         2025-05-29  5382  		replicator@10b06000 {
7305c711800ce1 Yingchao Deng         2025-05-29  5383  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
7305c711800ce1 Yingchao Deng         2025-05-29  5384  			reg = <0x0 0x10b06000 0x0 0x1000>;
7305c711800ce1 Yingchao Deng         2025-05-29  5385  
7305c711800ce1 Yingchao Deng         2025-05-29  5386  			qcom,replicator-loses-context;
7305c711800ce1 Yingchao Deng         2025-05-29  5387  			clocks = <&aoss_qmp>;
7305c711800ce1 Yingchao Deng         2025-05-29  5388  			clock-names = "apb_pclk";
7305c711800ce1 Yingchao Deng         2025-05-29  5389  
7305c711800ce1 Yingchao Deng         2025-05-29  5390  			in-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5391  				port {
7305c711800ce1 Yingchao Deng         2025-05-29  5392  					replicator_swao_in_tmc_etf: endpoint {
7305c711800ce1 Yingchao Deng         2025-05-29  5393  						remote-endpoint =
7305c711800ce1 Yingchao Deng         2025-05-29  5394  						<&tmc_etf_out_replicator_swao>;
7305c711800ce1 Yingchao Deng         2025-05-29  5395  					};
7305c711800ce1 Yingchao Deng         2025-05-29  5396  				};
7305c711800ce1 Yingchao Deng         2025-05-29  5397  			};
7305c711800ce1 Yingchao Deng         2025-05-29  5398  
7305c711800ce1 Yingchao Deng         2025-05-29 @5399  			out-ports {
7305c711800ce1 Yingchao Deng         2025-05-29  5400  				#address-cells = <1>;
7305c711800ce1 Yingchao Deng         2025-05-29  5401  				#size-cells = <0>;
7305c711800ce1 Yingchao Deng         2025-05-29  5402  
7305c711800ce1 Yingchao Deng         2025-05-29 @5403  				port@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
