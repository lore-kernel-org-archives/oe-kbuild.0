Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23922B641
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 05:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729833294; cv=none; b=G/KpcQrEV/SdQczzZclMyKNHWc39cKDhhZ5Ea7NaMwCAxGSCQTC8DcvdUy8HY4BDCGlGOwBw9XaDyk6U9dil7zl/k8iTh1SUxSP+DGdXl/RsML+iUc1/sJRCVjtaFSb+ASZOdTmSKvVFaUPfAD6khPewwQuPPkEVwtBt/Necw4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729833294; c=relaxed/simple;
	bh=81UDC9EZndsjlQkSBTe5cB5S35xQUdixMuhGu51WcG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIFFBQ/cceDzImODWoQgUm5w3Dk5aJtmdr8kT48DxNqzYeq8/fIYqkbF3BpivNnYsxIxbSiT6LHVIoxsOJ9fmqCvAdrpc16bboX0py/6YURvLTwrvDcAJwDXohrEczgoNlG7on8VqP8rHyyoFBeKatIqAZjSY3dFR1+8feMwrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZD1Eoi5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZD1Eoi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729833285; x=1761369285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=81UDC9EZndsjlQkSBTe5cB5S35xQUdixMuhGu51WcG8=;
  b=DZD1Eoi5P8VgNcbI70uCaVcCgWfCOgyqmdSyL2ZMmjtPd3sZ/t3155oo
   D9cMIpKANtqG8NuspaJINYM6I307WJC26JHdXL44l9QuS9r3p2/dR9eL6
   vXUpK4Lr/gpHQUNhnqgFOzoi6NK6UKXiAz1CxkbRS6+OsHQ7UJ4C2mHek
   GNtB0xr+gY/Q2n58NoloKpZG64CSDScEXEhJ8j4MDXRu4ZaMnxOpXCluF
   RXhy3LfGmJsoZk7MutVahXF8VJWyV/7VT5LeZ2XoLObTWE4NqOLY8aB8f
   jixpr3USAh9gxNYrOj9VRUp4H06t1Kne9P4N3yyIYBJucGfHktzv3Ffif
   A==;
X-CSE-ConnectionGUID: PUD1e1y5TsGtP+G2tt8tFw==
X-CSE-MsgGUID: 2ii7D7pERgixoDtzF8LG9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29610639"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="29610639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:14:44 -0700
X-CSE-ConnectionGUID: jc+3BP6KSgyDDZRpkBOVBw==
X-CSE-MsgGUID: SjGUJ7VIQbSYjPNBzscEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="84774212"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 22:14:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Cel-000XcO-32;
	Fri, 25 Oct 2024 05:14:39 +0000
Date: Fri, 25 Oct 2024 13:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 14/14] arm64: dts: qcom: Add Xiaomi Redmi 5A
Message-ID: <202410251217.VL3QB0gF-lkp@intel.com>
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
In-Reply-To: <20241019-msm8917-v1-14-f1f3ca1d88e5@mainlining.org>
References: <20241019-msm8917-v1-14-f1f3ca1d88e5@mainlining.org>
TO: "Barnabás Czémán" <barnabas.czeman@mainlining.org>

Hi Barnabás,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f2493655d2d3d5c6958ed996b043c821c23ae8d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Barnab-s-Cz-m-n/dt-bindings-pinctrl-qcom-pmic-gpio-add-PM8937/20241019-195603
base:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
patch link:    https://lore.kernel.org/r/20241019-msm8917-v1-14-f1f3ca1d88e5%40mainlining.org
patch subject: [PATCH RFC 14/14] arm64: dts: qcom: Add Xiaomi Redmi 5A
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410251217.VL3QB0gF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251217.VL3QB0gF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410251217.VL3QB0gF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:513.13-518.5: Warning (simple_bus_reg): /soc@0/rng@22000: simple-bus unit address format error, expected "e3000"
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:590.29-623.5: Warning (simple_bus_reg): /soc@0/iommu@1e00000: simple-bus unit address format error, expected "1e20000"
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:625.28-643.5: Warning (simple_bus_reg): /soc@0/iommu@1f00000: simple-bus unit address format error, expected "1f08000"
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:1147.37-1210.5: Warning (simple_bus_reg): /soc@0/remoteproc@a21b000: simple-bus unit address format error, expected "a204000"
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:705.27-769.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/pm8937.dtsi:206.9-215.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:692.11-702.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/e3000 +513 arch/arm64/boot/dts/qcom/msm8917.dtsi

23825a1c0be133 Otto Pflüger 2024-10-19    10  
23825a1c0be133 Otto Pflüger 2024-10-19    11  / {
23825a1c0be133 Otto Pflüger 2024-10-19    12  	interrupt-parent = <&intc>;
23825a1c0be133 Otto Pflüger 2024-10-19    13  
23825a1c0be133 Otto Pflüger 2024-10-19    14  	#address-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19    15  	#size-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19    16  
23825a1c0be133 Otto Pflüger 2024-10-19    17  	aliases {
23825a1c0be133 Otto Pflüger 2024-10-19    18  		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
23825a1c0be133 Otto Pflüger 2024-10-19    19  		mmc1 = &sdhc_2; /* SDC2 SD card slot */
23825a1c0be133 Otto Pflüger 2024-10-19    20  	};
23825a1c0be133 Otto Pflüger 2024-10-19    21  
23825a1c0be133 Otto Pflüger 2024-10-19    22  	chosen { };
23825a1c0be133 Otto Pflüger 2024-10-19    23  
23825a1c0be133 Otto Pflüger 2024-10-19    24  	memory@80000000 {
23825a1c0be133 Otto Pflüger 2024-10-19    25  		device_type = "memory";
23825a1c0be133 Otto Pflüger 2024-10-19    26  		/* We expect the bootloader to fill in the reg */
23825a1c0be133 Otto Pflüger 2024-10-19    27  		reg = <0 0x80000000 0 0>;
23825a1c0be133 Otto Pflüger 2024-10-19    28  	};
23825a1c0be133 Otto Pflüger 2024-10-19    29  
23825a1c0be133 Otto Pflüger 2024-10-19    30  	reserved-memory {
23825a1c0be133 Otto Pflüger 2024-10-19    31  		#address-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19    32  		#size-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19    33  		ranges;
23825a1c0be133 Otto Pflüger 2024-10-19    34  
23825a1c0be133 Otto Pflüger 2024-10-19    35  		reserved@85b00000 {
23825a1c0be133 Otto Pflüger 2024-10-19    36  			reg = <0x0 0x85b00000 0x0 0x800000>;
23825a1c0be133 Otto Pflüger 2024-10-19    37  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    38  		};
23825a1c0be133 Otto Pflüger 2024-10-19    39  
23825a1c0be133 Otto Pflüger 2024-10-19    40  		smem@86300000 {
23825a1c0be133 Otto Pflüger 2024-10-19    41  			compatible = "qcom,smem";
23825a1c0be133 Otto Pflüger 2024-10-19    42  			reg = <0x0 0x86300000 0x0 0x100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    43  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    44  
23825a1c0be133 Otto Pflüger 2024-10-19    45  			hwlocks = <&tcsr_mutex 3>;
23825a1c0be133 Otto Pflüger 2024-10-19    46  			qcom,rpm-msg-ram = <&rpm_msg_ram>;
23825a1c0be133 Otto Pflüger 2024-10-19    47  		};
23825a1c0be133 Otto Pflüger 2024-10-19    48  
23825a1c0be133 Otto Pflüger 2024-10-19    49  		reserved@86400000 {
23825a1c0be133 Otto Pflüger 2024-10-19    50  			reg = <0x0 0x86400000 0x0 0x400000>;
23825a1c0be133 Otto Pflüger 2024-10-19    51  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    52  		};
23825a1c0be133 Otto Pflüger 2024-10-19    53  
23825a1c0be133 Otto Pflüger 2024-10-19    54  		mpss_mem: mpss@86800000 {
23825a1c0be133 Otto Pflüger 2024-10-19    55  			/*
23825a1c0be133 Otto Pflüger 2024-10-19    56  			 * The memory region for the mpss firmware is generally
23825a1c0be133 Otto Pflüger 2024-10-19    57  			 * relocatable and could be allocated dynamically.
23825a1c0be133 Otto Pflüger 2024-10-19    58  			 * However, many firmware versions tend to fail when
23825a1c0be133 Otto Pflüger 2024-10-19    59  			 * loaded to some special addresses, so it is hard to
23825a1c0be133 Otto Pflüger 2024-10-19    60  			 * define reliable alloc-ranges.
23825a1c0be133 Otto Pflüger 2024-10-19    61  			 *
23825a1c0be133 Otto Pflüger 2024-10-19    62  			 * alignment = <0x0 0x400000>;
23825a1c0be133 Otto Pflüger 2024-10-19    63  			 * alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
23825a1c0be133 Otto Pflüger 2024-10-19    64  			 */
23825a1c0be133 Otto Pflüger 2024-10-19    65  			reg = <0x0 0x86800000 0x0 0>; /* size is device-specific */
23825a1c0be133 Otto Pflüger 2024-10-19    66  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    67  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19    68  		};
23825a1c0be133 Otto Pflüger 2024-10-19    69  
23825a1c0be133 Otto Pflüger 2024-10-19    70  		adsp_mem: adsp {
23825a1c0be133 Otto Pflüger 2024-10-19    71  			size = <0x0 0x1100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    72  			alignment = <0x0 0x100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    73  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
23825a1c0be133 Otto Pflüger 2024-10-19    74  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    75  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19    76  		};
23825a1c0be133 Otto Pflüger 2024-10-19    77  
23825a1c0be133 Otto Pflüger 2024-10-19    78  		wcnss_mem: wcnss {
23825a1c0be133 Otto Pflüger 2024-10-19    79  			size = <0x0 0x700000>;
23825a1c0be133 Otto Pflüger 2024-10-19    80  			alignment = <0x0 0x100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    81  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
23825a1c0be133 Otto Pflüger 2024-10-19    82  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    83  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19    84  		};
23825a1c0be133 Otto Pflüger 2024-10-19    85  
23825a1c0be133 Otto Pflüger 2024-10-19    86  		venus_mem: venus {
23825a1c0be133 Otto Pflüger 2024-10-19    87  			size = <0x0 0x400000>;
23825a1c0be133 Otto Pflüger 2024-10-19    88  			alignment = <0x0 0x100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    89  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
23825a1c0be133 Otto Pflüger 2024-10-19    90  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    91  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19    92  		};
23825a1c0be133 Otto Pflüger 2024-10-19    93  
23825a1c0be133 Otto Pflüger 2024-10-19    94  		mba_mem: mba {
23825a1c0be133 Otto Pflüger 2024-10-19    95  			size = <0x0 0x100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    96  			alignment = <0x0 0x100000>;
23825a1c0be133 Otto Pflüger 2024-10-19    97  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
23825a1c0be133 Otto Pflüger 2024-10-19    98  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19    99  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   100  		};
23825a1c0be133 Otto Pflüger 2024-10-19   101  
23825a1c0be133 Otto Pflüger 2024-10-19   102  		rmtfs@92100000 {
23825a1c0be133 Otto Pflüger 2024-10-19   103  			compatible = "qcom,rmtfs-mem";
23825a1c0be133 Otto Pflüger 2024-10-19   104  			reg = <0x0 0x92100000 0x0 0x180000>;
23825a1c0be133 Otto Pflüger 2024-10-19   105  			no-map;
23825a1c0be133 Otto Pflüger 2024-10-19   106  
23825a1c0be133 Otto Pflüger 2024-10-19   107  			qcom,client-id = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   108  		};
23825a1c0be133 Otto Pflüger 2024-10-19   109  	};
23825a1c0be133 Otto Pflüger 2024-10-19   110  
23825a1c0be133 Otto Pflüger 2024-10-19   111  	cpus {
23825a1c0be133 Otto Pflüger 2024-10-19   112  		#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   113  		#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   114  
23825a1c0be133 Otto Pflüger 2024-10-19   115  		CPU0: cpu@0 {
23825a1c0be133 Otto Pflüger 2024-10-19   116  			device_type = "cpu";
23825a1c0be133 Otto Pflüger 2024-10-19   117  			compatible = "arm,cortex-a53";
23825a1c0be133 Otto Pflüger 2024-10-19   118  			reg = <0x100>;
23825a1c0be133 Otto Pflüger 2024-10-19   119  			next-level-cache = <&L2_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   120  			enable-method = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   121  			clocks = <&apcs>;
23825a1c0be133 Otto Pflüger 2024-10-19   122  			operating-points-v2 = <&cpu_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   123  			#cooling-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   124  			power-domains = <&CPU_PD0>;
23825a1c0be133 Otto Pflüger 2024-10-19   125  			power-domain-names = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   126  		};
23825a1c0be133 Otto Pflüger 2024-10-19   127  
23825a1c0be133 Otto Pflüger 2024-10-19   128  		CPU1: cpu@1 {
23825a1c0be133 Otto Pflüger 2024-10-19   129  			device_type = "cpu";
23825a1c0be133 Otto Pflüger 2024-10-19   130  			compatible = "arm,cortex-a53";
23825a1c0be133 Otto Pflüger 2024-10-19   131  			reg = <0x101>;
23825a1c0be133 Otto Pflüger 2024-10-19   132  			next-level-cache = <&L2_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   133  			enable-method = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   134  			clocks = <&apcs>;
23825a1c0be133 Otto Pflüger 2024-10-19   135  			operating-points-v2 = <&cpu_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   136  			#cooling-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   137  			power-domains = <&CPU_PD1>;
23825a1c0be133 Otto Pflüger 2024-10-19   138  			power-domain-names = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   139  		};
23825a1c0be133 Otto Pflüger 2024-10-19   140  
23825a1c0be133 Otto Pflüger 2024-10-19   141  		CPU2: cpu@2 {
23825a1c0be133 Otto Pflüger 2024-10-19   142  			device_type = "cpu";
23825a1c0be133 Otto Pflüger 2024-10-19   143  			compatible = "arm,cortex-a53";
23825a1c0be133 Otto Pflüger 2024-10-19   144  			reg = <0x102>;
23825a1c0be133 Otto Pflüger 2024-10-19   145  			next-level-cache = <&L2_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   146  			enable-method = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   147  			clocks = <&apcs>;
23825a1c0be133 Otto Pflüger 2024-10-19   148  			operating-points-v2 = <&cpu_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   149  			#cooling-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   150  			power-domains = <&CPU_PD2>;
23825a1c0be133 Otto Pflüger 2024-10-19   151  			power-domain-names = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   152  		};
23825a1c0be133 Otto Pflüger 2024-10-19   153  
23825a1c0be133 Otto Pflüger 2024-10-19   154  		CPU3: cpu@3 {
23825a1c0be133 Otto Pflüger 2024-10-19   155  			device_type = "cpu";
23825a1c0be133 Otto Pflüger 2024-10-19   156  			compatible = "arm,cortex-a53";
23825a1c0be133 Otto Pflüger 2024-10-19   157  			reg = <0x103>;
23825a1c0be133 Otto Pflüger 2024-10-19   158  			next-level-cache = <&L2_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   159  			enable-method = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   160  			clocks = <&apcs>;
23825a1c0be133 Otto Pflüger 2024-10-19   161  			operating-points-v2 = <&cpu_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   162  			#cooling-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   163  			power-domains = <&CPU_PD3>;
23825a1c0be133 Otto Pflüger 2024-10-19   164  			power-domain-names = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   165  		};
23825a1c0be133 Otto Pflüger 2024-10-19   166  
23825a1c0be133 Otto Pflüger 2024-10-19   167  		L2_0: l2-cache {
23825a1c0be133 Otto Pflüger 2024-10-19   168  			compatible = "cache";
23825a1c0be133 Otto Pflüger 2024-10-19   169  			cache-level = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   170  			cache-unified;
23825a1c0be133 Otto Pflüger 2024-10-19   171  		};
23825a1c0be133 Otto Pflüger 2024-10-19   172  
23825a1c0be133 Otto Pflüger 2024-10-19   173  		cpu-map {
23825a1c0be133 Otto Pflüger 2024-10-19   174  			cluster0 {
23825a1c0be133 Otto Pflüger 2024-10-19   175  				core0 {
23825a1c0be133 Otto Pflüger 2024-10-19   176  					cpu = <&CPU0>;
23825a1c0be133 Otto Pflüger 2024-10-19   177  				};
23825a1c0be133 Otto Pflüger 2024-10-19   178  
23825a1c0be133 Otto Pflüger 2024-10-19   179  				core1 {
23825a1c0be133 Otto Pflüger 2024-10-19   180  					cpu = <&CPU1>;
23825a1c0be133 Otto Pflüger 2024-10-19   181  				};
23825a1c0be133 Otto Pflüger 2024-10-19   182  
23825a1c0be133 Otto Pflüger 2024-10-19   183  				core2 {
23825a1c0be133 Otto Pflüger 2024-10-19   184  					cpu = <&CPU2>;
23825a1c0be133 Otto Pflüger 2024-10-19   185  				};
23825a1c0be133 Otto Pflüger 2024-10-19   186  
23825a1c0be133 Otto Pflüger 2024-10-19   187  				core3 {
23825a1c0be133 Otto Pflüger 2024-10-19   188  					cpu = <&CPU3>;
23825a1c0be133 Otto Pflüger 2024-10-19   189  				};
23825a1c0be133 Otto Pflüger 2024-10-19   190  			};
23825a1c0be133 Otto Pflüger 2024-10-19   191  		};
23825a1c0be133 Otto Pflüger 2024-10-19   192  
23825a1c0be133 Otto Pflüger 2024-10-19   193  		idle-states {
23825a1c0be133 Otto Pflüger 2024-10-19   194  			entry-method = "psci";
23825a1c0be133 Otto Pflüger 2024-10-19   195  
23825a1c0be133 Otto Pflüger 2024-10-19   196  			CPU_SLEEP_0: cpu-sleep-0 {
23825a1c0be133 Otto Pflüger 2024-10-19   197  				compatible = "arm,idle-state";
23825a1c0be133 Otto Pflüger 2024-10-19   198  				idle-state-name = "standalone-power-collapse";
23825a1c0be133 Otto Pflüger 2024-10-19   199  				arm,psci-suspend-param = <0x40000003>;
23825a1c0be133 Otto Pflüger 2024-10-19   200  				entry-latency-us = <125>;
23825a1c0be133 Otto Pflüger 2024-10-19   201  				exit-latency-us = <180>;
23825a1c0be133 Otto Pflüger 2024-10-19   202  				min-residency-us = <595>;
23825a1c0be133 Otto Pflüger 2024-10-19   203  				local-timer-stop;
23825a1c0be133 Otto Pflüger 2024-10-19   204  			};
23825a1c0be133 Otto Pflüger 2024-10-19   205  		};
23825a1c0be133 Otto Pflüger 2024-10-19   206  
23825a1c0be133 Otto Pflüger 2024-10-19   207  		domain-idle-states {
23825a1c0be133 Otto Pflüger 2024-10-19   208  			CLUSTER_PWRDN: cluster-gdhs {
23825a1c0be133 Otto Pflüger 2024-10-19   209  				compatible = "domain-idle-state";
23825a1c0be133 Otto Pflüger 2024-10-19   210  				arm,psci-suspend-param = <0x41000043>;
23825a1c0be133 Otto Pflüger 2024-10-19   211  				entry-latency-us = <240>;
23825a1c0be133 Otto Pflüger 2024-10-19   212  				exit-latency-us = <280>;
23825a1c0be133 Otto Pflüger 2024-10-19   213  				min-residency-us = <806>;
23825a1c0be133 Otto Pflüger 2024-10-19   214  			};
23825a1c0be133 Otto Pflüger 2024-10-19   215  
23825a1c0be133 Otto Pflüger 2024-10-19   216  			CLUSTER_RET: cluster-retention {
23825a1c0be133 Otto Pflüger 2024-10-19   217  				compatible = "domain-idle-state";
23825a1c0be133 Otto Pflüger 2024-10-19   218  				arm,psci-suspend-param = <0x41000023>;
23825a1c0be133 Otto Pflüger 2024-10-19   219  				entry-latency-us = <700>;
23825a1c0be133 Otto Pflüger 2024-10-19   220  				exit-latency-us = <650>;
23825a1c0be133 Otto Pflüger 2024-10-19   221  				min-residency-us = <1972>;
23825a1c0be133 Otto Pflüger 2024-10-19   222  			};
23825a1c0be133 Otto Pflüger 2024-10-19   223  
23825a1c0be133 Otto Pflüger 2024-10-19   224  			CLUSTER_PC: cluster-power-collapse {
23825a1c0be133 Otto Pflüger 2024-10-19   225  				compatible = "domain-idle-state";
23825a1c0be133 Otto Pflüger 2024-10-19   226  				arm,psci-suspend-param = <0x41000053>;
23825a1c0be133 Otto Pflüger 2024-10-19   227  				entry-latency-us = <700>;
23825a1c0be133 Otto Pflüger 2024-10-19   228  				exit-latency-us = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   229  				min-residency-us = <6500>;
23825a1c0be133 Otto Pflüger 2024-10-19   230  			};
23825a1c0be133 Otto Pflüger 2024-10-19   231  		};
23825a1c0be133 Otto Pflüger 2024-10-19   232  	};
23825a1c0be133 Otto Pflüger 2024-10-19   233  
23825a1c0be133 Otto Pflüger 2024-10-19   234  	cpu_opp_table: opp-table-cpu {
23825a1c0be133 Otto Pflüger 2024-10-19   235  		compatible = "operating-points-v2";
23825a1c0be133 Otto Pflüger 2024-10-19   236  		opp-shared;
23825a1c0be133 Otto Pflüger 2024-10-19   237  
23825a1c0be133 Otto Pflüger 2024-10-19   238  		opp-960000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   239  			opp-hz = /bits/ 64 <960000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   240  		};
23825a1c0be133 Otto Pflüger 2024-10-19   241  
23825a1c0be133 Otto Pflüger 2024-10-19   242  		opp-1094400000 {
23825a1c0be133 Otto Pflüger 2024-10-19   243  			opp-hz = /bits/ 64 <1094400000>;
23825a1c0be133 Otto Pflüger 2024-10-19   244  		};
23825a1c0be133 Otto Pflüger 2024-10-19   245  
23825a1c0be133 Otto Pflüger 2024-10-19   246  		opp-1248000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   247  			opp-hz = /bits/ 64 <1248000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   248  		};
23825a1c0be133 Otto Pflüger 2024-10-19   249  
23825a1c0be133 Otto Pflüger 2024-10-19   250  		opp-1401600000 {
23825a1c0be133 Otto Pflüger 2024-10-19   251  			opp-hz = /bits/ 64 <1401600000>;
23825a1c0be133 Otto Pflüger 2024-10-19   252  		};
23825a1c0be133 Otto Pflüger 2024-10-19   253  	};
23825a1c0be133 Otto Pflüger 2024-10-19   254  
23825a1c0be133 Otto Pflüger 2024-10-19   255  	timer {
23825a1c0be133 Otto Pflüger 2024-10-19   256  		compatible = "arm,armv8-timer";
23825a1c0be133 Otto Pflüger 2024-10-19   257  		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
23825a1c0be133 Otto Pflüger 2024-10-19   258  			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
23825a1c0be133 Otto Pflüger 2024-10-19   259  			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
23825a1c0be133 Otto Pflüger 2024-10-19   260  			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
23825a1c0be133 Otto Pflüger 2024-10-19   261  		clock-frequency = <19200000>;
23825a1c0be133 Otto Pflüger 2024-10-19   262  	};
23825a1c0be133 Otto Pflüger 2024-10-19   263  
23825a1c0be133 Otto Pflüger 2024-10-19   264  	clocks {
23825a1c0be133 Otto Pflüger 2024-10-19   265  		xo_board: xo-board {
23825a1c0be133 Otto Pflüger 2024-10-19   266  			compatible = "fixed-clock";
23825a1c0be133 Otto Pflüger 2024-10-19   267  			#clock-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   268  			clock-frequency = <19200000>;
23825a1c0be133 Otto Pflüger 2024-10-19   269  			clock-output-names = "xo";
23825a1c0be133 Otto Pflüger 2024-10-19   270  		};
23825a1c0be133 Otto Pflüger 2024-10-19   271  
23825a1c0be133 Otto Pflüger 2024-10-19   272  		sleep_clk: sleep-clk {
23825a1c0be133 Otto Pflüger 2024-10-19   273  			compatible = "fixed-clock";
23825a1c0be133 Otto Pflüger 2024-10-19   274  			#clock-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   275  			clock-frequency = <32768>;
23825a1c0be133 Otto Pflüger 2024-10-19   276  			clock-output-names = "sleep_clk";
23825a1c0be133 Otto Pflüger 2024-10-19   277  		};
23825a1c0be133 Otto Pflüger 2024-10-19   278  	};
23825a1c0be133 Otto Pflüger 2024-10-19   279  
23825a1c0be133 Otto Pflüger 2024-10-19   280  	firmware {
23825a1c0be133 Otto Pflüger 2024-10-19   281  		scm: scm {
23825a1c0be133 Otto Pflüger 2024-10-19   282  			compatible = "qcom,scm-msm8916", "qcom,scm";
23825a1c0be133 Otto Pflüger 2024-10-19   283  			clocks = <&gcc GCC_CRYPTO_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   284  				 <&gcc GCC_CRYPTO_AXI_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   285  				 <&gcc GCC_CRYPTO_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   286  			clock-names = "core", "bus", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19   287  			#reset-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   288  
23825a1c0be133 Otto Pflüger 2024-10-19   289  			qcom,dload-mode = <&tcsr 0x6100>;
23825a1c0be133 Otto Pflüger 2024-10-19   290  		};
23825a1c0be133 Otto Pflüger 2024-10-19   291  	};
23825a1c0be133 Otto Pflüger 2024-10-19   292  
23825a1c0be133 Otto Pflüger 2024-10-19   293  	pmu {
23825a1c0be133 Otto Pflüger 2024-10-19   294  		compatible = "arm,cortex-a53-pmu";
23825a1c0be133 Otto Pflüger 2024-10-19   295  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
23825a1c0be133 Otto Pflüger 2024-10-19   296  	};
23825a1c0be133 Otto Pflüger 2024-10-19   297  
23825a1c0be133 Otto Pflüger 2024-10-19   298  	psci {
23825a1c0be133 Otto Pflüger 2024-10-19   299  		compatible = "arm,psci-1.0";
23825a1c0be133 Otto Pflüger 2024-10-19   300  		method = "smc";
23825a1c0be133 Otto Pflüger 2024-10-19   301  
23825a1c0be133 Otto Pflüger 2024-10-19   302  		CPU_PD0: power-domain-cpu0 {
23825a1c0be133 Otto Pflüger 2024-10-19   303  			#power-domain-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   304  			power-domains = <&CLUSTER_PD>;
23825a1c0be133 Otto Pflüger 2024-10-19   305  			domain-idle-states = <&CPU_SLEEP_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   306  		};
23825a1c0be133 Otto Pflüger 2024-10-19   307  
23825a1c0be133 Otto Pflüger 2024-10-19   308  		CPU_PD1: power-domain-cpu1 {
23825a1c0be133 Otto Pflüger 2024-10-19   309  			#power-domain-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   310  			power-domains = <&CLUSTER_PD>;
23825a1c0be133 Otto Pflüger 2024-10-19   311  			domain-idle-states = <&CPU_SLEEP_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   312  		};
23825a1c0be133 Otto Pflüger 2024-10-19   313  
23825a1c0be133 Otto Pflüger 2024-10-19   314  		CPU_PD2: power-domain-cpu2 {
23825a1c0be133 Otto Pflüger 2024-10-19   315  			#power-domain-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   316  			power-domains = <&CLUSTER_PD>;
23825a1c0be133 Otto Pflüger 2024-10-19   317  			domain-idle-states = <&CPU_SLEEP_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   318  		};
23825a1c0be133 Otto Pflüger 2024-10-19   319  
23825a1c0be133 Otto Pflüger 2024-10-19   320  		CPU_PD3: power-domain-cpu3 {
23825a1c0be133 Otto Pflüger 2024-10-19   321  			#power-domain-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   322  			power-domains = <&CLUSTER_PD>;
23825a1c0be133 Otto Pflüger 2024-10-19   323  			domain-idle-states = <&CPU_SLEEP_0>;
23825a1c0be133 Otto Pflüger 2024-10-19   324  		};
23825a1c0be133 Otto Pflüger 2024-10-19   325  
23825a1c0be133 Otto Pflüger 2024-10-19   326  		CLUSTER_PD: power-domain-cluster {
23825a1c0be133 Otto Pflüger 2024-10-19   327  			#power-domain-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   328  			domain-idle-states = <&CLUSTER_PWRDN>, <&CLUSTER_RET>, <&CLUSTER_PC>;
23825a1c0be133 Otto Pflüger 2024-10-19   329  		};
23825a1c0be133 Otto Pflüger 2024-10-19   330  	};
23825a1c0be133 Otto Pflüger 2024-10-19   331  
23825a1c0be133 Otto Pflüger 2024-10-19   332  	rpm: remoteproc {
23825a1c0be133 Otto Pflüger 2024-10-19   333  		compatible = "qcom,msm8917-rpm-proc", "qcom,rpm-proc";
23825a1c0be133 Otto Pflüger 2024-10-19   334  
23825a1c0be133 Otto Pflüger 2024-10-19   335  		smd-edge {
23825a1c0be133 Otto Pflüger 2024-10-19   336  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19   337  			qcom,ipc = <&apcs 8 0>;
23825a1c0be133 Otto Pflüger 2024-10-19   338  			qcom,smd-edge = <15>;
23825a1c0be133 Otto Pflüger 2024-10-19   339  
23825a1c0be133 Otto Pflüger 2024-10-19   340  			rpm_requests: rpm-requests {
23825a1c0be133 Otto Pflüger 2024-10-19   341  				compatible = "qcom,rpm-msm8917", "qcom,smd-rpm";
23825a1c0be133 Otto Pflüger 2024-10-19   342  				qcom,smd-channels = "rpm_requests";
23825a1c0be133 Otto Pflüger 2024-10-19   343  
23825a1c0be133 Otto Pflüger 2024-10-19   344  				rpmcc: clock-controller {
23825a1c0be133 Otto Pflüger 2024-10-19   345  					compatible = "qcom,rpmcc-msm8917", "qcom,rpmcc";
23825a1c0be133 Otto Pflüger 2024-10-19   346  					#clock-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   347  					clocks = <&xo_board>;
23825a1c0be133 Otto Pflüger 2024-10-19   348  					clock-names = "xo";
23825a1c0be133 Otto Pflüger 2024-10-19   349  				};
23825a1c0be133 Otto Pflüger 2024-10-19   350  
23825a1c0be133 Otto Pflüger 2024-10-19   351  				rpmpd: power-controller {
23825a1c0be133 Otto Pflüger 2024-10-19   352  					compatible = "qcom,msm8917-rpmpd";
23825a1c0be133 Otto Pflüger 2024-10-19   353  					#power-domain-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   354  					operating-points-v2 = <&rpmpd_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   355  
23825a1c0be133 Otto Pflüger 2024-10-19   356  					rpmpd_opp_table: opp-table {
23825a1c0be133 Otto Pflüger 2024-10-19   357  						compatible = "operating-points-v2";
23825a1c0be133 Otto Pflüger 2024-10-19   358  
23825a1c0be133 Otto Pflüger 2024-10-19   359  						rpmpd_opp_ret: opp1 {
23825a1c0be133 Otto Pflüger 2024-10-19   360  							opp-level = <RPM_SMD_LEVEL_RETENTION>;
23825a1c0be133 Otto Pflüger 2024-10-19   361  						};
23825a1c0be133 Otto Pflüger 2024-10-19   362  
23825a1c0be133 Otto Pflüger 2024-10-19   363  						rpmpd_opp_ret_plus: opp2 {
23825a1c0be133 Otto Pflüger 2024-10-19   364  							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
23825a1c0be133 Otto Pflüger 2024-10-19   365  						};
23825a1c0be133 Otto Pflüger 2024-10-19   366  
23825a1c0be133 Otto Pflüger 2024-10-19   367  						rpmpd_opp_min_svs: opp3 {
23825a1c0be133 Otto Pflüger 2024-10-19   368  							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
23825a1c0be133 Otto Pflüger 2024-10-19   369  						};
23825a1c0be133 Otto Pflüger 2024-10-19   370  
23825a1c0be133 Otto Pflüger 2024-10-19   371  						rpmpd_opp_low_svs: opp4 {
23825a1c0be133 Otto Pflüger 2024-10-19   372  							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
23825a1c0be133 Otto Pflüger 2024-10-19   373  						};
23825a1c0be133 Otto Pflüger 2024-10-19   374  
23825a1c0be133 Otto Pflüger 2024-10-19   375  						rpmpd_opp_svs: opp5 {
23825a1c0be133 Otto Pflüger 2024-10-19   376  							opp-level = <RPM_SMD_LEVEL_SVS>;
23825a1c0be133 Otto Pflüger 2024-10-19   377  						};
23825a1c0be133 Otto Pflüger 2024-10-19   378  
23825a1c0be133 Otto Pflüger 2024-10-19   379  						rpmpd_opp_svs_plus: opp6 {
23825a1c0be133 Otto Pflüger 2024-10-19   380  							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
23825a1c0be133 Otto Pflüger 2024-10-19   381  						};
23825a1c0be133 Otto Pflüger 2024-10-19   382  
23825a1c0be133 Otto Pflüger 2024-10-19   383  						rpmpd_opp_nom: opp7 {
23825a1c0be133 Otto Pflüger 2024-10-19   384  							opp-level = <RPM_SMD_LEVEL_NOM>;
23825a1c0be133 Otto Pflüger 2024-10-19   385  						};
23825a1c0be133 Otto Pflüger 2024-10-19   386  
23825a1c0be133 Otto Pflüger 2024-10-19   387  						rpmpd_opp_nom_plus: opp8 {
23825a1c0be133 Otto Pflüger 2024-10-19   388  							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
23825a1c0be133 Otto Pflüger 2024-10-19   389  						};
23825a1c0be133 Otto Pflüger 2024-10-19   390  
23825a1c0be133 Otto Pflüger 2024-10-19   391  						rpmpd_opp_turbo: opp9 {
23825a1c0be133 Otto Pflüger 2024-10-19   392  							opp-level = <RPM_SMD_LEVEL_TURBO>;
23825a1c0be133 Otto Pflüger 2024-10-19   393  						};
23825a1c0be133 Otto Pflüger 2024-10-19   394  					};
23825a1c0be133 Otto Pflüger 2024-10-19   395  				};
23825a1c0be133 Otto Pflüger 2024-10-19   396  			};
23825a1c0be133 Otto Pflüger 2024-10-19   397  		};
23825a1c0be133 Otto Pflüger 2024-10-19   398  	};
23825a1c0be133 Otto Pflüger 2024-10-19   399  
23825a1c0be133 Otto Pflüger 2024-10-19   400  	smp2p-adsp {
23825a1c0be133 Otto Pflüger 2024-10-19   401  		compatible = "qcom,smp2p";
23825a1c0be133 Otto Pflüger 2024-10-19   402  		qcom,smem = <443>, <429>;
23825a1c0be133 Otto Pflüger 2024-10-19   403  
23825a1c0be133 Otto Pflüger 2024-10-19   404  		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19   405  
23825a1c0be133 Otto Pflüger 2024-10-19   406  		mboxes = <&apcs 10>;
23825a1c0be133 Otto Pflüger 2024-10-19   407  
23825a1c0be133 Otto Pflüger 2024-10-19   408  		qcom,local-pid = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   409  		qcom,remote-pid = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   410  
23825a1c0be133 Otto Pflüger 2024-10-19   411  		adsp_smp2p_out: master-kernel {
23825a1c0be133 Otto Pflüger 2024-10-19   412  			qcom,entry-name = "master-kernel";
23825a1c0be133 Otto Pflüger 2024-10-19   413  
23825a1c0be133 Otto Pflüger 2024-10-19   414  			#qcom,smem-state-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   415  		};
23825a1c0be133 Otto Pflüger 2024-10-19   416  
23825a1c0be133 Otto Pflüger 2024-10-19   417  		adsp_smp2p_in: slave-kernel {
23825a1c0be133 Otto Pflüger 2024-10-19   418  			qcom,entry-name = "slave-kernel";
23825a1c0be133 Otto Pflüger 2024-10-19   419  
23825a1c0be133 Otto Pflüger 2024-10-19   420  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   421  			#interrupt-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   422  		};
23825a1c0be133 Otto Pflüger 2024-10-19   423  	};
23825a1c0be133 Otto Pflüger 2024-10-19   424  
23825a1c0be133 Otto Pflüger 2024-10-19   425  	smp2p-modem {
23825a1c0be133 Otto Pflüger 2024-10-19   426  		compatible = "qcom,smp2p";
23825a1c0be133 Otto Pflüger 2024-10-19   427  		qcom,smem = <435>, <428>;
23825a1c0be133 Otto Pflüger 2024-10-19   428  
23825a1c0be133 Otto Pflüger 2024-10-19   429  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19   430  
23825a1c0be133 Otto Pflüger 2024-10-19   431  		qcom,ipc = <&apcs 8 14>;
23825a1c0be133 Otto Pflüger 2024-10-19   432  
23825a1c0be133 Otto Pflüger 2024-10-19   433  		qcom,local-pid = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   434  		qcom,remote-pid = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   435  
23825a1c0be133 Otto Pflüger 2024-10-19   436  		modem_smp2p_out: master-kernel {
23825a1c0be133 Otto Pflüger 2024-10-19   437  			qcom,entry-name = "master-kernel";
23825a1c0be133 Otto Pflüger 2024-10-19   438  
23825a1c0be133 Otto Pflüger 2024-10-19   439  			#qcom,smem-state-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   440  		};
23825a1c0be133 Otto Pflüger 2024-10-19   441  
23825a1c0be133 Otto Pflüger 2024-10-19   442  		modem_smp2p_in: slave-kernel {
23825a1c0be133 Otto Pflüger 2024-10-19   443  			qcom,entry-name = "slave-kernel";
23825a1c0be133 Otto Pflüger 2024-10-19   444  
23825a1c0be133 Otto Pflüger 2024-10-19   445  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   446  			#interrupt-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   447  		};
23825a1c0be133 Otto Pflüger 2024-10-19   448  	};
23825a1c0be133 Otto Pflüger 2024-10-19   449  
23825a1c0be133 Otto Pflüger 2024-10-19   450  	smp2p-wcnss {
23825a1c0be133 Otto Pflüger 2024-10-19   451  		compatible = "qcom,smp2p";
23825a1c0be133 Otto Pflüger 2024-10-19   452  		qcom,smem = <451>, <431>;
23825a1c0be133 Otto Pflüger 2024-10-19   453  
23825a1c0be133 Otto Pflüger 2024-10-19   454  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19   455  
23825a1c0be133 Otto Pflüger 2024-10-19   456  		qcom,ipc = <&apcs 8 18>;
23825a1c0be133 Otto Pflüger 2024-10-19   457  
23825a1c0be133 Otto Pflüger 2024-10-19   458  		qcom,local-pid = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   459  		qcom,remote-pid = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19   460  
23825a1c0be133 Otto Pflüger 2024-10-19   461  		wcnss_smp2p_out: master-kernel {
23825a1c0be133 Otto Pflüger 2024-10-19   462  			qcom,entry-name = "master-kernel";
23825a1c0be133 Otto Pflüger 2024-10-19   463  
23825a1c0be133 Otto Pflüger 2024-10-19   464  			#qcom,smem-state-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   465  		};
23825a1c0be133 Otto Pflüger 2024-10-19   466  
23825a1c0be133 Otto Pflüger 2024-10-19   467  		wcnss_smp2p_in: slave-kernel {
23825a1c0be133 Otto Pflüger 2024-10-19   468  			qcom,entry-name = "slave-kernel";
23825a1c0be133 Otto Pflüger 2024-10-19   469  
23825a1c0be133 Otto Pflüger 2024-10-19   470  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   471  			#interrupt-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   472  		};
23825a1c0be133 Otto Pflüger 2024-10-19   473  	};
23825a1c0be133 Otto Pflüger 2024-10-19   474  
23825a1c0be133 Otto Pflüger 2024-10-19   475  	smsm {
23825a1c0be133 Otto Pflüger 2024-10-19   476  		compatible = "qcom,smsm";
23825a1c0be133 Otto Pflüger 2024-10-19   477  
23825a1c0be133 Otto Pflüger 2024-10-19   478  		#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   479  		#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   480  
23825a1c0be133 Otto Pflüger 2024-10-19   481  		qcom,ipc-1 = <&apcs 8 13>;
23825a1c0be133 Otto Pflüger 2024-10-19   482  		qcom,ipc-3 = <&apcs 8 19>;
23825a1c0be133 Otto Pflüger 2024-10-19   483  
23825a1c0be133 Otto Pflüger 2024-10-19   484  		apps_smsm: apps@0 {
23825a1c0be133 Otto Pflüger 2024-10-19   485  			reg = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   486  
23825a1c0be133 Otto Pflüger 2024-10-19   487  			#qcom,smem-state-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   488  		};
23825a1c0be133 Otto Pflüger 2024-10-19   489  
23825a1c0be133 Otto Pflüger 2024-10-19   490  		hexagon_smsm: hexagon@1 {
23825a1c0be133 Otto Pflüger 2024-10-19   491  			reg = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   492  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19   493  
23825a1c0be133 Otto Pflüger 2024-10-19   494  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   495  			#interrupt-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   496  		};
23825a1c0be133 Otto Pflüger 2024-10-19   497  
23825a1c0be133 Otto Pflüger 2024-10-19   498  		wcnss_smsm: wcnss@6 {
23825a1c0be133 Otto Pflüger 2024-10-19   499  			reg = <6>;
23825a1c0be133 Otto Pflüger 2024-10-19   500  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19   501  
23825a1c0be133 Otto Pflüger 2024-10-19   502  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   503  			#interrupt-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   504  		};
23825a1c0be133 Otto Pflüger 2024-10-19   505  	};
23825a1c0be133 Otto Pflüger 2024-10-19   506  
23825a1c0be133 Otto Pflüger 2024-10-19   507  	soc: soc@0 {
23825a1c0be133 Otto Pflüger 2024-10-19   508  		#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   509  		#size-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   510  		ranges = <0 0 0 0xffffffff>;
23825a1c0be133 Otto Pflüger 2024-10-19   511  		compatible = "simple-bus";
23825a1c0be133 Otto Pflüger 2024-10-19   512  
23825a1c0be133 Otto Pflüger 2024-10-19  @513  		rng@22000 {
23825a1c0be133 Otto Pflüger 2024-10-19   514  			compatible = "qcom,prng";
23825a1c0be133 Otto Pflüger 2024-10-19   515  			reg = <0xe3000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   516  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   517  			clock-names = "core";
23825a1c0be133 Otto Pflüger 2024-10-19   518  		};
23825a1c0be133 Otto Pflüger 2024-10-19   519  
23825a1c0be133 Otto Pflüger 2024-10-19   520  		restart@4ab000 {
23825a1c0be133 Otto Pflüger 2024-10-19   521  			compatible = "qcom,pshold";
23825a1c0be133 Otto Pflüger 2024-10-19   522  			reg = <0x004ab000 0x4>;
23825a1c0be133 Otto Pflüger 2024-10-19   523  		};
23825a1c0be133 Otto Pflüger 2024-10-19   524  
23825a1c0be133 Otto Pflüger 2024-10-19   525  		qfprom: qfprom@a4000 {
23825a1c0be133 Otto Pflüger 2024-10-19   526  			compatible = "qcom,msm8917-qfprom", "qcom,qfprom";
23825a1c0be133 Otto Pflüger 2024-10-19   527  			reg = <0x000a4000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   528  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   529  			#size-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   530  			tsens_caldata: caldata@d0 {
23825a1c0be133 Otto Pflüger 2024-10-19   531  				reg = <0x01d8 0x14>;
23825a1c0be133 Otto Pflüger 2024-10-19   532  			};
23825a1c0be133 Otto Pflüger 2024-10-19   533  		};
23825a1c0be133 Otto Pflüger 2024-10-19   534  
23825a1c0be133 Otto Pflüger 2024-10-19   535  		rpm_msg_ram: sram@60000 {
23825a1c0be133 Otto Pflüger 2024-10-19   536  			compatible = "qcom,rpm-msg-ram";
23825a1c0be133 Otto Pflüger 2024-10-19   537  			reg = <0x00060000 0x8000>;
23825a1c0be133 Otto Pflüger 2024-10-19   538  		};
23825a1c0be133 Otto Pflüger 2024-10-19   539  
23825a1c0be133 Otto Pflüger 2024-10-19   540  		tsens: thermal-sensor@4a9000 {
23825a1c0be133 Otto Pflüger 2024-10-19   541  			compatible = "qcom,msm8917-tsens", "qcom,tsens-v1";
23825a1c0be133 Otto Pflüger 2024-10-19   542  			reg = <0x004a9000 0x1000>,
23825a1c0be133 Otto Pflüger 2024-10-19   543  			      <0x004a8000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   544  			nvmem-cells = <&tsens_caldata>;
23825a1c0be133 Otto Pflüger 2024-10-19   545  			nvmem-cell-names = "calib";
23825a1c0be133 Otto Pflüger 2024-10-19   546  			#qcom,sensors = <10>;
23825a1c0be133 Otto Pflüger 2024-10-19   547  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   548  			interrupt-names = "uplow";
23825a1c0be133 Otto Pflüger 2024-10-19   549  			#thermal-sensor-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   550  		};
23825a1c0be133 Otto Pflüger 2024-10-19   551  
23825a1c0be133 Otto Pflüger 2024-10-19   552  		tlmm: pinctrl@1000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   553  			compatible = "qcom,msm8917-pinctrl";
23825a1c0be133 Otto Pflüger 2024-10-19   554  			reg = <0x01000000 0x300000>;
23825a1c0be133 Otto Pflüger 2024-10-19   555  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   556  			gpio-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   557  			gpio-ranges = <&tlmm 0 0 134>;
23825a1c0be133 Otto Pflüger 2024-10-19   558  			#gpio-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   559  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   560  			#interrupt-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   561  		};
23825a1c0be133 Otto Pflüger 2024-10-19   562  
23825a1c0be133 Otto Pflüger 2024-10-19   563  		gcc: clock-controller@1800000 {
23825a1c0be133 Otto Pflüger 2024-10-19   564  			compatible = "qcom,gcc-msm8917";
23825a1c0be133 Otto Pflüger 2024-10-19   565  			#clock-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   566  			#reset-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   567  			#power-domain-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   568  			reg = <0x01800000 0x80000>;
23825a1c0be133 Otto Pflüger 2024-10-19   569  			clocks = <&xo_board>,
23825a1c0be133 Otto Pflüger 2024-10-19   570  				 <&sleep_clk>,
23825a1c0be133 Otto Pflüger 2024-10-19   571  				 <&mdss_dsi0_phy 1>,
23825a1c0be133 Otto Pflüger 2024-10-19   572  				 <&mdss_dsi0_phy 0>;
23825a1c0be133 Otto Pflüger 2024-10-19   573  			clock-names = "xo",
23825a1c0be133 Otto Pflüger 2024-10-19   574  				      "sleep_clk",
23825a1c0be133 Otto Pflüger 2024-10-19   575  				      "dsi0pll",
23825a1c0be133 Otto Pflüger 2024-10-19   576  				      "dsi0pllbyte";
23825a1c0be133 Otto Pflüger 2024-10-19   577  		};
23825a1c0be133 Otto Pflüger 2024-10-19   578  
23825a1c0be133 Otto Pflüger 2024-10-19   579  		tcsr_mutex: hwlock@1905000 {
23825a1c0be133 Otto Pflüger 2024-10-19   580  			compatible = "qcom,tcsr-mutex";
23825a1c0be133 Otto Pflüger 2024-10-19   581  			reg = <0x01905000 0x20000>;
23825a1c0be133 Otto Pflüger 2024-10-19   582  			#hwlock-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   583  		};
23825a1c0be133 Otto Pflüger 2024-10-19   584  
23825a1c0be133 Otto Pflüger 2024-10-19   585  		tcsr: syscon@1937000 {
23825a1c0be133 Otto Pflüger 2024-10-19   586  			compatible = "qcom,tcsr-msm8917", "syscon";
23825a1c0be133 Otto Pflüger 2024-10-19   587  			reg = <0x01937000 0x30000>;
23825a1c0be133 Otto Pflüger 2024-10-19   588  		};
23825a1c0be133 Otto Pflüger 2024-10-19   589  
23825a1c0be133 Otto Pflüger 2024-10-19  @590  		apps_iommu: iommu@1e00000 {
23825a1c0be133 Otto Pflüger 2024-10-19   591  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   592  			#size-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   593  			#iommu-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   594  			compatible = "qcom,msm8917-iommu", "qcom,msm-iommu-v1";
23825a1c0be133 Otto Pflüger 2024-10-19   595  			ranges = <0 0x01e20000 0x20000>;
23825a1c0be133 Otto Pflüger 2024-10-19   596  
23825a1c0be133 Otto Pflüger 2024-10-19   597  			clocks = <&gcc GCC_SMMU_CFG_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   598  				 <&gcc GCC_APSS_TCU_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   599  			clock-names = "iface", "bus";
23825a1c0be133 Otto Pflüger 2024-10-19   600  
23825a1c0be133 Otto Pflüger 2024-10-19   601  			qcom,iommu-secure-id = <17>;
23825a1c0be133 Otto Pflüger 2024-10-19   602  
23825a1c0be133 Otto Pflüger 2024-10-19   603  			/* VFE */
23825a1c0be133 Otto Pflüger 2024-10-19   604  			iommu-ctx@14000 {
23825a1c0be133 Otto Pflüger 2024-10-19   605  				compatible = "qcom,msm-iommu-v1-ns";
23825a1c0be133 Otto Pflüger 2024-10-19   606  				reg = <0x00014000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   607  				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   608  			};
23825a1c0be133 Otto Pflüger 2024-10-19   609  
23825a1c0be133 Otto Pflüger 2024-10-19   610  			/* MDP_0 */
23825a1c0be133 Otto Pflüger 2024-10-19   611  			iommu-ctx@15000 {
23825a1c0be133 Otto Pflüger 2024-10-19   612  				compatible = "qcom,msm-iommu-v1-ns";
23825a1c0be133 Otto Pflüger 2024-10-19   613  				reg = <0x00015000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   614  				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   615  			};
23825a1c0be133 Otto Pflüger 2024-10-19   616  
23825a1c0be133 Otto Pflüger 2024-10-19   617  			/* VENUS_NS */
23825a1c0be133 Otto Pflüger 2024-10-19   618  			iommu-ctx@16000 {
23825a1c0be133 Otto Pflüger 2024-10-19   619  				compatible = "qcom,msm-iommu-v1-ns";
23825a1c0be133 Otto Pflüger 2024-10-19   620  				reg = <0x00016000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   621  				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   622  			};
23825a1c0be133 Otto Pflüger 2024-10-19   623  		};
23825a1c0be133 Otto Pflüger 2024-10-19   624  
23825a1c0be133 Otto Pflüger 2024-10-19  @625  		gpu_iommu: iommu@1f00000 {
23825a1c0be133 Otto Pflüger 2024-10-19   626  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   627  			#size-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   628  			#iommu-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   629  
23825a1c0be133 Otto Pflüger 2024-10-19   630  			compatible = "qcom,msm8917-iommu", "qcom,msm-iommu-v1";
23825a1c0be133 Otto Pflüger 2024-10-19   631  
23825a1c0be133 Otto Pflüger 2024-10-19   632  			ranges = <0 0x01f08000 0x10000>;
23825a1c0be133 Otto Pflüger 2024-10-19   633  			clocks = <&gcc GCC_SMMU_CFG_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   634  				 <&gcc GCC_GFX_TCU_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   635  			clock-names = "iface", "bus";
23825a1c0be133 Otto Pflüger 2024-10-19   636  			qcom,iommu-secure-id = <18>;
23825a1c0be133 Otto Pflüger 2024-10-19   637  
23825a1c0be133 Otto Pflüger 2024-10-19   638  			iommu-ctx@0 {
23825a1c0be133 Otto Pflüger 2024-10-19   639  				compatible = "qcom,msm-iommu-v2-ns";
23825a1c0be133 Otto Pflüger 2024-10-19   640  				reg = <0x0000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   641  				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   642  			};
23825a1c0be133 Otto Pflüger 2024-10-19   643  		};
23825a1c0be133 Otto Pflüger 2024-10-19   644  
23825a1c0be133 Otto Pflüger 2024-10-19   645  		mdss: display-subsystem@1a00000 {
23825a1c0be133 Otto Pflüger 2024-10-19   646  			compatible = "qcom,mdss";
23825a1c0be133 Otto Pflüger 2024-10-19   647  			reg = <0x01a00000 0x1000>,
23825a1c0be133 Otto Pflüger 2024-10-19   648  			      <0x01ab0000 0x1040>;
23825a1c0be133 Otto Pflüger 2024-10-19   649  			reg-names = "mdss_phys", "vbif_phys";
23825a1c0be133 Otto Pflüger 2024-10-19   650  
23825a1c0be133 Otto Pflüger 2024-10-19   651  			power-domains = <&gcc MDSS_GDSC>;
23825a1c0be133 Otto Pflüger 2024-10-19   652  
23825a1c0be133 Otto Pflüger 2024-10-19   653  			clocks = <&gcc GCC_MDSS_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   654  				 <&gcc GCC_MDSS_AXI_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   655  				 <&gcc GCC_MDSS_VSYNC_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   656  			clock-names = "iface",
23825a1c0be133 Otto Pflüger 2024-10-19   657  				      "bus",
23825a1c0be133 Otto Pflüger 2024-10-19   658  				      "vsync";
23825a1c0be133 Otto Pflüger 2024-10-19   659  
23825a1c0be133 Otto Pflüger 2024-10-19   660  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   661  
23825a1c0be133 Otto Pflüger 2024-10-19   662  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   663  			#interrupt-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   664  
23825a1c0be133 Otto Pflüger 2024-10-19   665  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   666  			#size-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   667  			ranges;
23825a1c0be133 Otto Pflüger 2024-10-19   668  
23825a1c0be133 Otto Pflüger 2024-10-19   669  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   670  
23825a1c0be133 Otto Pflüger 2024-10-19   671  			mdp: display-controller@1a01000 {
23825a1c0be133 Otto Pflüger 2024-10-19   672  				compatible = "qcom,msm8917-mdp5", "qcom,mdp5";
23825a1c0be133 Otto Pflüger 2024-10-19   673  				reg = <0x01a01000 0x89000>;
23825a1c0be133 Otto Pflüger 2024-10-19   674  				reg-names = "mdp_phys";
23825a1c0be133 Otto Pflüger 2024-10-19   675  
23825a1c0be133 Otto Pflüger 2024-10-19   676  				interrupt-parent = <&mdss>;
23825a1c0be133 Otto Pflüger 2024-10-19   677  				interrupts = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   678  
23825a1c0be133 Otto Pflüger 2024-10-19   679  				power-domains = <&gcc MDSS_GDSC>;
23825a1c0be133 Otto Pflüger 2024-10-19   680  
23825a1c0be133 Otto Pflüger 2024-10-19   681  				clocks = <&gcc GCC_MDSS_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   682  					 <&gcc GCC_MDSS_AXI_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   683  					 <&gcc GCC_MDSS_MDP_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   684  					 <&gcc GCC_MDSS_VSYNC_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   685  				clock-names = "iface",
23825a1c0be133 Otto Pflüger 2024-10-19   686  					      "bus",
23825a1c0be133 Otto Pflüger 2024-10-19   687  					      "core",
23825a1c0be133 Otto Pflüger 2024-10-19   688  					      "vsync";
23825a1c0be133 Otto Pflüger 2024-10-19   689  
23825a1c0be133 Otto Pflüger 2024-10-19   690  				iommus = <&apps_iommu 0x15>;
23825a1c0be133 Otto Pflüger 2024-10-19   691  
23825a1c0be133 Otto Pflüger 2024-10-19  @692  				ports {
23825a1c0be133 Otto Pflüger 2024-10-19   693  					#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   694  					#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   695  
23825a1c0be133 Otto Pflüger 2024-10-19   696  					port@0 {
23825a1c0be133 Otto Pflüger 2024-10-19   697  						reg = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   698  						mdp5_intf1_out: endpoint {
23825a1c0be133 Otto Pflüger 2024-10-19   699  							remote-endpoint = <&mdss_dsi0_in>;
23825a1c0be133 Otto Pflüger 2024-10-19   700  						};
23825a1c0be133 Otto Pflüger 2024-10-19   701  					};
23825a1c0be133 Otto Pflüger 2024-10-19   702  				};
23825a1c0be133 Otto Pflüger 2024-10-19   703  			};
23825a1c0be133 Otto Pflüger 2024-10-19   704  
23825a1c0be133 Otto Pflüger 2024-10-19  @705  			mdss_dsi0: dsi@1a94000 {
23825a1c0be133 Otto Pflüger 2024-10-19   706  				compatible = "qcom,mdss-dsi-ctrl";
23825a1c0be133 Otto Pflüger 2024-10-19   707  				reg = <0x01a94000 0x300>;
23825a1c0be133 Otto Pflüger 2024-10-19   708  				reg-names = "dsi_ctrl";
23825a1c0be133 Otto Pflüger 2024-10-19   709  
23825a1c0be133 Otto Pflüger 2024-10-19   710  				interrupt-parent = <&mdss>;
23825a1c0be133 Otto Pflüger 2024-10-19   711  				interrupts = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19   712  
23825a1c0be133 Otto Pflüger 2024-10-19   713  				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
23825a1c0be133 Otto Pflüger 2024-10-19   714  						  <&gcc PCLK0_CLK_SRC>;
23825a1c0be133 Otto Pflüger 2024-10-19   715  				assigned-clock-parents = <&mdss_dsi0_phy 0>,
23825a1c0be133 Otto Pflüger 2024-10-19   716  							 <&mdss_dsi0_phy 1>;
23825a1c0be133 Otto Pflüger 2024-10-19   717  
23825a1c0be133 Otto Pflüger 2024-10-19   718  				clocks = <&gcc GCC_MDSS_MDP_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   719  					 <&gcc GCC_MDSS_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   720  					 <&gcc GCC_MDSS_AXI_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   721  					 <&gcc GCC_MDSS_BYTE0_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   722  					 <&gcc GCC_MDSS_PCLK0_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   723  					 <&gcc GCC_MDSS_ESC0_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   724  				clock-names = "mdp_core",
23825a1c0be133 Otto Pflüger 2024-10-19   725  					      "iface",
23825a1c0be133 Otto Pflüger 2024-10-19   726  					      "bus",
23825a1c0be133 Otto Pflüger 2024-10-19   727  					      "byte",
23825a1c0be133 Otto Pflüger 2024-10-19   728  					      "pixel",
23825a1c0be133 Otto Pflüger 2024-10-19   729  					      "core";
23825a1c0be133 Otto Pflüger 2024-10-19   730  				phys = <&mdss_dsi0_phy>;
23825a1c0be133 Otto Pflüger 2024-10-19   731  
23825a1c0be133 Otto Pflüger 2024-10-19   732  				operating-points-v2 = <&mdss_dsi0_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   733  				power-domains = <&rpmpd MSM8917_VDDCX>;
23825a1c0be133 Otto Pflüger 2024-10-19   734  
23825a1c0be133 Otto Pflüger 2024-10-19   735  				#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   736  				#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   737  
23825a1c0be133 Otto Pflüger 2024-10-19   738  				ports {
23825a1c0be133 Otto Pflüger 2024-10-19   739  					#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   740  					#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   741  
23825a1c0be133 Otto Pflüger 2024-10-19   742  					port@0 {
23825a1c0be133 Otto Pflüger 2024-10-19   743  						reg = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   744  						mdss_dsi0_in: endpoint {
23825a1c0be133 Otto Pflüger 2024-10-19   745  							remote-endpoint = <&mdp5_intf1_out>;
23825a1c0be133 Otto Pflüger 2024-10-19   746  						};
23825a1c0be133 Otto Pflüger 2024-10-19   747  					};
23825a1c0be133 Otto Pflüger 2024-10-19   748  
23825a1c0be133 Otto Pflüger 2024-10-19   749  					port@1 {
23825a1c0be133 Otto Pflüger 2024-10-19   750  						reg = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   751  						mdss_dsi0_out: endpoint {
23825a1c0be133 Otto Pflüger 2024-10-19   752  						};
23825a1c0be133 Otto Pflüger 2024-10-19   753  					};
23825a1c0be133 Otto Pflüger 2024-10-19   754  				};
23825a1c0be133 Otto Pflüger 2024-10-19   755  
23825a1c0be133 Otto Pflüger 2024-10-19   756  				mdss_dsi0_opp_table: opp-table {
23825a1c0be133 Otto Pflüger 2024-10-19   757  					compatible = "operating-points-v2";
23825a1c0be133 Otto Pflüger 2024-10-19   758  
23825a1c0be133 Otto Pflüger 2024-10-19   759  					opp-125000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   760  						opp-hz = /bits/ 64 <125000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   761  						required-opps = <&rpmpd_opp_svs>;
23825a1c0be133 Otto Pflüger 2024-10-19   762  					};
23825a1c0be133 Otto Pflüger 2024-10-19   763  
23825a1c0be133 Otto Pflüger 2024-10-19   764  					opp-187500000 {
23825a1c0be133 Otto Pflüger 2024-10-19   765  						opp-hz = /bits/ 64 <187500000>;
23825a1c0be133 Otto Pflüger 2024-10-19   766  						required-opps = <&rpmpd_opp_nom>;
23825a1c0be133 Otto Pflüger 2024-10-19   767  					};
23825a1c0be133 Otto Pflüger 2024-10-19   768  				};
23825a1c0be133 Otto Pflüger 2024-10-19   769  			};
23825a1c0be133 Otto Pflüger 2024-10-19   770  
23825a1c0be133 Otto Pflüger 2024-10-19   771  			mdss_dsi0_phy: phy@1a94400 {
23825a1c0be133 Otto Pflüger 2024-10-19   772  				compatible = "qcom,dsi-phy-28nm-8937";
23825a1c0be133 Otto Pflüger 2024-10-19   773  				reg = <0x01a94a00 0xd4>,
23825a1c0be133 Otto Pflüger 2024-10-19   774  				      <0x01a94400 0x280>,
23825a1c0be133 Otto Pflüger 2024-10-19   775  				      <0x01a94b80 0x30>;
23825a1c0be133 Otto Pflüger 2024-10-19   776  				reg-names = "dsi_pll",
23825a1c0be133 Otto Pflüger 2024-10-19   777  					    "dsi_phy",
23825a1c0be133 Otto Pflüger 2024-10-19   778  					    "dsi_phy_regulator";
23825a1c0be133 Otto Pflüger 2024-10-19   779  
23825a1c0be133 Otto Pflüger 2024-10-19   780  				#clock-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   781  				#phy-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   782  
23825a1c0be133 Otto Pflüger 2024-10-19   783  				clocks = <&gcc GCC_MDSS_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   784  					 <&xo_board>;
23825a1c0be133 Otto Pflüger 2024-10-19   785  				clock-names = "iface", "ref";
23825a1c0be133 Otto Pflüger 2024-10-19   786  			};
23825a1c0be133 Otto Pflüger 2024-10-19   787  		};
23825a1c0be133 Otto Pflüger 2024-10-19   788  
23825a1c0be133 Otto Pflüger 2024-10-19   789  		a53pll: clock@b016000 {
23825a1c0be133 Otto Pflüger 2024-10-19   790  			compatible = "qcom,msm8939-a53pll";
23825a1c0be133 Otto Pflüger 2024-10-19   791  			reg = <0x0b016000 0x40>;
23825a1c0be133 Otto Pflüger 2024-10-19   792  			clocks = <&xo_board>;
23825a1c0be133 Otto Pflüger 2024-10-19   793  			clock-names = "xo";
23825a1c0be133 Otto Pflüger 2024-10-19   794  			#clock-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   795  			operating-points-v2 = <&pll_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   796  
23825a1c0be133 Otto Pflüger 2024-10-19   797  			pll_opp_table: opp-table {
23825a1c0be133 Otto Pflüger 2024-10-19   798  				compatible = "operating-points-v2";
23825a1c0be133 Otto Pflüger 2024-10-19   799  
23825a1c0be133 Otto Pflüger 2024-10-19   800  				opp-960000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   801  					opp-hz = /bits/ 64 <960000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   802  				};
23825a1c0be133 Otto Pflüger 2024-10-19   803  
23825a1c0be133 Otto Pflüger 2024-10-19   804  				opp-1094400000 {
23825a1c0be133 Otto Pflüger 2024-10-19   805  					opp-hz = /bits/ 64 <1094400000>;
23825a1c0be133 Otto Pflüger 2024-10-19   806  				};
23825a1c0be133 Otto Pflüger 2024-10-19   807  
23825a1c0be133 Otto Pflüger 2024-10-19   808  				opp-1248000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   809  					opp-hz = /bits/ 64 <1248000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   810  				};
23825a1c0be133 Otto Pflüger 2024-10-19   811  
23825a1c0be133 Otto Pflüger 2024-10-19   812  				opp-1401600000 {
23825a1c0be133 Otto Pflüger 2024-10-19   813  				      opp-hz = /bits/ 64 <1401600000>;
23825a1c0be133 Otto Pflüger 2024-10-19   814  				};
23825a1c0be133 Otto Pflüger 2024-10-19   815  			};
23825a1c0be133 Otto Pflüger 2024-10-19   816  		};
23825a1c0be133 Otto Pflüger 2024-10-19   817  
23825a1c0be133 Otto Pflüger 2024-10-19   818  		gpu: gpu@1c00000 {
23825a1c0be133 Otto Pflüger 2024-10-19   819  			compatible = "qcom,adreno-306.32", "qcom,adreno";
23825a1c0be133 Otto Pflüger 2024-10-19   820  			reg = <0x01c00000 0x20000>;
23825a1c0be133 Otto Pflüger 2024-10-19   821  			reg-names = "kgsl_3d0_reg_memory";
23825a1c0be133 Otto Pflüger 2024-10-19   822  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   823  			interrupt-names = "kgsl_3d0_irq";
23825a1c0be133 Otto Pflüger 2024-10-19   824  			clock-names = "core",
23825a1c0be133 Otto Pflüger 2024-10-19   825  				      "iface",
23825a1c0be133 Otto Pflüger 2024-10-19   826  				      "mem_iface",
23825a1c0be133 Otto Pflüger 2024-10-19   827  				      "alt_mem_iface",
23825a1c0be133 Otto Pflüger 2024-10-19   828  				      "gfx3d";
23825a1c0be133 Otto Pflüger 2024-10-19   829  			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   830  				 <&gcc GCC_OXILI_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   831  				 <&gcc GCC_BIMC_GFX_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   832  				 <&gcc GCC_BIMC_GPU_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   833  				 <&gcc GFX3D_CLK_SRC>;
23825a1c0be133 Otto Pflüger 2024-10-19   834  			power-domains = <&gcc OXILI_GX_GDSC>;
23825a1c0be133 Otto Pflüger 2024-10-19   835  			operating-points-v2 = <&gpu_opp_table>;
23825a1c0be133 Otto Pflüger 2024-10-19   836  			#cooling-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   837  
23825a1c0be133 Otto Pflüger 2024-10-19   838  			iommus = <&gpu_iommu 0>;
23825a1c0be133 Otto Pflüger 2024-10-19   839  
23825a1c0be133 Otto Pflüger 2024-10-19   840  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   841  
23825a1c0be133 Otto Pflüger 2024-10-19   842  			gpu_opp_table: opp-table {
23825a1c0be133 Otto Pflüger 2024-10-19   843  				compatible = "operating-points-v2";
23825a1c0be133 Otto Pflüger 2024-10-19   844  
23825a1c0be133 Otto Pflüger 2024-10-19   845  				opp-598000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   846  					opp-hz = /bits/ 64 <598000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   847  				};
23825a1c0be133 Otto Pflüger 2024-10-19   848  
23825a1c0be133 Otto Pflüger 2024-10-19   849  				opp-523200000 {
23825a1c0be133 Otto Pflüger 2024-10-19   850  					opp-hz = /bits/ 64 <523200000>;
23825a1c0be133 Otto Pflüger 2024-10-19   851  				};
23825a1c0be133 Otto Pflüger 2024-10-19   852  
23825a1c0be133 Otto Pflüger 2024-10-19   853  				opp-484800000 {
23825a1c0be133 Otto Pflüger 2024-10-19   854  					opp-hz = /bits/ 64 <484800000>;
23825a1c0be133 Otto Pflüger 2024-10-19   855  				};
23825a1c0be133 Otto Pflüger 2024-10-19   856  
23825a1c0be133 Otto Pflüger 2024-10-19   857  				opp-400000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   858  					opp-hz = /bits/ 64 <400000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   859  				};
23825a1c0be133 Otto Pflüger 2024-10-19   860  
23825a1c0be133 Otto Pflüger 2024-10-19   861  				opp-270000000 {
23825a1c0be133 Otto Pflüger 2024-10-19   862  					opp-hz = /bits/ 64 <270000000>;
23825a1c0be133 Otto Pflüger 2024-10-19   863  				};
23825a1c0be133 Otto Pflüger 2024-10-19   864  
23825a1c0be133 Otto Pflüger 2024-10-19   865  				opp-19200000 {
23825a1c0be133 Otto Pflüger 2024-10-19   866  					opp-hz = /bits/ 64 <19200000>;
23825a1c0be133 Otto Pflüger 2024-10-19   867  				};
23825a1c0be133 Otto Pflüger 2024-10-19   868  			};
23825a1c0be133 Otto Pflüger 2024-10-19   869  		};
23825a1c0be133 Otto Pflüger 2024-10-19   870  
23825a1c0be133 Otto Pflüger 2024-10-19   871  		spmi_bus: spmi@200f000 {
23825a1c0be133 Otto Pflüger 2024-10-19   872  			compatible = "qcom,spmi-pmic-arb";
23825a1c0be133 Otto Pflüger 2024-10-19   873  			reg = <0x0200f000 0x001000>,
23825a1c0be133 Otto Pflüger 2024-10-19   874  			      <0x02400000 0x800000>,
23825a1c0be133 Otto Pflüger 2024-10-19   875  			      <0x02c00000 0x800000>,
23825a1c0be133 Otto Pflüger 2024-10-19   876  			      <0x03800000 0x200000>,
23825a1c0be133 Otto Pflüger 2024-10-19   877  			      <0x0200a000 0x002100>;
23825a1c0be133 Otto Pflüger 2024-10-19   878  			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
23825a1c0be133 Otto Pflüger 2024-10-19   879  			interrupt-names = "periph_irq";
23825a1c0be133 Otto Pflüger 2024-10-19   880  			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   881  			qcom,ee = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   882  			qcom,channel = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   883  			#address-cells = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19   884  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   885  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19   886  			#interrupt-cells = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19   887  		};
23825a1c0be133 Otto Pflüger 2024-10-19   888  
23825a1c0be133 Otto Pflüger 2024-10-19   889  		bam_dmux_dma: dma-controller@4044000 {
23825a1c0be133 Otto Pflüger 2024-10-19   890  			compatible = "qcom,bam-v1.7.0";
23825a1c0be133 Otto Pflüger 2024-10-19   891  			reg = <0x04044000 0x19000>;
23825a1c0be133 Otto Pflüger 2024-10-19   892  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   893  			#dma-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   894  			qcom,ee = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   895  
23825a1c0be133 Otto Pflüger 2024-10-19   896  			num-channels = <6>;
23825a1c0be133 Otto Pflüger 2024-10-19   897  			qcom,num-ees = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   898  			qcom,powered-remotely;
23825a1c0be133 Otto Pflüger 2024-10-19   899  
23825a1c0be133 Otto Pflüger 2024-10-19   900  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   901  		};
23825a1c0be133 Otto Pflüger 2024-10-19   902  
23825a1c0be133 Otto Pflüger 2024-10-19   903  		apcs: mailbox@b011000 {
23825a1c0be133 Otto Pflüger 2024-10-19   904  			compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
23825a1c0be133 Otto Pflüger 2024-10-19   905  			reg = <0x0b011000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19   906  			#mbox-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   907  			clocks = <&a53pll>, <&gcc GPLL0_EARLY>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
23825a1c0be133 Otto Pflüger 2024-10-19   908  			clock-names = "pll", "aux", "ref";
23825a1c0be133 Otto Pflüger 2024-10-19   909  			#clock-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   910  		};
23825a1c0be133 Otto Pflüger 2024-10-19   911  
23825a1c0be133 Otto Pflüger 2024-10-19   912  		sdhc_1: mmc@7824900 {
23825a1c0be133 Otto Pflüger 2024-10-19   913  			compatible = "qcom,sdhci-msm-v4";
23825a1c0be133 Otto Pflüger 2024-10-19   914  			reg = <0x07824900 0x500>, <0x07824000 0x800>;
23825a1c0be133 Otto Pflüger 2024-10-19   915  			reg-names = "hc", "core";
23825a1c0be133 Otto Pflüger 2024-10-19   916  
23825a1c0be133 Otto Pflüger 2024-10-19   917  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
23825a1c0be133 Otto Pflüger 2024-10-19   918  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   919  			interrupt-names = "hc_irq", "pwr_irq";
23825a1c0be133 Otto Pflüger 2024-10-19   920  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   921  				 <&gcc GCC_SDCC1_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   922  				 <&xo_board>;
23825a1c0be133 Otto Pflüger 2024-10-19   923  			clock-names = "iface", "core", "xo";
23825a1c0be133 Otto Pflüger 2024-10-19   924  			power-domains = <&rpmpd MSM8917_VDDCX>;
23825a1c0be133 Otto Pflüger 2024-10-19   925  			mmc-hs200-1_8v;
23825a1c0be133 Otto Pflüger 2024-10-19   926  			mmc-hs400-1_8v;
23825a1c0be133 Otto Pflüger 2024-10-19   927  			mmc-ddr-1_8v;
23825a1c0be133 Otto Pflüger 2024-10-19   928  			bus-width = <8>;
23825a1c0be133 Otto Pflüger 2024-10-19   929  			non-removable;
23825a1c0be133 Otto Pflüger 2024-10-19   930  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   931  		};
23825a1c0be133 Otto Pflüger 2024-10-19   932  
23825a1c0be133 Otto Pflüger 2024-10-19   933  		sdhc_2: mmc@7864900 {
23825a1c0be133 Otto Pflüger 2024-10-19   934  			compatible = "qcom,sdhci-msm-v4";
23825a1c0be133 Otto Pflüger 2024-10-19   935  			reg = <0x07864900 0x500>, <0x07864000 0x800>;
23825a1c0be133 Otto Pflüger 2024-10-19   936  			reg-names = "hc", "core";
23825a1c0be133 Otto Pflüger 2024-10-19   937  
23825a1c0be133 Otto Pflüger 2024-10-19   938  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
23825a1c0be133 Otto Pflüger 2024-10-19   939  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   940  			interrupt-names = "hc_irq", "pwr_irq";
23825a1c0be133 Otto Pflüger 2024-10-19   941  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   942  				 <&gcc GCC_SDCC2_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   943  				 <&xo_board>;
23825a1c0be133 Otto Pflüger 2024-10-19   944  			clock-names = "iface", "core", "xo";
23825a1c0be133 Otto Pflüger 2024-10-19   945  			power-domains = <&rpmpd MSM8917_VDDCX>;
23825a1c0be133 Otto Pflüger 2024-10-19   946  			bus-width = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19   947  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   948  		};
23825a1c0be133 Otto Pflüger 2024-10-19   949  
23825a1c0be133 Otto Pflüger 2024-10-19   950  		blsp1_dma: dma-controller@7884000 {
23825a1c0be133 Otto Pflüger 2024-10-19   951  			compatible = "qcom,bam-v1.7.0";
23825a1c0be133 Otto Pflüger 2024-10-19   952  			reg = <0x07884000 0x1f000>;
23825a1c0be133 Otto Pflüger 2024-10-19   953  			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   954  			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   955  			clock-names = "bam_clk";
23825a1c0be133 Otto Pflüger 2024-10-19   956  			qcom,controlled-remotely;
23825a1c0be133 Otto Pflüger 2024-10-19   957  			#dma-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   958  			num-channels = <12>;
23825a1c0be133 Otto Pflüger 2024-10-19   959  			qcom,num-ees = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19   960  			qcom,ee = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   961  		};
23825a1c0be133 Otto Pflüger 2024-10-19   962  
23825a1c0be133 Otto Pflüger 2024-10-19   963  		blsp2_dma: dma-controller@7ac4000 {
23825a1c0be133 Otto Pflüger 2024-10-19   964  			compatible = "qcom,bam-v1.7.0";
23825a1c0be133 Otto Pflüger 2024-10-19   965  			reg = <0x07ac4000 0x1d000>;
23825a1c0be133 Otto Pflüger 2024-10-19   966  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   967  			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   968  			clock-names = "bam_clk";
23825a1c0be133 Otto Pflüger 2024-10-19   969  			qcom,controlled-remotely;
23825a1c0be133 Otto Pflüger 2024-10-19   970  			#dma-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19   971  			num-channels = <10>;
23825a1c0be133 Otto Pflüger 2024-10-19   972  			qcom,num-ees = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19   973  			qcom,ee = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19   974  		};
23825a1c0be133 Otto Pflüger 2024-10-19   975  
23825a1c0be133 Otto Pflüger 2024-10-19   976  		blsp1_uart1: serial@78af000 {
23825a1c0be133 Otto Pflüger 2024-10-19   977  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
23825a1c0be133 Otto Pflüger 2024-10-19   978  			reg = <0x078af000 0x200>;
23825a1c0be133 Otto Pflüger 2024-10-19   979  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   980  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   981  				 <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   982  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19   983  			dmas = <&blsp1_dma 0>, <&blsp1_dma 1>;
23825a1c0be133 Otto Pflüger 2024-10-19   984  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19   985  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19   986  			pinctrl-0 = <&blsp1_uart1_default>;
23825a1c0be133 Otto Pflüger 2024-10-19   987  			pinctrl-1 = <&blsp1_uart1_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19   988  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19   989  		};
23825a1c0be133 Otto Pflüger 2024-10-19   990  
23825a1c0be133 Otto Pflüger 2024-10-19   991  		blsp1_uart2: serial@78b0000 {
23825a1c0be133 Otto Pflüger 2024-10-19   992  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
23825a1c0be133 Otto Pflüger 2024-10-19   993  			reg = <0x078b0000 0x200>;
23825a1c0be133 Otto Pflüger 2024-10-19   994  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19   995  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19   996  				 <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19   997  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19   998  			dmas = <&blsp1_dma 2>, <&blsp1_dma 3>;
23825a1c0be133 Otto Pflüger 2024-10-19   999  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1000  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1001  			pinctrl-0 = <&blsp1_uart2_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1002  			pinctrl-1 = <&blsp1_uart2_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1003  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1004  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1005  
23825a1c0be133 Otto Pflüger 2024-10-19  1006  		blsp_i2c2: i2c@78b6000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1007  			compatible = "qcom,i2c-qup-v2.2.1";
23825a1c0be133 Otto Pflüger 2024-10-19  1008  			reg = <0x078b6000 0x600>;
23825a1c0be133 Otto Pflüger 2024-10-19  1009  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1010  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1011  				 <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1012  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19  1013  			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
23825a1c0be133 Otto Pflüger 2024-10-19  1014  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1015  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1016  			pinctrl-0 = <&i2c2_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1017  			pinctrl-1 = <&i2c2_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1018  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1019  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1020  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1021  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1022  
23825a1c0be133 Otto Pflüger 2024-10-19  1023  		blsp_i2c3: i2c@78b7000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1024  			compatible = "qcom,i2c-qup-v2.2.1";
23825a1c0be133 Otto Pflüger 2024-10-19  1025  			reg = <0x078b7000 0x600>;
23825a1c0be133 Otto Pflüger 2024-10-19  1026  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1027  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1028  				 <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1029  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19  1030  			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
23825a1c0be133 Otto Pflüger 2024-10-19  1031  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1032  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1033  			pinctrl-0 = <&i2c3_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1034  			pinctrl-1 = <&i2c3_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1035  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1036  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1037  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1038  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1039  
23825a1c0be133 Otto Pflüger 2024-10-19  1040  		blsp_spi3: spi@78b7000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1041  			compatible = "qcom,spi-qup-v2.2.1";
23825a1c0be133 Otto Pflüger 2024-10-19  1042  			reg = <0x078b7000 0x600>;
23825a1c0be133 Otto Pflüger 2024-10-19  1043  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1044  			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1045  				 <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1046  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19  1047  			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
23825a1c0be133 Otto Pflüger 2024-10-19  1048  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1049  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1050  			pinctrl-0 = <&spi3_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1051  			pinctrl-1 = <&spi3_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1052  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1053  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1054  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1055  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1056  
23825a1c0be133 Otto Pflüger 2024-10-19  1057  		blsp_i2c4: i2c@78b8000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1058  			compatible = "qcom,i2c-qup-v2.2.1";
23825a1c0be133 Otto Pflüger 2024-10-19  1059  			reg = <0x078b8000 0x500>;
23825a1c0be133 Otto Pflüger 2024-10-19  1060  			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1061  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1062  				 <&gcc GCC_BLSP1_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1063  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19  1064  			dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
23825a1c0be133 Otto Pflüger 2024-10-19  1065  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1066  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1067  			pinctrl-0 = <&i2c4_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1068  			pinctrl-1 = <&i2c4_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1069  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1070  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1071  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1072  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1073  
23825a1c0be133 Otto Pflüger 2024-10-19  1074  		blsp_i2c5: i2c@7af5000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1075  			compatible = "qcom,i2c-qup-v2.2.1";
23825a1c0be133 Otto Pflüger 2024-10-19  1076  			reg = <0x07af5000 0x600>;
23825a1c0be133 Otto Pflüger 2024-10-19  1077  			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1078  			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1079  				 <&gcc GCC_BLSP2_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1080  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19  1081  			dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
23825a1c0be133 Otto Pflüger 2024-10-19  1082  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1083  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1084  			pinctrl-0 = <&i2c5_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1085  			pinctrl-1 = <&i2c5_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1086  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1087  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1088  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1089  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1090  
23825a1c0be133 Otto Pflüger 2024-10-19  1091  		blsp_spi6: spi@7af6000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1092  			compatible = "qcom,spi-qup-v2.2.1";
23825a1c0be133 Otto Pflüger 2024-10-19  1093  			reg = <0x07af6000 0x600>;
23825a1c0be133 Otto Pflüger 2024-10-19  1094  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1095  			clocks = <&gcc GCC_BLSP2_QUP2_SPI_APPS_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1096  				 <&gcc GCC_BLSP2_AHB_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1097  			clock-names = "core", "iface";
23825a1c0be133 Otto Pflüger 2024-10-19  1098  			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
23825a1c0be133 Otto Pflüger 2024-10-19  1099  			dma-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1100  			pinctrl-names = "default", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1101  			pinctrl-0 = <&spi6_default>;
23825a1c0be133 Otto Pflüger 2024-10-19  1102  			pinctrl-1 = <&spi6_sleep>;
23825a1c0be133 Otto Pflüger 2024-10-19  1103  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1104  			#size-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1105  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1106  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1107  
23825a1c0be133 Otto Pflüger 2024-10-19  1108  		usb_hs_phy: phy@6c000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1109  			compatible = "qcom,usb-hs-28nm-femtophy";
23825a1c0be133 Otto Pflüger 2024-10-19  1110  			reg = <0x6c000 0x200>;
23825a1c0be133 Otto Pflüger 2024-10-19  1111  			#phy-cells = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1112  			clocks = <&xo_board>,
23825a1c0be133 Otto Pflüger 2024-10-19  1113  				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1114  				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1115  			clock-names = "ref", "ahb", "sleep";
23825a1c0be133 Otto Pflüger 2024-10-19  1116  			resets = <&gcc GCC_QUSB2_PHY_BCR>,
23825a1c0be133 Otto Pflüger 2024-10-19  1117  				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
23825a1c0be133 Otto Pflüger 2024-10-19  1118  			reset-names = "phy", "por";
23825a1c0be133 Otto Pflüger 2024-10-19  1119  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1120  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1121  
23825a1c0be133 Otto Pflüger 2024-10-19  1122  		usb: usb@78db000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1123  			compatible = "qcom,ci-hdrc";
23825a1c0be133 Otto Pflüger 2024-10-19  1124  			reg = <0x078db000 0x200>,
23825a1c0be133 Otto Pflüger 2024-10-19  1125  			      <0x078db200 0x200>;
23825a1c0be133 Otto Pflüger 2024-10-19  1126  			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
23825a1c0be133 Otto Pflüger 2024-10-19  1127  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1128  			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
23825a1c0be133 Otto Pflüger 2024-10-19  1129  				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1130  			clock-names = "iface", "core";
23825a1c0be133 Otto Pflüger 2024-10-19  1131  			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
23825a1c0be133 Otto Pflüger 2024-10-19  1132  			assigned-clock-rates = <80000000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1133  			resets = <&gcc GCC_USB_HS_BCR>;
23825a1c0be133 Otto Pflüger 2024-10-19  1134  			reset-names = "core";
23825a1c0be133 Otto Pflüger 2024-10-19  1135  			phy_type = "ulpi";
23825a1c0be133 Otto Pflüger 2024-10-19  1136  			dr_mode = "otg";
23825a1c0be133 Otto Pflüger 2024-10-19  1137  			hnp-disable;
23825a1c0be133 Otto Pflüger 2024-10-19  1138  			srp-disable;
23825a1c0be133 Otto Pflüger 2024-10-19  1139  			adp-disable;
23825a1c0be133 Otto Pflüger 2024-10-19  1140  			ahb-burst-config = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1141  			phy-names = "usb-phy";
23825a1c0be133 Otto Pflüger 2024-10-19  1142  			phys = <&usb_hs_phy>;
23825a1c0be133 Otto Pflüger 2024-10-19  1143  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1144  			#reset-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1145  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1146  
23825a1c0be133 Otto Pflüger 2024-10-19  1147  		pronto: wcnss: remoteproc@a21b000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1148  			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
23825a1c0be133 Otto Pflüger 2024-10-19  1149  			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1150  			reg-names = "ccu", "dxe", "pmu";
23825a1c0be133 Otto Pflüger 2024-10-19  1151  
23825a1c0be133 Otto Pflüger 2024-10-19  1152  			memory-region = <&wcnss_mem>;
23825a1c0be133 Otto Pflüger 2024-10-19  1153  
23825a1c0be133 Otto Pflüger 2024-10-19  1154  			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
23825a1c0be133 Otto Pflüger 2024-10-19  1155  					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
23825a1c0be133 Otto Pflüger 2024-10-19  1156  					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
23825a1c0be133 Otto Pflüger 2024-10-19  1157  					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
23825a1c0be133 Otto Pflüger 2024-10-19  1158  					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19  1159  			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
23825a1c0be133 Otto Pflüger 2024-10-19  1160  
23825a1c0be133 Otto Pflüger 2024-10-19  1161  			power-domains = <&rpmpd MSM8917_VDDCX>,
23825a1c0be133 Otto Pflüger 2024-10-19  1162  					<&rpmpd MSM8917_VDDMX>;
23825a1c0be133 Otto Pflüger 2024-10-19  1163  			power-domain-names = "cx", "mx";
23825a1c0be133 Otto Pflüger 2024-10-19  1164  
23825a1c0be133 Otto Pflüger 2024-10-19  1165  			qcom,smem-states = <&wcnss_smp2p_out 0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1166  			qcom,smem-state-names = "stop";
23825a1c0be133 Otto Pflüger 2024-10-19  1167  
23825a1c0be133 Otto Pflüger 2024-10-19  1168  			pinctrl-names = "default";
23825a1c0be133 Otto Pflüger 2024-10-19  1169  			pinctrl-0 = <&wcnss_pin_a>;
23825a1c0be133 Otto Pflüger 2024-10-19  1170  
23825a1c0be133 Otto Pflüger 2024-10-19  1171  			status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1172  
23825a1c0be133 Otto Pflüger 2024-10-19  1173  			wcnss_iris: iris {
23825a1c0be133 Otto Pflüger 2024-10-19  1174  				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
23825a1c0be133 Otto Pflüger 2024-10-19  1175  				clock-names = "xo";
23825a1c0be133 Otto Pflüger 2024-10-19  1176  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1177  
23825a1c0be133 Otto Pflüger 2024-10-19  1178  			smd-edge {
23825a1c0be133 Otto Pflüger 2024-10-19  1179  				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
23825a1c0be133 Otto Pflüger 2024-10-19  1180  
23825a1c0be133 Otto Pflüger 2024-10-19  1181  				qcom,ipc = <&apcs 8 17>;
23825a1c0be133 Otto Pflüger 2024-10-19  1182  				qcom,smd-edge = <6>;
23825a1c0be133 Otto Pflüger 2024-10-19  1183  				qcom,remote-pid = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19  1184  
23825a1c0be133 Otto Pflüger 2024-10-19  1185  				label = "pronto";
23825a1c0be133 Otto Pflüger 2024-10-19  1186  
23825a1c0be133 Otto Pflüger 2024-10-19  1187  				wcnss_ctrl: wcnss {
23825a1c0be133 Otto Pflüger 2024-10-19  1188  					compatible = "qcom,wcnss";
23825a1c0be133 Otto Pflüger 2024-10-19  1189  					qcom,smd-channels = "WCNSS_CTRL";
23825a1c0be133 Otto Pflüger 2024-10-19  1190  
23825a1c0be133 Otto Pflüger 2024-10-19  1191  					qcom,mmio = <&pronto>;
23825a1c0be133 Otto Pflüger 2024-10-19  1192  
23825a1c0be133 Otto Pflüger 2024-10-19  1193  					wcnss_bt: bluetooth {
23825a1c0be133 Otto Pflüger 2024-10-19  1194  						compatible = "qcom,wcnss-bt";
23825a1c0be133 Otto Pflüger 2024-10-19  1195  					};
23825a1c0be133 Otto Pflüger 2024-10-19  1196  
23825a1c0be133 Otto Pflüger 2024-10-19  1197  					wcnss_wifi: wifi {
23825a1c0be133 Otto Pflüger 2024-10-19  1198  						compatible = "qcom,wcnss-wlan";
23825a1c0be133 Otto Pflüger 2024-10-19  1199  
23825a1c0be133 Otto Pflüger 2024-10-19  1200  						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
23825a1c0be133 Otto Pflüger 2024-10-19  1201  							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1202  						interrupt-names = "tx", "rx";
23825a1c0be133 Otto Pflüger 2024-10-19  1203  
23825a1c0be133 Otto Pflüger 2024-10-19  1204  						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
23825a1c0be133 Otto Pflüger 2024-10-19  1205  						qcom,smem-state-names = "tx-enable",
23825a1c0be133 Otto Pflüger 2024-10-19  1206  									"tx-rings-empty";
23825a1c0be133 Otto Pflüger 2024-10-19  1207  					};
23825a1c0be133 Otto Pflüger 2024-10-19  1208  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1209  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1210  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1211  
23825a1c0be133 Otto Pflüger 2024-10-19  1212  		intc: interrupt-controller@b000000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1213  			compatible = "qcom,msm-qgic2";
23825a1c0be133 Otto Pflüger 2024-10-19  1214  			interrupt-controller;
23825a1c0be133 Otto Pflüger 2024-10-19  1215  			#interrupt-cells = <3>;
23825a1c0be133 Otto Pflüger 2024-10-19  1216  			reg = <0x0b000000 0x1000>,
23825a1c0be133 Otto Pflüger 2024-10-19  1217  			      <0x0b002000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1218  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1219  
23825a1c0be133 Otto Pflüger 2024-10-19  1220  		watchdog@b017000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1221  			compatible = "qcom,apss-wdt-qcs404", "qcom,kpss-wdt";
23825a1c0be133 Otto Pflüger 2024-10-19  1222  			reg = <0x0b017000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1223  			clocks = <&sleep_clk>;
23825a1c0be133 Otto Pflüger 2024-10-19  1224  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1225  
23825a1c0be133 Otto Pflüger 2024-10-19  1226  		timer@b120000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1227  			#address-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1228  			#size-cells = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1229  			ranges;
23825a1c0be133 Otto Pflüger 2024-10-19  1230  			compatible = "arm,armv7-timer-mem";
23825a1c0be133 Otto Pflüger 2024-10-19  1231  			reg = <0x0b120000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1232  			clock-frequency = <19200000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1233  
23825a1c0be133 Otto Pflüger 2024-10-19  1234  			frame@b121000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1235  				frame-number = <0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1236  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
23825a1c0be133 Otto Pflüger 2024-10-19  1237  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1238  				reg = <0x0b121000 0x1000>,
23825a1c0be133 Otto Pflüger 2024-10-19  1239  				      <0x0b122000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1240  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1241  
23825a1c0be133 Otto Pflüger 2024-10-19  1242  			frame@b123000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1243  				frame-number = <1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1244  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1245  				reg = <0x0b123000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1246  				status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1247  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1248  
23825a1c0be133 Otto Pflüger 2024-10-19  1249  			frame@b124000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1250  				frame-number = <2>;
23825a1c0be133 Otto Pflüger 2024-10-19  1251  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1252  				reg = <0x0b124000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1253  				status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1254  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1255  
23825a1c0be133 Otto Pflüger 2024-10-19  1256  			frame@b125000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1257  				frame-number = <3>;
23825a1c0be133 Otto Pflüger 2024-10-19  1258  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1259  				reg = <0x0b125000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1260  				status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1261  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1262  
23825a1c0be133 Otto Pflüger 2024-10-19  1263  			frame@b126000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1264  				frame-number = <4>;
23825a1c0be133 Otto Pflüger 2024-10-19  1265  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1266  				reg = <0x0b126000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1267  				status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1268  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1269  
23825a1c0be133 Otto Pflüger 2024-10-19  1270  			frame@b127000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1271  				frame-number = <5>;
23825a1c0be133 Otto Pflüger 2024-10-19  1272  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1273  				reg = <0x0b127000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1274  				status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1275  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1276  
23825a1c0be133 Otto Pflüger 2024-10-19  1277  			frame@b128000 {
23825a1c0be133 Otto Pflüger 2024-10-19  1278  				frame-number = <6>;
23825a1c0be133 Otto Pflüger 2024-10-19  1279  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
23825a1c0be133 Otto Pflüger 2024-10-19  1280  				reg = <0x0b128000 0x1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1281  				status = "disabled";
23825a1c0be133 Otto Pflüger 2024-10-19  1282  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1283  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1284  	};
23825a1c0be133 Otto Pflüger 2024-10-19  1285  
23825a1c0be133 Otto Pflüger 2024-10-19  1286  	thermal_zones: thermal-zones {
23825a1c0be133 Otto Pflüger 2024-10-19  1287  		aoss-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1288  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1289  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1290  
23825a1c0be133 Otto Pflüger 2024-10-19  1291  			thermal-sensors = <&tsens 0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1292  
23825a1c0be133 Otto Pflüger 2024-10-19  1293  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1294  				aoss_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1295  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1296  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1297  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1298  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1299  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1300  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1301  
23825a1c0be133 Otto Pflüger 2024-10-19  1302  		mdm-core-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1303  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1304  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1305  
23825a1c0be133 Otto Pflüger 2024-10-19  1306  			thermal-sensors = <&tsens 1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1307  
23825a1c0be133 Otto Pflüger 2024-10-19  1308  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1309  				mdm_core_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1310  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1311  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1312  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1313  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1314  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1315  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1316  
23825a1c0be133 Otto Pflüger 2024-10-19  1317  		q6-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1318  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1319  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1320  
23825a1c0be133 Otto Pflüger 2024-10-19  1321  			thermal-sensors = <&tsens 2>;
23825a1c0be133 Otto Pflüger 2024-10-19  1322  
23825a1c0be133 Otto Pflüger 2024-10-19  1323  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1324  				q6_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1325  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1326  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1327  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1328  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1329  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1330  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1331  
23825a1c0be133 Otto Pflüger 2024-10-19  1332  		camera-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1333  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1334  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1335  
23825a1c0be133 Otto Pflüger 2024-10-19  1336  			thermal-sensors = <&tsens 3>;
23825a1c0be133 Otto Pflüger 2024-10-19  1337  
23825a1c0be133 Otto Pflüger 2024-10-19  1338  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1339  				camera_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1340  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1341  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1342  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1343  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1344  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1345  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1346  
23825a1c0be133 Otto Pflüger 2024-10-19  1347  		cpuss1-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1348  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1349  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1350  
23825a1c0be133 Otto Pflüger 2024-10-19  1351  			thermal-sensors = <&tsens 4>;
23825a1c0be133 Otto Pflüger 2024-10-19  1352  
23825a1c0be133 Otto Pflüger 2024-10-19  1353  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1354  				cpuss1_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1355  					temperature = <75000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1356  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1357  					type = "passive";
23825a1c0be133 Otto Pflüger 2024-10-19  1358  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1359  
23825a1c0be133 Otto Pflüger 2024-10-19  1360  				cpuss1_alert1: trip-point1 {
23825a1c0be133 Otto Pflüger 2024-10-19  1361  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1362  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1363  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1364  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1365  
23825a1c0be133 Otto Pflüger 2024-10-19  1366  				cpuss1_crit: cpuss1-crit {
23825a1c0be133 Otto Pflüger 2024-10-19  1367  					temperature = <100000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1368  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1369  					type = "critical";
23825a1c0be133 Otto Pflüger 2024-10-19  1370  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1371  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1372  			cooling-maps {
23825a1c0be133 Otto Pflüger 2024-10-19  1373  				map0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1374  					trip = <&cpuss1_alert0>;
23825a1c0be133 Otto Pflüger 2024-10-19  1375  					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1376  							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1377  							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1378  							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
23825a1c0be133 Otto Pflüger 2024-10-19  1379  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1380  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1381  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1382  
23825a1c0be133 Otto Pflüger 2024-10-19  1383  		cpu0-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1384  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1385  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1386  
23825a1c0be133 Otto Pflüger 2024-10-19  1387  			thermal-sensors = <&tsens 5>;
23825a1c0be133 Otto Pflüger 2024-10-19  1388  
23825a1c0be133 Otto Pflüger 2024-10-19  1389  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1390  				cpu0_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1391  					temperature = <75000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1392  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1393  					type = "passive";
23825a1c0be133 Otto Pflüger 2024-10-19  1394  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1395  
23825a1c0be133 Otto Pflüger 2024-10-19  1396  				cpu0_alert1: trip-point1 {
23825a1c0be133 Otto Pflüger 2024-10-19  1397  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1398  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1399  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1400  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1401  
23825a1c0be133 Otto Pflüger 2024-10-19  1402  				cpu0_crit: cpu-crit {
23825a1c0be133 Otto Pflüger 2024-10-19  1403  					temperature = <100000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1404  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1405  					type = "critical";
23825a1c0be133 Otto Pflüger 2024-10-19  1406  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1407  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1408  			cooling-maps {
23825a1c0be133 Otto Pflüger 2024-10-19  1409  				map0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1410  					trip = <&cpu0_alert1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1411  					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1412  							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1413  							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1414  							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
23825a1c0be133 Otto Pflüger 2024-10-19  1415  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1416  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1417  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1418  
23825a1c0be133 Otto Pflüger 2024-10-19  1419  		cpu1-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1420  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1421  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1422  
23825a1c0be133 Otto Pflüger 2024-10-19  1423  			thermal-sensors = <&tsens 6>;
23825a1c0be133 Otto Pflüger 2024-10-19  1424  
23825a1c0be133 Otto Pflüger 2024-10-19  1425  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1426  				cpu1_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1427  					temperature = <75000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1428  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1429  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1430  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1431  
23825a1c0be133 Otto Pflüger 2024-10-19  1432  				cpu1_alert1: trip-point1 {
23825a1c0be133 Otto Pflüger 2024-10-19  1433  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1434  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1435  					type = "passive";
23825a1c0be133 Otto Pflüger 2024-10-19  1436  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1437  
23825a1c0be133 Otto Pflüger 2024-10-19  1438  				cpu1_crit: cpu-crit {
23825a1c0be133 Otto Pflüger 2024-10-19  1439  					temperature = <100000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1440  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1441  					type = "critical";
23825a1c0be133 Otto Pflüger 2024-10-19  1442  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1443  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1444  			cooling-maps {
23825a1c0be133 Otto Pflüger 2024-10-19  1445  				map0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1446  					trip = <&cpu1_alert1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1447  					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1448  							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1449  							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1450  							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
23825a1c0be133 Otto Pflüger 2024-10-19  1451  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1452  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1453  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1454  
23825a1c0be133 Otto Pflüger 2024-10-19  1455  		cpu2-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1456  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1457  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1458  
23825a1c0be133 Otto Pflüger 2024-10-19  1459  			thermal-sensors = <&tsens 7>;
23825a1c0be133 Otto Pflüger 2024-10-19  1460  
23825a1c0be133 Otto Pflüger 2024-10-19  1461  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1462  				cpu2_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1463  					temperature = <75000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1464  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1465  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1466  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1467  
23825a1c0be133 Otto Pflüger 2024-10-19  1468  				cpu2_alert1: trip-point1 {
23825a1c0be133 Otto Pflüger 2024-10-19  1469  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1470  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1471  					type = "passive";
23825a1c0be133 Otto Pflüger 2024-10-19  1472  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1473  
23825a1c0be133 Otto Pflüger 2024-10-19  1474  				cpu2_crit: cpu-crit {
23825a1c0be133 Otto Pflüger 2024-10-19  1475  					temperature = <100000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1476  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1477  					type = "critical";
23825a1c0be133 Otto Pflüger 2024-10-19  1478  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1479  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1480  			cooling-maps {
23825a1c0be133 Otto Pflüger 2024-10-19  1481  				map0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1482  					trip = <&cpu2_alert1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1483  					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1484  							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1485  							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1486  							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
23825a1c0be133 Otto Pflüger 2024-10-19  1487  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1488  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1489  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1490  
23825a1c0be133 Otto Pflüger 2024-10-19  1491  		cpu3-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1492  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1493  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1494  
23825a1c0be133 Otto Pflüger 2024-10-19  1495  			thermal-sensors = <&tsens 8>;
23825a1c0be133 Otto Pflüger 2024-10-19  1496  
23825a1c0be133 Otto Pflüger 2024-10-19  1497  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1498  				cpu3_alert0: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1499  					temperature = <75000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1500  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1501  					type = "hot";
23825a1c0be133 Otto Pflüger 2024-10-19  1502  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1503  
23825a1c0be133 Otto Pflüger 2024-10-19  1504  				cpu3_alert1: trip-point1 {
23825a1c0be133 Otto Pflüger 2024-10-19  1505  					temperature = <85000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1506  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1507  					type = "passive";
23825a1c0be133 Otto Pflüger 2024-10-19  1508  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1509  
23825a1c0be133 Otto Pflüger 2024-10-19  1510  				cpu3_crit: cpu-crit {
23825a1c0be133 Otto Pflüger 2024-10-19  1511  					temperature = <100000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1512  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1513  					type = "critical";
23825a1c0be133 Otto Pflüger 2024-10-19  1514  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1515  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1516  			cooling-maps {
23825a1c0be133 Otto Pflüger 2024-10-19  1517  				map0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1518  					trip = <&cpu3_alert1>;
23825a1c0be133 Otto Pflüger 2024-10-19  1519  					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1520  							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1521  							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
23825a1c0be133 Otto Pflüger 2024-10-19  1522  							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
23825a1c0be133 Otto Pflüger 2024-10-19  1523  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1524  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1525  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1526  
23825a1c0be133 Otto Pflüger 2024-10-19  1527  		gpu-thermal {
23825a1c0be133 Otto Pflüger 2024-10-19  1528  			polling-delay-passive = <250>;
23825a1c0be133 Otto Pflüger 2024-10-19  1529  			polling-delay = <1000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1530  
23825a1c0be133 Otto Pflüger 2024-10-19  1531  			thermal-sensors = <&tsens 9>;
23825a1c0be133 Otto Pflüger 2024-10-19  1532  
23825a1c0be133 Otto Pflüger 2024-10-19  1533  			trips {
23825a1c0be133 Otto Pflüger 2024-10-19  1534  				gpu_alert: trip-point0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1535  					temperature = <70000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1536  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1537  					type = "passive";
23825a1c0be133 Otto Pflüger 2024-10-19  1538  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1539  
23825a1c0be133 Otto Pflüger 2024-10-19  1540  				gpu_crit: gpu-crit {
23825a1c0be133 Otto Pflüger 2024-10-19  1541  					temperature = <90000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1542  					hysteresis = <2000>;
23825a1c0be133 Otto Pflüger 2024-10-19  1543  					type = "critical";
23825a1c0be133 Otto Pflüger 2024-10-19  1544  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1545  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1546  
23825a1c0be133 Otto Pflüger 2024-10-19  1547  			cooling-maps {
23825a1c0be133 Otto Pflüger 2024-10-19  1548  				map0 {
23825a1c0be133 Otto Pflüger 2024-10-19  1549  					trip = <&gpu_alert>;
23825a1c0be133 Otto Pflüger 2024-10-19  1550  					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
23825a1c0be133 Otto Pflüger 2024-10-19  1551  				};
23825a1c0be133 Otto Pflüger 2024-10-19  1552  			};
23825a1c0be133 Otto Pflüger 2024-10-19  1553  		};
23825a1c0be133 Otto Pflüger 2024-10-19  1554  	};
23825a1c0be133 Otto Pflüger 2024-10-19  1555  };
23825a1c0be133 Otto Pflüger 2024-10-19  1556  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
