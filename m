Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DD84A3E
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 22:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737585582; cv=none; b=nrq8K7LDjVe7v7+lAivpF2CYeT0l3Ol6BVShvS4cT2DxhxxCOfOZvocakIks7Qg5ifuFgW7R1MdVVMR0Qq3ytZZC9vcRXkI3dfL6dRQEtuQp9UraZ9B335c3O9hTz+ZgBZUyb+hauAhiuOmi96dB8Ozn/UcmXct2Yyp6bO9j/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737585582; c=relaxed/simple;
	bh=52AhqEXjxYzm+htrD+GQM8raPx1a1UHCaZZJkbRhcOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JuTdCygwMl4lGX9pSqMY+soTRPd+87wE9L2F4+Db/bzZE9zIk9ocumjv3atJOusKIT7hPRpPp1E5ZmGUYIT+noU9LXCQKRxGMmTMHejPk3rqRPgRG8zDry4Jj69bzSmCUnv1BtTXQM37Z5uuV93E47QKqZaTW9qglta6e+kD0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZYAtWCH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZYAtWCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737585579; x=1769121579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=52AhqEXjxYzm+htrD+GQM8raPx1a1UHCaZZJkbRhcOo=;
  b=CZYAtWCHMBhxpsJPYZ5DvftNu8CFlbob8Zzyqx+MESn7zjp6wtXd1Kxj
   mDmDXkFtVN6baBcV3k7cFXbeRWDWxoE3aGoOjrfHK4GsDamqZ6/DJ4Zhq
   Q2IYPwOcSqxded0u8zD8eMtKH5UfFR2KGJvGmhfyri+0Mhe+jwOiJ2cwx
   qB2AAi+9v8gXRtHwcb2Mrhw/u3cEmWyigw4j8rM1rhQXwyf0uVzRgtFm9
   +U8WnGt8d2++k8D7M77Iw3XSqV4py5I6z1lLzY1VmL4Gd4y+a8BzgrOTV
   Ni+LH+uwnjJzMjsFrEIQVaLYahIkE+ZuyJmIjzpOg4Ozufx0wIfBd+hG2
   g==;
X-CSE-ConnectionGUID: mVKldaZbQ7eZSQ6XP7hB4w==
X-CSE-MsgGUID: DqN1kvanS+Wj0wTK/NToAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38095704"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="38095704"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 14:39:38 -0800
X-CSE-ConnectionGUID: KJgEn8A5RMCGMArWGR3/Pw==
X-CSE-MsgGUID: vz3clWCORy23OTeJD5ubbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107706957"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jan 2025 14:39:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tajNm-000aNX-0S;
	Wed, 22 Jan 2025 22:39:34 +0000
Date: Thu, 23 Jan 2025 06:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 4/7] arm64: dts: qcom: ipq9574: Reorder reg and
 reg-names
Message-ID: <202501230653.Zc6gMuls-lkp@intel.com>
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
In-Reply-To: <20250122063411.3503097-5-quic_varada@quicinc.com>
References: <20250122063411.3503097-5-quic_varada@quicinc.com>
TO: Varadarajan Narayanan <quic_varada@quicinc.com>
TO: bhelgaas@google.com
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: manivannan.sadhasivam@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: p.zabel@pengutronix.de
TO: dmitry.baryshkov@linaro.org
TO: quic_nsekar@quicinc.com
TO: quic_varada@quicinc.com
TO: linux-arm-msm@vger.kernel.org
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-phy@lists.infradead.org

Hi Varadarajan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 37136bf5c3a6f6b686d74f41837a6406bec6b7bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/dt-bindings-phy-qcom-uniphy-pcie-Document-PCIe-uniphy/20250122-143841
base:   37136bf5c3a6f6b686d74f41837a6406bec6b7bc
patch link:    https://lore.kernel.org/r/20250122063411.3503097-5-quic_varada%40quicinc.com
patch subject: [PATCH v7 4/7] arm64: dts: qcom: ipq9574: Reorder reg and reg-names
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-003-20250123 (https://download.01.org/0day-ci/archive/20250123/202501230653.Zc6gMuls-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230653.Zc6gMuls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501230653.Zc6gMuls-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:877.24-959.5: Warning (simple_bus_reg): /soc@0/pcie@10000000: simple-bus unit address format error, expected "f8000"
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:961.24-1043.5: Warning (simple_bus_reg): /soc@0/pcie@18000000: simple-bus unit address format error, expected "f0000"
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:1045.24-1127.5: Warning (simple_bus_reg): /soc@0/pcie@20000000: simple-bus unit address format error, expected "88000"
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:1129.23-1210.5: Warning (simple_bus_reg): /soc@0/pci@28000000: simple-bus unit address format error, expected "80000"
--
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:877.24-959.5: Warning (simple_bus_reg): /soc@0/pcie@10000000: simple-bus unit address format error, expected "f8000"
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:961.24-1043.5: Warning (simple_bus_reg): /soc@0/pcie@18000000: simple-bus unit address format error, expected "f0000"
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:1045.24-1127.5: Warning (simple_bus_reg): /soc@0/pcie@20000000: simple-bus unit address format error, expected "88000"
>> arch/arm64/boot/dts/qcom/ipq9574.dtsi:1129.23-1210.5: Warning (simple_bus_reg): /soc@0/pci@28000000: simple-bus unit address format error, expected "80000"

vim +/f8000 +877 arch/arm64/boot/dts/qcom/ipq9574.dtsi

97cb36ff52a106 Devi Priya              2023-03-16    16  
97cb36ff52a106 Devi Priya              2023-03-16    17  / {
97cb36ff52a106 Devi Priya              2023-03-16    18  	interrupt-parent = <&intc>;
97cb36ff52a106 Devi Priya              2023-03-16    19  	#address-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16    20  	#size-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16    21  
97cb36ff52a106 Devi Priya              2023-03-16    22  	clocks {
758aa2d7e3c0ac Luo Jie                 2025-01-03    23  		ref_48mhz_clk: ref-48mhz-clk {
758aa2d7e3c0ac Luo Jie                 2025-01-03    24  			compatible = "fixed-factor-clock";
758aa2d7e3c0ac Luo Jie                 2025-01-03    25  			clocks = <&xo_clk>;
758aa2d7e3c0ac Luo Jie                 2025-01-03    26  			#clock-cells = <0>;
758aa2d7e3c0ac Luo Jie                 2025-01-03    27  		};
758aa2d7e3c0ac Luo Jie                 2025-01-03    28  
97cb36ff52a106 Devi Priya              2023-03-16    29  		sleep_clk: sleep-clk {
97cb36ff52a106 Devi Priya              2023-03-16    30  			compatible = "fixed-clock";
97cb36ff52a106 Devi Priya              2023-03-16    31  			#clock-cells = <0>;
97cb36ff52a106 Devi Priya              2023-03-16    32  		};
97cb36ff52a106 Devi Priya              2023-03-16    33  
97cb36ff52a106 Devi Priya              2023-03-16    34  		xo_board_clk: xo-board-clk {
050b312654523a Luo Jie                 2025-01-03    35  			compatible = "fixed-factor-clock";
050b312654523a Luo Jie                 2025-01-03    36  			clocks = <&ref_48mhz_clk>;
97cb36ff52a106 Devi Priya              2023-03-16    37  			#clock-cells = <0>;
97cb36ff52a106 Devi Priya              2023-03-16    38  		};
758aa2d7e3c0ac Luo Jie                 2025-01-03    39  
758aa2d7e3c0ac Luo Jie                 2025-01-03    40  		xo_clk: xo-clk {
758aa2d7e3c0ac Luo Jie                 2025-01-03    41  			compatible = "fixed-clock";
758aa2d7e3c0ac Luo Jie                 2025-01-03    42  			#clock-cells = <0>;
758aa2d7e3c0ac Luo Jie                 2025-01-03    43  		};
97cb36ff52a106 Devi Priya              2023-03-16    44  	};
97cb36ff52a106 Devi Priya              2023-03-16    45  
97cb36ff52a106 Devi Priya              2023-03-16    46  	cpus {
97cb36ff52a106 Devi Priya              2023-03-16    47  		#address-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16    48  		#size-cells = <0>;
97cb36ff52a106 Devi Priya              2023-03-16    49  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    50  		cpu0: cpu@0 {
97cb36ff52a106 Devi Priya              2023-03-16    51  			device_type = "cpu";
97cb36ff52a106 Devi Priya              2023-03-16    52  			compatible = "arm,cortex-a73";
97cb36ff52a106 Devi Priya              2023-03-16    53  			reg = <0x0>;
97cb36ff52a106 Devi Priya              2023-03-16    54  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    55  			next-level-cache = <&l2_0>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    56  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    57  			clock-names = "cpu";
8f0ae6bc0098f6 Devi Priya              2023-05-17    58  			operating-points-v2 = <&cpu_opp_table>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    59  			cpu-supply = <&ipq9574_s1>;
752f585805c559 Praveenkumar I          2023-07-13    60  			#cooling-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16    61  		};
97cb36ff52a106 Devi Priya              2023-03-16    62  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    63  		cpu1: cpu@1 {
97cb36ff52a106 Devi Priya              2023-03-16    64  			device_type = "cpu";
97cb36ff52a106 Devi Priya              2023-03-16    65  			compatible = "arm,cortex-a73";
97cb36ff52a106 Devi Priya              2023-03-16    66  			reg = <0x1>;
97cb36ff52a106 Devi Priya              2023-03-16    67  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    68  			next-level-cache = <&l2_0>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    69  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    70  			clock-names = "cpu";
8f0ae6bc0098f6 Devi Priya              2023-05-17    71  			operating-points-v2 = <&cpu_opp_table>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    72  			cpu-supply = <&ipq9574_s1>;
752f585805c559 Praveenkumar I          2023-07-13    73  			#cooling-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16    74  		};
97cb36ff52a106 Devi Priya              2023-03-16    75  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    76  		cpu2: cpu@2 {
97cb36ff52a106 Devi Priya              2023-03-16    77  			device_type = "cpu";
97cb36ff52a106 Devi Priya              2023-03-16    78  			compatible = "arm,cortex-a73";
97cb36ff52a106 Devi Priya              2023-03-16    79  			reg = <0x2>;
97cb36ff52a106 Devi Priya              2023-03-16    80  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    81  			next-level-cache = <&l2_0>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    82  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    83  			clock-names = "cpu";
8f0ae6bc0098f6 Devi Priya              2023-05-17    84  			operating-points-v2 = <&cpu_opp_table>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    85  			cpu-supply = <&ipq9574_s1>;
752f585805c559 Praveenkumar I          2023-07-13    86  			#cooling-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16    87  		};
97cb36ff52a106 Devi Priya              2023-03-16    88  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    89  		cpu3: cpu@3 {
97cb36ff52a106 Devi Priya              2023-03-16    90  			device_type = "cpu";
97cb36ff52a106 Devi Priya              2023-03-16    91  			compatible = "arm,cortex-a73";
97cb36ff52a106 Devi Priya              2023-03-16    92  			reg = <0x3>;
97cb36ff52a106 Devi Priya              2023-03-16    93  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22    94  			next-level-cache = <&l2_0>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    95  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    96  			clock-names = "cpu";
8f0ae6bc0098f6 Devi Priya              2023-05-17    97  			operating-points-v2 = <&cpu_opp_table>;
8f0ae6bc0098f6 Devi Priya              2023-05-17    98  			cpu-supply = <&ipq9574_s1>;
752f585805c559 Praveenkumar I          2023-07-13    99  			#cooling-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16   100  		};
97cb36ff52a106 Devi Priya              2023-03-16   101  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22   102  		l2_0: l2-cache {
97cb36ff52a106 Devi Priya              2023-03-16   103  			compatible = "cache";
97cb36ff52a106 Devi Priya              2023-03-16   104  			cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski     2023-04-16   105  			cache-unified;
97cb36ff52a106 Devi Priya              2023-03-16   106  		};
97cb36ff52a106 Devi Priya              2023-03-16   107  	};
97cb36ff52a106 Devi Priya              2023-03-16   108  
590db411752dd8 Poovendhan Selvaraj     2023-05-11   109  	firmware {
590db411752dd8 Poovendhan Selvaraj     2023-05-11   110  		scm {
590db411752dd8 Poovendhan Selvaraj     2023-05-11   111  			compatible = "qcom,scm-ipq9574", "qcom,scm";
590db411752dd8 Poovendhan Selvaraj     2023-05-11   112  			qcom,dload-mode = <&tcsr 0x6100>;
590db411752dd8 Poovendhan Selvaraj     2023-05-11   113  		};
590db411752dd8 Poovendhan Selvaraj     2023-05-11   114  	};
590db411752dd8 Poovendhan Selvaraj     2023-05-11   115  
97cb36ff52a106 Devi Priya              2023-03-16   116  	memory@40000000 {
97cb36ff52a106 Devi Priya              2023-03-16   117  		device_type = "memory";
97cb36ff52a106 Devi Priya              2023-03-16   118  		/* We expect the bootloader to fill in the size */
97cb36ff52a106 Devi Priya              2023-03-16   119  		reg = <0x0 0x40000000 0x0 0x0>;
97cb36ff52a106 Devi Priya              2023-03-16   120  	};
97cb36ff52a106 Devi Priya              2023-03-16   121  
8f0ae6bc0098f6 Devi Priya              2023-05-17   122  	cpu_opp_table: opp-table-cpu {
b36074357baf27 Varadarajan Narayanan   2023-10-20   123  		compatible = "operating-points-v2-kryo-cpu";
8f0ae6bc0098f6 Devi Priya              2023-05-17   124  		opp-shared;
b36074357baf27 Varadarajan Narayanan   2023-10-20   125  		nvmem-cells = <&cpu_speed_bin>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   126  
8f0ae6bc0098f6 Devi Priya              2023-05-17   127  		opp-936000000 {
8f0ae6bc0098f6 Devi Priya              2023-05-17   128  			opp-hz = /bits/ 64 <936000000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   129  			opp-microvolt = <725000>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   130  			opp-supported-hw = <0xf>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   131  			clock-latency-ns = <200000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   132  		};
8f0ae6bc0098f6 Devi Priya              2023-05-17   133  
8f0ae6bc0098f6 Devi Priya              2023-05-17   134  		opp-1104000000 {
8f0ae6bc0098f6 Devi Priya              2023-05-17   135  			opp-hz = /bits/ 64 <1104000000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   136  			opp-microvolt = <787500>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   137  			opp-supported-hw = <0xf>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   138  			clock-latency-ns = <200000>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   139  		};
b36074357baf27 Varadarajan Narayanan   2023-10-20   140  
b36074357baf27 Varadarajan Narayanan   2023-10-20   141  		opp-1200000000 {
b36074357baf27 Varadarajan Narayanan   2023-10-20   142  			opp-hz = /bits/ 64 <1200000000>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   143  			opp-microvolt = <862500>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   144  			opp-supported-hw = <0xf>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   145  			clock-latency-ns = <200000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   146  		};
8f0ae6bc0098f6 Devi Priya              2023-05-17   147  
8f0ae6bc0098f6 Devi Priya              2023-05-17   148  		opp-1416000000 {
8f0ae6bc0098f6 Devi Priya              2023-05-17   149  			opp-hz = /bits/ 64 <1416000000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   150  			opp-microvolt = <862500>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   151  			opp-supported-hw = <0x7>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   152  			clock-latency-ns = <200000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   153  		};
8f0ae6bc0098f6 Devi Priya              2023-05-17   154  
8f0ae6bc0098f6 Devi Priya              2023-05-17   155  		opp-1488000000 {
8f0ae6bc0098f6 Devi Priya              2023-05-17   156  			opp-hz = /bits/ 64 <1488000000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   157  			opp-microvolt = <925000>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   158  			opp-supported-hw = <0x7>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   159  			clock-latency-ns = <200000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   160  		};
8f0ae6bc0098f6 Devi Priya              2023-05-17   161  
8f0ae6bc0098f6 Devi Priya              2023-05-17   162  		opp-1800000000 {
8f0ae6bc0098f6 Devi Priya              2023-05-17   163  			opp-hz = /bits/ 64 <1800000000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   164  			opp-microvolt = <987500>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   165  			opp-supported-hw = <0x5>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   166  			clock-latency-ns = <200000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   167  		};
8f0ae6bc0098f6 Devi Priya              2023-05-17   168  
8f0ae6bc0098f6 Devi Priya              2023-05-17   169  		opp-2208000000 {
8f0ae6bc0098f6 Devi Priya              2023-05-17   170  			opp-hz = /bits/ 64 <2208000000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   171  			opp-microvolt = <1062500>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   172  			opp-supported-hw = <0x1>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   173  			clock-latency-ns = <200000>;
8f0ae6bc0098f6 Devi Priya              2023-05-17   174  		};
8f0ae6bc0098f6 Devi Priya              2023-05-17   175  	};
8f0ae6bc0098f6 Devi Priya              2023-05-17   176  
97cb36ff52a106 Devi Priya              2023-03-16   177  	pmu {
97cb36ff52a106 Devi Priya              2023-03-16   178  		compatible = "arm,cortex-a73-pmu";
97cb36ff52a106 Devi Priya              2023-03-16   179  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
97cb36ff52a106 Devi Priya              2023-03-16   180  	};
97cb36ff52a106 Devi Priya              2023-03-16   181  
97cb36ff52a106 Devi Priya              2023-03-16   182  	psci {
97cb36ff52a106 Devi Priya              2023-03-16   183  		compatible = "arm,psci-1.0";
97cb36ff52a106 Devi Priya              2023-03-16   184  		method = "smc";
97cb36ff52a106 Devi Priya              2023-03-16   185  	};
97cb36ff52a106 Devi Priya              2023-03-16   186  
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   187  	rpm: remoteproc {
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   188  		compatible = "qcom,ipq9574-rpm-proc", "qcom,rpm-proc";
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   189  
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   190  		glink-edge {
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   191  			compatible = "qcom,glink-rpm";
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   192  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   193  			qcom,rpm-msg-ram = <&rpm_msg_ram>;
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   194  			mboxes = <&apcs_glb 0>;
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   195  
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   196  			rpm_requests: rpm-requests {
0b7d94e9d15d90 Dmitry Baryshkov        2024-07-29   197  				compatible = "qcom,rpm-ipq9574", "qcom,glink-smd-rpm";
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   198  				qcom,glink-channels = "rpm_requests";
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   199  			};
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   200  		};
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   201  	};
7e1acc8b92a3b6 Stephan Gerhold         2023-06-15   202  
97cb36ff52a106 Devi Priya              2023-03-16   203  	reserved-memory {
97cb36ff52a106 Devi Priya              2023-03-16   204  		#address-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16   205  		#size-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16   206  		ranges;
97cb36ff52a106 Devi Priya              2023-03-16   207  
f684391e3d323b Anusha Rao              2023-06-02   208  		bootloader@4a100000 {
f684391e3d323b Anusha Rao              2023-06-02   209  			reg = <0x0 0x4a100000 0x0 0x400000>;
f684391e3d323b Anusha Rao              2023-06-02   210  			no-map;
f684391e3d323b Anusha Rao              2023-06-02   211  		};
f684391e3d323b Anusha Rao              2023-06-02   212  
f684391e3d323b Anusha Rao              2023-06-02   213  		sbl@4a500000 {
f684391e3d323b Anusha Rao              2023-06-02   214  			reg = <0x0 0x4a500000 0x0 0x100000>;
f684391e3d323b Anusha Rao              2023-06-02   215  			no-map;
f684391e3d323b Anusha Rao              2023-06-02   216  		};
f684391e3d323b Anusha Rao              2023-06-02   217  
97cb36ff52a106 Devi Priya              2023-03-16   218  		tz_region: tz@4a600000 {
97cb36ff52a106 Devi Priya              2023-03-16   219  			reg = <0x0 0x4a600000 0x0 0x400000>;
97cb36ff52a106 Devi Priya              2023-03-16   220  			no-map;
97cb36ff52a106 Devi Priya              2023-03-16   221  		};
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   222  
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   223  		smem@4aa00000 {
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   224  			compatible = "qcom,smem";
f684391e3d323b Anusha Rao              2023-06-02   225  			reg = <0x0 0x4aa00000 0x0 0x100000>;
5fe8508e2bc8eb Vignesh Viswanathan     2023-09-04   226  			hwlocks = <&tcsr_mutex 3>;
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   227  			no-map;
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   228  		};
97cb36ff52a106 Devi Priya              2023-03-16   229  	};
97cb36ff52a106 Devi Priya              2023-03-16   230  
97cb36ff52a106 Devi Priya              2023-03-16   231  	soc: soc@0 {
97cb36ff52a106 Devi Priya              2023-03-16   232  		compatible = "simple-bus";
97cb36ff52a106 Devi Priya              2023-03-16   233  		#address-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   234  		#size-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   235  		ranges = <0 0 0 0xffffffff>;
97cb36ff52a106 Devi Priya              2023-03-16   236  
8cc864a4375dd6 Devi Priya              2023-05-17   237  		rpm_msg_ram: sram@60000 {
8cc864a4375dd6 Devi Priya              2023-05-17   238  			compatible = "qcom,rpm-msg-ram";
8cc864a4375dd6 Devi Priya              2023-05-17   239  			reg = <0x00060000 0x6000>;
8cc864a4375dd6 Devi Priya              2023-05-17   240  		};
8cc864a4375dd6 Devi Priya              2023-05-17   241  
d80c7fbfa908e3 devi priya              2024-08-01   242  		pcie0_phy: phy@84000 {
d80c7fbfa908e3 devi priya              2024-08-01   243  			compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
d80c7fbfa908e3 devi priya              2024-08-01   244  			reg = <0x00084000 0x1000>;
d80c7fbfa908e3 devi priya              2024-08-01   245  
d80c7fbfa908e3 devi priya              2024-08-01   246  			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   247  				 <&gcc GCC_PCIE0_AHB_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   248  				 <&gcc GCC_PCIE0_PIPE_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   249  			clock-names = "aux", "cfg_ahb", "pipe";
d80c7fbfa908e3 devi priya              2024-08-01   250  
d80c7fbfa908e3 devi priya              2024-08-01   251  			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   252  			assigned-clock-rates = <20000000>;
d80c7fbfa908e3 devi priya              2024-08-01   253  
d80c7fbfa908e3 devi priya              2024-08-01   254  			resets = <&gcc GCC_PCIE0_PHY_BCR>,
d80c7fbfa908e3 devi priya              2024-08-01   255  				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
d80c7fbfa908e3 devi priya              2024-08-01   256  			reset-names = "phy", "common";
d80c7fbfa908e3 devi priya              2024-08-01   257  
d80c7fbfa908e3 devi priya              2024-08-01   258  			#clock-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   259  			clock-output-names = "gcc_pcie0_pipe_clk_src";
d80c7fbfa908e3 devi priya              2024-08-01   260  
d80c7fbfa908e3 devi priya              2024-08-01   261  			#phy-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   262  			status = "disabled";
d80c7fbfa908e3 devi priya              2024-08-01   263  		};
d80c7fbfa908e3 devi priya              2024-08-01   264  
d80c7fbfa908e3 devi priya              2024-08-01   265  		pcie2_phy: phy@8c000 {
d80c7fbfa908e3 devi priya              2024-08-01   266  			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
d80c7fbfa908e3 devi priya              2024-08-01   267  			reg = <0x0008c000 0x2000>;
d80c7fbfa908e3 devi priya              2024-08-01   268  
d80c7fbfa908e3 devi priya              2024-08-01   269  			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   270  				 <&gcc GCC_PCIE2_AHB_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   271  				 <&gcc GCC_PCIE2_PIPE_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   272  			clock-names = "aux", "cfg_ahb", "pipe";
d80c7fbfa908e3 devi priya              2024-08-01   273  
d80c7fbfa908e3 devi priya              2024-08-01   274  			assigned-clocks = <&gcc GCC_PCIE2_AUX_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   275  			assigned-clock-rates = <20000000>;
d80c7fbfa908e3 devi priya              2024-08-01   276  
d80c7fbfa908e3 devi priya              2024-08-01   277  			resets = <&gcc GCC_PCIE2_PHY_BCR>,
d80c7fbfa908e3 devi priya              2024-08-01   278  				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
d80c7fbfa908e3 devi priya              2024-08-01   279  			reset-names = "phy", "common";
d80c7fbfa908e3 devi priya              2024-08-01   280  
d80c7fbfa908e3 devi priya              2024-08-01   281  			#clock-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   282  			clock-output-names = "gcc_pcie2_pipe_clk_src";
d80c7fbfa908e3 devi priya              2024-08-01   283  
d80c7fbfa908e3 devi priya              2024-08-01   284  			#phy-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   285  			status = "disabled";
d80c7fbfa908e3 devi priya              2024-08-01   286  		};
d80c7fbfa908e3 devi priya              2024-08-01   287  
9ef42640504e09 Kathiravan T            2023-05-17   288  		rng: rng@e3000 {
b3d6e8c68c3a69 Md Sadre Alam           2024-12-26   289  			compatible = "qcom,ipq9574-trng", "qcom,trng";
9ef42640504e09 Kathiravan T            2023-05-17   290  			reg = <0x000e3000 0x1000>;
9ef42640504e09 Kathiravan T            2023-05-17   291  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   292  			clock-names = "core";
9ef42640504e09 Kathiravan T            2023-05-17   293  		};
9ef42640504e09 Kathiravan T            2023-05-17   294  
e60ac570137b42 Alexandru Gagniuc       2024-05-06   295  		mdio: mdio@90000 {
e60ac570137b42 Alexandru Gagniuc       2024-05-06   296  			compatible = "qcom,ipq9574-mdio", "qcom,ipq4019-mdio";
e60ac570137b42 Alexandru Gagniuc       2024-05-06   297  			reg = <0x00090000 0x64>;
e60ac570137b42 Alexandru Gagniuc       2024-05-06   298  			#address-cells = <1>;
e60ac570137b42 Alexandru Gagniuc       2024-05-06   299  			#size-cells = <0>;
e60ac570137b42 Alexandru Gagniuc       2024-05-06   300  			clocks = <&gcc GCC_MDIO_AHB_CLK>;
e60ac570137b42 Alexandru Gagniuc       2024-05-06   301  			clock-names = "gcc_mdio_ahb_clk";
e60ac570137b42 Alexandru Gagniuc       2024-05-06   302  			status = "disabled";
e60ac570137b42 Alexandru Gagniuc       2024-05-06   303  		};
e60ac570137b42 Alexandru Gagniuc       2024-05-06   304  
d80c7fbfa908e3 devi priya              2024-08-01   305  		pcie3_phy: phy@f4000 {
d80c7fbfa908e3 devi priya              2024-08-01   306  			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
d80c7fbfa908e3 devi priya              2024-08-01   307  			reg = <0x000f4000 0x2000>;
d80c7fbfa908e3 devi priya              2024-08-01   308  
d80c7fbfa908e3 devi priya              2024-08-01   309  			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   310  				 <&gcc GCC_PCIE3_AHB_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   311  				 <&gcc GCC_PCIE3_PIPE_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   312  			clock-names = "aux", "cfg_ahb", "pipe";
d80c7fbfa908e3 devi priya              2024-08-01   313  
d80c7fbfa908e3 devi priya              2024-08-01   314  			assigned-clocks = <&gcc GCC_PCIE3_AUX_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   315  			assigned-clock-rates = <20000000>;
d80c7fbfa908e3 devi priya              2024-08-01   316  
d80c7fbfa908e3 devi priya              2024-08-01   317  			resets = <&gcc GCC_PCIE3_PHY_BCR>,
d80c7fbfa908e3 devi priya              2024-08-01   318  				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
d80c7fbfa908e3 devi priya              2024-08-01   319  			reset-names = "phy", "common";
d80c7fbfa908e3 devi priya              2024-08-01   320  
d80c7fbfa908e3 devi priya              2024-08-01   321  			#clock-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   322  			clock-output-names = "gcc_pcie3_pipe_clk_src";
d80c7fbfa908e3 devi priya              2024-08-01   323  
d80c7fbfa908e3 devi priya              2024-08-01   324  			#phy-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   325  			status = "disabled";
d80c7fbfa908e3 devi priya              2024-08-01   326  		};
d80c7fbfa908e3 devi priya              2024-08-01   327  
d80c7fbfa908e3 devi priya              2024-08-01   328  		pcie1_phy: phy@fc000 {
d80c7fbfa908e3 devi priya              2024-08-01   329  			compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
d80c7fbfa908e3 devi priya              2024-08-01   330  			reg = <0x000fc000 0x1000>;
d80c7fbfa908e3 devi priya              2024-08-01   331  
d80c7fbfa908e3 devi priya              2024-08-01   332  			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   333  				 <&gcc GCC_PCIE1_AHB_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   334  				 <&gcc GCC_PCIE1_PIPE_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   335  			clock-names = "aux", "cfg_ahb", "pipe";
d80c7fbfa908e3 devi priya              2024-08-01   336  
d80c7fbfa908e3 devi priya              2024-08-01   337  			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   338  			assigned-clock-rates = <20000000>;
d80c7fbfa908e3 devi priya              2024-08-01   339  
d80c7fbfa908e3 devi priya              2024-08-01   340  			resets = <&gcc GCC_PCIE1_PHY_BCR>,
d80c7fbfa908e3 devi priya              2024-08-01   341  				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
d80c7fbfa908e3 devi priya              2024-08-01   342  			reset-names = "phy", "common";
d80c7fbfa908e3 devi priya              2024-08-01   343  
d80c7fbfa908e3 devi priya              2024-08-01   344  			#clock-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   345  			clock-output-names = "gcc_pcie1_pipe_clk_src";
d80c7fbfa908e3 devi priya              2024-08-01   346  
d80c7fbfa908e3 devi priya              2024-08-01   347  			#phy-cells = <0>;
d80c7fbfa908e3 devi priya              2024-08-01   348  			status = "disabled";
d80c7fbfa908e3 devi priya              2024-08-01   349  		};
d80c7fbfa908e3 devi priya              2024-08-01   350  
758aa2d7e3c0ac Luo Jie                 2025-01-03   351  		cmn_pll: clock-controller@9b000 {
758aa2d7e3c0ac Luo Jie                 2025-01-03   352  			compatible = "qcom,ipq9574-cmn-pll";
758aa2d7e3c0ac Luo Jie                 2025-01-03   353  			reg = <0x0009b000 0x800>;
758aa2d7e3c0ac Luo Jie                 2025-01-03   354  			clocks = <&ref_48mhz_clk>,
758aa2d7e3c0ac Luo Jie                 2025-01-03   355  				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
758aa2d7e3c0ac Luo Jie                 2025-01-03   356  				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
758aa2d7e3c0ac Luo Jie                 2025-01-03   357  			clock-names = "ref", "ahb", "sys";
758aa2d7e3c0ac Luo Jie                 2025-01-03   358  			#clock-cells = <1>;
758aa2d7e3c0ac Luo Jie                 2025-01-03   359  			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
758aa2d7e3c0ac Luo Jie                 2025-01-03   360  			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
758aa2d7e3c0ac Luo Jie                 2025-01-03   361  		};
758aa2d7e3c0ac Luo Jie                 2025-01-03   362  
05e6b82f395c40 Kathiravan T            2023-05-26   363  		qfprom: efuse@a4000 {
05e6b82f395c40 Kathiravan T            2023-05-26   364  			compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
05e6b82f395c40 Kathiravan T            2023-05-26   365  			reg = <0x000a4000 0x5a1>;
05e6b82f395c40 Kathiravan T            2023-05-26   366  			#address-cells = <1>;
05e6b82f395c40 Kathiravan T            2023-05-26   367  			#size-cells = <1>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   368  
b36074357baf27 Varadarajan Narayanan   2023-10-20   369  			cpu_speed_bin: cpu-speed-bin@15 {
b36074357baf27 Varadarajan Narayanan   2023-10-20   370  				reg = <0x15 0x2>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   371  				bits = <7 2>;
b36074357baf27 Varadarajan Narayanan   2023-10-20   372  			};
05e6b82f395c40 Kathiravan T            2023-05-26   373  		};
05e6b82f395c40 Kathiravan T            2023-05-26   374  
ffadc79ed99f0f Anusha Rao              2023-05-26   375  		cryptobam: dma-controller@704000 {
ffadc79ed99f0f Anusha Rao              2023-05-26   376  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
ffadc79ed99f0f Anusha Rao              2023-05-26   377  			reg = <0x00704000 0x20000>;
ffadc79ed99f0f Anusha Rao              2023-05-26   378  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
ffadc79ed99f0f Anusha Rao              2023-05-26   379  			#dma-cells = <1>;
ffadc79ed99f0f Anusha Rao              2023-05-26   380  			qcom,ee = <1>;
ffadc79ed99f0f Anusha Rao              2023-05-26   381  			qcom,controlled-remotely;
ffadc79ed99f0f Anusha Rao              2023-05-26   382  		};
ffadc79ed99f0f Anusha Rao              2023-05-26   383  
ffadc79ed99f0f Anusha Rao              2023-05-26   384  		crypto: crypto@73a000 {
ffadc79ed99f0f Anusha Rao              2023-05-26   385  			compatible = "qcom,ipq9574-qce", "qcom,ipq4019-qce", "qcom,qce";
ffadc79ed99f0f Anusha Rao              2023-05-26   386  			reg = <0x0073a000 0x6000>;
ffadc79ed99f0f Anusha Rao              2023-05-26   387  			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
ffadc79ed99f0f Anusha Rao              2023-05-26   388  				 <&gcc GCC_CRYPTO_AXI_CLK>,
ffadc79ed99f0f Anusha Rao              2023-05-26   389  				 <&gcc GCC_CRYPTO_CLK>;
ffadc79ed99f0f Anusha Rao              2023-05-26   390  			clock-names = "iface", "bus", "core";
ffadc79ed99f0f Anusha Rao              2023-05-26   391  			dmas = <&cryptobam 2>, <&cryptobam 3>;
ffadc79ed99f0f Anusha Rao              2023-05-26   392  			dma-names = "rx", "tx";
ffadc79ed99f0f Anusha Rao              2023-05-26   393  		};
ffadc79ed99f0f Anusha Rao              2023-05-26   394  
2e0580e10e919b Varadarajan Narayanan   2023-06-07   395  		tsens: thermal-sensor@4a9000 {
2e0580e10e919b Varadarajan Narayanan   2023-06-07   396  			compatible = "qcom,ipq9574-tsens", "qcom,ipq8074-tsens";
2e0580e10e919b Varadarajan Narayanan   2023-06-07   397  			reg = <0x004a9000 0x1000>,
2e0580e10e919b Varadarajan Narayanan   2023-06-07   398  			      <0x004a8000 0x1000>;
2e0580e10e919b Varadarajan Narayanan   2023-06-07   399  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
2e0580e10e919b Varadarajan Narayanan   2023-06-07   400  			interrupt-names = "combined";
2e0580e10e919b Varadarajan Narayanan   2023-06-07   401  			#qcom,sensors = <16>;
2e0580e10e919b Varadarajan Narayanan   2023-06-07   402  			#thermal-sensor-cells = <1>;
2e0580e10e919b Varadarajan Narayanan   2023-06-07   403  		};
2e0580e10e919b Varadarajan Narayanan   2023-06-07   404  
97cb36ff52a106 Devi Priya              2023-03-16   405  		tlmm: pinctrl@1000000 {
97cb36ff52a106 Devi Priya              2023-03-16   406  			compatible = "qcom,ipq9574-tlmm";
97cb36ff52a106 Devi Priya              2023-03-16   407  			reg = <0x01000000 0x300000>;
97cb36ff52a106 Devi Priya              2023-03-16   408  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   409  			gpio-controller;
97cb36ff52a106 Devi Priya              2023-03-16   410  			#gpio-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16   411  			gpio-ranges = <&tlmm 0 0 65>;
97cb36ff52a106 Devi Priya              2023-03-16   412  			interrupt-controller;
97cb36ff52a106 Devi Priya              2023-03-16   413  			#interrupt-cells = <2>;
97cb36ff52a106 Devi Priya              2023-03-16   414  
97cb36ff52a106 Devi Priya              2023-03-16   415  			uart2_pins: uart2-state {
97cb36ff52a106 Devi Priya              2023-03-16   416  				pins = "gpio34", "gpio35";
97cb36ff52a106 Devi Priya              2023-03-16   417  				function = "blsp2_uart";
97cb36ff52a106 Devi Priya              2023-03-16   418  				drive-strength = <8>;
97cb36ff52a106 Devi Priya              2023-03-16   419  				bias-disable;
97cb36ff52a106 Devi Priya              2023-03-16   420  			};
97cb36ff52a106 Devi Priya              2023-03-16   421  		};
97cb36ff52a106 Devi Priya              2023-03-16   422  
97cb36ff52a106 Devi Priya              2023-03-16   423  		gcc: clock-controller@1800000 {
97cb36ff52a106 Devi Priya              2023-03-16   424  			compatible = "qcom,ipq9574-gcc";
97cb36ff52a106 Devi Priya              2023-03-16   425  			reg = <0x01800000 0x80000>;
97cb36ff52a106 Devi Priya              2023-03-16   426  			clocks = <&xo_board_clk>,
97cb36ff52a106 Devi Priya              2023-03-16   427  				 <&sleep_clk>,
4fc6a939aba4c0 Devi Priya              2023-04-25   428  				 <0>,
d80c7fbfa908e3 devi priya              2024-08-01   429  				 <&pcie0_phy>,
d80c7fbfa908e3 devi priya              2024-08-01   430  				 <&pcie1_phy>,
d80c7fbfa908e3 devi priya              2024-08-01   431  				 <&pcie2_phy>,
d80c7fbfa908e3 devi priya              2024-08-01   432  				 <&pcie3_phy>,
97cb36ff52a106 Devi Priya              2023-03-16   433  				 <0>;
97cb36ff52a106 Devi Priya              2023-03-16   434  			#clock-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   435  			#reset-cells = <1>;
5d0ab61a700214 Varadarajan Narayanan   2024-04-30   436  			#interconnect-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   437  		};
97cb36ff52a106 Devi Priya              2023-03-16   438  
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   439  		tcsr_mutex: hwlock@1905000 {
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   440  			compatible = "qcom,tcsr-mutex";
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   441  			reg = <0x01905000 0x20000>;
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   442  			#hwlock-cells = <1>;
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   443  		};
46384ac7a61885 Poovendhan Selvaraj     2023-05-11   444  
590db411752dd8 Poovendhan Selvaraj     2023-05-11   445  		tcsr: syscon@1937000 {
590db411752dd8 Poovendhan Selvaraj     2023-05-11   446  			compatible = "qcom,tcsr-ipq9574", "syscon";
590db411752dd8 Poovendhan Selvaraj     2023-05-11   447  			reg = <0x01937000 0x21000>;
590db411752dd8 Poovendhan Selvaraj     2023-05-11   448  		};
590db411752dd8 Poovendhan Selvaraj     2023-05-11   449  
97cb36ff52a106 Devi Priya              2023-03-16   450  		sdhc_1: mmc@7804000 {
97cb36ff52a106 Devi Priya              2023-03-16   451  			compatible = "qcom,ipq9574-sdhci", "qcom,sdhci-msm-v5";
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   452  			reg = <0x07804000 0x1000>,
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   453  			      <0x07805000 0x1000>,
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   454  			      <0x07808000 0x2000>;
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   455  			reg-names = "hc", "cqhci", "ice";
97cb36ff52a106 Devi Priya              2023-03-16   456  
97cb36ff52a106 Devi Priya              2023-03-16   457  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
97cb36ff52a106 Devi Priya              2023-03-16   458  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   459  			interrupt-names = "hc_irq", "pwr_irq";
97cb36ff52a106 Devi Priya              2023-03-16   460  
97cb36ff52a106 Devi Priya              2023-03-16   461  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
97cb36ff52a106 Devi Priya              2023-03-16   462  				 <&gcc GCC_SDCC1_APPS_CLK>,
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   463  				 <&xo_board_clk>,
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   464  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   465  			clock-names = "iface", "core", "xo", "ice";
97cb36ff52a106 Devi Priya              2023-03-16   466  			non-removable;
2ae5e34d93cfe5 Vignesh Viswanathan     2023-12-15   467  			supports-cqe;
97cb36ff52a106 Devi Priya              2023-03-16   468  			status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   469  		};
97cb36ff52a106 Devi Priya              2023-03-16   470  
9ef42640504e09 Kathiravan T            2023-05-17   471  		blsp_dma: dma-controller@7884000 {
9ef42640504e09 Kathiravan T            2023-05-17   472  			compatible = "qcom,bam-v1.7.0";
9ef42640504e09 Kathiravan T            2023-05-17   473  			reg = <0x07884000 0x2b000>;
9ef42640504e09 Kathiravan T            2023-05-17   474  			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   475  			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   476  			clock-names = "bam_clk";
9ef42640504e09 Kathiravan T            2023-05-17   477  			#dma-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   478  			qcom,ee = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   479  		};
9ef42640504e09 Kathiravan T            2023-05-17   480  
9ef42640504e09 Kathiravan T            2023-05-17   481  		blsp1_uart0: serial@78af000 {
9ef42640504e09 Kathiravan T            2023-05-17   482  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
9ef42640504e09 Kathiravan T            2023-05-17   483  			reg = <0x078af000 0x200>;
9ef42640504e09 Kathiravan T            2023-05-17   484  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   485  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   486  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   487  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   488  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   489  		};
9ef42640504e09 Kathiravan T            2023-05-17   490  
9ef42640504e09 Kathiravan T            2023-05-17   491  		blsp1_uart1: serial@78b0000 {
9ef42640504e09 Kathiravan T            2023-05-17   492  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
9ef42640504e09 Kathiravan T            2023-05-17   493  			reg = <0x078b0000 0x200>;
9ef42640504e09 Kathiravan T            2023-05-17   494  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   495  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   496  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   497  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   498  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   499  		};
9ef42640504e09 Kathiravan T            2023-05-17   500  
97cb36ff52a106 Devi Priya              2023-03-16   501  		blsp1_uart2: serial@78b1000 {
97cb36ff52a106 Devi Priya              2023-03-16   502  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
97cb36ff52a106 Devi Priya              2023-03-16   503  			reg = <0x078b1000 0x200>;
97cb36ff52a106 Devi Priya              2023-03-16   504  			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   505  			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
97cb36ff52a106 Devi Priya              2023-03-16   506  				 <&gcc GCC_BLSP1_AHB_CLK>;
97cb36ff52a106 Devi Priya              2023-03-16   507  			clock-names = "core", "iface";
97cb36ff52a106 Devi Priya              2023-03-16   508  			status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   509  		};
97cb36ff52a106 Devi Priya              2023-03-16   510  
9ef42640504e09 Kathiravan T            2023-05-17   511  		blsp1_uart3: serial@78b2000 {
9ef42640504e09 Kathiravan T            2023-05-17   512  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
9ef42640504e09 Kathiravan T            2023-05-17   513  			reg = <0x078b2000 0x200>;
9ef42640504e09 Kathiravan T            2023-05-17   514  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   515  			clocks = <&gcc GCC_BLSP1_UART4_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   516  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   517  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   518  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   519  		};
9ef42640504e09 Kathiravan T            2023-05-17   520  
9ef42640504e09 Kathiravan T            2023-05-17   521  		blsp1_uart4: serial@78b3000 {
9ef42640504e09 Kathiravan T            2023-05-17   522  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
9ef42640504e09 Kathiravan T            2023-05-17   523  			reg = <0x078b3000 0x200>;
9ef42640504e09 Kathiravan T            2023-05-17   524  			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   525  			clocks = <&gcc GCC_BLSP1_UART5_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   526  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   527  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   528  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   529  		};
9ef42640504e09 Kathiravan T            2023-05-17   530  
9ef42640504e09 Kathiravan T            2023-05-17   531  		blsp1_uart5: serial@78b4000 {
9ef42640504e09 Kathiravan T            2023-05-17   532  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
9ef42640504e09 Kathiravan T            2023-05-17   533  			reg = <0x078b4000 0x200>;
9ef42640504e09 Kathiravan T            2023-05-17   534  			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   535  			clocks = <&gcc GCC_BLSP1_UART6_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   536  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   537  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   538  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   539  		};
9ef42640504e09 Kathiravan T            2023-05-17   540  
9ef42640504e09 Kathiravan T            2023-05-17   541  		blsp1_spi0: spi@78b5000 {
9ef42640504e09 Kathiravan T            2023-05-17   542  			compatible = "qcom,spi-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   543  			reg = <0x078b5000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   544  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   545  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   546  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   547  			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   548  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   549  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   550  			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
9ef42640504e09 Kathiravan T            2023-05-17   551  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   552  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   553  		};
9ef42640504e09 Kathiravan T            2023-05-17   554  
9ef42640504e09 Kathiravan T            2023-05-17   555  		blsp1_i2c1: i2c@78b6000 {
9ef42640504e09 Kathiravan T            2023-05-17   556  			compatible = "qcom,i2c-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   557  			reg = <0x078b6000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   558  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   559  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   560  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   561  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   562  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   563  			clock-names = "core", "iface";
5229c1d6a0c7d7 Devi Priya              2023-06-15   564  			assigned-clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
5229c1d6a0c7d7 Devi Priya              2023-06-15   565  			assigned-clock-rates = <50000000>;
9ef42640504e09 Kathiravan T            2023-05-17   566  			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
9ef42640504e09 Kathiravan T            2023-05-17   567  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   568  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   569  		};
9ef42640504e09 Kathiravan T            2023-05-17   570  
9ef42640504e09 Kathiravan T            2023-05-17   571  		blsp1_spi1: spi@78b6000 {
9ef42640504e09 Kathiravan T            2023-05-17   572  			compatible = "qcom,spi-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   573  			reg = <0x078b6000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   574  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   575  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   576  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   577  			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   578  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   579  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   580  			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
9ef42640504e09 Kathiravan T            2023-05-17   581  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   582  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   583  		};
9ef42640504e09 Kathiravan T            2023-05-17   584  
9ef42640504e09 Kathiravan T            2023-05-17   585  		blsp1_i2c2: i2c@78b7000 {
9ef42640504e09 Kathiravan T            2023-05-17   586  			compatible = "qcom,i2c-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   587  			reg = <0x078b7000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   588  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   589  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   590  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   591  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   592  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   593  			clock-names = "core", "iface";
5229c1d6a0c7d7 Devi Priya              2023-06-15   594  			assigned-clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
5229c1d6a0c7d7 Devi Priya              2023-06-15   595  			assigned-clock-rates = <50000000>;
9ef42640504e09 Kathiravan T            2023-05-17   596  			dmas = <&blsp_dma 16>, <&blsp_dma 17>;
9ef42640504e09 Kathiravan T            2023-05-17   597  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   598  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   599  		};
9ef42640504e09 Kathiravan T            2023-05-17   600  
9ef42640504e09 Kathiravan T            2023-05-17   601  		blsp1_spi2: spi@78b7000 {
9ef42640504e09 Kathiravan T            2023-05-17   602  			compatible = "qcom,spi-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   603  			reg = <0x078b7000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   604  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   605  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   606  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   607  			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   608  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   609  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   610  			dmas = <&blsp_dma 16>, <&blsp_dma 17>;
9ef42640504e09 Kathiravan T            2023-05-17   611  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   612  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   613  		};
9ef42640504e09 Kathiravan T            2023-05-17   614  
9ef42640504e09 Kathiravan T            2023-05-17   615  		blsp1_i2c3: i2c@78b8000 {
9ef42640504e09 Kathiravan T            2023-05-17   616  			compatible = "qcom,i2c-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   617  			reg = <0x078b8000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   618  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   619  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   620  			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   621  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   622  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   623  			clock-names = "core", "iface";
5229c1d6a0c7d7 Devi Priya              2023-06-15   624  			assigned-clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
5229c1d6a0c7d7 Devi Priya              2023-06-15   625  			assigned-clock-rates = <50000000>;
9ef42640504e09 Kathiravan T            2023-05-17   626  			dmas = <&blsp_dma 18>, <&blsp_dma 19>;
9ef42640504e09 Kathiravan T            2023-05-17   627  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   628  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   629  		};
9ef42640504e09 Kathiravan T            2023-05-17   630  
9ef42640504e09 Kathiravan T            2023-05-17   631  		blsp1_spi3: spi@78b8000 {
9ef42640504e09 Kathiravan T            2023-05-17   632  			compatible = "qcom,spi-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   633  			reg = <0x078b8000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   634  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   635  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   636  			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   637  			spi-max-frequency = <50000000>;
9ef42640504e09 Kathiravan T            2023-05-17   638  			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   639  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   640  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   641  			dmas = <&blsp_dma 18>, <&blsp_dma 19>;
9ef42640504e09 Kathiravan T            2023-05-17   642  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   643  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   644  		};
9ef42640504e09 Kathiravan T            2023-05-17   645  
9ef42640504e09 Kathiravan T            2023-05-17   646  		blsp1_i2c4: i2c@78b9000 {
9ef42640504e09 Kathiravan T            2023-05-17   647  			compatible = "qcom,i2c-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   648  			reg = <0x078b9000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   649  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   650  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   651  			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   652  			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   653  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   654  			clock-names = "core", "iface";
5229c1d6a0c7d7 Devi Priya              2023-06-15   655  			assigned-clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
5229c1d6a0c7d7 Devi Priya              2023-06-15   656  			assigned-clock-rates = <50000000>;
9ef42640504e09 Kathiravan T            2023-05-17   657  			dmas = <&blsp_dma 20>, <&blsp_dma 21>;
9ef42640504e09 Kathiravan T            2023-05-17   658  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   659  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   660  		};
9ef42640504e09 Kathiravan T            2023-05-17   661  
9ef42640504e09 Kathiravan T            2023-05-17   662  		blsp1_spi4: spi@78b9000 {
9ef42640504e09 Kathiravan T            2023-05-17   663  			compatible = "qcom,spi-qup-v2.2.1";
9ef42640504e09 Kathiravan T            2023-05-17   664  			reg = <0x078b9000 0x600>;
9ef42640504e09 Kathiravan T            2023-05-17   665  			#address-cells = <1>;
9ef42640504e09 Kathiravan T            2023-05-17   666  			#size-cells = <0>;
9ef42640504e09 Kathiravan T            2023-05-17   667  			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
9ef42640504e09 Kathiravan T            2023-05-17   668  			clocks = <&gcc GCC_BLSP1_QUP5_SPI_APPS_CLK>,
9ef42640504e09 Kathiravan T            2023-05-17   669  				 <&gcc GCC_BLSP1_AHB_CLK>;
9ef42640504e09 Kathiravan T            2023-05-17   670  			clock-names = "core", "iface";
9ef42640504e09 Kathiravan T            2023-05-17   671  			dmas = <&blsp_dma 20>, <&blsp_dma 21>;
9ef42640504e09 Kathiravan T            2023-05-17   672  			dma-names = "tx", "rx";
9ef42640504e09 Kathiravan T            2023-05-17   673  			status = "disabled";
9ef42640504e09 Kathiravan T            2023-05-17   674  		};
9ef42640504e09 Kathiravan T            2023-05-17   675  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   676  		usb_0_qusbphy: phy@7b000 {
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   677  			compatible = "qcom,ipq9574-qusb2-phy";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   678  			reg = <0x0007b000 0x180>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   679  			#phy-cells = <0>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   680  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   681  			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   682  				 <&xo_board_clk>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   683  			clock-names = "cfg_ahb",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   684  				      "ref";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   685  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   686  			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   687  			status = "disabled";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   688  		};
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   689  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   690  		usb_0_qmpphy: phy@7d000 {
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   691  			compatible = "qcom,ipq9574-qmp-usb3-phy";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   692  			reg = <0x0007d000 0xa00>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   693  			#phy-cells = <0>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   694  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   695  			clocks = <&gcc GCC_USB0_AUX_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   696  				 <&xo_board_clk>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   697  				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   698  				 <&gcc GCC_USB0_PIPE_CLK>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   699  			clock-names = "aux",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   700  				      "ref",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   701  				      "cfg_ahb",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   702  				      "pipe";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   703  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   704  			resets = <&gcc GCC_USB0_PHY_BCR>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   705  				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   706  			reset-names = "phy",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   707  				      "phy_phy";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   708  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   709  			#clock-cells = <0>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   710  			clock-output-names = "usb0_pipe_clk";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   711  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   712  			status = "disabled";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   713  		};
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   714  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   715  		usb3: usb@8af8800 {
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   716  			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   717  			reg = <0x08af8800 0x400>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   718  			#address-cells = <1>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   719  			#size-cells = <1>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   720  			ranges;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   721  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   722  			clocks = <&gcc GCC_SNOC_USB_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   723  				 <&gcc GCC_USB0_MASTER_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   724  				 <&gcc GCC_ANOC_USB_AXI_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   725  				 <&gcc GCC_USB0_SLEEP_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   726  				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   727  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   728  			clock-names = "cfg_noc",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   729  				      "core",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   730  				      "iface",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   731  				      "sleep",
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   732  				      "mock_utmi";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   733  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   734  			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   735  					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   736  			assigned-clock-rates = <200000000>,
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   737  					       <24000000>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   738  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   739  			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   740  			interrupt-names = "pwr_event";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   741  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   742  			resets = <&gcc GCC_USB_BCR>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   743  			status = "disabled";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   744  
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   745  			usb_0_dwc3: usb@8a00000 {
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   746  				compatible = "snps,dwc3";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   747  				reg = <0x8a00000 0xcd00>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   748  				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   749  				clock-names = "ref";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   750  				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   751  				phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   752  				phy-names = "usb2-phy", "usb3-phy";
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   753  				tx-fifo-resize;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   754  				snps,is-utmi-l1-suspend;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   755  				snps,hird-threshold = /bits/ 8 <0x0>;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   756  				snps,dis_u2_susphy_quirk;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   757  				snps,dis_u3_susphy_quirk;
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   758  			};
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   759  		};
a98bfb31f6766d Varadarajan Narayanan   2023-06-09   760  
97cb36ff52a106 Devi Priya              2023-03-16   761  		intc: interrupt-controller@b000000 {
97cb36ff52a106 Devi Priya              2023-03-16   762  			compatible = "qcom,msm-qgic2";
97cb36ff52a106 Devi Priya              2023-03-16   763  			reg = <0x0b000000 0x1000>,  /* GICD */
6fb45762691d12 Devi Priya              2023-04-25   764  			      <0x0b002000 0x2000>,  /* GICC */
97cb36ff52a106 Devi Priya              2023-03-16   765  			      <0x0b001000 0x1000>,  /* GICH */
6fb45762691d12 Devi Priya              2023-04-25   766  			      <0x0b004000 0x2000>;  /* GICV */
97cb36ff52a106 Devi Priya              2023-03-16   767  			#address-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   768  			#size-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   769  			interrupt-controller;
97cb36ff52a106 Devi Priya              2023-03-16   770  			#interrupt-cells = <3>;
6fb45762691d12 Devi Priya              2023-04-25   771  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
97cb36ff52a106 Devi Priya              2023-03-16   772  			ranges = <0 0x0b00c000 0x3000>;
97cb36ff52a106 Devi Priya              2023-03-16   773  
97cb36ff52a106 Devi Priya              2023-03-16   774  			v2m0: v2m@0 {
97cb36ff52a106 Devi Priya              2023-03-16   775  				compatible = "arm,gic-v2m-frame";
97cb36ff52a106 Devi Priya              2023-03-16   776  				reg = <0x00000000 0xffd>;
97cb36ff52a106 Devi Priya              2023-03-16   777  				msi-controller;
97cb36ff52a106 Devi Priya              2023-03-16   778  			};
97cb36ff52a106 Devi Priya              2023-03-16   779  
97cb36ff52a106 Devi Priya              2023-03-16   780  			v2m1: v2m@1000 {
97cb36ff52a106 Devi Priya              2023-03-16   781  				compatible = "arm,gic-v2m-frame";
97cb36ff52a106 Devi Priya              2023-03-16   782  				reg = <0x00001000 0xffd>;
97cb36ff52a106 Devi Priya              2023-03-16   783  				msi-controller;
97cb36ff52a106 Devi Priya              2023-03-16   784  			};
97cb36ff52a106 Devi Priya              2023-03-16   785  
97cb36ff52a106 Devi Priya              2023-03-16   786  			v2m2: v2m@2000 {
97cb36ff52a106 Devi Priya              2023-03-16   787  				compatible = "arm,gic-v2m-frame";
97cb36ff52a106 Devi Priya              2023-03-16   788  				reg = <0x00002000 0xffd>;
97cb36ff52a106 Devi Priya              2023-03-16   789  				msi-controller;
97cb36ff52a106 Devi Priya              2023-03-16   790  			};
97cb36ff52a106 Devi Priya              2023-03-16   791  		};
97cb36ff52a106 Devi Priya              2023-03-16   792  
9ef42640504e09 Kathiravan T            2023-05-17   793  		watchdog: watchdog@b017000 {
9ef42640504e09 Kathiravan T            2023-05-17   794  			compatible = "qcom,apss-wdt-ipq9574", "qcom,kpss-wdt";
9ef42640504e09 Kathiravan T            2023-05-17   795  			reg = <0x0b017000 0x1000>;
9ef42640504e09 Kathiravan T            2023-05-17   796  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
9ef42640504e09 Kathiravan T            2023-05-17   797  			clocks = <&sleep_clk>;
9ef42640504e09 Kathiravan T            2023-05-17   798  			timeout-sec = <30>;
9ef42640504e09 Kathiravan T            2023-05-17   799  		};
9ef42640504e09 Kathiravan T            2023-05-17   800  
84c4a652db1cf7 Devi Priya              2023-04-06   801  		apcs_glb: mailbox@b111000 {
84c4a652db1cf7 Devi Priya              2023-04-06   802  			compatible = "qcom,ipq9574-apcs-apps-global",
84c4a652db1cf7 Devi Priya              2023-04-06   803  				     "qcom,ipq6018-apcs-apps-global";
84c4a652db1cf7 Devi Priya              2023-04-06   804  			reg = <0x0b111000 0x1000>;
84c4a652db1cf7 Devi Priya              2023-04-06   805  			#clock-cells = <1>;
77c726a4f3b124 Kathiravan Thirumoorthy 2023-09-14   806  			clocks = <&a73pll>, <&xo_board_clk>, <&gcc GPLL0>;
77c726a4f3b124 Kathiravan Thirumoorthy 2023-09-14   807  			clock-names = "pll", "xo", "gpll0";
84c4a652db1cf7 Devi Priya              2023-04-06   808  			#mbox-cells = <1>;
84c4a652db1cf7 Devi Priya              2023-04-06   809  		};
84c4a652db1cf7 Devi Priya              2023-04-06   810  
84c4a652db1cf7 Devi Priya              2023-04-06   811  		a73pll: clock@b116000 {
84c4a652db1cf7 Devi Priya              2023-04-06   812  			compatible = "qcom,ipq9574-a73pll";
84c4a652db1cf7 Devi Priya              2023-04-06   813  			reg = <0x0b116000 0x40>;
84c4a652db1cf7 Devi Priya              2023-04-06   814  			#clock-cells = <0>;
84c4a652db1cf7 Devi Priya              2023-04-06   815  			clocks = <&xo_board_clk>;
84c4a652db1cf7 Devi Priya              2023-04-06   816  			clock-names = "xo";
84c4a652db1cf7 Devi Priya              2023-04-06   817  		};
84c4a652db1cf7 Devi Priya              2023-04-06   818  
97cb36ff52a106 Devi Priya              2023-03-16   819  		timer@b120000 {
97cb36ff52a106 Devi Priya              2023-03-16   820  			compatible = "arm,armv7-timer-mem";
97cb36ff52a106 Devi Priya              2023-03-16   821  			reg = <0x0b120000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   822  			#address-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   823  			#size-cells = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   824  			ranges;
97cb36ff52a106 Devi Priya              2023-03-16   825  
97cb36ff52a106 Devi Priya              2023-03-16   826  			frame@b120000 {
97cb36ff52a106 Devi Priya              2023-03-16   827  				reg = <0x0b121000 0x1000>,
97cb36ff52a106 Devi Priya              2023-03-16   828  				      <0x0b122000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   829  				frame-number = <0>;
97cb36ff52a106 Devi Priya              2023-03-16   830  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
97cb36ff52a106 Devi Priya              2023-03-16   831  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   832  			};
97cb36ff52a106 Devi Priya              2023-03-16   833  
97cb36ff52a106 Devi Priya              2023-03-16   834  			frame@b123000 {
97cb36ff52a106 Devi Priya              2023-03-16   835  				reg = <0x0b123000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   836  				frame-number = <1>;
97cb36ff52a106 Devi Priya              2023-03-16   837  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   838  				status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   839  			};
97cb36ff52a106 Devi Priya              2023-03-16   840  
97cb36ff52a106 Devi Priya              2023-03-16   841  			frame@b124000 {
97cb36ff52a106 Devi Priya              2023-03-16   842  				reg = <0x0b124000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   843  				frame-number = <2>;
97cb36ff52a106 Devi Priya              2023-03-16   844  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   845  				status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   846  			};
97cb36ff52a106 Devi Priya              2023-03-16   847  
97cb36ff52a106 Devi Priya              2023-03-16   848  			frame@b125000 {
97cb36ff52a106 Devi Priya              2023-03-16   849  				reg = <0x0b125000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   850  				frame-number = <3>;
97cb36ff52a106 Devi Priya              2023-03-16   851  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   852  				status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   853  			};
97cb36ff52a106 Devi Priya              2023-03-16   854  
97cb36ff52a106 Devi Priya              2023-03-16   855  			frame@b126000 {
97cb36ff52a106 Devi Priya              2023-03-16   856  				reg = <0x0b126000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   857  				frame-number = <4>;
97cb36ff52a106 Devi Priya              2023-03-16   858  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   859  				status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   860  			};
97cb36ff52a106 Devi Priya              2023-03-16   861  
97cb36ff52a106 Devi Priya              2023-03-16   862  			frame@b127000 {
97cb36ff52a106 Devi Priya              2023-03-16   863  				reg = <0x0b127000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   864  				frame-number = <5>;
97cb36ff52a106 Devi Priya              2023-03-16   865  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   866  				status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   867  			};
97cb36ff52a106 Devi Priya              2023-03-16   868  
97cb36ff52a106 Devi Priya              2023-03-16   869  			frame@b128000 {
97cb36ff52a106 Devi Priya              2023-03-16   870  				reg = <0x0b128000 0x1000>;
97cb36ff52a106 Devi Priya              2023-03-16   871  				frame-number = <6>;
97cb36ff52a106 Devi Priya              2023-03-16   872  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
97cb36ff52a106 Devi Priya              2023-03-16   873  				status = "disabled";
97cb36ff52a106 Devi Priya              2023-03-16   874  			};
97cb36ff52a106 Devi Priya              2023-03-16   875  		};
d80c7fbfa908e3 devi priya              2024-08-01   876  
d80c7fbfa908e3 devi priya              2024-08-01  @877  		pcie1: pcie@10000000 {
d80c7fbfa908e3 devi priya              2024-08-01   878  			compatible = "qcom,pcie-ipq9574";
e124af76347ee3 Varadarajan Narayanan   2025-01-22   879  			reg = <0x000f8000 0x4000>,
e124af76347ee3 Varadarajan Narayanan   2025-01-22   880  			      <0x10000000 0xf1d>,
d80c7fbfa908e3 devi priya              2024-08-01   881  			      <0x10000f20 0xa8>,
d80c7fbfa908e3 devi priya              2024-08-01   882  			      <0x10001000 0x1000>,
d80c7fbfa908e3 devi priya              2024-08-01   883  			      <0x10100000 0x1000>;
e124af76347ee3 Varadarajan Narayanan   2025-01-22   884  			reg-names = "parf",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   885  				    "dbi",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   886  				    "elbi",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   887  				    "atu",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   888  				    "config";
d80c7fbfa908e3 devi priya              2024-08-01   889  			device_type = "pci";
d80c7fbfa908e3 devi priya              2024-08-01   890  			linux,pci-domain = <1>;
d80c7fbfa908e3 devi priya              2024-08-01   891  			bus-range = <0x00 0xff>;
d80c7fbfa908e3 devi priya              2024-08-01   892  			num-lanes = <1>;
d80c7fbfa908e3 devi priya              2024-08-01   893  			#address-cells = <3>;
d80c7fbfa908e3 devi priya              2024-08-01   894  			#size-cells = <2>;
d80c7fbfa908e3 devi priya              2024-08-01   895  
d80c7fbfa908e3 devi priya              2024-08-01   896  			ranges = <0x01000000 0x0 0x00000000 0x10200000 0x0 0x100000>,
d80c7fbfa908e3 devi priya              2024-08-01   897  				 <0x02000000 0x0 0x10300000 0x10300000 0x0 0x7d00000>;
d80c7fbfa908e3 devi priya              2024-08-01   898  
d80c7fbfa908e3 devi priya              2024-08-01   899  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   900  				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   901  				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   902  				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   903  				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   904  				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   905  				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   906  				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
d80c7fbfa908e3 devi priya              2024-08-01   907  			interrupt-names = "msi0",
d80c7fbfa908e3 devi priya              2024-08-01   908  					  "msi1",
d80c7fbfa908e3 devi priya              2024-08-01   909  					  "msi2",
d80c7fbfa908e3 devi priya              2024-08-01   910  					  "msi3",
d80c7fbfa908e3 devi priya              2024-08-01   911  					  "msi4",
d80c7fbfa908e3 devi priya              2024-08-01   912  					  "msi5",
d80c7fbfa908e3 devi priya              2024-08-01   913  					  "msi6",
d80c7fbfa908e3 devi priya              2024-08-01   914  					  "msi7";
d80c7fbfa908e3 devi priya              2024-08-01   915  
d80c7fbfa908e3 devi priya              2024-08-01   916  			#interrupt-cells = <1>;
d80c7fbfa908e3 devi priya              2024-08-01   917  			interrupt-map-mask = <0 0 0 0x7>;
d80c7fbfa908e3 devi priya              2024-08-01   918  			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   919  					<0 0 0 2 &intc 0 0 49 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   920  					<0 0 0 3 &intc 0 0 84 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   921  					<0 0 0 4 &intc 0 0 85 IRQ_TYPE_LEVEL_HIGH>;
d80c7fbfa908e3 devi priya              2024-08-01   922  
d80c7fbfa908e3 devi priya              2024-08-01   923  			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   924  				 <&gcc GCC_PCIE1_AXI_S_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   925  				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   926  				 <&gcc GCC_PCIE1_RCHNG_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   927  				 <&gcc GCC_PCIE1_AHB_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01   928  				 <&gcc GCC_PCIE1_AUX_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01   929  			clock-names = "axi_m",
d80c7fbfa908e3 devi priya              2024-08-01   930  				      "axi_s",
d80c7fbfa908e3 devi priya              2024-08-01   931  				      "axi_bridge",
d80c7fbfa908e3 devi priya              2024-08-01   932  				      "rchng",
d80c7fbfa908e3 devi priya              2024-08-01   933  				      "ahb",
d80c7fbfa908e3 devi priya              2024-08-01   934  				      "aux";
d80c7fbfa908e3 devi priya              2024-08-01   935  
d80c7fbfa908e3 devi priya              2024-08-01   936  			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   937  				 <&gcc GCC_PCIE1_CORE_STICKY_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   938  				 <&gcc GCC_PCIE1_AXI_S_STICKY_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   939  				 <&gcc GCC_PCIE1_AXI_S_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   940  				 <&gcc GCC_PCIE1_AXI_M_STICKY_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   941  				 <&gcc GCC_PCIE1_AXI_M_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   942  				 <&gcc GCC_PCIE1_AUX_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01   943  				 <&gcc GCC_PCIE1_AHB_ARES>;
d80c7fbfa908e3 devi priya              2024-08-01   944  			reset-names = "pipe",
d80c7fbfa908e3 devi priya              2024-08-01   945  				      "sticky",
d80c7fbfa908e3 devi priya              2024-08-01   946  				      "axi_s_sticky",
d80c7fbfa908e3 devi priya              2024-08-01   947  				      "axi_s",
d80c7fbfa908e3 devi priya              2024-08-01   948  				      "axi_m_sticky",
d80c7fbfa908e3 devi priya              2024-08-01   949  				      "axi_m",
d80c7fbfa908e3 devi priya              2024-08-01   950  				      "aux",
d80c7fbfa908e3 devi priya              2024-08-01   951  				      "ahb";
d80c7fbfa908e3 devi priya              2024-08-01   952  
d80c7fbfa908e3 devi priya              2024-08-01   953  			phys = <&pcie1_phy>;
d80c7fbfa908e3 devi priya              2024-08-01   954  			phy-names = "pciephy";
d80c7fbfa908e3 devi priya              2024-08-01   955  			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
d80c7fbfa908e3 devi priya              2024-08-01   956  					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
d80c7fbfa908e3 devi priya              2024-08-01   957  			interconnect-names = "pcie-mem", "cpu-pcie";
d80c7fbfa908e3 devi priya              2024-08-01   958  			status = "disabled";
d80c7fbfa908e3 devi priya              2024-08-01   959  		};
d80c7fbfa908e3 devi priya              2024-08-01   960  
d80c7fbfa908e3 devi priya              2024-08-01  @961  		pcie3: pcie@18000000 {
d80c7fbfa908e3 devi priya              2024-08-01   962  			compatible = "qcom,pcie-ipq9574";
e124af76347ee3 Varadarajan Narayanan   2025-01-22   963  			reg = <0x000f0000 0x4000>,
e124af76347ee3 Varadarajan Narayanan   2025-01-22   964  			      <0x18000000 0xf1d>,
d80c7fbfa908e3 devi priya              2024-08-01   965  			      <0x18000f20 0xa8>,
d80c7fbfa908e3 devi priya              2024-08-01   966  			      <0x18001000 0x1000>,
d80c7fbfa908e3 devi priya              2024-08-01   967  			      <0x18100000 0x1000>;
e124af76347ee3 Varadarajan Narayanan   2025-01-22   968  			reg-names = "parf",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   969  				    "dbi",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   970  				    "elbi",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   971  				    "atu",
e124af76347ee3 Varadarajan Narayanan   2025-01-22   972  				    "config";
d80c7fbfa908e3 devi priya              2024-08-01   973  			device_type = "pci";
d80c7fbfa908e3 devi priya              2024-08-01   974  			linux,pci-domain = <3>;
d80c7fbfa908e3 devi priya              2024-08-01   975  			bus-range = <0x00 0xff>;
d80c7fbfa908e3 devi priya              2024-08-01   976  			num-lanes = <2>;
d80c7fbfa908e3 devi priya              2024-08-01   977  			#address-cells = <3>;
d80c7fbfa908e3 devi priya              2024-08-01   978  			#size-cells = <2>;
d80c7fbfa908e3 devi priya              2024-08-01   979  
d80c7fbfa908e3 devi priya              2024-08-01   980  			ranges = <0x01000000 0x0 0x00000000 0x18200000 0x0 0x100000>,
d80c7fbfa908e3 devi priya              2024-08-01   981  				 <0x02000000 0x0 0x18300000 0x18300000 0x0 0x7d00000>;
d80c7fbfa908e3 devi priya              2024-08-01   982  
d80c7fbfa908e3 devi priya              2024-08-01   983  			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   984  				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   985  				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   986  				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   987  				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   988  				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   989  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01   990  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
d80c7fbfa908e3 devi priya              2024-08-01   991  			interrupt-names = "msi0",
d80c7fbfa908e3 devi priya              2024-08-01   992  					  "msi1",
d80c7fbfa908e3 devi priya              2024-08-01   993  					  "msi2",
d80c7fbfa908e3 devi priya              2024-08-01   994  					  "msi3",
d80c7fbfa908e3 devi priya              2024-08-01   995  					  "msi4",
d80c7fbfa908e3 devi priya              2024-08-01   996  					  "msi5",
d80c7fbfa908e3 devi priya              2024-08-01   997  					  "msi6",
d80c7fbfa908e3 devi priya              2024-08-01   998  					  "msi7";
d80c7fbfa908e3 devi priya              2024-08-01   999  
d80c7fbfa908e3 devi priya              2024-08-01  1000  			#interrupt-cells = <1>;
d80c7fbfa908e3 devi priya              2024-08-01  1001  			interrupt-map-mask = <0 0 0 0x7>;
d80c7fbfa908e3 devi priya              2024-08-01  1002  			interrupt-map = <0 0 0 1 &intc 0 0 189 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01  1003  					<0 0 0 2 &intc 0 0 190 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01  1004  					<0 0 0 3 &intc 0 0 191 IRQ_TYPE_LEVEL_HIGH>,
d80c7fbfa908e3 devi priya              2024-08-01  1005  					<0 0 0 4 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>;
d80c7fbfa908e3 devi priya              2024-08-01  1006  
d80c7fbfa908e3 devi priya              2024-08-01  1007  			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01  1008  				 <&gcc GCC_PCIE3_AXI_S_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01  1009  				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01  1010  				 <&gcc GCC_PCIE3_RCHNG_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01  1011  				 <&gcc GCC_PCIE3_AHB_CLK>,
d80c7fbfa908e3 devi priya              2024-08-01  1012  				 <&gcc GCC_PCIE3_AUX_CLK>;
d80c7fbfa908e3 devi priya              2024-08-01  1013  			clock-names = "axi_m",
d80c7fbfa908e3 devi priya              2024-08-01  1014  				      "axi_s",
d80c7fbfa908e3 devi priya              2024-08-01  1015  				      "axi_bridge",
d80c7fbfa908e3 devi priya              2024-08-01  1016  				      "rchng",
d80c7fbfa908e3 devi priya              2024-08-01  1017  				      "ahb",
d80c7fbfa908e3 devi priya              2024-08-01  1018  				      "aux";
d80c7fbfa908e3 devi priya              2024-08-01  1019  
d80c7fbfa908e3 devi priya              2024-08-01  1020  			resets = <&gcc GCC_PCIE3_PIPE_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1021  				 <&gcc GCC_PCIE3_CORE_STICKY_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1022  				 <&gcc GCC_PCIE3_AXI_S_STICKY_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1023  				 <&gcc GCC_PCIE3_AXI_S_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1024  				 <&gcc GCC_PCIE3_AXI_M_STICKY_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1025  				 <&gcc GCC_PCIE3_AXI_M_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1026  				 <&gcc GCC_PCIE3_AUX_ARES>,
d80c7fbfa908e3 devi priya              2024-08-01  1027  				 <&gcc GCC_PCIE3_AHB_ARES>;
d80c7fbfa908e3 devi priya              2024-08-01  1028  			reset-names = "pipe",
d80c7fbfa908e3 devi priya              2024-08-01  1029  				      "sticky",
d80c7fbfa908e3 devi priya              2024-08-01  1030  				      "axi_s_sticky",
d80c7fbfa908e3 devi priya              2024-08-01  1031  				      "axi_s",
d80c7fbfa908e3 devi priya              2024-08-01  1032  				      "axi_m_sticky",
d80c7fbfa908e3 devi priya              2024-08-01  1033  				      "axi_m",
d80c7fbfa908e3 devi priya              2024-08-01  1034  				      "aux",
d80c7fbfa908e3 devi priya              2024-08-01  1035  				      "ahb";
d80c7fbfa908e3 devi priya              2024-08-01  1036  
d80c7fbfa908e3 devi priya              2024-08-01  1037  			phys = <&pcie3_phy>;
d80c7fbfa908e3 devi priya              2024-08-01  1038  			phy-names = "pciephy";
d80c7fbfa908e3 devi priya              2024-08-01  1039  			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
d80c7fbfa908e3 devi priya              2024-08-01  1040  					<&gcc MASTER_SNOC_PCIE3 &gcc SLAVE_SNOC_PCIE3>;
d80c7fbfa908e3 devi priya              2024-08-01  1041  			interconnect-names = "pcie-mem", "cpu-pcie";
d80c7fbfa908e3 devi priya              2024-08-01  1042  			status = "disabled";
d80c7fbfa908e3 devi priya              2024-08-01  1043  		};
d80c7fbfa908e3 devi priya              2024-08-01  1044  
d80c7fbfa908e3 devi priya              2024-08-01 @1045  		pcie2: pcie@20000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
