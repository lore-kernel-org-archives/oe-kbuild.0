Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF6B647
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735229568; cv=none; b=flmlbk93CKquG7YwqFVsVNrmmyYyoDJCUHbHWsuDmPlKr+EbeLus4N0iysbpu1Wq6hJLgwoA8ZDLbSqKRZFgNRzB0MZdqnoX28YumOMlQFVd05z0u/yV/0X0/hGUjhX0TBObo0C4NCd1eN4ta41/YXro4TH2l6jmAaiPePDFKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735229568; c=relaxed/simple;
	bh=r3vSZxzOWkPUrCHFsSrz2jKUPQSB90Fe+YbKf3/5Nl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/dTlNZQY5t+SdnbXkj2gGZC7s/F34jHvj4fOKR1thZ2eSfpgzP3+LZe/AgQ95oO0OlWWFLJygtcEqOQ5NQ3tKex5tmE97meGVq9yj3MCPxiLMCX4vO5B5z9sWeJkDtteekHE1fJWxAMgI5vZTdOckvN/hVGzmgDdFuQAZ+eExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTNr7gnx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTNr7gnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735229566; x=1766765566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3vSZxzOWkPUrCHFsSrz2jKUPQSB90Fe+YbKf3/5Nl0=;
  b=KTNr7gnxIs92uwwsyP4ucReldfX0vz2kuMKQFZ/WyjeyUZDW+JlaDgrL
   i7Nd5auh/DNH1eH/zwbjq0ajZUqr9u5U2iN9sOU5IoPZ50Rr3zK3LSsct
   BsRp6g+YytMiTakBotL74LXUux3klR9gusac3+n/n5w34aFwk/Ol1qtZf
   7XAHpNn1CtvX6z96eWbX8OG3sCHxOoW3qnNzoCLY1AgCapxlcaRtgR9DH
   NhUAvNr/BCOoTGgEF6RbqiF6F1Poj1gXCGlBl7n/7ZHgXgwoLTFzCQ+UX
   MDw11USyfkh78k+Tn1QFwOtTv7Hy2uJhFJixURSMZg3/3vanipvUMGv2f
   w==;
X-CSE-ConnectionGUID: yHfYGE+WQ9SfLMlfWSDiQQ==
X-CSE-MsgGUID: 240u4KMdQDyLfMwoGe+tVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35530002"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35530002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 08:12:45 -0800
X-CSE-ConnectionGUID: vQCdhcOESHSvAJMuMLyFbw==
X-CSE-MsgGUID: AZOaxlINTMeZW6Ya3SHK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="99811495"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Dec 2024 08:12:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQqTZ-0002gW-0k;
	Thu, 26 Dec 2024 16:12:41 +0000
Date: Fri, 27 Dec 2024 00:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: ipq5332: Add PCIe related nodes
Message-ID: <202412262303.6Th0GNFB-lkp@intel.com>
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
In-Reply-To: <20241226102432.3193366-5-quic_varada@quicinc.com>
References: <20241226102432.3193366-5-quic_varada@quicinc.com>
TO: Varadarajan Narayanan <quic_varada@quicinc.com>
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: manivannan.sadhasivam@linaro.org
TO: robh@kernel.org
TO: bhelgaas@google.com
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
CC: Praveenkumar I <quic_ipkumar@quicinc.com>

Hi Varadarajan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/dt-bindings-phy-qcom-uniphy-pcie-Document-PCIe-uniphy/20241226-182745
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241226102432.3193366-5-quic_varada%40quicinc.com
patch subject: [PATCH v4 4/5] arm64: dts: qcom: ipq5332: Add PCIe related nodes
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-051-20241226 (https://download.01.org/0day-ci/archive/20241226/202412262303.6Th0GNFB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262303.6Th0GNFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412262303.6Th0GNFB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5332.dtsi:401.24-489.5: Warning (simple_bus_reg): /soc@0/pcie@20000000: simple-bus unit address format error, expected "80000"
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:491.24-579.5: Warning (simple_bus_reg): /soc@0/pcie@18000000: simple-bus unit address format error, expected "88000"

vim +/80000 +401 arch/arm64/boot/dts/qcom/ipq5332.dtsi

0360f0ea8c0f67 Kathiravan T          2023-03-07   12  
0360f0ea8c0f67 Kathiravan T          2023-03-07   13  / {
0360f0ea8c0f67 Kathiravan T          2023-03-07   14  	interrupt-parent = <&intc>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   15  	#address-cells = <2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   16  	#size-cells = <2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   17  
0360f0ea8c0f67 Kathiravan T          2023-03-07   18  	clocks {
0360f0ea8c0f67 Kathiravan T          2023-03-07   19  		sleep_clk: sleep-clk {
0360f0ea8c0f67 Kathiravan T          2023-03-07   20  			compatible = "fixed-clock";
0360f0ea8c0f67 Kathiravan T          2023-03-07   21  			#clock-cells = <0>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   22  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   23  
0360f0ea8c0f67 Kathiravan T          2023-03-07   24  		xo_board: xo-board-clk {
0360f0ea8c0f67 Kathiravan T          2023-03-07   25  			compatible = "fixed-clock";
0360f0ea8c0f67 Kathiravan T          2023-03-07   26  			#clock-cells = <0>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   27  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   28  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07   29  
0360f0ea8c0f67 Kathiravan T          2023-03-07   30  	cpus {
0360f0ea8c0f67 Kathiravan T          2023-03-07   31  		#address-cells = <1>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   32  		#size-cells = <0>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   33  
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   34  		cpu0: cpu@0 {
0360f0ea8c0f67 Kathiravan T          2023-03-07   35  			device_type = "cpu";
0360f0ea8c0f67 Kathiravan T          2023-03-07   36  			compatible = "arm,cortex-a53";
0360f0ea8c0f67 Kathiravan T          2023-03-07   37  			reg = <0x0>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   38  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   39  			next-level-cache = <&l2_0>;
e16dd29a3dff57 Kathiravan T          2023-02-17   40  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
e16dd29a3dff57 Kathiravan T          2023-02-17   41  			operating-points-v2 = <&cpu_opp_table>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   42  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   43  
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   44  		cpu1: cpu@1 {
0360f0ea8c0f67 Kathiravan T          2023-03-07   45  			device_type = "cpu";
0360f0ea8c0f67 Kathiravan T          2023-03-07   46  			compatible = "arm,cortex-a53";
0360f0ea8c0f67 Kathiravan T          2023-03-07   47  			reg = <0x1>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   48  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   49  			next-level-cache = <&l2_0>;
e16dd29a3dff57 Kathiravan T          2023-02-17   50  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
e16dd29a3dff57 Kathiravan T          2023-02-17   51  			operating-points-v2 = <&cpu_opp_table>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   52  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   53  
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   54  		cpu2: cpu@2 {
0360f0ea8c0f67 Kathiravan T          2023-03-07   55  			device_type = "cpu";
0360f0ea8c0f67 Kathiravan T          2023-03-07   56  			compatible = "arm,cortex-a53";
0360f0ea8c0f67 Kathiravan T          2023-03-07   57  			reg = <0x2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   58  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   59  			next-level-cache = <&l2_0>;
e16dd29a3dff57 Kathiravan T          2023-02-17   60  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
e16dd29a3dff57 Kathiravan T          2023-02-17   61  			operating-points-v2 = <&cpu_opp_table>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   62  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   63  
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   64  		cpu3: cpu@3 {
0360f0ea8c0f67 Kathiravan T          2023-03-07   65  			device_type = "cpu";
0360f0ea8c0f67 Kathiravan T          2023-03-07   66  			compatible = "arm,cortex-a53";
0360f0ea8c0f67 Kathiravan T          2023-03-07   67  			reg = <0x3>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   68  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   69  			next-level-cache = <&l2_0>;
e16dd29a3dff57 Kathiravan T          2023-02-17   70  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
e16dd29a3dff57 Kathiravan T          2023-02-17   71  			operating-points-v2 = <&cpu_opp_table>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   72  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   73  
6f8c1ed2580918 Krzysztof Kozlowski   2024-10-22   74  		l2_0: l2-cache {
0360f0ea8c0f67 Kathiravan T          2023-03-07   75  			compatible = "cache";
0360f0ea8c0f67 Kathiravan T          2023-03-07   76  			cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   77  			cache-unified;
0360f0ea8c0f67 Kathiravan T          2023-03-07   78  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   79  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07   80  
0360f0ea8c0f67 Kathiravan T          2023-03-07   81  	firmware {
0360f0ea8c0f67 Kathiravan T          2023-03-07   82  		scm {
0360f0ea8c0f67 Kathiravan T          2023-03-07   83  			compatible = "qcom,scm-ipq5332", "qcom,scm";
ed32155302fc3e Kathiravan T          2023-02-10   84  			qcom,dload-mode = <&tcsr 0x6100>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   85  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07   86  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07   87  
0360f0ea8c0f67 Kathiravan T          2023-03-07   88  	memory@40000000 {
0360f0ea8c0f67 Kathiravan T          2023-03-07   89  		device_type = "memory";
0360f0ea8c0f67 Kathiravan T          2023-03-07   90  		/* We expect the bootloader to fill in the size */
0360f0ea8c0f67 Kathiravan T          2023-03-07   91  		reg = <0x0 0x40000000 0x0 0x0>;
0360f0ea8c0f67 Kathiravan T          2023-03-07   92  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07   93  
e16dd29a3dff57 Kathiravan T          2023-02-17   94  	cpu_opp_table: opp-table-cpu {
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20   95  		compatible = "operating-points-v2-kryo-cpu";
e16dd29a3dff57 Kathiravan T          2023-02-17   96  		opp-shared;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20   97  		nvmem-cells = <&cpu_speed_bin>;
e16dd29a3dff57 Kathiravan T          2023-02-17   98  
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20   99  		opp-1100000000 {
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  100  			opp-hz = /bits/ 64 <1100000000>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  101  			opp-supported-hw = <0x7>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  102  			clock-latency-ns = <200000>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  103  		};
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  104  
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  105  		opp-1500000000 {
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  106  			opp-hz = /bits/ 64 <1500000000>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  107  			opp-supported-hw = <0x3>;
e16dd29a3dff57 Kathiravan T          2023-02-17  108  			clock-latency-ns = <200000>;
e16dd29a3dff57 Kathiravan T          2023-02-17  109  		};
e16dd29a3dff57 Kathiravan T          2023-02-17  110  	};
e16dd29a3dff57 Kathiravan T          2023-02-17  111  
0360f0ea8c0f67 Kathiravan T          2023-03-07  112  	pmu {
0360f0ea8c0f67 Kathiravan T          2023-03-07  113  		compatible = "arm,cortex-a53-pmu";
0360f0ea8c0f67 Kathiravan T          2023-03-07  114  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  115  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07  116  
0360f0ea8c0f67 Kathiravan T          2023-03-07  117  	psci {
0360f0ea8c0f67 Kathiravan T          2023-03-07  118  		compatible = "arm,psci-1.0";
0360f0ea8c0f67 Kathiravan T          2023-03-07  119  		method = "smc";
0360f0ea8c0f67 Kathiravan T          2023-03-07  120  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07  121  
0360f0ea8c0f67 Kathiravan T          2023-03-07  122  	reserved-memory {
0360f0ea8c0f67 Kathiravan T          2023-03-07  123  		#address-cells = <2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  124  		#size-cells = <2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  125  		ranges;
0360f0ea8c0f67 Kathiravan T          2023-03-07  126  
0196b041aeec78 Kathiravan T          2023-05-19  127  		bootloader@4a100000 {
0196b041aeec78 Kathiravan T          2023-05-19  128  			reg = <0x0 0x4a100000 0x0 0x400000>;
0196b041aeec78 Kathiravan T          2023-05-19  129  			no-map;
0196b041aeec78 Kathiravan T          2023-05-19  130  		};
0196b041aeec78 Kathiravan T          2023-05-19  131  
0196b041aeec78 Kathiravan T          2023-05-19  132  		sbl@4a500000 {
0196b041aeec78 Kathiravan T          2023-05-19  133  			reg = <0x0 0x4a500000 0x0 0x100000>;
0196b041aeec78 Kathiravan T          2023-05-19  134  			no-map;
0196b041aeec78 Kathiravan T          2023-05-19  135  		};
0196b041aeec78 Kathiravan T          2023-05-19  136  
0360f0ea8c0f67 Kathiravan T          2023-03-07  137  		tz_mem: tz@4a600000 {
0360f0ea8c0f67 Kathiravan T          2023-03-07  138  			reg = <0x0 0x4a600000 0x0 0x200000>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  139  			no-map;
0360f0ea8c0f67 Kathiravan T          2023-03-07  140  		};
d56dd7f935e125 Kathiravan T          2023-02-10  141  
d56dd7f935e125 Kathiravan T          2023-02-10  142  		smem@4a800000 {
d56dd7f935e125 Kathiravan T          2023-02-10  143  			compatible = "qcom,smem";
0196b041aeec78 Kathiravan T          2023-05-19  144  			reg = <0x0 0x4a800000 0x0 0x100000>;
d56dd7f935e125 Kathiravan T          2023-02-10  145  			no-map;
d56dd7f935e125 Kathiravan T          2023-02-10  146  
d08afd80158399 Vignesh Viswanathan   2023-09-04  147  			hwlocks = <&tcsr_mutex 3>;
d56dd7f935e125 Kathiravan T          2023-02-10  148  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07  149  	};
0360f0ea8c0f67 Kathiravan T          2023-03-07  150  
0360f0ea8c0f67 Kathiravan T          2023-03-07  151  	soc@0 {
0360f0ea8c0f67 Kathiravan T          2023-03-07  152  		compatible = "simple-bus";
0360f0ea8c0f67 Kathiravan T          2023-03-07  153  		#address-cells = <1>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  154  		#size-cells = <1>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  155  		ranges = <0 0 0 0xffffffff>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  156  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  157  		usbphy0: phy@7b000 {
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  158  			compatible = "qcom,ipq5332-usb-hsphy";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  159  			reg = <0x0007b000 0x12c>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  160  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  161  			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  162  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  163  			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  164  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  165  			#phy-cells = <0>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  166  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  167  			status = "disabled";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  168  		};
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  169  
2f34a2aa4c88f4 Kathiravan T          2023-05-26  170  		qfprom: efuse@a4000 {
2f34a2aa4c88f4 Kathiravan T          2023-05-26  171  			compatible = "qcom,ipq5332-qfprom", "qcom,qfprom";
2f34a2aa4c88f4 Kathiravan T          2023-05-26  172  			reg = <0x000a4000 0x721>;
2f34a2aa4c88f4 Kathiravan T          2023-05-26  173  			#address-cells = <1>;
2f34a2aa4c88f4 Kathiravan T          2023-05-26  174  			#size-cells = <1>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  175  
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  176  			cpu_speed_bin: cpu-speed-bin@1d {
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  177  				reg = <0x1d 0x2>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  178  				bits = <7 2>;
62073bc9f1ecc0 Varadarajan Narayanan 2023-10-20  179  			};
2f34a2aa4c88f4 Kathiravan T          2023-05-26  180  		};
2f34a2aa4c88f4 Kathiravan T          2023-05-26  181  
d0367098dc1e92 Kathiravan T          2023-03-20  182  		rng: rng@e3000 {
d0367098dc1e92 Kathiravan T          2023-03-20  183  			compatible = "qcom,prng-ee";
d0367098dc1e92 Kathiravan T          2023-03-20  184  			reg = <0x000e3000 0x1000>;
d0367098dc1e92 Kathiravan T          2023-03-20  185  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
d0367098dc1e92 Kathiravan T          2023-03-20  186  			clock-names = "core";
d0367098dc1e92 Kathiravan T          2023-03-20  187  		};
d0367098dc1e92 Kathiravan T          2023-03-20  188  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  189  		pcie0_phy: phy@4b0000 {
eb9cde9fe03d63 Praveenkumar I        2024-12-26  190  			compatible = "qcom,ipq5332-uniphy-gen3x1-pcie-phy";
eb9cde9fe03d63 Praveenkumar I        2024-12-26  191  			reg = <0x004b0000 0x800>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  192  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  193  			clocks = <&gcc GCC_PCIE3X1_0_PIPE_CLK>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  194  				 <&gcc GCC_PCIE3X1_PHY_AHB_CLK>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  195  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  196  			resets = <&gcc GCC_PCIE3X1_0_PHY_BCR>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  197  				 <&gcc GCC_PCIE3X1_PHY_AHB_CLK_ARES>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  198  				 <&gcc GCC_PCIE3X1_0_PHY_PHY_BCR>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  199  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  200  			#clock-cells = <0>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  201  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  202  			#phy-cells = <0>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  203  			status = "disabled";
eb9cde9fe03d63 Praveenkumar I        2024-12-26  204  		};
eb9cde9fe03d63 Praveenkumar I        2024-12-26  205  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  206  		pcie1_phy: phy@4b1000 {
eb9cde9fe03d63 Praveenkumar I        2024-12-26  207  			compatible = "qcom,ipq5332-uniphy-gen3x2-pcie-phy";
eb9cde9fe03d63 Praveenkumar I        2024-12-26  208  			reg = <0x004b1000 0x1000>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  209  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  210  			clocks = <&gcc GCC_PCIE3X2_PIPE_CLK>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  211  				 <&gcc GCC_PCIE3X2_PHY_AHB_CLK>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  212  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  213  			resets = <&gcc GCC_PCIE3X2_PHY_BCR>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  214  				 <&gcc GCC_PCIE3X2_PHY_AHB_CLK_ARES>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  215  				 <&gcc GCC_PCIE3X2PHY_PHY_BCR>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  216  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  217  			#clock-cells = <0>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  218  
eb9cde9fe03d63 Praveenkumar I        2024-12-26  219  			#phy-cells = <0>;
eb9cde9fe03d63 Praveenkumar I        2024-12-26  220  			status = "disabled";
eb9cde9fe03d63 Praveenkumar I        2024-12-26  221  		};
eb9cde9fe03d63 Praveenkumar I        2024-12-26  222  
0360f0ea8c0f67 Kathiravan T          2023-03-07  223  		tlmm: pinctrl@1000000 {
0360f0ea8c0f67 Kathiravan T          2023-03-07  224  			compatible = "qcom,ipq5332-tlmm";
0360f0ea8c0f67 Kathiravan T          2023-03-07  225  			reg = <0x01000000 0x300000>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  226  			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  227  			gpio-controller;
0360f0ea8c0f67 Kathiravan T          2023-03-07  228  			#gpio-cells = <2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  229  			gpio-ranges = <&tlmm 0 0 53>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  230  			interrupt-controller;
0360f0ea8c0f67 Kathiravan T          2023-03-07  231  			#interrupt-cells = <2>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  232  
0360f0ea8c0f67 Kathiravan T          2023-03-07  233  			serial_0_pins: serial0-state {
0360f0ea8c0f67 Kathiravan T          2023-03-07  234  				pins = "gpio18", "gpio19";
0360f0ea8c0f67 Kathiravan T          2023-03-07  235  				function = "blsp0_uart0";
0360f0ea8c0f67 Kathiravan T          2023-03-07  236  				drive-strength = <8>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  237  				bias-pull-up;
0360f0ea8c0f67 Kathiravan T          2023-03-07  238  			};
0360f0ea8c0f67 Kathiravan T          2023-03-07  239  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07  240  
0360f0ea8c0f67 Kathiravan T          2023-03-07  241  		gcc: clock-controller@1800000 {
0360f0ea8c0f67 Kathiravan T          2023-03-07  242  			compatible = "qcom,ipq5332-gcc";
0360f0ea8c0f67 Kathiravan T          2023-03-07  243  			reg = <0x01800000 0x80000>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  244  			#clock-cells = <1>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  245  			#reset-cells = <1>;
8312d0f20f835a Varadarajan Narayanan 2024-07-30  246  			#interconnect-cells = <1>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  247  			clocks = <&xo_board>,
0360f0ea8c0f67 Kathiravan T          2023-03-07  248  				 <&sleep_clk>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  249  				 <&pcie1_phy>,
eb9cde9fe03d63 Praveenkumar I        2024-12-26  250  				 <&pcie0_phy>,
0360f0ea8c0f67 Kathiravan T          2023-03-07  251  				 <0>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  252  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07  253  
d56dd7f935e125 Kathiravan T          2023-02-10  254  		tcsr_mutex: hwlock@1905000 {
d56dd7f935e125 Kathiravan T          2023-02-10  255  			compatible = "qcom,tcsr-mutex";
d56dd7f935e125 Kathiravan T          2023-02-10  256  			reg = <0x01905000 0x20000>;
d56dd7f935e125 Kathiravan T          2023-02-10  257  			#hwlock-cells = <1>;
d56dd7f935e125 Kathiravan T          2023-02-10  258  		};
d56dd7f935e125 Kathiravan T          2023-02-10  259  
ed32155302fc3e Kathiravan T          2023-02-10  260  		tcsr: syscon@1937000 {
ed32155302fc3e Kathiravan T          2023-02-10  261  			compatible = "qcom,tcsr-ipq5332", "syscon";
ed32155302fc3e Kathiravan T          2023-02-10  262  			reg = <0x01937000 0x21000>;
ed32155302fc3e Kathiravan T          2023-02-10  263  		};
ed32155302fc3e Kathiravan T          2023-02-10  264  
0360f0ea8c0f67 Kathiravan T          2023-03-07  265  		sdhc: mmc@7804000 {
0360f0ea8c0f67 Kathiravan T          2023-03-07  266  			compatible = "qcom,ipq5332-sdhci", "qcom,sdhci-msm-v5";
0360f0ea8c0f67 Kathiravan T          2023-03-07  267  			reg = <0x07804000 0x1000>, <0x07805000 0x1000>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  268  
0360f0ea8c0f67 Kathiravan T          2023-03-07  269  			interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
0360f0ea8c0f67 Kathiravan T          2023-03-07  270  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  271  			interrupt-names = "hc_irq", "pwr_irq";
0360f0ea8c0f67 Kathiravan T          2023-03-07  272  
0360f0ea8c0f67 Kathiravan T          2023-03-07  273  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
0360f0ea8c0f67 Kathiravan T          2023-03-07  274  				 <&gcc GCC_SDCC1_APPS_CLK>,
0360f0ea8c0f67 Kathiravan T          2023-03-07  275  				 <&xo_board>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  276  			clock-names = "iface", "core", "xo";
0360f0ea8c0f67 Kathiravan T          2023-03-07  277  			status = "disabled";
0360f0ea8c0f67 Kathiravan T          2023-03-07  278  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07  279  
d0367098dc1e92 Kathiravan T          2023-03-20  280  		blsp_dma: dma-controller@7884000 {
d0367098dc1e92 Kathiravan T          2023-03-20  281  			compatible = "qcom,bam-v1.7.0";
d0367098dc1e92 Kathiravan T          2023-03-20  282  			reg = <0x07884000 0x1d000>;
d0367098dc1e92 Kathiravan T          2023-03-20  283  			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>;
d0367098dc1e92 Kathiravan T          2023-03-20  284  			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
d0367098dc1e92 Kathiravan T          2023-03-20  285  			clock-names = "bam_clk";
d0367098dc1e92 Kathiravan T          2023-03-20  286  			#dma-cells = <1>;
d0367098dc1e92 Kathiravan T          2023-03-20  287  			qcom,ee = <0>;
d0367098dc1e92 Kathiravan T          2023-03-20  288  		};
d0367098dc1e92 Kathiravan T          2023-03-20  289  
0360f0ea8c0f67 Kathiravan T          2023-03-07  290  		blsp1_uart0: serial@78af000 {
0360f0ea8c0f67 Kathiravan T          2023-03-07  291  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
0360f0ea8c0f67 Kathiravan T          2023-03-07  292  			reg = <0x078af000 0x200>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  293  			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  294  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
0360f0ea8c0f67 Kathiravan T          2023-03-07  295  				 <&gcc GCC_BLSP1_AHB_CLK>;
0360f0ea8c0f67 Kathiravan T          2023-03-07  296  			clock-names = "core", "iface";
0360f0ea8c0f67 Kathiravan T          2023-03-07  297  			status = "disabled";
0360f0ea8c0f67 Kathiravan T          2023-03-07  298  		};
0360f0ea8c0f67 Kathiravan T          2023-03-07  299  
66d141a15c19f8 Kathiravan T          2023-05-19  300  		blsp1_uart1: serial@78b0000 {
66d141a15c19f8 Kathiravan T          2023-05-19  301  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
66d141a15c19f8 Kathiravan T          2023-05-19  302  			reg = <0x078b0000 0x200>;
66d141a15c19f8 Kathiravan T          2023-05-19  303  			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
66d141a15c19f8 Kathiravan T          2023-05-19  304  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
66d141a15c19f8 Kathiravan T          2023-05-19  305  				 <&gcc GCC_BLSP1_AHB_CLK>;
66d141a15c19f8 Kathiravan T          2023-05-19  306  			clock-names = "core", "iface";
66d141a15c19f8 Kathiravan T          2023-05-19  307  			dmas = <&blsp_dma 2>, <&blsp_dma 3>;
66d141a15c19f8 Kathiravan T          2023-05-19  308  			dma-names = "tx", "rx";
66d141a15c19f8 Kathiravan T          2023-05-19  309  			status = "disabled";
66d141a15c19f8 Kathiravan T          2023-05-19  310  		};
66d141a15c19f8 Kathiravan T          2023-05-19  311  
d0367098dc1e92 Kathiravan T          2023-03-20  312  		blsp1_spi0: spi@78b5000 {
d0367098dc1e92 Kathiravan T          2023-03-20  313  			compatible = "qcom,spi-qup-v2.2.1";
d0367098dc1e92 Kathiravan T          2023-03-20  314  			reg = <0x078b5000 0x600>;
d0367098dc1e92 Kathiravan T          2023-03-20  315  			#address-cells = <1>;
d0367098dc1e92 Kathiravan T          2023-03-20  316  			#size-cells = <0>;
d0367098dc1e92 Kathiravan T          2023-03-20  317  			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
d0367098dc1e92 Kathiravan T          2023-03-20  318  			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
d0367098dc1e92 Kathiravan T          2023-03-20  319  				 <&gcc GCC_BLSP1_AHB_CLK>;
d0367098dc1e92 Kathiravan T          2023-03-20  320  			clock-names = "core", "iface";
d0367098dc1e92 Kathiravan T          2023-03-20  321  			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
d0367098dc1e92 Kathiravan T          2023-03-20  322  			dma-names = "tx", "rx";
d0367098dc1e92 Kathiravan T          2023-03-20  323  			status = "disabled";
d0367098dc1e92 Kathiravan T          2023-03-20  324  		};
d0367098dc1e92 Kathiravan T          2023-03-20  325  
d0367098dc1e92 Kathiravan T          2023-03-20  326  		blsp1_i2c1: i2c@78b6000 {
d0367098dc1e92 Kathiravan T          2023-03-20  327  			compatible = "qcom,i2c-qup-v2.2.1";
d0367098dc1e92 Kathiravan T          2023-03-20  328  			reg = <0x078b6000 0x600>;
d0367098dc1e92 Kathiravan T          2023-03-20  329  			#address-cells = <1>;
d0367098dc1e92 Kathiravan T          2023-03-20  330  			#size-cells = <0>;
d0367098dc1e92 Kathiravan T          2023-03-20  331  			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>;
d0367098dc1e92 Kathiravan T          2023-03-20  332  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
d0367098dc1e92 Kathiravan T          2023-03-20  333  				 <&gcc GCC_BLSP1_AHB_CLK>;
d0367098dc1e92 Kathiravan T          2023-03-20  334  			clock-names = "core", "iface";
d0367098dc1e92 Kathiravan T          2023-03-20  335  			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
d0367098dc1e92 Kathiravan T          2023-03-20  336  			dma-names = "tx", "rx";
d0367098dc1e92 Kathiravan T          2023-03-20  337  			status = "disabled";
d0367098dc1e92 Kathiravan T          2023-03-20  338  		};
d0367098dc1e92 Kathiravan T          2023-03-20  339  
d0367098dc1e92 Kathiravan T          2023-03-20  340  		blsp1_spi2: spi@78b7000 {
d0367098dc1e92 Kathiravan T          2023-03-20  341  			compatible = "qcom,spi-qup-v2.2.1";
d0367098dc1e92 Kathiravan T          2023-03-20  342  			reg = <0x078b7000 0x600>;
d0367098dc1e92 Kathiravan T          2023-03-20  343  			#address-cells = <1>;
d0367098dc1e92 Kathiravan T          2023-03-20  344  			#size-cells = <0>;
d0367098dc1e92 Kathiravan T          2023-03-20  345  			interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
d0367098dc1e92 Kathiravan T          2023-03-20  346  			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
d0367098dc1e92 Kathiravan T          2023-03-20  347  				 <&gcc GCC_BLSP1_AHB_CLK>;
d0367098dc1e92 Kathiravan T          2023-03-20  348  			clock-names = "core", "iface";
d0367098dc1e92 Kathiravan T          2023-03-20  349  			dmas = <&blsp_dma 8>, <&blsp_dma 9>;
d0367098dc1e92 Kathiravan T          2023-03-20  350  			dma-names = "tx", "rx";
d0367098dc1e92 Kathiravan T          2023-03-20  351  			status = "disabled";
d0367098dc1e92 Kathiravan T          2023-03-20  352  		};
d0367098dc1e92 Kathiravan T          2023-03-20  353  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  354  		usb: usb@8af8800 {
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  355  			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  356  			reg = <0x08af8800 0x400>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  357  
927173bf8a0e36 Krishna Kurapati      2024-01-26  358  			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
60a76f7826b88e Varadarajan Narayanan 2024-07-23  359  				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
60a76f7826b88e Varadarajan Narayanan 2024-07-23  360  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
927173bf8a0e36 Krishna Kurapati      2024-01-26  361  			interrupt-names = "pwr_event",
927173bf8a0e36 Krishna Kurapati      2024-01-26  362  					  "dp_hs_phy_irq",
927173bf8a0e36 Krishna Kurapati      2024-01-26  363  					  "dm_hs_phy_irq";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  364  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  365  			clocks = <&gcc GCC_USB0_MASTER_CLK>,
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  366  				 <&gcc GCC_USB0_SLEEP_CLK>,
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  367  				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  368  			clock-names = "core",
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  369  				      "sleep",
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  370  				      "mock_utmi";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  371  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  372  			resets = <&gcc GCC_USB_BCR>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  373  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  374  			qcom,select-utmi-as-pipe-clk;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  375  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  376  			#address-cells = <1>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  377  			#size-cells = <1>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  378  			ranges;
8312d0f20f835a Varadarajan Narayanan 2024-07-30  379  			interconnects = <&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>,
8312d0f20f835a Varadarajan Narayanan 2024-07-30  380  					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
8312d0f20f835a Varadarajan Narayanan 2024-07-30  381  			interconnect-names = "usb-ddr", "apps-usb";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  382  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  383  			status = "disabled";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  384  
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  385  			usb_dwc: usb@8a00000 {
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  386  				compatible = "snps,dwc3";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  387  				reg = <0x08a00000 0xe000>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  388  				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  389  				clock-names = "ref";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  390  				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  391  				phy-names = "usb2-phy";
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  392  				phys = <&usbphy0>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  393  				tx-fifo-resize;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  394  				snps,is-utmi-l1-suspend;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  395  				snps,hird-threshold = /bits/ 8 <0x0>;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  396  				snps,dis_u2_susphy_quirk;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  397  				snps,dis_u3_susphy_quirk;
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  398  			};
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  399  		};
bfb9614015f5c6 Varadarajan Narayanan 2023-08-31  400  
eb9cde9fe03d63 Praveenkumar I        2024-12-26 @401  		pcie0: pcie@20000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
