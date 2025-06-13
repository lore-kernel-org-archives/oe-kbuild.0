Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E81E50E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775829; cv=none; b=Q+IAB8/9id+1AAOoPUlD97RhIO2jQQ17Z7HfbMDpC55vcnUUmDfYfvDN+Wt6qje4ykXlTJZT3ZH7JCaBDmYdU0I1KtuMmgdQexRST1uGvq9kF01XtrPgCYr8nWoivgJJx5VHO9PEp2PtkCsWVSvHnVzfjnetbcgFB15J/HuKduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775829; c=relaxed/simple;
	bh=zeksmyuUIQCRPPFNPaTNRdkE8Z5yGo4spgamABTRmo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1rMxuDC3IKVB9bbVus+Vh9k1SXyHd4HikGdZr0jEf5OSLuEoT9sYtxcVDIcsuGjqGJ4YhMMvLeZklYMroqfxhafMIapQQbT8vl5QqOPNqy1ZHFkGHuyushVGaIZwVLbFzEcFVqmw2oHwprxvTqASNPPGPeuvgBhj0Pk9pwAauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QY4zQBX8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QY4zQBX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749775820; x=1781311820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zeksmyuUIQCRPPFNPaTNRdkE8Z5yGo4spgamABTRmo4=;
  b=QY4zQBX8rsFQGyP5E0fuKYAheLSx0hVfrIAaKMXPrRE/+dXJ+m0Ci2TF
   fZ7BWUIOBgKntP/EeVM0LwnwBcgtK/0jUciLYd5eeSmrzdvXBx73H4Bei
   G/sEdqklx+LNZyyDupgWtAnvZdST1/bRfn/CtC9grA5I8fcD3sVTMvln8
   J/kDRVa/8P+TXfC5ZWlG34Rpd4eFNE+vC3dYaQrXwFaKzQ0s8Eb4SWdPW
   Qw1hRJMnrod3cD4xafF7I7Aepx5oMT2qJPClDfF3XUdrYeYa0M6w02BbX
   M4ZSy/XDEWr/873WYicXeifAIZt8+77lfG6T7VFXkOuOF5PLLHXJ84xFY
   g==;
X-CSE-ConnectionGUID: AXQEwIGsTMGq+UCIYRr6OA==
X-CSE-MsgGUID: eFD7sDFgTZilb9KiRoKsPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62258596"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="62258596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:50:19 -0700
X-CSE-ConnectionGUID: jQItGTjpTzSi8LYM8bV8qw==
X-CSE-MsgGUID: qtvJbCg+QvaQjSCgBMAkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="148160728"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2025 17:50:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPscY-000C3y-15;
	Fri, 13 Jun 2025 00:50:14 +0000
Date: Fri, 13 Jun 2025 08:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] arm64: dts: msm: Add eMMC support for qcs8300
Message-ID: <202506130843.EyOp79oS-lkp@intel.com>
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
In-Reply-To: <20250612092146.5170-2-quic_sayalil@quicinc.com>
References: <20250612092146.5170-2-quic_sayalil@quicinc.com>
TO: Sayali Lokhande <quic_sayalil@quicinc.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mmc-owner@vger.kernel.org

Hi Sayali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sayali-Lokhande/arm64-dts-msm-Add-eMMC-support-for-qcs8300/20250612-172345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250612092146.5170-2-quic_sayalil%40quicinc.com
patch subject: [PATCH 1/1] arm64: dts: msm: Add eMMC support for qcs8300
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250613/202506130843.EyOp79oS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130843.EyOp79oS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506130843.EyOp79oS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:3840.23-3894.5: Warning (simple_bus_reg): /soc@0/mmc@87C4000: simple-bus unit address format error, expected "87c4000"

vim +/87c4000 +3840 arch/arm64/boot/dts/qcom/qcs8300.dtsi

7be190e4bdd2bd Jingyi Wang         2024-12-03    21  
7be190e4bdd2bd Jingyi Wang         2024-12-03    22  / {
7be190e4bdd2bd Jingyi Wang         2024-12-03    23  	interrupt-parent = <&intc>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    24  	#address-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    25  	#size-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    26  
7be190e4bdd2bd Jingyi Wang         2024-12-03    27  	clocks {
7be190e4bdd2bd Jingyi Wang         2024-12-03    28  		xo_board_clk: xo-board-clk {
7be190e4bdd2bd Jingyi Wang         2024-12-03    29  			compatible = "fixed-clock";
7be190e4bdd2bd Jingyi Wang         2024-12-03    30  			#clock-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    31  			clock-frequency = <38400000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    32  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03    33  
7be190e4bdd2bd Jingyi Wang         2024-12-03    34  		sleep_clk: sleep-clk {
7be190e4bdd2bd Jingyi Wang         2024-12-03    35  			compatible = "fixed-clock";
7be190e4bdd2bd Jingyi Wang         2024-12-03    36  			#clock-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    37  			clock-frequency = <32000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    38  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03    39  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03    40  
7be190e4bdd2bd Jingyi Wang         2024-12-03    41  	cpus {
7be190e4bdd2bd Jingyi Wang         2024-12-03    42  		#address-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    43  		#size-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    44  
7be190e4bdd2bd Jingyi Wang         2024-12-03    45  		cpu0: cpu@0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03    46  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03    47  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd Jingyi Wang         2024-12-03    48  			reg = <0x0 0x0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    49  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03    50  			next-level-cache = <&l2_0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    51  			power-domains = <&cpu_pd0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    52  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06    53  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a Jingyi Wang         2024-12-06    54  			dynamic-power-coefficient = <472>;
2ed8ee66266057 Imran Shaik         2025-04-30    55  			qcom,freq-domain = <&cpufreq_hw 0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    56  
7be190e4bdd2bd Jingyi Wang         2024-12-03    57  			l2_0: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03    58  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03    59  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    60  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03    61  				next-level-cache = <&l3_0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    62  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03    63  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03    64  
7be190e4bdd2bd Jingyi Wang         2024-12-03    65  		cpu1: cpu@100 {
7be190e4bdd2bd Jingyi Wang         2024-12-03    66  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03    67  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd Jingyi Wang         2024-12-03    68  			reg = <0x0 0x100>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    69  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03    70  			next-level-cache = <&l2_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    71  			power-domains = <&cpu_pd1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    72  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06    73  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a Jingyi Wang         2024-12-06    74  			dynamic-power-coefficient = <472>;
2ed8ee66266057 Imran Shaik         2025-04-30    75  			qcom,freq-domain = <&cpufreq_hw 0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    76  
7be190e4bdd2bd Jingyi Wang         2024-12-03    77  			l2_1: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03    78  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03    79  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    80  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03    81  				next-level-cache = <&l3_0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    82  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03    83  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03    84  
7be190e4bdd2bd Jingyi Wang         2024-12-03    85  		cpu2: cpu@200 {
7be190e4bdd2bd Jingyi Wang         2024-12-03    86  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03    87  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd Jingyi Wang         2024-12-03    88  			reg = <0x0 0x200>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    89  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03    90  			next-level-cache = <&l2_2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    91  			power-domains = <&cpu_pd2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    92  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06    93  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a Jingyi Wang         2024-12-06    94  			dynamic-power-coefficient = <507>;
2ed8ee66266057 Imran Shaik         2025-04-30    95  			qcom,freq-domain = <&cpufreq_hw 2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03    96  
7be190e4bdd2bd Jingyi Wang         2024-12-03    97  			l2_2: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03    98  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03    99  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   100  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   101  				next-level-cache = <&l3_0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   102  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   103  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   104  
7be190e4bdd2bd Jingyi Wang         2024-12-03   105  		cpu3: cpu@300 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   106  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03   107  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd Jingyi Wang         2024-12-03   108  			reg = <0x0 0x300>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   109  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03   110  			next-level-cache = <&l2_3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   111  			power-domains = <&cpu_pd3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   112  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06   113  			capacity-dmips-mhz = <1946>;
ce4b3c48e4725a Jingyi Wang         2024-12-06   114  			dynamic-power-coefficient = <507>;
2ed8ee66266057 Imran Shaik         2025-04-30   115  			qcom,freq-domain = <&cpufreq_hw 2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   116  
7be190e4bdd2bd Jingyi Wang         2024-12-03   117  			l2_3: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03   118  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   119  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   120  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   121  				next-level-cache = <&l3_0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   122  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   123  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   124  
7be190e4bdd2bd Jingyi Wang         2024-12-03   125  		cpu4: cpu@10000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   126  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03   127  			compatible = "arm,cortex-a55";
7be190e4bdd2bd Jingyi Wang         2024-12-03   128  			reg = <0x0 0x10000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   129  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03   130  			next-level-cache = <&l2_4>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   131  			power-domains = <&cpu_pd4>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   132  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06   133  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a Jingyi Wang         2024-12-06   134  			dynamic-power-coefficient = <100>;
2ed8ee66266057 Imran Shaik         2025-04-30   135  			qcom,freq-domain = <&cpufreq_hw 1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   136  
7be190e4bdd2bd Jingyi Wang         2024-12-03   137  			l2_4: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03   138  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   139  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   140  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   141  				next-level-cache = <&l3_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   142  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   143  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   144  
7be190e4bdd2bd Jingyi Wang         2024-12-03   145  		cpu5: cpu@10100 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   146  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03   147  			compatible = "arm,cortex-a55";
7be190e4bdd2bd Jingyi Wang         2024-12-03   148  			reg = <0x0 0x10100>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   149  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03   150  			next-level-cache = <&l2_5>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   151  			power-domains = <&cpu_pd5>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   152  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06   153  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a Jingyi Wang         2024-12-06   154  			dynamic-power-coefficient = <100>;
2ed8ee66266057 Imran Shaik         2025-04-30   155  			qcom,freq-domain = <&cpufreq_hw 1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   156  
7be190e4bdd2bd Jingyi Wang         2024-12-03   157  			l2_5: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03   158  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   159  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   160  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   161  				next-level-cache = <&l3_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   162  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   163  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   164  
7be190e4bdd2bd Jingyi Wang         2024-12-03   165  		cpu6: cpu@10200 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   166  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03   167  			compatible = "arm,cortex-a55";
7be190e4bdd2bd Jingyi Wang         2024-12-03   168  			reg = <0x0 0x10200>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   169  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03   170  			next-level-cache = <&l2_6>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   171  			power-domains = <&cpu_pd6>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   172  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06   173  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a Jingyi Wang         2024-12-06   174  			dynamic-power-coefficient = <100>;
2ed8ee66266057 Imran Shaik         2025-04-30   175  			qcom,freq-domain = <&cpufreq_hw 1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   176  
7be190e4bdd2bd Jingyi Wang         2024-12-03   177  			l2_6: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03   178  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   179  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   180  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   181  				next-level-cache = <&l3_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   182  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   183  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   184  
7be190e4bdd2bd Jingyi Wang         2024-12-03   185  		cpu7: cpu@10300 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   186  			device_type = "cpu";
7be190e4bdd2bd Jingyi Wang         2024-12-03   187  			compatible = "arm,cortex-a55";
7be190e4bdd2bd Jingyi Wang         2024-12-03   188  			reg = <0x0 0x10300>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   189  			enable-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03   190  			next-level-cache = <&l2_7>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   191  			power-domains = <&cpu_pd7>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   192  			power-domain-names = "psci";
ce4b3c48e4725a Jingyi Wang         2024-12-06   193  			capacity-dmips-mhz = <1024>;
ce4b3c48e4725a Jingyi Wang         2024-12-06   194  			dynamic-power-coefficient = <100>;
2ed8ee66266057 Imran Shaik         2025-04-30   195  			qcom,freq-domain = <&cpufreq_hw 1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   196  
7be190e4bdd2bd Jingyi Wang         2024-12-03   197  			l2_7: l2-cache {
7be190e4bdd2bd Jingyi Wang         2024-12-03   198  				compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   199  				cache-level = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   200  				cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   201  				next-level-cache = <&l3_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   202  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   203  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   204  
7be190e4bdd2bd Jingyi Wang         2024-12-03   205  		cpu-map {
7be190e4bdd2bd Jingyi Wang         2024-12-03   206  			cluster0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   207  				core0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   208  					cpu = <&cpu0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   209  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   210  
7be190e4bdd2bd Jingyi Wang         2024-12-03   211  				core1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   212  					cpu = <&cpu1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   213  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   214  
7be190e4bdd2bd Jingyi Wang         2024-12-03   215  				core2 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   216  					cpu = <&cpu2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   217  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   218  
7be190e4bdd2bd Jingyi Wang         2024-12-03   219  				core3 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   220  					cpu = <&cpu3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   221  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   222  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   223  
7be190e4bdd2bd Jingyi Wang         2024-12-03   224  			cluster1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   225  				core0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   226  					cpu = <&cpu4>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   227  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   228  
7be190e4bdd2bd Jingyi Wang         2024-12-03   229  				core1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   230  					cpu = <&cpu5>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   231  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   232  
7be190e4bdd2bd Jingyi Wang         2024-12-03   233  				core2 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   234  					cpu = <&cpu6>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   235  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   236  
7be190e4bdd2bd Jingyi Wang         2024-12-03   237  				core3 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   238  					cpu = <&cpu7>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   239  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03   240  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   241  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   242  
7be190e4bdd2bd Jingyi Wang         2024-12-03   243  		l3_0: l3-cache-0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   244  			compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   245  			cache-level = <3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   246  			cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   247  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   248  
7be190e4bdd2bd Jingyi Wang         2024-12-03   249  		l3_1: l3-cache-1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   250  			compatible = "cache";
7be190e4bdd2bd Jingyi Wang         2024-12-03   251  			cache-level = <3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   252  			cache-unified;
7be190e4bdd2bd Jingyi Wang         2024-12-03   253  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   254  
7be190e4bdd2bd Jingyi Wang         2024-12-03   255  		idle-states {
7be190e4bdd2bd Jingyi Wang         2024-12-03   256  			entry-method = "psci";
7be190e4bdd2bd Jingyi Wang         2024-12-03   257  
7be190e4bdd2bd Jingyi Wang         2024-12-03   258  			little_cpu_sleep_0: cpu-sleep-0-0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   259  				compatible = "arm,idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   260  				idle-state-name = "silver-power-collapse";
7be190e4bdd2bd Jingyi Wang         2024-12-03   261  				arm,psci-suspend-param = <0x40000003>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   262  				entry-latency-us = <449>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   263  				exit-latency-us = <801>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   264  				min-residency-us = <1574>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   265  				local-timer-stop;
7be190e4bdd2bd Jingyi Wang         2024-12-03   266  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   267  
7be190e4bdd2bd Jingyi Wang         2024-12-03   268  			little_cpu_sleep_1: cpu-sleep-0-1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   269  				compatible = "arm,idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   270  				idle-state-name = "silver-rail-power-collapse";
7be190e4bdd2bd Jingyi Wang         2024-12-03   271  				arm,psci-suspend-param = <0x40000004>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   272  				entry-latency-us = <602>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   273  				exit-latency-us = <961>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   274  				min-residency-us = <4288>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   275  				local-timer-stop;
7be190e4bdd2bd Jingyi Wang         2024-12-03   276  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   277  
7be190e4bdd2bd Jingyi Wang         2024-12-03   278  			big_cpu_sleep_0: cpu-sleep-1-0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   279  				compatible = "arm,idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   280  				idle-state-name = "gold-power-collapse";
7be190e4bdd2bd Jingyi Wang         2024-12-03   281  				arm,psci-suspend-param = <0x40000003>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   282  				entry-latency-us = <549>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   283  				exit-latency-us = <901>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   284  				min-residency-us = <1774>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   285  				local-timer-stop;
7be190e4bdd2bd Jingyi Wang         2024-12-03   286  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   287  
7be190e4bdd2bd Jingyi Wang         2024-12-03   288  			big_cpu_sleep_1: cpu-sleep-1-1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   289  				compatible = "arm,idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   290  				idle-state-name = "gold-rail-power-collapse";
7be190e4bdd2bd Jingyi Wang         2024-12-03   291  				arm,psci-suspend-param = <0x40000004>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   292  				entry-latency-us = <702>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   293  				exit-latency-us = <1061>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   294  				min-residency-us = <4488>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   295  				local-timer-stop;
7be190e4bdd2bd Jingyi Wang         2024-12-03   296  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   297  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   298  
7be190e4bdd2bd Jingyi Wang         2024-12-03   299  		domain-idle-states {
7be190e4bdd2bd Jingyi Wang         2024-12-03   300  			silver_cluster_sleep: cluster-sleep-0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   301  				compatible = "domain-idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   302  				arm,psci-suspend-param = <0x41000044>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   303  				entry-latency-us = <2552>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   304  				exit-latency-us = <2848>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   305  				min-residency-us = <5908>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   306  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   307  
7be190e4bdd2bd Jingyi Wang         2024-12-03   308  			gold_cluster_sleep: cluster-sleep-1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   309  				compatible = "domain-idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   310  				arm,psci-suspend-param = <0x41000044>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   311  				entry-latency-us = <2752>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   312  				exit-latency-us = <3048>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   313  				min-residency-us = <6118>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   314  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   315  
7be190e4bdd2bd Jingyi Wang         2024-12-03   316  			system_sleep: domain-sleep {
7be190e4bdd2bd Jingyi Wang         2024-12-03   317  				compatible = "domain-idle-state";
7be190e4bdd2bd Jingyi Wang         2024-12-03   318  				arm,psci-suspend-param = <0x42000144>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   319  				entry-latency-us = <3263>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   320  				exit-latency-us = <6562>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   321  				min-residency-us = <9987>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   322  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03   323  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   324  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   325  
0f43254763b3a1 Jie Gan             2024-12-19   326  	dummy_eud: dummy-sink {
0f43254763b3a1 Jie Gan             2024-12-19   327  		compatible = "arm,coresight-dummy-sink";
0f43254763b3a1 Jie Gan             2024-12-19   328  
0f43254763b3a1 Jie Gan             2024-12-19   329  		in-ports {
0f43254763b3a1 Jie Gan             2024-12-19   330  			port {
0f43254763b3a1 Jie Gan             2024-12-19   331  				eud_in: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19   332  					remote-endpoint = <&swao_rep_out1>;
0f43254763b3a1 Jie Gan             2024-12-19   333  				};
0f43254763b3a1 Jie Gan             2024-12-19   334  			};
0f43254763b3a1 Jie Gan             2024-12-19   335  		};
0f43254763b3a1 Jie Gan             2024-12-19   336  	};
0f43254763b3a1 Jie Gan             2024-12-19   337  
7be190e4bdd2bd Jingyi Wang         2024-12-03   338  	firmware {
7be190e4bdd2bd Jingyi Wang         2024-12-03   339  		scm: scm {
7be190e4bdd2bd Jingyi Wang         2024-12-03   340  			compatible = "qcom,scm-qcs8300", "qcom,scm";
7be190e4bdd2bd Jingyi Wang         2024-12-03   341  			qcom,dload-mode = <&tcsr 0x13000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   342  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   343  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   344  
7be190e4bdd2bd Jingyi Wang         2024-12-03   345  	memory@80000000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   346  		device_type = "memory";
7be190e4bdd2bd Jingyi Wang         2024-12-03   347  		/* We expect the bootloader to fill in the size */
7be190e4bdd2bd Jingyi Wang         2024-12-03   348  		reg = <0x0 0x80000000 0x0 0x0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   349  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   350  
7be190e4bdd2bd Jingyi Wang         2024-12-03   351  	clk_virt: interconnect-0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   352  		compatible = "qcom,qcs8300-clk-virt";
7be190e4bdd2bd Jingyi Wang         2024-12-03   353  		#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   354  		qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   355  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   356  
7be190e4bdd2bd Jingyi Wang         2024-12-03   357  	mc_virt: interconnect-1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   358  		compatible = "qcom,qcs8300-mc-virt";
7be190e4bdd2bd Jingyi Wang         2024-12-03   359  		#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   360  		qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   361  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   362  
467284a3097f43 Viken Dadhaniya     2025-02-24   363  	qup_opp_table: opp-table-qup {
467284a3097f43 Viken Dadhaniya     2025-02-24   364  		compatible = "operating-points-v2";
467284a3097f43 Viken Dadhaniya     2025-02-24   365  
467284a3097f43 Viken Dadhaniya     2025-02-24   366  		opp-120000000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   367  			opp-hz = /bits/ 64 <120000000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   368  			required-opps = <&rpmhpd_opp_svs_l1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   369  		};
467284a3097f43 Viken Dadhaniya     2025-02-24   370  	};
467284a3097f43 Viken Dadhaniya     2025-02-24   371  
09d8a3ef91f69f Jingyi Wang         2024-11-01   372  	pmu-a55 {
09d8a3ef91f69f Jingyi Wang         2024-11-01   373  		compatible = "arm,cortex-a55-pmu";
09d8a3ef91f69f Jingyi Wang         2024-11-01   374  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
09d8a3ef91f69f Jingyi Wang         2024-11-01   375  	};
09d8a3ef91f69f Jingyi Wang         2024-11-01   376  
09d8a3ef91f69f Jingyi Wang         2024-11-01   377  	pmu-a78 {
09d8a3ef91f69f Jingyi Wang         2024-11-01   378  		compatible = "arm,cortex-a78-pmu";
09d8a3ef91f69f Jingyi Wang         2024-11-01   379  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
09d8a3ef91f69f Jingyi Wang         2024-11-01   380  	};
09d8a3ef91f69f Jingyi Wang         2024-11-01   381  
7be190e4bdd2bd Jingyi Wang         2024-12-03   382  	psci {
7be190e4bdd2bd Jingyi Wang         2024-12-03   383  		compatible = "arm,psci-1.0";
7be190e4bdd2bd Jingyi Wang         2024-12-03   384  		method = "smc";
7be190e4bdd2bd Jingyi Wang         2024-12-03   385  
7be190e4bdd2bd Jingyi Wang         2024-12-03   386  		cpu_pd0: power-domain-cpu0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   387  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   388  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   389  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   390  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   391  
7be190e4bdd2bd Jingyi Wang         2024-12-03   392  		cpu_pd1: power-domain-cpu1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   393  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   394  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   395  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   396  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   397  
7be190e4bdd2bd Jingyi Wang         2024-12-03   398  		cpu_pd2: power-domain-cpu2 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   399  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   400  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   401  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   402  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   403  
7be190e4bdd2bd Jingyi Wang         2024-12-03   404  		cpu_pd3: power-domain-cpu3 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   405  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   406  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   407  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   408  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   409  
7be190e4bdd2bd Jingyi Wang         2024-12-03   410  		cpu_pd4: power-domain-cpu4 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   411  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   412  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   413  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   414  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   415  
7be190e4bdd2bd Jingyi Wang         2024-12-03   416  		cpu_pd5: power-domain-cpu5 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   417  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   418  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   419  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   420  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   421  
7be190e4bdd2bd Jingyi Wang         2024-12-03   422  		cpu_pd6: power-domain-cpu6 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   423  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   424  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   425  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   426  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   427  
7be190e4bdd2bd Jingyi Wang         2024-12-03   428  		cpu_pd7: power-domain-cpu7 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   429  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   430  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   431  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   432  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   433  
7be190e4bdd2bd Jingyi Wang         2024-12-03   434  		cluster_pd0: power-domain-cluster0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   435  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   436  			power-domains = <&system_pd>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   437  			domain-idle-states = <&gold_cluster_sleep>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   438  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   439  
7be190e4bdd2bd Jingyi Wang         2024-12-03   440  		cluster_pd1: power-domain-cluster1 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   441  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   442  			power-domains = <&system_pd>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   443  			domain-idle-states = <&silver_cluster_sleep>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   444  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   445  
7be190e4bdd2bd Jingyi Wang         2024-12-03   446  		system_pd: power-domain-system {
7be190e4bdd2bd Jingyi Wang         2024-12-03   447  			#power-domain-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   448  			domain-idle-states = <&system_sleep>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   449  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   450  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   451  
7be190e4bdd2bd Jingyi Wang         2024-12-03   452  	reserved-memory {
7be190e4bdd2bd Jingyi Wang         2024-12-03   453  		#address-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   454  		#size-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   455  		ranges;
7be190e4bdd2bd Jingyi Wang         2024-12-03   456  
7be190e4bdd2bd Jingyi Wang         2024-12-03   457  		aop_image_mem: aop-image-region@90800000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   458  			reg = <0x0 0x90800000 0x0 0x60000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   459  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   460  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   461  
7be190e4bdd2bd Jingyi Wang         2024-12-03   462  		aop_cmd_db_mem: aop-cmd-db-region@90860000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   463  			compatible = "qcom,cmd-db";
7be190e4bdd2bd Jingyi Wang         2024-12-03   464  			reg = <0x0 0x90860000 0x0 0x20000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   465  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   466  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   467  
7be190e4bdd2bd Jingyi Wang         2024-12-03   468  		smem_mem: smem@90900000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   469  			compatible = "qcom,smem";
7be190e4bdd2bd Jingyi Wang         2024-12-03   470  			reg = <0x0 0x90900000 0x0 0x200000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   471  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   472  			hwlocks = <&tcsr_mutex 3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   473  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   474  
7be190e4bdd2bd Jingyi Wang         2024-12-03   475  		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   476  			reg = <0x0 0x93b00000 0x0 0xf00000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   477  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   478  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   479  
7be190e4bdd2bd Jingyi Wang         2024-12-03   480  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap-region@94a00000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   481  			reg = <0x0 0x94a00000 0x0 0x800000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   482  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   483  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   484  
7be190e4bdd2bd Jingyi Wang         2024-12-03   485  		camera_mem: camera-region@95200000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   486  			reg = <0x0 0x95200000 0x0 0x500000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   487  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   488  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   489  
7be190e4bdd2bd Jingyi Wang         2024-12-03   490  		adsp_mem: adsp-region@95c00000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   491  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   492  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   493  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   494  
7be190e4bdd2bd Jingyi Wang         2024-12-03   495  		q6_adsp_dtb_mem: q6-adsp-dtb-region@97a00000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   496  			reg = <0x0 0x97a00000 0x0 0x80000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   497  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   498  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   499  
7be190e4bdd2bd Jingyi Wang         2024-12-03   500  		q6_gpdsp_dtb_mem: q6-gpdsp-dtb-region@97a80000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   501  			reg = <0x0 0x97a80000 0x0 0x80000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   502  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   503  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   504  
7be190e4bdd2bd Jingyi Wang         2024-12-03   505  		gpdsp_mem: gpdsp-region@97b00000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   506  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   507  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   508  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   509  
7be190e4bdd2bd Jingyi Wang         2024-12-03   510  		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@99900000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   511  			reg = <0x0 0x99900000 0x0 0x80000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   512  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   513  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   514  
7be190e4bdd2bd Jingyi Wang         2024-12-03   515  		cdsp_mem: cdsp-region@99980000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   516  			reg = <0x0 0x99980000 0x0 0x1e00000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   517  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   518  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   519  
7be190e4bdd2bd Jingyi Wang         2024-12-03   520  		gpu_microcode_mem: gpu-microcode-region@9b780000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   521  			reg = <0x0 0x9b780000 0x0 0x2000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   522  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   523  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   524  
7be190e4bdd2bd Jingyi Wang         2024-12-03   525  		cvp_mem: cvp-region@9b782000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   526  			reg = <0x0 0x9b782000 0x0 0x700000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   527  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   528  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   529  
7be190e4bdd2bd Jingyi Wang         2024-12-03   530  		video_mem: video-region@9be82000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   531  			reg = <0x0 0x9be82000 0x0 0x700000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   532  			no-map;
7be190e4bdd2bd Jingyi Wang         2024-12-03   533  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   534  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   535  
7be190e4bdd2bd Jingyi Wang         2024-12-03   536  	smp2p-adsp {
7be190e4bdd2bd Jingyi Wang         2024-12-03   537  		compatible = "qcom,smp2p";
7be190e4bdd2bd Jingyi Wang         2024-12-03   538  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd Jingyi Wang         2024-12-03   539  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd Jingyi Wang         2024-12-03   540  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   541  		mboxes = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd Jingyi Wang         2024-12-03   542  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   543  
7be190e4bdd2bd Jingyi Wang         2024-12-03   544  		qcom,smem = <443>, <429>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   545  		qcom,local-pid = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   546  		qcom,remote-pid = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   547  
7be190e4bdd2bd Jingyi Wang         2024-12-03   548  		smp2p_adsp_in: slave-kernel {
7be190e4bdd2bd Jingyi Wang         2024-12-03   549  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd Jingyi Wang         2024-12-03   550  			interrupt-controller;
7be190e4bdd2bd Jingyi Wang         2024-12-03   551  			#interrupt-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   552  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   553  
7be190e4bdd2bd Jingyi Wang         2024-12-03   554  		smp2p_adsp_out: master-kernel {
7be190e4bdd2bd Jingyi Wang         2024-12-03   555  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd Jingyi Wang         2024-12-03   556  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   557  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   558  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   559  
7be190e4bdd2bd Jingyi Wang         2024-12-03   560  	smp2p-cdsp {
7be190e4bdd2bd Jingyi Wang         2024-12-03   561  		compatible = "qcom,smp2p";
7be190e4bdd2bd Jingyi Wang         2024-12-03   562  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
7be190e4bdd2bd Jingyi Wang         2024-12-03   563  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd Jingyi Wang         2024-12-03   564  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   565  		mboxes = <&ipcc IPCC_CLIENT_CDSP
7be190e4bdd2bd Jingyi Wang         2024-12-03   566  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   567  
7be190e4bdd2bd Jingyi Wang         2024-12-03   568  		qcom,smem = <94>, <432>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   569  		qcom,local-pid = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   570  		qcom,remote-pid = <5>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   571  
7be190e4bdd2bd Jingyi Wang         2024-12-03   572  		smp2p_cdsp_in: slave-kernel {
7be190e4bdd2bd Jingyi Wang         2024-12-03   573  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd Jingyi Wang         2024-12-03   574  			interrupt-controller;
7be190e4bdd2bd Jingyi Wang         2024-12-03   575  			#interrupt-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   576  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   577  
7be190e4bdd2bd Jingyi Wang         2024-12-03   578  		smp2p_cdsp_out: master-kernel {
7be190e4bdd2bd Jingyi Wang         2024-12-03   579  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd Jingyi Wang         2024-12-03   580  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   581  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   582  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   583  
7be190e4bdd2bd Jingyi Wang         2024-12-03   584  	smp2p-gpdsp {
7be190e4bdd2bd Jingyi Wang         2024-12-03   585  		compatible = "qcom,smp2p";
7be190e4bdd2bd Jingyi Wang         2024-12-03   586  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
7be190e4bdd2bd Jingyi Wang         2024-12-03   587  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd Jingyi Wang         2024-12-03   588  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   589  		mboxes = <&ipcc IPCC_CLIENT_GPDSP0
7be190e4bdd2bd Jingyi Wang         2024-12-03   590  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   591  
7be190e4bdd2bd Jingyi Wang         2024-12-03   592  		qcom,smem = <617>, <616>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   593  		qcom,local-pid = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   594  		qcom,remote-pid = <17>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   595  
7be190e4bdd2bd Jingyi Wang         2024-12-03   596  		smp2p_gpdsp_in: slave-kernel {
7be190e4bdd2bd Jingyi Wang         2024-12-03   597  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd Jingyi Wang         2024-12-03   598  			interrupt-controller;
7be190e4bdd2bd Jingyi Wang         2024-12-03   599  			#interrupt-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   600  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   601  
7be190e4bdd2bd Jingyi Wang         2024-12-03   602  		smp2p_gpdsp_out: master-kernel {
7be190e4bdd2bd Jingyi Wang         2024-12-03   603  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd Jingyi Wang         2024-12-03   604  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   605  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   606  	};
7be190e4bdd2bd Jingyi Wang         2024-12-03   607  
7be190e4bdd2bd Jingyi Wang         2024-12-03   608  	soc: soc@0 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   609  		compatible = "simple-bus";
7be190e4bdd2bd Jingyi Wang         2024-12-03   610  		ranges = <0 0 0 0 0x10 0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   611  		#address-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   612  		#size-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   613  
7be190e4bdd2bd Jingyi Wang         2024-12-03   614  		gcc: clock-controller@100000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   615  			compatible = "qcom,qcs8300-gcc";
7be190e4bdd2bd Jingyi Wang         2024-12-03   616  			reg = <0x0 0x00100000 0x0 0xc7018>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   617  			#clock-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   618  			#reset-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   619  			#power-domain-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   620  			clocks = <&rpmhcc RPMH_CXO_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   621  				 <&sleep_clk>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   622  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   623  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   624  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   625  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   626  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   627  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   628  				 <0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   629  				 <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   630  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   631  
7be190e4bdd2bd Jingyi Wang         2024-12-03   632  		ipcc: mailbox@408000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   633  			compatible = "qcom,qcs8300-ipcc", "qcom,ipcc";
7be190e4bdd2bd Jingyi Wang         2024-12-03   634  			reg = <0x0 0x408000 0x0 0x1000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   635  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   636  			interrupt-controller;
7be190e4bdd2bd Jingyi Wang         2024-12-03   637  			#interrupt-cells = <3>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   638  			#mbox-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   639  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   640  
7be190e4bdd2bd Jingyi Wang         2024-12-03   641  		qfprom: efuse@784000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   642  			compatible = "qcom,qcs8300-qfprom", "qcom,qfprom";
7be190e4bdd2bd Jingyi Wang         2024-12-03   643  			reg = <0x0 0x00784000 0x0 0x1200>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   644  			#address-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   645  			#size-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   646  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03   647  
467284a3097f43 Viken Dadhaniya     2025-02-24   648  		gpi_dma0: dma-controller@900000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   649  			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
467284a3097f43 Viken Dadhaniya     2025-02-24   650  			reg = <0x0 0x900000 0x0 0x60000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   651  			#dma-cells = <3>;
467284a3097f43 Viken Dadhaniya     2025-02-24   652  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   653  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   654  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   655  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   656  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   657  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   658  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   659  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   660  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   661  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   662  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24   663  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   664  			iommus = <&apps_smmu 0x416 0x0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   665  			dma-channels = <12>;
467284a3097f43 Viken Dadhaniya     2025-02-24   666  			dma-channel-mask = <0xfff>;
467284a3097f43 Viken Dadhaniya     2025-02-24   667  			dma-coherent;
467284a3097f43 Viken Dadhaniya     2025-02-24   668  			status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   669  		};
467284a3097f43 Viken Dadhaniya     2025-02-24   670  
7be190e4bdd2bd Jingyi Wang         2024-12-03   671  		qupv3_id_0: geniqup@9c0000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03   672  			compatible = "qcom,geni-se-qup";
7be190e4bdd2bd Jingyi Wang         2024-12-03   673  			reg = <0x0 0x9c0000 0x0 0x2000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   674  			ranges;
7be190e4bdd2bd Jingyi Wang         2024-12-03   675  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03   676  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   677  			clock-names = "m-ahb",
7be190e4bdd2bd Jingyi Wang         2024-12-03   678  				      "s-ahb";
7be190e4bdd2bd Jingyi Wang         2024-12-03   679  			#address-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03   680  			#size-cells = <2>;
467284a3097f43 Viken Dadhaniya     2025-02-24   681  			iommus = <&apps_smmu 0x403 0x0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   682  			dma-coherent;
7be190e4bdd2bd Jingyi Wang         2024-12-03   683  			status = "disabled";
7be190e4bdd2bd Jingyi Wang         2024-12-03   684  
467284a3097f43 Viken Dadhaniya     2025-02-24   685  			i2c0: i2c@980000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   686  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24   687  				reg = <0x0 0x980000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   688  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   689  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   690  				pinctrl-0 = <&qup_i2c0_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24   691  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   692  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   693  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   694  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   695  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   696  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   697  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   698  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   699  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   700  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   701  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   702  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24   703  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24   704  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   705  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   706  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24   707  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24   708  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   709  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   710  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   711  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   712  
467284a3097f43 Viken Dadhaniya     2025-02-24   713  			spi0: spi@980000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   714  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24   715  				reg = <0x0 0x980000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   716  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   717  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   718  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   719  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   720  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   721  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   722  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   723  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   724  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   725  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   726  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   727  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   728  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   729  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   730  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   731  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24   732  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24   733  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   734  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   735  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   736  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   737  
467284a3097f43 Viken Dadhaniya     2025-02-24   738  			uart0: serial@980000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   739  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24   740  				reg = <0x0 0x980000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   741  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   742  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   743  				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24   744  					    <&qup_uart0_tx>, <&qup_uart0_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24   745  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   746  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   747  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   748  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   749  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   750  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   751  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   752  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   753  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   754  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   755  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   756  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   757  
467284a3097f43 Viken Dadhaniya     2025-02-24   758  			i2c1: i2c@984000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   759  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24   760  				reg = <0x0 0x984000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   761  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   762  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   763  				pinctrl-0 = <&qup_i2c1_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24   764  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   765  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   766  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   767  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   768  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   769  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   770  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   771  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   772  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   773  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   774  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   775  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24   776  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24   777  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   778  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   779  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24   780  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24   781  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   782  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   783  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   784  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   785  
467284a3097f43 Viken Dadhaniya     2025-02-24   786  			spi1: spi@984000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   787  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24   788  				reg = <0x0 0x984000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   789  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   790  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   791  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   792  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   793  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   794  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   795  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   796  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   797  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   798  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   799  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   800  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   801  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   802  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   803  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   804  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24   805  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24   806  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   807  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   808  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   809  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   810  
467284a3097f43 Viken Dadhaniya     2025-02-24   811  			uart1: serial@984000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   812  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24   813  				reg = <0x0 0x984000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   814  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   815  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   816  				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24   817  					    <&qup_uart1_tx>, <&qup_uart1_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24   818  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   819  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   820  				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   821  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   822  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   823  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   824  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   825  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   826  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   827  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   828  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   829  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   830  
467284a3097f43 Viken Dadhaniya     2025-02-24   831  			i2c2: i2c@988000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   832  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24   833  				reg = <0x0 0x988000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   834  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   835  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   836  				pinctrl-0 = <&qup_i2c2_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24   837  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   838  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   839  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   840  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   841  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   842  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   843  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   844  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   845  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   846  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   847  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   848  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24   849  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24   850  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   851  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   852  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24   853  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24   854  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   855  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   856  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   857  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   858  
467284a3097f43 Viken Dadhaniya     2025-02-24   859  			spi2: spi@988000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   860  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24   861  				reg = <0x0 0x988000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   862  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   863  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   864  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   865  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   866  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   867  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   868  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   869  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   870  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   871  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   872  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   873  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   874  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   875  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   876  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   877  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24   878  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24   879  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   880  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   881  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   882  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   883  
467284a3097f43 Viken Dadhaniya     2025-02-24   884  			uart2: serial@988000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   885  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24   886  				reg = <0x0 0x988000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   887  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   888  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   889  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24   890  					    <&qup_uart2_tx>, <&qup_uart2_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24   891  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   892  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   893  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   894  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   895  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   896  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   897  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   898  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   899  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   900  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   901  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   902  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   903  
467284a3097f43 Viken Dadhaniya     2025-02-24   904  			i2c3: i2c@98c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   905  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24   906  				reg = <0x0 0x98c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   907  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   908  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   909  				pinctrl-0 = <&qup_i2c3_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24   910  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   911  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   912  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   913  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   914  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   915  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   916  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   917  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   918  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   919  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   920  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   921  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24   922  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24   923  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   924  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   925  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24   926  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24   927  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   928  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   929  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   930  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   931  
467284a3097f43 Viken Dadhaniya     2025-02-24   932  			spi3: spi@98c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   933  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24   934  				reg = <0x0 0x98c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   935  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   936  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   937  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   938  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   939  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   940  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   941  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   942  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   943  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   944  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   945  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   946  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   947  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   948  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   949  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   950  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24   951  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24   952  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24   953  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24   954  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   955  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   956  
467284a3097f43 Viken Dadhaniya     2025-02-24   957  			uart3: serial@98c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   958  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24   959  				reg = <0x0 0x98c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   960  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   961  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   962  				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24   963  					    <&qup_uart3_tx>, <&qup_uart3_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24   964  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   965  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   966  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   967  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   968  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   969  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   970  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   971  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24   972  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   973  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24   974  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24   975  			};
467284a3097f43 Viken Dadhaniya     2025-02-24   976  
467284a3097f43 Viken Dadhaniya     2025-02-24   977  			i2c4: i2c@990000 {
467284a3097f43 Viken Dadhaniya     2025-02-24   978  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24   979  				reg = <0x0 0x990000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24   980  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24   981  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24   982  				pinctrl-0 = <&qup_i2c4_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24   983  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24   984  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24   985  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24   986  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24   987  				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   988  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   989  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   990  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24   991  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24   992  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24   993  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24   994  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24   995  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24   996  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24   997  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24   998  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24   999  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1000  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1001  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1002  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1003  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1004  
467284a3097f43 Viken Dadhaniya     2025-02-24  1005  			spi4: spi@990000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1006  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1007  				reg = <0x0 0x990000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1008  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1009  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1010  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1011  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1012  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1013  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1014  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1015  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1016  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1017  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1018  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1019  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1020  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1021  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1022  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1023  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1024  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1025  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1026  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1027  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1028  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1029  
467284a3097f43 Viken Dadhaniya     2025-02-24  1030  			uart4: serial@990000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1031  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1032  				reg = <0x0 0x990000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1033  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1034  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1035  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1036  					    <&qup_uart4_tx>, <&qup_uart4_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1037  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1038  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1039  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1040  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1041  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1042  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1043  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1044  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1045  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1046  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1047  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1048  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1049  
467284a3097f43 Viken Dadhaniya     2025-02-24  1050  			i2c5: i2c@994000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1051  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1052  				reg = <0x0 0x994000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1053  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1054  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1055  				pinctrl-0 = <&qup_i2c5_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1056  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1057  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1058  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1059  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1060  				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1061  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1062  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1063  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1064  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1065  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1066  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1067  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1068  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1069  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1070  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1071  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1072  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1073  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1074  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1075  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1076  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1077  
467284a3097f43 Viken Dadhaniya     2025-02-24  1078  			spi5: spi@994000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1079  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1080  				reg = <0x0 0x994000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1081  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1082  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1083  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1084  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1085  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1086  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1087  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1088  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1089  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1090  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1091  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1092  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1093  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1094  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1095  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1096  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1097  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1098  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1099  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1100  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1101  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1102  
467284a3097f43 Viken Dadhaniya     2025-02-24  1103  			uart5: serial@994000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1104  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1105  				reg = <0x0 0x994000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1106  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1107  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1108  				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1109  					    <&qup_uart5_tx>, <&qup_uart5_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1110  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1111  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1112  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1113  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1114  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1115  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1116  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1117  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1118  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1119  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1120  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1121  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1122  
467284a3097f43 Viken Dadhaniya     2025-02-24  1123  			i2c6: i2c@998000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1124  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1125  				reg = <0x0 0x998000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1126  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1127  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1128  				pinctrl-0 = <&qup_i2c6_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1129  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1130  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1131  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1132  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1133  				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1134  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1135  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1136  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1137  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1138  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1139  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1140  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1141  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1142  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1143  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1144  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1145  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1146  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1147  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1148  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1149  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1150  
467284a3097f43 Viken Dadhaniya     2025-02-24  1151  			spi6: spi@998000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1152  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1153  				reg = <0x0 0x998000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1154  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1155  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1156  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1157  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1158  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1159  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1160  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1161  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1162  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1163  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1164  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1165  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1166  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1167  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1168  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1169  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1170  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1171  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1172  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1173  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1174  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1175  
467284a3097f43 Viken Dadhaniya     2025-02-24  1176  			uart6: serial@998000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1177  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1178  				reg = <0x0 0x998000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1179  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1180  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1181  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1182  					    <&qup_uart6_tx>, <&qup_uart6_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1183  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1184  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1185  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1186  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1187  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1188  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1189  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1190  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1191  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1192  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1193  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1194  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1195  
467284a3097f43 Viken Dadhaniya     2025-02-24  1196  			uart7: serial@99c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1197  				compatible = "qcom,geni-debug-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1198  				reg = <0x0 0x0099c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1199  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1200  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1201  				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1202  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1203  				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1204  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1205  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1206  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1207  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1208  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1209  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1210  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1211  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1212  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1213  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1214  		};
467284a3097f43 Viken Dadhaniya     2025-02-24  1215  
467284a3097f43 Viken Dadhaniya     2025-02-24  1216  		gpi_dma1: dma-controller@a00000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1217  			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
467284a3097f43 Viken Dadhaniya     2025-02-24  1218  			reg = <0x0 0xa00000 0x0 0x60000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1219  			#dma-cells = <3>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1220  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1221  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1222  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1223  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1224  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1225  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1226  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1227  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1228  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1229  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1230  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1231  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1232  			iommus = <&apps_smmu 0x456 0x0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1233  			dma-channels = <12>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1234  			dma-channel-mask = <0xfff>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1235  			dma-coherent;
467284a3097f43 Viken Dadhaniya     2025-02-24  1236  			status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1237  		};
467284a3097f43 Viken Dadhaniya     2025-02-24  1238  
467284a3097f43 Viken Dadhaniya     2025-02-24  1239  		qupv3_id_1: geniqup@ac0000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1240  			compatible = "qcom,geni-se-qup";
467284a3097f43 Viken Dadhaniya     2025-02-24  1241  			reg = <0x0 0xac0000 0x0 0x2000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1242  			ranges;
467284a3097f43 Viken Dadhaniya     2025-02-24  1243  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1244  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1245  			clock-names = "m-ahb",
467284a3097f43 Viken Dadhaniya     2025-02-24  1246  				      "s-ahb";
467284a3097f43 Viken Dadhaniya     2025-02-24  1247  			#address-cells = <2>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1248  			#size-cells = <2>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1249  			iommus = <&apps_smmu 0x443 0x0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1250  			dma-coherent;
467284a3097f43 Viken Dadhaniya     2025-02-24  1251  			status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1252  
467284a3097f43 Viken Dadhaniya     2025-02-24  1253  			i2c8: i2c@a80000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1254  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1255  				reg = <0x0 0xa80000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1256  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1257  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1258  				pinctrl-0 = <&qup_i2c8_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1259  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1260  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1261  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1262  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1263  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1264  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1265  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1266  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1267  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1268  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1269  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1270  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1271  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1272  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1273  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1274  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1275  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1276  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1277  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1278  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1279  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1280  
467284a3097f43 Viken Dadhaniya     2025-02-24  1281  			spi8: spi@a80000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1282  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1283  				reg = <0x0 0xa80000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1284  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1285  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1286  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1287  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1288  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1289  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1290  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1291  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1292  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1293  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1294  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1295  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1296  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1297  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1298  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1299  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1300  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1301  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1302  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1303  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1304  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1305  
467284a3097f43 Viken Dadhaniya     2025-02-24  1306  			uart8: serial@a80000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1307  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1308  				reg = <0x0 0xa80000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1309  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1310  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1311  				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1312  					    <&qup_uart8_tx>, <&qup_uart8_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1313  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1314  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1315  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1316  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1317  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1318  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1319  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1320  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1321  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1322  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1323  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1324  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1325  
467284a3097f43 Viken Dadhaniya     2025-02-24  1326  			i2c9: i2c@a84000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1327  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1328  				reg = <0x0 0xa84000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1329  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1330  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1331  				pinctrl-0 = <&qup_i2c9_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1332  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1333  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1334  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1335  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1336  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1337  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1338  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1339  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1340  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1341  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1342  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1343  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1344  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1345  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1346  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1347  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1348  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1349  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1350  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1351  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1352  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1353  
467284a3097f43 Viken Dadhaniya     2025-02-24  1354  			spi9: spi@a84000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1355  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1356  				reg = <0x0 0xa84000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1357  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1358  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1359  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1360  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1361  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1362  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1363  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1364  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1365  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1366  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1367  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1368  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1369  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1370  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1371  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1372  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1373  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1374  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1375  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1376  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1377  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1378  
467284a3097f43 Viken Dadhaniya     2025-02-24  1379  			uart9: serial@a84000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1380  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1381  				reg = <0x0 0xa84000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1382  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1383  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1384  				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1385  					    <&qup_uart9_tx>, <&qup_uart9_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1386  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1387  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1388  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1389  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1390  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1391  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1392  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1393  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1394  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1395  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1396  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1397  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1398  
467284a3097f43 Viken Dadhaniya     2025-02-24  1399  			i2c10: i2c@a88000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1400  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1401  				reg = <0x0 0xa88000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1402  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1403  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1404  				pinctrl-0 = <&qup_i2c10_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1405  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1406  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1407  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1408  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1409  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1410  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1411  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1412  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1413  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1414  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1415  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1416  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1417  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1418  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1419  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1420  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1421  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1422  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1423  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1424  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1425  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1426  
467284a3097f43 Viken Dadhaniya     2025-02-24  1427  			spi10: spi@a88000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1428  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1429  				reg = <0x0 0xa88000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1430  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1431  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1432  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1433  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1434  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1435  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1436  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1437  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1438  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1439  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1440  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1441  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1442  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1443  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1444  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1445  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1446  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1447  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1448  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1449  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1450  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1451  
467284a3097f43 Viken Dadhaniya     2025-02-24  1452  			uart10: serial@a88000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1453  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1454  				reg = <0x0 0xa88000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1455  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1456  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1457  				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1458  					    <&qup_uart10_tx>, <&qup_uart10_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1459  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1460  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1461  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1462  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1463  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1464  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1465  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1466  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1467  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1468  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1469  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1470  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1471  
467284a3097f43 Viken Dadhaniya     2025-02-24  1472  			i2c11: i2c@a8c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1473  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1474  				reg = <0x0 0xa8c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1475  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1476  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1477  				pinctrl-0 = <&qup_i2c11_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1478  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1479  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1480  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1481  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1482  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1483  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1484  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1485  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1486  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1487  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1488  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1489  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1490  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1491  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1492  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1493  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1494  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1495  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1496  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1497  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1498  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1499  
467284a3097f43 Viken Dadhaniya     2025-02-24  1500  			uart11: serial@a8c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1501  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1502  				reg = <0x0 0xa8c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1503  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1504  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1505  				pinctrl-0 = <&qup_uart11_tx>, <&qup_uart11_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1506  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1507  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1508  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1509  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1510  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1511  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1512  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1513  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1514  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1515  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1516  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1517  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1518  
467284a3097f43 Viken Dadhaniya     2025-02-24  1519  			i2c12: i2c@a90000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1520  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1521  				reg = <0x0 0xa90000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1522  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1523  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1524  				pinctrl-0 = <&qup_i2c12_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1525  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1526  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1527  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1528  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1529  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1530  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1531  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1532  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1533  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1534  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1535  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1536  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1537  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1538  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1539  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1540  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1541  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1542  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1543  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1544  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1545  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1546  
467284a3097f43 Viken Dadhaniya     2025-02-24  1547  			spi12: spi@a90000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1548  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1549  				reg = <0x0 0xa90000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1550  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1551  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1552  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1553  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1554  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1555  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1556  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1557  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1558  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1559  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1560  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1561  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1562  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1563  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1564  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1565  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1566  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1567  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1568  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1569  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1570  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1571  
467284a3097f43 Viken Dadhaniya     2025-02-24  1572  			uart12: serial@a90000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1573  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1574  				reg = <0x0 0xa90000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1575  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1576  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1577  				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1578  					    <&qup_uart12_tx>, <&qup_uart12_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1579  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1580  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1581  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1582  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1583  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1584  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1585  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1586  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1587  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1588  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1589  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1590  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1591  
467284a3097f43 Viken Dadhaniya     2025-02-24  1592  			i2c13: i2c@a94000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1593  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1594  				reg = <0x0 0xa94000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1595  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1596  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1597  				pinctrl-0 = <&qup_i2c13_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1598  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1599  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1600  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1601  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1602  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1603  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1604  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1605  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1606  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1607  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1608  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1609  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1610  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1611  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1612  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1613  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1614  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1615  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1616  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1617  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1618  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1619  
467284a3097f43 Viken Dadhaniya     2025-02-24  1620  			spi13: spi@a94000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1621  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1622  				reg = <0x0 0xa94000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1623  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1624  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1625  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1626  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1627  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1628  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1629  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1630  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1631  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1632  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1633  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1634  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1635  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1636  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1637  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1638  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1639  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1640  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1641  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1642  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1643  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1644  
467284a3097f43 Viken Dadhaniya     2025-02-24  1645  			uart13: serial@a94000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1646  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1647  				reg = <0x0 0xa94000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1648  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1649  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1650  				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1651  					    <&qup_uart13_tx>, <&qup_uart13_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1652  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1653  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1654  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1655  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1656  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1657  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1658  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1659  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1660  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1661  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1662  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1663  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1664  
467284a3097f43 Viken Dadhaniya     2025-02-24  1665  			i2c14: i2c@a98000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1666  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1667  				reg = <0x0 0xa98000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1668  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1669  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1670  				pinctrl-0 = <&qup_i2c14_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1671  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1672  				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1673  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1674  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1675  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1676  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1677  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1678  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1679  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1680  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1681  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1682  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1683  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1684  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1685  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1686  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1687  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1688  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1689  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1690  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1691  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1692  
467284a3097f43 Viken Dadhaniya     2025-02-24  1693  			spi14: spi@a98000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1694  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1695  				reg = <0x0 0xa98000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1696  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1697  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1698  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1699  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1700  				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1701  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1702  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1703  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1704  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1705  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1706  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1707  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1708  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1709  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1710  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1711  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1712  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1713  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1714  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1715  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1716  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1717  
467284a3097f43 Viken Dadhaniya     2025-02-24  1718  			uart14: serial@a98000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1719  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1720  				reg = <0x0 0xa98000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1721  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1722  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1723  				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1724  					    <&qup_uart14_tx>, <&qup_uart14_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1725  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1726  				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1727  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1728  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1729  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1730  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1731  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1732  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1733  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1734  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1735  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1736  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1737  
467284a3097f43 Viken Dadhaniya     2025-02-24  1738  			i2c15: i2c@a9c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1739  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1740  				reg = <0x0 0xa9c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1741  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1742  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1743  				pinctrl-0 = <&qup_i2c15_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1744  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1745  				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1746  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1747  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1748  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1749  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1750  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1751  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1752  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1753  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1754  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1755  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1756  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1757  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1758  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1759  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1760  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1761  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1762  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1763  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1764  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1765  
467284a3097f43 Viken Dadhaniya     2025-02-24  1766  			spi15: spi@a9c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1767  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1768  				reg = <0x0 0xa9c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1769  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1770  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1771  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1772  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1773  				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1774  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1775  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1776  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1777  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1778  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1779  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1780  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1781  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1782  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1783  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1784  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1785  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1786  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1787  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1788  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1789  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1790  
467284a3097f43 Viken Dadhaniya     2025-02-24  1791  			uart15: serial@a9c000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1792  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1793  				reg = <0x0 0xa9c000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1794  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1795  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1796  				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1797  					    <&qup_uart15_tx>, <&qup_uart15_rx>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1798  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1799  				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1800  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1801  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1802  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1803  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1804  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1805  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1806  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1807  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1808  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1809  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1810  		};
467284a3097f43 Viken Dadhaniya     2025-02-24  1811  
467284a3097f43 Viken Dadhaniya     2025-02-24  1812  		gpi_dma3: dma-controller@b00000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1813  			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
467284a3097f43 Viken Dadhaniya     2025-02-24  1814  			reg = <0x0 0xb00000 0x0 0x60000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1815  			#dma-cells = <3>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1816  			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1817  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1818  				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1819  				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1820  			iommus = <&apps_smmu 0x56 0x0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1821  			dma-channels = <4>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1822  			dma-channel-mask = <0xf>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1823  			dma-coherent;
467284a3097f43 Viken Dadhaniya     2025-02-24  1824  			status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1825  		};
467284a3097f43 Viken Dadhaniya     2025-02-24  1826  
467284a3097f43 Viken Dadhaniya     2025-02-24  1827  		qupv3_id_3: geniqup@bc0000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1828  			compatible = "qcom,geni-se-qup";
467284a3097f43 Viken Dadhaniya     2025-02-24  1829  			reg = <0x0 0xbc0000 0x0 0x2000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1830  			ranges;
467284a3097f43 Viken Dadhaniya     2025-02-24  1831  			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1832  				 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1833  			clock-names = "m-ahb",
467284a3097f43 Viken Dadhaniya     2025-02-24  1834  				      "s-ahb";
467284a3097f43 Viken Dadhaniya     2025-02-24  1835  			#address-cells = <2>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1836  			#size-cells = <2>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1837  			iommus = <&apps_smmu 0x43 0x0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1838  			dma-coherent;
467284a3097f43 Viken Dadhaniya     2025-02-24  1839  			status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1840  
467284a3097f43 Viken Dadhaniya     2025-02-24  1841  			i2c16: i2c@b80000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1842  				compatible = "qcom,geni-i2c";
467284a3097f43 Viken Dadhaniya     2025-02-24  1843  				reg = <0x0 0xb80000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1844  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1845  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1846  				pinctrl-0 = <&qup_i2c16_data_clk>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1847  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1848  				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1849  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1850  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1851  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1852  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1853  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1854  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1855  						<&aggre2_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1856  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1857  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1858  						     "qup-config",
467284a3097f43 Viken Dadhaniya     2025-02-24  1859  						     "qup-memory";
467284a3097f43 Viken Dadhaniya     2025-02-24  1860  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1861  				required-opps = <&rpmhpd_opp_low_svs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1862  				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1863  				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1864  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1865  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1866  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1867  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1868  
467284a3097f43 Viken Dadhaniya     2025-02-24  1869  			spi16: spi@b80000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1870  				compatible = "qcom,geni-spi";
467284a3097f43 Viken Dadhaniya     2025-02-24  1871  				reg = <0x0 0xb80000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1872  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1873  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1874  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1875  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1876  				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1877  				#address-cells = <1>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1878  				#size-cells = <0>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1879  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1880  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1881  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1882  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1883  				interconnect-names = "qup-core",
467284a3097f43 Viken Dadhaniya     2025-02-24  1884  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1885  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1886  				operating-points-v2 = <&qup_opp_table>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1887  				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1888  				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1889  				dma-names = "tx",
467284a3097f43 Viken Dadhaniya     2025-02-24  1890  					    "rx";
467284a3097f43 Viken Dadhaniya     2025-02-24  1891  				status = "disabled";
467284a3097f43 Viken Dadhaniya     2025-02-24  1892  			};
467284a3097f43 Viken Dadhaniya     2025-02-24  1893  
467284a3097f43 Viken Dadhaniya     2025-02-24  1894  			uart16: serial@b80000 {
467284a3097f43 Viken Dadhaniya     2025-02-24  1895  				compatible = "qcom,geni-uart";
467284a3097f43 Viken Dadhaniya     2025-02-24  1896  				reg = <0x0 0xb80000 0x0 0x4000>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1897  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1898  				clock-names = "se";
467284a3097f43 Viken Dadhaniya     2025-02-24  1899  				pinctrl-0 = <&qup_uart16_cts>, <&qup_uart16_rts>,
467284a3097f43 Viken Dadhaniya     2025-02-24  1900  					    <&qup_uart16_tx>, <&qup_uart16_rx>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1901  				pinctrl-names = "default";
467284a3097f43 Viken Dadhaniya     2025-02-24  1902  				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1903  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1904  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1905  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
467284a3097f43 Viken Dadhaniya     2025-02-24  1906  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1907  				interconnect-names = "qup-core",
7be190e4bdd2bd Jingyi Wang         2024-12-03  1908  						     "qup-config";
467284a3097f43 Viken Dadhaniya     2025-02-24  1909  				power-domains = <&rpmhpd RPMHPD_CX>;
467284a3097f43 Viken Dadhaniya     2025-02-24  1910  				operating-points-v2 = <&qup_opp_table>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1911  				status = "disabled";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1912  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1913  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1914  
f1b359bdf0a51c Yuvaraj Ranganathan 2024-11-25  1915  		rng: rng@10d2000 {
f1b359bdf0a51c Yuvaraj Ranganathan 2024-11-25  1916  			compatible = "qcom,qcs8300-trng", "qcom,trng";
f1b359bdf0a51c Yuvaraj Ranganathan 2024-11-25  1917  			reg = <0x0 0x010d2000 0x0 0x1000>;
f1b359bdf0a51c Yuvaraj Ranganathan 2024-11-25  1918  		};
f1b359bdf0a51c Yuvaraj Ranganathan 2024-11-25  1919  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1920  		config_noc: interconnect@14c0000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1921  			compatible = "qcom,qcs8300-config-noc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1922  			reg = <0x0 0x014c0000 0x0 0x13080>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1923  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1924  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1925  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1926  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1927  		system_noc: interconnect@1680000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1928  			compatible = "qcom,qcs8300-system-noc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1929  			reg = <0x0 0x01680000 0x0 0x15080>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1930  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1931  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1932  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1933  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1934  		aggre1_noc: interconnect@16c0000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1935  			compatible = "qcom,qcs8300-aggre1-noc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1936  			reg = <0x0 0x016c0000 0x0 0x17080>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1937  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1938  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1939  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1940  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1941  		aggre2_noc: interconnect@1700000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1942  			compatible = "qcom,qcs8300-aggre2-noc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1943  			reg = <0x0 0x01700000 0x0 0x1a080>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1944  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1945  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1946  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1947  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1948  		pcie_anoc: interconnect@1760000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1949  			compatible = "qcom,qcs8300-pcie-anoc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1950  			reg = <0x0 0x01760000 0x0 0xc080>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1951  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1952  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1953  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1954  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1955  		gpdsp_anoc: interconnect@1780000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1956  			compatible = "qcom,qcs8300-gpdsp-anoc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1957  			reg = <0x0 0x01780000 0x0 0xd080>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1958  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1959  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1960  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1961  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1962  		mmss_noc: interconnect@17a0000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1963  			compatible = "qcom,qcs8300-mmss-noc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1964  			reg = <0x0 0x017a0000 0x0 0x40000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1965  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1966  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1967  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  1968  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1969  		ufs_mem_hc: ufs@1d84000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  1970  			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1971  			reg = <0x0 0x01d84000 0x0 0x3000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1972  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1973  			phys = <&ufs_mem_phy>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1974  			phy-names = "ufsphy";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1975  			lanes-per-direction = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1976  			#reset-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1977  			resets = <&gcc GCC_UFS_PHY_BCR>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1978  			reset-names = "rst";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1979  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1980  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1981  			required-opps = <&rpmhpd_opp_nom>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1982  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1983  			iommus = <&apps_smmu 0x100 0x0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1984  			dma-coherent;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1985  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1986  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
7be190e4bdd2bd Jingyi Wang         2024-12-03  1987  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1988  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
7be190e4bdd2bd Jingyi Wang         2024-12-03  1989  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  1990  			interconnect-names = "ufs-ddr",
7be190e4bdd2bd Jingyi Wang         2024-12-03  1991  					     "cpu-ufs";
7be190e4bdd2bd Jingyi Wang         2024-12-03  1992  
7be190e4bdd2bd Jingyi Wang         2024-12-03  1993  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1994  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1995  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1996  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1997  				 <&rpmhcc RPMH_CXO_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1998  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  1999  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2000  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2001  			clock-names = "core_clk",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2002  				      "bus_aggr_clk",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2003  				      "iface_clk",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2004  				      "core_clk_unipro",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2005  				      "ref_clk",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2006  				      "tx_lane0_sync_clk",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2007  				      "rx_lane0_sync_clk",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2008  				      "rx_lane1_sync_clk";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2009  			freq-table-hz = <75000000 300000000>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2010  					<0 0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2011  					<0 0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2012  					<75000000 300000000>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2013  					<0 0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2014  					<0 0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2015  					<0 0>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2016  					<0 0>;
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2017  			qcom,ice = <&ice>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2018  			status = "disabled";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2019  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2020  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2021  		ufs_mem_phy: phy@1d87000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  2022  			compatible = "qcom,qcs8300-qmp-ufs-phy", "qcom,sa8775p-qmp-ufs-phy";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2023  			reg = <0x0 0x01d87000 0x0 0xe10>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2024  			/*
7be190e4bdd2bd Jingyi Wang         2024-12-03  2025  			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
7be190e4bdd2bd Jingyi Wang         2024-12-03  2026  			 * enables the CXO clock to eDP *and* UFS PHY.
7be190e4bdd2bd Jingyi Wang         2024-12-03  2027  			 */
7be190e4bdd2bd Jingyi Wang         2024-12-03  2028  			clocks = <&rpmhcc RPMH_CXO_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2029  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2030  				 <&gcc GCC_EDP_REF_CLKREF_EN>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2031  			clock-names = "ref",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2032  				      "ref_aux",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2033  				      "qref";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2034  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2035  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2036  			resets = <&ufs_mem_hc 0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2037  			reset-names = "ufsphy";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2038  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2039  			#phy-cells = <0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2040  			status = "disabled";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2041  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2042  
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2043  		cryptobam: dma-controller@1dc4000 {
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2044  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2045  			reg = <0x0 0x01dc4000 0x0 0x28000>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2046  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2047  			#dma-cells = <1>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2048  			qcom,ee = <0>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2049  			qcom,controlled-remotely;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2050  			num-channels = <20>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2051  			qcom,num-ees = <4>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2052  			iommus = <&apps_smmu 0x480 0x00>,
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2053  				 <&apps_smmu 0x481 0x00>;
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2054  		};
a86d844099474a Yuvaraj Ranganathan 2024-12-23  2055  
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2056  		ice: crypto@1d88000 {
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2057  			compatible = "qcom,qcs8300-inline-crypto-engine",
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2058  				     "qcom,inline-crypto-engine";
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2059  			reg = <0x0 0x01d88000 0x0 0x18000>;
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2060  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2061  		};
cc9d29aad876d8 Yuvaraj Ranganathan 2024-11-25  2062  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2063  		tcsr_mutex: hwlock@1f40000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  2064  			compatible = "qcom,tcsr-mutex";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2065  			reg = <0x0 0x01f40000 0x0 0x20000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2066  			#hwlock-cells = <1>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2067  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2068  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2069  		tcsr: syscon@1fc0000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  2070  			compatible = "qcom,qcs8300-tcsr", "syscon";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2071  			reg = <0x0 0x1fc0000 0x0 0x30000>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2072  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2073  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2074  		remoteproc_adsp: remoteproc@3000000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  2075  			compatible = "qcom,qcs8300-adsp-pas", "qcom,sa8775p-adsp-pas";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2076  			reg = <0x0 0x3000000 0x0 0x00100>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2077  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2078  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2079  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2080  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2081  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2082  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2083  			interrupt-names = "wdog",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2084  					  "fatal",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2085  					  "ready",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2086  					  "handover",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2087  					  "stop-ack";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2088  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2089  			clocks = <&rpmhcc RPMH_CXO_CLK>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2090  			clock-names = "xo";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2091  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2092  			power-domains = <&rpmhpd RPMHPD_LCX>,
7be190e4bdd2bd Jingyi Wang         2024-12-03  2093  					<&rpmhpd RPMHPD_LMX>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2094  			power-domain-names = "lcx",
7be190e4bdd2bd Jingyi Wang         2024-12-03  2095  					     "lmx";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2096  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2097  			memory-region = <&adsp_mem>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2098  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2099  			qcom,qmp = <&aoss_qmp>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2100  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2101  			qcom,smem-states = <&smp2p_adsp_out 0>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2102  			qcom,smem-state-names = "stop";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2103  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2104  			status = "disabled";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2105  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2106  			remoteproc_adsp_glink: glink-edge {
7be190e4bdd2bd Jingyi Wang         2024-12-03  2107  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd Jingyi Wang         2024-12-03  2108  							     IPCC_MPROC_SIGNAL_GLINK_QMP
7be190e4bdd2bd Jingyi Wang         2024-12-03  2109  							     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2110  				mboxes = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd Jingyi Wang         2024-12-03  2111  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2112  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2113  				label = "lpass";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2114  				qcom,remote-pid = <2>;
ac92750c039504 Ling Xu             2024-11-19  2115  
ac92750c039504 Ling Xu             2024-11-19  2116  				fastrpc {
ac92750c039504 Ling Xu             2024-11-19  2117  					compatible = "qcom,fastrpc";
ac92750c039504 Ling Xu             2024-11-19  2118  					qcom,glink-channels = "fastrpcglink-apps-dsp";
ac92750c039504 Ling Xu             2024-11-19  2119  					label = "adsp";
ac92750c039504 Ling Xu             2024-11-19  2120  					memory-region = <&adsp_rpc_remote_heap_mem>;
ac92750c039504 Ling Xu             2024-11-19  2121  					qcom,vmids = <QCOM_SCM_VMID_LPASS
ac92750c039504 Ling Xu             2024-11-19  2122  						      QCOM_SCM_VMID_ADSP_HEAP>;
ac92750c039504 Ling Xu             2024-11-19  2123  					#address-cells = <1>;
ac92750c039504 Ling Xu             2024-11-19  2124  					#size-cells = <0>;
ac92750c039504 Ling Xu             2024-11-19  2125  
ac92750c039504 Ling Xu             2024-11-19  2126  					compute-cb@3 {
ac92750c039504 Ling Xu             2024-11-19  2127  						compatible = "qcom,fastrpc-compute-cb";
ac92750c039504 Ling Xu             2024-11-19  2128  						reg = <3>;
ac92750c039504 Ling Xu             2024-11-19  2129  						iommus = <&apps_smmu 0x2003 0x0>;
ac92750c039504 Ling Xu             2024-11-19  2130  						dma-coherent;
ac92750c039504 Ling Xu             2024-11-19  2131  					};
ac92750c039504 Ling Xu             2024-11-19  2132  
ac92750c039504 Ling Xu             2024-11-19  2133  					compute-cb@4 {
ac92750c039504 Ling Xu             2024-11-19  2134  						compatible = "qcom,fastrpc-compute-cb";
ac92750c039504 Ling Xu             2024-11-19  2135  						reg = <4>;
ac92750c039504 Ling Xu             2024-11-19  2136  						iommus = <&apps_smmu 0x2004 0x0>;
ac92750c039504 Ling Xu             2024-11-19  2137  						dma-coherent;
ac92750c039504 Ling Xu             2024-11-19  2138  					};
ac92750c039504 Ling Xu             2024-11-19  2139  
ac92750c039504 Ling Xu             2024-11-19  2140  					compute-cb@5 {
ac92750c039504 Ling Xu             2024-11-19  2141  						compatible = "qcom,fastrpc-compute-cb";
ac92750c039504 Ling Xu             2024-11-19  2142  						reg = <5>;
ac92750c039504 Ling Xu             2024-11-19  2143  						iommus = <&apps_smmu 0x2005 0x0>;
ac92750c039504 Ling Xu             2024-11-19  2144  						dma-coherent;
ac92750c039504 Ling Xu             2024-11-19  2145  					};
ac92750c039504 Ling Xu             2024-11-19  2146  				};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2147  			};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2148  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2149  
7be190e4bdd2bd Jingyi Wang         2024-12-03  2150  		lpass_ag_noc: interconnect@3c40000 {
7be190e4bdd2bd Jingyi Wang         2024-12-03  2151  			compatible = "qcom,qcs8300-lpass-ag-noc";
7be190e4bdd2bd Jingyi Wang         2024-12-03  2152  			reg = <0x0 0x03c40000 0x0 0x17200>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2153  			#interconnect-cells = <2>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2154  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd Jingyi Wang         2024-12-03  2155  		};
7be190e4bdd2bd Jingyi Wang         2024-12-03  2156  
0f43254763b3a1 Jie Gan             2024-12-19  2157  		stm@4002000 {
0f43254763b3a1 Jie Gan             2024-12-19  2158  			compatible = "arm,coresight-stm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2159  			reg = <0x0 0x04002000 0x0 0x1000>,
0f43254763b3a1 Jie Gan             2024-12-19  2160  			      <0x0 0x16280000 0x0 0x180000>;
0f43254763b3a1 Jie Gan             2024-12-19  2161  			reg-names = "stm-base",
0f43254763b3a1 Jie Gan             2024-12-19  2162  				    "stm-stimulus-base";
0f43254763b3a1 Jie Gan             2024-12-19  2163  
0f43254763b3a1 Jie Gan             2024-12-19  2164  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2165  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2166  
0f43254763b3a1 Jie Gan             2024-12-19  2167  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2168  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2169  					stm_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2170  						remote-endpoint = <&funnel0_in7>;
0f43254763b3a1 Jie Gan             2024-12-19  2171  					};
0f43254763b3a1 Jie Gan             2024-12-19  2172  				};
0f43254763b3a1 Jie Gan             2024-12-19  2173  			};
0f43254763b3a1 Jie Gan             2024-12-19  2174  		};
0f43254763b3a1 Jie Gan             2024-12-19  2175  
0f43254763b3a1 Jie Gan             2024-12-19  2176  		tpda@4004000 {
0f43254763b3a1 Jie Gan             2024-12-19  2177  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2178  			reg = <0x0 0x04004000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2179  
0f43254763b3a1 Jie Gan             2024-12-19  2180  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2181  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2182  
0f43254763b3a1 Jie Gan             2024-12-19  2183  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2184  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2185  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2186  
0f43254763b3a1 Jie Gan             2024-12-19  2187  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  2188  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2189  
0f43254763b3a1 Jie Gan             2024-12-19  2190  					qdss_tpda_in1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2191  						remote-endpoint = <&qdss_tpdm1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2192  					};
0f43254763b3a1 Jie Gan             2024-12-19  2193  				};
0f43254763b3a1 Jie Gan             2024-12-19  2194  			};
0f43254763b3a1 Jie Gan             2024-12-19  2195  
0f43254763b3a1 Jie Gan             2024-12-19  2196  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2197  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2198  					qdss_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2199  						remote-endpoint = <&funnel0_in6>;
0f43254763b3a1 Jie Gan             2024-12-19  2200  					};
0f43254763b3a1 Jie Gan             2024-12-19  2201  				};
0f43254763b3a1 Jie Gan             2024-12-19  2202  			};
0f43254763b3a1 Jie Gan             2024-12-19  2203  		};
0f43254763b3a1 Jie Gan             2024-12-19  2204  
0f43254763b3a1 Jie Gan             2024-12-19  2205  		tpdm@400f000 {
0f43254763b3a1 Jie Gan             2024-12-19  2206  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2207  			reg = <0x0 0x0400f000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2208  
0f43254763b3a1 Jie Gan             2024-12-19  2209  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2210  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2211  
0f43254763b3a1 Jie Gan             2024-12-19  2212  			qcom,cmb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2213  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2214  
0f43254763b3a1 Jie Gan             2024-12-19  2215  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2216  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2217  					qdss_tpdm1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2218  						remote-endpoint = <&qdss_tpda_in1>;
0f43254763b3a1 Jie Gan             2024-12-19  2219  					};
0f43254763b3a1 Jie Gan             2024-12-19  2220  				};
0f43254763b3a1 Jie Gan             2024-12-19  2221  			};
0f43254763b3a1 Jie Gan             2024-12-19  2222  		};
0f43254763b3a1 Jie Gan             2024-12-19  2223  
0f43254763b3a1 Jie Gan             2024-12-19  2224  		funnel@4041000 {
0f43254763b3a1 Jie Gan             2024-12-19  2225  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2226  			reg = <0x0 0x04041000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2227  
0f43254763b3a1 Jie Gan             2024-12-19  2228  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2229  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2230  
0f43254763b3a1 Jie Gan             2024-12-19  2231  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2232  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2233  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2234  
0f43254763b3a1 Jie Gan             2024-12-19  2235  				port@6 {
0f43254763b3a1 Jie Gan             2024-12-19  2236  					reg = <6>;
0f43254763b3a1 Jie Gan             2024-12-19  2237  
0f43254763b3a1 Jie Gan             2024-12-19  2238  					funnel0_in6: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2239  						remote-endpoint = <&qdss_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2240  					};
0f43254763b3a1 Jie Gan             2024-12-19  2241  				};
0f43254763b3a1 Jie Gan             2024-12-19  2242  
0f43254763b3a1 Jie Gan             2024-12-19  2243  				port@7 {
0f43254763b3a1 Jie Gan             2024-12-19  2244  					reg = <7>;
0f43254763b3a1 Jie Gan             2024-12-19  2245  
0f43254763b3a1 Jie Gan             2024-12-19  2246  					funnel0_in7: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2247  						remote-endpoint = <&stm_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2248  					};
0f43254763b3a1 Jie Gan             2024-12-19  2249  				};
0f43254763b3a1 Jie Gan             2024-12-19  2250  			};
0f43254763b3a1 Jie Gan             2024-12-19  2251  
0f43254763b3a1 Jie Gan             2024-12-19  2252  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2253  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2254  					funnel0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2255  						remote-endpoint = <&qdss_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2256  					};
0f43254763b3a1 Jie Gan             2024-12-19  2257  				};
0f43254763b3a1 Jie Gan             2024-12-19  2258  			};
0f43254763b3a1 Jie Gan             2024-12-19  2259  		};
0f43254763b3a1 Jie Gan             2024-12-19  2260  
0f43254763b3a1 Jie Gan             2024-12-19  2261  		funnel@4042000 {
0f43254763b3a1 Jie Gan             2024-12-19  2262  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2263  			reg = <0x0 0x04042000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2264  
0f43254763b3a1 Jie Gan             2024-12-19  2265  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2266  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2267  
0f43254763b3a1 Jie Gan             2024-12-19  2268  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2269  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2270  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2271  
0f43254763b3a1 Jie Gan             2024-12-19  2272  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  2273  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  2274  
0f43254763b3a1 Jie Gan             2024-12-19  2275  					funnel1_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2276  						remote-endpoint = <&apss_funnel1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2277  					};
0f43254763b3a1 Jie Gan             2024-12-19  2278  				};
0f43254763b3a1 Jie Gan             2024-12-19  2279  
0f43254763b3a1 Jie Gan             2024-12-19  2280  				port@5 {
0f43254763b3a1 Jie Gan             2024-12-19  2281  					reg = <5>;
0f43254763b3a1 Jie Gan             2024-12-19  2282  
0f43254763b3a1 Jie Gan             2024-12-19  2283  					funnel1_in5: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2284  						remote-endpoint = <&dlct0_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2285  					};
0f43254763b3a1 Jie Gan             2024-12-19  2286  				};
0f43254763b3a1 Jie Gan             2024-12-19  2287  
0f43254763b3a1 Jie Gan             2024-12-19  2288  				port@6 {
0f43254763b3a1 Jie Gan             2024-12-19  2289  					reg = <6>;
0f43254763b3a1 Jie Gan             2024-12-19  2290  
0f43254763b3a1 Jie Gan             2024-12-19  2291  					funnel1_in6: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2292  						remote-endpoint = <&dlmm_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2293  					};
0f43254763b3a1 Jie Gan             2024-12-19  2294  				};
0f43254763b3a1 Jie Gan             2024-12-19  2295  
0f43254763b3a1 Jie Gan             2024-12-19  2296  				port@7 {
0f43254763b3a1 Jie Gan             2024-12-19  2297  					reg = <7>;
0f43254763b3a1 Jie Gan             2024-12-19  2298  
0f43254763b3a1 Jie Gan             2024-12-19  2299  					funnel1_in7: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2300  						remote-endpoint = <&dlst_ch_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2301  					};
0f43254763b3a1 Jie Gan             2024-12-19  2302  				};
0f43254763b3a1 Jie Gan             2024-12-19  2303  			};
0f43254763b3a1 Jie Gan             2024-12-19  2304  
0f43254763b3a1 Jie Gan             2024-12-19  2305  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2306  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2307  					funnel1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2308  						remote-endpoint = <&qdss_funnel_in1>;
0f43254763b3a1 Jie Gan             2024-12-19  2309  					};
0f43254763b3a1 Jie Gan             2024-12-19  2310  				};
0f43254763b3a1 Jie Gan             2024-12-19  2311  			};
0f43254763b3a1 Jie Gan             2024-12-19  2312  		};
0f43254763b3a1 Jie Gan             2024-12-19  2313  
0f43254763b3a1 Jie Gan             2024-12-19  2314  		funnel@4045000 {
0f43254763b3a1 Jie Gan             2024-12-19  2315  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2316  			reg = <0x0 0x04045000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2317  
0f43254763b3a1 Jie Gan             2024-12-19  2318  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2319  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2320  
0f43254763b3a1 Jie Gan             2024-12-19  2321  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2322  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2323  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2324  
0f43254763b3a1 Jie Gan             2024-12-19  2325  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  2326  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2327  
0f43254763b3a1 Jie Gan             2024-12-19  2328  					qdss_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2329  						remote-endpoint = <&funnel0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2330  					};
0f43254763b3a1 Jie Gan             2024-12-19  2331  				};
0f43254763b3a1 Jie Gan             2024-12-19  2332  
0f43254763b3a1 Jie Gan             2024-12-19  2333  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  2334  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2335  
0f43254763b3a1 Jie Gan             2024-12-19  2336  					qdss_funnel_in1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2337  						remote-endpoint = <&funnel1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2338  					};
0f43254763b3a1 Jie Gan             2024-12-19  2339  				};
0f43254763b3a1 Jie Gan             2024-12-19  2340  			};
0f43254763b3a1 Jie Gan             2024-12-19  2341  
0f43254763b3a1 Jie Gan             2024-12-19  2342  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2343  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2344  					qdss_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2345  						remote-endpoint = <&aoss_funnel_in7>;
0f43254763b3a1 Jie Gan             2024-12-19  2346  					};
0f43254763b3a1 Jie Gan             2024-12-19  2347  				};
0f43254763b3a1 Jie Gan             2024-12-19  2348  			};
0f43254763b3a1 Jie Gan             2024-12-19  2349  		};
0f43254763b3a1 Jie Gan             2024-12-19  2350  
0f43254763b3a1 Jie Gan             2024-12-19  2351  		tpdm@4841000 {
0f43254763b3a1 Jie Gan             2024-12-19  2352  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2353  			reg = <0x0 0x04841000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2354  
0f43254763b3a1 Jie Gan             2024-12-19  2355  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2356  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2357  
0f43254763b3a1 Jie Gan             2024-12-19  2358  			qcom,cmb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2359  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2360  
0f43254763b3a1 Jie Gan             2024-12-19  2361  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2362  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2363  					prng_tpdm_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2364  						remote-endpoint = <&dlct0_tpda_in19>;
0f43254763b3a1 Jie Gan             2024-12-19  2365  					};
0f43254763b3a1 Jie Gan             2024-12-19  2366  				};
0f43254763b3a1 Jie Gan             2024-12-19  2367  			};
0f43254763b3a1 Jie Gan             2024-12-19  2368  		};
0f43254763b3a1 Jie Gan             2024-12-19  2369  
0f43254763b3a1 Jie Gan             2024-12-19  2370  		tpdm@4850000 {
0f43254763b3a1 Jie Gan             2024-12-19  2371  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2372  			reg = <0x0 0x04850000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2373  
0f43254763b3a1 Jie Gan             2024-12-19  2374  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2375  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2376  
0f43254763b3a1 Jie Gan             2024-12-19  2377  			qcom,cmb-element-bits = <64>;
0f43254763b3a1 Jie Gan             2024-12-19  2378  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2379  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2380  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2381  
0f43254763b3a1 Jie Gan             2024-12-19  2382  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2383  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2384  					pimem_tpdm_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2385  						remote-endpoint = <&dlct0_tpda_in25>;
0f43254763b3a1 Jie Gan             2024-12-19  2386  					};
0f43254763b3a1 Jie Gan             2024-12-19  2387  				};
0f43254763b3a1 Jie Gan             2024-12-19  2388  			};
0f43254763b3a1 Jie Gan             2024-12-19  2389  		};
0f43254763b3a1 Jie Gan             2024-12-19  2390  
0f43254763b3a1 Jie Gan             2024-12-19  2391  		tpdm@4860000 {
0f43254763b3a1 Jie Gan             2024-12-19  2392  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2393  			reg = <0x0 0x04860000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2394  
0f43254763b3a1 Jie Gan             2024-12-19  2395  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2396  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2397  
0f43254763b3a1 Jie Gan             2024-12-19  2398  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2399  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2400  
0f43254763b3a1 Jie Gan             2024-12-19  2401  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2402  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2403  					dlst_ch_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2404  						remote-endpoint = <&dlst_ch_tpda_in8>;
0f43254763b3a1 Jie Gan             2024-12-19  2405  					};
0f43254763b3a1 Jie Gan             2024-12-19  2406  				};
0f43254763b3a1 Jie Gan             2024-12-19  2407  			};
0f43254763b3a1 Jie Gan             2024-12-19  2408  		};
0f43254763b3a1 Jie Gan             2024-12-19  2409  
0f43254763b3a1 Jie Gan             2024-12-19  2410  		tpda@4864000 {
0f43254763b3a1 Jie Gan             2024-12-19  2411  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2412  			reg = <0x0 0x04864000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2413  
0f43254763b3a1 Jie Gan             2024-12-19  2414  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2415  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2416  
0f43254763b3a1 Jie Gan             2024-12-19  2417  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2418  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2419  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2420  
0f43254763b3a1 Jie Gan             2024-12-19  2421  				port@8 {
0f43254763b3a1 Jie Gan             2024-12-19  2422  					reg = <8>;
0f43254763b3a1 Jie Gan             2024-12-19  2423  
0f43254763b3a1 Jie Gan             2024-12-19  2424  					dlst_ch_tpda_in8: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2425  						remote-endpoint = <&dlst_ch_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2426  					};
0f43254763b3a1 Jie Gan             2024-12-19  2427  				};
0f43254763b3a1 Jie Gan             2024-12-19  2428  			};
0f43254763b3a1 Jie Gan             2024-12-19  2429  
0f43254763b3a1 Jie Gan             2024-12-19  2430  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2431  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2432  					dlst_ch_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2433  						remote-endpoint = <&dlst_ch_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2434  					};
0f43254763b3a1 Jie Gan             2024-12-19  2435  				};
0f43254763b3a1 Jie Gan             2024-12-19  2436  			};
0f43254763b3a1 Jie Gan             2024-12-19  2437  		};
0f43254763b3a1 Jie Gan             2024-12-19  2438  
0f43254763b3a1 Jie Gan             2024-12-19  2439  		funnel@4865000 {
0f43254763b3a1 Jie Gan             2024-12-19  2440  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2441  			reg = <0x0 0x04865000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2442  
0f43254763b3a1 Jie Gan             2024-12-19  2443  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2444  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2445  
0f43254763b3a1 Jie Gan             2024-12-19  2446  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2447  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2448  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2449  
0f43254763b3a1 Jie Gan             2024-12-19  2450  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  2451  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2452  
0f43254763b3a1 Jie Gan             2024-12-19  2453  					dlst_ch_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2454  						remote-endpoint = <&dlst_ch_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2455  					};
0f43254763b3a1 Jie Gan             2024-12-19  2456  				};
0f43254763b3a1 Jie Gan             2024-12-19  2457  
0f43254763b3a1 Jie Gan             2024-12-19  2458  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  2459  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  2460  
0f43254763b3a1 Jie Gan             2024-12-19  2461  					dlst_ch_funnel_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2462  						remote-endpoint = <&dlst_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2463  					};
0f43254763b3a1 Jie Gan             2024-12-19  2464  				};
0f43254763b3a1 Jie Gan             2024-12-19  2465  
0f43254763b3a1 Jie Gan             2024-12-19  2466  				port@6 {
0f43254763b3a1 Jie Gan             2024-12-19  2467  					reg = <6>;
0f43254763b3a1 Jie Gan             2024-12-19  2468  
0f43254763b3a1 Jie Gan             2024-12-19  2469  					dlst_ch_funnel_in6: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2470  						remote-endpoint = <&gdsp_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2471  					};
0f43254763b3a1 Jie Gan             2024-12-19  2472  				};
0f43254763b3a1 Jie Gan             2024-12-19  2473  			};
0f43254763b3a1 Jie Gan             2024-12-19  2474  
0f43254763b3a1 Jie Gan             2024-12-19  2475  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2476  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2477  					dlst_ch_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2478  						remote-endpoint = <&funnel1_in7>;
0f43254763b3a1 Jie Gan             2024-12-19  2479  					};
0f43254763b3a1 Jie Gan             2024-12-19  2480  				};
0f43254763b3a1 Jie Gan             2024-12-19  2481  			};
0f43254763b3a1 Jie Gan             2024-12-19  2482  		};
0f43254763b3a1 Jie Gan             2024-12-19  2483  
0f43254763b3a1 Jie Gan             2024-12-19  2484  		tpdm@4980000 {
0f43254763b3a1 Jie Gan             2024-12-19  2485  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2486  			reg = <0x0 0x04980000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2487  
0f43254763b3a1 Jie Gan             2024-12-19  2488  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2489  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2490  
0f43254763b3a1 Jie Gan             2024-12-19  2491  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2492  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2493  
0f43254763b3a1 Jie Gan             2024-12-19  2494  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2495  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2496  					turing2_tpdm_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2497  						remote-endpoint = <&turing2_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2498  					};
0f43254763b3a1 Jie Gan             2024-12-19  2499  				};
0f43254763b3a1 Jie Gan             2024-12-19  2500  			};
0f43254763b3a1 Jie Gan             2024-12-19  2501  		};
0f43254763b3a1 Jie Gan             2024-12-19  2502  
0f43254763b3a1 Jie Gan             2024-12-19  2503  		funnel@4983000 {
0f43254763b3a1 Jie Gan             2024-12-19  2504  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2505  			reg = <0x0 0x04983000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2506  
0f43254763b3a1 Jie Gan             2024-12-19  2507  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2508  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2509  
0f43254763b3a1 Jie Gan             2024-12-19  2510  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2511  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2512  					turing2_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2513  						remote-endpoint = <&turing2_tpdm_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2514  					};
0f43254763b3a1 Jie Gan             2024-12-19  2515  				};
0f43254763b3a1 Jie Gan             2024-12-19  2516  			};
0f43254763b3a1 Jie Gan             2024-12-19  2517  
0f43254763b3a1 Jie Gan             2024-12-19  2518  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2519  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2520  					turing2_funnel_out0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2521  						remote-endpoint = <&gdsp_tpda_in5>;
0f43254763b3a1 Jie Gan             2024-12-19  2522  					};
0f43254763b3a1 Jie Gan             2024-12-19  2523  				};
0f43254763b3a1 Jie Gan             2024-12-19  2524  			};
0f43254763b3a1 Jie Gan             2024-12-19  2525  		};
0f43254763b3a1 Jie Gan             2024-12-19  2526  
0f43254763b3a1 Jie Gan             2024-12-19  2527  		tpdm@4ac0000 {
0f43254763b3a1 Jie Gan             2024-12-19  2528  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2529  			reg = <0x0 0x04ac0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2530  
0f43254763b3a1 Jie Gan             2024-12-19  2531  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2532  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2533  
0f43254763b3a1 Jie Gan             2024-12-19  2534  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2535  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2536  
0f43254763b3a1 Jie Gan             2024-12-19  2537  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2538  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2539  					dlmm_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2540  						remote-endpoint = <&dlmm_tpda_in27>;
0f43254763b3a1 Jie Gan             2024-12-19  2541  					};
0f43254763b3a1 Jie Gan             2024-12-19  2542  				};
0f43254763b3a1 Jie Gan             2024-12-19  2543  			};
0f43254763b3a1 Jie Gan             2024-12-19  2544  		};
0f43254763b3a1 Jie Gan             2024-12-19  2545  
0f43254763b3a1 Jie Gan             2024-12-19  2546  		tpda@4ac4000 {
0f43254763b3a1 Jie Gan             2024-12-19  2547  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2548  			reg = <0x0 0x04ac4000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2549  
0f43254763b3a1 Jie Gan             2024-12-19  2550  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2551  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2552  
0f43254763b3a1 Jie Gan             2024-12-19  2553  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2554  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2555  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2556  
0f43254763b3a1 Jie Gan             2024-12-19  2557  				port@1b {
0f43254763b3a1 Jie Gan             2024-12-19  2558  					reg = <27>;
0f43254763b3a1 Jie Gan             2024-12-19  2559  
0f43254763b3a1 Jie Gan             2024-12-19  2560  					dlmm_tpda_in27: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2561  						remote-endpoint = <&dlmm_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2562  					};
0f43254763b3a1 Jie Gan             2024-12-19  2563  				};
0f43254763b3a1 Jie Gan             2024-12-19  2564  			};
0f43254763b3a1 Jie Gan             2024-12-19  2565  
0f43254763b3a1 Jie Gan             2024-12-19  2566  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2567  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2568  					dlmm_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2569  						remote-endpoint = <&dlmm_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2570  					};
0f43254763b3a1 Jie Gan             2024-12-19  2571  				};
0f43254763b3a1 Jie Gan             2024-12-19  2572  			};
0f43254763b3a1 Jie Gan             2024-12-19  2573  		};
0f43254763b3a1 Jie Gan             2024-12-19  2574  
0f43254763b3a1 Jie Gan             2024-12-19  2575  		funnel@4ac5000 {
0f43254763b3a1 Jie Gan             2024-12-19  2576  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2577  			reg = <0x0 0x04ac5000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2578  
0f43254763b3a1 Jie Gan             2024-12-19  2579  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2580  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2581  
0f43254763b3a1 Jie Gan             2024-12-19  2582  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2583  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2584  					dlmm_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2585  						remote-endpoint = <&dlmm_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2586  					};
0f43254763b3a1 Jie Gan             2024-12-19  2587  				};
0f43254763b3a1 Jie Gan             2024-12-19  2588  			};
0f43254763b3a1 Jie Gan             2024-12-19  2589  
0f43254763b3a1 Jie Gan             2024-12-19  2590  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2591  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2592  					dlmm_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2593  						remote-endpoint = <&funnel1_in6>;
0f43254763b3a1 Jie Gan             2024-12-19  2594  					};
0f43254763b3a1 Jie Gan             2024-12-19  2595  				};
0f43254763b3a1 Jie Gan             2024-12-19  2596  			};
0f43254763b3a1 Jie Gan             2024-12-19  2597  		};
0f43254763b3a1 Jie Gan             2024-12-19  2598  
0f43254763b3a1 Jie Gan             2024-12-19  2599  		tpdm@4ad0000 {
0f43254763b3a1 Jie Gan             2024-12-19  2600  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2601  			reg = <0x0 0x04ad0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2602  
0f43254763b3a1 Jie Gan             2024-12-19  2603  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2604  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2605  
0f43254763b3a1 Jie Gan             2024-12-19  2606  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2607  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2608  
0f43254763b3a1 Jie Gan             2024-12-19  2609  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2610  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2611  					dlct0_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2612  						remote-endpoint = <&dlct0_tpda_in26>;
0f43254763b3a1 Jie Gan             2024-12-19  2613  					};
0f43254763b3a1 Jie Gan             2024-12-19  2614  				};
0f43254763b3a1 Jie Gan             2024-12-19  2615  			};
0f43254763b3a1 Jie Gan             2024-12-19  2616  		};
0f43254763b3a1 Jie Gan             2024-12-19  2617  
0f43254763b3a1 Jie Gan             2024-12-19  2618  		tpda@4ad3000 {
0f43254763b3a1 Jie Gan             2024-12-19  2619  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2620  			reg = <0x0 0x04ad3000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2621  
0f43254763b3a1 Jie Gan             2024-12-19  2622  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2623  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2624  
0f43254763b3a1 Jie Gan             2024-12-19  2625  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2626  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2627  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2628  
0f43254763b3a1 Jie Gan             2024-12-19  2629  				port@13 {
0f43254763b3a1 Jie Gan             2024-12-19  2630  					reg = <19>;
0f43254763b3a1 Jie Gan             2024-12-19  2631  
0f43254763b3a1 Jie Gan             2024-12-19  2632  					dlct0_tpda_in19: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2633  						remote-endpoint = <&prng_tpdm_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2634  					};
0f43254763b3a1 Jie Gan             2024-12-19  2635  				};
0f43254763b3a1 Jie Gan             2024-12-19  2636  
0f43254763b3a1 Jie Gan             2024-12-19  2637  				port@19 {
0f43254763b3a1 Jie Gan             2024-12-19  2638  					reg = <25>;
0f43254763b3a1 Jie Gan             2024-12-19  2639  
0f43254763b3a1 Jie Gan             2024-12-19  2640  					dlct0_tpda_in25: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2641  						remote-endpoint = <&pimem_tpdm_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2642  					};
0f43254763b3a1 Jie Gan             2024-12-19  2643  				};
0f43254763b3a1 Jie Gan             2024-12-19  2644  
0f43254763b3a1 Jie Gan             2024-12-19  2645  				port@1a {
0f43254763b3a1 Jie Gan             2024-12-19  2646  					reg = <26>;
0f43254763b3a1 Jie Gan             2024-12-19  2647  
0f43254763b3a1 Jie Gan             2024-12-19  2648  					dlct0_tpda_in26: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2649  						remote-endpoint = <&dlct0_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2650  					};
0f43254763b3a1 Jie Gan             2024-12-19  2651  				};
0f43254763b3a1 Jie Gan             2024-12-19  2652  			};
0f43254763b3a1 Jie Gan             2024-12-19  2653  
0f43254763b3a1 Jie Gan             2024-12-19  2654  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2655  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2656  					dlct0_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2657  						remote-endpoint = <&dlct0_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2658  					};
0f43254763b3a1 Jie Gan             2024-12-19  2659  				};
0f43254763b3a1 Jie Gan             2024-12-19  2660  			};
0f43254763b3a1 Jie Gan             2024-12-19  2661  		};
0f43254763b3a1 Jie Gan             2024-12-19  2662  
0f43254763b3a1 Jie Gan             2024-12-19  2663  		funnel@4ad4000 {
0f43254763b3a1 Jie Gan             2024-12-19  2664  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2665  			reg = <0x0 0x04ad4000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2666  
0f43254763b3a1 Jie Gan             2024-12-19  2667  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2668  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2669  
0f43254763b3a1 Jie Gan             2024-12-19  2670  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2671  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2672  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2673  
0f43254763b3a1 Jie Gan             2024-12-19  2674  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  2675  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2676  
0f43254763b3a1 Jie Gan             2024-12-19  2677  					dlct0_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2678  						remote-endpoint = <&dlct0_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2679  					};
0f43254763b3a1 Jie Gan             2024-12-19  2680  				};
0f43254763b3a1 Jie Gan             2024-12-19  2681  
0f43254763b3a1 Jie Gan             2024-12-19  2682  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  2683  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  2684  
0f43254763b3a1 Jie Gan             2024-12-19  2685  					dlct0_funnel_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2686  						remote-endpoint = <&ddr_funnel5_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2687  					};
0f43254763b3a1 Jie Gan             2024-12-19  2688  				};
0f43254763b3a1 Jie Gan             2024-12-19  2689  			};
0f43254763b3a1 Jie Gan             2024-12-19  2690  
0f43254763b3a1 Jie Gan             2024-12-19  2691  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2692  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2693  					dlct0_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2694  						remote-endpoint = <&funnel1_in5>;
0f43254763b3a1 Jie Gan             2024-12-19  2695  					};
0f43254763b3a1 Jie Gan             2024-12-19  2696  				};
0f43254763b3a1 Jie Gan             2024-12-19  2697  			};
0f43254763b3a1 Jie Gan             2024-12-19  2698  		};
0f43254763b3a1 Jie Gan             2024-12-19  2699  
0f43254763b3a1 Jie Gan             2024-12-19  2700  		funnel@4b04000 {
0f43254763b3a1 Jie Gan             2024-12-19  2701  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2702  			reg = <0x0 0x04b04000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2703  
0f43254763b3a1 Jie Gan             2024-12-19  2704  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2705  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2706  
0f43254763b3a1 Jie Gan             2024-12-19  2707  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2708  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2709  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2710  
0f43254763b3a1 Jie Gan             2024-12-19  2711  				port@6 {
0f43254763b3a1 Jie Gan             2024-12-19  2712  					reg = <6>;
0f43254763b3a1 Jie Gan             2024-12-19  2713  
0f43254763b3a1 Jie Gan             2024-12-19  2714  					aoss_funnel_in6: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2715  						remote-endpoint = <&aoss_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2716  					};
0f43254763b3a1 Jie Gan             2024-12-19  2717  				};
0f43254763b3a1 Jie Gan             2024-12-19  2718  
0f43254763b3a1 Jie Gan             2024-12-19  2719  				port@7 {
0f43254763b3a1 Jie Gan             2024-12-19  2720  					reg = <7>;
0f43254763b3a1 Jie Gan             2024-12-19  2721  
0f43254763b3a1 Jie Gan             2024-12-19  2722  					aoss_funnel_in7: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2723  						remote-endpoint = <&qdss_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2724  					};
0f43254763b3a1 Jie Gan             2024-12-19  2725  				};
0f43254763b3a1 Jie Gan             2024-12-19  2726  			};
0f43254763b3a1 Jie Gan             2024-12-19  2727  
0f43254763b3a1 Jie Gan             2024-12-19  2728  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2729  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2730  					aoss_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2731  						remote-endpoint = <&etf0_in>;
0f43254763b3a1 Jie Gan             2024-12-19  2732  					};
0f43254763b3a1 Jie Gan             2024-12-19  2733  				};
0f43254763b3a1 Jie Gan             2024-12-19  2734  			};
0f43254763b3a1 Jie Gan             2024-12-19  2735  		};
0f43254763b3a1 Jie Gan             2024-12-19  2736  
0f43254763b3a1 Jie Gan             2024-12-19  2737  		tmc_etf: tmc@4b05000 {
0f43254763b3a1 Jie Gan             2024-12-19  2738  			compatible = "arm,coresight-tmc", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2739  			reg = <0x0 0x04b05000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2740  
0f43254763b3a1 Jie Gan             2024-12-19  2741  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2742  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2743  
0f43254763b3a1 Jie Gan             2024-12-19  2744  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2745  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2746  					etf0_in: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2747  						remote-endpoint = <&aoss_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2748  					};
0f43254763b3a1 Jie Gan             2024-12-19  2749  				};
0f43254763b3a1 Jie Gan             2024-12-19  2750  			};
0f43254763b3a1 Jie Gan             2024-12-19  2751  
0f43254763b3a1 Jie Gan             2024-12-19  2752  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2753  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2754  					etf0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2755  						remote-endpoint = <&swao_rep_in>;
0f43254763b3a1 Jie Gan             2024-12-19  2756  					};
0f43254763b3a1 Jie Gan             2024-12-19  2757  				};
0f43254763b3a1 Jie Gan             2024-12-19  2758  			};
0f43254763b3a1 Jie Gan             2024-12-19  2759  		};
0f43254763b3a1 Jie Gan             2024-12-19  2760  
0f43254763b3a1 Jie Gan             2024-12-19  2761  		replicator@4b06000 {
0f43254763b3a1 Jie Gan             2024-12-19  2762  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2763  			reg = <0x0 0x04b06000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2764  
0f43254763b3a1 Jie Gan             2024-12-19  2765  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2766  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2767  
0f43254763b3a1 Jie Gan             2024-12-19  2768  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2769  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2770  					swao_rep_in: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2771  						remote-endpoint = <&etf0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2772  					};
0f43254763b3a1 Jie Gan             2024-12-19  2773  				};
0f43254763b3a1 Jie Gan             2024-12-19  2774  			};
0f43254763b3a1 Jie Gan             2024-12-19  2775  
0f43254763b3a1 Jie Gan             2024-12-19  2776  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2777  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2778  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2779  
0f43254763b3a1 Jie Gan             2024-12-19  2780  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  2781  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2782  
0f43254763b3a1 Jie Gan             2024-12-19  2783  					swao_rep_out1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2784  						remote-endpoint = <&eud_in>;
0f43254763b3a1 Jie Gan             2024-12-19  2785  					};
0f43254763b3a1 Jie Gan             2024-12-19  2786  				};
0f43254763b3a1 Jie Gan             2024-12-19  2787  			};
0f43254763b3a1 Jie Gan             2024-12-19  2788  		};
0f43254763b3a1 Jie Gan             2024-12-19  2789  
0f43254763b3a1 Jie Gan             2024-12-19  2790  		tpda@4b08000 {
0f43254763b3a1 Jie Gan             2024-12-19  2791  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2792  			reg = <0x0 0x04b08000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2793  
0f43254763b3a1 Jie Gan             2024-12-19  2794  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2795  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2796  
0f43254763b3a1 Jie Gan             2024-12-19  2797  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2798  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2799  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2800  
0f43254763b3a1 Jie Gan             2024-12-19  2801  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  2802  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  2803  
0f43254763b3a1 Jie Gan             2024-12-19  2804  					aoss_tpda_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2805  						remote-endpoint = <&aoss_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2806  					};
0f43254763b3a1 Jie Gan             2024-12-19  2807  				};
0f43254763b3a1 Jie Gan             2024-12-19  2808  
0f43254763b3a1 Jie Gan             2024-12-19  2809  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  2810  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  2811  
0f43254763b3a1 Jie Gan             2024-12-19  2812  					aoss_tpda_in1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2813  						remote-endpoint = <&aoss_tpdm1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2814  					};
0f43254763b3a1 Jie Gan             2024-12-19  2815  				};
0f43254763b3a1 Jie Gan             2024-12-19  2816  
0f43254763b3a1 Jie Gan             2024-12-19  2817  				port@2 {
0f43254763b3a1 Jie Gan             2024-12-19  2818  					reg = <2>;
0f43254763b3a1 Jie Gan             2024-12-19  2819  
0f43254763b3a1 Jie Gan             2024-12-19  2820  					aoss_tpda_in2: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2821  						remote-endpoint = <&aoss_tpdm2_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2822  					};
0f43254763b3a1 Jie Gan             2024-12-19  2823  				};
0f43254763b3a1 Jie Gan             2024-12-19  2824  
0f43254763b3a1 Jie Gan             2024-12-19  2825  				port@3 {
0f43254763b3a1 Jie Gan             2024-12-19  2826  					reg = <3>;
0f43254763b3a1 Jie Gan             2024-12-19  2827  
0f43254763b3a1 Jie Gan             2024-12-19  2828  					aoss_tpda_in3: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2829  						remote-endpoint = <&aoss_tpdm3_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2830  					};
0f43254763b3a1 Jie Gan             2024-12-19  2831  				};
0f43254763b3a1 Jie Gan             2024-12-19  2832  
0f43254763b3a1 Jie Gan             2024-12-19  2833  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  2834  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  2835  
0f43254763b3a1 Jie Gan             2024-12-19  2836  					aoss_tpda_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2837  						remote-endpoint = <&aoss_tpdm4_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2838  					};
0f43254763b3a1 Jie Gan             2024-12-19  2839  				};
0f43254763b3a1 Jie Gan             2024-12-19  2840  			};
0f43254763b3a1 Jie Gan             2024-12-19  2841  
0f43254763b3a1 Jie Gan             2024-12-19  2842  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2843  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2844  					aoss_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2845  						remote-endpoint = <&aoss_funnel_in6>;
0f43254763b3a1 Jie Gan             2024-12-19  2846  					};
0f43254763b3a1 Jie Gan             2024-12-19  2847  				};
0f43254763b3a1 Jie Gan             2024-12-19  2848  			};
0f43254763b3a1 Jie Gan             2024-12-19  2849  		};
0f43254763b3a1 Jie Gan             2024-12-19  2850  
0f43254763b3a1 Jie Gan             2024-12-19  2851  		tpdm@4b09000 {
0f43254763b3a1 Jie Gan             2024-12-19  2852  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2853  			reg = <0x0 0x04b09000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2854  
0f43254763b3a1 Jie Gan             2024-12-19  2855  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2856  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2857  
0f43254763b3a1 Jie Gan             2024-12-19  2858  			qcom,cmb-element-bits = <64>;
0f43254763b3a1 Jie Gan             2024-12-19  2859  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2860  
0f43254763b3a1 Jie Gan             2024-12-19  2861  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2862  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2863  					aoss_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2864  						remote-endpoint = <&aoss_tpda_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2865  					};
0f43254763b3a1 Jie Gan             2024-12-19  2866  				};
0f43254763b3a1 Jie Gan             2024-12-19  2867  			};
0f43254763b3a1 Jie Gan             2024-12-19  2868  		};
0f43254763b3a1 Jie Gan             2024-12-19  2869  
0f43254763b3a1 Jie Gan             2024-12-19  2870  		tpdm@4b0a000 {
0f43254763b3a1 Jie Gan             2024-12-19  2871  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2872  			reg = <0x0 0x04b0a000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2873  
0f43254763b3a1 Jie Gan             2024-12-19  2874  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2875  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2876  
0f43254763b3a1 Jie Gan             2024-12-19  2877  			qcom,cmb-element-bits = <64>;
0f43254763b3a1 Jie Gan             2024-12-19  2878  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2879  
0f43254763b3a1 Jie Gan             2024-12-19  2880  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2881  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2882  					aoss_tpdm1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2883  						remote-endpoint = <&aoss_tpda_in1>;
0f43254763b3a1 Jie Gan             2024-12-19  2884  					};
0f43254763b3a1 Jie Gan             2024-12-19  2885  				};
0f43254763b3a1 Jie Gan             2024-12-19  2886  			};
0f43254763b3a1 Jie Gan             2024-12-19  2887  		};
0f43254763b3a1 Jie Gan             2024-12-19  2888  
0f43254763b3a1 Jie Gan             2024-12-19  2889  		tpdm@4b0b000 {
0f43254763b3a1 Jie Gan             2024-12-19  2890  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2891  			reg = <0x0 0x04b0b000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2892  
0f43254763b3a1 Jie Gan             2024-12-19  2893  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2894  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2895  
0f43254763b3a1 Jie Gan             2024-12-19  2896  			qcom,cmb-element-bits = <64>;
0f43254763b3a1 Jie Gan             2024-12-19  2897  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2898  
0f43254763b3a1 Jie Gan             2024-12-19  2899  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2900  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2901  					aoss_tpdm2_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2902  						remote-endpoint = <&aoss_tpda_in2>;
0f43254763b3a1 Jie Gan             2024-12-19  2903  					};
0f43254763b3a1 Jie Gan             2024-12-19  2904  				};
0f43254763b3a1 Jie Gan             2024-12-19  2905  			};
0f43254763b3a1 Jie Gan             2024-12-19  2906  		};
0f43254763b3a1 Jie Gan             2024-12-19  2907  
0f43254763b3a1 Jie Gan             2024-12-19  2908  		tpdm@4b0c000 {
0f43254763b3a1 Jie Gan             2024-12-19  2909  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2910  			reg = <0x0 0x04b0c000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2911  
0f43254763b3a1 Jie Gan             2024-12-19  2912  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2913  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2914  
0f43254763b3a1 Jie Gan             2024-12-19  2915  			qcom,cmb-element-bits = <64>;
0f43254763b3a1 Jie Gan             2024-12-19  2916  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2917  
0f43254763b3a1 Jie Gan             2024-12-19  2918  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2919  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2920  					aoss_tpdm3_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2921  						remote-endpoint = <&aoss_tpda_in3>;
0f43254763b3a1 Jie Gan             2024-12-19  2922  					};
0f43254763b3a1 Jie Gan             2024-12-19  2923  				};
0f43254763b3a1 Jie Gan             2024-12-19  2924  			};
0f43254763b3a1 Jie Gan             2024-12-19  2925  		};
0f43254763b3a1 Jie Gan             2024-12-19  2926  
0f43254763b3a1 Jie Gan             2024-12-19  2927  		tpdm@4b0d000 {
0f43254763b3a1 Jie Gan             2024-12-19  2928  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2929  			reg = <0x0 0x04b0d000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2930  
0f43254763b3a1 Jie Gan             2024-12-19  2931  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2932  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2933  
0f43254763b3a1 Jie Gan             2024-12-19  2934  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2935  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2936  
0f43254763b3a1 Jie Gan             2024-12-19  2937  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2938  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2939  					aoss_tpdm4_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2940  						remote-endpoint = <&aoss_tpda_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  2941  					};
0f43254763b3a1 Jie Gan             2024-12-19  2942  				};
0f43254763b3a1 Jie Gan             2024-12-19  2943  			};
0f43254763b3a1 Jie Gan             2024-12-19  2944  		};
0f43254763b3a1 Jie Gan             2024-12-19  2945  
0f43254763b3a1 Jie Gan             2024-12-19  2946  		cti@4b13000 {
0f43254763b3a1 Jie Gan             2024-12-19  2947  			compatible = "arm,coresight-cti", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2948  			reg = <0x0 0x04b13000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2949  
0f43254763b3a1 Jie Gan             2024-12-19  2950  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2951  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2952  		};
0f43254763b3a1 Jie Gan             2024-12-19  2953  
0f43254763b3a1 Jie Gan             2024-12-19  2954  		tpdm@4b80000 {
0f43254763b3a1 Jie Gan             2024-12-19  2955  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2956  			reg = <0x0 0x04b80000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2957  
0f43254763b3a1 Jie Gan             2024-12-19  2958  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2959  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2960  
0f43254763b3a1 Jie Gan             2024-12-19  2961  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2962  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  2963  
0f43254763b3a1 Jie Gan             2024-12-19  2964  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2965  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2966  					turing0_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2967  						remote-endpoint = <&turing0_tpda_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2968  					};
0f43254763b3a1 Jie Gan             2024-12-19  2969  				};
0f43254763b3a1 Jie Gan             2024-12-19  2970  			};
0f43254763b3a1 Jie Gan             2024-12-19  2971  		};
0f43254763b3a1 Jie Gan             2024-12-19  2972  
0f43254763b3a1 Jie Gan             2024-12-19  2973  		tpda@4b86000 {
0f43254763b3a1 Jie Gan             2024-12-19  2974  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2975  			reg = <0x0 0x04b86000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  2976  
0f43254763b3a1 Jie Gan             2024-12-19  2977  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  2978  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  2979  
0f43254763b3a1 Jie Gan             2024-12-19  2980  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2981  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2982  					turing0_tpda_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2983  						remote-endpoint = <&turing0_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  2984  					};
0f43254763b3a1 Jie Gan             2024-12-19  2985  				};
0f43254763b3a1 Jie Gan             2024-12-19  2986  			};
0f43254763b3a1 Jie Gan             2024-12-19  2987  
0f43254763b3a1 Jie Gan             2024-12-19  2988  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  2989  				port {
0f43254763b3a1 Jie Gan             2024-12-19  2990  					turing0_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  2991  						remote-endpoint = <&turing0_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  2992  					};
0f43254763b3a1 Jie Gan             2024-12-19  2993  				};
0f43254763b3a1 Jie Gan             2024-12-19  2994  			};
0f43254763b3a1 Jie Gan             2024-12-19  2995  		};
0f43254763b3a1 Jie Gan             2024-12-19  2996  
0f43254763b3a1 Jie Gan             2024-12-19  2997  		funnel@4b87000 {
0f43254763b3a1 Jie Gan             2024-12-19  2998  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  2999  			reg = <0x0 0x04b87000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3000  
0f43254763b3a1 Jie Gan             2024-12-19  3001  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3002  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3003  
0f43254763b3a1 Jie Gan             2024-12-19  3004  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3005  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3006  					turing0_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3007  						remote-endpoint = <&turing0_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3008  					};
0f43254763b3a1 Jie Gan             2024-12-19  3009  				};
0f43254763b3a1 Jie Gan             2024-12-19  3010  			};
0f43254763b3a1 Jie Gan             2024-12-19  3011  
0f43254763b3a1 Jie Gan             2024-12-19  3012  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3013  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3014  					turing0_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3015  						remote-endpoint = <&gdsp_funnel_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3016  					};
0f43254763b3a1 Jie Gan             2024-12-19  3017  				};
0f43254763b3a1 Jie Gan             2024-12-19  3018  			};
0f43254763b3a1 Jie Gan             2024-12-19  3019  		};
0f43254763b3a1 Jie Gan             2024-12-19  3020  
0f43254763b3a1 Jie Gan             2024-12-19  3021  		cti@4b8b000 {
0f43254763b3a1 Jie Gan             2024-12-19  3022  			compatible = "arm,coresight-cti", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3023  			reg = <0x0 0x04b8b000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3024  
0f43254763b3a1 Jie Gan             2024-12-19  3025  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3026  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3027  		};
0f43254763b3a1 Jie Gan             2024-12-19  3028  
0f43254763b3a1 Jie Gan             2024-12-19  3029  		tpdm@4c40000 {
0f43254763b3a1 Jie Gan             2024-12-19  3030  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3031  			reg = <0x0 0x04c40000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3032  
0f43254763b3a1 Jie Gan             2024-12-19  3033  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3034  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3035  
0f43254763b3a1 Jie Gan             2024-12-19  3036  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3037  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3038  
0f43254763b3a1 Jie Gan             2024-12-19  3039  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3040  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3041  					gdsp_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3042  						remote-endpoint = <&gdsp_tpda_in8>;
0f43254763b3a1 Jie Gan             2024-12-19  3043  					};
0f43254763b3a1 Jie Gan             2024-12-19  3044  				};
0f43254763b3a1 Jie Gan             2024-12-19  3045  			};
0f43254763b3a1 Jie Gan             2024-12-19  3046  		};
0f43254763b3a1 Jie Gan             2024-12-19  3047  
0f43254763b3a1 Jie Gan             2024-12-19  3048  		tpda@4c44000 {
0f43254763b3a1 Jie Gan             2024-12-19  3049  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3050  			reg = <0x0 0x04c44000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3051  
0f43254763b3a1 Jie Gan             2024-12-19  3052  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3053  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3054  
0f43254763b3a1 Jie Gan             2024-12-19  3055  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3056  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3057  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3058  
0f43254763b3a1 Jie Gan             2024-12-19  3059  				port@5 {
0f43254763b3a1 Jie Gan             2024-12-19  3060  					reg = <5>;
0f43254763b3a1 Jie Gan             2024-12-19  3061  
0f43254763b3a1 Jie Gan             2024-12-19  3062  					gdsp_tpda_in5: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3063  						remote-endpoint = <&turing2_funnel_out0>;
0f43254763b3a1 Jie Gan             2024-12-19  3064  					};
0f43254763b3a1 Jie Gan             2024-12-19  3065  				};
0f43254763b3a1 Jie Gan             2024-12-19  3066  
0f43254763b3a1 Jie Gan             2024-12-19  3067  				port@8 {
0f43254763b3a1 Jie Gan             2024-12-19  3068  					reg = <8>;
0f43254763b3a1 Jie Gan             2024-12-19  3069  
0f43254763b3a1 Jie Gan             2024-12-19  3070  					gdsp_tpda_in8: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3071  						remote-endpoint = <&gdsp_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3072  					};
0f43254763b3a1 Jie Gan             2024-12-19  3073  				};
0f43254763b3a1 Jie Gan             2024-12-19  3074  			};
0f43254763b3a1 Jie Gan             2024-12-19  3075  
0f43254763b3a1 Jie Gan             2024-12-19  3076  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3077  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3078  					gdsp_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3079  						remote-endpoint = <&gdsp_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3080  					};
0f43254763b3a1 Jie Gan             2024-12-19  3081  				};
0f43254763b3a1 Jie Gan             2024-12-19  3082  			};
0f43254763b3a1 Jie Gan             2024-12-19  3083  		};
0f43254763b3a1 Jie Gan             2024-12-19  3084  
0f43254763b3a1 Jie Gan             2024-12-19  3085  		funnel@4c45000 {
0f43254763b3a1 Jie Gan             2024-12-19  3086  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3087  			reg = <0x0 0x04c45000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3088  
0f43254763b3a1 Jie Gan             2024-12-19  3089  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3090  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3091  
0f43254763b3a1 Jie Gan             2024-12-19  3092  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3093  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3094  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3095  
0f43254763b3a1 Jie Gan             2024-12-19  3096  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  3097  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3098  
0f43254763b3a1 Jie Gan             2024-12-19  3099  					gdsp_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3100  						remote-endpoint = <&gdsp_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3101  					};
0f43254763b3a1 Jie Gan             2024-12-19  3102  				};
0f43254763b3a1 Jie Gan             2024-12-19  3103  
0f43254763b3a1 Jie Gan             2024-12-19  3104  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  3105  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  3106  
0f43254763b3a1 Jie Gan             2024-12-19  3107  					gdsp_funnel_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3108  						remote-endpoint = <&turing0_funnel_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3109  					};
0f43254763b3a1 Jie Gan             2024-12-19  3110  				};
0f43254763b3a1 Jie Gan             2024-12-19  3111  			};
0f43254763b3a1 Jie Gan             2024-12-19  3112  
0f43254763b3a1 Jie Gan             2024-12-19  3113  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3114  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3115  					gdsp_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3116  						remote-endpoint = <&dlst_ch_funnel_in6>;
0f43254763b3a1 Jie Gan             2024-12-19  3117  					};
0f43254763b3a1 Jie Gan             2024-12-19  3118  				};
0f43254763b3a1 Jie Gan             2024-12-19  3119  			};
0f43254763b3a1 Jie Gan             2024-12-19  3120  		};
0f43254763b3a1 Jie Gan             2024-12-19  3121  
0f43254763b3a1 Jie Gan             2024-12-19  3122  		tpdm@4c50000 {
0f43254763b3a1 Jie Gan             2024-12-19  3123  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3124  			reg = <0x0 0x04c50000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3125  
0f43254763b3a1 Jie Gan             2024-12-19  3126  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3127  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3128  
0f43254763b3a1 Jie Gan             2024-12-19  3129  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3130  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3131  
0f43254763b3a1 Jie Gan             2024-12-19  3132  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3133  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3134  					dlst_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3135  						remote-endpoint = <&dlst_tpda_in8>;
0f43254763b3a1 Jie Gan             2024-12-19  3136  					};
0f43254763b3a1 Jie Gan             2024-12-19  3137  				};
0f43254763b3a1 Jie Gan             2024-12-19  3138  			};
0f43254763b3a1 Jie Gan             2024-12-19  3139  		};
0f43254763b3a1 Jie Gan             2024-12-19  3140  
0f43254763b3a1 Jie Gan             2024-12-19  3141  		tpda@4c54000 {
0f43254763b3a1 Jie Gan             2024-12-19  3142  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3143  			reg = <0x0 0x04c54000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3144  
0f43254763b3a1 Jie Gan             2024-12-19  3145  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3146  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3147  
0f43254763b3a1 Jie Gan             2024-12-19  3148  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3149  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3150  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3151  
0f43254763b3a1 Jie Gan             2024-12-19  3152  				port@8 {
0f43254763b3a1 Jie Gan             2024-12-19  3153  					reg = <8>;
0f43254763b3a1 Jie Gan             2024-12-19  3154  
0f43254763b3a1 Jie Gan             2024-12-19  3155  					dlst_tpda_in8: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3156  						remote-endpoint = <&dlst_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3157  					};
0f43254763b3a1 Jie Gan             2024-12-19  3158  				};
0f43254763b3a1 Jie Gan             2024-12-19  3159  			};
0f43254763b3a1 Jie Gan             2024-12-19  3160  
0f43254763b3a1 Jie Gan             2024-12-19  3161  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3162  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3163  					dlst_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3164  						remote-endpoint = <&dlst_funnel_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3165  					};
0f43254763b3a1 Jie Gan             2024-12-19  3166  				};
0f43254763b3a1 Jie Gan             2024-12-19  3167  			};
0f43254763b3a1 Jie Gan             2024-12-19  3168  		};
0f43254763b3a1 Jie Gan             2024-12-19  3169  
0f43254763b3a1 Jie Gan             2024-12-19  3170  		funnel@4c55000 {
0f43254763b3a1 Jie Gan             2024-12-19  3171  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3172  			reg = <0x0 0x04c55000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3173  
0f43254763b3a1 Jie Gan             2024-12-19  3174  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3175  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3176  
0f43254763b3a1 Jie Gan             2024-12-19  3177  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3178  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3179  					dlst_funnel_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3180  						remote-endpoint = <&dlst_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3181  					};
0f43254763b3a1 Jie Gan             2024-12-19  3182  				};
0f43254763b3a1 Jie Gan             2024-12-19  3183  			};
0f43254763b3a1 Jie Gan             2024-12-19  3184  
0f43254763b3a1 Jie Gan             2024-12-19  3185  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3186  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3187  					dlst_funnel_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3188  						remote-endpoint = <&dlst_ch_funnel_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3189  					};
0f43254763b3a1 Jie Gan             2024-12-19  3190  				};
0f43254763b3a1 Jie Gan             2024-12-19  3191  			};
0f43254763b3a1 Jie Gan             2024-12-19  3192  		};
0f43254763b3a1 Jie Gan             2024-12-19  3193  
0f43254763b3a1 Jie Gan             2024-12-19  3194  		tpdm@4e00000 {
0f43254763b3a1 Jie Gan             2024-12-19  3195  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3196  			reg = <0x0 0x04e00000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3197  
0f43254763b3a1 Jie Gan             2024-12-19  3198  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3199  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3200  
0f43254763b3a1 Jie Gan             2024-12-19  3201  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3202  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3203  			qcom,cmb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3204  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3205  
0f43254763b3a1 Jie Gan             2024-12-19  3206  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3207  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3208  					ddr_tpdm3_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3209  						remote-endpoint = <&ddr_tpda_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3210  					};
0f43254763b3a1 Jie Gan             2024-12-19  3211  				};
0f43254763b3a1 Jie Gan             2024-12-19  3212  			};
0f43254763b3a1 Jie Gan             2024-12-19  3213  		};
0f43254763b3a1 Jie Gan             2024-12-19  3214  
0f43254763b3a1 Jie Gan             2024-12-19  3215  		tpda@4e03000 {
0f43254763b3a1 Jie Gan             2024-12-19  3216  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3217  			reg = <0x0 0x04e03000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3218  
0f43254763b3a1 Jie Gan             2024-12-19  3219  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3220  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3221  
0f43254763b3a1 Jie Gan             2024-12-19  3222  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3223  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3224  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3225  
0f43254763b3a1 Jie Gan             2024-12-19  3226  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  3227  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3228  
0f43254763b3a1 Jie Gan             2024-12-19  3229  					ddr_tpda_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3230  						remote-endpoint = <&ddr_funnel0_out0>;
0f43254763b3a1 Jie Gan             2024-12-19  3231  					};
0f43254763b3a1 Jie Gan             2024-12-19  3232  				};
0f43254763b3a1 Jie Gan             2024-12-19  3233  
0f43254763b3a1 Jie Gan             2024-12-19  3234  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  3235  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3236  
0f43254763b3a1 Jie Gan             2024-12-19  3237  					ddr_tpda_in1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3238  						remote-endpoint = <&ddr_funnel1_out0>;
0f43254763b3a1 Jie Gan             2024-12-19  3239  					};
0f43254763b3a1 Jie Gan             2024-12-19  3240  				};
0f43254763b3a1 Jie Gan             2024-12-19  3241  
0f43254763b3a1 Jie Gan             2024-12-19  3242  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  3243  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  3244  
0f43254763b3a1 Jie Gan             2024-12-19  3245  					ddr_tpda_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3246  						remote-endpoint = <&ddr_tpdm3_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3247  					};
0f43254763b3a1 Jie Gan             2024-12-19  3248  				};
0f43254763b3a1 Jie Gan             2024-12-19  3249  			};
0f43254763b3a1 Jie Gan             2024-12-19  3250  
0f43254763b3a1 Jie Gan             2024-12-19  3251  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3252  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3253  					ddr_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3254  						remote-endpoint = <&ddr_funnel5_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3255  					};
0f43254763b3a1 Jie Gan             2024-12-19  3256  				};
0f43254763b3a1 Jie Gan             2024-12-19  3257  			};
0f43254763b3a1 Jie Gan             2024-12-19  3258  		};
0f43254763b3a1 Jie Gan             2024-12-19  3259  
0f43254763b3a1 Jie Gan             2024-12-19  3260  		funnel@4e04000 {
0f43254763b3a1 Jie Gan             2024-12-19  3261  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3262  			reg = <0x0 0x04e04000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3263  
0f43254763b3a1 Jie Gan             2024-12-19  3264  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3265  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3266  
0f43254763b3a1 Jie Gan             2024-12-19  3267  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3268  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3269  					ddr_funnel5_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3270  						remote-endpoint = <&ddr_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3271  					};
0f43254763b3a1 Jie Gan             2024-12-19  3272  				};
0f43254763b3a1 Jie Gan             2024-12-19  3273  			};
0f43254763b3a1 Jie Gan             2024-12-19  3274  
0f43254763b3a1 Jie Gan             2024-12-19  3275  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3276  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3277  					ddr_funnel5_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3278  						remote-endpoint = <&dlct0_funnel_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3279  					};
0f43254763b3a1 Jie Gan             2024-12-19  3280  				};
0f43254763b3a1 Jie Gan             2024-12-19  3281  			};
0f43254763b3a1 Jie Gan             2024-12-19  3282  		};
0f43254763b3a1 Jie Gan             2024-12-19  3283  
0f43254763b3a1 Jie Gan             2024-12-19  3284  		tpdm@4e10000 {
0f43254763b3a1 Jie Gan             2024-12-19  3285  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3286  			reg = <0x0 0x04e10000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3287  
0f43254763b3a1 Jie Gan             2024-12-19  3288  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3289  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3290  
0f43254763b3a1 Jie Gan             2024-12-19  3291  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3292  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3293  
0f43254763b3a1 Jie Gan             2024-12-19  3294  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3295  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3296  					ddr_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3297  						remote-endpoint = <&ddr_funnel0_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3298  					};
0f43254763b3a1 Jie Gan             2024-12-19  3299  				};
0f43254763b3a1 Jie Gan             2024-12-19  3300  			};
0f43254763b3a1 Jie Gan             2024-12-19  3301  		};
0f43254763b3a1 Jie Gan             2024-12-19  3302  
0f43254763b3a1 Jie Gan             2024-12-19  3303  		funnel@4e12000 {
0f43254763b3a1 Jie Gan             2024-12-19  3304  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3305  			reg = <0x0 0x04e12000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3306  
0f43254763b3a1 Jie Gan             2024-12-19  3307  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3308  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3309  
0f43254763b3a1 Jie Gan             2024-12-19  3310  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3311  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3312  					ddr_funnel0_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3313  						remote-endpoint = <&ddr_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3314  					};
0f43254763b3a1 Jie Gan             2024-12-19  3315  				};
0f43254763b3a1 Jie Gan             2024-12-19  3316  			};
0f43254763b3a1 Jie Gan             2024-12-19  3317  
0f43254763b3a1 Jie Gan             2024-12-19  3318  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3319  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3320  					ddr_funnel0_out0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3321  						remote-endpoint = <&ddr_tpda_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3322  					};
0f43254763b3a1 Jie Gan             2024-12-19  3323  				};
0f43254763b3a1 Jie Gan             2024-12-19  3324  			};
0f43254763b3a1 Jie Gan             2024-12-19  3325  		};
0f43254763b3a1 Jie Gan             2024-12-19  3326  
0f43254763b3a1 Jie Gan             2024-12-19  3327  		tpdm@4e20000 {
0f43254763b3a1 Jie Gan             2024-12-19  3328  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3329  			reg = <0x0 0x04e20000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3330  
0f43254763b3a1 Jie Gan             2024-12-19  3331  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3332  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3333  
0f43254763b3a1 Jie Gan             2024-12-19  3334  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3335  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3336  
0f43254763b3a1 Jie Gan             2024-12-19  3337  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3338  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3339  					ddr_tpdm1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3340  						remote-endpoint = <&ddr_funnel1_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3341  					};
0f43254763b3a1 Jie Gan             2024-12-19  3342  				};
0f43254763b3a1 Jie Gan             2024-12-19  3343  			};
0f43254763b3a1 Jie Gan             2024-12-19  3344  		};
0f43254763b3a1 Jie Gan             2024-12-19  3345  
0f43254763b3a1 Jie Gan             2024-12-19  3346  		funnel@4e22000 {
0f43254763b3a1 Jie Gan             2024-12-19  3347  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3348  			reg = <0x0 0x04e22000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3349  
0f43254763b3a1 Jie Gan             2024-12-19  3350  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3351  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3352  
0f43254763b3a1 Jie Gan             2024-12-19  3353  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3354  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3355  					ddr_funnel1_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3356  						remote-endpoint = <&ddr_tpdm1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3357  					};
0f43254763b3a1 Jie Gan             2024-12-19  3358  				};
0f43254763b3a1 Jie Gan             2024-12-19  3359  			};
0f43254763b3a1 Jie Gan             2024-12-19  3360  
0f43254763b3a1 Jie Gan             2024-12-19  3361  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3362  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3363  					ddr_funnel1_out0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3364  						remote-endpoint = <&ddr_tpda_in1>;
0f43254763b3a1 Jie Gan             2024-12-19  3365  					};
0f43254763b3a1 Jie Gan             2024-12-19  3366  				};
0f43254763b3a1 Jie Gan             2024-12-19  3367  			};
0f43254763b3a1 Jie Gan             2024-12-19  3368  		};
0f43254763b3a1 Jie Gan             2024-12-19  3369  
0f43254763b3a1 Jie Gan             2024-12-19  3370  		etm@6040000 {
0f43254763b3a1 Jie Gan             2024-12-19  3371  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3372  			reg = <0x0 0x06040000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3373  			cpu = <&cpu0>;
0f43254763b3a1 Jie Gan             2024-12-19  3374  
0f43254763b3a1 Jie Gan             2024-12-19  3375  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3376  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3377  
0f43254763b3a1 Jie Gan             2024-12-19  3378  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3379  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3380  
0f43254763b3a1 Jie Gan             2024-12-19  3381  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3382  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3383  					etm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3384  						remote-endpoint = <&apss_funnel0_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3385  					};
0f43254763b3a1 Jie Gan             2024-12-19  3386  				};
0f43254763b3a1 Jie Gan             2024-12-19  3387  			};
0f43254763b3a1 Jie Gan             2024-12-19  3388  		};
0f43254763b3a1 Jie Gan             2024-12-19  3389  
0f43254763b3a1 Jie Gan             2024-12-19  3390  		etm@6140000 {
0f43254763b3a1 Jie Gan             2024-12-19  3391  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3392  			reg = <0x0 0x06140000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3393  			cpu = <&cpu1>;
0f43254763b3a1 Jie Gan             2024-12-19  3394  
0f43254763b3a1 Jie Gan             2024-12-19  3395  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3396  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3397  
0f43254763b3a1 Jie Gan             2024-12-19  3398  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3399  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3400  
0f43254763b3a1 Jie Gan             2024-12-19  3401  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3402  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3403  					etm1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3404  						remote-endpoint = <&apss_funnel0_in1>;
0f43254763b3a1 Jie Gan             2024-12-19  3405  					};
0f43254763b3a1 Jie Gan             2024-12-19  3406  				};
0f43254763b3a1 Jie Gan             2024-12-19  3407  			};
0f43254763b3a1 Jie Gan             2024-12-19  3408  		};
0f43254763b3a1 Jie Gan             2024-12-19  3409  
0f43254763b3a1 Jie Gan             2024-12-19  3410  		etm@6240000 {
0f43254763b3a1 Jie Gan             2024-12-19  3411  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3412  			reg = <0x0 0x06240000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3413  			cpu = <&cpu2>;
0f43254763b3a1 Jie Gan             2024-12-19  3414  
0f43254763b3a1 Jie Gan             2024-12-19  3415  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3416  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3417  
0f43254763b3a1 Jie Gan             2024-12-19  3418  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3419  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3420  
0f43254763b3a1 Jie Gan             2024-12-19  3421  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3422  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3423  					etm2_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3424  						remote-endpoint = <&apss_funnel0_in2>;
0f43254763b3a1 Jie Gan             2024-12-19  3425  					};
0f43254763b3a1 Jie Gan             2024-12-19  3426  				};
0f43254763b3a1 Jie Gan             2024-12-19  3427  			};
0f43254763b3a1 Jie Gan             2024-12-19  3428  		};
0f43254763b3a1 Jie Gan             2024-12-19  3429  
0f43254763b3a1 Jie Gan             2024-12-19  3430  		etm@6340000 {
0f43254763b3a1 Jie Gan             2024-12-19  3431  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3432  			reg = <0x0 0x06340000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3433  			cpu = <&cpu3>;
0f43254763b3a1 Jie Gan             2024-12-19  3434  
0f43254763b3a1 Jie Gan             2024-12-19  3435  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3436  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3437  
0f43254763b3a1 Jie Gan             2024-12-19  3438  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3439  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3440  
0f43254763b3a1 Jie Gan             2024-12-19  3441  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3442  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3443  					etm3_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3444  						remote-endpoint = <&apss_funnel0_in3>;
0f43254763b3a1 Jie Gan             2024-12-19  3445  					};
0f43254763b3a1 Jie Gan             2024-12-19  3446  				};
0f43254763b3a1 Jie Gan             2024-12-19  3447  			};
0f43254763b3a1 Jie Gan             2024-12-19  3448  		};
0f43254763b3a1 Jie Gan             2024-12-19  3449  
0f43254763b3a1 Jie Gan             2024-12-19  3450  		etm@6440000 {
0f43254763b3a1 Jie Gan             2024-12-19  3451  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3452  			reg = <0x0 0x06440000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3453  			cpu = <&cpu4>;
0f43254763b3a1 Jie Gan             2024-12-19  3454  
0f43254763b3a1 Jie Gan             2024-12-19  3455  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3456  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3457  
0f43254763b3a1 Jie Gan             2024-12-19  3458  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3459  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3460  
0f43254763b3a1 Jie Gan             2024-12-19  3461  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3462  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3463  					etm4_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3464  						remote-endpoint = <&apss_funnel0_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3465  					};
0f43254763b3a1 Jie Gan             2024-12-19  3466  				};
0f43254763b3a1 Jie Gan             2024-12-19  3467  			};
0f43254763b3a1 Jie Gan             2024-12-19  3468  		};
0f43254763b3a1 Jie Gan             2024-12-19  3469  
0f43254763b3a1 Jie Gan             2024-12-19  3470  		etm@6540000 {
0f43254763b3a1 Jie Gan             2024-12-19  3471  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3472  			reg = <0x0 0x06540000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3473  			cpu = <&cpu5>;
0f43254763b3a1 Jie Gan             2024-12-19  3474  
0f43254763b3a1 Jie Gan             2024-12-19  3475  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3476  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3477  
0f43254763b3a1 Jie Gan             2024-12-19  3478  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3479  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3480  
0f43254763b3a1 Jie Gan             2024-12-19  3481  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3482  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3483  					etm5_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3484  						remote-endpoint = <&apss_funnel0_in5>;
0f43254763b3a1 Jie Gan             2024-12-19  3485  					};
0f43254763b3a1 Jie Gan             2024-12-19  3486  				};
0f43254763b3a1 Jie Gan             2024-12-19  3487  			};
0f43254763b3a1 Jie Gan             2024-12-19  3488  		};
0f43254763b3a1 Jie Gan             2024-12-19  3489  
0f43254763b3a1 Jie Gan             2024-12-19  3490  		etm@6640000 {
0f43254763b3a1 Jie Gan             2024-12-19  3491  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3492  			reg = <0x0 0x06640000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3493  			cpu = <&cpu6>;
0f43254763b3a1 Jie Gan             2024-12-19  3494  
0f43254763b3a1 Jie Gan             2024-12-19  3495  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3496  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3497  
0f43254763b3a1 Jie Gan             2024-12-19  3498  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3499  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3500  
0f43254763b3a1 Jie Gan             2024-12-19  3501  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3502  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3503  					etm6_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3504  						remote-endpoint = <&apss_funnel0_in6>;
0f43254763b3a1 Jie Gan             2024-12-19  3505  					};
0f43254763b3a1 Jie Gan             2024-12-19  3506  				};
0f43254763b3a1 Jie Gan             2024-12-19  3507  			};
0f43254763b3a1 Jie Gan             2024-12-19  3508  		};
0f43254763b3a1 Jie Gan             2024-12-19  3509  
0f43254763b3a1 Jie Gan             2024-12-19  3510  		etm@6740000 {
0f43254763b3a1 Jie Gan             2024-12-19  3511  			compatible = "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3512  			reg = <0x0 0x06740000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3513  			cpu = <&cpu7>;
0f43254763b3a1 Jie Gan             2024-12-19  3514  
0f43254763b3a1 Jie Gan             2024-12-19  3515  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3516  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3517  
0f43254763b3a1 Jie Gan             2024-12-19  3518  			arm,coresight-loses-context-with-cpu;
0f43254763b3a1 Jie Gan             2024-12-19  3519  			qcom,skip-power-up;
0f43254763b3a1 Jie Gan             2024-12-19  3520  
0f43254763b3a1 Jie Gan             2024-12-19  3521  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3522  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3523  					etm7_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3524  						remote-endpoint = <&apss_funnel0_in7>;
0f43254763b3a1 Jie Gan             2024-12-19  3525  					};
0f43254763b3a1 Jie Gan             2024-12-19  3526  				};
0f43254763b3a1 Jie Gan             2024-12-19  3527  			};
0f43254763b3a1 Jie Gan             2024-12-19  3528  		};
0f43254763b3a1 Jie Gan             2024-12-19  3529  
0f43254763b3a1 Jie Gan             2024-12-19  3530  		funnel@6800000 {
0f43254763b3a1 Jie Gan             2024-12-19  3531  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3532  			reg = <0x0 0x06800000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3533  
0f43254763b3a1 Jie Gan             2024-12-19  3534  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3535  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3536  
0f43254763b3a1 Jie Gan             2024-12-19  3537  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3538  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3539  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3540  
0f43254763b3a1 Jie Gan             2024-12-19  3541  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  3542  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3543  
0f43254763b3a1 Jie Gan             2024-12-19  3544  					apss_funnel0_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3545  						remote-endpoint = <&etm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3546  					};
0f43254763b3a1 Jie Gan             2024-12-19  3547  				};
0f43254763b3a1 Jie Gan             2024-12-19  3548  
0f43254763b3a1 Jie Gan             2024-12-19  3549  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  3550  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3551  
0f43254763b3a1 Jie Gan             2024-12-19  3552  					apss_funnel0_in1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3553  						remote-endpoint = <&etm1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3554  					};
0f43254763b3a1 Jie Gan             2024-12-19  3555  				};
0f43254763b3a1 Jie Gan             2024-12-19  3556  
0f43254763b3a1 Jie Gan             2024-12-19  3557  				port@2 {
0f43254763b3a1 Jie Gan             2024-12-19  3558  					reg = <2>;
0f43254763b3a1 Jie Gan             2024-12-19  3559  
0f43254763b3a1 Jie Gan             2024-12-19  3560  					apss_funnel0_in2: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3561  						remote-endpoint = <&etm2_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3562  					};
0f43254763b3a1 Jie Gan             2024-12-19  3563  				};
0f43254763b3a1 Jie Gan             2024-12-19  3564  
0f43254763b3a1 Jie Gan             2024-12-19  3565  				port@3 {
0f43254763b3a1 Jie Gan             2024-12-19  3566  					reg = <3>;
0f43254763b3a1 Jie Gan             2024-12-19  3567  
0f43254763b3a1 Jie Gan             2024-12-19  3568  					apss_funnel0_in3: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3569  						remote-endpoint = <&etm3_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3570  					};
0f43254763b3a1 Jie Gan             2024-12-19  3571  				};
0f43254763b3a1 Jie Gan             2024-12-19  3572  
0f43254763b3a1 Jie Gan             2024-12-19  3573  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  3574  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  3575  
0f43254763b3a1 Jie Gan             2024-12-19  3576  					apss_funnel0_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3577  						remote-endpoint = <&etm4_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3578  					};
0f43254763b3a1 Jie Gan             2024-12-19  3579  				};
0f43254763b3a1 Jie Gan             2024-12-19  3580  
0f43254763b3a1 Jie Gan             2024-12-19  3581  				port@5 {
0f43254763b3a1 Jie Gan             2024-12-19  3582  					reg = <5>;
0f43254763b3a1 Jie Gan             2024-12-19  3583  
0f43254763b3a1 Jie Gan             2024-12-19  3584  					apss_funnel0_in5: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3585  						remote-endpoint = <&etm5_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3586  					};
0f43254763b3a1 Jie Gan             2024-12-19  3587  				};
0f43254763b3a1 Jie Gan             2024-12-19  3588  
0f43254763b3a1 Jie Gan             2024-12-19  3589  				port@6 {
0f43254763b3a1 Jie Gan             2024-12-19  3590  					reg = <6>;
0f43254763b3a1 Jie Gan             2024-12-19  3591  
0f43254763b3a1 Jie Gan             2024-12-19  3592  					apss_funnel0_in6: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3593  						remote-endpoint = <&etm6_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3594  					};
0f43254763b3a1 Jie Gan             2024-12-19  3595  				};
0f43254763b3a1 Jie Gan             2024-12-19  3596  
0f43254763b3a1 Jie Gan             2024-12-19  3597  				port@7 {
0f43254763b3a1 Jie Gan             2024-12-19  3598  					reg = <7>;
0f43254763b3a1 Jie Gan             2024-12-19  3599  
0f43254763b3a1 Jie Gan             2024-12-19  3600  					apss_funnel0_in7: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3601  						remote-endpoint = <&etm7_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3602  					};
0f43254763b3a1 Jie Gan             2024-12-19  3603  				};
0f43254763b3a1 Jie Gan             2024-12-19  3604  			};
0f43254763b3a1 Jie Gan             2024-12-19  3605  
0f43254763b3a1 Jie Gan             2024-12-19  3606  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3607  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3608  					apss_funnel0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3609  						remote-endpoint = <&apss_funnel1_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3610  					};
0f43254763b3a1 Jie Gan             2024-12-19  3611  				};
0f43254763b3a1 Jie Gan             2024-12-19  3612  			};
0f43254763b3a1 Jie Gan             2024-12-19  3613  		};
0f43254763b3a1 Jie Gan             2024-12-19  3614  
0f43254763b3a1 Jie Gan             2024-12-19  3615  		funnel@6810000 {
0f43254763b3a1 Jie Gan             2024-12-19  3616  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3617  			reg = <0x0 0x06810000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3618  
0f43254763b3a1 Jie Gan             2024-12-19  3619  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3620  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3621  
0f43254763b3a1 Jie Gan             2024-12-19  3622  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3623  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3624  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3625  
0f43254763b3a1 Jie Gan             2024-12-19  3626  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  3627  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3628  
0f43254763b3a1 Jie Gan             2024-12-19  3629  					apss_funnel1_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3630  						remote-endpoint = <&apss_funnel0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3631  					};
0f43254763b3a1 Jie Gan             2024-12-19  3632  				};
0f43254763b3a1 Jie Gan             2024-12-19  3633  
0f43254763b3a1 Jie Gan             2024-12-19  3634  				port@3 {
0f43254763b3a1 Jie Gan             2024-12-19  3635  					reg = <3>;
0f43254763b3a1 Jie Gan             2024-12-19  3636  
0f43254763b3a1 Jie Gan             2024-12-19  3637  					apss_funnel1_in3: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3638  						remote-endpoint = <&apss_tpda_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3639  					};
0f43254763b3a1 Jie Gan             2024-12-19  3640  				};
0f43254763b3a1 Jie Gan             2024-12-19  3641  			};
0f43254763b3a1 Jie Gan             2024-12-19  3642  
0f43254763b3a1 Jie Gan             2024-12-19  3643  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3644  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3645  					apss_funnel1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3646  						remote-endpoint = <&funnel1_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3647  					};
0f43254763b3a1 Jie Gan             2024-12-19  3648  				};
0f43254763b3a1 Jie Gan             2024-12-19  3649  			};
0f43254763b3a1 Jie Gan             2024-12-19  3650  		};
0f43254763b3a1 Jie Gan             2024-12-19  3651  
0f43254763b3a1 Jie Gan             2024-12-19  3652  		cti@682b000 {
0f43254763b3a1 Jie Gan             2024-12-19  3653  			compatible = "arm,coresight-cti", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3654  			reg = <0x0 0x0682b000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3655  
0f43254763b3a1 Jie Gan             2024-12-19  3656  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3657  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3658  		};
0f43254763b3a1 Jie Gan             2024-12-19  3659  
0f43254763b3a1 Jie Gan             2024-12-19  3660  		tpdm@6860000 {
0f43254763b3a1 Jie Gan             2024-12-19  3661  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3662  			reg = <0x0 0x06860000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3663  
0f43254763b3a1 Jie Gan             2024-12-19  3664  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3665  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3666  
0f43254763b3a1 Jie Gan             2024-12-19  3667  			qcom,cmb-element-bits = <64>;
0f43254763b3a1 Jie Gan             2024-12-19  3668  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3669  
0f43254763b3a1 Jie Gan             2024-12-19  3670  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3671  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3672  					apss_tpdm3_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3673  						remote-endpoint = <&apss_tpda_in3>;
0f43254763b3a1 Jie Gan             2024-12-19  3674  					};
0f43254763b3a1 Jie Gan             2024-12-19  3675  				};
0f43254763b3a1 Jie Gan             2024-12-19  3676  			};
0f43254763b3a1 Jie Gan             2024-12-19  3677  		};
0f43254763b3a1 Jie Gan             2024-12-19  3678  
0f43254763b3a1 Jie Gan             2024-12-19  3679  		tpdm@6861000 {
0f43254763b3a1 Jie Gan             2024-12-19  3680  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3681  			reg = <0x0 0x06861000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3682  
0f43254763b3a1 Jie Gan             2024-12-19  3683  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3684  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3685  
0f43254763b3a1 Jie Gan             2024-12-19  3686  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3687  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3688  
0f43254763b3a1 Jie Gan             2024-12-19  3689  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3690  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3691  					apss_tpdm4_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3692  						remote-endpoint = <&apss_tpda_in4>;
0f43254763b3a1 Jie Gan             2024-12-19  3693  					};
0f43254763b3a1 Jie Gan             2024-12-19  3694  				};
0f43254763b3a1 Jie Gan             2024-12-19  3695  			};
0f43254763b3a1 Jie Gan             2024-12-19  3696  		};
0f43254763b3a1 Jie Gan             2024-12-19  3697  
0f43254763b3a1 Jie Gan             2024-12-19  3698  		tpda@6863000 {
0f43254763b3a1 Jie Gan             2024-12-19  3699  			compatible = "qcom,coresight-tpda", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3700  			reg = <0x0 0x06863000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3701  
0f43254763b3a1 Jie Gan             2024-12-19  3702  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3703  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3704  
0f43254763b3a1 Jie Gan             2024-12-19  3705  			in-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3706  				#address-cells = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3707  				#size-cells = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3708  
0f43254763b3a1 Jie Gan             2024-12-19  3709  				port@0 {
0f43254763b3a1 Jie Gan             2024-12-19  3710  					reg = <0>;
0f43254763b3a1 Jie Gan             2024-12-19  3711  
0f43254763b3a1 Jie Gan             2024-12-19  3712  					apss_tpda_in0: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3713  						remote-endpoint = <&apss_tpdm0_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3714  					};
0f43254763b3a1 Jie Gan             2024-12-19  3715  				};
0f43254763b3a1 Jie Gan             2024-12-19  3716  
0f43254763b3a1 Jie Gan             2024-12-19  3717  				port@1 {
0f43254763b3a1 Jie Gan             2024-12-19  3718  					reg = <1>;
0f43254763b3a1 Jie Gan             2024-12-19  3719  
0f43254763b3a1 Jie Gan             2024-12-19  3720  					apss_tpda_in1: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3721  						remote-endpoint = <&apss_tpdm1_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3722  					};
0f43254763b3a1 Jie Gan             2024-12-19  3723  				};
0f43254763b3a1 Jie Gan             2024-12-19  3724  
0f43254763b3a1 Jie Gan             2024-12-19  3725  				port@2 {
0f43254763b3a1 Jie Gan             2024-12-19  3726  					reg = <2>;
0f43254763b3a1 Jie Gan             2024-12-19  3727  
0f43254763b3a1 Jie Gan             2024-12-19  3728  					apss_tpda_in2: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3729  						remote-endpoint = <&apss_tpdm2_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3730  					};
0f43254763b3a1 Jie Gan             2024-12-19  3731  				};
0f43254763b3a1 Jie Gan             2024-12-19  3732  
0f43254763b3a1 Jie Gan             2024-12-19  3733  				port@3 {
0f43254763b3a1 Jie Gan             2024-12-19  3734  					reg = <3>;
0f43254763b3a1 Jie Gan             2024-12-19  3735  
0f43254763b3a1 Jie Gan             2024-12-19  3736  					apss_tpda_in3: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3737  						remote-endpoint = <&apss_tpdm3_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3738  					};
0f43254763b3a1 Jie Gan             2024-12-19  3739  				};
0f43254763b3a1 Jie Gan             2024-12-19  3740  
0f43254763b3a1 Jie Gan             2024-12-19  3741  				port@4 {
0f43254763b3a1 Jie Gan             2024-12-19  3742  					reg = <4>;
0f43254763b3a1 Jie Gan             2024-12-19  3743  
0f43254763b3a1 Jie Gan             2024-12-19  3744  					apss_tpda_in4: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3745  						remote-endpoint = <&apss_tpdm4_out>;
0f43254763b3a1 Jie Gan             2024-12-19  3746  					};
0f43254763b3a1 Jie Gan             2024-12-19  3747  				};
0f43254763b3a1 Jie Gan             2024-12-19  3748  			};
0f43254763b3a1 Jie Gan             2024-12-19  3749  
0f43254763b3a1 Jie Gan             2024-12-19  3750  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3751  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3752  					apss_tpda_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3753  						remote-endpoint = <&apss_funnel1_in3>;
0f43254763b3a1 Jie Gan             2024-12-19  3754  					};
0f43254763b3a1 Jie Gan             2024-12-19  3755  				};
0f43254763b3a1 Jie Gan             2024-12-19  3756  			};
0f43254763b3a1 Jie Gan             2024-12-19  3757  		};
0f43254763b3a1 Jie Gan             2024-12-19  3758  
0f43254763b3a1 Jie Gan             2024-12-19  3759  		tpdm@68a0000 {
0f43254763b3a1 Jie Gan             2024-12-19  3760  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3761  			reg = <0x0 0x068a0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3762  
0f43254763b3a1 Jie Gan             2024-12-19  3763  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3764  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3765  
0f43254763b3a1 Jie Gan             2024-12-19  3766  			qcom,cmb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3767  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3768  
0f43254763b3a1 Jie Gan             2024-12-19  3769  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3770  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3771  					apss_tpdm1_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3772  						remote-endpoint = <&apss_tpda_in1>;
0f43254763b3a1 Jie Gan             2024-12-19  3773  					};
0f43254763b3a1 Jie Gan             2024-12-19  3774  				};
0f43254763b3a1 Jie Gan             2024-12-19  3775  			};
0f43254763b3a1 Jie Gan             2024-12-19  3776  		};
0f43254763b3a1 Jie Gan             2024-12-19  3777  
0f43254763b3a1 Jie Gan             2024-12-19  3778  		tpdm@68b0000 {
0f43254763b3a1 Jie Gan             2024-12-19  3779  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3780  			reg = <0x0 0x068b0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3781  
0f43254763b3a1 Jie Gan             2024-12-19  3782  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3783  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3784  
0f43254763b3a1 Jie Gan             2024-12-19  3785  			qcom,cmb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3786  			qcom,cmb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3787  
0f43254763b3a1 Jie Gan             2024-12-19  3788  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3789  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3790  					apss_tpdm0_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3791  						remote-endpoint = <&apss_tpda_in0>;
0f43254763b3a1 Jie Gan             2024-12-19  3792  					};
0f43254763b3a1 Jie Gan             2024-12-19  3793  				};
0f43254763b3a1 Jie Gan             2024-12-19  3794  			};
0f43254763b3a1 Jie Gan             2024-12-19  3795  		};
0f43254763b3a1 Jie Gan             2024-12-19  3796  
0f43254763b3a1 Jie Gan             2024-12-19  3797  		tpdm@68c0000 {
0f43254763b3a1 Jie Gan             2024-12-19  3798  			compatible = "qcom,coresight-tpdm", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3799  			reg = <0x0 0x068c0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3800  
0f43254763b3a1 Jie Gan             2024-12-19  3801  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3802  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3803  
0f43254763b3a1 Jie Gan             2024-12-19  3804  			qcom,dsb-element-bits = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3805  			qcom,dsb-msrs-num = <32>;
0f43254763b3a1 Jie Gan             2024-12-19  3806  
0f43254763b3a1 Jie Gan             2024-12-19  3807  			out-ports {
0f43254763b3a1 Jie Gan             2024-12-19  3808  				port {
0f43254763b3a1 Jie Gan             2024-12-19  3809  					apss_tpdm2_out: endpoint {
0f43254763b3a1 Jie Gan             2024-12-19  3810  						remote-endpoint = <&apss_tpda_in2>;
0f43254763b3a1 Jie Gan             2024-12-19  3811  					};
0f43254763b3a1 Jie Gan             2024-12-19  3812  				};
0f43254763b3a1 Jie Gan             2024-12-19  3813  			};
0f43254763b3a1 Jie Gan             2024-12-19  3814  		};
0f43254763b3a1 Jie Gan             2024-12-19  3815  
0f43254763b3a1 Jie Gan             2024-12-19  3816  		cti@68e0000 {
0f43254763b3a1 Jie Gan             2024-12-19  3817  			compatible = "arm,coresight-cti", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3818  			reg = <0x0 0x068e0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3819  
0f43254763b3a1 Jie Gan             2024-12-19  3820  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3821  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3822  		};
0f43254763b3a1 Jie Gan             2024-12-19  3823  
0f43254763b3a1 Jie Gan             2024-12-19  3824  		cti@68f0000 {
0f43254763b3a1 Jie Gan             2024-12-19  3825  			compatible = "arm,coresight-cti", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3826  			reg = <0x0 0x068f0000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3827  
0f43254763b3a1 Jie Gan             2024-12-19  3828  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3829  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3830  		};
0f43254763b3a1 Jie Gan             2024-12-19  3831  
0f43254763b3a1 Jie Gan             2024-12-19  3832  		cti@6900000 {
0f43254763b3a1 Jie Gan             2024-12-19  3833  			compatible = "arm,coresight-cti", "arm,primecell";
0f43254763b3a1 Jie Gan             2024-12-19  3834  			reg = <0x0 0x06900000 0x0 0x1000>;
0f43254763b3a1 Jie Gan             2024-12-19  3835  
0f43254763b3a1 Jie Gan             2024-12-19  3836  			clocks = <&aoss_qmp>;
0f43254763b3a1 Jie Gan             2024-12-19  3837  			clock-names = "apb_pclk";
0f43254763b3a1 Jie Gan             2024-12-19  3838  		};
0f43254763b3a1 Jie Gan             2024-12-19  3839  
f5b34d39e28115 Sayali Lokhande     2025-06-12 @3840  		sdhc_1: mmc@87C4000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
