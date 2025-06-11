Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654F18D65E
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jun 2025 03:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612961; cv=none; b=Glr5H9jDUWJfPf8odgsIv6QCXTD38t4A0pQ+p5Uy087f+G9lrZ3TCY5bqYEuSGacayqWqljZOJvTcSMriVjvREyGZ8xHZ28ArpkyQt/zgpXruj/8mWIrZOMbHu7HM9nAkXlEhH0YJc31rYHY/Rhl6p014NXJDmPErnfLKZ1wDr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612961; c=relaxed/simple;
	bh=Df0nOHjb14or2N0X95FbREf5X/UncWuXDA0pW3bDWdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrw3EKbffwmckR7PQ6zuftC3G5kg/KjabbP09hkDEAibAxlJb5P/U8vhZkH5Lbjv5KeNlxT0B0S/rJnAiy/EvUV8Y44cfFxi+0EOx73d+zkFz3JCmL3DUnCcomgMBPEqiOlxlO4jrjMGkXr5ch+cn3ef4kKp27f6CXjZb0L9pjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WozeKfgY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WozeKfgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749612947; x=1781148947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Df0nOHjb14or2N0X95FbREf5X/UncWuXDA0pW3bDWdw=;
  b=WozeKfgYIHYEza6pfOuuKMomD7ob2i4S4DgkZILRvHBlJ/gFmetkT/ej
   8KmtBxBLZJt0dlFAffng9FnafGtYLy2A3QkDmQVy6CG+Y7RiNrmv31A7x
   +wBgEJdug8D7u0ye+9AfOngKO7VtWum2gJN71jx+EOMnjbGL30I/4MOmE
   NfDf7JwKt/6KKubz9CxJo2g12FK0rCtxmWCbnSp134n4pWRhkrpjjZLvT
   At9INd/T4/Hro2IhQU6Q8MGFSrvtjgVwFzgnEO+ueLgmmFoFDwOc+mWXT
   ti4MzKqE61VgeWKn0ZQUKqHd/SYnW+VUdjsNqnELF/0CREwZ5EKgDEwFu
   A==;
X-CSE-ConnectionGUID: Cnin24LCQ6mbiqjfVGJKCQ==
X-CSE-MsgGUID: LOI4u974Rx2k1hRWiu2qWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62395704"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="62395704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 20:35:46 -0700
X-CSE-ConnectionGUID: 2zqqDUJoTwGSm2VNJT0KgA==
X-CSE-MsgGUID: SrR689fUTkiuAAeh6c1crQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146936353"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jun 2025 20:35:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPCFZ-0009yW-1I;
	Wed, 11 Jun 2025 03:35:41 +0000
Date: Wed, 11 Jun 2025 11:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8450-qrd: Flatten usb
 controller node
Message-ID: <202506111134.MvjCjISa-lkp@intel.com>
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
In-Reply-To: <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
References: <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
TO: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next linus/master v6.16-rc1 next-20250610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/arm64-dts-qcom-sm8450-qrd-add-pmic-glink-node/20250610-172208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250610091805.2997546-3-krishna.kurapati%40oss.qualcomm.com
patch subject: [PATCH v2 2/2] arm64: dts: qcom: sm8450-qrd: Flatten usb controller node
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250611/202506111134.MvjCjISa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111134.MvjCjISa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506111134.MvjCjISa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8450.dtsi:5419.22-5496.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450.dtsi:5419.22-5496.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +/a600000 +5419 arch/arm64/boot/dts/qcom/sm8450.dtsi

5188049c9b36d7 Vinod Koul                2021-12-15    28  
5188049c9b36d7 Vinod Koul                2021-12-15    29  / {
5188049c9b36d7 Vinod Koul                2021-12-15    30  	interrupt-parent = <&intc>;
5188049c9b36d7 Vinod Koul                2021-12-15    31  
5188049c9b36d7 Vinod Koul                2021-12-15    32  	#address-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15    33  	#size-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15    34  
5188049c9b36d7 Vinod Koul                2021-12-15    35  	chosen { };
5188049c9b36d7 Vinod Koul                2021-12-15    36  
5188049c9b36d7 Vinod Koul                2021-12-15    37  	clocks {
5188049c9b36d7 Vinod Koul                2021-12-15    38  		xo_board: xo-board {
5188049c9b36d7 Vinod Koul                2021-12-15    39  			compatible = "fixed-clock";
5188049c9b36d7 Vinod Koul                2021-12-15    40  			#clock-cells = <0>;
5188049c9b36d7 Vinod Koul                2021-12-15    41  			clock-frequency = <76800000>;
5188049c9b36d7 Vinod Koul                2021-12-15    42  		};
5188049c9b36d7 Vinod Koul                2021-12-15    43  
5188049c9b36d7 Vinod Koul                2021-12-15    44  		sleep_clk: sleep-clk {
5188049c9b36d7 Vinod Koul                2021-12-15    45  			compatible = "fixed-clock";
5188049c9b36d7 Vinod Koul                2021-12-15    46  			#clock-cells = <0>;
c375ff3b887abf Dmitry Baryshkov          2024-12-24    47  			clock-frequency = <32764>;
5188049c9b36d7 Vinod Koul                2021-12-15    48  		};
5188049c9b36d7 Vinod Koul                2021-12-15    49  	};
5188049c9b36d7 Vinod Koul                2021-12-15    50  
5188049c9b36d7 Vinod Koul                2021-12-15    51  	cpus {
5188049c9b36d7 Vinod Koul                2021-12-15    52  		#address-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15    53  		#size-cells = <0>;
5188049c9b36d7 Vinod Koul                2021-12-15    54  
92513494aff8cb Krzysztof Kozlowski       2024-10-22    55  		cpu0: cpu@0 {
5188049c9b36d7 Vinod Koul                2021-12-15    56  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15    57  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15    58  			reg = <0x0 0x0>;
5188049c9b36d7 Vinod Koul                2021-12-15    59  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22    60  			next-level-cache = <&l2_0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    61  			power-domains = <&cpu_pd0>;
5188049c9b36d7 Vinod Koul                2021-12-15    62  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15    63  			qcom,freq-domain = <&cpufreq_hw 0>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11    64  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17    65  			clocks = <&cpufreq_hw 0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    66  			l2_0: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15    67  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07    68  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16    69  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    70  				next-level-cache = <&l3_0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    71  				l3_0: l3-cache {
5188049c9b36d7 Vinod Koul                2021-12-15    72  					compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07    73  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16    74  					cache-unified;
5188049c9b36d7 Vinod Koul                2021-12-15    75  				};
5188049c9b36d7 Vinod Koul                2021-12-15    76  			};
5188049c9b36d7 Vinod Koul                2021-12-15    77  		};
5188049c9b36d7 Vinod Koul                2021-12-15    78  
92513494aff8cb Krzysztof Kozlowski       2024-10-22    79  		cpu1: cpu@100 {
5188049c9b36d7 Vinod Koul                2021-12-15    80  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15    81  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15    82  			reg = <0x0 0x100>;
5188049c9b36d7 Vinod Koul                2021-12-15    83  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22    84  			next-level-cache = <&l2_100>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    85  			power-domains = <&cpu_pd1>;
5188049c9b36d7 Vinod Koul                2021-12-15    86  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15    87  			qcom,freq-domain = <&cpufreq_hw 0>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11    88  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17    89  			clocks = <&cpufreq_hw 0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    90  			l2_100: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15    91  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07    92  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16    93  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22    94  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15    95  			};
5188049c9b36d7 Vinod Koul                2021-12-15    96  		};
5188049c9b36d7 Vinod Koul                2021-12-15    97  
92513494aff8cb Krzysztof Kozlowski       2024-10-22    98  		cpu2: cpu@200 {
5188049c9b36d7 Vinod Koul                2021-12-15    99  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15   100  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15   101  			reg = <0x0 0x200>;
5188049c9b36d7 Vinod Koul                2021-12-15   102  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22   103  			next-level-cache = <&l2_200>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   104  			power-domains = <&cpu_pd2>;
5188049c9b36d7 Vinod Koul                2021-12-15   105  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15   106  			qcom,freq-domain = <&cpufreq_hw 0>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11   107  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17   108  			clocks = <&cpufreq_hw 0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   109  			l2_200: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15   110  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07   111  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16   112  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   113  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   114  			};
5188049c9b36d7 Vinod Koul                2021-12-15   115  		};
5188049c9b36d7 Vinod Koul                2021-12-15   116  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   117  		cpu3: cpu@300 {
5188049c9b36d7 Vinod Koul                2021-12-15   118  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15   119  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15   120  			reg = <0x0 0x300>;
5188049c9b36d7 Vinod Koul                2021-12-15   121  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22   122  			next-level-cache = <&l2_300>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   123  			power-domains = <&cpu_pd3>;
5188049c9b36d7 Vinod Koul                2021-12-15   124  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15   125  			qcom,freq-domain = <&cpufreq_hw 0>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11   126  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17   127  			clocks = <&cpufreq_hw 0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   128  			l2_300: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15   129  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07   130  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16   131  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   132  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   133  			};
5188049c9b36d7 Vinod Koul                2021-12-15   134  		};
5188049c9b36d7 Vinod Koul                2021-12-15   135  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   136  		cpu4: cpu@400 {
5188049c9b36d7 Vinod Koul                2021-12-15   137  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15   138  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15   139  			reg = <0x0 0x400>;
5188049c9b36d7 Vinod Koul                2021-12-15   140  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22   141  			next-level-cache = <&l2_400>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   142  			power-domains = <&cpu_pd4>;
5188049c9b36d7 Vinod Koul                2021-12-15   143  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15   144  			qcom,freq-domain = <&cpufreq_hw 1>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11   145  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17   146  			clocks = <&cpufreq_hw 1>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   147  			l2_400: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15   148  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07   149  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16   150  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   151  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   152  			};
5188049c9b36d7 Vinod Koul                2021-12-15   153  		};
5188049c9b36d7 Vinod Koul                2021-12-15   154  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   155  		cpu5: cpu@500 {
5188049c9b36d7 Vinod Koul                2021-12-15   156  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15   157  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15   158  			reg = <0x0 0x500>;
5188049c9b36d7 Vinod Koul                2021-12-15   159  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22   160  			next-level-cache = <&l2_500>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   161  			power-domains = <&cpu_pd5>;
5188049c9b36d7 Vinod Koul                2021-12-15   162  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15   163  			qcom,freq-domain = <&cpufreq_hw 1>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11   164  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17   165  			clocks = <&cpufreq_hw 1>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   166  			l2_500: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15   167  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07   168  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16   169  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   170  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   171  			};
5188049c9b36d7 Vinod Koul                2021-12-15   172  		};
5188049c9b36d7 Vinod Koul                2021-12-15   173  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   174  		cpu6: cpu@600 {
5188049c9b36d7 Vinod Koul                2021-12-15   175  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15   176  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15   177  			reg = <0x0 0x600>;
5188049c9b36d7 Vinod Koul                2021-12-15   178  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22   179  			next-level-cache = <&l2_600>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   180  			power-domains = <&cpu_pd6>;
5188049c9b36d7 Vinod Koul                2021-12-15   181  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15   182  			qcom,freq-domain = <&cpufreq_hw 1>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11   183  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17   184  			clocks = <&cpufreq_hw 1>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   185  			l2_600: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15   186  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07   187  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16   188  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   189  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   190  			};
5188049c9b36d7 Vinod Koul                2021-12-15   191  		};
5188049c9b36d7 Vinod Koul                2021-12-15   192  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   193  		cpu7: cpu@700 {
5188049c9b36d7 Vinod Koul                2021-12-15   194  			device_type = "cpu";
5188049c9b36d7 Vinod Koul                2021-12-15   195  			compatible = "qcom,kryo780";
5188049c9b36d7 Vinod Koul                2021-12-15   196  			reg = <0x0 0x700>;
5188049c9b36d7 Vinod Koul                2021-12-15   197  			enable-method = "psci";
92513494aff8cb Krzysztof Kozlowski       2024-10-22   198  			next-level-cache = <&l2_700>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   199  			power-domains = <&cpu_pd7>;
5188049c9b36d7 Vinod Koul                2021-12-15   200  			power-domain-names = "psci";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15   201  			qcom,freq-domain = <&cpufreq_hw 2>;
fccf8e31ac3d7c Vladimir Zapolskiy        2022-04-11   202  			#cooling-cells = <2>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17   203  			clocks = <&cpufreq_hw 2>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   204  			l2_700: l2-cache {
5188049c9b36d7 Vinod Koul                2021-12-15   205  				compatible = "cache";
9435294c6517dc Pierre Gondois            2022-11-07   206  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski       2023-04-16   207  				cache-unified;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   208  				next-level-cache = <&l3_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   209  			};
5188049c9b36d7 Vinod Koul                2021-12-15   210  		};
5188049c9b36d7 Vinod Koul                2021-12-15   211  
5188049c9b36d7 Vinod Koul                2021-12-15   212  		cpu-map {
5188049c9b36d7 Vinod Koul                2021-12-15   213  			cluster0 {
5188049c9b36d7 Vinod Koul                2021-12-15   214  				core0 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   215  					cpu = <&cpu0>;
5188049c9b36d7 Vinod Koul                2021-12-15   216  				};
5188049c9b36d7 Vinod Koul                2021-12-15   217  
5188049c9b36d7 Vinod Koul                2021-12-15   218  				core1 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   219  					cpu = <&cpu1>;
5188049c9b36d7 Vinod Koul                2021-12-15   220  				};
5188049c9b36d7 Vinod Koul                2021-12-15   221  
5188049c9b36d7 Vinod Koul                2021-12-15   222  				core2 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   223  					cpu = <&cpu2>;
5188049c9b36d7 Vinod Koul                2021-12-15   224  				};
5188049c9b36d7 Vinod Koul                2021-12-15   225  
5188049c9b36d7 Vinod Koul                2021-12-15   226  				core3 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   227  					cpu = <&cpu3>;
5188049c9b36d7 Vinod Koul                2021-12-15   228  				};
5188049c9b36d7 Vinod Koul                2021-12-15   229  
5188049c9b36d7 Vinod Koul                2021-12-15   230  				core4 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   231  					cpu = <&cpu4>;
5188049c9b36d7 Vinod Koul                2021-12-15   232  				};
5188049c9b36d7 Vinod Koul                2021-12-15   233  
5188049c9b36d7 Vinod Koul                2021-12-15   234  				core5 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   235  					cpu = <&cpu5>;
5188049c9b36d7 Vinod Koul                2021-12-15   236  				};
5188049c9b36d7 Vinod Koul                2021-12-15   237  
5188049c9b36d7 Vinod Koul                2021-12-15   238  				core6 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   239  					cpu = <&cpu6>;
5188049c9b36d7 Vinod Koul                2021-12-15   240  				};
5188049c9b36d7 Vinod Koul                2021-12-15   241  
5188049c9b36d7 Vinod Koul                2021-12-15   242  				core7 {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   243  					cpu = <&cpu7>;
5188049c9b36d7 Vinod Koul                2021-12-15   244  				};
5188049c9b36d7 Vinod Koul                2021-12-15   245  			};
5188049c9b36d7 Vinod Koul                2021-12-15   246  		};
5188049c9b36d7 Vinod Koul                2021-12-15   247  
5188049c9b36d7 Vinod Koul                2021-12-15   248  		idle-states {
5188049c9b36d7 Vinod Koul                2021-12-15   249  			entry-method = "psci";
5188049c9b36d7 Vinod Koul                2021-12-15   250  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   251  			little_cpu_sleep_0: cpu-sleep-0-0 {
5188049c9b36d7 Vinod Koul                2021-12-15   252  				compatible = "arm,idle-state";
5188049c9b36d7 Vinod Koul                2021-12-15   253  				idle-state-name = "silver-rail-power-collapse";
5188049c9b36d7 Vinod Koul                2021-12-15   254  				arm,psci-suspend-param = <0x40000004>;
6574702b0d394d Maulik Shah               2022-01-09   255  				entry-latency-us = <800>;
6574702b0d394d Maulik Shah               2022-01-09   256  				exit-latency-us = <750>;
6574702b0d394d Maulik Shah               2022-01-09   257  				min-residency-us = <4090>;
5188049c9b36d7 Vinod Koul                2021-12-15   258  				local-timer-stop;
5188049c9b36d7 Vinod Koul                2021-12-15   259  			};
5188049c9b36d7 Vinod Koul                2021-12-15   260  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   261  			big_cpu_sleep_0: cpu-sleep-1-0 {
5188049c9b36d7 Vinod Koul                2021-12-15   262  				compatible = "arm,idle-state";
5188049c9b36d7 Vinod Koul                2021-12-15   263  				idle-state-name = "gold-rail-power-collapse";
5188049c9b36d7 Vinod Koul                2021-12-15   264  				arm,psci-suspend-param = <0x40000004>;
6574702b0d394d Maulik Shah               2022-01-09   265  				entry-latency-us = <600>;
6574702b0d394d Maulik Shah               2022-01-09   266  				exit-latency-us = <1550>;
6574702b0d394d Maulik Shah               2022-01-09   267  				min-residency-us = <4791>;
5188049c9b36d7 Vinod Koul                2021-12-15   268  				local-timer-stop;
5188049c9b36d7 Vinod Koul                2021-12-15   269  			};
5188049c9b36d7 Vinod Koul                2021-12-15   270  		};
5188049c9b36d7 Vinod Koul                2021-12-15   271  
5188049c9b36d7 Vinod Koul                2021-12-15   272  		domain-idle-states {
92513494aff8cb Krzysztof Kozlowski       2024-10-22   273  			cluster_sleep_0: cluster-sleep-0 {
5188049c9b36d7 Vinod Koul                2021-12-15   274  				compatible = "domain-idle-state";
6574702b0d394d Maulik Shah               2022-01-09   275  				arm,psci-suspend-param = <0x41000044>;
6574702b0d394d Maulik Shah               2022-01-09   276  				entry-latency-us = <1050>;
6574702b0d394d Maulik Shah               2022-01-09   277  				exit-latency-us = <2500>;
6574702b0d394d Maulik Shah               2022-01-09   278  				min-residency-us = <5309>;
5188049c9b36d7 Vinod Koul                2021-12-15   279  			};
5188049c9b36d7 Vinod Koul                2021-12-15   280  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   281  			cluster_sleep_1: cluster-sleep-1 {
5188049c9b36d7 Vinod Koul                2021-12-15   282  				compatible = "domain-idle-state";
5188049c9b36d7 Vinod Koul                2021-12-15   283  				arm,psci-suspend-param = <0x4100c344>;
6574702b0d394d Maulik Shah               2022-01-09   284  				entry-latency-us = <2700>;
6574702b0d394d Maulik Shah               2022-01-09   285  				exit-latency-us = <3500>;
6574702b0d394d Maulik Shah               2022-01-09   286  				min-residency-us = <13959>;
5188049c9b36d7 Vinod Koul                2021-12-15   287  			};
5188049c9b36d7 Vinod Koul                2021-12-15   288  		};
5188049c9b36d7 Vinod Koul                2021-12-15   289  	};
5188049c9b36d7 Vinod Koul                2021-12-15   290  
6e8637db89bf13 Mao Jinlong               2025-01-07   291  	ete-0 {
6e8637db89bf13 Mao Jinlong               2025-01-07   292  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   293  		cpu = <&cpu0>;
6e8637db89bf13 Mao Jinlong               2025-01-07   294  
6e8637db89bf13 Mao Jinlong               2025-01-07   295  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   296  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   297  				ete0_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   298  					remote-endpoint = <&funnel_ete_in_ete0>;
6e8637db89bf13 Mao Jinlong               2025-01-07   299  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   300  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   301  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   302  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   303  
6e8637db89bf13 Mao Jinlong               2025-01-07   304  	ete-1 {
6e8637db89bf13 Mao Jinlong               2025-01-07   305  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   306  		cpu = <&cpu1>;
6e8637db89bf13 Mao Jinlong               2025-01-07   307  
6e8637db89bf13 Mao Jinlong               2025-01-07   308  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   309  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   310  				ete1_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   311  					remote-endpoint = <&funnel_ete_in_ete1>;
6e8637db89bf13 Mao Jinlong               2025-01-07   312  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   313  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   314  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   315  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   316  
6e8637db89bf13 Mao Jinlong               2025-01-07   317  	ete-2 {
6e8637db89bf13 Mao Jinlong               2025-01-07   318  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   319  		cpu = <&cpu2>;
6e8637db89bf13 Mao Jinlong               2025-01-07   320  
6e8637db89bf13 Mao Jinlong               2025-01-07   321  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   322  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   323  				ete2_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   324  					remote-endpoint = <&funnel_ete_in_ete2>;
6e8637db89bf13 Mao Jinlong               2025-01-07   325  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   326  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   327  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   328  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   329  
6e8637db89bf13 Mao Jinlong               2025-01-07   330  	ete-3 {
6e8637db89bf13 Mao Jinlong               2025-01-07   331  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   332  		cpu = <&cpu3>;
6e8637db89bf13 Mao Jinlong               2025-01-07   333  
6e8637db89bf13 Mao Jinlong               2025-01-07   334  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   335  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   336  				ete3_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   337  					remote-endpoint = <&funnel_ete_in_ete3>;
6e8637db89bf13 Mao Jinlong               2025-01-07   338  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   339  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   340  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   341  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   342  
6e8637db89bf13 Mao Jinlong               2025-01-07   343  	ete-4 {
6e8637db89bf13 Mao Jinlong               2025-01-07   344  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   345  		cpu = <&cpu4>;
6e8637db89bf13 Mao Jinlong               2025-01-07   346  
6e8637db89bf13 Mao Jinlong               2025-01-07   347  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   348  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   349  				ete4_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   350  					remote-endpoint = <&funnel_ete_in_ete4>;
6e8637db89bf13 Mao Jinlong               2025-01-07   351  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   352  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   353  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   354  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   355  
6e8637db89bf13 Mao Jinlong               2025-01-07   356  	ete-5 {
6e8637db89bf13 Mao Jinlong               2025-01-07   357  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   358  		cpu = <&cpu5>;
6e8637db89bf13 Mao Jinlong               2025-01-07   359  
6e8637db89bf13 Mao Jinlong               2025-01-07   360  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   361  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   362  				ete5_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   363  					remote-endpoint = <&funnel_ete_in_ete5>;
6e8637db89bf13 Mao Jinlong               2025-01-07   364  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   365  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   366  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   367  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   368  
6e8637db89bf13 Mao Jinlong               2025-01-07   369  	ete-6 {
6e8637db89bf13 Mao Jinlong               2025-01-07   370  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   371  		cpu = <&cpu6>;
6e8637db89bf13 Mao Jinlong               2025-01-07   372  
6e8637db89bf13 Mao Jinlong               2025-01-07   373  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   374  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   375  				ete6_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   376  					remote-endpoint = <&funnel_ete_in_ete6>;
6e8637db89bf13 Mao Jinlong               2025-01-07   377  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   378  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   379  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   380  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   381  
6e8637db89bf13 Mao Jinlong               2025-01-07   382  	ete-7 {
6e8637db89bf13 Mao Jinlong               2025-01-07   383  		compatible = "arm,embedded-trace-extension";
6e8637db89bf13 Mao Jinlong               2025-01-07   384  		cpu = <&cpu7>;
6e8637db89bf13 Mao Jinlong               2025-01-07   385  
6e8637db89bf13 Mao Jinlong               2025-01-07   386  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   387  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   388  				ete7_out_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   389  					remote-endpoint = <&funnel_ete_in_ete7>;
6e8637db89bf13 Mao Jinlong               2025-01-07   390  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   391  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   392  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   393  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   394  
6e8637db89bf13 Mao Jinlong               2025-01-07   395  	funnel-ete {
6e8637db89bf13 Mao Jinlong               2025-01-07   396  		compatible = "arm,coresight-static-funnel";
6e8637db89bf13 Mao Jinlong               2025-01-07   397  
6e8637db89bf13 Mao Jinlong               2025-01-07   398  		out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   399  			port {
6e8637db89bf13 Mao Jinlong               2025-01-07   400  				funnel_ete_out_funnel_apss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   401  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   402  						<&funnel_apss_in_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   403  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   404  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   405  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   406  
6e8637db89bf13 Mao Jinlong               2025-01-07   407  		in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07   408  			#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07   409  			#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07   410  
6e8637db89bf13 Mao Jinlong               2025-01-07   411  			port@0 {
6e8637db89bf13 Mao Jinlong               2025-01-07   412  				reg = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07   413  				funnel_ete_in_ete0: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   414  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   415  						<&ete0_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   416  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   417  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   418  
6e8637db89bf13 Mao Jinlong               2025-01-07   419  			port@1 {
6e8637db89bf13 Mao Jinlong               2025-01-07   420  				reg = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07   421  				funnel_ete_in_ete1: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   422  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   423  						<&ete1_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   424  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   425  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   426  
6e8637db89bf13 Mao Jinlong               2025-01-07   427  			port@2 {
6e8637db89bf13 Mao Jinlong               2025-01-07   428  				reg = <2>;
6e8637db89bf13 Mao Jinlong               2025-01-07   429  				funnel_ete_in_ete2: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   430  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   431  						<&ete2_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   432  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   433  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   434  
6e8637db89bf13 Mao Jinlong               2025-01-07   435  			port@3 {
6e8637db89bf13 Mao Jinlong               2025-01-07   436  				reg = <3>;
6e8637db89bf13 Mao Jinlong               2025-01-07   437  				funnel_ete_in_ete3: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   438  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   439  						<&ete3_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   440  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   441  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   442  
6e8637db89bf13 Mao Jinlong               2025-01-07   443  			port@4 {
6e8637db89bf13 Mao Jinlong               2025-01-07   444  				reg = <4>;
6e8637db89bf13 Mao Jinlong               2025-01-07   445  				funnel_ete_in_ete4: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   446  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   447  						<&ete4_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   448  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   449  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   450  
6e8637db89bf13 Mao Jinlong               2025-01-07   451  			port@5 {
6e8637db89bf13 Mao Jinlong               2025-01-07   452  				reg = <5>;
6e8637db89bf13 Mao Jinlong               2025-01-07   453  				funnel_ete_in_ete5: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   454  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   455  						<&ete5_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   456  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   457  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   458  
6e8637db89bf13 Mao Jinlong               2025-01-07   459  			port@6 {
6e8637db89bf13 Mao Jinlong               2025-01-07   460  				reg = <6>;
6e8637db89bf13 Mao Jinlong               2025-01-07   461  				funnel_ete_in_ete6: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   462  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   463  						<&ete6_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   464  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   465  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   466  
6e8637db89bf13 Mao Jinlong               2025-01-07   467  			port@7 {
6e8637db89bf13 Mao Jinlong               2025-01-07   468  				reg = <7>;
6e8637db89bf13 Mao Jinlong               2025-01-07   469  				funnel_ete_in_ete7: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07   470  					remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07   471  						<&ete7_out_funnel_ete>;
6e8637db89bf13 Mao Jinlong               2025-01-07   472  				};
6e8637db89bf13 Mao Jinlong               2025-01-07   473  			};
6e8637db89bf13 Mao Jinlong               2025-01-07   474  		};
6e8637db89bf13 Mao Jinlong               2025-01-07   475  	};
6e8637db89bf13 Mao Jinlong               2025-01-07   476  
5188049c9b36d7 Vinod Koul                2021-12-15   477  	firmware {
5188049c9b36d7 Vinod Koul                2021-12-15   478  		scm: scm {
5188049c9b36d7 Vinod Koul                2021-12-15   479  			compatible = "qcom,scm-sm8450", "qcom,scm";
1f731bbf71e374 Mukesh Ojha               2023-01-12   480  			qcom,dload-mode = <&tcsr 0x13000>;
4c9fb8e89849db Sibi Sankar               2022-05-23   481  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
5188049c9b36d7 Vinod Koul                2021-12-15   482  			#reset-cells = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15   483  		};
5188049c9b36d7 Vinod Koul                2021-12-15   484  	};
5188049c9b36d7 Vinod Koul                2021-12-15   485  
12cfafe7b78876 Vinod Koul                2022-06-06   486  	clk_virt: interconnect-0 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03   487  		compatible = "qcom,sm8450-clk-virt";
aa2d0bf04a3c97 Vinod Koul                2022-02-03   488  		#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03   489  		qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03   490  	};
aa2d0bf04a3c97 Vinod Koul                2022-02-03   491  
12cfafe7b78876 Vinod Koul                2022-06-06   492  	mc_virt: interconnect-1 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03   493  		compatible = "qcom,sm8450-mc-virt";
aa2d0bf04a3c97 Vinod Koul                2022-02-03   494  		#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03   495  		qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03   496  	};
aa2d0bf04a3c97 Vinod Koul                2022-02-03   497  
5188049c9b36d7 Vinod Koul                2021-12-15   498  	memory@a0000000 {
5188049c9b36d7 Vinod Koul                2021-12-15   499  		device_type = "memory";
5188049c9b36d7 Vinod Koul                2021-12-15   500  		/* We expect the bootloader to fill in the size */
5188049c9b36d7 Vinod Koul                2021-12-15   501  		reg = <0x0 0xa0000000 0x0 0x0>;
5188049c9b36d7 Vinod Koul                2021-12-15   502  	};
5188049c9b36d7 Vinod Koul                2021-12-15   503  
5188049c9b36d7 Vinod Koul                2021-12-15   504  	pmu {
5188049c9b36d7 Vinod Koul                2021-12-15   505  		compatible = "arm,armv8-pmuv3";
5188049c9b36d7 Vinod Koul                2021-12-15   506  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
5188049c9b36d7 Vinod Koul                2021-12-15   507  	};
5188049c9b36d7 Vinod Koul                2021-12-15   508  
5188049c9b36d7 Vinod Koul                2021-12-15   509  	psci {
5188049c9b36d7 Vinod Koul                2021-12-15   510  		compatible = "arm,psci-1.0";
5188049c9b36d7 Vinod Koul                2021-12-15   511  		method = "smc";
5188049c9b36d7 Vinod Koul                2021-12-15   512  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   513  		cpu_pd0: power-domain-cpu0 {
5188049c9b36d7 Vinod Koul                2021-12-15   514  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   515  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   516  			domain-idle-states = <&little_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   517  		};
5188049c9b36d7 Vinod Koul                2021-12-15   518  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   519  		cpu_pd1: power-domain-cpu1 {
5188049c9b36d7 Vinod Koul                2021-12-15   520  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   521  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   522  			domain-idle-states = <&little_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   523  		};
5188049c9b36d7 Vinod Koul                2021-12-15   524  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   525  		cpu_pd2: power-domain-cpu2 {
5188049c9b36d7 Vinod Koul                2021-12-15   526  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   527  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   528  			domain-idle-states = <&little_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   529  		};
5188049c9b36d7 Vinod Koul                2021-12-15   530  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   531  		cpu_pd3: power-domain-cpu3 {
5188049c9b36d7 Vinod Koul                2021-12-15   532  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   533  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   534  			domain-idle-states = <&little_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   535  		};
5188049c9b36d7 Vinod Koul                2021-12-15   536  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   537  		cpu_pd4: power-domain-cpu4 {
5188049c9b36d7 Vinod Koul                2021-12-15   538  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   539  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   540  			domain-idle-states = <&big_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   541  		};
5188049c9b36d7 Vinod Koul                2021-12-15   542  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   543  		cpu_pd5: power-domain-cpu5 {
5188049c9b36d7 Vinod Koul                2021-12-15   544  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   545  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   546  			domain-idle-states = <&big_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   547  		};
5188049c9b36d7 Vinod Koul                2021-12-15   548  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   549  		cpu_pd6: power-domain-cpu6 {
5188049c9b36d7 Vinod Koul                2021-12-15   550  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   551  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   552  			domain-idle-states = <&big_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   553  		};
5188049c9b36d7 Vinod Koul                2021-12-15   554  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   555  		cpu_pd7: power-domain-cpu7 {
5188049c9b36d7 Vinod Koul                2021-12-15   556  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   557  			power-domains = <&cluster_pd>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   558  			domain-idle-states = <&big_cpu_sleep_0>;
5188049c9b36d7 Vinod Koul                2021-12-15   559  		};
5188049c9b36d7 Vinod Koul                2021-12-15   560  
92513494aff8cb Krzysztof Kozlowski       2024-10-22   561  		cluster_pd: power-domain-cpu-cluster0 {
5188049c9b36d7 Vinod Koul                2021-12-15   562  			#power-domain-cells = <0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22   563  			domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>;
5188049c9b36d7 Vinod Koul                2021-12-15   564  		};
5188049c9b36d7 Vinod Koul                2021-12-15   565  	};
5188049c9b36d7 Vinod Koul                2021-12-15   566  
0e3e654696074b Krzysztof Kozlowski       2022-06-27   567  	qup_opp_table_100mhz: opp-table-qup {
a84e88e9a00334 Vinod Koul                2022-04-14   568  		compatible = "operating-points-v2";
a84e88e9a00334 Vinod Koul                2022-04-14   569  
a84e88e9a00334 Vinod Koul                2022-04-14   570  		opp-50000000 {
a84e88e9a00334 Vinod Koul                2022-04-14   571  			opp-hz = /bits/ 64 <50000000>;
a84e88e9a00334 Vinod Koul                2022-04-14   572  			required-opps = <&rpmhpd_opp_min_svs>;
a84e88e9a00334 Vinod Koul                2022-04-14   573  		};
a84e88e9a00334 Vinod Koul                2022-04-14   574  
a84e88e9a00334 Vinod Koul                2022-04-14   575  		opp-75000000 {
a84e88e9a00334 Vinod Koul                2022-04-14   576  			opp-hz = /bits/ 64 <75000000>;
a84e88e9a00334 Vinod Koul                2022-04-14   577  			required-opps = <&rpmhpd_opp_low_svs>;
a84e88e9a00334 Vinod Koul                2022-04-14   578  		};
a84e88e9a00334 Vinod Koul                2022-04-14   579  
a84e88e9a00334 Vinod Koul                2022-04-14   580  		opp-100000000 {
a84e88e9a00334 Vinod Koul                2022-04-14   581  			opp-hz = /bits/ 64 <100000000>;
a84e88e9a00334 Vinod Koul                2022-04-14   582  			required-opps = <&rpmhpd_opp_svs>;
a84e88e9a00334 Vinod Koul                2022-04-14   583  		};
a84e88e9a00334 Vinod Koul                2022-04-14   584  	};
a84e88e9a00334 Vinod Koul                2022-04-14   585  
285f97bc4b017b Vinod Koul                2021-12-15   586  	reserved_memory: reserved-memory {
285f97bc4b017b Vinod Koul                2021-12-15   587  		#address-cells = <2>;
285f97bc4b017b Vinod Koul                2021-12-15   588  		#size-cells = <2>;
285f97bc4b017b Vinod Koul                2021-12-15   589  		ranges;
285f97bc4b017b Vinod Koul                2021-12-15   590  
285f97bc4b017b Vinod Koul                2021-12-15   591  		hyp_mem: memory@80000000 {
285f97bc4b017b Vinod Koul                2021-12-15   592  			reg = <0x0 0x80000000 0x0 0x600000>;
285f97bc4b017b Vinod Koul                2021-12-15   593  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   594  		};
285f97bc4b017b Vinod Koul                2021-12-15   595  
285f97bc4b017b Vinod Koul                2021-12-15   596  		xbl_dt_log_mem: memory@80600000 {
285f97bc4b017b Vinod Koul                2021-12-15   597  			reg = <0x0 0x80600000 0x0 0x40000>;
285f97bc4b017b Vinod Koul                2021-12-15   598  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   599  		};
285f97bc4b017b Vinod Koul                2021-12-15   600  
285f97bc4b017b Vinod Koul                2021-12-15   601  		xbl_ramdump_mem: memory@80640000 {
285f97bc4b017b Vinod Koul                2021-12-15   602  			reg = <0x0 0x80640000 0x0 0x180000>;
285f97bc4b017b Vinod Koul                2021-12-15   603  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   604  		};
285f97bc4b017b Vinod Koul                2021-12-15   605  
285f97bc4b017b Vinod Koul                2021-12-15   606  		xbl_sc_mem: memory@807c0000 {
285f97bc4b017b Vinod Koul                2021-12-15   607  			reg = <0x0 0x807c0000 0x0 0x40000>;
285f97bc4b017b Vinod Koul                2021-12-15   608  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   609  		};
285f97bc4b017b Vinod Koul                2021-12-15   610  
285f97bc4b017b Vinod Koul                2021-12-15   611  		aop_image_mem: memory@80800000 {
285f97bc4b017b Vinod Koul                2021-12-15   612  			reg = <0x0 0x80800000 0x0 0x60000>;
285f97bc4b017b Vinod Koul                2021-12-15   613  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   614  		};
285f97bc4b017b Vinod Koul                2021-12-15   615  
285f97bc4b017b Vinod Koul                2021-12-15   616  		aop_cmd_db_mem: memory@80860000 {
285f97bc4b017b Vinod Koul                2021-12-15   617  			compatible = "qcom,cmd-db";
285f97bc4b017b Vinod Koul                2021-12-15   618  			reg = <0x0 0x80860000 0x0 0x20000>;
285f97bc4b017b Vinod Koul                2021-12-15   619  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   620  		};
285f97bc4b017b Vinod Koul                2021-12-15   621  
285f97bc4b017b Vinod Koul                2021-12-15   622  		aop_config_mem: memory@80880000 {
285f97bc4b017b Vinod Koul                2021-12-15   623  			reg = <0x0 0x80880000 0x0 0x20000>;
285f97bc4b017b Vinod Koul                2021-12-15   624  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   625  		};
285f97bc4b017b Vinod Koul                2021-12-15   626  
285f97bc4b017b Vinod Koul                2021-12-15   627  		tme_crash_dump_mem: memory@808a0000 {
285f97bc4b017b Vinod Koul                2021-12-15   628  			reg = <0x0 0x808a0000 0x0 0x40000>;
285f97bc4b017b Vinod Koul                2021-12-15   629  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   630  		};
285f97bc4b017b Vinod Koul                2021-12-15   631  
285f97bc4b017b Vinod Koul                2021-12-15   632  		tme_log_mem: memory@808e0000 {
285f97bc4b017b Vinod Koul                2021-12-15   633  			reg = <0x0 0x808e0000 0x0 0x4000>;
285f97bc4b017b Vinod Koul                2021-12-15   634  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   635  		};
285f97bc4b017b Vinod Koul                2021-12-15   636  
285f97bc4b017b Vinod Koul                2021-12-15   637  		uefi_log_mem: memory@808e4000 {
285f97bc4b017b Vinod Koul                2021-12-15   638  			reg = <0x0 0x808e4000 0x0 0x10000>;
285f97bc4b017b Vinod Koul                2021-12-15   639  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   640  		};
285f97bc4b017b Vinod Koul                2021-12-15   641  
285f97bc4b017b Vinod Koul                2021-12-15   642  		/* secdata region can be reused by apps */
285f97bc4b017b Vinod Koul                2021-12-15   643  		smem: memory@80900000 {
285f97bc4b017b Vinod Koul                2021-12-15   644  			compatible = "qcom,smem";
285f97bc4b017b Vinod Koul                2021-12-15   645  			reg = <0x0 0x80900000 0x0 0x200000>;
285f97bc4b017b Vinod Koul                2021-12-15   646  			hwlocks = <&tcsr_mutex 3>;
285f97bc4b017b Vinod Koul                2021-12-15   647  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   648  		};
285f97bc4b017b Vinod Koul                2021-12-15   649  
285f97bc4b017b Vinod Koul                2021-12-15   650  		cpucp_fw_mem: memory@80b00000 {
285f97bc4b017b Vinod Koul                2021-12-15   651  			reg = <0x0 0x80b00000 0x0 0x100000>;
285f97bc4b017b Vinod Koul                2021-12-15   652  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   653  		};
285f97bc4b017b Vinod Koul                2021-12-15   654  
285f97bc4b017b Vinod Koul                2021-12-15   655  		cdsp_secure_heap: memory@80c00000 {
285f97bc4b017b Vinod Koul                2021-12-15   656  			reg = <0x0 0x80c00000 0x0 0x4600000>;
285f97bc4b017b Vinod Koul                2021-12-15   657  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   658  		};
285f97bc4b017b Vinod Koul                2021-12-15   659  
285f97bc4b017b Vinod Koul                2021-12-15   660  		video_mem: memory@85700000 {
285f97bc4b017b Vinod Koul                2021-12-15   661  			reg = <0x0 0x85700000 0x0 0x700000>;
285f97bc4b017b Vinod Koul                2021-12-15   662  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   663  		};
285f97bc4b017b Vinod Koul                2021-12-15   664  
285f97bc4b017b Vinod Koul                2021-12-15   665  		adsp_mem: memory@85e00000 {
285f97bc4b017b Vinod Koul                2021-12-15   666  			reg = <0x0 0x85e00000 0x0 0x2100000>;
285f97bc4b017b Vinod Koul                2021-12-15   667  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   668  		};
285f97bc4b017b Vinod Koul                2021-12-15   669  
285f97bc4b017b Vinod Koul                2021-12-15   670  		slpi_mem: memory@88000000 {
285f97bc4b017b Vinod Koul                2021-12-15   671  			reg = <0x0 0x88000000 0x0 0x1900000>;
285f97bc4b017b Vinod Koul                2021-12-15   672  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   673  		};
285f97bc4b017b Vinod Koul                2021-12-15   674  
285f97bc4b017b Vinod Koul                2021-12-15   675  		cdsp_mem: memory@89900000 {
285f97bc4b017b Vinod Koul                2021-12-15   676  			reg = <0x0 0x89900000 0x0 0x2000000>;
285f97bc4b017b Vinod Koul                2021-12-15   677  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   678  		};
285f97bc4b017b Vinod Koul                2021-12-15   679  
285f97bc4b017b Vinod Koul                2021-12-15   680  		ipa_fw_mem: memory@8b900000 {
285f97bc4b017b Vinod Koul                2021-12-15   681  			reg = <0x0 0x8b900000 0x0 0x10000>;
285f97bc4b017b Vinod Koul                2021-12-15   682  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   683  		};
285f97bc4b017b Vinod Koul                2021-12-15   684  
285f97bc4b017b Vinod Koul                2021-12-15   685  		ipa_gsi_mem: memory@8b910000 {
285f97bc4b017b Vinod Koul                2021-12-15   686  			reg = <0x0 0x8b910000 0x0 0xa000>;
285f97bc4b017b Vinod Koul                2021-12-15   687  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   688  		};
285f97bc4b017b Vinod Koul                2021-12-15   689  
285f97bc4b017b Vinod Koul                2021-12-15   690  		gpu_micro_code_mem: memory@8b91a000 {
285f97bc4b017b Vinod Koul                2021-12-15   691  			reg = <0x0 0x8b91a000 0x0 0x2000>;
285f97bc4b017b Vinod Koul                2021-12-15   692  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   693  		};
285f97bc4b017b Vinod Koul                2021-12-15   694  
285f97bc4b017b Vinod Koul                2021-12-15   695  		spss_region_mem: memory@8ba00000 {
285f97bc4b017b Vinod Koul                2021-12-15   696  			reg = <0x0 0x8ba00000 0x0 0x180000>;
285f97bc4b017b Vinod Koul                2021-12-15   697  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   698  		};
285f97bc4b017b Vinod Koul                2021-12-15   699  
285f97bc4b017b Vinod Koul                2021-12-15   700  		/* First part of the "SPU secure shared memory" region */
285f97bc4b017b Vinod Koul                2021-12-15   701  		spu_tz_shared_mem: memory@8bb80000 {
285f97bc4b017b Vinod Koul                2021-12-15   702  			reg = <0x0 0x8bb80000 0x0 0x60000>;
285f97bc4b017b Vinod Koul                2021-12-15   703  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   704  		};
285f97bc4b017b Vinod Koul                2021-12-15   705  
285f97bc4b017b Vinod Koul                2021-12-15   706  		/* Second part of the "SPU secure shared memory" region */
285f97bc4b017b Vinod Koul                2021-12-15   707  		spu_modem_shared_mem: memory@8bbe0000 {
285f97bc4b017b Vinod Koul                2021-12-15   708  			reg = <0x0 0x8bbe0000 0x0 0x20000>;
285f97bc4b017b Vinod Koul                2021-12-15   709  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   710  		};
285f97bc4b017b Vinod Koul                2021-12-15   711  
285f97bc4b017b Vinod Koul                2021-12-15   712  		mpss_mem: memory@8bc00000 {
285f97bc4b017b Vinod Koul                2021-12-15   713  			reg = <0x0 0x8bc00000 0x0 0x13200000>;
285f97bc4b017b Vinod Koul                2021-12-15   714  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   715  		};
285f97bc4b017b Vinod Koul                2021-12-15   716  
285f97bc4b017b Vinod Koul                2021-12-15   717  		cvp_mem: memory@9ee00000 {
285f97bc4b017b Vinod Koul                2021-12-15   718  			reg = <0x0 0x9ee00000 0x0 0x700000>;
285f97bc4b017b Vinod Koul                2021-12-15   719  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   720  		};
285f97bc4b017b Vinod Koul                2021-12-15   721  
2fb19263442dda Konrad Dybcio             2022-07-14   722  		camera_mem: memory@9f500000 {
2fb19263442dda Konrad Dybcio             2022-07-14   723  			reg = <0x0 0x9f500000 0x0 0x800000>;
2fb19263442dda Konrad Dybcio             2022-07-14   724  			no-map;
2fb19263442dda Konrad Dybcio             2022-07-14   725  		};
2fb19263442dda Konrad Dybcio             2022-07-14   726  
1172729576fbbe Bjorn Andersson           2022-01-27   727  		rmtfs_mem: memory@9fd00000 {
1172729576fbbe Bjorn Andersson           2022-01-27   728  			compatible = "qcom,rmtfs-mem";
1172729576fbbe Bjorn Andersson           2022-01-27   729  			reg = <0x0 0x9fd00000 0x0 0x280000>;
1172729576fbbe Bjorn Andersson           2022-01-27   730  			no-map;
1172729576fbbe Bjorn Andersson           2022-01-27   731  
1172729576fbbe Bjorn Andersson           2022-01-27   732  			qcom,client-id = <1>;
018c949b32df9f Luca Weiss                2023-08-18   733  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
1172729576fbbe Bjorn Andersson           2022-01-27   734  		};
1172729576fbbe Bjorn Andersson           2022-01-27   735  
2fb19263442dda Konrad Dybcio             2022-07-14   736  		xbl_sc_mem2: memory@a6e00000 {
2fb19263442dda Konrad Dybcio             2022-07-14   737  			reg = <0x0 0xa6e00000 0x0 0x40000>;
2fb19263442dda Konrad Dybcio             2022-07-14   738  			no-map;
2fb19263442dda Konrad Dybcio             2022-07-14   739  		};
2fb19263442dda Konrad Dybcio             2022-07-14   740  
285f97bc4b017b Vinod Koul                2021-12-15   741  		global_sync_mem: memory@a6f00000 {
285f97bc4b017b Vinod Koul                2021-12-15   742  			reg = <0x0 0xa6f00000 0x0 0x100000>;
285f97bc4b017b Vinod Koul                2021-12-15   743  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   744  		};
285f97bc4b017b Vinod Koul                2021-12-15   745  
285f97bc4b017b Vinod Koul                2021-12-15   746  		/* uefi region can be reused by APPS */
285f97bc4b017b Vinod Koul                2021-12-15   747  
285f97bc4b017b Vinod Koul                2021-12-15   748  		/* Linux kernel image is loaded at 0xa0000000 */
285f97bc4b017b Vinod Koul                2021-12-15   749  
285f97bc4b017b Vinod Koul                2021-12-15   750  		oem_vm_mem: memory@bb000000 {
285f97bc4b017b Vinod Koul                2021-12-15   751  			reg = <0x0 0xbb000000 0x0 0x5000000>;
285f97bc4b017b Vinod Koul                2021-12-15   752  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   753  		};
285f97bc4b017b Vinod Koul                2021-12-15   754  
285f97bc4b017b Vinod Koul                2021-12-15   755  		mte_mem: memory@c0000000 {
285f97bc4b017b Vinod Koul                2021-12-15   756  			reg = <0x0 0xc0000000 0x0 0x20000000>;
285f97bc4b017b Vinod Koul                2021-12-15   757  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   758  		};
285f97bc4b017b Vinod Koul                2021-12-15   759  
285f97bc4b017b Vinod Koul                2021-12-15   760  		qheebsp_reserved_mem: memory@e0000000 {
285f97bc4b017b Vinod Koul                2021-12-15   761  			reg = <0x0 0xe0000000 0x0 0x600000>;
285f97bc4b017b Vinod Koul                2021-12-15   762  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   763  		};
285f97bc4b017b Vinod Koul                2021-12-15   764  
285f97bc4b017b Vinod Koul                2021-12-15   765  		cpusys_vm_mem: memory@e0600000 {
285f97bc4b017b Vinod Koul                2021-12-15   766  			reg = <0x0 0xe0600000 0x0 0x400000>;
285f97bc4b017b Vinod Koul                2021-12-15   767  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   768  		};
285f97bc4b017b Vinod Koul                2021-12-15   769  
285f97bc4b017b Vinod Koul                2021-12-15   770  		hyp_reserved_mem: memory@e0a00000 {
285f97bc4b017b Vinod Koul                2021-12-15   771  			reg = <0x0 0xe0a00000 0x0 0x100000>;
285f97bc4b017b Vinod Koul                2021-12-15   772  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   773  		};
285f97bc4b017b Vinod Koul                2021-12-15   774  
285f97bc4b017b Vinod Koul                2021-12-15   775  		trust_ui_vm_mem: memory@e0b00000 {
285f97bc4b017b Vinod Koul                2021-12-15   776  			reg = <0x0 0xe0b00000 0x0 0x4af3000>;
285f97bc4b017b Vinod Koul                2021-12-15   777  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   778  		};
285f97bc4b017b Vinod Koul                2021-12-15   779  
285f97bc4b017b Vinod Koul                2021-12-15   780  		trust_ui_vm_qrtr: memory@e55f3000 {
285f97bc4b017b Vinod Koul                2021-12-15   781  			reg = <0x0 0xe55f3000 0x0 0x9000>;
285f97bc4b017b Vinod Koul                2021-12-15   782  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   783  		};
285f97bc4b017b Vinod Koul                2021-12-15   784  
285f97bc4b017b Vinod Koul                2021-12-15   785  		trust_ui_vm_vblk0_ring: memory@e55fc000 {
285f97bc4b017b Vinod Koul                2021-12-15   786  			reg = <0x0 0xe55fc000 0x0 0x4000>;
285f97bc4b017b Vinod Koul                2021-12-15   787  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   788  		};
285f97bc4b017b Vinod Koul                2021-12-15   789  
285f97bc4b017b Vinod Koul                2021-12-15   790  		trust_ui_vm_swiotlb: memory@e5600000 {
285f97bc4b017b Vinod Koul                2021-12-15   791  			reg = <0x0 0xe5600000 0x0 0x100000>;
285f97bc4b017b Vinod Koul                2021-12-15   792  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   793  		};
285f97bc4b017b Vinod Koul                2021-12-15   794  
285f97bc4b017b Vinod Koul                2021-12-15   795  		tz_stat_mem: memory@e8800000 {
285f97bc4b017b Vinod Koul                2021-12-15   796  			reg = <0x0 0xe8800000 0x0 0x100000>;
285f97bc4b017b Vinod Koul                2021-12-15   797  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   798  		};
285f97bc4b017b Vinod Koul                2021-12-15   799  
285f97bc4b017b Vinod Koul                2021-12-15   800  		tags_mem: memory@e8900000 {
285f97bc4b017b Vinod Koul                2021-12-15   801  			reg = <0x0 0xe8900000 0x0 0x1200000>;
285f97bc4b017b Vinod Koul                2021-12-15   802  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   803  		};
285f97bc4b017b Vinod Koul                2021-12-15   804  
285f97bc4b017b Vinod Koul                2021-12-15   805  		qtee_mem: memory@e9b00000 {
285f97bc4b017b Vinod Koul                2021-12-15   806  			reg = <0x0 0xe9b00000 0x0 0x500000>;
285f97bc4b017b Vinod Koul                2021-12-15   807  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   808  		};
285f97bc4b017b Vinod Koul                2021-12-15   809  
285f97bc4b017b Vinod Koul                2021-12-15   810  		trusted_apps_mem: memory@ea000000 {
285f97bc4b017b Vinod Koul                2021-12-15   811  			reg = <0x0 0xea000000 0x0 0x3900000>;
285f97bc4b017b Vinod Koul                2021-12-15   812  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   813  		};
285f97bc4b017b Vinod Koul                2021-12-15   814  
285f97bc4b017b Vinod Koul                2021-12-15   815  		trusted_apps_ext_mem: memory@ed900000 {
285f97bc4b017b Vinod Koul                2021-12-15   816  			reg = <0x0 0xed900000 0x0 0x3b00000>;
285f97bc4b017b Vinod Koul                2021-12-15   817  			no-map;
285f97bc4b017b Vinod Koul                2021-12-15   818  		};
285f97bc4b017b Vinod Koul                2021-12-15   819  	};
285f97bc4b017b Vinod Koul                2021-12-15   820  
1172729576fbbe Bjorn Andersson           2022-01-27   821  	smp2p-adsp {
1172729576fbbe Bjorn Andersson           2022-01-27   822  		compatible = "qcom,smp2p";
1172729576fbbe Bjorn Andersson           2022-01-27   823  		qcom,smem = <443>, <429>;
1172729576fbbe Bjorn Andersson           2022-01-27   824  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
1172729576fbbe Bjorn Andersson           2022-01-27   825  					     IPCC_MPROC_SIGNAL_SMP2P
1172729576fbbe Bjorn Andersson           2022-01-27   826  					     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27   827  		mboxes = <&ipcc IPCC_CLIENT_LPASS
1172729576fbbe Bjorn Andersson           2022-01-27   828  				IPCC_MPROC_SIGNAL_SMP2P>;
1172729576fbbe Bjorn Andersson           2022-01-27   829  
1172729576fbbe Bjorn Andersson           2022-01-27   830  		qcom,local-pid = <0>;
1172729576fbbe Bjorn Andersson           2022-01-27   831  		qcom,remote-pid = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27   832  
1172729576fbbe Bjorn Andersson           2022-01-27   833  		smp2p_adsp_out: master-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   834  			qcom,entry-name = "master-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   835  			#qcom,smem-state-cells = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27   836  		};
1172729576fbbe Bjorn Andersson           2022-01-27   837  
1172729576fbbe Bjorn Andersson           2022-01-27   838  		smp2p_adsp_in: slave-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   839  			qcom,entry-name = "slave-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   840  			interrupt-controller;
1172729576fbbe Bjorn Andersson           2022-01-27   841  			#interrupt-cells = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27   842  		};
1172729576fbbe Bjorn Andersson           2022-01-27   843  	};
1172729576fbbe Bjorn Andersson           2022-01-27   844  
1172729576fbbe Bjorn Andersson           2022-01-27   845  	smp2p-cdsp {
1172729576fbbe Bjorn Andersson           2022-01-27   846  		compatible = "qcom,smp2p";
1172729576fbbe Bjorn Andersson           2022-01-27   847  		qcom,smem = <94>, <432>;
1172729576fbbe Bjorn Andersson           2022-01-27   848  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
1172729576fbbe Bjorn Andersson           2022-01-27   849  					     IPCC_MPROC_SIGNAL_SMP2P
1172729576fbbe Bjorn Andersson           2022-01-27   850  					     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27   851  		mboxes = <&ipcc IPCC_CLIENT_CDSP
1172729576fbbe Bjorn Andersson           2022-01-27   852  				IPCC_MPROC_SIGNAL_SMP2P>;
1172729576fbbe Bjorn Andersson           2022-01-27   853  
1172729576fbbe Bjorn Andersson           2022-01-27   854  		qcom,local-pid = <0>;
1172729576fbbe Bjorn Andersson           2022-01-27   855  		qcom,remote-pid = <5>;
1172729576fbbe Bjorn Andersson           2022-01-27   856  
1172729576fbbe Bjorn Andersson           2022-01-27   857  		smp2p_cdsp_out: master-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   858  			qcom,entry-name = "master-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   859  			#qcom,smem-state-cells = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27   860  		};
1172729576fbbe Bjorn Andersson           2022-01-27   861  
1172729576fbbe Bjorn Andersson           2022-01-27   862  		smp2p_cdsp_in: slave-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   863  			qcom,entry-name = "slave-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   864  			interrupt-controller;
1172729576fbbe Bjorn Andersson           2022-01-27   865  			#interrupt-cells = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27   866  		};
1172729576fbbe Bjorn Andersson           2022-01-27   867  	};
1172729576fbbe Bjorn Andersson           2022-01-27   868  
1172729576fbbe Bjorn Andersson           2022-01-27   869  	smp2p-modem {
1172729576fbbe Bjorn Andersson           2022-01-27   870  		compatible = "qcom,smp2p";
1172729576fbbe Bjorn Andersson           2022-01-27   871  		qcom,smem = <435>, <428>;
1172729576fbbe Bjorn Andersson           2022-01-27   872  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
1172729576fbbe Bjorn Andersson           2022-01-27   873  					     IPCC_MPROC_SIGNAL_SMP2P
1172729576fbbe Bjorn Andersson           2022-01-27   874  					     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27   875  		mboxes = <&ipcc IPCC_CLIENT_MPSS
1172729576fbbe Bjorn Andersson           2022-01-27   876  				IPCC_MPROC_SIGNAL_SMP2P>;
1172729576fbbe Bjorn Andersson           2022-01-27   877  
1172729576fbbe Bjorn Andersson           2022-01-27   878  		qcom,local-pid = <0>;
1172729576fbbe Bjorn Andersson           2022-01-27   879  		qcom,remote-pid = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27   880  
1172729576fbbe Bjorn Andersson           2022-01-27   881  		smp2p_modem_out: master-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   882  			qcom,entry-name = "master-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   883  			#qcom,smem-state-cells = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27   884  		};
1172729576fbbe Bjorn Andersson           2022-01-27   885  
1172729576fbbe Bjorn Andersson           2022-01-27   886  		smp2p_modem_in: slave-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   887  			qcom,entry-name = "slave-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   888  			interrupt-controller;
1172729576fbbe Bjorn Andersson           2022-01-27   889  			#interrupt-cells = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27   890  		};
1172729576fbbe Bjorn Andersson           2022-01-27   891  
1172729576fbbe Bjorn Andersson           2022-01-27   892  		ipa_smp2p_out: ipa-ap-to-modem {
1172729576fbbe Bjorn Andersson           2022-01-27   893  			qcom,entry-name = "ipa";
1172729576fbbe Bjorn Andersson           2022-01-27   894  			#qcom,smem-state-cells = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27   895  		};
1172729576fbbe Bjorn Andersson           2022-01-27   896  
1172729576fbbe Bjorn Andersson           2022-01-27   897  		ipa_smp2p_in: ipa-modem-to-ap {
1172729576fbbe Bjorn Andersson           2022-01-27   898  			qcom,entry-name = "ipa";
1172729576fbbe Bjorn Andersson           2022-01-27   899  			interrupt-controller;
1172729576fbbe Bjorn Andersson           2022-01-27   900  			#interrupt-cells = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27   901  		};
1172729576fbbe Bjorn Andersson           2022-01-27   902  	};
1172729576fbbe Bjorn Andersson           2022-01-27   903  
1172729576fbbe Bjorn Andersson           2022-01-27   904  	smp2p-slpi {
1172729576fbbe Bjorn Andersson           2022-01-27   905  		compatible = "qcom,smp2p";
1172729576fbbe Bjorn Andersson           2022-01-27   906  		qcom,smem = <481>, <430>;
1172729576fbbe Bjorn Andersson           2022-01-27   907  		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
1172729576fbbe Bjorn Andersson           2022-01-27   908  					     IPCC_MPROC_SIGNAL_SMP2P
1172729576fbbe Bjorn Andersson           2022-01-27   909  					     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27   910  		mboxes = <&ipcc IPCC_CLIENT_SLPI
1172729576fbbe Bjorn Andersson           2022-01-27   911  				IPCC_MPROC_SIGNAL_SMP2P>;
1172729576fbbe Bjorn Andersson           2022-01-27   912  
1172729576fbbe Bjorn Andersson           2022-01-27   913  		qcom,local-pid = <0>;
1172729576fbbe Bjorn Andersson           2022-01-27   914  		qcom,remote-pid = <3>;
1172729576fbbe Bjorn Andersson           2022-01-27   915  
1172729576fbbe Bjorn Andersson           2022-01-27   916  		smp2p_slpi_out: master-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   917  			qcom,entry-name = "master-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   918  			#qcom,smem-state-cells = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27   919  		};
1172729576fbbe Bjorn Andersson           2022-01-27   920  
1172729576fbbe Bjorn Andersson           2022-01-27   921  		smp2p_slpi_in: slave-kernel {
1172729576fbbe Bjorn Andersson           2022-01-27   922  			qcom,entry-name = "slave-kernel";
1172729576fbbe Bjorn Andersson           2022-01-27   923  			interrupt-controller;
1172729576fbbe Bjorn Andersson           2022-01-27   924  			#interrupt-cells = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27   925  		};
1172729576fbbe Bjorn Andersson           2022-01-27   926  	};
1172729576fbbe Bjorn Andersson           2022-01-27   927  
5188049c9b36d7 Vinod Koul                2021-12-15   928  	soc: soc@0 {
5188049c9b36d7 Vinod Koul                2021-12-15   929  		#address-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15   930  		#size-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15   931  		ranges = <0 0 0 0 0x10 0>;
5188049c9b36d7 Vinod Koul                2021-12-15   932  		dma-ranges = <0 0 0 0 0x10 0>;
5188049c9b36d7 Vinod Koul                2021-12-15   933  		compatible = "simple-bus";
5188049c9b36d7 Vinod Koul                2021-12-15   934  
5188049c9b36d7 Vinod Koul                2021-12-15   935  		gcc: clock-controller@100000 {
5188049c9b36d7 Vinod Koul                2021-12-15   936  			compatible = "qcom,gcc-sm8450";
5188049c9b36d7 Vinod Koul                2021-12-15   937  			reg = <0x0 0x00100000 0x0 0x1f4200>;
5188049c9b36d7 Vinod Koul                2021-12-15   938  			#clock-cells = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15   939  			#reset-cells = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15   940  			#power-domain-cells = <1>;
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01   941  			clocks = <&rpmhcc RPMH_CXO_CLK>,
539a9923683c79 Krzysztof Kozlowski       2022-12-24   942  				 <&sleep_clk>,
a912733ccb57c4 Dmitry Baryshkov          2023-08-20   943  				 <&pcie0_phy>,
e7686284066073 Neil Armstrong            2024-05-02   944  				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
e7686284066073 Neil Armstrong            2024-05-02   945  				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
75390b69d5df49 Dmitry Baryshkov          2023-12-05   946  				 <&ufs_mem_phy 0>,
75390b69d5df49 Dmitry Baryshkov          2023-12-05   947  				 <&ufs_mem_phy 1>,
75390b69d5df49 Dmitry Baryshkov          2023-12-05   948  				 <&ufs_mem_phy 2>,
d3054cec1e9ea4 Neil Armstrong            2023-03-17   949  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01   950  			clock-names = "bi_tcxo",
539a9923683c79 Krzysztof Kozlowski       2022-12-24   951  				      "sleep_clk",
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01   952  				      "pcie_0_pipe_clk",
86543bc6eec499 Dmitry Baryshkov          2022-11-23   953  				      "pcie_1_pipe_clk",
86543bc6eec499 Dmitry Baryshkov          2022-11-23   954  				      "pcie_1_phy_aux_clk",
86543bc6eec499 Dmitry Baryshkov          2022-11-23   955  				      "ufs_phy_rx_symbol_0_clk",
86543bc6eec499 Dmitry Baryshkov          2022-11-23   956  				      "ufs_phy_rx_symbol_1_clk",
86543bc6eec499 Dmitry Baryshkov          2022-11-23   957  				      "ufs_phy_tx_symbol_0_clk",
86543bc6eec499 Dmitry Baryshkov          2022-11-23   958  				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
5188049c9b36d7 Vinod Koul                2021-12-15   959  		};
5188049c9b36d7 Vinod Koul                2021-12-15   960  
b9c84330830973 Vinod Koul                2022-04-14   961  		gpi_dma2: dma-controller@800000 {
19e67894500a8a Krzysztof Kozlowski       2022-10-18   962  			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
b9c84330830973 Vinod Koul                2022-04-14   963  			#dma-cells = <3>;
a58cde4d66e18a Konrad Dybcio             2023-01-02   964  			reg = <0 0x00800000 0 0x60000>;
b9c84330830973 Vinod Koul                2022-04-14   965  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   966  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   967  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   968  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   969  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   970  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   971  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   972  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   973  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   974  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   975  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14   976  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
b9c84330830973 Vinod Koul                2022-04-14   977  			dma-channels = <12>;
b9c84330830973 Vinod Koul                2022-04-14   978  			dma-channel-mask = <0x7e>;
b9c84330830973 Vinod Koul                2022-04-14   979  			iommus = <&apps_smmu 0x496 0x0>;
b9c84330830973 Vinod Koul                2022-04-14   980  			status = "disabled";
b9c84330830973 Vinod Koul                2022-04-14   981  		};
b9c84330830973 Vinod Koul                2022-04-14   982  
ba640cd31342b4 Vinod Koul                2022-04-14   983  		qupv3_id_2: geniqup@8c0000 {
ba640cd31342b4 Vinod Koul                2022-04-14   984  			compatible = "qcom,geni-se-qup";
ba640cd31342b4 Vinod Koul                2022-04-14   985  			reg = <0x0 0x008c0000 0x0 0x2000>;
ba640cd31342b4 Vinod Koul                2022-04-14   986  			clock-names = "m-ahb", "s-ahb";
ba640cd31342b4 Vinod Koul                2022-04-14   987  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
ba640cd31342b4 Vinod Koul                2022-04-14   988  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14   989  			iommus = <&apps_smmu 0x483 0x0>;
ba640cd31342b4 Vinod Koul                2022-04-14   990  			#address-cells = <2>;
ba640cd31342b4 Vinod Koul                2022-04-14   991  			#size-cells = <2>;
ba640cd31342b4 Vinod Koul                2022-04-14   992  			ranges;
ba640cd31342b4 Vinod Koul                2022-04-14   993  			status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14   994  
ba640cd31342b4 Vinod Koul                2022-04-14   995  			i2c15: i2c@880000 {
ba640cd31342b4 Vinod Koul                2022-04-14   996  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14   997  				reg = <0x0 0x00880000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14   998  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14   999  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1000  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1001  				pinctrl-0 = <&qup_i2c15_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1002  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1003  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1004  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1005  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1006  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1007  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1008  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1009  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1010  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1011  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1012  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1013  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1014  
ba640cd31342b4 Vinod Koul                2022-04-14  1015  			spi15: spi@880000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1016  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1017  				reg = <0x0 0x00880000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1018  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1019  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1020  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1021  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1022  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1023  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1024  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1025  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1026  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
ba640cd31342b4 Vinod Koul                2022-04-14  1027  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
ba640cd31342b4 Vinod Koul                2022-04-14  1028  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1029  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1030  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1031  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1032  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1033  
ba640cd31342b4 Vinod Koul                2022-04-14  1034  			i2c16: i2c@884000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1035  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14  1036  				reg = <0x0 0x00884000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1037  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1038  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1039  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1040  				pinctrl-0 = <&qup_i2c16_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1041  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1042  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1043  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1044  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1045  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1046  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1047  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1048  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1049  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1050  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1051  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1052  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1053  
ba640cd31342b4 Vinod Koul                2022-04-14  1054  			spi16: spi@884000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1055  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1056  				reg = <0x0 0x00884000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1057  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1058  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1059  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1060  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1061  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1062  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1063  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1064  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1065  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
ba640cd31342b4 Vinod Koul                2022-04-14  1066  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
ba640cd31342b4 Vinod Koul                2022-04-14  1067  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1068  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1069  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1070  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1071  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1072  
ba640cd31342b4 Vinod Koul                2022-04-14  1073  			i2c17: i2c@888000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1074  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14  1075  				reg = <0x0 0x00888000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1076  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1077  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1078  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1079  				pinctrl-0 = <&qup_i2c17_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1080  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1081  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1082  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1083  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1084  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1085  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1086  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1087  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1088  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1089  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1090  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1091  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1092  
ba640cd31342b4 Vinod Koul                2022-04-14  1093  			spi17: spi@888000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1094  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1095  				reg = <0x0 0x00888000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1096  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1097  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1098  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1099  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1100  				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1101  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1102  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1103  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1104  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
ba640cd31342b4 Vinod Koul                2022-04-14  1105  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
ba640cd31342b4 Vinod Koul                2022-04-14  1106  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1107  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1108  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1109  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1110  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1111  
ba640cd31342b4 Vinod Koul                2022-04-14  1112  			i2c18: i2c@88c000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1113  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14  1114  				reg = <0x0 0x0088c000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1115  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1116  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1117  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1118  				pinctrl-0 = <&qup_i2c18_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1119  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1120  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1121  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1122  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1123  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1124  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1125  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1126  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1127  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1128  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1129  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1130  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1131  
ba640cd31342b4 Vinod Koul                2022-04-14  1132  			spi18: spi@88c000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1133  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1134  				reg = <0 0x0088c000 0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1135  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1136  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1137  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1138  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1139  				pinctrl-0 = <&qup_spi18_data_clk>, <&qup_spi18_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1140  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1141  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1142  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1143  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1144  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1145  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1146  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1147  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1148  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1149  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1150  
ba640cd31342b4 Vinod Koul                2022-04-14  1151  			i2c19: i2c@890000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1152  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14  1153  				reg = <0x0 0x00890000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1154  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1155  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1156  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1157  				pinctrl-0 = <&qup_i2c19_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1158  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1159  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1160  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1161  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1162  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1163  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1164  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1165  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1166  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1167  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1168  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1169  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1170  
ba640cd31342b4 Vinod Koul                2022-04-14  1171  			spi19: spi@890000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1172  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1173  				reg = <0 0x00890000 0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1174  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1175  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1176  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1177  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1178  				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1179  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1180  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1181  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1182  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1183  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1184  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1185  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1186  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1187  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1188  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1189  
ba640cd31342b4 Vinod Koul                2022-04-14  1190  			i2c20: i2c@894000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1191  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14  1192  				reg = <0x0 0x00894000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1193  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1194  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1195  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1196  				pinctrl-0 = <&qup_i2c20_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1197  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1198  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1199  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1200  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1201  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1202  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1203  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1204  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1205  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1206  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1207  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1208  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1209  
f5837418479a3f Dmitry Baryshkov          2022-05-02  1210  			uart20: serial@894000 {
f5837418479a3f Dmitry Baryshkov          2022-05-02  1211  				compatible = "qcom,geni-uart";
f5837418479a3f Dmitry Baryshkov          2022-05-02  1212  				reg = <0 0x00894000 0 0x4000>;
f5837418479a3f Dmitry Baryshkov          2022-05-02  1213  				clock-names = "se";
f5837418479a3f Dmitry Baryshkov          2022-05-02  1214  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
f5837418479a3f Dmitry Baryshkov          2022-05-02  1215  				pinctrl-names = "default";
f5837418479a3f Dmitry Baryshkov          2022-05-02  1216  				pinctrl-0 = <&qup_uart20_default>;
f5837418479a3f Dmitry Baryshkov          2022-05-02  1217  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1218  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1219  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1220  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1221  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1222  				interconnect-names = "qup-core",
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1223  						     "qup-config";
f5837418479a3f Dmitry Baryshkov          2022-05-02  1224  				status = "disabled";
f5837418479a3f Dmitry Baryshkov          2022-05-02  1225  			};
f5837418479a3f Dmitry Baryshkov          2022-05-02  1226  
ba640cd31342b4 Vinod Koul                2022-04-14  1227  			spi20: spi@894000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1228  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1229  				reg = <0 0x00894000 0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1230  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1231  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1232  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1233  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1234  				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1235  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1236  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1237  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1238  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
ba640cd31342b4 Vinod Koul                2022-04-14  1239  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
ba640cd31342b4 Vinod Koul                2022-04-14  1240  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1241  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1242  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1243  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1244  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1245  
ba640cd31342b4 Vinod Koul                2022-04-14  1246  			i2c21: i2c@898000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1247  				compatible = "qcom,geni-i2c";
ba640cd31342b4 Vinod Koul                2022-04-14  1248  				reg = <0x0 0x00898000 0x0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1249  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1250  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1251  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1252  				pinctrl-0 = <&qup_i2c21_data_clk>;
ba640cd31342b4 Vinod Koul                2022-04-14  1253  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1254  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1255  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1256  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1257  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1258  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1259  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ba640cd31342b4 Vinod Koul                2022-04-14  1260  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
ba640cd31342b4 Vinod Koul                2022-04-14  1261  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
ba640cd31342b4 Vinod Koul                2022-04-14  1262  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1263  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1264  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1265  
ba640cd31342b4 Vinod Koul                2022-04-14  1266  			spi21: spi@898000 {
ba640cd31342b4 Vinod Koul                2022-04-14  1267  				compatible = "qcom,geni-spi";
ba640cd31342b4 Vinod Koul                2022-04-14  1268  				reg = <0 0x00898000 0 0x4000>;
ba640cd31342b4 Vinod Koul                2022-04-14  1269  				clock-names = "se";
ba640cd31342b4 Vinod Koul                2022-04-14  1270  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
ba640cd31342b4 Vinod Koul                2022-04-14  1271  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
ba640cd31342b4 Vinod Koul                2022-04-14  1272  				pinctrl-names = "default";
ba640cd31342b4 Vinod Koul                2022-04-14  1273  				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
ba640cd31342b4 Vinod Koul                2022-04-14  1274  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ba640cd31342b4 Vinod Koul                2022-04-14  1275  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1276  				interconnect-names = "qup-core", "qup-config";
ba640cd31342b4 Vinod Koul                2022-04-14  1277  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
ba640cd31342b4 Vinod Koul                2022-04-14  1278  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
ba640cd31342b4 Vinod Koul                2022-04-14  1279  				dma-names = "tx", "rx";
ba640cd31342b4 Vinod Koul                2022-04-14  1280  				#address-cells = <1>;
ba640cd31342b4 Vinod Koul                2022-04-14  1281  				#size-cells = <0>;
ba640cd31342b4 Vinod Koul                2022-04-14  1282  				status = "disabled";
ba640cd31342b4 Vinod Koul                2022-04-14  1283  			};
ba640cd31342b4 Vinod Koul                2022-04-14  1284  		};
ba640cd31342b4 Vinod Koul                2022-04-14  1285  
b9c84330830973 Vinod Koul                2022-04-14  1286  		gpi_dma0: dma-controller@900000 {
19e67894500a8a Krzysztof Kozlowski       2022-10-18  1287  			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
b9c84330830973 Vinod Koul                2022-04-14  1288  			#dma-cells = <3>;
a58cde4d66e18a Konrad Dybcio             2023-01-02  1289  			reg = <0 0x00900000 0 0x60000>;
b9c84330830973 Vinod Koul                2022-04-14  1290  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1291  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1292  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1293  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1294  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1295  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1296  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1297  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1298  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1299  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1300  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1301  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
b9c84330830973 Vinod Koul                2022-04-14  1302  			dma-channels = <12>;
b9c84330830973 Vinod Koul                2022-04-14  1303  			dma-channel-mask = <0x7e>;
b9c84330830973 Vinod Koul                2022-04-14  1304  			iommus = <&apps_smmu 0x5b6 0x0>;
b9c84330830973 Vinod Koul                2022-04-14  1305  			status = "disabled";
b9c84330830973 Vinod Koul                2022-04-14  1306  		};
b9c84330830973 Vinod Koul                2022-04-14  1307  
5188049c9b36d7 Vinod Koul                2021-12-15  1308  		qupv3_id_0: geniqup@9c0000 {
5188049c9b36d7 Vinod Koul                2021-12-15  1309  			compatible = "qcom,geni-se-qup";
5188049c9b36d7 Vinod Koul                2021-12-15  1310  			reg = <0x0 0x009c0000 0x0 0x2000>;
5188049c9b36d7 Vinod Koul                2021-12-15  1311  			clock-names = "m-ahb", "s-ahb";
5188049c9b36d7 Vinod Koul                2021-12-15  1312  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
5188049c9b36d7 Vinod Koul                2021-12-15  1313  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
488922c1a37257 Vinod Koul                2022-04-14  1314  			iommus = <&apps_smmu 0x5a3 0x0>;
488922c1a37257 Vinod Koul                2022-04-14  1315  			interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>;
488922c1a37257 Vinod Koul                2022-04-14  1316  			interconnect-names = "qup-core";
5188049c9b36d7 Vinod Koul                2021-12-15  1317  			#address-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15  1318  			#size-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15  1319  			ranges;
5188049c9b36d7 Vinod Koul                2021-12-15  1320  			status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  1321  
a84e88e9a00334 Vinod Koul                2022-04-14  1322  			i2c0: i2c@980000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1323  				compatible = "qcom,geni-i2c";
a84e88e9a00334 Vinod Koul                2022-04-14  1324  				reg = <0x0 0x00980000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1325  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1326  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1327  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1328  				pinctrl-0 = <&qup_i2c0_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1329  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1330  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1331  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1332  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1333  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1334  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1335  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1336  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1337  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1338  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1339  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1340  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1341  
a84e88e9a00334 Vinod Koul                2022-04-14  1342  			spi0: spi@980000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1343  				compatible = "qcom,geni-spi";
a84e88e9a00334 Vinod Koul                2022-04-14  1344  				reg = <0x0 0x00980000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1345  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1346  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1347  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1348  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1349  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  1350  				power-domains = <&rpmhpd RPMHPD_CX>;
a84e88e9a00334 Vinod Koul                2022-04-14  1351  				operating-points-v2 = <&qup_opp_table_100mhz>;
a84e88e9a00334 Vinod Koul                2022-04-14  1352  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1353  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1354  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1355  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1356  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1357  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1358  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1359  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1360  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1361  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1362  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1363  
a84e88e9a00334 Vinod Koul                2022-04-14  1364  			i2c1: i2c@984000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1365  				compatible = "qcom,geni-i2c";
a84e88e9a00334 Vinod Koul                2022-04-14  1366  				reg = <0x0 0x00984000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1367  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1368  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1369  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1370  				pinctrl-0 = <&qup_i2c1_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1371  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1372  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1373  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1374  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1375  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1376  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1377  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1378  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1379  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1380  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1381  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1382  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1383  
a84e88e9a00334 Vinod Koul                2022-04-14  1384  			spi1: spi@984000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1385  				compatible = "qcom,geni-spi";
a84e88e9a00334 Vinod Koul                2022-04-14  1386  				reg = <0x0 0x00984000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1387  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1388  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1389  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1390  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1391  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
a84e88e9a00334 Vinod Koul                2022-04-14  1392  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1393  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1394  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1395  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1396  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1397  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1398  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1399  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1400  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1401  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1402  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1403  
a84e88e9a00334 Vinod Koul                2022-04-14  1404  			i2c2: i2c@988000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1405  				compatible = "qcom,geni-i2c";
a84e88e9a00334 Vinod Koul                2022-04-14  1406  				reg = <0x0 0x00988000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1407  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1408  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1409  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1410  				pinctrl-0 = <&qup_i2c2_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1411  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1412  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1413  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1414  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1415  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1416  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1417  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1418  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1419  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1420  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1421  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1422  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1423  
a84e88e9a00334 Vinod Koul                2022-04-14  1424  			spi2: spi@988000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1425  				compatible = "qcom,geni-spi";
a84e88e9a00334 Vinod Koul                2022-04-14  1426  				reg = <0x0 0x00988000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1427  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1428  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1429  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1430  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1431  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
a84e88e9a00334 Vinod Koul                2022-04-14  1432  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1433  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1434  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1435  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1436  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1437  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1438  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1439  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1440  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1441  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1442  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1443  
a84e88e9a00334 Vinod Koul                2022-04-14  1444  
a84e88e9a00334 Vinod Koul                2022-04-14  1445  			i2c3: i2c@98c000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1446  				compatible = "qcom,geni-i2c";
a84e88e9a00334 Vinod Koul                2022-04-14  1447  				reg = <0x0 0x0098c000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1448  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1449  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1450  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1451  				pinctrl-0 = <&qup_i2c3_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1452  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1453  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1454  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1455  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1456  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1457  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1458  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1459  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1460  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1461  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1462  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1463  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1464  
a84e88e9a00334 Vinod Koul                2022-04-14  1465  			spi3: spi@98c000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1466  				compatible = "qcom,geni-spi";
a84e88e9a00334 Vinod Koul                2022-04-14  1467  				reg = <0x0 0x0098c000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1468  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1469  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1470  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1471  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1472  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
a84e88e9a00334 Vinod Koul                2022-04-14  1473  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1474  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1475  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1476  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1477  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1478  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1479  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1480  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1481  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1482  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1483  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1484  
a84e88e9a00334 Vinod Koul                2022-04-14  1485  			i2c4: i2c@990000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1486  				compatible = "qcom,geni-i2c";
a84e88e9a00334 Vinod Koul                2022-04-14  1487  				reg = <0x0 0x00990000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1488  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1489  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1490  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1491  				pinctrl-0 = <&qup_i2c4_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1492  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1493  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1494  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1495  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1496  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1497  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1498  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1499  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1500  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1501  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1502  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1503  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1504  
a84e88e9a00334 Vinod Koul                2022-04-14  1505  			spi4: spi@990000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1506  				compatible = "qcom,geni-spi";
a84e88e9a00334 Vinod Koul                2022-04-14  1507  				reg = <0x0 0x00990000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1508  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1509  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1510  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1511  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1512  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  1513  				power-domains = <&rpmhpd RPMHPD_CX>;
a84e88e9a00334 Vinod Koul                2022-04-14  1514  				operating-points-v2 = <&qup_opp_table_100mhz>;
a84e88e9a00334 Vinod Koul                2022-04-14  1515  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1516  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1517  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1518  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1519  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1520  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1521  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1522  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1523  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1524  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1525  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1526  
a84e88e9a00334 Vinod Koul                2022-04-14  1527  			i2c5: i2c@994000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1528  				compatible = "qcom,geni-i2c";
a84e88e9a00334 Vinod Koul                2022-04-14  1529  				reg = <0x0 0x00994000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1530  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1531  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1532  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1533  				pinctrl-0 = <&qup_i2c5_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1534  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1535  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1536  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1537  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1538  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1539  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1540  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1541  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1542  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1543  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1544  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1545  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1546  
a84e88e9a00334 Vinod Koul                2022-04-14  1547  			spi5: spi@994000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1548  				compatible = "qcom,geni-spi";
a84e88e9a00334 Vinod Koul                2022-04-14  1549  				reg = <0x0 0x00994000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1550  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1551  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1552  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1553  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1554  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
a84e88e9a00334 Vinod Koul                2022-04-14  1555  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1556  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1557  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1558  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1559  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1560  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1561  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1562  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1563  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1564  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1565  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1566  
a84e88e9a00334 Vinod Koul                2022-04-14  1567  
a84e88e9a00334 Vinod Koul                2022-04-14  1568  			i2c6: i2c@998000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1569  				compatible = "qcom,geni-i2c";
a58cde4d66e18a Konrad Dybcio             2023-01-02  1570  				reg = <0x0 0x00998000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1571  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1572  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1573  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1574  				pinctrl-0 = <&qup_i2c6_data_clk>;
a84e88e9a00334 Vinod Koul                2022-04-14  1575  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1576  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1577  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1578  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1579  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1580  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1581  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1582  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
a84e88e9a00334 Vinod Koul                2022-04-14  1583  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
a84e88e9a00334 Vinod Koul                2022-04-14  1584  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1585  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1586  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1587  
a84e88e9a00334 Vinod Koul                2022-04-14  1588  			spi6: spi@998000 {
a84e88e9a00334 Vinod Koul                2022-04-14  1589  				compatible = "qcom,geni-spi";
a58cde4d66e18a Konrad Dybcio             2023-01-02  1590  				reg = <0x0 0x00998000 0x0 0x4000>;
a84e88e9a00334 Vinod Koul                2022-04-14  1591  				clock-names = "se";
a84e88e9a00334 Vinod Koul                2022-04-14  1592  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
a84e88e9a00334 Vinod Koul                2022-04-14  1593  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
a84e88e9a00334 Vinod Koul                2022-04-14  1594  				pinctrl-names = "default";
a84e88e9a00334 Vinod Koul                2022-04-14  1595  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
a84e88e9a00334 Vinod Koul                2022-04-14  1596  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1597  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
a84e88e9a00334 Vinod Koul                2022-04-14  1598  						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1599  				interconnect-names = "qup-core", "qup-config", "qup-memory";
a84e88e9a00334 Vinod Koul                2022-04-14  1600  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
a84e88e9a00334 Vinod Koul                2022-04-14  1601  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
a84e88e9a00334 Vinod Koul                2022-04-14  1602  				dma-names = "tx", "rx";
a84e88e9a00334 Vinod Koul                2022-04-14  1603  				#address-cells = <1>;
a84e88e9a00334 Vinod Koul                2022-04-14  1604  				#size-cells = <0>;
a84e88e9a00334 Vinod Koul                2022-04-14  1605  				status = "disabled";
a84e88e9a00334 Vinod Koul                2022-04-14  1606  			};
a84e88e9a00334 Vinod Koul                2022-04-14  1607  
5188049c9b36d7 Vinod Koul                2021-12-15  1608  			uart7: serial@99c000 {
5188049c9b36d7 Vinod Koul                2021-12-15  1609  				compatible = "qcom,geni-debug-uart";
5188049c9b36d7 Vinod Koul                2021-12-15  1610  				reg = <0 0x0099c000 0 0x4000>;
5188049c9b36d7 Vinod Koul                2021-12-15  1611  				clock-names = "se";
5188049c9b36d7 Vinod Koul                2021-12-15  1612  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
ec950d55728459 Vinod Koul                2021-12-15  1613  				pinctrl-names = "default";
ec950d55728459 Vinod Koul                2021-12-15  1614  				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
5188049c9b36d7 Vinod Koul                2021-12-15  1615  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1616  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1617  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1618  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1619  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1620  				interconnect-names = "qup-core",
6e115b75b43bd1 Konrad Dybcio             2024-01-16  1621  						     "qup-config";
5188049c9b36d7 Vinod Koul                2021-12-15  1622  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  1623  			};
5188049c9b36d7 Vinod Koul                2021-12-15  1624  		};
5188049c9b36d7 Vinod Koul                2021-12-15  1625  
b9c84330830973 Vinod Koul                2022-04-14  1626  		gpi_dma1: dma-controller@a00000 {
19e67894500a8a Krzysztof Kozlowski       2022-10-18  1627  			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
b9c84330830973 Vinod Koul                2022-04-14  1628  			#dma-cells = <3>;
a58cde4d66e18a Konrad Dybcio             2023-01-02  1629  			reg = <0 0x00a00000 0 0x60000>;
b9c84330830973 Vinod Koul                2022-04-14  1630  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1631  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1632  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1633  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1634  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1635  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1636  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1637  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1638  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1639  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1640  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
b9c84330830973 Vinod Koul                2022-04-14  1641  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
b9c84330830973 Vinod Koul                2022-04-14  1642  			dma-channels = <12>;
b9c84330830973 Vinod Koul                2022-04-14  1643  			dma-channel-mask = <0x7e>;
b9c84330830973 Vinod Koul                2022-04-14  1644  			iommus = <&apps_smmu 0x56 0x0>;
b9c84330830973 Vinod Koul                2022-04-14  1645  			status = "disabled";
b9c84330830973 Vinod Koul                2022-04-14  1646  		};
b9c84330830973 Vinod Koul                2022-04-14  1647  
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1648  		qupv3_id_1: geniqup@ac0000 {
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1649  			compatible = "qcom,geni-se-qup";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1650  			reg = <0x0 0x00ac0000 0x0 0x6000>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1651  			clock-names = "m-ahb", "s-ahb";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1652  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1653  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
67ebdc6dd1e204 Vinod Koul                2022-04-14  1654  			iommus = <&apps_smmu 0x43 0x0>;
67ebdc6dd1e204 Vinod Koul                2022-04-14  1655  			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
67ebdc6dd1e204 Vinod Koul                2022-04-14  1656  			interconnect-names = "qup-core";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1657  			#address-cells = <2>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1658  			#size-cells = <2>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1659  			ranges;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1660  			status = "disabled";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1661  
1a380216fd6fcf Vinod Koul                2022-04-14  1662  			i2c8: i2c@a80000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1663  				compatible = "qcom,geni-i2c";
1a380216fd6fcf Vinod Koul                2022-04-14  1664  				reg = <0x0 0x00a80000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1665  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1666  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1667  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1668  				pinctrl-0 = <&qup_i2c8_data_clk>;
1a380216fd6fcf Vinod Koul                2022-04-14  1669  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1670  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1671  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1672  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1673  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1674  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1675  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1676  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1677  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1678  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1679  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1680  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1681  
1a380216fd6fcf Vinod Koul                2022-04-14  1682  			spi8: spi@a80000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1683  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1684  				reg = <0x0 0x00a80000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1685  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1686  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1687  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1688  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1689  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1690  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1691  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1692  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1693  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1694  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1695  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1696  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1697  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1698  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1699  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1700  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1701  
1a380216fd6fcf Vinod Koul                2022-04-14  1702  			i2c9: i2c@a84000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1703  				compatible = "qcom,geni-i2c";
1a380216fd6fcf Vinod Koul                2022-04-14  1704  				reg = <0x0 0x00a84000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1705  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1706  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1707  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1708  				pinctrl-0 = <&qup_i2c9_data_clk>;
1a380216fd6fcf Vinod Koul                2022-04-14  1709  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1710  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1711  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1712  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1713  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1714  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1715  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1716  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1717  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1718  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1719  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1720  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1721  
1a380216fd6fcf Vinod Koul                2022-04-14  1722  			spi9: spi@a84000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1723  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1724  				reg = <0x0 0x00a84000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1725  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1726  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1727  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1728  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1729  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1730  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1731  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1732  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1733  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1734  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1735  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1736  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1737  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1738  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1739  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1740  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1741  
1a380216fd6fcf Vinod Koul                2022-04-14  1742  			i2c10: i2c@a88000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1743  				compatible = "qcom,geni-i2c";
1a380216fd6fcf Vinod Koul                2022-04-14  1744  				reg = <0x0 0x00a88000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1745  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1746  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1747  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1748  				pinctrl-0 = <&qup_i2c10_data_clk>;
1a380216fd6fcf Vinod Koul                2022-04-14  1749  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1750  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1751  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1752  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1753  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1754  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1755  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1756  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1757  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1758  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1759  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1760  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1761  
1a380216fd6fcf Vinod Koul                2022-04-14  1762  			spi10: spi@a88000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1763  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1764  				reg = <0x0 0x00a88000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1765  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1766  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1767  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1768  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1769  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1770  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1771  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1772  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1773  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1774  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1775  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1776  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1777  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1778  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1779  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1780  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1781  
1a380216fd6fcf Vinod Koul                2022-04-14  1782  			i2c11: i2c@a8c000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1783  				compatible = "qcom,geni-i2c";
1a380216fd6fcf Vinod Koul                2022-04-14  1784  				reg = <0x0 0x00a8c000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1785  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1786  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1787  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1788  				pinctrl-0 = <&qup_i2c11_data_clk>;
1a380216fd6fcf Vinod Koul                2022-04-14  1789  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1790  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1791  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1792  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1793  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1794  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1795  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1796  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1797  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1798  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1799  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1800  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1801  
1a380216fd6fcf Vinod Koul                2022-04-14  1802  			spi11: spi@a8c000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1803  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1804  				reg = <0x0 0x00a8c000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1805  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1806  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1807  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1808  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1809  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1810  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1811  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1812  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1813  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1814  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1815  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1816  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1817  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1818  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1819  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1820  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1821  
1a380216fd6fcf Vinod Koul                2022-04-14  1822  			i2c12: i2c@a90000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1823  				compatible = "qcom,geni-i2c";
1a380216fd6fcf Vinod Koul                2022-04-14  1824  				reg = <0x0 0x00a90000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1825  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1826  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1827  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1828  				pinctrl-0 = <&qup_i2c12_data_clk>;
1a380216fd6fcf Vinod Koul                2022-04-14  1829  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1830  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1831  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1832  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1833  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1834  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1835  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1836  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1837  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1838  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1839  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1840  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1841  
1a380216fd6fcf Vinod Koul                2022-04-14  1842  			spi12: spi@a90000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1843  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1844  				reg = <0x0 0x00a90000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1845  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1846  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1847  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1848  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1849  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1850  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1851  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1852  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1853  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1854  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1855  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1856  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1857  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1858  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1859  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1860  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1861  
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1862  			i2c13: i2c@a94000 {
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1863  				compatible = "qcom,geni-i2c";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1864  				reg = <0 0x00a94000 0 0x4000>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1865  				clock-names = "se";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1866  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1867  				pinctrl-names = "default";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1868  				pinctrl-0 = <&qup_i2c13_data_clk>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1869  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1870  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1871  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1872  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1873  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1874  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1875  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1876  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1877  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1878  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1879  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1880  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1881  
1a380216fd6fcf Vinod Koul                2022-04-14  1882  			spi13: spi@a94000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1883  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1884  				reg = <0x0 0x00a94000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1885  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1886  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1887  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1888  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1889  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1890  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1891  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1892  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1893  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1894  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1895  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1896  				dma-names = "tx", "rx";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1897  				#address-cells = <1>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1898  				#size-cells = <0>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1899  				status = "disabled";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1900  			};
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1901  
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1902  			i2c14: i2c@a98000 {
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1903  				compatible = "qcom,geni-i2c";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1904  				reg = <0 0x00a98000 0 0x4000>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1905  				clock-names = "se";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1906  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1907  				pinctrl-names = "default";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1908  				pinctrl-0 = <&qup_i2c14_data_clk>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1909  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1910  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1911  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1912  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1913  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1914  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
1a380216fd6fcf Vinod Koul                2022-04-14  1915  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
1a380216fd6fcf Vinod Koul                2022-04-14  1916  				dma-names = "tx", "rx";
1a380216fd6fcf Vinod Koul                2022-04-14  1917  				#address-cells = <1>;
1a380216fd6fcf Vinod Koul                2022-04-14  1918  				#size-cells = <0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1919  				status = "disabled";
1a380216fd6fcf Vinod Koul                2022-04-14  1920  			};
1a380216fd6fcf Vinod Koul                2022-04-14  1921  
1a380216fd6fcf Vinod Koul                2022-04-14  1922  			spi14: spi@a98000 {
1a380216fd6fcf Vinod Koul                2022-04-14  1923  				compatible = "qcom,geni-spi";
1a380216fd6fcf Vinod Koul                2022-04-14  1924  				reg = <0x0 0x00a98000 0x0 0x4000>;
1a380216fd6fcf Vinod Koul                2022-04-14  1925  				clock-names = "se";
1a380216fd6fcf Vinod Koul                2022-04-14  1926  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
1a380216fd6fcf Vinod Koul                2022-04-14  1927  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
1a380216fd6fcf Vinod Koul                2022-04-14  1928  				pinctrl-names = "default";
1a380216fd6fcf Vinod Koul                2022-04-14  1929  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
1a380216fd6fcf Vinod Koul                2022-04-14  1930  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1931  						<&system_noc MASTER_A2NOC_SNOC 0 &gem_noc SLAVE_LLCC 0>,
1a380216fd6fcf Vinod Koul                2022-04-14  1932  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
1a380216fd6fcf Vinod Koul                2022-04-14  1933  				interconnect-names = "qup-core", "qup-config", "qup-memory";
1a380216fd6fcf Vinod Koul                2022-04-14  1934  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
1a380216fd6fcf Vinod Koul                2022-04-14  1935  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
1a380216fd6fcf Vinod Koul                2022-04-14  1936  				dma-names = "tx", "rx";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1937  				#address-cells = <1>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1938  				#size-cells = <0>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  1939  				status = "disabled";
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  1940  			};
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  1941  		};
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  1942  
c2c9fa136253da Neil Armstrong            2023-10-03  1943  		rng: rng@10c3000 {
c2c9fa136253da Neil Armstrong            2023-10-03  1944  			compatible = "qcom,sm8450-trng", "qcom,trng";
c2c9fa136253da Neil Armstrong            2023-10-03  1945  			reg = <0 0x010c3000 0 0x1000>;
c2c9fa136253da Neil Armstrong            2023-10-03  1946  		};
c2c9fa136253da Neil Armstrong            2023-10-03  1947  
052c9a1f1400f1 Manivannan Sadhasivam     2023-12-06  1948  		pcie0: pcie@1c00000 {
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1949  			compatible = "qcom,pcie-sm8450-pcie0";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1950  			reg = <0 0x01c00000 0 0x3000>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1951  			      <0 0x60000000 0 0xf1d>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1952  			      <0 0x60000f20 0 0xa8>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1953  			      <0 0x60001000 0 0x1000>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1954  			      <0 0x60100000 0 0x100000>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1955  			reg-names = "parf", "dbi", "elbi", "atu", "config";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1956  			device_type = "pci";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1957  			linux,pci-domain = <0>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1958  			bus-range = <0x00 0xff>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1959  			num-lanes = <1>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1960  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1961  			#address-cells = <3>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1962  			#size-cells = <2>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1963  
f57903c8f4c779 Manivannan Sadhasivam     2023-02-28  1964  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
f57903c8f4c779 Manivannan Sadhasivam     2023-02-28  1965  				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1966  
ecc3ac293ed15a Manivannan Sadhasivam     2024-03-18  1967  			msi-map = <0x0 &gic_its 0x5980 0x1>,
ecc3ac293ed15a Manivannan Sadhasivam     2024-03-18  1968  				  <0x100 &gic_its 0x5981 0x1>;
ff384ab56f164e Manivannan Sadhasivam     2023-01-02  1969  			msi-map-mask = <0xff00>;
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1970  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1971  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1972  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1973  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1974  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1975  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1976  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  1977  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  1978  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1979  			interrupt-names = "msi0",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1980  					  "msi1",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1981  					  "msi2",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1982  					  "msi3",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1983  					  "msi4",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1984  					  "msi5",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  1985  					  "msi6",
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  1986  					  "msi7",
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  1987  					  "global";
0da2eff44e78de Manivannan Sadhasivam     2023-01-11  1988  			#interrupt-cells = <1>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1989  			interrupt-map-mask = <0 0 0 0x7>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1990  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1991  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1992  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1993  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  1994  
42870599f9441f Krishna chaitanya chundru 2024-05-18  1995  			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
42870599f9441f Krishna chaitanya chundru 2024-05-18  1996  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
42870599f9441f Krishna chaitanya chundru 2024-05-18  1997  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
42870599f9441f Krishna chaitanya chundru 2024-05-18  1998  					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
42870599f9441f Krishna chaitanya chundru 2024-05-18  1999  			interconnect-names = "pcie-mem", "cpu-pcie";
42870599f9441f Krishna chaitanya chundru 2024-05-18  2000  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2001  			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2002  				 <&gcc GCC_PCIE_0_PIPE_CLK_SRC>,
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2003  				 <&pcie0_phy>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2004  				 <&rpmhcc RPMH_CXO_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2005  				 <&gcc GCC_PCIE_0_AUX_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2006  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2007  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2008  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2009  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2010  				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2011  				 <&gcc GCC_AGGRE_NOC_PCIE_0_AXI_CLK>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2012  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2013  			clock-names = "pipe",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2014  				      "pipe_mux",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2015  				      "phy_pipe",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2016  				      "ref",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2017  				      "aux",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2018  				      "cfg",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2019  				      "bus_master",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2020  				      "bus_slave",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2021  				      "slave_q2a",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2022  				      "ddrss_sf_tbu",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2023  				      "aggre0",
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2024  				      "aggre1";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2025  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2026  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2027  				    <0x100 &apps_smmu 0x1c01 0x1>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2028  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2029  			resets = <&gcc GCC_PCIE_0_BCR>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2030  			reset-names = "pci";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2031  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2032  			power-domains = <&gcc PCIE_0_GDSC>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2033  
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2034  			phys = <&pcie0_phy>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2035  			phy-names = "pciephy";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2036  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2037  			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2038  			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2039  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2040  			pinctrl-names = "default";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2041  			pinctrl-0 = <&pcie0_default_state>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2042  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2043  			operating-points-v2 = <&pcie0_opp_table>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2044  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2045  			status = "disabled";
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2046  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2047  			pcie0_opp_table: opp-table {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2048  				compatible = "operating-points-v2";
628388982c1303 Krishna chaitanya chundru 2024-05-18  2049  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2050  				/* GEN 1 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2051  				opp-2500000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2052  					opp-hz = /bits/ 64 <2500000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2053  					required-opps = <&rpmhpd_opp_low_svs>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2054  					opp-peak-kBps = <250000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2055  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2056  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2057  				/* GEN 2 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2058  				opp-5000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2059  					opp-hz = /bits/ 64 <5000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2060  					required-opps = <&rpmhpd_opp_low_svs>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2061  					opp-peak-kBps = <500000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2062  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2063  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2064  				/* GEN 3 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2065  				opp-8000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2066  					opp-hz = /bits/ 64 <8000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2067  					required-opps = <&rpmhpd_opp_nom>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2068  					opp-peak-kBps = <984500 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2069  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2070  			};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2071  
fe79fbce6efd25 Bartosz Golaszewski       2024-10-18  2072  			pcieport0: pcie@0 {
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2073  				device_type = "pci";
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2074  				reg = <0x0 0x0 0x0 0x0 0x0>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2075  				bus-range = <0x01 0xff>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2076  
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2077  				#address-cells = <3>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2078  				#size-cells = <2>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2079  				ranges;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2080  			};
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2081  		};
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  2082  
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2083  		pcie0_phy: phy@1c06000 {
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2084  			compatible = "qcom,sm8450-qmp-gen3x1-pcie-phy";
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2085  			reg = <0 0x01c06000 0 0x2000>;
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2086  
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2087  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2088  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2089  				 <&gcc GCC_PCIE_0_CLKREF_EN>,
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2090  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2091  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2092  			clock-names = "aux",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2093  				      "cfg_ahb",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2094  				      "ref",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2095  				      "rchng",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2096  				      "pipe";
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2097  
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2098  			clock-output-names = "pcie_0_pipe_clk";
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2099  			#clock-cells = <0>;
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2100  
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2101  			#phy-cells = <0>;
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2102  
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2103  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2104  			reset-names = "phy";
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2105  
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2106  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2107  			assigned-clock-rates = <100000000>;
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2108  
d41a72c24ce3fd Dmitry Baryshkov          2022-03-01  2109  			status = "disabled";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  2110  		};
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  2111  
052c9a1f1400f1 Manivannan Sadhasivam     2023-12-06  2112  		pcie1: pcie@1c08000 {
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2113  			compatible = "qcom,pcie-sm8450-pcie1";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2114  			reg = <0 0x01c08000 0 0x3000>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2115  			      <0 0x40000000 0 0xf1d>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2116  			      <0 0x40000f20 0 0xa8>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2117  			      <0 0x40001000 0 0x1000>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2118  			      <0 0x40100000 0 0x100000>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2119  			reg-names = "parf", "dbi", "elbi", "atu", "config";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2120  			device_type = "pci";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2121  			linux,pci-domain = <1>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2122  			bus-range = <0x00 0xff>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2123  			num-lanes = <2>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2124  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2125  			#address-cells = <3>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2126  			#size-cells = <2>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2127  
f57903c8f4c779 Manivannan Sadhasivam     2023-02-28  2128  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
f57903c8f4c779 Manivannan Sadhasivam     2023-02-28  2129  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2130  
ecc3ac293ed15a Manivannan Sadhasivam     2024-03-18  2131  			msi-map = <0x0 &gic_its 0x5a00 0x1>,
ecc3ac293ed15a Manivannan Sadhasivam     2024-03-18  2132  				  <0x100 &gic_its 0x5a01 0x1>;
ff384ab56f164e Manivannan Sadhasivam     2023-01-02  2133  			msi-map-mask = <0xff00>;
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2134  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2135  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2136  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2137  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2138  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2139  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2140  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  2141  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  2142  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2143  			interrupt-names = "msi0",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2144  					  "msi1",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2145  					  "msi2",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2146  					  "msi3",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2147  					  "msi4",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2148  					  "msi5",
aa87ad5575a125 Krzysztof Kozlowski       2024-01-26  2149  					  "msi6",
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  2150  					  "msi7",
7dc36be39c96f0 Manivannan Sadhasivam     2024-08-28  2151  					  "global";
0da2eff44e78de Manivannan Sadhasivam     2023-01-11  2152  			#interrupt-cells = <1>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2153  			interrupt-map-mask = <0 0 0 0x7>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2154  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2155  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2156  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2157  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2158  
42870599f9441f Krishna chaitanya chundru 2024-05-18  2159  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
42870599f9441f Krishna chaitanya chundru 2024-05-18  2160  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
42870599f9441f Krishna chaitanya chundru 2024-05-18  2161  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
42870599f9441f Krishna chaitanya chundru 2024-05-18  2162  					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
42870599f9441f Krishna chaitanya chundru 2024-05-18  2163  			interconnect-names = "pcie-mem", "cpu-pcie";
42870599f9441f Krishna chaitanya chundru 2024-05-18  2164  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2165  			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2166  				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
5d3d966400d0a0 Dmitry Baryshkov          2024-10-06  2167  				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2168  				 <&rpmhcc RPMH_CXO_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2169  				 <&gcc GCC_PCIE_1_AUX_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2170  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2171  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2172  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2173  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2174  				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2175  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2176  			clock-names = "pipe",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2177  				      "pipe_mux",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2178  				      "phy_pipe",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2179  				      "ref",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2180  				      "aux",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2181  				      "cfg",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2182  				      "bus_master",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2183  				      "bus_slave",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2184  				      "slave_q2a",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2185  				      "ddrss_sf_tbu",
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2186  				      "aggre1";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2187  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2188  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2189  				    <0x100 &apps_smmu 0x1c81 0x1>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2190  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2191  			resets = <&gcc GCC_PCIE_1_BCR>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2192  			reset-names = "pci";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2193  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2194  			power-domains = <&gcc PCIE_1_GDSC>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2195  
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2196  			phys = <&pcie1_phy>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2197  			phy-names = "pciephy";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2198  
e57430d2483506 Neil Armstrong            2023-03-24  2199  			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
e57430d2483506 Neil Armstrong            2023-03-24  2200  			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2201  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2202  			pinctrl-names = "default";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2203  			pinctrl-0 = <&pcie1_default_state>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2204  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2205  			operating-points-v2 = <&pcie1_opp_table>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2206  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2207  			status = "disabled";
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2208  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2209  			pcie1_opp_table: opp-table {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2210  				compatible = "operating-points-v2";
628388982c1303 Krishna chaitanya chundru 2024-05-18  2211  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2212  				/* GEN 1 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2213  				opp-2500000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2214  					opp-hz = /bits/ 64 <2500000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2215  					required-opps = <&rpmhpd_opp_low_svs>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2216  					opp-peak-kBps = <250000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2217  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2218  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2219  				/* GEN 1 x2 and GEN 2 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2220  				opp-5000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2221  					opp-hz = /bits/ 64 <5000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2222  					required-opps = <&rpmhpd_opp_low_svs>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2223  					opp-peak-kBps = <500000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2224  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2225  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2226  				/* GEN 2 x2 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2227  				opp-10000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2228  					opp-hz = /bits/ 64 <10000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2229  					required-opps = <&rpmhpd_opp_low_svs>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2230  					opp-peak-kBps = <1000000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2231  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2232  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2233  				/* GEN 3 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2234  				opp-8000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2235  					opp-hz = /bits/ 64 <8000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2236  					required-opps = <&rpmhpd_opp_nom>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2237  					opp-peak-kBps = <984500 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2238  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2239  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2240  				/* GEN 3 x2 and GEN 4 x1 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2241  				opp-16000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2242  					opp-hz = /bits/ 64 <16000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2243  					required-opps = <&rpmhpd_opp_nom>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2244  					opp-peak-kBps = <1969000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2245  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2246  
628388982c1303 Krishna chaitanya chundru 2024-05-18  2247  				/* GEN 4 x2 */
628388982c1303 Krishna chaitanya chundru 2024-05-18  2248  				opp-32000000 {
628388982c1303 Krishna chaitanya chundru 2024-05-18  2249  					opp-hz = /bits/ 64 <32000000>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2250  					required-opps = <&rpmhpd_opp_nom>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2251  					opp-peak-kBps = <3938000 1>;
628388982c1303 Krishna chaitanya chundru 2024-05-18  2252  				};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2253  			};
628388982c1303 Krishna chaitanya chundru 2024-05-18  2254  
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2255  			pcie@0 {
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2256  				device_type = "pci";
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2257  				reg = <0x0 0x0 0x0 0x0 0x0>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2258  				bus-range = <0x01 0xff>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2259  
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2260  				#address-cells = <3>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2261  				#size-cells = <2>;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2262  				ranges;
4261fd53582df0 Manivannan Sadhasivam     2024-03-21  2263  			};
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2264  		};
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  2265  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2266  		pcie1_ep: pcie-ep@1c08000 {
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2267  			compatible = "qcom,sm8450-pcie-ep";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2268  			reg = <0x0 0x01c08000 0x0 0x3000>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2269  			      <0x0 0x40000000 0x0 0xf1d>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2270  			      <0x0 0x40000f20 0x0 0xa8>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2271  			      <0x0 0x40001000 0x0 0x1000>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2272  			      <0x0 0x40200000 0x0 0x1000000>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2273  			      <0x0 0x01c0b000 0x0 0x1000>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2274  			      <0x0 0x40002000 0x0 0x1000>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2275  			reg-names = "parf",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2276  				    "dbi",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2277  				    "elbi",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2278  				    "atu",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2279  				    "addr_space",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2280  				    "mmio",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2281  				    "dma";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2282  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2283  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2284  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2285  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2286  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2287  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2288  				 <&rpmhcc RPMH_CXO_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2289  				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2290  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2291  			clock-names = "aux",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2292  				      "cfg",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2293  				      "bus_master",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2294  				      "bus_slave",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2295  				      "slave_q2a",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2296  				      "ref",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2297  				      "ddrss_sf_tbu",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2298  				      "aggre_noc_axi";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2299  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2300  			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2301  				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2302  				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2303  			interrupt-names = "global",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2304  					  "doorbell",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2305  					  "dma";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2306  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2307  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2308  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2309  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2310  					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2311  			interconnect-names = "pcie-mem",
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2312  					     "cpu-pcie";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2313  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2314  			iommus = <&apps_smmu 0x1c80 0x7f>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2315  			resets = <&gcc GCC_PCIE_1_BCR>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2316  			reset-names = "core";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2317  			power-domains = <&gcc PCIE_1_GDSC>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2318  			phys = <&pcie1_phy>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2319  			phy-names = "pciephy";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2320  			num-lanes = <2>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2321  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2322  			pinctrl-names = "default";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2323  			pinctrl-0 = <&pcie1_default_state>;
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2324  
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2325  			status = "disabled";
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2326  		};
bffe01a9b4bbcc Dmitry Baryshkov          2025-02-21  2327  
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2328  		pcie1_phy: phy@1c0e000 {
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2329  			compatible = "qcom,sm8450-qmp-gen4x2-pcie-phy";
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2330  			reg = <0 0x01c0e000 0 0x2000>;
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2331  
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2332  			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2333  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2334  				 <&gcc GCC_PCIE_1_CLKREF_EN>,
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2335  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2336  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2337  			clock-names = "aux",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2338  				      "cfg_ahb",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2339  				      "ref",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2340  				      "rchng",
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2341  				      "pipe";
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2342  
831f66d3423c22 Dmitry Baryshkov          2024-06-14  2343  			clock-output-names = "pcie_1_pipe_clk";
e7686284066073 Neil Armstrong            2024-05-02  2344  			#clock-cells = <1>;
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2345  
a912733ccb57c4 Dmitry Baryshkov          2023-08-20  2346  			#phy-cells = <0>;
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2347  
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2348  			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2349  			reset-names = "phy";
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2350  
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2351  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2352  			assigned-clock-rates = <100000000>;
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2353  
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2354  			status = "disabled";
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2355  		};
334d91d2410d76 Dmitry Baryshkov          2022-03-01  2356  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2357  		config_noc: interconnect@1500000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2358  			compatible = "qcom,sm8450-config-noc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2359  			reg = <0 0x01500000 0 0x1c000>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2360  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2361  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2362  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2363  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2364  		system_noc: interconnect@1680000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2365  			compatible = "qcom,sm8450-system-noc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2366  			reg = <0 0x01680000 0 0x1e200>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2367  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2368  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2369  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2370  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2371  		pcie_noc: interconnect@16c0000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2372  			compatible = "qcom,sm8450-pcie-anoc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2373  			reg = <0 0x016c0000 0 0xe280>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2374  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2375  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2376  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2377  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2378  		aggre1_noc: interconnect@16e0000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2379  			compatible = "qcom,sm8450-aggre1-noc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2380  			reg = <0 0x016e0000 0 0x1c080>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2381  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2382  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2383  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2384  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2385  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2386  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2387  		aggre2_noc: interconnect@1700000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2388  			compatible = "qcom,sm8450-aggre2-noc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2389  			reg = <0 0x01700000 0 0x31080>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2390  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2391  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2392  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_0_AXI_CLK>,
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2393  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2394  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2395  				 <&rpmhcc RPMH_IPA_CLK>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2396  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2397  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2398  		mmss_noc: interconnect@1740000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2399  			compatible = "qcom,sm8450-mmss-noc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2400  			reg = <0 0x01740000 0 0x1f080>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2401  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2402  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2403  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  2404  
5188049c9b36d7 Vinod Koul                2021-12-15  2405  		tcsr_mutex: hwlock@1f40000 {
5188049c9b36d7 Vinod Koul                2021-12-15  2406  			compatible = "qcom,tcsr-mutex";
5188049c9b36d7 Vinod Koul                2021-12-15  2407  			reg = <0x0 0x01f40000 0x0 0x40000>;
5188049c9b36d7 Vinod Koul                2021-12-15  2408  			#hwlock-cells = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15  2409  		};
5188049c9b36d7 Vinod Koul                2021-12-15  2410  
1f731bbf71e374 Mukesh Ojha               2023-01-12  2411  		tcsr: syscon@1fc0000 {
1f731bbf71e374 Mukesh Ojha               2023-01-12  2412  			compatible = "qcom,sm8450-tcsr", "syscon";
1f731bbf71e374 Mukesh Ojha               2023-01-12  2413  			reg = <0x0 0x1fc0000 0x0 0x30000>;
1f731bbf71e374 Mukesh Ojha               2023-01-12  2414  		};
1f731bbf71e374 Mukesh Ojha               2023-01-12  2415  
9810647a043678 Konrad Dybcio             2023-12-04  2416  		gpu: gpu@3d00000 {
9810647a043678 Konrad Dybcio             2023-12-04  2417  			compatible = "qcom,adreno-730.1", "qcom,adreno";
9810647a043678 Konrad Dybcio             2023-12-04  2418  			reg = <0x0 0x03d00000 0x0 0x40000>,
9810647a043678 Konrad Dybcio             2023-12-04  2419  			      <0x0 0x03d9e000 0x0 0x1000>,
9810647a043678 Konrad Dybcio             2023-12-04  2420  			      <0x0 0x03d61000 0x0 0x800>;
9810647a043678 Konrad Dybcio             2023-12-04  2421  			reg-names = "kgsl_3d0_reg_memory",
9810647a043678 Konrad Dybcio             2023-12-04  2422  				    "cx_mem",
9810647a043678 Konrad Dybcio             2023-12-04  2423  				    "cx_dbgc";
9810647a043678 Konrad Dybcio             2023-12-04  2424  
9810647a043678 Konrad Dybcio             2023-12-04  2425  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
9810647a043678 Konrad Dybcio             2023-12-04  2426  
9810647a043678 Konrad Dybcio             2023-12-04  2427  			iommus = <&adreno_smmu 0 0x400>,
9810647a043678 Konrad Dybcio             2023-12-04  2428  				 <&adreno_smmu 1 0x400>;
9810647a043678 Konrad Dybcio             2023-12-04  2429  
9810647a043678 Konrad Dybcio             2023-12-04  2430  			operating-points-v2 = <&gpu_opp_table>;
9810647a043678 Konrad Dybcio             2023-12-04  2431  
9810647a043678 Konrad Dybcio             2023-12-04  2432  			qcom,gmu = <&gmu>;
36fd56ab4d1d13 Konrad Dybcio             2024-01-02  2433  			#cooling-cells = <2>;
9810647a043678 Konrad Dybcio             2023-12-04  2434  
9810647a043678 Konrad Dybcio             2023-12-04  2435  			status = "disabled";
9810647a043678 Konrad Dybcio             2023-12-04  2436  
9810647a043678 Konrad Dybcio             2023-12-04  2437  			zap-shader {
9810647a043678 Konrad Dybcio             2023-12-04  2438  				memory-region = <&gpu_micro_code_mem>;
9810647a043678 Konrad Dybcio             2023-12-04  2439  			};
9810647a043678 Konrad Dybcio             2023-12-04  2440  
9810647a043678 Konrad Dybcio             2023-12-04  2441  			gpu_opp_table: opp-table {
9810647a043678 Konrad Dybcio             2023-12-04  2442  				compatible = "operating-points-v2";
9810647a043678 Konrad Dybcio             2023-12-04  2443  
9810647a043678 Konrad Dybcio             2023-12-04  2444  				opp-818000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2445  					opp-hz = /bits/ 64 <818000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2446  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
9810647a043678 Konrad Dybcio             2023-12-04  2447  				};
9810647a043678 Konrad Dybcio             2023-12-04  2448  
9810647a043678 Konrad Dybcio             2023-12-04  2449  				opp-791000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2450  					opp-hz = /bits/ 64 <791000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2451  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
9810647a043678 Konrad Dybcio             2023-12-04  2452  				};
9810647a043678 Konrad Dybcio             2023-12-04  2453  
9810647a043678 Konrad Dybcio             2023-12-04  2454  				opp-734000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2455  					opp-hz = /bits/ 64 <734000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2456  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
9810647a043678 Konrad Dybcio             2023-12-04  2457  				};
9810647a043678 Konrad Dybcio             2023-12-04  2458  
9810647a043678 Konrad Dybcio             2023-12-04  2459  				opp-640000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2460  					opp-hz = /bits/ 64 <640000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2461  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
9810647a043678 Konrad Dybcio             2023-12-04  2462  				};
9810647a043678 Konrad Dybcio             2023-12-04  2463  
9810647a043678 Konrad Dybcio             2023-12-04  2464  				opp-599000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2465  					opp-hz = /bits/ 64 <599000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2466  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
9810647a043678 Konrad Dybcio             2023-12-04  2467  				};
9810647a043678 Konrad Dybcio             2023-12-04  2468  
9810647a043678 Konrad Dybcio             2023-12-04  2469  				opp-545000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2470  					opp-hz = /bits/ 64 <545000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2471  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
9810647a043678 Konrad Dybcio             2023-12-04  2472  				};
9810647a043678 Konrad Dybcio             2023-12-04  2473  
9810647a043678 Konrad Dybcio             2023-12-04  2474  				opp-492000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2475  					opp-hz = /bits/ 64 <492000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2476  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
9810647a043678 Konrad Dybcio             2023-12-04  2477  				};
9810647a043678 Konrad Dybcio             2023-12-04  2478  
9810647a043678 Konrad Dybcio             2023-12-04  2479  				opp-421000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2480  					opp-hz = /bits/ 64 <421000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2481  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
9810647a043678 Konrad Dybcio             2023-12-04  2482  				};
9810647a043678 Konrad Dybcio             2023-12-04  2483  
9810647a043678 Konrad Dybcio             2023-12-04  2484  				opp-350000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2485  					opp-hz = /bits/ 64 <350000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2486  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
9810647a043678 Konrad Dybcio             2023-12-04  2487  				};
9810647a043678 Konrad Dybcio             2023-12-04  2488  
9810647a043678 Konrad Dybcio             2023-12-04  2489  				opp-317000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2490  					opp-hz = /bits/ 64 <317000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2491  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
9810647a043678 Konrad Dybcio             2023-12-04  2492  				};
9810647a043678 Konrad Dybcio             2023-12-04  2493  
9810647a043678 Konrad Dybcio             2023-12-04  2494  				opp-285000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2495  					opp-hz = /bits/ 64 <285000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2496  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
9810647a043678 Konrad Dybcio             2023-12-04  2497  				};
9810647a043678 Konrad Dybcio             2023-12-04  2498  
9810647a043678 Konrad Dybcio             2023-12-04  2499  				opp-220000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2500  					opp-hz = /bits/ 64 <220000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2501  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
9810647a043678 Konrad Dybcio             2023-12-04  2502  				};
9810647a043678 Konrad Dybcio             2023-12-04  2503  			};
9810647a043678 Konrad Dybcio             2023-12-04  2504  		};
9810647a043678 Konrad Dybcio             2023-12-04  2505  
9810647a043678 Konrad Dybcio             2023-12-04  2506  		gmu: gmu@3d6a000 {
9810647a043678 Konrad Dybcio             2023-12-04  2507  			compatible = "qcom,adreno-gmu-730.1", "qcom,adreno-gmu";
9810647a043678 Konrad Dybcio             2023-12-04  2508  			reg = <0x0 0x03d6a000 0x0 0x35000>,
9810647a043678 Konrad Dybcio             2023-12-04  2509  			      <0x0 0x03d50000 0x0 0x10000>,
9810647a043678 Konrad Dybcio             2023-12-04  2510  			      <0x0 0x0b290000 0x0 0x10000>;
9810647a043678 Konrad Dybcio             2023-12-04  2511  			reg-names = "gmu", "rscc", "gmu_pdc";
9810647a043678 Konrad Dybcio             2023-12-04  2512  
9810647a043678 Konrad Dybcio             2023-12-04  2513  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2514  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
9810647a043678 Konrad Dybcio             2023-12-04  2515  			interrupt-names = "hfi", "gmu";
9810647a043678 Konrad Dybcio             2023-12-04  2516  
9810647a043678 Konrad Dybcio             2023-12-04  2517  			clocks = <&gpucc GPU_CC_AHB_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2518  				 <&gpucc GPU_CC_CX_GMU_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2519  				 <&gpucc GPU_CC_CXO_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2520  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2521  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2522  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2523  				 <&gpucc GPU_CC_DEMET_CLK>;
9810647a043678 Konrad Dybcio             2023-12-04  2524  			clock-names = "ahb",
9810647a043678 Konrad Dybcio             2023-12-04  2525  				      "gmu",
9810647a043678 Konrad Dybcio             2023-12-04  2526  				      "cxo",
9810647a043678 Konrad Dybcio             2023-12-04  2527  				      "axi",
9810647a043678 Konrad Dybcio             2023-12-04  2528  				      "memnoc",
9810647a043678 Konrad Dybcio             2023-12-04  2529  				      "hub",
9810647a043678 Konrad Dybcio             2023-12-04  2530  				      "demet";
9810647a043678 Konrad Dybcio             2023-12-04  2531  
9810647a043678 Konrad Dybcio             2023-12-04  2532  			power-domains = <&gpucc GPU_CX_GDSC>,
9810647a043678 Konrad Dybcio             2023-12-04  2533  					<&gpucc GPU_GX_GDSC>;
9810647a043678 Konrad Dybcio             2023-12-04  2534  			power-domain-names = "cx",
9810647a043678 Konrad Dybcio             2023-12-04  2535  					     "gx";
9810647a043678 Konrad Dybcio             2023-12-04  2536  
9810647a043678 Konrad Dybcio             2023-12-04  2537  			iommus = <&adreno_smmu 5 0x400>;
9810647a043678 Konrad Dybcio             2023-12-04  2538  
9810647a043678 Konrad Dybcio             2023-12-04  2539  			qcom,qmp = <&aoss_qmp>;
9810647a043678 Konrad Dybcio             2023-12-04  2540  
9810647a043678 Konrad Dybcio             2023-12-04  2541  			operating-points-v2 = <&gmu_opp_table>;
9810647a043678 Konrad Dybcio             2023-12-04  2542  
9810647a043678 Konrad Dybcio             2023-12-04  2543  			gmu_opp_table: opp-table {
9810647a043678 Konrad Dybcio             2023-12-04  2544  				compatible = "operating-points-v2";
9810647a043678 Konrad Dybcio             2023-12-04  2545  
9810647a043678 Konrad Dybcio             2023-12-04  2546  				opp-500000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2547  					opp-hz = /bits/ 64 <500000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2548  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
9810647a043678 Konrad Dybcio             2023-12-04  2549  				};
9810647a043678 Konrad Dybcio             2023-12-04  2550  
9810647a043678 Konrad Dybcio             2023-12-04  2551  				opp-200000000 {
9810647a043678 Konrad Dybcio             2023-12-04  2552  					opp-hz = /bits/ 64 <200000000>;
9810647a043678 Konrad Dybcio             2023-12-04  2553  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
9810647a043678 Konrad Dybcio             2023-12-04  2554  				};
9810647a043678 Konrad Dybcio             2023-12-04  2555  			};
9810647a043678 Konrad Dybcio             2023-12-04  2556  		};
9810647a043678 Konrad Dybcio             2023-12-04  2557  
9810647a043678 Konrad Dybcio             2023-12-04  2558  		gpucc: clock-controller@3d90000 {
9810647a043678 Konrad Dybcio             2023-12-04  2559  			compatible = "qcom,sm8450-gpucc";
9810647a043678 Konrad Dybcio             2023-12-04  2560  			reg = <0x0 0x03d90000 0x0 0xa000>;
9810647a043678 Konrad Dybcio             2023-12-04  2561  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2562  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
9810647a043678 Konrad Dybcio             2023-12-04  2563  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
9810647a043678 Konrad Dybcio             2023-12-04  2564  			#clock-cells = <1>;
9810647a043678 Konrad Dybcio             2023-12-04  2565  			#reset-cells = <1>;
9810647a043678 Konrad Dybcio             2023-12-04  2566  			#power-domain-cells = <1>;
9810647a043678 Konrad Dybcio             2023-12-04  2567  		};
9810647a043678 Konrad Dybcio             2023-12-04  2568  
9810647a043678 Konrad Dybcio             2023-12-04  2569  		adreno_smmu: iommu@3da0000 {
9810647a043678 Konrad Dybcio             2023-12-04  2570  			compatible = "qcom,sm8450-smmu-500", "qcom,adreno-smmu",
9810647a043678 Konrad Dybcio             2023-12-04  2571  				     "qcom,smmu-500", "arm,mmu-500";
9810647a043678 Konrad Dybcio             2023-12-04  2572  			reg = <0x0 0x03da0000 0x0 0x40000>;
9810647a043678 Konrad Dybcio             2023-12-04  2573  			#iommu-cells = <2>;
9810647a043678 Konrad Dybcio             2023-12-04  2574  			#global-interrupts = <1>;
9810647a043678 Konrad Dybcio             2023-12-04  2575  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2576  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2577  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2578  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2579  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2580  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2581  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2582  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2583  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2584  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2585  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2586  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2587  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2588  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2589  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2590  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2591  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2592  				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2593  				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2594  				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2595  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2596  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2597  				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2598  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2599  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>,
9810647a043678 Konrad Dybcio             2023-12-04  2600  				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
9810647a043678 Konrad Dybcio             2023-12-04  2601  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2602  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2603  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2604  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2605  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
9810647a043678 Konrad Dybcio             2023-12-04  2606  				 <&gpucc GPU_CC_AHB_CLK>;
9810647a043678 Konrad Dybcio             2023-12-04  2607  			clock-names = "gmu",
9810647a043678 Konrad Dybcio             2023-12-04  2608  				      "hub",
9810647a043678 Konrad Dybcio             2023-12-04  2609  				      "hlos",
9810647a043678 Konrad Dybcio             2023-12-04  2610  				      "bus",
9810647a043678 Konrad Dybcio             2023-12-04  2611  				      "iface",
9810647a043678 Konrad Dybcio             2023-12-04  2612  				      "ahb";
9810647a043678 Konrad Dybcio             2023-12-04  2613  			power-domains = <&gpucc GPU_CX_GDSC>;
9810647a043678 Konrad Dybcio             2023-12-04  2614  			dma-coherent;
9810647a043678 Konrad Dybcio             2023-12-04  2615  		};
9810647a043678 Konrad Dybcio             2023-12-04  2616  
19fd04fb9247fb Vinod Koul                2021-12-16  2617  		usb_1_hsphy: phy@88e3000 {
19fd04fb9247fb Vinod Koul                2021-12-16  2618  			compatible = "qcom,sm8450-usb-hs-phy",
19fd04fb9247fb Vinod Koul                2021-12-16  2619  				     "qcom,usb-snps-hs-7nm-phy";
19fd04fb9247fb Vinod Koul                2021-12-16  2620  			reg = <0 0x088e3000 0 0x400>;
19fd04fb9247fb Vinod Koul                2021-12-16  2621  			status = "disabled";
19fd04fb9247fb Vinod Koul                2021-12-16  2622  			#phy-cells = <0>;
19fd04fb9247fb Vinod Koul                2021-12-16  2623  
19fd04fb9247fb Vinod Koul                2021-12-16  2624  			clocks = <&rpmhcc RPMH_CXO_CLK>;
19fd04fb9247fb Vinod Koul                2021-12-16  2625  			clock-names = "ref";
19fd04fb9247fb Vinod Koul                2021-12-16  2626  
19fd04fb9247fb Vinod Koul                2021-12-16  2627  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
19fd04fb9247fb Vinod Koul                2021-12-16  2628  		};
19fd04fb9247fb Vinod Koul                2021-12-16  2629  
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2630  		usb_1_qmpphy: phy@88e8000 {
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2631  			compatible = "qcom,sm8450-qmp-usb3-dp-phy";
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2632  			reg = <0 0x088e8000 0 0x3000>;
19fd04fb9247fb Vinod Koul                2021-12-16  2633  
19fd04fb9247fb Vinod Koul                2021-12-16  2634  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
19fd04fb9247fb Vinod Koul                2021-12-16  2635  				 <&rpmhcc RPMH_CXO_CLK>,
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2636  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2637  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2638  			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
19fd04fb9247fb Vinod Koul                2021-12-16  2639  
19fd04fb9247fb Vinod Koul                2021-12-16  2640  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
19fd04fb9247fb Vinod Koul                2021-12-16  2641  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
19fd04fb9247fb Vinod Koul                2021-12-16  2642  			reset-names = "phy", "common";
19fd04fb9247fb Vinod Koul                2021-12-16  2643  
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2644  			#clock-cells = <1>;
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2645  			#phy-cells = <1>;
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2646  
1a1322c8a698c8 Dmitry Baryshkov          2024-04-29  2647  			orientation-switch;
1a1322c8a698c8 Dmitry Baryshkov          2024-04-29  2648  
d3054cec1e9ea4 Neil Armstrong            2023-03-17  2649  			status = "disabled";
e5167da381a71e Neil Armstrong            2023-05-23  2650  
e5167da381a71e Neil Armstrong            2023-05-23  2651  			ports {
e5167da381a71e Neil Armstrong            2023-05-23  2652  				#address-cells = <1>;
e5167da381a71e Neil Armstrong            2023-05-23  2653  				#size-cells = <0>;
e5167da381a71e Neil Armstrong            2023-05-23  2654  
e5167da381a71e Neil Armstrong            2023-05-23  2655  				port@0 {
e5167da381a71e Neil Armstrong            2023-05-23  2656  					reg = <0>;
e5167da381a71e Neil Armstrong            2023-05-23  2657  
e5167da381a71e Neil Armstrong            2023-05-23  2658  					usb_1_qmpphy_out: endpoint {
e5167da381a71e Neil Armstrong            2023-05-23  2659  					};
e5167da381a71e Neil Armstrong            2023-05-23  2660  				};
e5167da381a71e Neil Armstrong            2023-05-23  2661  
e5167da381a71e Neil Armstrong            2023-05-23  2662  				port@1 {
e5167da381a71e Neil Armstrong            2023-05-23  2663  					reg = <1>;
e5167da381a71e Neil Armstrong            2023-05-23  2664  
e5167da381a71e Neil Armstrong            2023-05-23  2665  					usb_1_qmpphy_usb_ss_in: endpoint {
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  2666  						remote-endpoint = <&usb_1_dwc3_ss>;
e5167da381a71e Neil Armstrong            2023-05-23  2667  					};
e5167da381a71e Neil Armstrong            2023-05-23  2668  				};
e5167da381a71e Neil Armstrong            2023-05-23  2669  
e5167da381a71e Neil Armstrong            2023-05-23  2670  				port@2 {
e5167da381a71e Neil Armstrong            2023-05-23  2671  					reg = <2>;
e5167da381a71e Neil Armstrong            2023-05-23  2672  
e5167da381a71e Neil Armstrong            2023-05-23  2673  					usb_1_qmpphy_dp_in: endpoint {
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  2674  						remote-endpoint = <&mdss_dp0_out>;
e5167da381a71e Neil Armstrong            2023-05-23  2675  					};
e5167da381a71e Neil Armstrong            2023-05-23  2676  				};
e5167da381a71e Neil Armstrong            2023-05-23  2677  			};
19fd04fb9247fb Vinod Koul                2021-12-16  2678  		};
19fd04fb9247fb Vinod Koul                2021-12-16  2679  
1172729576fbbe Bjorn Andersson           2022-01-27  2680  		remoteproc_slpi: remoteproc@2400000 {
1172729576fbbe Bjorn Andersson           2022-01-27  2681  			compatible = "qcom,sm8450-slpi-pas";
1172729576fbbe Bjorn Andersson           2022-01-27  2682  			reg = <0 0x02400000 0 0x4000>;
1172729576fbbe Bjorn Andersson           2022-01-27  2683  
20402c94721a05 Manivannan Sadhasivam     2022-05-30  2684  			interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  2685  					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  2686  					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  2687  					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  2688  					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  2689  			interrupt-names = "wdog", "fatal", "ready",
1172729576fbbe Bjorn Andersson           2022-01-27  2690  					  "handover", "stop-ack";
1172729576fbbe Bjorn Andersson           2022-01-27  2691  
1172729576fbbe Bjorn Andersson           2022-01-27  2692  			clocks = <&rpmhcc RPMH_CXO_CLK>;
1172729576fbbe Bjorn Andersson           2022-01-27  2693  			clock-names = "xo";
1172729576fbbe Bjorn Andersson           2022-01-27  2694  
8ed9de79680f1d Rohit Agarwal             2023-07-20  2695  			power-domains = <&rpmhpd RPMHPD_LCX>,
8ed9de79680f1d Rohit Agarwal             2023-07-20  2696  					<&rpmhpd RPMHPD_LMX>;
1172729576fbbe Bjorn Andersson           2022-01-27  2697  			power-domain-names = "lcx", "lmx";
1172729576fbbe Bjorn Andersson           2022-01-27  2698  
1172729576fbbe Bjorn Andersson           2022-01-27  2699  			memory-region = <&slpi_mem>;
1172729576fbbe Bjorn Andersson           2022-01-27  2700  
1172729576fbbe Bjorn Andersson           2022-01-27  2701  			qcom,qmp = <&aoss_qmp>;
1172729576fbbe Bjorn Andersson           2022-01-27  2702  
1172729576fbbe Bjorn Andersson           2022-01-27  2703  			qcom,smem-states = <&smp2p_slpi_out 0>;
1172729576fbbe Bjorn Andersson           2022-01-27  2704  			qcom,smem-state-names = "stop";
1172729576fbbe Bjorn Andersson           2022-01-27  2705  
1172729576fbbe Bjorn Andersson           2022-01-27  2706  			status = "disabled";
1172729576fbbe Bjorn Andersson           2022-01-27  2707  
1172729576fbbe Bjorn Andersson           2022-01-27  2708  			glink-edge {
1172729576fbbe Bjorn Andersson           2022-01-27  2709  				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
1172729576fbbe Bjorn Andersson           2022-01-27  2710  							     IPCC_MPROC_SIGNAL_GLINK_QMP
1172729576fbbe Bjorn Andersson           2022-01-27  2711  							     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  2712  				mboxes = <&ipcc IPCC_CLIENT_SLPI
1172729576fbbe Bjorn Andersson           2022-01-27  2713  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
1172729576fbbe Bjorn Andersson           2022-01-27  2714  
1172729576fbbe Bjorn Andersson           2022-01-27  2715  				label = "slpi";
1172729576fbbe Bjorn Andersson           2022-01-27  2716  				qcom,remote-pid = <3>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2717  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2718  				fastrpc {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2719  					compatible = "qcom,fastrpc";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2720  					qcom,glink-channels = "fastrpcglink-apps-dsp";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2721  					label = "sdsp";
033fbfa0eb60e5 Neil Armstrong            2024-02-27  2722  					qcom,non-secure-domain;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2723  					#address-cells = <1>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2724  					#size-cells = <0>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2725  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2726  					compute-cb@1 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2727  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2728  						reg = <1>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2729  						iommus = <&apps_smmu 0x0541 0x0>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2730  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2731  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2732  					compute-cb@2 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2733  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2734  						reg = <2>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2735  						iommus = <&apps_smmu 0x0542 0x0>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2736  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2737  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2738  					compute-cb@3 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2739  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2740  						reg = <3>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2741  						iommus = <&apps_smmu 0x0543 0x0>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2742  						/* note: shared-cb = <4> in downstream */
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2743  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  2744  				};
1172729576fbbe Bjorn Andersson           2022-01-27  2745  			};
1172729576fbbe Bjorn Andersson           2022-01-27  2746  		};
1172729576fbbe Bjorn Andersson           2022-01-27  2747  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2748  		remoteproc_adsp: remoteproc@3000000 {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2749  			compatible = "qcom,sm8450-adsp-pas";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2750  			reg = <0x0 0x03000000 0x0 0x10000>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2751  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2752  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2753  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2754  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2755  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2756  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2757  			interrupt-names = "wdog", "fatal", "ready",
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2758  					  "handover", "stop-ack";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2759  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2760  			clocks = <&rpmhcc RPMH_CXO_CLK>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2761  			clock-names = "xo";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2762  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2763  			power-domains = <&rpmhpd RPMHPD_LCX>,
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2764  					<&rpmhpd RPMHPD_LMX>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2765  			power-domain-names = "lcx", "lmx";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2766  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2767  			memory-region = <&adsp_mem>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2768  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2769  			qcom,qmp = <&aoss_qmp>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2770  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2771  			qcom,smem-states = <&smp2p_adsp_out 0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2772  			qcom,smem-state-names = "stop";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2773  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2774  			status = "disabled";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2775  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2776  			remoteproc_adsp_glink: glink-edge {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2777  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2778  							     IPCC_MPROC_SIGNAL_GLINK_QMP
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2779  							     IRQ_TYPE_EDGE_RISING>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2780  				mboxes = <&ipcc IPCC_CLIENT_LPASS
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2781  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2782  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2783  				label = "lpass";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2784  				qcom,remote-pid = <2>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2785  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2786  				gpr {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2787  					compatible = "qcom,gpr";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2788  					qcom,glink-channels = "adsp_apps";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2789  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2790  					qcom,intents = <512 20>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2791  					#address-cells = <1>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2792  					#size-cells = <0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2793  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2794  					q6apm: service@1 {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2795  						compatible = "qcom,q6apm";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2796  						reg = <GPR_APM_MODULE_IID>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2797  						#sound-dai-cells = <0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2798  						qcom,protection-domain = "avs/audio",
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2799  									 "msm/adsp/audio_pd";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2800  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2801  						q6apmdai: dais {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2802  							compatible = "qcom,q6apm-dais";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2803  							iommus = <&apps_smmu 0x1801 0x0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2804  						};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2805  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2806  						q6apmbedai: bedais {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2807  							compatible = "qcom,q6apm-lpass-dais";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2808  							#sound-dai-cells = <1>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2809  						};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2810  					};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2811  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2812  					q6prm: service@2 {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2813  						compatible = "qcom,q6prm";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2814  						reg = <GPR_PRM_MODULE_IID>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2815  						qcom,protection-domain = "avs/audio",
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2816  									 "msm/adsp/audio_pd";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2817  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2818  						q6prmcc: clock-controller {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2819  							compatible = "qcom,q6prm-lpass-clocks";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2820  							#clock-cells = <2>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2821  						};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2822  					};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2823  				};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2824  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2825  				fastrpc {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2826  					compatible = "qcom,fastrpc";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2827  					qcom,glink-channels = "fastrpcglink-apps-dsp";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2828  					label = "adsp";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2829  					qcom,non-secure-domain;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2830  					#address-cells = <1>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2831  					#size-cells = <0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2832  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2833  					compute-cb@3 {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2834  						compatible = "qcom,fastrpc-compute-cb";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2835  						reg = <3>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2836  						iommus = <&apps_smmu 0x1803 0x0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2837  					};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2838  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2839  					compute-cb@4 {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2840  						compatible = "qcom,fastrpc-compute-cb";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2841  						reg = <4>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2842  						iommus = <&apps_smmu 0x1804 0x0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2843  					};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2844  
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2845  					compute-cb@5 {
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2846  						compatible = "qcom,fastrpc-compute-cb";
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2847  						reg = <5>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2848  						iommus = <&apps_smmu 0x1805 0x0>;
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2849  					};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2850  				};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2851  			};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2852  		};
13c96bee5d5e5b Krzysztof Kozlowski       2024-12-13  2853  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2854  		wsa2macro: codec@31e0000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2855  			compatible = "qcom,sm8450-lpass-wsa-macro";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2856  			reg = <0 0x031e0000 0 0x1000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2857  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2858  				 <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2859  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2860  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2861  				 <&vamacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2862  			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2863  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2864  			#clock-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2865  			clock-output-names = "wsa2-mclk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2866  			#sound-dai-cells = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2867  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2868  
11fcb81373de52 Neil Armstrong            2023-11-06  2869  		swr4: soundwire@31f0000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2870  			compatible = "qcom,soundwire-v1.7.0";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2871  			reg = <0 0x031f0000 0 0x2000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2872  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2873  			clocks = <&wsa2macro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2874  			clock-names = "iface";
add214009d0632 Krzysztof Kozlowski       2023-04-05  2875  			label = "WSA2";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2876  
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2877  			pinctrl-0 = <&wsa2_swr_active>;
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2878  			pinctrl-names = "default";
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2879  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2880  			qcom,din-ports = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2881  			qcom,dout-ports = <6>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2882  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2883  			qcom,ports-sinterval-low =	/bits/ 8 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x0f 0x0f>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2884  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x0c 0x06 0x12 0x0d 0x07 0x0a>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2885  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x00 0x1f 0xff 0x00 0x1f 0x00 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2886  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2887  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2888  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2889  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0x01 0xff 0xff 0x01 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2890  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2891  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2892  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2893  			#address-cells = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2894  			#size-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2895  			#sound-dai-cells = <1>;
b9ae6ddeded793 Krzysztof Kozlowski       2023-01-02  2896  			status = "disabled";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2897  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2898  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2899  		rxmacro: codec@3200000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2900  			compatible = "qcom,sm8450-lpass-rx-macro";
a58cde4d66e18a Konrad Dybcio             2023-01-02  2901  			reg = <0 0x03200000 0 0x1000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2902  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2903  				 <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2904  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2905  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2906  				 <&vamacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2907  			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2908  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2909  			#clock-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2910  			clock-output-names = "mclk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2911  			#sound-dai-cells = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2912  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2913  
11fcb81373de52 Neil Armstrong            2023-11-06  2914  		swr1: soundwire@3210000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2915  			compatible = "qcom,soundwire-v1.7.0";
a58cde4d66e18a Konrad Dybcio             2023-01-02  2916  			reg = <0 0x03210000 0 0x2000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2917  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2918  			clocks = <&rxmacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2919  			clock-names = "iface";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2920  			label = "RX";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2921  			qcom,din-ports = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2922  			qcom,dout-ports = <5>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2923  
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2924  			pinctrl-0 = <&rx_swr_active>;
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2925  			pinctrl-names = "default";
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2926  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2927  			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2928  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2929  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2930  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2931  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2932  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2933  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2934  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2935  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2936  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2937  			#address-cells = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2938  			#size-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2939  			#sound-dai-cells = <1>;
b9ae6ddeded793 Krzysztof Kozlowski       2023-01-02  2940  			status = "disabled";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2941  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2942  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2943  		txmacro: codec@3220000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2944  			compatible = "qcom,sm8450-lpass-tx-macro";
a58cde4d66e18a Konrad Dybcio             2023-01-02  2945  			reg = <0 0x03220000 0 0x1000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2946  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2947  				 <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2948  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2949  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2950  				 <&vamacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2951  			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2952  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2953  			#clock-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2954  			clock-output-names = "mclk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2955  			#sound-dai-cells = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2956  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2957  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2958  		wsamacro: codec@3240000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2959  			compatible = "qcom,sm8450-lpass-wsa-macro";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2960  			reg = <0 0x03240000 0 0x1000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2961  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2962  				 <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2963  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2964  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2965  				 <&vamacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2966  			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2967  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2968  			#clock-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2969  			clock-output-names = "mclk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2970  			#sound-dai-cells = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2971  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2972  
11fcb81373de52 Neil Armstrong            2023-11-06  2973  		swr0: soundwire@3250000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2974  			compatible = "qcom,soundwire-v1.7.0";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2975  			reg = <0 0x03250000 0 0x2000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2976  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2977  			clocks = <&wsamacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2978  			clock-names = "iface";
add214009d0632 Krzysztof Kozlowski       2023-04-05  2979  			label = "WSA";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2980  
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2981  			pinctrl-0 = <&wsa_swr_active>;
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2982  			pinctrl-names = "default";
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  2983  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2984  			qcom,din-ports = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2985  			qcom,dout-ports = <6>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2986  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2987  			qcom,ports-sinterval-low =	/bits/ 8 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x0f 0x0f>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2988  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x0c 0x06 0x12 0x0d 0x07 0x0a>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2989  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x00 0x1f 0xff 0x00 0x1f 0x00 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2990  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2991  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2992  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2993  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0x01 0xff 0xff 0x01 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2994  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2995  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2996  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2997  			#address-cells = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2998  			#size-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  2999  			#sound-dai-cells = <1>;
b9ae6ddeded793 Krzysztof Kozlowski       2023-01-02  3000  			status = "disabled";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3001  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3002  
11fcb81373de52 Neil Armstrong            2023-11-06  3003  		swr2: soundwire@33b0000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3004  			compatible = "qcom,soundwire-v1.7.0";
a58cde4d66e18a Konrad Dybcio             2023-01-02  3005  			reg = <0 0x033b0000 0 0x2000>;
d6573b4c202e75 Krzysztof Kozlowski       2023-04-05  3006  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
d6573b4c202e75 Krzysztof Kozlowski       2023-04-05  3007  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
5eafe69af43d77 Krzysztof Kozlowski       2022-12-23  3008  			interrupt-names = "core", "wakeup";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3009  
20e886590a3106 Krzysztof Kozlowski       2023-11-29  3010  			clocks = <&txmacro>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3011  			clock-names = "iface";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3012  			label = "TX";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3013  
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  3014  			pinctrl-0 = <&tx_swr_active>;
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  3015  			pinctrl-names = "default";
565f4d00cde3e2 Krzysztof Kozlowski       2023-12-13  3016  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3017  			qcom,din-ports = <4>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3018  			qcom,dout-ports = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3019  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3020  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3021  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3022  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3023  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3024  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3025  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3026  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3027  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3028  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3029  			#address-cells = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3030  			#size-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3031  			#sound-dai-cells = <1>;
b9ae6ddeded793 Krzysztof Kozlowski       2023-01-02  3032  			status = "disabled";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3033  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3034  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3035  		vamacro: codec@33f0000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3036  			compatible = "qcom,sm8450-lpass-va-macro";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3037  			reg = <0 0x033f0000 0 0x1000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3038  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3039  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3040  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3041  				 <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3042  			clock-names = "mclk", "macro", "dcodec", "npl";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3043  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3044  			#clock-cells = <0>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3045  			clock-output-names = "fsgen";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3046  			#sound-dai-cells = <1>;
b9ae6ddeded793 Krzysztof Kozlowski       2023-01-02  3047  			status = "disabled";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3048  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  3049  
1172729576fbbe Bjorn Andersson           2022-01-27  3050  		remoteproc_cdsp: remoteproc@32300000 {
1172729576fbbe Bjorn Andersson           2022-01-27  3051  			compatible = "qcom,sm8450-cdsp-pas";
3751fe2cba2a9f Krzysztof Kozlowski       2024-12-13  3052  			reg = <0 0x32300000 0 0x10000>;
1172729576fbbe Bjorn Andersson           2022-01-27  3053  
20402c94721a05 Manivannan Sadhasivam     2022-05-30  3054  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3055  					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3056  					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3057  					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3058  					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  3059  			interrupt-names = "wdog", "fatal", "ready",
1172729576fbbe Bjorn Andersson           2022-01-27  3060  					  "handover", "stop-ack";
1172729576fbbe Bjorn Andersson           2022-01-27  3061  
1172729576fbbe Bjorn Andersson           2022-01-27  3062  			clocks = <&rpmhcc RPMH_CXO_CLK>;
1172729576fbbe Bjorn Andersson           2022-01-27  3063  			clock-names = "xo";
1172729576fbbe Bjorn Andersson           2022-01-27  3064  
8ed9de79680f1d Rohit Agarwal             2023-07-20  3065  			power-domains = <&rpmhpd RPMHPD_CX>,
8ed9de79680f1d Rohit Agarwal             2023-07-20  3066  					<&rpmhpd RPMHPD_MXC>;
1172729576fbbe Bjorn Andersson           2022-01-27  3067  			power-domain-names = "cx", "mxc";
1172729576fbbe Bjorn Andersson           2022-01-27  3068  
1172729576fbbe Bjorn Andersson           2022-01-27  3069  			memory-region = <&cdsp_mem>;
1172729576fbbe Bjorn Andersson           2022-01-27  3070  
1172729576fbbe Bjorn Andersson           2022-01-27  3071  			qcom,qmp = <&aoss_qmp>;
1172729576fbbe Bjorn Andersson           2022-01-27  3072  
1172729576fbbe Bjorn Andersson           2022-01-27  3073  			qcom,smem-states = <&smp2p_cdsp_out 0>;
1172729576fbbe Bjorn Andersson           2022-01-27  3074  			qcom,smem-state-names = "stop";
1172729576fbbe Bjorn Andersson           2022-01-27  3075  
1172729576fbbe Bjorn Andersson           2022-01-27  3076  			status = "disabled";
1172729576fbbe Bjorn Andersson           2022-01-27  3077  
1172729576fbbe Bjorn Andersson           2022-01-27  3078  			glink-edge {
1172729576fbbe Bjorn Andersson           2022-01-27  3079  				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
1172729576fbbe Bjorn Andersson           2022-01-27  3080  							     IPCC_MPROC_SIGNAL_GLINK_QMP
1172729576fbbe Bjorn Andersson           2022-01-27  3081  							     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  3082  				mboxes = <&ipcc IPCC_CLIENT_CDSP
1172729576fbbe Bjorn Andersson           2022-01-27  3083  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
1172729576fbbe Bjorn Andersson           2022-01-27  3084  
1172729576fbbe Bjorn Andersson           2022-01-27  3085  				label = "cdsp";
1172729576fbbe Bjorn Andersson           2022-01-27  3086  				qcom,remote-pid = <5>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3087  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3088  				fastrpc {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3089  					compatible = "qcom,fastrpc";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3090  					qcom,glink-channels = "fastrpcglink-apps-dsp";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3091  					label = "cdsp";
033fbfa0eb60e5 Neil Armstrong            2024-02-27  3092  					qcom,non-secure-domain;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3093  					#address-cells = <1>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3094  					#size-cells = <0>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3095  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3096  					compute-cb@1 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3097  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3098  						reg = <1>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3099  						iommus = <&apps_smmu 0x2161 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3100  							 <&apps_smmu 0x1021 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3101  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3102  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3103  					compute-cb@2 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3104  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3105  						reg = <2>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3106  						iommus = <&apps_smmu 0x2162 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3107  							 <&apps_smmu 0x1022 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3108  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3109  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3110  					compute-cb@3 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3111  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3112  						reg = <3>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3113  						iommus = <&apps_smmu 0x2163 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3114  							 <&apps_smmu 0x1023 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3115  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3116  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3117  					compute-cb@4 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3118  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3119  						reg = <4>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3120  						iommus = <&apps_smmu 0x2164 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3121  							 <&apps_smmu 0x1024 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3122  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3123  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3124  					compute-cb@5 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3125  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3126  						reg = <5>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3127  						iommus = <&apps_smmu 0x2165 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3128  							 <&apps_smmu 0x1025 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3129  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3130  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3131  					compute-cb@6 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3132  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3133  						reg = <6>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3134  						iommus = <&apps_smmu 0x2166 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3135  							 <&apps_smmu 0x1026 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3136  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3137  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3138  					compute-cb@7 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3139  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3140  						reg = <7>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3141  						iommus = <&apps_smmu 0x2167 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3142  							 <&apps_smmu 0x1027 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3143  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3144  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3145  					compute-cb@8 {
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3146  						compatible = "qcom,fastrpc-compute-cb";
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3147  						reg = <8>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3148  						iommus = <&apps_smmu 0x2168 0x0400>,
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3149  							 <&apps_smmu 0x1028 0x1420>;
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3150  					};
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3151  
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3152  					/* note: secure cb9 in downstream */
91d70eb70867f3 Dmitry Baryshkov          2022-04-10  3153  				};
1172729576fbbe Bjorn Andersson           2022-01-27  3154  			};
1172729576fbbe Bjorn Andersson           2022-01-27  3155  		};
1172729576fbbe Bjorn Andersson           2022-01-27  3156  
1172729576fbbe Bjorn Andersson           2022-01-27  3157  		remoteproc_mpss: remoteproc@4080000 {
1172729576fbbe Bjorn Andersson           2022-01-27  3158  			compatible = "qcom,sm8450-mpss-pas";
fa6442e87ab7c4 Krzysztof Kozlowski       2024-12-13  3159  			reg = <0x0 0x04080000 0x0 0x10000>;
1172729576fbbe Bjorn Andersson           2022-01-27  3160  
20402c94721a05 Manivannan Sadhasivam     2022-05-30  3161  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3162  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3163  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3164  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3165  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
1172729576fbbe Bjorn Andersson           2022-01-27  3166  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  3167  			interrupt-names = "wdog", "fatal", "ready", "handover",
1172729576fbbe Bjorn Andersson           2022-01-27  3168  					  "stop-ack", "shutdown-ack";
1172729576fbbe Bjorn Andersson           2022-01-27  3169  
1172729576fbbe Bjorn Andersson           2022-01-27  3170  			clocks = <&rpmhcc RPMH_CXO_CLK>;
1172729576fbbe Bjorn Andersson           2022-01-27  3171  			clock-names = "xo";
1172729576fbbe Bjorn Andersson           2022-01-27  3172  
8ed9de79680f1d Rohit Agarwal             2023-07-20  3173  			power-domains = <&rpmhpd RPMHPD_CX>,
8ed9de79680f1d Rohit Agarwal             2023-07-20  3174  					<&rpmhpd RPMHPD_MSS>;
1172729576fbbe Bjorn Andersson           2022-01-27  3175  			power-domain-names = "cx", "mss";
1172729576fbbe Bjorn Andersson           2022-01-27  3176  
1172729576fbbe Bjorn Andersson           2022-01-27  3177  			memory-region = <&mpss_mem>;
1172729576fbbe Bjorn Andersson           2022-01-27  3178  
1172729576fbbe Bjorn Andersson           2022-01-27  3179  			qcom,qmp = <&aoss_qmp>;
1172729576fbbe Bjorn Andersson           2022-01-27  3180  
1172729576fbbe Bjorn Andersson           2022-01-27  3181  			qcom,smem-states = <&smp2p_modem_out 0>;
1172729576fbbe Bjorn Andersson           2022-01-27  3182  			qcom,smem-state-names = "stop";
1172729576fbbe Bjorn Andersson           2022-01-27  3183  
1172729576fbbe Bjorn Andersson           2022-01-27  3184  			status = "disabled";
1172729576fbbe Bjorn Andersson           2022-01-27  3185  
1172729576fbbe Bjorn Andersson           2022-01-27  3186  			glink-edge {
1172729576fbbe Bjorn Andersson           2022-01-27  3187  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
1172729576fbbe Bjorn Andersson           2022-01-27  3188  							     IPCC_MPROC_SIGNAL_GLINK_QMP
1172729576fbbe Bjorn Andersson           2022-01-27  3189  							     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  3190  				mboxes = <&ipcc IPCC_CLIENT_MPSS
1172729576fbbe Bjorn Andersson           2022-01-27  3191  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
1172729576fbbe Bjorn Andersson           2022-01-27  3192  				label = "modem";
1172729576fbbe Bjorn Andersson           2022-01-27  3193  				qcom,remote-pid = <1>;
1172729576fbbe Bjorn Andersson           2022-01-27  3194  			};
1172729576fbbe Bjorn Andersson           2022-01-27  3195  		};
1172729576fbbe Bjorn Andersson           2022-01-27  3196  
3c678552b00f90 Taniya Das                2023-05-24  3197  		videocc: clock-controller@aaf0000 {
3c678552b00f90 Taniya Das                2023-05-24  3198  			compatible = "qcom,sm8450-videocc";
3c678552b00f90 Taniya Das                2023-05-24  3199  			reg = <0 0x0aaf0000 0 0x10000>;
3c678552b00f90 Taniya Das                2023-05-24  3200  			clocks = <&rpmhcc RPMH_CXO_CLK>,
3c678552b00f90 Taniya Das                2023-05-24  3201  				 <&gcc GCC_VIDEO_AHB_CLK>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3202  			power-domains = <&rpmhpd RPMHPD_MMCX>;
3c678552b00f90 Taniya Das                2023-05-24  3203  			required-opps = <&rpmhpd_opp_low_svs>;
3c678552b00f90 Taniya Das                2023-05-24  3204  			#clock-cells = <1>;
3c678552b00f90 Taniya Das                2023-05-24  3205  			#reset-cells = <1>;
3c678552b00f90 Taniya Das                2023-05-24  3206  			#power-domain-cells = <1>;
3c678552b00f90 Taniya Das                2023-05-24  3207  		};
3c678552b00f90 Taniya Das                2023-05-24  3208  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3209  		cci0: cci@ac15000 {
71b7c2df3109ee Konrad Dybcio             2022-12-13  3210  			compatible = "qcom,sm8450-cci", "qcom,msm8996-cci";
a58cde4d66e18a Konrad Dybcio             2023-01-02  3211  			reg = <0 0x0ac15000 0 0x1000>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3212  			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3213  			power-domains = <&camcc TITAN_TOP_GDSC>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3214  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3215  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3216  				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3217  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3218  				 <&camcc CAM_CC_CCI_0_CLK>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3219  				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3220  			clock-names = "camnoc_axi",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3221  				      "slow_ahb_src",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3222  				      "cpas_ahb",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3223  				      "cci",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3224  				      "cci_src";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3225  			pinctrl-0 = <&cci0_default &cci1_default>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3226  			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3227  			pinctrl-names = "default", "sleep";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3228  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3229  			status = "disabled";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3230  			#address-cells = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3231  			#size-cells = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3232  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3233  			cci0_i2c0: i2c-bus@0 {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3234  				reg = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3235  				clock-frequency = <1000000>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3236  				#address-cells = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3237  				#size-cells = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3238  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3239  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3240  			cci0_i2c1: i2c-bus@1 {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3241  				reg = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3242  				clock-frequency = <1000000>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3243  				#address-cells = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3244  				#size-cells = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3245  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3246  		};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3247  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3248  		cci1: cci@ac16000 {
71b7c2df3109ee Konrad Dybcio             2022-12-13  3249  			compatible = "qcom,sm8450-cci", "qcom,msm8996-cci";
a58cde4d66e18a Konrad Dybcio             2023-01-02  3250  			reg = <0 0x0ac16000 0 0x1000>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3251  			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3252  			power-domains = <&camcc TITAN_TOP_GDSC>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3253  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3254  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3255  				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3256  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3257  				 <&camcc CAM_CC_CCI_1_CLK>,
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3258  				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3259  			clock-names = "camnoc_axi",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3260  				      "slow_ahb_src",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3261  				      "cpas_ahb",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3262  				      "cci",
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3263  				      "cci_src";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3264  			pinctrl-0 = <&cci2_default &cci3_default>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3265  			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3266  			pinctrl-names = "default", "sleep";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3267  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3268  			status = "disabled";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3269  			#address-cells = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3270  			#size-cells = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3271  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3272  			cci1_i2c0: i2c-bus@0 {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3273  				reg = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3274  				clock-frequency = <1000000>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3275  				#address-cells = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3276  				#size-cells = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3277  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3278  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3279  			cci1_i2c1: i2c-bus@1 {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3280  				reg = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3281  				clock-frequency = <1000000>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3282  				#address-cells = <1>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3283  				#size-cells = <0>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3284  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3285  		};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3286  
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3287  		camcc: clock-controller@ade0000 {
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3288  			compatible = "qcom,sm8450-camcc";
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3289  			reg = <0 0x0ade0000 0 0x20000>;
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3290  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3291  				 <&rpmhcc RPMH_CXO_CLK>,
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3292  				 <&rpmhcc RPMH_CXO_CLK_A>,
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3293  				 <&sleep_clk>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3294  			power-domains = <&rpmhpd RPMHPD_MMCX>;
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3295  			required-opps = <&rpmhpd_opp_low_svs>;
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3296  			#clock-cells = <1>;
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3297  			#reset-cells = <1>;
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3298  			#power-domain-cells = <1>;
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3299  			status = "disabled";
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3300  		};
e07e07dac9502b Vladimir Zapolskiy        2022-07-01  3301  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3302  		mdss: display-subsystem@ae00000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3303  			compatible = "qcom,sm8450-mdss";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3304  			reg = <0 0x0ae00000 0 0x1000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3305  			reg-names = "mdss";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3306  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3307  			/* same path used twice */
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3308  			interconnects = <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
4e125191e6cb00 Dmitry Baryshkov          2023-07-12  3309  					<&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
4e125191e6cb00 Dmitry Baryshkov          2023-07-12  3310  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
4e125191e6cb00 Dmitry Baryshkov          2023-07-12  3311  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
4e125191e6cb00 Dmitry Baryshkov          2023-07-12  3312  			interconnect-names = "mdp0-mem",
4e125191e6cb00 Dmitry Baryshkov          2023-07-12  3313  					     "mdp1-mem",
4e125191e6cb00 Dmitry Baryshkov          2023-07-12  3314  					     "cpu-cfg";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3315  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3316  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3317  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3318  			power-domains = <&dispcc MDSS_GDSC>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3319  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3320  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3321  				 <&gcc GCC_DISP_HF_AXI_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3322  				 <&gcc GCC_DISP_SF_AXI_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3323  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3324  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3325  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3326  			interrupt-controller;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3327  			#interrupt-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3328  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3329  			iommus = <&apps_smmu 0x2800 0x402>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3330  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3331  			#address-cells = <2>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3332  			#size-cells = <2>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3333  			ranges;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3334  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3335  			status = "disabled";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3336  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3337  			mdss_mdp: display-controller@ae01000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3338  				compatible = "qcom,sm8450-dpu";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3339  				reg = <0 0x0ae01000 0 0x8f000>,
62acfd77a57839 Dmitry Baryshkov          2025-04-15  3340  				      <0 0x0aeb0000 0 0x3000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3341  				reg-names = "mdp", "vbif";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3342  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3343  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3344  					<&gcc GCC_DISP_SF_AXI_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3345  					<&dispcc DISP_CC_MDSS_AHB_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3346  					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3347  					<&dispcc DISP_CC_MDSS_MDP_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3348  					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3349  				clock-names = "bus",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3350  					      "nrt_bus",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3351  					      "iface",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3352  					      "lut",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3353  					      "core",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3354  					      "vsync";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3355  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3356  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3357  				assigned-clock-rates = <19200000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3358  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3359  				operating-points-v2 = <&mdp_opp_table>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3360  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3361  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3362  				interrupt-parent = <&mdss>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3363  				interrupts = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3364  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3365  				ports {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3366  					#address-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3367  					#size-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3368  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3369  					port@0 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3370  						reg = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3371  						dpu_intf1_out: endpoint {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3372  							remote-endpoint = <&mdss_dsi0_in>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3373  						};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3374  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3375  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3376  					port@1 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3377  						reg = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3378  						dpu_intf2_out: endpoint {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3379  							remote-endpoint = <&mdss_dsi1_in>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3380  						};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3381  					};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3382  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3383  					port@2 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3384  						reg = <2>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3385  						dpu_intf0_out: endpoint {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3386  							remote-endpoint = <&mdss_dp0_in>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3387  						};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3388  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3389  				};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3390  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3391  				mdp_opp_table: opp-table {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3392  					compatible = "operating-points-v2";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3393  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3394  					opp-172000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3395  						opp-hz = /bits/ 64 <172000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3396  						required-opps = <&rpmhpd_opp_low_svs_d1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3397  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3398  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3399  					opp-200000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3400  						opp-hz = /bits/ 64 <200000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3401  						required-opps = <&rpmhpd_opp_low_svs>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3402  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3403  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3404  					opp-325000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3405  						opp-hz = /bits/ 64 <325000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3406  						required-opps = <&rpmhpd_opp_svs>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3407  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3408  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3409  					opp-375000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3410  						opp-hz = /bits/ 64 <375000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3411  						required-opps = <&rpmhpd_opp_svs_l1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3412  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3413  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3414  					opp-500000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3415  						opp-hz = /bits/ 64 <500000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3416  						required-opps = <&rpmhpd_opp_nom>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3417  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3418  				};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3419  			};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3420  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3421  			mdss_dp0: displayport-controller@ae90000 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3422  				compatible = "qcom,sm8450-dp", "qcom,sm8350-dp";
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3423  				reg = <0 0xae90000 0 0x200>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3424  				      <0 0xae90200 0 0x200>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3425  				      <0 0xae90400 0 0xc00>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3426  				      <0 0xae91000 0 0x400>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3427  				      <0 0xae91400 0 0x400>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3428  				interrupt-parent = <&mdss>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3429  				interrupts = <12>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3430  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3431  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3432  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3433  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3434  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3435  				clock-names = "core_iface",
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3436  					      "core_aux",
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3437  					      "ctrl_link",
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3438  					      "ctrl_link_iface",
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3439  					      "stream_pixel";
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3440  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3441  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3442  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3443  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3444  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3445  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3446  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3447  				phy-names = "dp";
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3448  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3449  				#sound-dai-cells = <0>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3450  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3451  				operating-points-v2 = <&dp_opp_table>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3452  				power-domains = <&rpmhpd RPMHPD_MMCX>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3453  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3454  				status = "disabled";
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3455  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3456  				ports {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3457  					#address-cells = <1>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3458  					#size-cells = <0>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3459  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3460  					port@0 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3461  						reg = <0>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3462  						mdss_dp0_in: endpoint {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3463  							remote-endpoint = <&dpu_intf0_out>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3464  						};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3465  					};
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3466  
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3467  					port@1 {
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3468  						reg = <1>;
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3469  
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3470  						mdss_dp0_out: endpoint {
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3471  							remote-endpoint = <&usb_1_qmpphy_dp_in>;
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3472  						};
a84f3627f9d976 Dmitry Baryshkov          2024-04-29  3473  		};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3474  				};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3475  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3476  				dp_opp_table: opp-table {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3477  					compatible = "operating-points-v2";
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3478  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3479  					opp-160000000 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3480  						opp-hz = /bits/ 64 <160000000>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3481  						required-opps = <&rpmhpd_opp_low_svs>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3482  					};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3483  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3484  					opp-270000000 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3485  						opp-hz = /bits/ 64 <270000000>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3486  						required-opps = <&rpmhpd_opp_svs>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3487  					};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3488  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3489  					opp-540000000 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3490  						opp-hz = /bits/ 64 <540000000>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3491  						required-opps = <&rpmhpd_opp_svs_l1>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3492  					};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3493  
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3494  					opp-810000000 {
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3495  						opp-hz = /bits/ 64 <810000000>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3496  						required-opps = <&rpmhpd_opp_nom>;
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3497  					};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3498  				};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3499  			};
bdd2f4ce5e762d Neil Armstrong            2023-03-17  3500  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3501  			mdss_dsi0: dsi@ae94000 {
b7f4f6971d62f0 Dmitry Baryshkov          2023-01-10  3502  				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3503  				reg = <0 0x0ae94000 0 0x400>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3504  				reg-names = "dsi_ctrl";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3505  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3506  				interrupt-parent = <&mdss>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3507  				interrupts = <4>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3508  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3509  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3510  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3511  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3512  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3513  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3514  					<&gcc GCC_DISP_HF_AXI_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3515  				clock-names = "byte",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3516  					      "byte_intf",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3517  					      "pixel",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3518  					      "core",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3519  					      "iface",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3520  					      "bus";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3521  
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3522  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3523  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3524  				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3525  							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3526  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3527  				operating-points-v2 = <&mdss_dsi_opp_table>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3528  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3529  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3530  				phys = <&mdss_dsi0_phy>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3531  				phy-names = "dsi";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3532  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3533  				#address-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3534  				#size-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3535  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3536  				status = "disabled";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3537  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3538  				ports {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3539  					#address-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3540  					#size-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3541  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3542  					port@0 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3543  						reg = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3544  						mdss_dsi0_in: endpoint {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3545  							remote-endpoint = <&dpu_intf1_out>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3546  						};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3547  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3548  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3549  					port@1 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3550  						reg = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3551  						mdss_dsi0_out: endpoint {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3552  						};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3553  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3554  				};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3555  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3556  				mdss_dsi_opp_table: opp-table {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3557  					compatible = "operating-points-v2";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3558  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3559  					opp-187500000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3560  						opp-hz = /bits/ 64 <187500000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3561  						required-opps = <&rpmhpd_opp_low_svs>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3562  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3563  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3564  					opp-300000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3565  						opp-hz = /bits/ 64 <300000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3566  						required-opps = <&rpmhpd_opp_svs>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3567  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3568  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3569  					opp-358000000 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3570  						opp-hz = /bits/ 64 <358000000>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3571  						required-opps = <&rpmhpd_opp_svs_l1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3572  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3573  				};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3574  			};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3575  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3576  			mdss_dsi0_phy: phy@ae94400 {
cce9c1d0b0168a Konrad Dybcio             2023-01-23  3577  				compatible = "qcom,sm8450-dsi-phy-5nm";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3578  				reg = <0 0x0ae94400 0 0x200>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3579  				      <0 0x0ae94600 0 0x280>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3580  				      <0 0x0ae94900 0 0x260>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3581  				reg-names = "dsi_phy",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3582  					    "dsi_phy_lane",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3583  					    "dsi_pll";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3584  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3585  				#clock-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3586  				#phy-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3587  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3588  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3589  					 <&rpmhcc RPMH_CXO_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3590  				clock-names = "iface", "ref";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3591  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3592  				status = "disabled";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3593  			};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3594  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3595  			mdss_dsi1: dsi@ae96000 {
b7f4f6971d62f0 Dmitry Baryshkov          2023-01-10  3596  				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3597  				reg = <0 0x0ae96000 0 0x400>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3598  				reg-names = "dsi_ctrl";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3599  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3600  				interrupt-parent = <&mdss>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3601  				interrupts = <5>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3602  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3603  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3604  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3605  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3606  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3607  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3608  					 <&gcc GCC_DISP_HF_AXI_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3609  				clock-names = "byte",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3610  					      "byte_intf",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3611  					      "pixel",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3612  					      "core",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3613  					      "iface",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3614  					      "bus";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3615  
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3616  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3617  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3618  				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3619  							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3620  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3621  				operating-points-v2 = <&mdss_dsi_opp_table>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3622  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3623  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3624  				phys = <&mdss_dsi1_phy>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3625  				phy-names = "dsi";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3626  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3627  				#address-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3628  				#size-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3629  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3630  				status = "disabled";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3631  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3632  				ports {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3633  					#address-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3634  					#size-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3635  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3636  					port@0 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3637  						reg = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3638  						mdss_dsi1_in: endpoint {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3639  							remote-endpoint = <&dpu_intf2_out>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3640  						};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3641  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3642  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3643  					port@1 {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3644  						reg = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3645  						mdss_dsi1_out: endpoint {
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3646  						};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3647  					};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3648  				};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3649  			};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3650  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3651  			mdss_dsi1_phy: phy@ae96400 {
cce9c1d0b0168a Konrad Dybcio             2023-01-23  3652  				compatible = "qcom,sm8450-dsi-phy-5nm";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3653  				reg = <0 0x0ae96400 0 0x200>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3654  				      <0 0x0ae96600 0 0x280>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3655  				      <0 0x0ae96900 0 0x260>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3656  				reg-names = "dsi_phy",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3657  					    "dsi_phy_lane",
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3658  					    "dsi_pll";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3659  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3660  				#clock-cells = <1>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3661  				#phy-cells = <0>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3662  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3663  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3664  					 <&rpmhcc RPMH_CXO_CLK>;
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3665  				clock-names = "iface", "ref";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3666  
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3667  				status = "disabled";
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3668  			};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3669  		};
a6dd1206e45a43 Dmitry Baryshkov          2022-12-07  3670  
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3671  		dispcc: clock-controller@af00000 {
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3672  			compatible = "qcom,sm8450-dispcc";
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3673  			reg = <0 0x0af00000 0 0x20000>;
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3674  			clocks = <&rpmhcc RPMH_CXO_CLK>,
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3675  				 <&rpmhcc RPMH_CXO_CLK_A>,
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3676  				 <&gcc GCC_DISP_AHB_CLK>,
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3677  				 <&sleep_clk>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3678  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3679  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3680  				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
0d18a031499d4e Krzysztof Kozlowski       2025-04-08  3681  				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
d3054cec1e9ea4 Neil Armstrong            2023-03-17  3682  				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
d3054cec1e9ea4 Neil Armstrong            2023-03-17  3683  				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3684  				 <0>, /* dp1 */
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3685  				 <0>,
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3686  				 <0>, /* dp2 */
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3687  				 <0>,
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3688  				 <0>, /* dp3 */
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3689  				 <0>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  3690  			power-domains = <&rpmhpd RPMHPD_MMCX>;
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3691  			required-opps = <&rpmhpd_opp_low_svs>;
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3692  			#clock-cells = <1>;
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3693  			#reset-cells = <1>;
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3694  			#power-domain-cells = <1>;
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3695  		};
65b35e04d26563 Dmitry Baryshkov          2022-09-09  3696  
5188049c9b36d7 Vinod Koul                2021-12-15  3697  		pdc: interrupt-controller@b220000 {
5188049c9b36d7 Vinod Koul                2021-12-15  3698  			compatible = "qcom,sm8450-pdc", "qcom,pdc";
5188049c9b36d7 Vinod Koul                2021-12-15  3699  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
5188049c9b36d7 Vinod Koul                2021-12-15  3700  			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
5188049c9b36d7 Vinod Koul                2021-12-15  3701  					  <94 609 31>, <125 63 1>, <126 716 12>;
5188049c9b36d7 Vinod Koul                2021-12-15  3702  			#interrupt-cells = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15  3703  			interrupt-parent = <&intc>;
5188049c9b36d7 Vinod Koul                2021-12-15  3704  			interrupt-controller;
5188049c9b36d7 Vinod Koul                2021-12-15  3705  		};
5188049c9b36d7 Vinod Koul                2021-12-15  3706  
48995e863307bf Vladimir Zapolskiy        2022-04-11  3707  		tsens0: thermal-sensor@c263000 {
48995e863307bf Vladimir Zapolskiy        2022-04-11  3708  			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
48995e863307bf Vladimir Zapolskiy        2022-04-11  3709  			reg = <0 0x0c263000 0 0x1000>, /* TM */
48995e863307bf Vladimir Zapolskiy        2022-04-11  3710  			      <0 0x0c222000 0 0x1000>; /* SROT */
48995e863307bf Vladimir Zapolskiy        2022-04-11  3711  			#qcom,sensors = <16>;
48995e863307bf Vladimir Zapolskiy        2022-04-11  3712  			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
48995e863307bf Vladimir Zapolskiy        2022-04-11  3713  				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
48995e863307bf Vladimir Zapolskiy        2022-04-11  3714  			interrupt-names = "uplow", "critical";
48995e863307bf Vladimir Zapolskiy        2022-04-11  3715  			#thermal-sensor-cells = <1>;
48995e863307bf Vladimir Zapolskiy        2022-04-11  3716  		};
48995e863307bf Vladimir Zapolskiy        2022-04-11  3717  
48995e863307bf Vladimir Zapolskiy        2022-04-11  3718  		tsens1: thermal-sensor@c265000 {
48995e863307bf Vladimir Zapolskiy        2022-04-11  3719  			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
48995e863307bf Vladimir Zapolskiy        2022-04-11  3720  			reg = <0 0x0c265000 0 0x1000>, /* TM */
48995e863307bf Vladimir Zapolskiy        2022-04-11  3721  			      <0 0x0c223000 0 0x1000>; /* SROT */
48995e863307bf Vladimir Zapolskiy        2022-04-11  3722  			#qcom,sensors = <16>;
48995e863307bf Vladimir Zapolskiy        2022-04-11  3723  			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
48995e863307bf Vladimir Zapolskiy        2022-04-11  3724  				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
48995e863307bf Vladimir Zapolskiy        2022-04-11  3725  			interrupt-names = "uplow", "critical";
48995e863307bf Vladimir Zapolskiy        2022-04-11  3726  			#thermal-sensor-cells = <1>;
48995e863307bf Vladimir Zapolskiy        2022-04-11  3727  		};
48995e863307bf Vladimir Zapolskiy        2022-04-11  3728  
bb99820dd284a9 Krzysztof Kozlowski       2022-12-13  3729  		aoss_qmp: power-management@c300000 {
1172729576fbbe Bjorn Andersson           2022-01-27  3730  			compatible = "qcom,sm8450-aoss-qmp", "qcom,aoss-qmp";
1172729576fbbe Bjorn Andersson           2022-01-27  3731  			reg = <0 0x0c300000 0 0x400>;
1172729576fbbe Bjorn Andersson           2022-01-27  3732  			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
1172729576fbbe Bjorn Andersson           2022-01-27  3733  						     IRQ_TYPE_EDGE_RISING>;
1172729576fbbe Bjorn Andersson           2022-01-27  3734  			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
1172729576fbbe Bjorn Andersson           2022-01-27  3735  
1172729576fbbe Bjorn Andersson           2022-01-27  3736  			#clock-cells = <0>;
1172729576fbbe Bjorn Andersson           2022-01-27  3737  		};
1172729576fbbe Bjorn Andersson           2022-01-27  3738  
6578747ae2d76c Konrad Dybcio             2023-08-11  3739  		sram@c3f0000 {
6578747ae2d76c Konrad Dybcio             2023-08-11  3740  			compatible = "qcom,rpmh-stats";
6578747ae2d76c Konrad Dybcio             2023-08-11  3741  			reg = <0 0x0c3f0000 0 0x400>;
6578747ae2d76c Konrad Dybcio             2023-08-11  3742  		};
6578747ae2d76c Konrad Dybcio             2023-08-11  3743  
f891f86e47c320 Vinod Koul                2022-12-29  3744  		spmi_bus: spmi@c400000 {
f891f86e47c320 Vinod Koul                2022-12-29  3745  			compatible = "qcom,spmi-pmic-arb";
f891f86e47c320 Vinod Koul                2022-12-29  3746  			reg = <0 0x0c400000 0 0x00003000>,
f891f86e47c320 Vinod Koul                2022-12-29  3747  			      <0 0x0c500000 0 0x00400000>,
f891f86e47c320 Vinod Koul                2022-12-29  3748  			      <0 0x0c440000 0 0x00080000>,
f891f86e47c320 Vinod Koul                2022-12-29  3749  			      <0 0x0c4c0000 0 0x00010000>,
f891f86e47c320 Vinod Koul                2022-12-29  3750  			      <0 0x0c42d000 0 0x00010000>;
f891f86e47c320 Vinod Koul                2022-12-29  3751  			reg-names = "core",
f891f86e47c320 Vinod Koul                2022-12-29  3752  				    "chnls",
f891f86e47c320 Vinod Koul                2022-12-29  3753  				    "obsrvr",
f891f86e47c320 Vinod Koul                2022-12-29  3754  				    "intr",
f891f86e47c320 Vinod Koul                2022-12-29  3755  				    "cnfg";
f891f86e47c320 Vinod Koul                2022-12-29  3756  			interrupt-names = "periph_irq";
f891f86e47c320 Vinod Koul                2022-12-29  3757  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
f891f86e47c320 Vinod Koul                2022-12-29  3758  			qcom,ee = <0>;
f891f86e47c320 Vinod Koul                2022-12-29  3759  			qcom,channel = <0>;
f891f86e47c320 Vinod Koul                2022-12-29  3760  			interrupt-controller;
f891f86e47c320 Vinod Koul                2022-12-29  3761  			#interrupt-cells = <4>;
f891f86e47c320 Vinod Koul                2022-12-29  3762  			#address-cells = <2>;
f891f86e47c320 Vinod Koul                2022-12-29  3763  			#size-cells = <0>;
f891f86e47c320 Vinod Koul                2022-12-29  3764  		};
f891f86e47c320 Vinod Koul                2022-12-29  3765  
1172729576fbbe Bjorn Andersson           2022-01-27  3766  		ipcc: mailbox@ed18000 {
1172729576fbbe Bjorn Andersson           2022-01-27  3767  			compatible = "qcom,sm8450-ipcc", "qcom,ipcc";
1172729576fbbe Bjorn Andersson           2022-01-27  3768  			reg = <0 0x0ed18000 0 0x1000>;
1172729576fbbe Bjorn Andersson           2022-01-27  3769  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
1172729576fbbe Bjorn Andersson           2022-01-27  3770  			interrupt-controller;
1172729576fbbe Bjorn Andersson           2022-01-27  3771  			#interrupt-cells = <3>;
1172729576fbbe Bjorn Andersson           2022-01-27  3772  			#mbox-cells = <2>;
1172729576fbbe Bjorn Andersson           2022-01-27  3773  		};
1172729576fbbe Bjorn Andersson           2022-01-27  3774  
ec950d55728459 Vinod Koul                2021-12-15  3775  		tlmm: pinctrl@f100000 {
ec950d55728459 Vinod Koul                2021-12-15  3776  			compatible = "qcom,sm8450-tlmm";
ec950d55728459 Vinod Koul                2021-12-15  3777  			reg = <0 0x0f100000 0 0x300000>;
ec950d55728459 Vinod Koul                2021-12-15  3778  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
ec950d55728459 Vinod Koul                2021-12-15  3779  			gpio-controller;
ec950d55728459 Vinod Koul                2021-12-15  3780  			#gpio-cells = <2>;
ec950d55728459 Vinod Koul                2021-12-15  3781  			interrupt-controller;
ec950d55728459 Vinod Koul                2021-12-15  3782  			#interrupt-cells = <2>;
ec950d55728459 Vinod Koul                2021-12-15  3783  			gpio-ranges = <&tlmm 0 0 211>;
ec950d55728459 Vinod Koul                2021-12-15  3784  			wakeup-parent = <&pdc>;
ec950d55728459 Vinod Koul                2021-12-15  3785  
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3786  			sdc2_default_state: sdc2-default-state {
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3787  				clk-pins {
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3788  					pins = "sdc2_clk";
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3789  					drive-strength = <16>;
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3790  					bias-disable;
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3791  				};
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3792  
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3793  				cmd-pins {
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3794  					pins = "sdc2_cmd";
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3795  					drive-strength = <16>;
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3796  					bias-pull-up;
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3797  				};
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3798  
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3799  				data-pins {
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3800  					pins = "sdc2_data";
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3801  					drive-strength = <16>;
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3802  					bias-pull-up;
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3803  				};
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3804  			};
a0646262ec94fa Krzysztof Kozlowski       2022-10-26  3805  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3806  			sdc2_sleep_state: sdc2-sleep-state {
a73747528867fa Krzysztof Kozlowski       2022-09-12  3807  				clk-pins {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3808  					pins = "sdc2_clk";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3809  					drive-strength = <2>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3810  					bias-disable;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3811  				};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3812  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3813  				cmd-pins {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3814  					pins = "sdc2_cmd";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3815  					drive-strength = <2>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3816  					bias-pull-up;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3817  				};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3818  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3819  				data-pins {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3820  					pins = "sdc2_data";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3821  					drive-strength = <2>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3822  					bias-pull-up;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3823  				};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3824  			};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  3825  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3826  			cci0_default: cci0-default-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3827  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3828  				pins = "gpio110", "gpio111";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3829  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3830  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3831  				bias-pull-up;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3832  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3833  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3834  			cci0_sleep: cci0-sleep-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3835  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3836  				pins = "gpio110", "gpio111";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3837  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3838  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3839  				bias-pull-down;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3840  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3841  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3842  			cci1_default: cci1-default-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3843  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3844  				pins = "gpio112", "gpio113";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3845  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3846  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3847  				bias-pull-up;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3848  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3849  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3850  			cci1_sleep: cci1-sleep-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3851  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3852  				pins = "gpio112", "gpio113";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3853  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3854  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3855  				bias-pull-down;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3856  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3857  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3858  			cci2_default: cci2-default-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3859  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3860  				pins = "gpio114", "gpio115";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3861  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3862  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3863  				bias-pull-up;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3864  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3865  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3866  			cci2_sleep: cci2-sleep-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3867  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3868  				pins = "gpio114", "gpio115";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3869  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3870  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3871  				bias-pull-down;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3872  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3873  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3874  			cci3_default: cci3-default-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3875  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3876  				pins = "gpio208", "gpio209";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3877  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3878  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3879  				bias-pull-up;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3880  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3881  
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3882  			cci3_sleep: cci3-sleep-state {
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3883  				/* SDA, SCL */
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3884  				pins = "gpio208", "gpio209";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3885  				function = "cci_i2c";
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3886  				drive-strength = <2>;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3887  				bias-pull-down;
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3888  			};
b318c53e9c383b Vladimir Zapolskiy        2022-09-01  3889  
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3890  			pcie0_default_state: pcie0-default-state {
a73747528867fa Krzysztof Kozlowski       2022-09-12  3891  				perst-pins {
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3892  					pins = "gpio94";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3893  					function = "gpio";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3894  					drive-strength = <2>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3895  					bias-pull-down;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3896  				};
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3897  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3898  				clkreq-pins {
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3899  					pins = "gpio95";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3900  					function = "pcie0_clkreqn";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3901  					drive-strength = <2>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3902  					bias-pull-up;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3903  				};
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3904  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3905  				wake-pins {
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3906  					pins = "gpio96";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3907  					function = "gpio";
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3908  					drive-strength = <2>;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3909  					bias-pull-up;
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3910  				};
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3911  			};
7b09b1b47335b7 Dmitry Baryshkov          2022-03-01  3912  
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3913  			pcie1_default_state: pcie1-default-state {
a73747528867fa Krzysztof Kozlowski       2022-09-12  3914  				perst-pins {
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3915  					pins = "gpio97";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3916  					function = "gpio";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3917  					drive-strength = <2>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3918  					bias-pull-down;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3919  				};
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3920  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3921  				clkreq-pins {
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3922  					pins = "gpio98";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3923  					function = "pcie1_clkreqn";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3924  					drive-strength = <2>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3925  					bias-pull-up;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3926  				};
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3927  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3928  				wake-pins {
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3929  					pins = "gpio99";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3930  					function = "gpio";
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3931  					drive-strength = <2>;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3932  					bias-pull-up;
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3933  				};
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3934  			};
bc6588bc25fb30 Dmitry Baryshkov          2022-03-01  3935  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3936  			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3937  				pins = "gpio0", "gpio1";
a84e88e9a00334 Vinod Koul                2022-04-14  3938  				function = "qup0";
a84e88e9a00334 Vinod Koul                2022-04-14  3939  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3940  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3941  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3942  				pins = "gpio4", "gpio5";
a84e88e9a00334 Vinod Koul                2022-04-14  3943  				function = "qup1";
a84e88e9a00334 Vinod Koul                2022-04-14  3944  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3945  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3946  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3947  				pins = "gpio8", "gpio9";
a84e88e9a00334 Vinod Koul                2022-04-14  3948  				function = "qup2";
a84e88e9a00334 Vinod Koul                2022-04-14  3949  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3950  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3951  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3952  				pins = "gpio12", "gpio13";
a84e88e9a00334 Vinod Koul                2022-04-14  3953  				function = "qup3";
a84e88e9a00334 Vinod Koul                2022-04-14  3954  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3955  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3956  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3957  				pins = "gpio16", "gpio17";
a84e88e9a00334 Vinod Koul                2022-04-14  3958  				function = "qup4";
a84e88e9a00334 Vinod Koul                2022-04-14  3959  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3960  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3961  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3962  				pins = "gpio206", "gpio207";
a84e88e9a00334 Vinod Koul                2022-04-14  3963  				function = "qup5";
a84e88e9a00334 Vinod Koul                2022-04-14  3964  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3965  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3966  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  3967  				pins = "gpio20", "gpio21";
a84e88e9a00334 Vinod Koul                2022-04-14  3968  				function = "qup6";
a84e88e9a00334 Vinod Koul                2022-04-14  3969  			};
a84e88e9a00334 Vinod Koul                2022-04-14  3970  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3971  			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  3972  				pins = "gpio28", "gpio29";
1a380216fd6fcf Vinod Koul                2022-04-14  3973  				function = "qup8";
1a380216fd6fcf Vinod Koul                2022-04-14  3974  			};
1a380216fd6fcf Vinod Koul                2022-04-14  3975  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3976  			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  3977  				pins = "gpio32", "gpio33";
1a380216fd6fcf Vinod Koul                2022-04-14  3978  				function = "qup9";
1a380216fd6fcf Vinod Koul                2022-04-14  3979  			};
1a380216fd6fcf Vinod Koul                2022-04-14  3980  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3981  			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  3982  				pins = "gpio36", "gpio37";
1a380216fd6fcf Vinod Koul                2022-04-14  3983  				function = "qup10";
1a380216fd6fcf Vinod Koul                2022-04-14  3984  			};
1a380216fd6fcf Vinod Koul                2022-04-14  3985  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3986  			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  3987  				pins = "gpio40", "gpio41";
1a380216fd6fcf Vinod Koul                2022-04-14  3988  				function = "qup11";
1a380216fd6fcf Vinod Koul                2022-04-14  3989  			};
1a380216fd6fcf Vinod Koul                2022-04-14  3990  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3991  			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  3992  				pins = "gpio44", "gpio45";
1a380216fd6fcf Vinod Koul                2022-04-14  3993  				function = "qup12";
1a380216fd6fcf Vinod Koul                2022-04-14  3994  			};
1a380216fd6fcf Vinod Koul                2022-04-14  3995  
a73747528867fa Krzysztof Kozlowski       2022-09-12  3996  			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  3997  				pins = "gpio48", "gpio49";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  3998  				function = "qup13";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  3999  				drive-strength = <2>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4000  				bias-pull-up;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4001  			};
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4002  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4003  			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4004  				pins = "gpio52", "gpio53";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4005  				function = "qup14";
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4006  				drive-strength = <2>;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4007  				bias-pull-up;
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4008  			};
bf0a257a9418eb Dmitry Baryshkov          2021-12-15  4009  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4010  			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4011  				pins = "gpio56", "gpio57";
ba640cd31342b4 Vinod Koul                2022-04-14  4012  				function = "qup15";
ba640cd31342b4 Vinod Koul                2022-04-14  4013  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4014  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4015  			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4016  				pins = "gpio60", "gpio61";
ba640cd31342b4 Vinod Koul                2022-04-14  4017  				function = "qup16";
ba640cd31342b4 Vinod Koul                2022-04-14  4018  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4019  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4020  			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4021  				pins = "gpio64", "gpio65";
ba640cd31342b4 Vinod Koul                2022-04-14  4022  				function = "qup17";
ba640cd31342b4 Vinod Koul                2022-04-14  4023  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4024  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4025  			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4026  				pins = "gpio68", "gpio69";
ba640cd31342b4 Vinod Koul                2022-04-14  4027  				function = "qup18";
ba640cd31342b4 Vinod Koul                2022-04-14  4028  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4029  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4030  			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4031  				pins = "gpio72", "gpio73";
ba640cd31342b4 Vinod Koul                2022-04-14  4032  				function = "qup19";
ba640cd31342b4 Vinod Koul                2022-04-14  4033  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4034  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4035  			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4036  				pins = "gpio76", "gpio77";
ba640cd31342b4 Vinod Koul                2022-04-14  4037  				function = "qup20";
ba640cd31342b4 Vinod Koul                2022-04-14  4038  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4039  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4040  			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4041  				pins = "gpio80", "gpio81";
ba640cd31342b4 Vinod Koul                2022-04-14  4042  				function = "qup21";
ba640cd31342b4 Vinod Koul                2022-04-14  4043  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4044  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4045  			qup_spi0_cs: qup-spi0-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4046  				pins = "gpio3";
a84e88e9a00334 Vinod Koul                2022-04-14  4047  				function = "qup0";
a84e88e9a00334 Vinod Koul                2022-04-14  4048  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4049  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4050  			qup_spi0_data_clk: qup-spi0-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4051  				pins = "gpio0", "gpio1", "gpio2";
a84e88e9a00334 Vinod Koul                2022-04-14  4052  				function = "qup0";
a84e88e9a00334 Vinod Koul                2022-04-14  4053  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4054  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4055  			qup_spi1_cs: qup-spi1-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4056  				pins = "gpio7";
a84e88e9a00334 Vinod Koul                2022-04-14  4057  				function = "qup1";
a84e88e9a00334 Vinod Koul                2022-04-14  4058  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4059  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4060  			qup_spi1_data_clk: qup-spi1-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4061  				pins = "gpio4", "gpio5", "gpio6";
a84e88e9a00334 Vinod Koul                2022-04-14  4062  				function = "qup1";
a84e88e9a00334 Vinod Koul                2022-04-14  4063  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4064  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4065  			qup_spi2_cs: qup-spi2-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4066  				pins = "gpio11";
a84e88e9a00334 Vinod Koul                2022-04-14  4067  				function = "qup2";
a84e88e9a00334 Vinod Koul                2022-04-14  4068  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4069  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4070  			qup_spi2_data_clk: qup-spi2-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4071  				pins = "gpio8", "gpio9", "gpio10";
a84e88e9a00334 Vinod Koul                2022-04-14  4072  				function = "qup2";
a84e88e9a00334 Vinod Koul                2022-04-14  4073  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4074  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4075  			qup_spi3_cs: qup-spi3-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4076  				pins = "gpio15";
a84e88e9a00334 Vinod Koul                2022-04-14  4077  				function = "qup3";
a84e88e9a00334 Vinod Koul                2022-04-14  4078  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4079  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4080  			qup_spi3_data_clk: qup-spi3-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4081  				pins = "gpio12", "gpio13", "gpio14";
a84e88e9a00334 Vinod Koul                2022-04-14  4082  				function = "qup3";
a84e88e9a00334 Vinod Koul                2022-04-14  4083  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4084  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4085  			qup_spi4_cs: qup-spi4-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4086  				pins = "gpio19";
a84e88e9a00334 Vinod Koul                2022-04-14  4087  				function = "qup4";
a84e88e9a00334 Vinod Koul                2022-04-14  4088  				drive-strength = <6>;
a84e88e9a00334 Vinod Koul                2022-04-14  4089  				bias-disable;
a84e88e9a00334 Vinod Koul                2022-04-14  4090  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4091  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4092  			qup_spi4_data_clk: qup-spi4-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4093  				pins = "gpio16", "gpio17", "gpio18";
a84e88e9a00334 Vinod Koul                2022-04-14  4094  				function = "qup4";
a84e88e9a00334 Vinod Koul                2022-04-14  4095  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4096  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4097  			qup_spi5_cs: qup-spi5-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4098  				pins = "gpio85";
a84e88e9a00334 Vinod Koul                2022-04-14  4099  				function = "qup5";
a84e88e9a00334 Vinod Koul                2022-04-14  4100  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4101  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4102  			qup_spi5_data_clk: qup-spi5-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4103  				pins = "gpio206", "gpio207", "gpio84";
a84e88e9a00334 Vinod Koul                2022-04-14  4104  				function = "qup5";
a84e88e9a00334 Vinod Koul                2022-04-14  4105  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4106  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4107  			qup_spi6_cs: qup-spi6-cs-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4108  				pins = "gpio23";
a84e88e9a00334 Vinod Koul                2022-04-14  4109  				function = "qup6";
a84e88e9a00334 Vinod Koul                2022-04-14  4110  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4111  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4112  			qup_spi6_data_clk: qup-spi6-data-clk-state {
a84e88e9a00334 Vinod Koul                2022-04-14  4113  				pins = "gpio20", "gpio21", "gpio22";
a84e88e9a00334 Vinod Koul                2022-04-14  4114  				function = "qup6";
a84e88e9a00334 Vinod Koul                2022-04-14  4115  			};
a84e88e9a00334 Vinod Koul                2022-04-14  4116  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4117  			qup_spi8_cs: qup-spi8-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4118  				pins = "gpio31";
1a380216fd6fcf Vinod Koul                2022-04-14  4119  				function = "qup8";
1a380216fd6fcf Vinod Koul                2022-04-14  4120  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4121  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4122  			qup_spi8_data_clk: qup-spi8-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4123  				pins = "gpio28", "gpio29", "gpio30";
1a380216fd6fcf Vinod Koul                2022-04-14  4124  				function = "qup8";
1a380216fd6fcf Vinod Koul                2022-04-14  4125  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4126  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4127  			qup_spi9_cs: qup-spi9-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4128  				pins = "gpio35";
1a380216fd6fcf Vinod Koul                2022-04-14  4129  				function = "qup9";
1a380216fd6fcf Vinod Koul                2022-04-14  4130  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4131  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4132  			qup_spi9_data_clk: qup-spi9-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4133  				pins = "gpio32", "gpio33", "gpio34";
1a380216fd6fcf Vinod Koul                2022-04-14  4134  				function = "qup9";
1a380216fd6fcf Vinod Koul                2022-04-14  4135  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4136  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4137  			qup_spi10_cs: qup-spi10-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4138  				pins = "gpio39";
1a380216fd6fcf Vinod Koul                2022-04-14  4139  				function = "qup10";
1a380216fd6fcf Vinod Koul                2022-04-14  4140  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4141  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4142  			qup_spi10_data_clk: qup-spi10-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4143  				pins = "gpio36", "gpio37", "gpio38";
1a380216fd6fcf Vinod Koul                2022-04-14  4144  				function = "qup10";
1a380216fd6fcf Vinod Koul                2022-04-14  4145  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4146  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4147  			qup_spi11_cs: qup-spi11-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4148  				pins = "gpio43";
1a380216fd6fcf Vinod Koul                2022-04-14  4149  				function = "qup11";
1a380216fd6fcf Vinod Koul                2022-04-14  4150  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4151  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4152  			qup_spi11_data_clk: qup-spi11-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4153  				pins = "gpio40", "gpio41", "gpio42";
1a380216fd6fcf Vinod Koul                2022-04-14  4154  				function = "qup11";
1a380216fd6fcf Vinod Koul                2022-04-14  4155  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4156  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4157  			qup_spi12_cs: qup-spi12-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4158  				pins = "gpio47";
1a380216fd6fcf Vinod Koul                2022-04-14  4159  				function = "qup12";
1a380216fd6fcf Vinod Koul                2022-04-14  4160  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4161  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4162  			qup_spi12_data_clk: qup-spi12-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4163  				pins = "gpio44", "gpio45", "gpio46";
1a380216fd6fcf Vinod Koul                2022-04-14  4164  				function = "qup12";
1a380216fd6fcf Vinod Koul                2022-04-14  4165  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4166  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4167  			qup_spi13_cs: qup-spi13-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4168  				pins = "gpio51";
1a380216fd6fcf Vinod Koul                2022-04-14  4169  				function = "qup13";
1a380216fd6fcf Vinod Koul                2022-04-14  4170  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4171  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4172  			qup_spi13_data_clk: qup-spi13-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4173  				pins = "gpio48", "gpio49", "gpio50";
1a380216fd6fcf Vinod Koul                2022-04-14  4174  				function = "qup13";
1a380216fd6fcf Vinod Koul                2022-04-14  4175  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4176  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4177  			qup_spi14_cs: qup-spi14-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4178  				pins = "gpio55";
1a380216fd6fcf Vinod Koul                2022-04-14  4179  				function = "qup14";
1a380216fd6fcf Vinod Koul                2022-04-14  4180  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4181  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4182  			qup_spi14_data_clk: qup-spi14-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4183  				pins = "gpio52", "gpio53", "gpio54";
1a380216fd6fcf Vinod Koul                2022-04-14  4184  				function = "qup14";
1a380216fd6fcf Vinod Koul                2022-04-14  4185  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4186  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4187  			qup_spi15_cs: qup-spi15-cs-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4188  				pins = "gpio59";
1a380216fd6fcf Vinod Koul                2022-04-14  4189  				function = "qup15";
1a380216fd6fcf Vinod Koul                2022-04-14  4190  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4191  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4192  			qup_spi15_data_clk: qup-spi15-data-clk-state {
1a380216fd6fcf Vinod Koul                2022-04-14  4193  				pins = "gpio56", "gpio57", "gpio58";
1a380216fd6fcf Vinod Koul                2022-04-14  4194  				function = "qup15";
1a380216fd6fcf Vinod Koul                2022-04-14  4195  			};
1a380216fd6fcf Vinod Koul                2022-04-14  4196  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4197  			qup_spi16_cs: qup-spi16-cs-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4198  				pins = "gpio63";
ba640cd31342b4 Vinod Koul                2022-04-14  4199  				function = "qup16";
ba640cd31342b4 Vinod Koul                2022-04-14  4200  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4201  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4202  			qup_spi16_data_clk: qup-spi16-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4203  				pins = "gpio60", "gpio61", "gpio62";
ba640cd31342b4 Vinod Koul                2022-04-14  4204  				function = "qup16";
ba640cd31342b4 Vinod Koul                2022-04-14  4205  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4206  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4207  			qup_spi17_cs: qup-spi17-cs-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4208  				pins = "gpio67";
ba640cd31342b4 Vinod Koul                2022-04-14  4209  				function = "qup17";
ba640cd31342b4 Vinod Koul                2022-04-14  4210  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4211  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4212  			qup_spi17_data_clk: qup-spi17-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4213  				pins = "gpio64", "gpio65", "gpio66";
ba640cd31342b4 Vinod Koul                2022-04-14  4214  				function = "qup17";
ba640cd31342b4 Vinod Koul                2022-04-14  4215  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4216  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4217  			qup_spi18_cs: qup-spi18-cs-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4218  				pins = "gpio71";
ba640cd31342b4 Vinod Koul                2022-04-14  4219  				function = "qup18";
ba640cd31342b4 Vinod Koul                2022-04-14  4220  				drive-strength = <6>;
ba640cd31342b4 Vinod Koul                2022-04-14  4221  				bias-disable;
ba640cd31342b4 Vinod Koul                2022-04-14  4222  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4223  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4224  			qup_spi18_data_clk: qup-spi18-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4225  				pins = "gpio68", "gpio69", "gpio70";
ba640cd31342b4 Vinod Koul                2022-04-14  4226  				function = "qup18";
ba640cd31342b4 Vinod Koul                2022-04-14  4227  				drive-strength = <6>;
ba640cd31342b4 Vinod Koul                2022-04-14  4228  				bias-disable;
ba640cd31342b4 Vinod Koul                2022-04-14  4229  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4230  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4231  			qup_spi19_cs: qup-spi19-cs-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4232  				pins = "gpio75";
ba640cd31342b4 Vinod Koul                2022-04-14  4233  				function = "qup19";
ba640cd31342b4 Vinod Koul                2022-04-14  4234  				drive-strength = <6>;
ba640cd31342b4 Vinod Koul                2022-04-14  4235  				bias-disable;
ba640cd31342b4 Vinod Koul                2022-04-14  4236  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4237  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4238  			qup_spi19_data_clk: qup-spi19-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4239  				pins = "gpio72", "gpio73", "gpio74";
ba640cd31342b4 Vinod Koul                2022-04-14  4240  				function = "qup19";
ba640cd31342b4 Vinod Koul                2022-04-14  4241  				drive-strength = <6>;
ba640cd31342b4 Vinod Koul                2022-04-14  4242  				bias-disable;
ba640cd31342b4 Vinod Koul                2022-04-14  4243  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4244  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4245  			qup_spi20_cs: qup-spi20-cs-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4246  				pins = "gpio79";
ba640cd31342b4 Vinod Koul                2022-04-14  4247  				function = "qup20";
ba640cd31342b4 Vinod Koul                2022-04-14  4248  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4249  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4250  			qup_spi20_data_clk: qup-spi20-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4251  				pins = "gpio76", "gpio77", "gpio78";
ba640cd31342b4 Vinod Koul                2022-04-14  4252  				function = "qup20";
ba640cd31342b4 Vinod Koul                2022-04-14  4253  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4254  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4255  			qup_spi21_cs: qup-spi21-cs-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4256  				pins = "gpio83";
ba640cd31342b4 Vinod Koul                2022-04-14  4257  				function = "qup21";
ba640cd31342b4 Vinod Koul                2022-04-14  4258  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4259  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4260  			qup_spi21_data_clk: qup-spi21-data-clk-state {
ba640cd31342b4 Vinod Koul                2022-04-14  4261  				pins = "gpio80", "gpio81", "gpio82";
ba640cd31342b4 Vinod Koul                2022-04-14  4262  				function = "qup21";
ba640cd31342b4 Vinod Koul                2022-04-14  4263  			};
ba640cd31342b4 Vinod Koul                2022-04-14  4264  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4265  			qup_uart7_rx: qup-uart7-rx-state {
ec950d55728459 Vinod Koul                2021-12-15  4266  				pins = "gpio26";
ec950d55728459 Vinod Koul                2021-12-15  4267  				function = "qup7";
ec950d55728459 Vinod Koul                2021-12-15  4268  				drive-strength = <2>;
ec950d55728459 Vinod Koul                2021-12-15  4269  				bias-disable;
ec950d55728459 Vinod Koul                2021-12-15  4270  			};
ec950d55728459 Vinod Koul                2021-12-15  4271  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4272  			qup_uart7_tx: qup-uart7-tx-state {
ec950d55728459 Vinod Koul                2021-12-15  4273  				pins = "gpio27";
ec950d55728459 Vinod Koul                2021-12-15  4274  				function = "qup7";
ec950d55728459 Vinod Koul                2021-12-15  4275  				drive-strength = <2>;
ec950d55728459 Vinod Koul                2021-12-15  4276  				bias-disable;
ec950d55728459 Vinod Koul                2021-12-15  4277  			};
f5837418479a3f Dmitry Baryshkov          2022-05-02  4278  
a73747528867fa Krzysztof Kozlowski       2022-09-12  4279  			qup_uart20_default: qup-uart20-default-state {
f5837418479a3f Dmitry Baryshkov          2022-05-02  4280  				pins = "gpio76", "gpio77", "gpio78", "gpio79";
f5837418479a3f Dmitry Baryshkov          2022-05-02  4281  				function = "qup20";
f5837418479a3f Dmitry Baryshkov          2022-05-02  4282  			};
ec950d55728459 Vinod Koul                2021-12-15  4283  		};
ec950d55728459 Vinod Koul                2021-12-15  4284  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4285  		lpass_tlmm: pinctrl@3440000 {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4286  			compatible = "qcom,sm8450-lpass-lpi-pinctrl";
a58cde4d66e18a Konrad Dybcio             2023-01-02  4287  			reg = <0 0x03440000 0x0 0x20000>,
a58cde4d66e18a Konrad Dybcio             2023-01-02  4288  			      <0 0x034d0000 0x0 0x10000>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4289  			gpio-controller;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4290  			#gpio-cells = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4291  			gpio-ranges = <&lpass_tlmm 0 0 23>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4292  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4293  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4294  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4295  			clock-names = "core", "audio";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4296  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4297  			tx_swr_active: tx-swr-active-state {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4298  				clk-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4299  					pins = "gpio0";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4300  					function = "swr_tx_clk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4301  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4302  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4303  					bias-disable;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4304  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4305  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4306  				data-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4307  					pins = "gpio1", "gpio2", "gpio14";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4308  					function = "swr_tx_data";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4309  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4310  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4311  					bias-bus-hold;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4312  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4313  			};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4314  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4315  			rx_swr_active: rx-swr-active-state {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4316  				clk-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4317  					pins = "gpio3";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4318  					function = "swr_rx_clk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4319  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4320  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4321  					bias-disable;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4322  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4323  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4324  				data-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4325  					pins = "gpio4", "gpio5";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4326  					function = "swr_rx_data";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4327  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4328  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4329  					bias-bus-hold;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4330  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4331  			};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4332  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4333  			dmic01_default: dmic01-default-state {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4334  				clk-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4335  					pins = "gpio6";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4336  					function = "dmic1_clk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4337  					drive-strength = <8>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4338  					output-high;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4339  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4340  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4341  				data-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4342  					pins = "gpio7";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4343  					function = "dmic1_data";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4344  					drive-strength = <8>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4345  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4346  			};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4347  
0d3eb7ff1f3a99 Krzysztof Kozlowski       2024-02-12  4348  			dmic23_default: dmic23-default-state {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4349  				clk-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4350  					pins = "gpio8";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4351  					function = "dmic2_clk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4352  					drive-strength = <8>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4353  					output-high;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4354  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4355  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4356  				data-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4357  					pins = "gpio9";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4358  					function = "dmic2_data";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4359  					drive-strength = <8>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4360  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4361  			};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4362  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4363  			wsa_swr_active: wsa-swr-active-state {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4364  				clk-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4365  					pins = "gpio10";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4366  					function = "wsa_swr_clk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4367  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4368  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4369  					bias-disable;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4370  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4371  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4372  				data-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4373  					pins = "gpio11";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4374  					function = "wsa_swr_data";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4375  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4376  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4377  					bias-bus-hold;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4378  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4379  			};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4380  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4381  			wsa2_swr_active: wsa2-swr-active-state {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4382  				clk-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4383  					pins = "gpio15";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4384  					function = "wsa2_swr_clk";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4385  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4386  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4387  					bias-disable;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4388  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4389  
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4390  				data-pins {
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4391  					pins = "gpio16";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4392  					function = "wsa2_swr_data";
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4393  					drive-strength = <2>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4394  					slew-rate = <1>;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4395  					bias-bus-hold;
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4396  				};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4397  			};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4398  		};
14341e76dbc7e1 Srinivas Kandagatla       2022-12-02  4399  
6e8637db89bf13 Mao Jinlong               2025-01-07  4400  		stm@10002000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4401  			compatible = "arm,coresight-stm", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4402  			reg = <0x0 0x10002000 0x0 0x1000>,
6e8637db89bf13 Mao Jinlong               2025-01-07  4403  				<0x0 0x16280000 0x0 0x180000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4404  			reg-names = "stm-base", "stm-stimulus-base";
6e8637db89bf13 Mao Jinlong               2025-01-07  4405  
6e8637db89bf13 Mao Jinlong               2025-01-07  4406  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4407  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4408  
6e8637db89bf13 Mao Jinlong               2025-01-07  4409  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4410  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4411  					stm_out_funnel_in0: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4412  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4413  							<&funnel_in0_in_stm>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4414  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4415  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4416  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4417  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4418  
6e8637db89bf13 Mao Jinlong               2025-01-07  4419  		funnel@10041000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4420  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4421  			reg = <0x0 0x10041000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4422  
6e8637db89bf13 Mao Jinlong               2025-01-07  4423  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4424  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4425  
6e8637db89bf13 Mao Jinlong               2025-01-07  4426  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4427  				#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4428  				#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4429  
6e8637db89bf13 Mao Jinlong               2025-01-07  4430  				port@7 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4431  					reg = <7>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4432  					funnel_in0_in_stm: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4433  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4434  							<&stm_out_funnel_in0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4435  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4436  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4437  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4438  
6e8637db89bf13 Mao Jinlong               2025-01-07  4439  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4440  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4441  					funnel_in0_out_funnel_qdss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4442  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4443  							<&funnel_qdss_in_funnel_in0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4444  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4445  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4446  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4447  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4448  
6e8637db89bf13 Mao Jinlong               2025-01-07  4449  		funnel@10042000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4450  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4451  
6e8637db89bf13 Mao Jinlong               2025-01-07  4452  			reg = <0x0 0x10042000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4453  
6e8637db89bf13 Mao Jinlong               2025-01-07  4454  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4455  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4456  
6e8637db89bf13 Mao Jinlong               2025-01-07  4457  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4458  				#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4459  				#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4460  
6e8637db89bf13 Mao Jinlong               2025-01-07  4461  				port@4 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4462  					reg = <4>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4463  					funnel_in1_in_funnel_apss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4464  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4465  							<&funnel_apss_out_funnel_in1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4466  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4467  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4468  
6e8637db89bf13 Mao Jinlong               2025-01-07  4469  				port@6 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4470  					reg = <6>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4471  					funnel_in1_in_funnel_dl_center: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4472  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4473  							<&funnel_dl_center_out_funnel_in1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4474  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4475  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4476  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4477  
6e8637db89bf13 Mao Jinlong               2025-01-07  4478  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4479  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4480  					funnel_in1_out_funnel_qdss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4481  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4482  							<&funnel_qdss_in_funnel_in1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4483  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4484  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4485  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4486  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4487  
6e8637db89bf13 Mao Jinlong               2025-01-07  4488  		funnel@10045000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4489  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4490  			reg = <0x0 0x10045000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4491  
6e8637db89bf13 Mao Jinlong               2025-01-07  4492  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4493  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4494  
6e8637db89bf13 Mao Jinlong               2025-01-07  4495  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4496  				#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4497  				#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4498  
6e8637db89bf13 Mao Jinlong               2025-01-07  4499  				port@0 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4500  					reg = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4501  					funnel_qdss_in_funnel_in0: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4502  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4503  							<&funnel_in0_out_funnel_qdss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4504  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4505  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4506  
6e8637db89bf13 Mao Jinlong               2025-01-07  4507  				port@1 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4508  					reg = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4509  					funnel_qdss_in_funnel_in1: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4510  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4511  							<&funnel_in1_out_funnel_qdss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4512  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4513  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4514  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4515  
6e8637db89bf13 Mao Jinlong               2025-01-07  4516  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4517  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4518  					funnel_qdss_out_funnel_aoss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4519  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4520  							<&funnel_aoss_in_funnel_qdss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4521  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4522  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4523  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4524  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4525  
6e8637db89bf13 Mao Jinlong               2025-01-07  4526  		replicator@10046000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4527  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4528  			reg = <0x0 0x10046000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4529  
6e8637db89bf13 Mao Jinlong               2025-01-07  4530  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4531  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4532  
6e8637db89bf13 Mao Jinlong               2025-01-07  4533  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4534  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4535  					replicator_qdss_in_replicator_swao: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4536  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4537  							<&replicator_swao_out_replicator_qdss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4538  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4539  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4540  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4541  
6e8637db89bf13 Mao Jinlong               2025-01-07  4542  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4543  
6e8637db89bf13 Mao Jinlong               2025-01-07  4544  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4545  					replicator_qdss_out_replicator_etr: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4546  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4547  							<&replicator_etr_in_replicator_qdss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4548  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4549  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4550  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4551  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4552  
6e8637db89bf13 Mao Jinlong               2025-01-07  4553  		tmc_etr: tmc@10048000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4554  			compatible = "arm,coresight-tmc", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4555  			reg = <0x0 0x10048000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4556  
6e8637db89bf13 Mao Jinlong               2025-01-07  4557  			iommus = <&apps_smmu 0x0600 0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4558  			arm,buffer-size = <0x10000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4559  
6e8637db89bf13 Mao Jinlong               2025-01-07  4560  			arm,scatter-gather;
6e8637db89bf13 Mao Jinlong               2025-01-07  4561  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4562  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4563  
6e8637db89bf13 Mao Jinlong               2025-01-07  4564  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4565  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4566  					tmc_etr_in_replicator_etr: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4567  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4568  							<&replicator_etr_out_tmc_etr>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4569  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4570  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4571  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4572  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4573  
6e8637db89bf13 Mao Jinlong               2025-01-07  4574  		replicator@1004e000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4575  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4576  			reg = <0x0 0x1004e000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4577  
6e8637db89bf13 Mao Jinlong               2025-01-07  4578  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4579  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4580  
6e8637db89bf13 Mao Jinlong               2025-01-07  4581  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4582  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4583  					replicator_etr_in_replicator_qdss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4584  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4585  							<&replicator_qdss_out_replicator_etr>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4586  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4587  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4588  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4589  
6e8637db89bf13 Mao Jinlong               2025-01-07  4590  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4591  
6e8637db89bf13 Mao Jinlong               2025-01-07  4592  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4593  
6e8637db89bf13 Mao Jinlong               2025-01-07  4594  					replicator_etr_out_tmc_etr: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4595  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4596  							<&tmc_etr_in_replicator_etr>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4597  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4598  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4599  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4600  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4601  
6e8637db89bf13 Mao Jinlong               2025-01-07  4602  		funnel@10b04000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4603  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4604  
6e8637db89bf13 Mao Jinlong               2025-01-07  4605  			reg = <0x0 0x10b04000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4606  
6e8637db89bf13 Mao Jinlong               2025-01-07  4607  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4608  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4609  
6e8637db89bf13 Mao Jinlong               2025-01-07  4610  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4611  				#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4612  				#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4613  
6e8637db89bf13 Mao Jinlong               2025-01-07  4614  				port@6 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4615  					reg = <6>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4616  					funnel_aoss_in_tpda_aoss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4617  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4618  							<&tpda_aoss_out_funnel_aoss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4619  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4620  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4621  
6e8637db89bf13 Mao Jinlong               2025-01-07  4622  				port@7 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4623  					reg = <7>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4624  					funnel_aoss_in_funnel_qdss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4625  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4626  							<&funnel_qdss_out_funnel_aoss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4627  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4628  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4629  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4630  
6e8637db89bf13 Mao Jinlong               2025-01-07  4631  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4632  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4633  					funnel_aoss_out_tmc_etf: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4634  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4635  							<&tmc_etf_in_funnel_aoss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4636  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4637  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4638  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4639  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4640  
6e8637db89bf13 Mao Jinlong               2025-01-07  4641  		tmc@10b05000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4642  			compatible = "arm,coresight-tmc", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4643  			reg = <0x0 0x10b05000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4644  
6e8637db89bf13 Mao Jinlong               2025-01-07  4645  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4646  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4647  
6e8637db89bf13 Mao Jinlong               2025-01-07  4648  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4649  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4650  					tmc_etf_in_funnel_aoss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4651  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4652  							<&funnel_aoss_out_tmc_etf>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4653  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4654  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4655  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4656  
6e8637db89bf13 Mao Jinlong               2025-01-07  4657  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4658  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4659  					tmc_etf_out_replicator_swao: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4660  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4661  							<&replicator_swao_in_tmc_etf>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4662  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4663  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4664  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4665  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4666  
6e8637db89bf13 Mao Jinlong               2025-01-07  4667  		replicator@10b06000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4668  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4669  			reg = <0x0 0x10b06000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4670  
6e8637db89bf13 Mao Jinlong               2025-01-07  4671  			qcom,replicator-loses-context;
6e8637db89bf13 Mao Jinlong               2025-01-07  4672  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4673  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4674  
6e8637db89bf13 Mao Jinlong               2025-01-07  4675  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4676  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4677  					replicator_swao_in_tmc_etf: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4678  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4679  							<&tmc_etf_out_replicator_swao>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4680  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4681  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4682  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4683  
6e8637db89bf13 Mao Jinlong               2025-01-07  4684  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4685  
6e8637db89bf13 Mao Jinlong               2025-01-07  4686  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4687  					replicator_swao_out_replicator_qdss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4688  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4689  							<&replicator_qdss_in_replicator_swao>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4690  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4691  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4692  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4693  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4694  
6e8637db89bf13 Mao Jinlong               2025-01-07  4695  		tpda@10b08000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4696  			compatible = "qcom,coresight-tpda", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4697  
6e8637db89bf13 Mao Jinlong               2025-01-07  4698  			reg = <0x0 0x10b08000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4699  
6e8637db89bf13 Mao Jinlong               2025-01-07  4700  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4701  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4702  
6e8637db89bf13 Mao Jinlong               2025-01-07  4703  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4704  
6e8637db89bf13 Mao Jinlong               2025-01-07  4705  				#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4706  				#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4707  
6e8637db89bf13 Mao Jinlong               2025-01-07  4708  				port@0 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4709  					reg = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4710  					tpda_aoss_in_tpdm_swao_prio_0: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4711  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4712  							<&tpdm_swao_prio_0_out_tpda_aoss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4713  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4714  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4715  
6e8637db89bf13 Mao Jinlong               2025-01-07  4716  				port@4 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4717  					reg = <4>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4718  					tpda_aoss_in_tpdm_swao: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4719  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4720  							<&tpdm_swao_out_tpda_aoss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4721  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4722  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4723  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4724  
6e8637db89bf13 Mao Jinlong               2025-01-07  4725  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4726  
6e8637db89bf13 Mao Jinlong               2025-01-07  4727  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4728  					tpda_aoss_out_funnel_aoss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4729  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4730  							<&funnel_aoss_in_tpda_aoss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4731  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4732  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4733  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4734  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4735  
6e8637db89bf13 Mao Jinlong               2025-01-07  4736  		tpdm@10b09000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4737  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4738  			reg = <0x0 0x10b09000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4739  
6e8637db89bf13 Mao Jinlong               2025-01-07  4740  
6e8637db89bf13 Mao Jinlong               2025-01-07  4741  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4742  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4743  
6e8637db89bf13 Mao Jinlong               2025-01-07  4744  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4745  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4746  					tpdm_swao_prio_0_out_tpda_aoss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4747  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4748  							<&tpda_aoss_in_tpdm_swao_prio_0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4749  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4750  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4751  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4752  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4753  
6e8637db89bf13 Mao Jinlong               2025-01-07  4754  		tpdm@10b0d000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4755  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4756  			reg = <0x0 0x10b0d000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4757  
6e8637db89bf13 Mao Jinlong               2025-01-07  4758  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4759  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4760  
6e8637db89bf13 Mao Jinlong               2025-01-07  4761  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4762  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4763  					tpdm_swao_out_tpda_aoss: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4764  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4765  							<&tpda_aoss_in_tpdm_swao>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4766  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4767  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4768  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4769  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4770  
6e8637db89bf13 Mao Jinlong               2025-01-07  4771  		tpdm@10c28000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4772  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4773  			reg = <0x0 0x10c28000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4774  
6e8637db89bf13 Mao Jinlong               2025-01-07  4775  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4776  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4777  
6e8637db89bf13 Mao Jinlong               2025-01-07  4778  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4779  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4780  					tpdm_dlct_out_tpda_dl_center_26: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4781  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4782  							<&tpda_dl_center_26_in_tpdm_dlct>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4783  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4784  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4785  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4786  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4787  
6e8637db89bf13 Mao Jinlong               2025-01-07  4788  		tpdm@10c29000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4789  			compatible = "qcom,coresight-tpdm", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4790  			reg = <0x0 0x10c29000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4791  
6e8637db89bf13 Mao Jinlong               2025-01-07  4792  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4793  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4794  
6e8637db89bf13 Mao Jinlong               2025-01-07  4795  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4796  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4797  					tpdm_ipcc_out_tpda_dl_center_27: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4798  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4799  							<&tpda_dl_center_27_in_tpdm_ipcc>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4800  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4801  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4802  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4803  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4804  
6e8637db89bf13 Mao Jinlong               2025-01-07  4805  		cti@10c2a000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4806  			compatible = "arm,coresight-cti", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4807  			reg = <0x0 0x10c2a000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4808  
6e8637db89bf13 Mao Jinlong               2025-01-07  4809  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4810  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4811  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4812  
6e8637db89bf13 Mao Jinlong               2025-01-07  4813  		cti@10c2b000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4814  			compatible = "arm,coresight-cti", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4815  			reg = <0x0 0x10c2b000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4816  
6e8637db89bf13 Mao Jinlong               2025-01-07  4817  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4818  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4819  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4820  
6e8637db89bf13 Mao Jinlong               2025-01-07  4821  		tpda@10c2e000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4822  			compatible = "qcom,coresight-tpda", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4823  			reg = <0x0 0x10c2e000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4824  
6e8637db89bf13 Mao Jinlong               2025-01-07  4825  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4826  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4827  
6e8637db89bf13 Mao Jinlong               2025-01-07  4828  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4829  
6e8637db89bf13 Mao Jinlong               2025-01-07  4830  				#address-cells = <1>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4831  				#size-cells = <0>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4832  
6e8637db89bf13 Mao Jinlong               2025-01-07  4833  				port@1a {
6e8637db89bf13 Mao Jinlong               2025-01-07  4834  					reg = <26>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4835  					tpda_dl_center_26_in_tpdm_dlct: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4836  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4837  							<&tpdm_dlct_out_tpda_dl_center_26>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4838  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4839  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4840  
6e8637db89bf13 Mao Jinlong               2025-01-07  4841  				port@1b {
6e8637db89bf13 Mao Jinlong               2025-01-07  4842  					reg = <27>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4843  					tpda_dl_center_27_in_tpdm_ipcc: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4844  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4845  							<&tpdm_ipcc_out_tpda_dl_center_27>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4846  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4847  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4848  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4849  
6e8637db89bf13 Mao Jinlong               2025-01-07  4850  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4851  
6e8637db89bf13 Mao Jinlong               2025-01-07  4852  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4853  					tpda_dl_center_out_funnel_dl_center: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4854  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4855  							<&funnel_dl_center_in_tpda_dl_center>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4856  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4857  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4858  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4859  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4860  
6e8637db89bf13 Mao Jinlong               2025-01-07  4861  		funnel@10c2f000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4862  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4863  			reg = <0x0 0x10c2f000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4864  
6e8637db89bf13 Mao Jinlong               2025-01-07  4865  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4866  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4867  
6e8637db89bf13 Mao Jinlong               2025-01-07  4868  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4869  
6e8637db89bf13 Mao Jinlong               2025-01-07  4870  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4871  					funnel_dl_center_in_tpda_dl_center: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4872  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4873  							<&tpda_dl_center_out_funnel_dl_center>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4874  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4875  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4876  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4877  
6e8637db89bf13 Mao Jinlong               2025-01-07  4878  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4879  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4880  					funnel_dl_center_out_funnel_in1: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4881  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4882  							<&funnel_in1_in_funnel_dl_center>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4883  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4884  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4885  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4886  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4887  
6e8637db89bf13 Mao Jinlong               2025-01-07  4888  		funnel@13810000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4889  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4890  
6e8637db89bf13 Mao Jinlong               2025-01-07  4891  			reg = <0x0 0x13810000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4892  
6e8637db89bf13 Mao Jinlong               2025-01-07  4893  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4894  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4895  
6e8637db89bf13 Mao Jinlong               2025-01-07  4896  			in-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4897  
6e8637db89bf13 Mao Jinlong               2025-01-07  4898  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4899  					funnel_apss_in_funnel_ete: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4900  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4901  							<&funnel_ete_out_funnel_apss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4902  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4903  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4904  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4905  
6e8637db89bf13 Mao Jinlong               2025-01-07  4906  			out-ports {
6e8637db89bf13 Mao Jinlong               2025-01-07  4907  				port {
6e8637db89bf13 Mao Jinlong               2025-01-07  4908  					funnel_apss_out_funnel_in1: endpoint {
6e8637db89bf13 Mao Jinlong               2025-01-07  4909  						remote-endpoint =
6e8637db89bf13 Mao Jinlong               2025-01-07  4910  							<&funnel_in1_in_funnel_apss>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4911  					};
6e8637db89bf13 Mao Jinlong               2025-01-07  4912  				};
6e8637db89bf13 Mao Jinlong               2025-01-07  4913  			};
6e8637db89bf13 Mao Jinlong               2025-01-07  4914  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4915  
6e8637db89bf13 Mao Jinlong               2025-01-07  4916  		cti@138e0000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4917  			compatible = "arm,coresight-cti", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4918  			reg = <0x0 0x138e0000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4919  
6e8637db89bf13 Mao Jinlong               2025-01-07  4920  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4921  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4922  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4923  
6e8637db89bf13 Mao Jinlong               2025-01-07  4924  		cti@138f0000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4925  			compatible = "arm,coresight-cti", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4926  			reg = <0x0 0x138f0000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4927  
6e8637db89bf13 Mao Jinlong               2025-01-07  4928  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4929  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4930  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4931  
6e8637db89bf13 Mao Jinlong               2025-01-07  4932  		cti@13900000 {
6e8637db89bf13 Mao Jinlong               2025-01-07  4933  			compatible = "arm,coresight-cti", "arm,primecell";
6e8637db89bf13 Mao Jinlong               2025-01-07  4934  			reg = <0x0 0x13900000 0x0 0x1000>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4935  
6e8637db89bf13 Mao Jinlong               2025-01-07  4936  			clocks = <&aoss_qmp>;
6e8637db89bf13 Mao Jinlong               2025-01-07  4937  			clock-names = "apb_pclk";
6e8637db89bf13 Mao Jinlong               2025-01-07  4938  		};
6e8637db89bf13 Mao Jinlong               2025-01-07  4939  
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4940  		sram@146aa000 {
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4941  			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4942  			reg = <0 0x146aa000 0 0x1000>;
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4943  			ranges = <0 0 0x146aa000 0x1000>;
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4944  
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4945  			#address-cells = <1>;
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4946  			#size-cells = <1>;
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4947  
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4948  			pil-reloc@94c {
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4949  				compatible = "qcom,pil-reloc-info";
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4950  				reg = <0x94c 0xc8>;
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4951  			};
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4952  		};
d39469f5ce81b2 Mukesh Ojha               2023-02-22  4953  
892d5395396d55 Vinod Koul                2021-12-15  4954  		apps_smmu: iommu@15000000 {
892d5395396d55 Vinod Koul                2021-12-15  4955  			compatible = "qcom,sm8450-smmu-500", "arm,mmu-500";
892d5395396d55 Vinod Koul                2021-12-15  4956  			reg = <0 0x15000000 0 0x100000>;
892d5395396d55 Vinod Koul                2021-12-15  4957  			#iommu-cells = <2>;
7baa00bef33625 Jonathan Marek            2022-01-22  4958  			#global-interrupts = <1>;
892d5395396d55 Vinod Koul                2021-12-15  4959  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4960  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4961  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4962  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4963  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4964  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4965  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4966  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4967  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4968  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4969  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4970  				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4971  				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4972  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4973  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4974  				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4975  				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4976  				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4977  				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4978  				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4979  				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4980  				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4981  				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4982  				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4983  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4984  				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4985  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4986  				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4987  				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4988  				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4989  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4990  				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4991  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4992  				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4993  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4994  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4995  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4996  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4997  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4998  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  4999  				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5000  				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5001  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5002  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5003  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5004  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5005  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5006  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5007  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5008  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5009  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5010  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5011  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5012  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5013  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5014  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5015  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5016  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5017  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5018  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5019  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5020  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5021  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5022  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5023  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5024  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5025  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5026  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5027  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5028  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5029  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5030  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5031  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5032  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5033  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5034  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5035  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5036  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5037  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5038  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5039  				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5040  				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5041  				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5042  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5043  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5044  				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
7baa00bef33625 Jonathan Marek            2022-01-22  5045  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5046  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5047  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5048  				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5049  				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5050  				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5051  				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5052  				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5053  				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5054  				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
892d5395396d55 Vinod Koul                2021-12-15  5055  				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
c9ab6652769d33 Konrad Dybcio             2024-09-19  5056  			dma-coherent;
892d5395396d55 Vinod Koul                2021-12-15  5057  		};
892d5395396d55 Vinod Koul                2021-12-15  5058  
5188049c9b36d7 Vinod Koul                2021-12-15  5059  		intc: interrupt-controller@17100000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5060  			compatible = "arm,gic-v3";
5188049c9b36d7 Vinod Koul                2021-12-15  5061  			#interrupt-cells = <3>;
5188049c9b36d7 Vinod Koul                2021-12-15  5062  			interrupt-controller;
5188049c9b36d7 Vinod Koul                2021-12-15  5063  			#redistributor-regions = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15  5064  			redistributor-stride = <0x0 0x40000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5065  			reg = <0x0 0x17100000 0x0 0x10000>,     /* GICD */
5188049c9b36d7 Vinod Koul                2021-12-15  5066  			      <0x0 0x17180000 0x0 0x200000>;    /* GICR * 8 */
5188049c9b36d7 Vinod Koul                2021-12-15  5067  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5068  			#address-cells = <2>;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5069  			#size-cells = <2>;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5070  			ranges;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5071  
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5072  			gic_its: msi-controller@17140000 {
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5073  				compatible = "arm,gic-v3-its";
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5074  				reg = <0x0 0x17140000 0x0 0x20000>;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5075  				msi-controller;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5076  				#msi-cells = <1>;
fc8b0b9b630df6 Dmitry Baryshkov          2022-05-02  5077  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5078  		};
5188049c9b36d7 Vinod Koul                2021-12-15  5079  
5188049c9b36d7 Vinod Koul                2021-12-15  5080  		timer@17420000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5081  			compatible = "arm,armv7-timer-mem";
458ebdbb8e5d59 David Heidelberg          2022-06-26  5082  			#address-cells = <1>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5083  			#size-cells = <1>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5084  			ranges = <0 0 0 0x20000000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5085  			reg = <0x0 0x17420000 0x0 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5086  			clock-frequency = <19200000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5087  
5188049c9b36d7 Vinod Koul                2021-12-15  5088  			frame@17421000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5089  				frame-number = <0>;
5188049c9b36d7 Vinod Koul                2021-12-15  5090  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
5188049c9b36d7 Vinod Koul                2021-12-15  5091  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5092  				reg = <0x17421000 0x1000>,
458ebdbb8e5d59 David Heidelberg          2022-06-26  5093  				      <0x17422000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5094  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5095  
5188049c9b36d7 Vinod Koul                2021-12-15  5096  			frame@17423000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5097  				frame-number = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15  5098  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5099  				reg = <0x17423000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5100  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  5101  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5102  
5188049c9b36d7 Vinod Koul                2021-12-15  5103  			frame@17425000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5104  				frame-number = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15  5105  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5106  				reg = <0x17425000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5107  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  5108  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5109  
5188049c9b36d7 Vinod Koul                2021-12-15  5110  			frame@17427000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5111  				frame-number = <3>;
5188049c9b36d7 Vinod Koul                2021-12-15  5112  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5113  				reg = <0x17427000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5114  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  5115  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5116  
5188049c9b36d7 Vinod Koul                2021-12-15  5117  			frame@17429000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5118  				frame-number = <4>;
5188049c9b36d7 Vinod Koul                2021-12-15  5119  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5120  				reg = <0x17429000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5121  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  5122  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5123  
5188049c9b36d7 Vinod Koul                2021-12-15  5124  			frame@1742b000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5125  				frame-number = <5>;
5188049c9b36d7 Vinod Koul                2021-12-15  5126  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5127  				reg = <0x1742b000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5128  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  5129  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5130  
5188049c9b36d7 Vinod Koul                2021-12-15  5131  			frame@1742d000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5132  				frame-number = <6>;
5188049c9b36d7 Vinod Koul                2021-12-15  5133  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg          2022-06-26  5134  				reg = <0x1742d000 0x1000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5135  				status = "disabled";
5188049c9b36d7 Vinod Koul                2021-12-15  5136  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5137  		};
5188049c9b36d7 Vinod Koul                2021-12-15  5138  
5188049c9b36d7 Vinod Koul                2021-12-15  5139  		apps_rsc: rsc@17a00000 {
5188049c9b36d7 Vinod Koul                2021-12-15  5140  			label = "apps_rsc";
5188049c9b36d7 Vinod Koul                2021-12-15  5141  			compatible = "qcom,rpmh-rsc";
5188049c9b36d7 Vinod Koul                2021-12-15  5142  			reg = <0x0 0x17a00000 0x0 0x10000>,
5188049c9b36d7 Vinod Koul                2021-12-15  5143  			      <0x0 0x17a10000 0x0 0x10000>,
5188049c9b36d7 Vinod Koul                2021-12-15  5144  			      <0x0 0x17a20000 0x0 0x10000>,
5188049c9b36d7 Vinod Koul                2021-12-15  5145  			      <0x0 0x17a30000 0x0 0x10000>;
5188049c9b36d7 Vinod Koul                2021-12-15  5146  			reg-names = "drv-0", "drv-1", "drv-2", "drv-3";
5188049c9b36d7 Vinod Koul                2021-12-15  5147  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
5188049c9b36d7 Vinod Koul                2021-12-15  5148  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
5188049c9b36d7 Vinod Koul                2021-12-15  5149  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
5188049c9b36d7 Vinod Koul                2021-12-15  5150  			qcom,tcs-offset = <0xd00>;
5188049c9b36d7 Vinod Koul                2021-12-15  5151  			qcom,drv-id = <2>;
5188049c9b36d7 Vinod Koul                2021-12-15  5152  			qcom,tcs-config = <ACTIVE_TCS  3>, <SLEEP_TCS   2>,
5188049c9b36d7 Vinod Koul                2021-12-15  5153  					  <WAKE_TCS    2>, <CONTROL_TCS 0>;
92513494aff8cb Krzysztof Kozlowski       2024-10-22  5154  			power-domains = <&cluster_pd>;
5188049c9b36d7 Vinod Koul                2021-12-15  5155  
5188049c9b36d7 Vinod Koul                2021-12-15  5156  			apps_bcm_voter: bcm-voter {
5188049c9b36d7 Vinod Koul                2021-12-15  5157  				compatible = "qcom,bcm-voter";
5188049c9b36d7 Vinod Koul                2021-12-15  5158  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5159  
5188049c9b36d7 Vinod Koul                2021-12-15  5160  			rpmhcc: clock-controller {
5188049c9b36d7 Vinod Koul                2021-12-15  5161  				compatible = "qcom,sm8450-rpmh-clk";
5188049c9b36d7 Vinod Koul                2021-12-15  5162  				#clock-cells = <1>;
5188049c9b36d7 Vinod Koul                2021-12-15  5163  				clock-names = "xo";
5188049c9b36d7 Vinod Koul                2021-12-15  5164  				clocks = <&xo_board>;
5188049c9b36d7 Vinod Koul                2021-12-15  5165  			};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5166  
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5167  			rpmhpd: power-controller {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5168  				compatible = "qcom,sm8450-rpmhpd";
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5169  				#power-domain-cells = <1>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5170  				operating-points-v2 = <&rpmhpd_opp_table>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5171  
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5172  				rpmhpd_opp_table: opp-table {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5173  					compatible = "operating-points-v2";
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5174  
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5175  					rpmhpd_opp_ret: opp1 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5176  						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5177  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5178  
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5179  					rpmhpd_opp_min_svs: opp2 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5180  						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5181  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5182  
a5ac24ba175908 Dmitry Baryshkov          2022-12-07  5183  					rpmhpd_opp_low_svs_d1: opp3 {
a5ac24ba175908 Dmitry Baryshkov          2022-12-07  5184  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
a5ac24ba175908 Dmitry Baryshkov          2022-12-07  5185  					};
a5ac24ba175908 Dmitry Baryshkov          2022-12-07  5186  
a5ac24ba175908 Dmitry Baryshkov          2022-12-07  5187  					rpmhpd_opp_low_svs: opp4 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5188  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5189  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5190  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5191  					rpmhpd_opp_low_svs_l1: opp5 {
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5192  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5193  					};
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5194  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5195  					rpmhpd_opp_svs: opp6 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5196  						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5197  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5198  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5199  					rpmhpd_opp_svs_l0: opp7 {
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5200  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5201  					};
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5202  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5203  					rpmhpd_opp_svs_l1: opp8 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5204  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5205  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5206  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5207  					rpmhpd_opp_svs_l2: opp9 {
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5208  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5209  					};
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5210  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5211  					rpmhpd_opp_nom: opp10 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5212  						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5213  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5214  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5215  					rpmhpd_opp_nom_l1: opp11 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5216  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5217  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5218  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5219  					rpmhpd_opp_nom_l2: opp12 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5220  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5221  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5222  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5223  					rpmhpd_opp_turbo: opp13 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5224  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5225  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5226  
ec8bb9c5b1c696 Konrad Dybcio             2023-05-16  5227  					rpmhpd_opp_turbo_l1: opp14 {
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5228  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5229  					};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5230  				};
61eba74e473ed4 Dmitry Baryshkov          2021-12-15  5231  			};
5188049c9b36d7 Vinod Koul                2021-12-15  5232  		};
07fa917a335e13 Vinod Koul                2021-12-15  5233  
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5234  		cpufreq_hw: cpufreq@17d91000 {
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5235  			compatible = "qcom,sm8450-cpufreq-epss", "qcom,cpufreq-epss";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5236  			reg = <0 0x17d91000 0 0x1000>,
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5237  			      <0 0x17d92000 0 0x1000>,
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5238  			      <0 0x17d93000 0 0x1000>;
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5239  			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5240  			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5241  			clock-names = "xo", "alternate";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5242  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5243  				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5244  				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5245  			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5246  			#freq-domain-cells = <1>;
8a8845e07b1164 Manivannan Sadhasivam     2022-11-17  5247  			#clock-cells = <1>;
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5248  		};
015a89f0d317dc Vladimir Zapolskiy        2021-12-15  5249  
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5250  		gem_noc: interconnect@19100000 {
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5251  			compatible = "qcom,sm8450-gem-noc";
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5252  			reg = <0 0x19100000 0 0xbb800>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5253  			#interconnect-cells = <2>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5254  			qcom,bcm-voters = <&apps_bcm_voter>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5255  		};
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5256  
1dc3e50eb68031 Sai Prakash Ranjan        2022-01-28  5257  		system-cache-controller@19200000 {
1dc3e50eb68031 Sai Prakash Ranjan        2022-01-28  5258  			compatible = "qcom,sm8450-llcc";
413c8ecd48f1df Manivannan Sadhasivam     2023-03-14  5259  			reg = <0 0x19200000 0 0x80000>, <0 0x19600000 0 0x80000>,
413c8ecd48f1df Manivannan Sadhasivam     2023-03-14  5260  			      <0 0x19300000 0 0x80000>, <0 0x19700000 0 0x80000>,
c566143137aaac Unnathi Chalicheemala     2024-05-31  5261  			      <0 0x19a00000 0 0x80000>, <0 0x19c00000 0 0x80000>;
413c8ecd48f1df Manivannan Sadhasivam     2023-03-14  5262  			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
c566143137aaac Unnathi Chalicheemala     2024-05-31  5263  				    "llcc3_base", "llcc_broadcast_base",
c566143137aaac Unnathi Chalicheemala     2024-05-31  5264  				    "llcc_broadcast_and_base";
1dc3e50eb68031 Sai Prakash Ranjan        2022-01-28  5265  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
1dc3e50eb68031 Sai Prakash Ranjan        2022-01-28  5266  		};
1dc3e50eb68031 Sai Prakash Ranjan        2022-01-28  5267  
07fa917a335e13 Vinod Koul                2021-12-15  5268  		ufs_mem_hc: ufshc@1d84000 {
07fa917a335e13 Vinod Koul                2021-12-15  5269  			compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
07fa917a335e13 Vinod Koul                2021-12-15  5270  				     "jedec,ufs-2.0";
86b0aef435851d Luca Weiss                2023-06-27  5271  			reg = <0 0x01d84000 0 0x3000>;
07fa917a335e13 Vinod Koul                2021-12-15  5272  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
75390b69d5df49 Dmitry Baryshkov          2023-12-05  5273  			phys = <&ufs_mem_phy>;
07fa917a335e13 Vinod Koul                2021-12-15  5274  			phy-names = "ufsphy";
07fa917a335e13 Vinod Koul                2021-12-15  5275  			lanes-per-direction = <2>;
07fa917a335e13 Vinod Koul                2021-12-15  5276  			#reset-cells = <1>;
07fa917a335e13 Vinod Koul                2021-12-15  5277  			resets = <&gcc GCC_UFS_PHY_BCR>;
07fa917a335e13 Vinod Koul                2021-12-15  5278  			reset-names = "rst";
07fa917a335e13 Vinod Koul                2021-12-15  5279  
07fa917a335e13 Vinod Koul                2021-12-15  5280  			power-domains = <&gcc UFS_PHY_GDSC>;
07fa917a335e13 Vinod Koul                2021-12-15  5281  
07fa917a335e13 Vinod Koul                2021-12-15  5282  			iommus = <&apps_smmu 0xe0 0x0>;
8ba961d4339c5d Manivannan Sadhasivam     2023-03-07  5283  			dma-coherent;
07fa917a335e13 Vinod Koul                2021-12-15  5284  
de9b3d9616078f Vladimir Zapolskiy        2022-03-11  5285  			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
de9b3d9616078f Vladimir Zapolskiy        2022-03-11  5286  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
aa2d0bf04a3c97 Vinod Koul                2022-02-03  5287  			interconnect-names = "ufs-ddr", "cpu-ufs";
07fa917a335e13 Vinod Koul                2021-12-15  5288  			clock-names =
07fa917a335e13 Vinod Koul                2021-12-15  5289  				"core_clk",
07fa917a335e13 Vinod Koul                2021-12-15  5290  				"bus_aggr_clk",
07fa917a335e13 Vinod Koul                2021-12-15  5291  				"iface_clk",
07fa917a335e13 Vinod Koul                2021-12-15  5292  				"core_clk_unipro",
07fa917a335e13 Vinod Koul                2021-12-15  5293  				"ref_clk",
07fa917a335e13 Vinod Koul                2021-12-15  5294  				"tx_lane0_sync_clk",
07fa917a335e13 Vinod Koul                2021-12-15  5295  				"rx_lane0_sync_clk",
86b0aef435851d Luca Weiss                2023-06-27  5296  				"rx_lane1_sync_clk";
07fa917a335e13 Vinod Koul                2021-12-15  5297  			clocks =
07fa917a335e13 Vinod Koul                2021-12-15  5298  				<&gcc GCC_UFS_PHY_AXI_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5299  				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5300  				<&gcc GCC_UFS_PHY_AHB_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5301  				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5302  				<&rpmhcc RPMH_CXO_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5303  				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5304  				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
86b0aef435851d Luca Weiss                2023-06-27  5305  				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
07fa917a335e13 Vinod Koul                2021-12-15  5306  			freq-table-hz =
07fa917a335e13 Vinod Koul                2021-12-15  5307  				<75000000 300000000>,
07fa917a335e13 Vinod Koul                2021-12-15  5308  				<0 0>,
07fa917a335e13 Vinod Koul                2021-12-15  5309  				<0 0>,
07fa917a335e13 Vinod Koul                2021-12-15  5310  				<75000000 300000000>,
07fa917a335e13 Vinod Koul                2021-12-15  5311  				<75000000 300000000>,
07fa917a335e13 Vinod Koul                2021-12-15  5312  				<0 0>,
07fa917a335e13 Vinod Koul                2021-12-15  5313  				<0 0>,
86b0aef435851d Luca Weiss                2023-06-27  5314  				<0 0>;
86b0aef435851d Luca Weiss                2023-06-27  5315  			qcom,ice = <&ice>;
86b0aef435851d Luca Weiss                2023-06-27  5316  
07fa917a335e13 Vinod Koul                2021-12-15  5317  			status = "disabled";
07fa917a335e13 Vinod Koul                2021-12-15  5318  		};
07fa917a335e13 Vinod Koul                2021-12-15  5319  
07fa917a335e13 Vinod Koul                2021-12-15  5320  		ufs_mem_phy: phy@1d87000 {
07fa917a335e13 Vinod Koul                2021-12-15  5321  			compatible = "qcom,sm8450-qmp-ufs-phy";
75390b69d5df49 Dmitry Baryshkov          2023-12-05  5322  			reg = <0 0x01d87000 0 0x1000>;
75390b69d5df49 Dmitry Baryshkov          2023-12-05  5323  
07fa917a335e13 Vinod Koul                2021-12-15  5324  			clock-names = "ref", "ref_aux", "qref";
07fa917a335e13 Vinod Koul                2021-12-15  5325  			clocks = <&rpmhcc RPMH_CXO_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5326  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
07fa917a335e13 Vinod Koul                2021-12-15  5327  				 <&gcc GCC_UFS_0_CLKREF_EN>;
07fa917a335e13 Vinod Koul                2021-12-15  5328  
27d3f57cf5a714 Dmitry Baryshkov          2024-05-01  5329  			power-domains = <&gcc UFS_PHY_GDSC>;
27d3f57cf5a714 Dmitry Baryshkov          2024-05-01  5330  
07fa917a335e13 Vinod Koul                2021-12-15  5331  			resets = <&ufs_mem_hc 0>;
07fa917a335e13 Vinod Koul                2021-12-15  5332  			reset-names = "ufsphy";
07fa917a335e13 Vinod Koul                2021-12-15  5333  
86543bc6eec499 Dmitry Baryshkov          2022-11-23  5334  			#clock-cells = <1>;
07fa917a335e13 Vinod Koul                2021-12-15  5335  			#phy-cells = <0>;
75390b69d5df49 Dmitry Baryshkov          2023-12-05  5336  
75390b69d5df49 Dmitry Baryshkov          2023-12-05  5337  			status = "disabled";
07fa917a335e13 Vinod Koul                2021-12-15  5338  		};
19fd04fb9247fb Vinod Koul                2021-12-16  5339  
86b0aef435851d Luca Weiss                2023-06-27  5340  		ice: crypto@1d88000 {
86b0aef435851d Luca Weiss                2023-06-27  5341  			compatible = "qcom,sm8450-inline-crypto-engine",
86b0aef435851d Luca Weiss                2023-06-27  5342  				     "qcom,inline-crypto-engine";
86b0aef435851d Luca Weiss                2023-06-27  5343  			reg = <0 0x01d88000 0 0x8000>;
86b0aef435851d Luca Weiss                2023-06-27  5344  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
86b0aef435851d Luca Weiss                2023-06-27  5345  		};
86b0aef435851d Luca Weiss                2023-06-27  5346  
b92b0d2f758205 Neil Armstrong            2023-05-27  5347  		cryptobam: dma-controller@1dc4000 {
b92b0d2f758205 Neil Armstrong            2023-05-27  5348  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
b92b0d2f758205 Neil Armstrong            2023-05-27  5349  			reg = <0 0x01dc4000 0 0x28000>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5350  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5351  			#dma-cells = <1>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5352  			qcom,ee = <0>;
0fe6357229cb15 Stephan Gerhold           2025-02-12  5353  			qcom,num-ees = <4>;
0fe6357229cb15 Stephan Gerhold           2025-02-12  5354  			num-channels = <16>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5355  			qcom,controlled-remotely;
b92b0d2f758205 Neil Armstrong            2023-05-27  5356  			iommus = <&apps_smmu 0x584 0x11>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5357  				 <&apps_smmu 0x588 0x0>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5358  				 <&apps_smmu 0x598 0x5>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5359  				 <&apps_smmu 0x59a 0x0>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5360  				 <&apps_smmu 0x59f 0x0>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5361  		};
b92b0d2f758205 Neil Armstrong            2023-05-27  5362  
b02966f8689795 Krzysztof Kozlowski       2023-06-16  5363  		crypto: crypto@1dfa000 {
b92b0d2f758205 Neil Armstrong            2023-05-27  5364  			compatible = "qcom,sm8450-qce", "qcom,sm8150-qce", "qcom,qce";
b92b0d2f758205 Neil Armstrong            2023-05-27  5365  			reg = <0 0x01dfa000 0 0x6000>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5366  			dmas = <&cryptobam 4>, <&cryptobam 5>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5367  			dma-names = "rx", "tx";
b92b0d2f758205 Neil Armstrong            2023-05-27  5368  			iommus = <&apps_smmu 0x584 0x11>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5369  				 <&apps_smmu 0x588 0x0>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5370  				 <&apps_smmu 0x598 0x5>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5371  				 <&apps_smmu 0x59a 0x0>,
b92b0d2f758205 Neil Armstrong            2023-05-27  5372  				 <&apps_smmu 0x59f 0x0>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5373  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
b92b0d2f758205 Neil Armstrong            2023-05-27  5374  			interconnect-names = "memory";
b92b0d2f758205 Neil Armstrong            2023-05-27  5375  		};
b92b0d2f758205 Neil Armstrong            2023-05-27  5376  
4b660ee5d0e9b9 Krzysztof Kozlowski       2022-12-04  5377  		sdhc_2: mmc@8804000 {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5378  			compatible = "qcom,sm8450-sdhci", "qcom,sdhci-msm-v5";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5379  			reg = <0 0x08804000 0 0x1000>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5380  
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5381  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5382  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5383  			interrupt-names = "hc_irq", "pwr_irq";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5384  
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5385  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5386  				 <&gcc GCC_SDCC2_APPS_CLK>,
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5387  				 <&rpmhcc RPMH_CXO_CLK>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5388  			clock-names = "iface", "core", "xo";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5389  			resets = <&gcc GCC_SDCC2_BCR>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5390  			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5391  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5392  			interconnect-names = "sdhc-ddr","cpu-sdhc";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5393  			iommus = <&apps_smmu 0x4a0 0x0>;
8ed9de79680f1d Rohit Agarwal             2023-07-20  5394  			power-domains = <&rpmhpd RPMHPD_CX>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5395  			operating-points-v2 = <&sdhc2_opp_table>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5396  			bus-width = <4>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5397  			dma-coherent;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5398  
9d561dc4e5cc31 Krzysztof Kozlowski       2022-10-26  5399  			/* Forbid SDR104/SDR50 - broken hw! */
9d561dc4e5cc31 Krzysztof Kozlowski       2022-10-26  5400  			sdhci-caps-mask = <0x3 0x0>;
9d561dc4e5cc31 Krzysztof Kozlowski       2022-10-26  5401  
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5402  			status = "disabled";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5403  
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5404  			sdhc2_opp_table: opp-table {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5405  				compatible = "operating-points-v2";
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5406  
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5407  				opp-100000000 {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5408  					opp-hz = /bits/ 64 <100000000>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5409  					required-opps = <&rpmhpd_opp_low_svs>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5410  				};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5411  
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5412  				opp-202000000 {
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5413  					opp-hz = /bits/ 64 <202000000>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5414  					required-opps = <&rpmhpd_opp_svs_l1>;
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5415  				};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5416  			};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5417  		};
20e8f1ee8d2729 Konrad Dybcio             2022-07-14  5418  
19fd04fb9247fb Vinod Koul                2021-12-16 @5419  		usb_1: usb@a6f8800 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
