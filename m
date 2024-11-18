Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4E1E2833
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731957977; cv=none; b=Ap+Ee3QTQ4XQ1hXe8ZwvwQ8PsJb7NjGCWQuI3e/87ziOSKQqXXxgqmn8aFj7VwRiNJq0WEsGeHrHmjN563WIULjZhoFyFp9xJBz1CUwvSV/pvJ3l/UAROz0FmCfCkuOWKXlxBA9//Un9oj1tWakV991HKofAM0ogfJRZfCpyaXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731957977; c=relaxed/simple;
	bh=H68vb5YDvHh1Qnbhkqxk37nMfBapRDlJpPe4riqvCC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SR+5arMc4b6aPt6DyqpThKOzofVNlh33/xatHleMnBNrXy0tBjw8pupetytBTcm97ei4zbxYhZnKVFbCpcWuqzIk86m9vwcpzy2yb8EigCvv7l7jTOA06PXWJl0tAV9A7iSRREd3c2O5MBBxbYE8BCjf/ixYfLWdc/l8V2O3XHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOR/Bvgg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOR/Bvgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731957975; x=1763493975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H68vb5YDvHh1Qnbhkqxk37nMfBapRDlJpPe4riqvCC8=;
  b=HOR/BvggiPRxqC2OOj+nPPgqq6yr7A52Vy8XxJPCfLCGsQEiwXDxyEna
   YQKM0McDiALepldTNP/Wrsn+mA6GuR9REn1fd8LUjMvdnh3BOclGcwsyI
   1BC8Ke/33r5kmZOMKuO6HyfVgVNQl9kFXIaEOssJfI+afO6IMVvoU/9K/
   Cb/Va5fZtehuqhtYdtfDb8amuZMScED66GP3bXsWVzlAG2a3dcL+H/acI
   L0zCTNv0VGeAKyTV1Kw9vmLnUamagrByc8Q5pzGnhQYXQCUNrwPQ70tE0
   5baGyypxep7jzZfLWEtPw2eZGPnJOiB2sC+3f/pTrz4wm091k3l8f/I1h
   g==;
X-CSE-ConnectionGUID: LP6vW0tbQK+lbi1/CU1lmw==
X-CSE-MsgGUID: IJAwL7v4QRC3lfUDFrqkkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54431070"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="54431070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:26:15 -0800
X-CSE-ConnectionGUID: BvDQfF5QQkWGLaojca7/IA==
X-CSE-MsgGUID: tmGxxStcQOmiYi0RHrFT6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94362703"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2024 11:26:15 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7Nz-0002bl-35;
	Mon, 18 Nov 2024 19:26:11 +0000
Date: Tue, 19 Nov 2024 03:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 4/7] arm64: dts: qcom: ipq5332: Add tsens node
Message-ID: <202411190334.lSy7SZo4-lkp@intel.com>
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
In-Reply-To: <20241115103957.1157495-5-quic_mmanikan@quicinc.com>
References: <20241115103957.1157495-5-quic_mmanikan@quicinc.com>
TO: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
TO: srinivas.kandagatla@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: amitk@kernel.org
TO: thara.gopinath@gmail.com
TO: rafael@kernel.org
TO: daniel.lezcano@linaro.org
TO: rui.zhang@intel.com
TO: lukasz.luba@arm.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-pm@vger.kernel.org
CC: quic_srichara@quicinc.com
CC: quic_varada@quicinc.com

Hi Manikanta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241114]
[also build test WARNING on linus/master v6.12]
[cannot apply to robh/for-next rafael-pm/thermal v6.12-rc7 v6.12-rc6 v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/dt-bindings-thermal-tsens-Add-ipq5332-ipq5424-compatible/20241115-184431
base:   next-20241114
patch link:    https://lore.kernel.org/r/20241115103957.1157495-5-quic_mmanikan%40quicinc.com
patch subject: [PATCH v8 4/7] arm64: dts: qcom: ipq5332: Add tsens node
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411190334.lSy7SZo4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190334.lSy7SZo4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411190334.lSy7SZo4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5332.dtsi:186.30-189.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3a6: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3a6)
>> arch/arm64/boot/dts/qcom/ipq5332.dtsi:206.25-209.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@3e1: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@3e1)

vim +186 arch/arm64/boot/dts/qcom/ipq5332.dtsi

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
a1b247eb22bdeb Praveenkumar I        2024-11-15  180  
a1b247eb22bdeb Praveenkumar I        2024-11-15  181  			tsens_sens11_off: s11@3a5 {
a1b247eb22bdeb Praveenkumar I        2024-11-15  182  				reg = <0x3a5 0x1>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  183  				bits = <4 4>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  184  			};
a1b247eb22bdeb Praveenkumar I        2024-11-15  185  
a1b247eb22bdeb Praveenkumar I        2024-11-15 @186  			tsens_sens12_off: s12@3a6 {
a1b247eb22bdeb Praveenkumar I        2024-11-15  187  				reg = <0x3a6 0x1>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  188  				bits = <0 4>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  189  			};
a1b247eb22bdeb Praveenkumar I        2024-11-15  190  
a1b247eb22bdeb Praveenkumar I        2024-11-15  191  			tsens_sens13_off: s13@3a6 {
a1b247eb22bdeb Praveenkumar I        2024-11-15  192  				reg = <0x3a6 0x1>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  193  				bits = <4 4>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  194  			};
a1b247eb22bdeb Praveenkumar I        2024-11-15  195  
a1b247eb22bdeb Praveenkumar I        2024-11-15  196  			tsens_sens14_off: s14@3ad {
a1b247eb22bdeb Praveenkumar I        2024-11-15  197  				reg = <0x3ad 0x2>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  198  				bits = <7 4>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  199  			};
a1b247eb22bdeb Praveenkumar I        2024-11-15  200  
a1b247eb22bdeb Praveenkumar I        2024-11-15  201  			tsens_sens15_off: s15@3ae {
a1b247eb22bdeb Praveenkumar I        2024-11-15  202  				reg = <0x3ae 0x1>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  203  				bits = <3 4>;
a1b247eb22bdeb Praveenkumar I        2024-11-15  204  			};
a1b247eb22bdeb Praveenkumar I        2024-11-15  205  
a1b247eb22bdeb Praveenkumar I        2024-11-15 @206  			tsens_mode: mode@3e1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
