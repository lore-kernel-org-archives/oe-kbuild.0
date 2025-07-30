Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9891DED52
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Jul 2025 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753854748; cv=none; b=U/hYQUoQv9qVDT1re72FTfLqm//t6Qfj8z4XH3R04ZMtdNIWK6W0mZjTJs6kaQ3LGDDXieJv+phlHQoqv7/dus5GXZnUBKHq7i/gqB5nERdpwkaRbUESRx9qEraMZMwFzKjSZLxF26sFX+Q613kD+qEC7ZA0jUeQrnvPDxnImiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753854748; c=relaxed/simple;
	bh=Vg6hhZeBN+13WokpTFI8j4z/TKYVO0w1mhM4sySa9qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKWjDjVibD5h2bL5JHA5Kgve2wVtf0hh8CiVo3EYcgcEi+pHQvk1hcQub5J40DBMDyhdpEaXLdQM4WYWcXFU9u32li1OXNJnz8aFSGOsyhNyAAi8boRlRETPczBayzdZdPBn99v7Sp5mIrA4KDL5KZSW6WmN6p39dn6nZ/iY+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bK9cjFl9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK9cjFl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753854738; x=1785390738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vg6hhZeBN+13WokpTFI8j4z/TKYVO0w1mhM4sySa9qs=;
  b=bK9cjFl9n3TcbwWo+1hPPKXth50ZvXsUMpMwQvIPZAEkfb8ZAAefre1u
   4R8B7yH504tYKho0ntqIufcV/LXKFyigmvZVAeR7NutbbwrPAqnGweGb0
   qjsON6XtxSIlbMjCGOOFjTfrrpwjqLASv+A+WJK3OrWqEymxJDW6qCDR9
   8f4ieOjlSIF9So+YMV9N6gm2xN7H8bC6ztygPlBs4c5ZRiP6xJyqf3+A8
   Um/H5k9N0x8PynNvb2kV571swP/PT4VzytYCJt4erCxb1ebsIWiX5l6cr
   2JytZ9xfox7gjxWG8iJZhf1JMVTLj2cak8SrK/VCCL8knG4W7YFdzbfqq
   A==;
X-CSE-ConnectionGUID: BuWXDU51RrS60HQDyHzAvw==
X-CSE-MsgGUID: boUWdT9KTmub9ghv9KSNzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73598660"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="73598660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 22:52:16 -0700
X-CSE-ConnectionGUID: JrlTMR2ST3KJO0CQmfCt4w==
X-CSE-MsgGUID: BKGznyzLTbyFafzLTJwNDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167103382"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 22:52:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugzjX-00025M-1y;
	Wed, 30 Jul 2025 05:52:11 +0000
Date: Wed, 30 Jul 2025 13:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8550: Flatten the USB nodes
Message-ID: <202507301325.mFaoVgRg-lkp@intel.com>
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
In-Reply-To: <20250729-topic-sm8x50-usb-flatten-v1-1-4be74a629136@linaro.org>
References: <20250729-topic-sm8x50-usb-flatten-v1-1-4be74a629136@linaro.org>
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
patch link:    https://lore.kernel.org/r/20250729-topic-sm8x50-usb-flatten-v1-1-4be74a629136%40linaro.org
patch subject: [PATCH 1/2] arm64: dts: qcom: sm8550: Flatten the USB nodes
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-003-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301325.mFaoVgRg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301325.mFaoVgRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507301325.mFaoVgRg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:4087.22-4177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:4087.22-4177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:4087.22-4177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3824.27-3898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:4087.22-4177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3824.27-3898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:4087.22-4177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3824.27-3898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:4087.22-4177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +4087 arch/arm64/boot/dts/qcom/sm8550.dtsi

ffc50b2d382879 Abel Vesa             2023-01-06    28  
ffc50b2d382879 Abel Vesa             2023-01-06    29  / {
ffc50b2d382879 Abel Vesa             2023-01-06    30  	interrupt-parent = <&intc>;
ffc50b2d382879 Abel Vesa             2023-01-06    31  
ffc50b2d382879 Abel Vesa             2023-01-06    32  	#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    33  	#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    34  
ffc50b2d382879 Abel Vesa             2023-01-06    35  	chosen { };
ffc50b2d382879 Abel Vesa             2023-01-06    36  
ffc50b2d382879 Abel Vesa             2023-01-06    37  	clocks {
ffc50b2d382879 Abel Vesa             2023-01-06    38  		xo_board: xo-board {
ffc50b2d382879 Abel Vesa             2023-01-06    39  			compatible = "fixed-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    40  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    41  		};
ffc50b2d382879 Abel Vesa             2023-01-06    42  
ffc50b2d382879 Abel Vesa             2023-01-06    43  		sleep_clk: sleep-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    44  			compatible = "fixed-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    45  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    46  		};
ffc50b2d382879 Abel Vesa             2023-01-06    47  
ffc50b2d382879 Abel Vesa             2023-01-06    48  		bi_tcxo_div2: bi-tcxo-div2-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    49  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    50  			compatible = "fixed-factor-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    51  			clocks = <&rpmhcc RPMH_CXO_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06    52  			clock-mult = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06    53  			clock-div = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    54  		};
ffc50b2d382879 Abel Vesa             2023-01-06    55  
ffc50b2d382879 Abel Vesa             2023-01-06    56  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    57  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    58  			compatible = "fixed-factor-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    59  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
ffc50b2d382879 Abel Vesa             2023-01-06    60  			clock-mult = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06    61  			clock-div = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    62  		};
ffc50b2d382879 Abel Vesa             2023-01-06    63  	};
ffc50b2d382879 Abel Vesa             2023-01-06    64  
ffc50b2d382879 Abel Vesa             2023-01-06    65  	cpus {
ffc50b2d382879 Abel Vesa             2023-01-06    66  		#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    67  		#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    68  
c779146b506627 Krzysztof Kozlowski   2024-10-22    69  		cpu0: cpu@0 {
ffc50b2d382879 Abel Vesa             2023-01-06    70  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16    71  			compatible = "arm,cortex-a510";
ffc50b2d382879 Abel Vesa             2023-01-06    72  			reg = <0 0>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15    73  			clocks = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06    74  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22    75  			next-level-cache = <&l2_0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22    76  			power-domains = <&cpu_pd0>;
ffc50b2d382879 Abel Vesa             2023-01-06    77  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06    78  			qcom,freq-domain = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06    79  			capacity-dmips-mhz = <1024>;
ffc50b2d382879 Abel Vesa             2023-01-06    80  			dynamic-power-coefficient = <100>;
ffc50b2d382879 Abel Vesa             2023-01-06    81  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22    82  			l2_0: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06    83  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06    84  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    85  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22    86  				next-level-cache = <&l3_0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22    87  				l3_0: l3-cache {
ffc50b2d382879 Abel Vesa             2023-01-06    88  					compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06    89  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    90  					cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06    91  				};
ffc50b2d382879 Abel Vesa             2023-01-06    92  			};
ffc50b2d382879 Abel Vesa             2023-01-06    93  		};
ffc50b2d382879 Abel Vesa             2023-01-06    94  
c779146b506627 Krzysztof Kozlowski   2024-10-22    95  		cpu1: cpu@100 {
ffc50b2d382879 Abel Vesa             2023-01-06    96  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16    97  			compatible = "arm,cortex-a510";
ffc50b2d382879 Abel Vesa             2023-01-06    98  			reg = <0 0x100>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15    99  			clocks = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   100  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   101  			next-level-cache = <&l2_100>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   102  			power-domains = <&cpu_pd1>;
ffc50b2d382879 Abel Vesa             2023-01-06   103  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   104  			qcom,freq-domain = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   105  			capacity-dmips-mhz = <1024>;
ffc50b2d382879 Abel Vesa             2023-01-06   106  			dynamic-power-coefficient = <100>;
ffc50b2d382879 Abel Vesa             2023-01-06   107  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   108  			l2_100: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   109  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   110  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   111  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   112  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   113  			};
ffc50b2d382879 Abel Vesa             2023-01-06   114  		};
ffc50b2d382879 Abel Vesa             2023-01-06   115  
c779146b506627 Krzysztof Kozlowski   2024-10-22   116  		cpu2: cpu@200 {
ffc50b2d382879 Abel Vesa             2023-01-06   117  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   118  			compatible = "arm,cortex-a510";
ffc50b2d382879 Abel Vesa             2023-01-06   119  			reg = <0 0x200>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   120  			clocks = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   121  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   122  			next-level-cache = <&l2_200>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   123  			power-domains = <&cpu_pd2>;
ffc50b2d382879 Abel Vesa             2023-01-06   124  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   125  			qcom,freq-domain = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   126  			capacity-dmips-mhz = <1024>;
ffc50b2d382879 Abel Vesa             2023-01-06   127  			dynamic-power-coefficient = <100>;
ffc50b2d382879 Abel Vesa             2023-01-06   128  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   129  			l2_200: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   130  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   131  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   132  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   133  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   134  			};
ffc50b2d382879 Abel Vesa             2023-01-06   135  		};
ffc50b2d382879 Abel Vesa             2023-01-06   136  
c779146b506627 Krzysztof Kozlowski   2024-10-22   137  		cpu3: cpu@300 {
ffc50b2d382879 Abel Vesa             2023-01-06   138  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   139  			compatible = "arm,cortex-a715";
ffc50b2d382879 Abel Vesa             2023-01-06   140  			reg = <0 0x300>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   141  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   142  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   143  			next-level-cache = <&l2_300>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   144  			power-domains = <&cpu_pd3>;
ffc50b2d382879 Abel Vesa             2023-01-06   145  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   146  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   147  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   148  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   149  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   150  			l2_300: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   151  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   152  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   153  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   154  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   155  			};
ffc50b2d382879 Abel Vesa             2023-01-06   156  		};
ffc50b2d382879 Abel Vesa             2023-01-06   157  
c779146b506627 Krzysztof Kozlowski   2024-10-22   158  		cpu4: cpu@400 {
ffc50b2d382879 Abel Vesa             2023-01-06   159  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   160  			compatible = "arm,cortex-a715";
ffc50b2d382879 Abel Vesa             2023-01-06   161  			reg = <0 0x400>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   162  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   163  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   164  			next-level-cache = <&l2_400>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   165  			power-domains = <&cpu_pd4>;
ffc50b2d382879 Abel Vesa             2023-01-06   166  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   167  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   168  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   169  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   170  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   171  			l2_400: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   172  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   173  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   174  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   175  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   176  			};
ffc50b2d382879 Abel Vesa             2023-01-06   177  		};
ffc50b2d382879 Abel Vesa             2023-01-06   178  
c779146b506627 Krzysztof Kozlowski   2024-10-22   179  		cpu5: cpu@500 {
ffc50b2d382879 Abel Vesa             2023-01-06   180  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   181  			compatible = "arm,cortex-a710";
ffc50b2d382879 Abel Vesa             2023-01-06   182  			reg = <0 0x500>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   183  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   184  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   185  			next-level-cache = <&l2_500>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   186  			power-domains = <&cpu_pd5>;
ffc50b2d382879 Abel Vesa             2023-01-06   187  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   188  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   189  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   190  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   191  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   192  			l2_500: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   193  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   194  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   195  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   196  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   197  			};
ffc50b2d382879 Abel Vesa             2023-01-06   198  		};
ffc50b2d382879 Abel Vesa             2023-01-06   199  
c779146b506627 Krzysztof Kozlowski   2024-10-22   200  		cpu6: cpu@600 {
ffc50b2d382879 Abel Vesa             2023-01-06   201  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   202  			compatible = "arm,cortex-a710";
ffc50b2d382879 Abel Vesa             2023-01-06   203  			reg = <0 0x600>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   204  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   205  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   206  			next-level-cache = <&l2_600>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   207  			power-domains = <&cpu_pd6>;
ffc50b2d382879 Abel Vesa             2023-01-06   208  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   209  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   210  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   211  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   212  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   213  			l2_600: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   214  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   215  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   216  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   217  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   218  			};
ffc50b2d382879 Abel Vesa             2023-01-06   219  		};
ffc50b2d382879 Abel Vesa             2023-01-06   220  
c779146b506627 Krzysztof Kozlowski   2024-10-22   221  		cpu7: cpu@700 {
ffc50b2d382879 Abel Vesa             2023-01-06   222  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   223  			compatible = "arm,cortex-x3";
ffc50b2d382879 Abel Vesa             2023-01-06   224  			reg = <0 0x700>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   225  			clocks = <&cpufreq_hw 2>;
ffc50b2d382879 Abel Vesa             2023-01-06   226  			enable-method = "psci";
c779146b506627 Krzysztof Kozlowski   2024-10-22   227  			next-level-cache = <&l2_700>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   228  			power-domains = <&cpu_pd7>;
ffc50b2d382879 Abel Vesa             2023-01-06   229  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   230  			qcom,freq-domain = <&cpufreq_hw 2>;
ffc50b2d382879 Abel Vesa             2023-01-06   231  			capacity-dmips-mhz = <1894>;
ffc50b2d382879 Abel Vesa             2023-01-06   232  			dynamic-power-coefficient = <588>;
ffc50b2d382879 Abel Vesa             2023-01-06   233  			#cooling-cells = <2>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   234  			l2_700: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   235  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   236  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   237  				cache-unified;
c779146b506627 Krzysztof Kozlowski   2024-10-22   238  				next-level-cache = <&l3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   239  			};
ffc50b2d382879 Abel Vesa             2023-01-06   240  		};
ffc50b2d382879 Abel Vesa             2023-01-06   241  
ffc50b2d382879 Abel Vesa             2023-01-06   242  		cpu-map {
ffc50b2d382879 Abel Vesa             2023-01-06   243  			cluster0 {
ffc50b2d382879 Abel Vesa             2023-01-06   244  				core0 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   245  					cpu = <&cpu0>;
ffc50b2d382879 Abel Vesa             2023-01-06   246  				};
ffc50b2d382879 Abel Vesa             2023-01-06   247  
ffc50b2d382879 Abel Vesa             2023-01-06   248  				core1 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   249  					cpu = <&cpu1>;
ffc50b2d382879 Abel Vesa             2023-01-06   250  				};
ffc50b2d382879 Abel Vesa             2023-01-06   251  
ffc50b2d382879 Abel Vesa             2023-01-06   252  				core2 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   253  					cpu = <&cpu2>;
ffc50b2d382879 Abel Vesa             2023-01-06   254  				};
ffc50b2d382879 Abel Vesa             2023-01-06   255  
ffc50b2d382879 Abel Vesa             2023-01-06   256  				core3 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   257  					cpu = <&cpu3>;
ffc50b2d382879 Abel Vesa             2023-01-06   258  				};
ffc50b2d382879 Abel Vesa             2023-01-06   259  
ffc50b2d382879 Abel Vesa             2023-01-06   260  				core4 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   261  					cpu = <&cpu4>;
ffc50b2d382879 Abel Vesa             2023-01-06   262  				};
ffc50b2d382879 Abel Vesa             2023-01-06   263  
ffc50b2d382879 Abel Vesa             2023-01-06   264  				core5 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   265  					cpu = <&cpu5>;
ffc50b2d382879 Abel Vesa             2023-01-06   266  				};
ffc50b2d382879 Abel Vesa             2023-01-06   267  
ffc50b2d382879 Abel Vesa             2023-01-06   268  				core6 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   269  					cpu = <&cpu6>;
ffc50b2d382879 Abel Vesa             2023-01-06   270  				};
ffc50b2d382879 Abel Vesa             2023-01-06   271  
ffc50b2d382879 Abel Vesa             2023-01-06   272  				core7 {
c779146b506627 Krzysztof Kozlowski   2024-10-22   273  					cpu = <&cpu7>;
ffc50b2d382879 Abel Vesa             2023-01-06   274  				};
ffc50b2d382879 Abel Vesa             2023-01-06   275  			};
ffc50b2d382879 Abel Vesa             2023-01-06   276  		};
ffc50b2d382879 Abel Vesa             2023-01-06   277  
ffc50b2d382879 Abel Vesa             2023-01-06   278  		idle-states {
ffc50b2d382879 Abel Vesa             2023-01-06   279  			entry-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   280  
c779146b506627 Krzysztof Kozlowski   2024-10-22   281  			little_cpu_sleep_0: cpu-sleep-0-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   282  				compatible = "arm,idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   283  				idle-state-name = "silver-rail-power-collapse";
ffc50b2d382879 Abel Vesa             2023-01-06   284  				arm,psci-suspend-param = <0x40000004>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   285  				entry-latency-us = <550>;
ffc50b2d382879 Abel Vesa             2023-01-06   286  				exit-latency-us = <750>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   287  				min-residency-us = <6700>;
ffc50b2d382879 Abel Vesa             2023-01-06   288  				local-timer-stop;
ffc50b2d382879 Abel Vesa             2023-01-06   289  			};
ffc50b2d382879 Abel Vesa             2023-01-06   290  
c779146b506627 Krzysztof Kozlowski   2024-10-22   291  			big_cpu_sleep_0: cpu-sleep-1-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   292  				compatible = "arm,idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   293  				idle-state-name = "gold-rail-power-collapse";
ffc50b2d382879 Abel Vesa             2023-01-06   294  				arm,psci-suspend-param = <0x40000004>;
ffc50b2d382879 Abel Vesa             2023-01-06   295  				entry-latency-us = <600>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   296  				exit-latency-us = <1300>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   297  				min-residency-us = <8136>;
ffc50b2d382879 Abel Vesa             2023-01-06   298  				local-timer-stop;
ffc50b2d382879 Abel Vesa             2023-01-06   299  			};
28b735232d5e16 Konrad Dybcio         2023-12-18   300  
c779146b506627 Krzysztof Kozlowski   2024-10-22   301  			prime_cpu_sleep_0: cpu-sleep-2-0 {
28b735232d5e16 Konrad Dybcio         2023-12-18   302  				compatible = "arm,idle-state";
28b735232d5e16 Konrad Dybcio         2023-12-18   303  				idle-state-name = "goldplus-rail-power-collapse";
28b735232d5e16 Konrad Dybcio         2023-12-18   304  				arm,psci-suspend-param = <0x40000004>;
28b735232d5e16 Konrad Dybcio         2023-12-18   305  				entry-latency-us = <500>;
28b735232d5e16 Konrad Dybcio         2023-12-18   306  				exit-latency-us = <1350>;
28b735232d5e16 Konrad Dybcio         2023-12-18   307  				min-residency-us = <7480>;
28b735232d5e16 Konrad Dybcio         2023-12-18   308  				local-timer-stop;
28b735232d5e16 Konrad Dybcio         2023-12-18   309  			};
ffc50b2d382879 Abel Vesa             2023-01-06   310  		};
ffc50b2d382879 Abel Vesa             2023-01-06   311  
ffc50b2d382879 Abel Vesa             2023-01-06   312  		domain-idle-states {
c779146b506627 Krzysztof Kozlowski   2024-10-22   313  			cluster_sleep_0: cluster-sleep-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   314  				compatible = "domain-idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   315  				arm,psci-suspend-param = <0x41000044>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   316  				entry-latency-us = <750>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   317  				exit-latency-us = <2350>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   318  				min-residency-us = <9144>;
ffc50b2d382879 Abel Vesa             2023-01-06   319  			};
ffc50b2d382879 Abel Vesa             2023-01-06   320  
c779146b506627 Krzysztof Kozlowski   2024-10-22   321  			cluster_sleep_1: cluster-sleep-1 {
ffc50b2d382879 Abel Vesa             2023-01-06   322  				compatible = "domain-idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   323  				arm,psci-suspend-param = <0x4100c344>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   324  				entry-latency-us = <2800>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   325  				exit-latency-us = <4400>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   326  				min-residency-us = <10150>;
ffc50b2d382879 Abel Vesa             2023-01-06   327  			};
ffc50b2d382879 Abel Vesa             2023-01-06   328  		};
ffc50b2d382879 Abel Vesa             2023-01-06   329  	};
ffc50b2d382879 Abel Vesa             2023-01-06   330  
ffc50b2d382879 Abel Vesa             2023-01-06   331  	firmware {
ffc50b2d382879 Abel Vesa             2023-01-06   332  		scm: scm {
ffc50b2d382879 Abel Vesa             2023-01-06   333  			compatible = "qcom,scm-sm8550", "qcom,scm";
44b1f64cad5703 Mukesh Ojha           2023-10-25   334  			qcom,dload-mode = <&tcsr 0x19000>;
54df5e52777e11 Neil Armstrong        2025-01-15   335  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   336  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06   337  		};
ffc50b2d382879 Abel Vesa             2023-01-06   338  	};
ffc50b2d382879 Abel Vesa             2023-01-06   339  
ffc50b2d382879 Abel Vesa             2023-01-06   340  	clk_virt: interconnect-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   341  		compatible = "qcom,sm8550-clk-virt";
ffc50b2d382879 Abel Vesa             2023-01-06   342  		#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   343  		qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06   344  	};
ffc50b2d382879 Abel Vesa             2023-01-06   345  
ffc50b2d382879 Abel Vesa             2023-01-06   346  	mc_virt: interconnect-1 {
ffc50b2d382879 Abel Vesa             2023-01-06   347  		compatible = "qcom,sm8550-mc-virt";
ffc50b2d382879 Abel Vesa             2023-01-06   348  		#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   349  		qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06   350  	};
ffc50b2d382879 Abel Vesa             2023-01-06   351  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   352  	qup_opp_table_100mhz: opp-table-qup100mhz {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   353  		compatible = "operating-points-v2";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   354  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   355  		opp-75000000 {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   356  			opp-hz = /bits/ 64 <75000000>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   357  			required-opps = <&rpmhpd_opp_low_svs>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   358  		};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   359  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   360  		opp-100000000 {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   361  			opp-hz = /bits/ 64 <100000000>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   362  			required-opps = <&rpmhpd_opp_svs>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   363  		};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   364  	};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   365  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   366  	qup_opp_table_120mhz: opp-table-qup120mhz {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   367  		compatible = "operating-points-v2";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   368  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   369  		opp-75000000 {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   370  			opp-hz = /bits/ 64 <75000000>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   371  			required-opps = <&rpmhpd_opp_low_svs>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   372  		};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   373  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   374  		opp-120000000 {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   375  			opp-hz = /bits/ 64 <120000000>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   376  			required-opps = <&rpmhpd_opp_svs>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   377  		};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   378  	};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   379  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   380  	qup_opp_table_125mhz: opp-table-qup125mhz {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   381  		compatible = "operating-points-v2";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   382  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   383  		opp-75000000 {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   384  			opp-hz = /bits/ 64 <75000000>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   385  			required-opps = <&rpmhpd_opp_low_svs>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   386  		};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   387  
ac2b7b1e8432fc Neil Armstrong        2025-01-15   388  		opp-125000000 {
ac2b7b1e8432fc Neil Armstrong        2025-01-15   389  			opp-hz = /bits/ 64 <125000000>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   390  			required-opps = <&rpmhpd_opp_svs>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   391  		};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   392  	};
ac2b7b1e8432fc Neil Armstrong        2025-01-15   393  
ffc50b2d382879 Abel Vesa             2023-01-06   394  	memory@a0000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   395  		device_type = "memory";
ffc50b2d382879 Abel Vesa             2023-01-06   396  		/* We expect the bootloader to fill in the size */
ffc50b2d382879 Abel Vesa             2023-01-06   397  		reg = <0 0xa0000000 0 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   398  	};
ffc50b2d382879 Abel Vesa             2023-01-06   399  
c8a346e408cb2e Rob Herring (Arm      2024-04-17   400) 	pmu-a510 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   401) 		compatible = "arm,cortex-a510-pmu";
c8a346e408cb2e Rob Herring (Arm      2024-04-17   402) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17   403) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17   404) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17   405) 	pmu-a710 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   406) 		compatible = "arm,cortex-a710-pmu";
c8a346e408cb2e Rob Herring (Arm      2024-04-17   407) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17   408) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17   409) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17   410) 	pmu-a715 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   411) 		compatible = "arm,cortex-a715-pmu";
c8a346e408cb2e Rob Herring (Arm      2024-04-17   412) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e Rob Herring (Arm      2024-04-17   413) 	};
c8a346e408cb2e Rob Herring (Arm      2024-04-17   414) 
c8a346e408cb2e Rob Herring (Arm      2024-04-17   415) 	pmu-x3 {
c8a346e408cb2e Rob Herring (Arm      2024-04-17   416) 		compatible = "arm,cortex-x3-pmu";
ffc50b2d382879 Abel Vesa             2023-01-06   417  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
ffc50b2d382879 Abel Vesa             2023-01-06   418  	};
ffc50b2d382879 Abel Vesa             2023-01-06   419  
ffc50b2d382879 Abel Vesa             2023-01-06   420  	psci {
ffc50b2d382879 Abel Vesa             2023-01-06   421  		compatible = "arm,psci-1.0";
ffc50b2d382879 Abel Vesa             2023-01-06   422  		method = "smc";
ffc50b2d382879 Abel Vesa             2023-01-06   423  
c779146b506627 Krzysztof Kozlowski   2024-10-22   424  		cpu_pd0: power-domain-cpu0 {
ffc50b2d382879 Abel Vesa             2023-01-06   425  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   426  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   427  			domain-idle-states = <&little_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   428  		};
ffc50b2d382879 Abel Vesa             2023-01-06   429  
c779146b506627 Krzysztof Kozlowski   2024-10-22   430  		cpu_pd1: power-domain-cpu1 {
ffc50b2d382879 Abel Vesa             2023-01-06   431  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   432  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   433  			domain-idle-states = <&little_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   434  		};
ffc50b2d382879 Abel Vesa             2023-01-06   435  
c779146b506627 Krzysztof Kozlowski   2024-10-22   436  		cpu_pd2: power-domain-cpu2 {
ffc50b2d382879 Abel Vesa             2023-01-06   437  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   438  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   439  			domain-idle-states = <&little_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   440  		};
ffc50b2d382879 Abel Vesa             2023-01-06   441  
c779146b506627 Krzysztof Kozlowski   2024-10-22   442  		cpu_pd3: power-domain-cpu3 {
ffc50b2d382879 Abel Vesa             2023-01-06   443  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   444  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   445  			domain-idle-states = <&big_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   446  		};
ffc50b2d382879 Abel Vesa             2023-01-06   447  
c779146b506627 Krzysztof Kozlowski   2024-10-22   448  		cpu_pd4: power-domain-cpu4 {
ffc50b2d382879 Abel Vesa             2023-01-06   449  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   450  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   451  			domain-idle-states = <&big_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   452  		};
ffc50b2d382879 Abel Vesa             2023-01-06   453  
c779146b506627 Krzysztof Kozlowski   2024-10-22   454  		cpu_pd5: power-domain-cpu5 {
ffc50b2d382879 Abel Vesa             2023-01-06   455  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   456  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   457  			domain-idle-states = <&big_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   458  		};
ffc50b2d382879 Abel Vesa             2023-01-06   459  
c779146b506627 Krzysztof Kozlowski   2024-10-22   460  		cpu_pd6: power-domain-cpu6 {
ffc50b2d382879 Abel Vesa             2023-01-06   461  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   462  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   463  			domain-idle-states = <&big_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   464  		};
ffc50b2d382879 Abel Vesa             2023-01-06   465  
c779146b506627 Krzysztof Kozlowski   2024-10-22   466  		cpu_pd7: power-domain-cpu7 {
ffc50b2d382879 Abel Vesa             2023-01-06   467  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   468  			power-domains = <&cluster_pd>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   469  			domain-idle-states = <&prime_cpu_sleep_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   470  		};
ffc50b2d382879 Abel Vesa             2023-01-06   471  
c779146b506627 Krzysztof Kozlowski   2024-10-22   472  		cluster_pd: power-domain-cluster {
ffc50b2d382879 Abel Vesa             2023-01-06   473  			#power-domain-cells = <0>;
c779146b506627 Krzysztof Kozlowski   2024-10-22   474  			domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>;
ffc50b2d382879 Abel Vesa             2023-01-06   475  		};
ffc50b2d382879 Abel Vesa             2023-01-06   476  	};
ffc50b2d382879 Abel Vesa             2023-01-06   477  
ffc50b2d382879 Abel Vesa             2023-01-06   478  	reserved_memory: reserved-memory {
ffc50b2d382879 Abel Vesa             2023-01-06   479  		#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   480  		#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   481  		ranges;
ffc50b2d382879 Abel Vesa             2023-01-06   482  
ffc50b2d382879 Abel Vesa             2023-01-06   483  		hyp_mem: hyp-region@80000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   484  			reg = <0 0x80000000 0 0xa00000>;
ffc50b2d382879 Abel Vesa             2023-01-06   485  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   486  		};
ffc50b2d382879 Abel Vesa             2023-01-06   487  
ffc50b2d382879 Abel Vesa             2023-01-06   488  		cpusys_vm_mem: cpusys-vm-region@80a00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   489  			reg = <0 0x80a00000 0 0x400000>;
ffc50b2d382879 Abel Vesa             2023-01-06   490  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   491  		};
ffc50b2d382879 Abel Vesa             2023-01-06   492  
ffc50b2d382879 Abel Vesa             2023-01-06   493  		hyp_tags_mem: hyp-tags-region@80e00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   494  			reg = <0 0x80e00000 0 0x3d0000>;
ffc50b2d382879 Abel Vesa             2023-01-06   495  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   496  		};
ffc50b2d382879 Abel Vesa             2023-01-06   497  
ffc50b2d382879 Abel Vesa             2023-01-06   498  		xbl_sc_mem: xbl-sc-region@d8100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   499  			reg = <0 0xd8100000 0 0x40000>;
ffc50b2d382879 Abel Vesa             2023-01-06   500  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   501  		};
ffc50b2d382879 Abel Vesa             2023-01-06   502  
ffc50b2d382879 Abel Vesa             2023-01-06   503  		hyp_tags_reserved_mem: hyp-tags-reserved-region@811d0000 {
ffc50b2d382879 Abel Vesa             2023-01-06   504  			reg = <0 0x811d0000 0 0x30000>;
ffc50b2d382879 Abel Vesa             2023-01-06   505  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   506  		};
ffc50b2d382879 Abel Vesa             2023-01-06   507  
ffc50b2d382879 Abel Vesa             2023-01-06   508  		/* merged xbl_dt_log, xbl_ramdump, aop_image */
ffc50b2d382879 Abel Vesa             2023-01-06   509  		xbl_dt_log_merged_mem: xbl-dt-log-merged-region@81a00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   510  			reg = <0 0x81a00000 0 0x260000>;
ffc50b2d382879 Abel Vesa             2023-01-06   511  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   512  		};
ffc50b2d382879 Abel Vesa             2023-01-06   513  
ffc50b2d382879 Abel Vesa             2023-01-06   514  		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
ffc50b2d382879 Abel Vesa             2023-01-06   515  			compatible = "qcom,cmd-db";
ffc50b2d382879 Abel Vesa             2023-01-06   516  			reg = <0 0x81c60000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06   517  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   518  		};
ffc50b2d382879 Abel Vesa             2023-01-06   519  
ffc50b2d382879 Abel Vesa             2023-01-06   520  		/* merged aop_config, tme_crash_dump, tme_log, uefi_log */
ffc50b2d382879 Abel Vesa             2023-01-06   521  		aop_config_merged_mem: aop-config-merged-region@81c80000 {
ffc50b2d382879 Abel Vesa             2023-01-06   522  			reg = <0 0x81c80000 0 0x74000>;
ffc50b2d382879 Abel Vesa             2023-01-06   523  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   524  		};
ffc50b2d382879 Abel Vesa             2023-01-06   525  
ffc50b2d382879 Abel Vesa             2023-01-06   526  		/* secdata region can be reused by apps */
ffc50b2d382879 Abel Vesa             2023-01-06   527  		smem: smem@81d00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   528  			compatible = "qcom,smem";
ffc50b2d382879 Abel Vesa             2023-01-06   529  			reg = <0 0x81d00000 0 0x200000>;
ffc50b2d382879 Abel Vesa             2023-01-06   530  			hwlocks = <&tcsr_mutex 3>;
ffc50b2d382879 Abel Vesa             2023-01-06   531  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   532  		};
ffc50b2d382879 Abel Vesa             2023-01-06   533  
ffc50b2d382879 Abel Vesa             2023-01-06   534  		adsp_mhi_mem: adsp-mhi-region@81f00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   535  			reg = <0 0x81f00000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06   536  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   537  		};
ffc50b2d382879 Abel Vesa             2023-01-06   538  
ffc50b2d382879 Abel Vesa             2023-01-06   539  		global_sync_mem: global-sync-region@82600000 {
ffc50b2d382879 Abel Vesa             2023-01-06   540  			reg = <0 0x82600000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   541  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   542  		};
ffc50b2d382879 Abel Vesa             2023-01-06   543  
ffc50b2d382879 Abel Vesa             2023-01-06   544  		tz_stat_mem: tz-stat-region@82700000 {
ffc50b2d382879 Abel Vesa             2023-01-06   545  			reg = <0 0x82700000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   546  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   547  		};
ffc50b2d382879 Abel Vesa             2023-01-06   548  
ffc50b2d382879 Abel Vesa             2023-01-06   549  		cdsp_secure_heap_mem: cdsp-secure-heap-region@82800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   550  			reg = <0 0x82800000 0 0x4600000>;
ffc50b2d382879 Abel Vesa             2023-01-06   551  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   552  		};
ffc50b2d382879 Abel Vesa             2023-01-06   553  
ffc50b2d382879 Abel Vesa             2023-01-06   554  		mpss_mem: mpss-region@8a800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   555  			reg = <0 0x8a800000 0 0x10800000>;
ffc50b2d382879 Abel Vesa             2023-01-06   556  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   557  		};
ffc50b2d382879 Abel Vesa             2023-01-06   558  
ffc50b2d382879 Abel Vesa             2023-01-06   559  		q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   560  			reg = <0 0x9b000000 0 0x80000>;
ffc50b2d382879 Abel Vesa             2023-01-06   561  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   562  		};
ffc50b2d382879 Abel Vesa             2023-01-06   563  
ffc50b2d382879 Abel Vesa             2023-01-06   564  		ipa_fw_mem: ipa-fw-region@9b080000 {
ffc50b2d382879 Abel Vesa             2023-01-06   565  			reg = <0 0x9b080000 0 0x10000>;
ffc50b2d382879 Abel Vesa             2023-01-06   566  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   567  		};
ffc50b2d382879 Abel Vesa             2023-01-06   568  
ffc50b2d382879 Abel Vesa             2023-01-06   569  		ipa_gsi_mem: ipa-gsi-region@9b090000 {
ffc50b2d382879 Abel Vesa             2023-01-06   570  			reg = <0 0x9b090000 0 0xa000>;
ffc50b2d382879 Abel Vesa             2023-01-06   571  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   572  		};
ffc50b2d382879 Abel Vesa             2023-01-06   573  
ffc50b2d382879 Abel Vesa             2023-01-06   574  		gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
ffc50b2d382879 Abel Vesa             2023-01-06   575  			reg = <0 0x9b09a000 0 0x2000>;
ffc50b2d382879 Abel Vesa             2023-01-06   576  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   577  		};
ffc50b2d382879 Abel Vesa             2023-01-06   578  
ffc50b2d382879 Abel Vesa             2023-01-06   579  		spss_region_mem: spss-region@9b100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   580  			reg = <0 0x9b100000 0 0x180000>;
ffc50b2d382879 Abel Vesa             2023-01-06   581  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   582  		};
ffc50b2d382879 Abel Vesa             2023-01-06   583  
ffc50b2d382879 Abel Vesa             2023-01-06   584  		/* First part of the "SPU secure shared memory" region */
ffc50b2d382879 Abel Vesa             2023-01-06   585  		spu_tz_shared_mem: spu-tz-shared-region@9b280000 {
ffc50b2d382879 Abel Vesa             2023-01-06   586  			reg = <0 0x9b280000 0 0x60000>;
ffc50b2d382879 Abel Vesa             2023-01-06   587  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   588  		};
ffc50b2d382879 Abel Vesa             2023-01-06   589  
ffc50b2d382879 Abel Vesa             2023-01-06   590  		/* Second part of the "SPU secure shared memory" region */
ffc50b2d382879 Abel Vesa             2023-01-06   591  		spu_modem_shared_mem: spu-modem-shared-region@9b2e0000 {
ffc50b2d382879 Abel Vesa             2023-01-06   592  			reg = <0 0x9b2e0000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06   593  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   594  		};
ffc50b2d382879 Abel Vesa             2023-01-06   595  
ffc50b2d382879 Abel Vesa             2023-01-06   596  		camera_mem: camera-region@9b300000 {
ffc50b2d382879 Abel Vesa             2023-01-06   597  			reg = <0 0x9b300000 0 0x800000>;
ffc50b2d382879 Abel Vesa             2023-01-06   598  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   599  		};
ffc50b2d382879 Abel Vesa             2023-01-06   600  
ffc50b2d382879 Abel Vesa             2023-01-06   601  		video_mem: video-region@9bb00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   602  			reg = <0 0x9bb00000 0 0x700000>;
ffc50b2d382879 Abel Vesa             2023-01-06   603  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   604  		};
ffc50b2d382879 Abel Vesa             2023-01-06   605  
ffc50b2d382879 Abel Vesa             2023-01-06   606  		cvp_mem: cvp-region@9c200000 {
ffc50b2d382879 Abel Vesa             2023-01-06   607  			reg = <0 0x9c200000 0 0x700000>;
ffc50b2d382879 Abel Vesa             2023-01-06   608  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   609  		};
ffc50b2d382879 Abel Vesa             2023-01-06   610  
ffc50b2d382879 Abel Vesa             2023-01-06   611  		cdsp_mem: cdsp-region@9c900000 {
ffc50b2d382879 Abel Vesa             2023-01-06   612  			reg = <0 0x9c900000 0 0x2000000>;
ffc50b2d382879 Abel Vesa             2023-01-06   613  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   614  		};
ffc50b2d382879 Abel Vesa             2023-01-06   615  
ffc50b2d382879 Abel Vesa             2023-01-06   616  		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
ffc50b2d382879 Abel Vesa             2023-01-06   617  			reg = <0 0x9e900000 0 0x80000>;
ffc50b2d382879 Abel Vesa             2023-01-06   618  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   619  		};
ffc50b2d382879 Abel Vesa             2023-01-06   620  
ffc50b2d382879 Abel Vesa             2023-01-06   621  		q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
ffc50b2d382879 Abel Vesa             2023-01-06   622  			reg = <0 0x9e980000 0 0x80000>;
ffc50b2d382879 Abel Vesa             2023-01-06   623  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   624  		};
ffc50b2d382879 Abel Vesa             2023-01-06   625  
ffc50b2d382879 Abel Vesa             2023-01-06   626  		adspslpi_mem: adspslpi-region@9ea00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   627  			reg = <0 0x9ea00000 0 0x4080000>;
ffc50b2d382879 Abel Vesa             2023-01-06   628  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   629  		};
ffc50b2d382879 Abel Vesa             2023-01-06   630  
ffc50b2d382879 Abel Vesa             2023-01-06   631  		/* uefi region can be reused by apps */
ffc50b2d382879 Abel Vesa             2023-01-06   632  
ffc50b2d382879 Abel Vesa             2023-01-06   633  		/* Linux kernel image is loaded at 0xa8000000 */
ffc50b2d382879 Abel Vesa             2023-01-06   634  
d0c061e366ed55 Neil Armstrong        2023-01-18   635  		rmtfs_mem: rmtfs-region@d4a80000 {
d0c061e366ed55 Neil Armstrong        2023-01-18   636  			compatible = "qcom,rmtfs-mem";
d0c061e366ed55 Neil Armstrong        2023-01-18   637  			reg = <0x0 0xd4a80000 0x0 0x280000>;
d0c061e366ed55 Neil Armstrong        2023-01-18   638  			no-map;
d0c061e366ed55 Neil Armstrong        2023-01-18   639  
d0c061e366ed55 Neil Armstrong        2023-01-18   640  			qcom,client-id = <1>;
018c949b32df9f Luca Weiss            2023-08-18   641  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
d0c061e366ed55 Neil Armstrong        2023-01-18   642  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   643  
ffc50b2d382879 Abel Vesa             2023-01-06   644  		mpss_dsm_mem: mpss-dsm-region@d4d00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   645  			reg = <0 0xd4d00000 0 0x3300000>;
ffc50b2d382879 Abel Vesa             2023-01-06   646  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   647  		};
ffc50b2d382879 Abel Vesa             2023-01-06   648  
ffc50b2d382879 Abel Vesa             2023-01-06   649  		tz_reserved_mem: tz-reserved-region@d8000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   650  			reg = <0 0xd8000000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   651  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   652  		};
ffc50b2d382879 Abel Vesa             2023-01-06   653  
ffc50b2d382879 Abel Vesa             2023-01-06   654  		cpucp_fw_mem: cpucp-fw-region@d8140000 {
ffc50b2d382879 Abel Vesa             2023-01-06   655  			reg = <0 0xd8140000 0 0x1c0000>;
ffc50b2d382879 Abel Vesa             2023-01-06   656  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   657  		};
ffc50b2d382879 Abel Vesa             2023-01-06   658  
ffc50b2d382879 Abel Vesa             2023-01-06   659  		qtee_mem: qtee-region@d8300000 {
ffc50b2d382879 Abel Vesa             2023-01-06   660  			reg = <0 0xd8300000 0 0x500000>;
ffc50b2d382879 Abel Vesa             2023-01-06   661  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   662  		};
ffc50b2d382879 Abel Vesa             2023-01-06   663  
ffc50b2d382879 Abel Vesa             2023-01-06   664  		ta_mem: ta-region@d8800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   665  			reg = <0 0xd8800000 0 0x8a00000>;
ffc50b2d382879 Abel Vesa             2023-01-06   666  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   667  		};
ffc50b2d382879 Abel Vesa             2023-01-06   668  
ffc50b2d382879 Abel Vesa             2023-01-06   669  		tz_tags_mem: tz-tags-region@e1200000 {
ffc50b2d382879 Abel Vesa             2023-01-06   670  			reg = <0 0xe1200000 0 0x2740000>;
ffc50b2d382879 Abel Vesa             2023-01-06   671  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   672  		};
ffc50b2d382879 Abel Vesa             2023-01-06   673  
ffc50b2d382879 Abel Vesa             2023-01-06   674  		hwfence_shbuf: hwfence-shbuf-region@e6440000 {
ffc50b2d382879 Abel Vesa             2023-01-06   675  			reg = <0 0xe6440000 0 0x279000>;
ffc50b2d382879 Abel Vesa             2023-01-06   676  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   677  		};
ffc50b2d382879 Abel Vesa             2023-01-06   678  
ffc50b2d382879 Abel Vesa             2023-01-06   679  		trust_ui_vm_mem: trust-ui-vm-region@f3600000 {
ffc50b2d382879 Abel Vesa             2023-01-06   680  			reg = <0 0xf3600000 0 0x4aee000>;
ffc50b2d382879 Abel Vesa             2023-01-06   681  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   682  		};
ffc50b2d382879 Abel Vesa             2023-01-06   683  
ffc50b2d382879 Abel Vesa             2023-01-06   684  		trust_ui_vm_dump: trust-ui-vm-dump-region@f80ee000 {
ffc50b2d382879 Abel Vesa             2023-01-06   685  			reg = <0 0xf80ee000 0 0x1000>;
ffc50b2d382879 Abel Vesa             2023-01-06   686  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   687  		};
ffc50b2d382879 Abel Vesa             2023-01-06   688  
ffc50b2d382879 Abel Vesa             2023-01-06   689  		trust_ui_vm_qrtr: trust-ui-vm-qrt-region@f80ef000 {
ffc50b2d382879 Abel Vesa             2023-01-06   690  			reg = <0 0xf80ef000 0 0x9000>;
ffc50b2d382879 Abel Vesa             2023-01-06   691  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   692  		};
ffc50b2d382879 Abel Vesa             2023-01-06   693  
ffc50b2d382879 Abel Vesa             2023-01-06   694  		trust_ui_vm_vblk0_ring: trust-ui-vm-vblk0-ring-region@f80f8000 {
ffc50b2d382879 Abel Vesa             2023-01-06   695  			reg = <0 0xf80f8000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   696  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   697  		};
ffc50b2d382879 Abel Vesa             2023-01-06   698  
ffc50b2d382879 Abel Vesa             2023-01-06   699  		trust_ui_vm_vblk1_ring: trust-ui-vm-vblk1-ring-region@f80fc000 {
ffc50b2d382879 Abel Vesa             2023-01-06   700  			reg = <0 0xf80fc000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   701  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   702  		};
ffc50b2d382879 Abel Vesa             2023-01-06   703  
ffc50b2d382879 Abel Vesa             2023-01-06   704  		trust_ui_vm_swiotlb: trust-ui-vm-swiotlb-region@f8100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   705  			reg = <0 0xf8100000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   706  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   707  		};
ffc50b2d382879 Abel Vesa             2023-01-06   708  
ffc50b2d382879 Abel Vesa             2023-01-06   709  		oem_vm_mem: oem-vm-region@f8400000 {
ffc50b2d382879 Abel Vesa             2023-01-06   710  			reg = <0 0xf8400000 0 0x4800000>;
ffc50b2d382879 Abel Vesa             2023-01-06   711  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   712  		};
ffc50b2d382879 Abel Vesa             2023-01-06   713  
ffc50b2d382879 Abel Vesa             2023-01-06   714  		oem_vm_vblk0_ring: oem-vm-vblk0-ring-region@fcc00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   715  			reg = <0 0xfcc00000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   716  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   717  		};
ffc50b2d382879 Abel Vesa             2023-01-06   718  
ffc50b2d382879 Abel Vesa             2023-01-06   719  		oem_vm_swiotlb: oem-vm-swiotlb-region@fcc04000 {
ffc50b2d382879 Abel Vesa             2023-01-06   720  			reg = <0 0xfcc04000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   721  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   722  		};
ffc50b2d382879 Abel Vesa             2023-01-06   723  
ffc50b2d382879 Abel Vesa             2023-01-06   724  		hyp_ext_tags_mem: hyp-ext-tags-region@fce00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   725  			reg = <0 0xfce00000 0 0x2900000>;
ffc50b2d382879 Abel Vesa             2023-01-06   726  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   727  		};
ffc50b2d382879 Abel Vesa             2023-01-06   728  
ffc50b2d382879 Abel Vesa             2023-01-06   729  		hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
ffc50b2d382879 Abel Vesa             2023-01-06   730  			reg = <0 0xff700000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   731  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   732  		};
ffc50b2d382879 Abel Vesa             2023-01-06   733  	};
ffc50b2d382879 Abel Vesa             2023-01-06   734  
d0c061e366ed55 Neil Armstrong        2023-01-18   735  	smp2p-adsp {
d0c061e366ed55 Neil Armstrong        2023-01-18   736  		compatible = "qcom,smp2p";
d0c061e366ed55 Neil Armstrong        2023-01-18   737  		qcom,smem = <443>, <429>;
d0c061e366ed55 Neil Armstrong        2023-01-18   738  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
d0c061e366ed55 Neil Armstrong        2023-01-18   739  					     IPCC_MPROC_SIGNAL_SMP2P
d0c061e366ed55 Neil Armstrong        2023-01-18   740  					     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18   741  		mboxes = <&ipcc IPCC_CLIENT_LPASS
d0c061e366ed55 Neil Armstrong        2023-01-18   742  				IPCC_MPROC_SIGNAL_SMP2P>;
d0c061e366ed55 Neil Armstrong        2023-01-18   743  
d0c061e366ed55 Neil Armstrong        2023-01-18   744  		qcom,local-pid = <0>;
d0c061e366ed55 Neil Armstrong        2023-01-18   745  		qcom,remote-pid = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   746  
d0c061e366ed55 Neil Armstrong        2023-01-18   747  		smp2p_adsp_out: master-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   748  			qcom,entry-name = "master-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   749  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   750  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   751  
d0c061e366ed55 Neil Armstrong        2023-01-18   752  		smp2p_adsp_in: slave-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   753  			qcom,entry-name = "slave-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   754  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   755  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   756  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   757  	};
d0c061e366ed55 Neil Armstrong        2023-01-18   758  
d0c061e366ed55 Neil Armstrong        2023-01-18   759  	smp2p-cdsp {
d0c061e366ed55 Neil Armstrong        2023-01-18   760  		compatible = "qcom,smp2p";
d0c061e366ed55 Neil Armstrong        2023-01-18   761  		qcom,smem = <94>, <432>;
d0c061e366ed55 Neil Armstrong        2023-01-18   762  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
d0c061e366ed55 Neil Armstrong        2023-01-18   763  					     IPCC_MPROC_SIGNAL_SMP2P
d0c061e366ed55 Neil Armstrong        2023-01-18   764  					     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18   765  		mboxes = <&ipcc IPCC_CLIENT_CDSP
d0c061e366ed55 Neil Armstrong        2023-01-18   766  				IPCC_MPROC_SIGNAL_SMP2P>;
d0c061e366ed55 Neil Armstrong        2023-01-18   767  
d0c061e366ed55 Neil Armstrong        2023-01-18   768  		qcom,local-pid = <0>;
d0c061e366ed55 Neil Armstrong        2023-01-18   769  		qcom,remote-pid = <5>;
d0c061e366ed55 Neil Armstrong        2023-01-18   770  
d0c061e366ed55 Neil Armstrong        2023-01-18   771  		smp2p_cdsp_out: master-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   772  			qcom,entry-name = "master-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   773  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   774  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   775  
d0c061e366ed55 Neil Armstrong        2023-01-18   776  		smp2p_cdsp_in: slave-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   777  			qcom,entry-name = "slave-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   778  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   779  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   780  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   781  	};
d0c061e366ed55 Neil Armstrong        2023-01-18   782  
d0c061e366ed55 Neil Armstrong        2023-01-18   783  	smp2p-modem {
d0c061e366ed55 Neil Armstrong        2023-01-18   784  		compatible = "qcom,smp2p";
d0c061e366ed55 Neil Armstrong        2023-01-18   785  		qcom,smem = <435>, <428>;
d0c061e366ed55 Neil Armstrong        2023-01-18   786  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18   787  					     IPCC_MPROC_SIGNAL_SMP2P
d0c061e366ed55 Neil Armstrong        2023-01-18   788  					     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18   789  		mboxes = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18   790  				IPCC_MPROC_SIGNAL_SMP2P>;
d0c061e366ed55 Neil Armstrong        2023-01-18   791  
d0c061e366ed55 Neil Armstrong        2023-01-18   792  		qcom,local-pid = <0>;
d0c061e366ed55 Neil Armstrong        2023-01-18   793  		qcom,remote-pid = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   794  
d0c061e366ed55 Neil Armstrong        2023-01-18   795  		smp2p_modem_out: master-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   796  			qcom,entry-name = "master-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   797  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   798  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   799  
d0c061e366ed55 Neil Armstrong        2023-01-18   800  		smp2p_modem_in: slave-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   801  			qcom,entry-name = "slave-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   802  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   803  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   804  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   805  
d0c061e366ed55 Neil Armstrong        2023-01-18   806  		ipa_smp2p_out: ipa-ap-to-modem {
d0c061e366ed55 Neil Armstrong        2023-01-18   807  			qcom,entry-name = "ipa";
d0c061e366ed55 Neil Armstrong        2023-01-18   808  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   809  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   810  
d0c061e366ed55 Neil Armstrong        2023-01-18   811  		ipa_smp2p_in: ipa-modem-to-ap {
d0c061e366ed55 Neil Armstrong        2023-01-18   812  			qcom,entry-name = "ipa";
d0c061e366ed55 Neil Armstrong        2023-01-18   813  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   814  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   815  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   816  	};
d0c061e366ed55 Neil Armstrong        2023-01-18   817  
ffc50b2d382879 Abel Vesa             2023-01-06   818  	soc: soc@0 {
ffc50b2d382879 Abel Vesa             2023-01-06   819  		compatible = "simple-bus";
ffc50b2d382879 Abel Vesa             2023-01-06   820  		ranges = <0 0 0 0 0x10 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   821  		dma-ranges = <0 0 0 0 0x10 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   822  
ffc50b2d382879 Abel Vesa             2023-01-06   823  		#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   824  		#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   825  
ffc50b2d382879 Abel Vesa             2023-01-06   826  		gcc: clock-controller@100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   827  			compatible = "qcom,sm8550-gcc";
ffc50b2d382879 Abel Vesa             2023-01-06   828  			reg = <0 0x00100000 0 0x1f4200>;
ffc50b2d382879 Abel Vesa             2023-01-06   829  			#clock-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   830  			#reset-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   831  			#power-domain-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   832  			clocks = <&bi_tcxo_div2>, <&sleep_clk>,
7d1158c984d37e Abel Vesa             2023-01-19   833  				 <&pcie0_phy>,
0cc97d9e3fdf9a Neil Armstrong        2024-05-02   834  				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
0cc97d9e3fdf9a Neil Armstrong        2024-05-02   835  				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16   836  				 <&ufs_mem_phy 0>,
35cf1aaab169e0 Abel Vesa             2023-01-16   837  				 <&ufs_mem_phy 1>,
35cf1aaab169e0 Abel Vesa             2023-01-16   838  				 <&ufs_mem_phy 2>,
7f7e5c1b037fc3 Abel Vesa             2023-01-19   839  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   840  		};
ffc50b2d382879 Abel Vesa             2023-01-06   841  
ffc50b2d382879 Abel Vesa             2023-01-06   842  		ipcc: mailbox@408000 {
ffc50b2d382879 Abel Vesa             2023-01-06   843  			compatible = "qcom,sm8550-ipcc", "qcom,ipcc";
ffc50b2d382879 Abel Vesa             2023-01-06   844  			reg = <0 0x00408000 0 0x1000>;
ffc50b2d382879 Abel Vesa             2023-01-06   845  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   846  			interrupt-controller;
ffc50b2d382879 Abel Vesa             2023-01-06   847  			#interrupt-cells = <3>;
ffc50b2d382879 Abel Vesa             2023-01-06   848  			#mbox-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   849  		};
ffc50b2d382879 Abel Vesa             2023-01-06   850  
ffc50b2d382879 Abel Vesa             2023-01-06   851  		gpi_dma2: dma-controller@800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   852  			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
ffc50b2d382879 Abel Vesa             2023-01-06   853  			#dma-cells = <3>;
ffc50b2d382879 Abel Vesa             2023-01-06   854  			reg = <0 0x00800000 0 0x60000>;
ffc50b2d382879 Abel Vesa             2023-01-06   855  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   856  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   857  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   858  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   859  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   860  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   861  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   862  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   863  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   864  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   865  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   866  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   867  			dma-channels = <12>;
ffc50b2d382879 Abel Vesa             2023-01-06   868  			dma-channel-mask = <0x3e>;
ffc50b2d382879 Abel Vesa             2023-01-06   869  			iommus = <&apps_smmu 0x436 0>;
91fc74458d833d Konrad Dybcio         2024-02-12   870  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06   871  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   872  		};
ffc50b2d382879 Abel Vesa             2023-01-06   873  
ffc50b2d382879 Abel Vesa             2023-01-06   874  		qupv3_id_1: geniqup@8c0000 {
ffc50b2d382879 Abel Vesa             2023-01-06   875  			compatible = "qcom,geni-se-qup";
ffc50b2d382879 Abel Vesa             2023-01-06   876  			reg = <0 0x008c0000 0 0x2000>;
ffc50b2d382879 Abel Vesa             2023-01-06   877  			ranges;
ffc50b2d382879 Abel Vesa             2023-01-06   878  			clock-names = "m-ahb", "s-ahb";
ffc50b2d382879 Abel Vesa             2023-01-06   879  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06   880  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   881  			iommus = <&apps_smmu 0x423 0>;
91fc74458d833d Konrad Dybcio         2024-02-12   882  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06   883  			#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   884  			#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   885  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   886  
ffc50b2d382879 Abel Vesa             2023-01-06   887  			i2c8: i2c@880000 {
ffc50b2d382879 Abel Vesa             2023-01-06   888  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   889  				reg = <0 0x00880000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   890  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   891  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   892  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   893  				pinctrl-0 = <&qup_i2c8_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   894  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   895  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   896  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15   897  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   898  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15   899  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15   900  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15   901  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   902  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06   903  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   904  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   905  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   906  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   907  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   908  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06   909  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   910  			};
ffc50b2d382879 Abel Vesa             2023-01-06   911  
ffc50b2d382879 Abel Vesa             2023-01-06   912  			spi8: spi@880000 {
ffc50b2d382879 Abel Vesa             2023-01-06   913  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06   914  				reg = <0 0x00880000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   915  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   916  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   917  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   918  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   919  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15   920  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   921  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15   922  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15   923  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15   924  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   925  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06   926  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   927  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06   928  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06   929  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   930  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   931  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06   932  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   933  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   934  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   935  			};
ffc50b2d382879 Abel Vesa             2023-01-06   936  
ffc50b2d382879 Abel Vesa             2023-01-06   937  			i2c9: i2c@884000 {
ffc50b2d382879 Abel Vesa             2023-01-06   938  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   939  				reg = <0 0x00884000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   940  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   941  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   942  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   943  				pinctrl-0 = <&qup_i2c9_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   944  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   945  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   946  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15   947  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   948  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15   949  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15   950  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15   951  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   952  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06   953  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   954  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   955  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   956  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   957  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   958  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06   959  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   960  			};
ffc50b2d382879 Abel Vesa             2023-01-06   961  
ffc50b2d382879 Abel Vesa             2023-01-06   962  			spi9: spi@884000 {
ffc50b2d382879 Abel Vesa             2023-01-06   963  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06   964  				reg = <0 0x00884000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   965  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   966  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   967  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   968  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   969  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15   970  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   971  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15   972  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15   973  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15   974  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   975  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06   976  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   977  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06   978  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06   979  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15   980  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15   981  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06   982  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   983  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   984  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   985  			};
ffc50b2d382879 Abel Vesa             2023-01-06   986  
ffc50b2d382879 Abel Vesa             2023-01-06   987  			i2c10: i2c@888000 {
ffc50b2d382879 Abel Vesa             2023-01-06   988  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   989  				reg = <0 0x00888000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   990  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   991  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   992  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   993  				pinctrl-0 = <&qup_i2c10_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   994  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   995  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   996  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15   997  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15   998  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15   999  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1000  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1001  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1002  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1003  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1004  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1005  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1006  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1007  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1008  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1009  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1010  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1011  
ffc50b2d382879 Abel Vesa             2023-01-06  1012  			spi10: spi@888000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1013  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1014  				reg = <0 0x00888000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1015  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1016  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1017  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1018  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1019  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1020  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1021  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1022  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1023  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1024  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1025  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1026  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1027  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1028  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1029  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1030  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1031  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1032  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1033  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1034  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1035  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1036  
ffc50b2d382879 Abel Vesa             2023-01-06  1037  			i2c11: i2c@88c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1038  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1039  				reg = <0 0x0088c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1040  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1041  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1042  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1043  				pinctrl-0 = <&qup_i2c11_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1044  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1045  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1046  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1047  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1048  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1049  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1050  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1051  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1052  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1053  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1054  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1055  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1056  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1057  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1058  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1059  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1060  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1061  
ffc50b2d382879 Abel Vesa             2023-01-06  1062  			spi11: spi@88c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1063  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1064  				reg = <0 0x0088c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1065  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1066  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1067  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1068  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1069  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1070  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1071  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1072  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1073  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1074  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1075  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1076  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1077  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1078  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1079  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1080  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1081  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1082  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1083  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1084  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1085  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1086  
ffc50b2d382879 Abel Vesa             2023-01-06  1087  			i2c12: i2c@890000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1088  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1089  				reg = <0 0x00890000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1090  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1091  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1092  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1093  				pinctrl-0 = <&qup_i2c12_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1094  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1095  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1096  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1097  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1098  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1099  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1100  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1101  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1102  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1103  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1104  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1105  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1106  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1107  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1108  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1109  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1110  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1111  
ffc50b2d382879 Abel Vesa             2023-01-06  1112  			spi12: spi@890000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1113  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1114  				reg = <0 0x00890000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1115  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1116  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1117  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1118  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1119  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1120  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1121  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1122  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1123  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1124  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1125  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1126  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1127  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1128  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1129  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1130  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1131  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1132  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1133  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1134  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1135  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1136  
ffc50b2d382879 Abel Vesa             2023-01-06  1137  			i2c13: i2c@894000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1138  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1139  				reg = <0 0x00894000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1140  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1141  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1142  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1143  				pinctrl-0 = <&qup_i2c13_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1144  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1145  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1146  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1147  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1148  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1149  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1150  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1151  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1152  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1153  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1154  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1155  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1156  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1157  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1158  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1159  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1160  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1161  
ffc50b2d382879 Abel Vesa             2023-01-06  1162  			spi13: spi@894000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1163  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1164  				reg = <0 0x00894000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1165  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1166  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1167  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1168  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1169  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1170  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1171  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1172  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1173  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1174  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1175  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1176  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1177  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1178  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1179  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1180  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1181  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1182  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1183  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1184  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1185  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1186  
75cac709029897 Neil Armstrong        2023-09-11  1187  			uart14: serial@898000 {
75cac709029897 Neil Armstrong        2023-09-11  1188  				compatible = "qcom,geni-uart";
75cac709029897 Neil Armstrong        2023-09-11  1189  				reg = <0 0x898000 0 0x4000>;
75cac709029897 Neil Armstrong        2023-09-11  1190  				clock-names = "se";
75cac709029897 Neil Armstrong        2023-09-11  1191  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
75cac709029897 Neil Armstrong        2023-09-11  1192  				pinctrl-names = "default";
75cac709029897 Neil Armstrong        2023-09-11  1193  				pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
75cac709029897 Neil Armstrong        2023-09-11  1194  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
54df5e52777e11 Neil Armstrong        2025-01-15  1195  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1196  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1197  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1198  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
75cac709029897 Neil Armstrong        2023-09-11  1199  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1200  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1201  				operating-points-v2 = <&qup_opp_table_125mhz>;
75cac709029897 Neil Armstrong        2023-09-11  1202  				status = "disabled";
75cac709029897 Neil Armstrong        2023-09-11  1203  			};
75cac709029897 Neil Armstrong        2023-09-11  1204  
ffc50b2d382879 Abel Vesa             2023-01-06  1205  			i2c15: i2c@89c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1206  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1207  				reg = <0 0x0089c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1208  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1209  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1210  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1211  				pinctrl-0 = <&qup_i2c15_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1212  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1213  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1214  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1215  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1216  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1217  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1218  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1219  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1220  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1221  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1222  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1223  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1224  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1225  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1226  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1227  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1228  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1229  
ffc50b2d382879 Abel Vesa             2023-01-06  1230  			spi15: spi@89c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1231  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1232  				reg = <0 0x0089c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1233  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1234  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1235  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1236  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1237  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1238  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1239  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1240  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1241  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1242  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1243  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1244  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1245  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1246  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1247  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1248  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1249  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1250  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1251  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1252  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1253  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1254  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1255  
377972ac743f54 Neil Armstrong        2022-11-16  1256  		i2c_master_hub_0: geniqup@9c0000 {
377972ac743f54 Neil Armstrong        2022-11-16  1257  			compatible = "qcom,geni-se-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1258  			reg = <0x0 0x009c0000 0x0 0x2000>;
377972ac743f54 Neil Armstrong        2022-11-16  1259  			clock-names = "s-ahb";
377972ac743f54 Neil Armstrong        2022-11-16  1260  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1261  			#address-cells = <2>;
377972ac743f54 Neil Armstrong        2022-11-16  1262  			#size-cells = <2>;
377972ac743f54 Neil Armstrong        2022-11-16  1263  			ranges;
377972ac743f54 Neil Armstrong        2022-11-16  1264  			status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1265  
377972ac743f54 Neil Armstrong        2022-11-16  1266  			i2c_hub_0: i2c@980000 {
377972ac743f54 Neil Armstrong        2022-11-16  1267  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1268  				reg = <0x0 0x00980000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1269  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1270  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1271  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1272  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1273  				pinctrl-0 = <&hub_i2c0_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1274  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1275  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1276  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1277  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1278  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1279  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1280  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1281  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1282  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1283  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1284  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1285  			};
377972ac743f54 Neil Armstrong        2022-11-16  1286  
377972ac743f54 Neil Armstrong        2022-11-16  1287  			i2c_hub_1: i2c@984000 {
377972ac743f54 Neil Armstrong        2022-11-16  1288  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1289  				reg = <0x0 0x00984000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1290  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1291  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1292  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1293  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1294  				pinctrl-0 = <&hub_i2c1_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1295  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1296  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1297  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1298  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1299  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1300  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1301  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1302  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1303  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1304  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1305  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1306  			};
377972ac743f54 Neil Armstrong        2022-11-16  1307  
377972ac743f54 Neil Armstrong        2022-11-16  1308  			i2c_hub_2: i2c@988000 {
377972ac743f54 Neil Armstrong        2022-11-16  1309  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1310  				reg = <0x0 0x00988000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1311  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1312  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1313  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1314  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1315  				pinctrl-0 = <&hub_i2c2_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1316  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1317  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1318  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1319  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1320  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1321  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1322  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1323  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1324  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1325  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1326  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1327  			};
377972ac743f54 Neil Armstrong        2022-11-16  1328  
377972ac743f54 Neil Armstrong        2022-11-16  1329  			i2c_hub_3: i2c@98c000 {
377972ac743f54 Neil Armstrong        2022-11-16  1330  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1331  				reg = <0x0 0x0098c000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1332  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1333  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1334  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1335  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1336  				pinctrl-0 = <&hub_i2c3_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1337  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1338  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1339  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1340  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1341  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1342  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1343  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1344  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1345  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1346  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1347  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1348  			};
377972ac743f54 Neil Armstrong        2022-11-16  1349  
377972ac743f54 Neil Armstrong        2022-11-16  1350  			i2c_hub_4: i2c@990000 {
377972ac743f54 Neil Armstrong        2022-11-16  1351  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1352  				reg = <0x0 0x00990000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1353  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1354  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1355  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1356  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1357  				pinctrl-0 = <&hub_i2c4_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1358  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1359  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1360  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1361  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1362  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1363  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1364  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1365  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1366  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1367  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1368  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1369  			};
377972ac743f54 Neil Armstrong        2022-11-16  1370  
377972ac743f54 Neil Armstrong        2022-11-16  1371  			i2c_hub_5: i2c@994000 {
377972ac743f54 Neil Armstrong        2022-11-16  1372  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1373  				reg = <0 0x00994000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1374  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1375  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1376  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1377  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1378  				pinctrl-0 = <&hub_i2c5_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1379  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1380  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1381  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1382  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1383  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1384  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1385  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1386  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1387  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1388  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1389  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1390  			};
377972ac743f54 Neil Armstrong        2022-11-16  1391  
377972ac743f54 Neil Armstrong        2022-11-16  1392  			i2c_hub_6: i2c@998000 {
377972ac743f54 Neil Armstrong        2022-11-16  1393  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1394  				reg = <0 0x00998000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1395  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1396  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1397  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1398  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1399  				pinctrl-0 = <&hub_i2c6_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1400  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1401  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1402  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1403  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1404  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1405  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1406  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1407  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1408  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1409  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1410  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1411  			};
377972ac743f54 Neil Armstrong        2022-11-16  1412  
377972ac743f54 Neil Armstrong        2022-11-16  1413  			i2c_hub_7: i2c@99c000 {
377972ac743f54 Neil Armstrong        2022-11-16  1414  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1415  				reg = <0 0x0099c000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1416  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1417  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1418  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1419  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1420  				pinctrl-0 = <&hub_i2c7_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1421  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1422  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1423  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1424  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1425  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1426  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1427  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1428  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1429  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1430  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1431  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1432  			};
377972ac743f54 Neil Armstrong        2022-11-16  1433  
377972ac743f54 Neil Armstrong        2022-11-16  1434  			i2c_hub_8: i2c@9a0000 {
377972ac743f54 Neil Armstrong        2022-11-16  1435  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1436  				reg = <0 0x009a0000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1437  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1438  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1439  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1440  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1441  				pinctrl-0 = <&hub_i2c8_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1442  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1443  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1444  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1445  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1446  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1447  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1448  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1449  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1450  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1451  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1452  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1453  			};
377972ac743f54 Neil Armstrong        2022-11-16  1454  
377972ac743f54 Neil Armstrong        2022-11-16  1455  			i2c_hub_9: i2c@9a4000 {
377972ac743f54 Neil Armstrong        2022-11-16  1456  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1457  				reg = <0 0x009a4000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1458  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1459  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1460  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1461  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1462  				pinctrl-0 = <&hub_i2c9_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1463  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1464  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1465  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1466  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1467  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1468  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1469  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
377972ac743f54 Neil Armstrong        2022-11-16  1470  				interconnect-names = "qup-core", "qup-config";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1471  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1472  				required-opps = <&rpmhpd_opp_low_svs>;
377972ac743f54 Neil Armstrong        2022-11-16  1473  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1474  			};
377972ac743f54 Neil Armstrong        2022-11-16  1475  		};
377972ac743f54 Neil Armstrong        2022-11-16  1476  
ffc50b2d382879 Abel Vesa             2023-01-06  1477  		gpi_dma1: dma-controller@a00000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1478  			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
ffc50b2d382879 Abel Vesa             2023-01-06  1479  			#dma-cells = <3>;
ffc50b2d382879 Abel Vesa             2023-01-06  1480  			reg = <0 0x00a00000 0 0x60000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1481  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1482  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1483  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1484  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1485  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1486  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1487  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1488  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1489  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1490  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1491  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1492  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1493  			dma-channels = <12>;
ffc50b2d382879 Abel Vesa             2023-01-06  1494  			dma-channel-mask = <0x1e>;
ffc50b2d382879 Abel Vesa             2023-01-06  1495  			iommus = <&apps_smmu 0xb6 0>;
91fc74458d833d Konrad Dybcio         2024-02-12  1496  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06  1497  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1498  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1499  
ffc50b2d382879 Abel Vesa             2023-01-06  1500  		qupv3_id_0: geniqup@ac0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1501  			compatible = "qcom,geni-se-qup";
ffc50b2d382879 Abel Vesa             2023-01-06  1502  			reg = <0 0x00ac0000 0 0x2000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1503  			ranges;
ffc50b2d382879 Abel Vesa             2023-01-06  1504  			clock-names = "m-ahb", "s-ahb";
ffc50b2d382879 Abel Vesa             2023-01-06  1505  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  1506  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1507  			iommus = <&apps_smmu 0xa3 0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1508  			interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1509  					 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1510  			interconnect-names = "qup-core";
91fc74458d833d Konrad Dybcio         2024-02-12  1511  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06  1512  			#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1513  			#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1514  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1515  
ffc50b2d382879 Abel Vesa             2023-01-06  1516  			i2c0: i2c@a80000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1517  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1518  				reg = <0 0x00a80000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1519  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1520  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1521  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1522  				pinctrl-0 = <&qup_i2c0_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1523  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1524  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1525  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1526  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1527  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1528  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1529  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1530  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1531  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1532  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1533  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1534  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1535  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1536  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1537  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1538  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1539  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1540  
ffc50b2d382879 Abel Vesa             2023-01-06  1541  			spi0: spi@a80000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1542  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1543  				reg = <0 0x00a80000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1544  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1545  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1546  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1547  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1548  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1549  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1550  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1551  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1552  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1553  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1554  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1555  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1556  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1557  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1558  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1559  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1560  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1561  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1562  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1563  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1564  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1565  
ffc50b2d382879 Abel Vesa             2023-01-06  1566  			i2c1: i2c@a84000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1567  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1568  				reg = <0 0x00a84000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1569  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1570  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1571  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1572  				pinctrl-0 = <&qup_i2c1_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1573  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1574  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1575  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1576  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1577  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1578  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1579  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1580  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1581  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1582  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1583  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1584  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1585  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1586  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1587  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1588  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1589  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1590  
ffc50b2d382879 Abel Vesa             2023-01-06  1591  			spi1: spi@a84000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1592  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1593  				reg = <0 0x00a84000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1594  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1595  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1596  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1597  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1598  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1599  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1600  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1601  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1602  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1603  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1604  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1605  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1606  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1607  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1608  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1609  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1610  				operating-points-v2 = <&qup_opp_table_120mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1611  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1612  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1613  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1614  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1615  
ffc50b2d382879 Abel Vesa             2023-01-06  1616  			i2c2: i2c@a88000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1617  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1618  				reg = <0 0x00a88000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1619  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1620  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1621  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1622  				pinctrl-0 = <&qup_i2c2_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1623  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1624  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1625  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1626  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1627  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1628  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1629  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1630  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1631  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1632  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1633  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1634  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1635  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1636  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1637  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1638  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1639  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1640  
ffc50b2d382879 Abel Vesa             2023-01-06  1641  			spi2: spi@a88000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1642  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1643  				reg = <0 0x00a88000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1644  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1645  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1646  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1647  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1648  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1649  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1650  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1651  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1652  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1653  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1654  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1655  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1656  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1657  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1658  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1659  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1660  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1661  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1662  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1663  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1664  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1665  
ffc50b2d382879 Abel Vesa             2023-01-06  1666  			i2c3: i2c@a8c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1667  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1668  				reg = <0 0x00a8c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1669  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1670  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1671  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1672  				pinctrl-0 = <&qup_i2c3_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1673  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1674  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1675  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1676  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1677  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1678  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1679  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1680  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1681  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1682  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1683  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1684  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1685  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1686  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1687  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1688  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1689  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1690  
ffc50b2d382879 Abel Vesa             2023-01-06  1691  			spi3: spi@a8c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1692  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1693  				reg = <0 0x00a8c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1694  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1695  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1696  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1697  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1698  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1699  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1700  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1701  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1702  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1703  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1704  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1705  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1706  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1707  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1708  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1709  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1710  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1711  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1712  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1713  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1714  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1715  
ffc50b2d382879 Abel Vesa             2023-01-06  1716  			i2c4: i2c@a90000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1717  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1718  				reg = <0 0x00a90000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1719  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1720  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1721  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1722  				pinctrl-0 = <&qup_i2c4_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1723  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1724  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1725  				#size-cells = <0>;
54df5e52777e11 Neil Armstrong        2025-01-15  1726  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1727  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1728  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1729  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1730  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1731  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1732  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1733  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1734  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1735  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1736  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1737  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1738  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1739  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1740  
ffc50b2d382879 Abel Vesa             2023-01-06  1741  			spi4: spi@a90000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1742  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1743  				reg = <0 0x00a90000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1744  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1745  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1746  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1747  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1748  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1749  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1750  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1751  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1752  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1753  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1754  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1755  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1756  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1757  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1758  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1759  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1760  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1761  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1762  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1763  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1764  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1765  
ffc50b2d382879 Abel Vesa             2023-01-06  1766  			i2c5: i2c@a94000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1767  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1768  				reg = <0 0x00a94000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1769  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1770  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1771  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1772  				pinctrl-0 = <&qup_i2c5_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1773  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
54df5e52777e11 Neil Armstrong        2025-01-15  1774  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1775  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1776  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1777  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1778  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1779  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1780  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1781  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1782  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1783  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1784  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1785  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1786  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1787  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1788  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1789  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1790  
ffc50b2d382879 Abel Vesa             2023-01-06  1791  			spi5: spi@a94000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1792  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1793  				reg = <0 0x00a94000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1794  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1795  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1796  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1797  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1798  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1799  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1800  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1801  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1802  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1803  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1804  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1805  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1806  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1807  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1808  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1809  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1810  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1811  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1812  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1813  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1814  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1815  
ffc50b2d382879 Abel Vesa             2023-01-06  1816  			i2c6: i2c@a98000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1817  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1818  				reg = <0 0x00a98000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1819  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1820  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1821  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1822  				pinctrl-0 = <&qup_i2c6_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1823  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
54df5e52777e11 Neil Armstrong        2025-01-15  1824  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1825  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1826  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1827  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1828  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1829  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1830  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1831  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1832  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1833  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1834  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1835  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1836  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1837  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1838  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1839  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1840  
ffc50b2d382879 Abel Vesa             2023-01-06  1841  			spi6: spi@a98000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1842  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1843  				reg = <0 0x00a98000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1844  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1845  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1846  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1847  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1848  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
54df5e52777e11 Neil Armstrong        2025-01-15  1849  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1850  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1851  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1852  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
54df5e52777e11 Neil Armstrong        2025-01-15  1853  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1854  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ffc50b2d382879 Abel Vesa             2023-01-06  1855  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1856  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1857  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1858  				dma-names = "tx", "rx";
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1859  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1860  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1861  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1862  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1863  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1864  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1865  
ffc50b2d382879 Abel Vesa             2023-01-06  1866  			uart7: serial@a9c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1867  				compatible = "qcom,geni-debug-uart";
ffc50b2d382879 Abel Vesa             2023-01-06  1868  				reg = <0 0x00a9c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1869  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1870  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1871  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1872  				pinctrl-0 = <&qup_uart7_default>;
ffc50b2d382879 Abel Vesa             2023-01-06  1873  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1874  				interconnect-names = "qup-core", "qup-config";
54df5e52777e11 Neil Armstrong        2025-01-15  1875  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  1876  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  1877  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  1878  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1879  				power-domains = <&rpmhpd RPMHPD_CX>;
ac2b7b1e8432fc Neil Armstrong        2025-01-15  1880  				operating-points-v2 = <&qup_opp_table_100mhz>;
ffc50b2d382879 Abel Vesa             2023-01-06  1881  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1882  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1883  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1884  
ffc50b2d382879 Abel Vesa             2023-01-06  1885  		cnoc_main: interconnect@1500000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1886  			compatible = "qcom,sm8550-cnoc-main";
ffc50b2d382879 Abel Vesa             2023-01-06  1887  			reg = <0 0x01500000 0 0x13080>;
ffc50b2d382879 Abel Vesa             2023-01-06  1888  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1889  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1890  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1891  
ffc50b2d382879 Abel Vesa             2023-01-06  1892  		config_noc: interconnect@1600000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1893  			compatible = "qcom,sm8550-config-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1894  			reg = <0 0x01600000 0 0x6200>;
ffc50b2d382879 Abel Vesa             2023-01-06  1895  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1896  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1897  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1898  
ffc50b2d382879 Abel Vesa             2023-01-06  1899  		system_noc: interconnect@1680000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1900  			compatible = "qcom,sm8550-system-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1901  			reg = <0 0x01680000 0 0x1d080>;
ffc50b2d382879 Abel Vesa             2023-01-06  1902  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1903  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1904  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1905  
ffc50b2d382879 Abel Vesa             2023-01-06  1906  		pcie_noc: interconnect@16c0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1907  			compatible = "qcom,sm8550-pcie-anoc";
ffc50b2d382879 Abel Vesa             2023-01-06  1908  			reg = <0 0x016c0000 0 0x12200>;
ffc50b2d382879 Abel Vesa             2023-01-06  1909  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1910  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  1911  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1912  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1913  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1914  
ffc50b2d382879 Abel Vesa             2023-01-06  1915  		aggre1_noc: interconnect@16e0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1916  			compatible = "qcom,sm8550-aggre1-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1917  			reg = <0 0x016e0000 0 0x14400>;
ffc50b2d382879 Abel Vesa             2023-01-06  1918  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1919  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  1920  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1921  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1922  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1923  
ffc50b2d382879 Abel Vesa             2023-01-06  1924  		aggre2_noc: interconnect@1700000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1925  			compatible = "qcom,sm8550-aggre2-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1926  			reg = <0 0x01700000 0 0x1e400>;
ffc50b2d382879 Abel Vesa             2023-01-06  1927  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1928  			clocks = <&rpmhcc RPMH_IPA_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1929  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1930  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1931  
ffc50b2d382879 Abel Vesa             2023-01-06  1932  		mmss_noc: interconnect@1780000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1933  			compatible = "qcom,sm8550-mmss-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1934  			reg = <0 0x01780000 0 0x5b800>;
ffc50b2d382879 Abel Vesa             2023-01-06  1935  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1936  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1937  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1938  
3b3ba999046e24 Neil Armstrong        2023-10-03  1939  		rng: rng@10c3000 {
3b3ba999046e24 Neil Armstrong        2023-10-03  1940  			compatible = "qcom,sm8550-trng", "qcom,trng";
3b3ba999046e24 Neil Armstrong        2023-10-03  1941  			reg = <0 0x010c3000 0 0x1000>;
3b3ba999046e24 Neil Armstrong        2023-10-03  1942  		};
3b3ba999046e24 Neil Armstrong        2023-10-03  1943  
052c9a1f1400f1 Manivannan Sadhasivam 2023-12-06  1944  		pcie0: pcie@1c00000 {
7d1158c984d37e Abel Vesa             2023-01-19  1945  			device_type = "pci";
7d1158c984d37e Abel Vesa             2023-01-19  1946  			compatible = "qcom,pcie-sm8550";
7d1158c984d37e Abel Vesa             2023-01-19  1947  			reg = <0 0x01c00000 0 0x3000>,
7d1158c984d37e Abel Vesa             2023-01-19  1948  			      <0 0x60000000 0 0xf1d>,
7d1158c984d37e Abel Vesa             2023-01-19  1949  			      <0 0x60000f20 0 0xa8>,
7d1158c984d37e Abel Vesa             2023-01-19  1950  			      <0 0x60001000 0 0x1000>,
7d1158c984d37e Abel Vesa             2023-01-19  1951  			      <0 0x60100000 0 0x100000>;
7d1158c984d37e Abel Vesa             2023-01-19  1952  			reg-names = "parf", "dbi", "elbi", "atu", "config";
7d1158c984d37e Abel Vesa             2023-01-19  1953  			#address-cells = <3>;
7d1158c984d37e Abel Vesa             2023-01-19  1954  			#size-cells = <2>;
565c633940312b Manivannan Sadhasivam 2023-02-28  1955  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
565c633940312b Manivannan Sadhasivam 2023-02-28  1956  				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
7d1158c984d37e Abel Vesa             2023-01-19  1957  			bus-range = <0x00 0xff>;
7d1158c984d37e Abel Vesa             2023-01-19  1958  
7d1158c984d37e Abel Vesa             2023-01-19  1959  			dma-coherent;
7d1158c984d37e Abel Vesa             2023-01-19  1960  
7d1158c984d37e Abel Vesa             2023-01-19  1961  			linux,pci-domain = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  1962  			num-lanes = <2>;
7d1158c984d37e Abel Vesa             2023-01-19  1963  
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1964  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1965  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1966  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1967  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1968  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1969  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1970  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
3e14b14ec8b94c Neil Armstrong        2024-11-26  1971  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
3e14b14ec8b94c Neil Armstrong        2024-11-26  1972  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1973  			interrupt-names = "msi0",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1974  					  "msi1",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1975  					  "msi2",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1976  					  "msi3",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1977  					  "msi4",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1978  					  "msi5",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1979  					  "msi6",
3e14b14ec8b94c Neil Armstrong        2024-11-26  1980  					  "msi7",
3e14b14ec8b94c Neil Armstrong        2024-11-26  1981  					  "global";
7d1158c984d37e Abel Vesa             2023-01-19  1982  			#interrupt-cells = <1>;
7d1158c984d37e Abel Vesa             2023-01-19  1983  			interrupt-map-mask = <0 0 0 0x7>;
7d1158c984d37e Abel Vesa             2023-01-19  1984  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
7d1158c984d37e Abel Vesa             2023-01-19  1985  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
7d1158c984d37e Abel Vesa             2023-01-19  1986  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
7d1158c984d37e Abel Vesa             2023-01-19  1987  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
7d1158c984d37e Abel Vesa             2023-01-19  1988  
32734bbd1802ef Abel Vesa             2023-02-08  1989  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1990  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1991  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1992  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1993  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1994  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1995  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>;
32734bbd1802ef Abel Vesa             2023-02-08  1996  			clock-names = "aux",
7d1158c984d37e Abel Vesa             2023-01-19  1997  				      "cfg",
7d1158c984d37e Abel Vesa             2023-01-19  1998  				      "bus_master",
7d1158c984d37e Abel Vesa             2023-01-19  1999  				      "bus_slave",
7d1158c984d37e Abel Vesa             2023-01-19  2000  				      "slave_q2a",
7d1158c984d37e Abel Vesa             2023-01-19  2001  				      "ddrss_sf_tbu",
32734bbd1802ef Abel Vesa             2023-02-08  2002  				      "noc_aggr";
7d1158c984d37e Abel Vesa             2023-01-19  2003  
54df5e52777e11 Neil Armstrong        2025-01-15  2004  			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2005  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  2006  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  2007  					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
32734bbd1802ef Abel Vesa             2023-02-08  2008  			interconnect-names = "pcie-mem", "cpu-pcie";
7d1158c984d37e Abel Vesa             2023-01-19  2009  
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  2010  			msi-map = <0x0 &gic_its 0x1400 0x1>,
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  2011  				  <0x100 &gic_its 0x1401 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  2012  			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
7d1158c984d37e Abel Vesa             2023-01-19  2013  				    <0x100 &apps_smmu 0x1401 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  2014  
7d1158c984d37e Abel Vesa             2023-01-19  2015  			resets = <&gcc GCC_PCIE_0_BCR>;
7d1158c984d37e Abel Vesa             2023-01-19  2016  			reset-names = "pci";
7d1158c984d37e Abel Vesa             2023-01-19  2017  
7d1158c984d37e Abel Vesa             2023-01-19  2018  			power-domains = <&gcc PCIE_0_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  2019  
7d1158c984d37e Abel Vesa             2023-01-19  2020  			phys = <&pcie0_phy>;
7d1158c984d37e Abel Vesa             2023-01-19  2021  			phy-names = "pciephy";
7d1158c984d37e Abel Vesa             2023-01-19  2022  
0acd169330b810 Neil Armstrong        2025-01-15  2023  			operating-points-v2 = <&pcie0_opp_table>;
0acd169330b810 Neil Armstrong        2025-01-15  2024  
7d1158c984d37e Abel Vesa             2023-01-19  2025  			status = "disabled";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2026  
0acd169330b810 Neil Armstrong        2025-01-15  2027  			pcie0_opp_table: opp-table {
0acd169330b810 Neil Armstrong        2025-01-15  2028  				compatible = "operating-points-v2";
0acd169330b810 Neil Armstrong        2025-01-15  2029  
0acd169330b810 Neil Armstrong        2025-01-15  2030  				/* GEN 1 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2031  				opp-2500000 {
0acd169330b810 Neil Armstrong        2025-01-15  2032  					opp-hz = /bits/ 64 <2500000>;
0acd169330b810 Neil Armstrong        2025-01-15  2033  					required-opps = <&rpmhpd_opp_low_svs>;
0acd169330b810 Neil Armstrong        2025-01-15  2034  					opp-peak-kBps = <250000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2035  				};
0acd169330b810 Neil Armstrong        2025-01-15  2036  
0acd169330b810 Neil Armstrong        2025-01-15  2037  				/* GEN 1 x2 and GEN 2 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2038  				opp-5000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2039  					opp-hz = /bits/ 64 <5000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2040  					required-opps = <&rpmhpd_opp_low_svs>;
0acd169330b810 Neil Armstrong        2025-01-15  2041  					opp-peak-kBps = <500000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2042  				};
0acd169330b810 Neil Armstrong        2025-01-15  2043  
0acd169330b810 Neil Armstrong        2025-01-15  2044  				/* GEN 2 x2 */
0acd169330b810 Neil Armstrong        2025-01-15  2045  				opp-10000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2046  					opp-hz = /bits/ 64 <10000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2047  					required-opps = <&rpmhpd_opp_low_svs>;
0acd169330b810 Neil Armstrong        2025-01-15  2048  					opp-peak-kBps = <1000000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2049  				};
0acd169330b810 Neil Armstrong        2025-01-15  2050  
0acd169330b810 Neil Armstrong        2025-01-15  2051  				/* GEN 3 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2052  				opp-8000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2053  					opp-hz = /bits/ 64 <8000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2054  					required-opps = <&rpmhpd_opp_nom>;
0acd169330b810 Neil Armstrong        2025-01-15  2055  					opp-peak-kBps = <984500 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2056  				};
0acd169330b810 Neil Armstrong        2025-01-15  2057  
0acd169330b810 Neil Armstrong        2025-01-15  2058  				/* GEN 3 x2 */
0acd169330b810 Neil Armstrong        2025-01-15  2059  				opp-16000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2060  					opp-hz = /bits/ 64 <16000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2061  					required-opps = <&rpmhpd_opp_nom>;
0acd169330b810 Neil Armstrong        2025-01-15  2062  					opp-peak-kBps = <1969000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2063  				};
0acd169330b810 Neil Armstrong        2025-01-15  2064  			};
0acd169330b810 Neil Armstrong        2025-01-15  2065  
4908128724491d Bartosz Golaszewski   2024-06-05  2066  			pcieport0: pcie@0 {
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2067  				device_type = "pci";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2068  				reg = <0x0 0x0 0x0 0x0 0x0>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2069  				bus-range = <0x01 0xff>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2070  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2071  				#address-cells = <3>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2072  				#size-cells = <2>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2073  				ranges;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2074  			};
7d1158c984d37e Abel Vesa             2023-01-19  2075  		};
7d1158c984d37e Abel Vesa             2023-01-19  2076  
7d1158c984d37e Abel Vesa             2023-01-19  2077  		pcie0_phy: phy@1c06000 {
7d1158c984d37e Abel Vesa             2023-01-19  2078  			compatible = "qcom,sm8550-qmp-gen3x2-pcie-phy";
7d1158c984d37e Abel Vesa             2023-01-19  2079  			reg = <0 0x01c06000 0 0x2000>;
7d1158c984d37e Abel Vesa             2023-01-19  2080  
7d1158c984d37e Abel Vesa             2023-01-19  2081  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2082  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2083  				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
7d1158c984d37e Abel Vesa             2023-01-19  2084  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2085  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  2086  			clock-names = "aux", "cfg_ahb", "ref", "rchng",
7d1158c984d37e Abel Vesa             2023-01-19  2087  				      "pipe";
7d1158c984d37e Abel Vesa             2023-01-19  2088  
7d1158c984d37e Abel Vesa             2023-01-19  2089  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
7d1158c984d37e Abel Vesa             2023-01-19  2090  			reset-names = "phy";
7d1158c984d37e Abel Vesa             2023-01-19  2091  
7d1158c984d37e Abel Vesa             2023-01-19  2092  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  2093  			assigned-clock-rates = <100000000>;
7d1158c984d37e Abel Vesa             2023-01-19  2094  
7d1158c984d37e Abel Vesa             2023-01-19  2095  			power-domains = <&gcc PCIE_0_PHY_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  2096  
7d1158c984d37e Abel Vesa             2023-01-19  2097  			#clock-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  2098  			clock-output-names = "pcie0_pipe_clk";
7d1158c984d37e Abel Vesa             2023-01-19  2099  
7d1158c984d37e Abel Vesa             2023-01-19  2100  			#phy-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  2101  
7d1158c984d37e Abel Vesa             2023-01-19  2102  			status = "disabled";
7d1158c984d37e Abel Vesa             2023-01-19  2103  		};
7d1158c984d37e Abel Vesa             2023-01-19  2104  
052c9a1f1400f1 Manivannan Sadhasivam 2023-12-06  2105  		pcie1: pcie@1c08000 {
7d1158c984d37e Abel Vesa             2023-01-19  2106  			device_type = "pci";
7d1158c984d37e Abel Vesa             2023-01-19  2107  			compatible = "qcom,pcie-sm8550";
7d1158c984d37e Abel Vesa             2023-01-19  2108  			reg = <0x0 0x01c08000 0x0 0x3000>,
7d1158c984d37e Abel Vesa             2023-01-19  2109  			      <0x0 0x40000000 0x0 0xf1d>,
7d1158c984d37e Abel Vesa             2023-01-19  2110  			      <0x0 0x40000f20 0x0 0xa8>,
7d1158c984d37e Abel Vesa             2023-01-19  2111  			      <0x0 0x40001000 0x0 0x1000>,
7d1158c984d37e Abel Vesa             2023-01-19  2112  			      <0x0 0x40100000 0x0 0x100000>;
7d1158c984d37e Abel Vesa             2023-01-19  2113  			reg-names = "parf", "dbi", "elbi", "atu", "config";
7d1158c984d37e Abel Vesa             2023-01-19  2114  			#address-cells = <3>;
7d1158c984d37e Abel Vesa             2023-01-19  2115  			#size-cells = <2>;
565c633940312b Manivannan Sadhasivam 2023-02-28  2116  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
565c633940312b Manivannan Sadhasivam 2023-02-28  2117  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
7d1158c984d37e Abel Vesa             2023-01-19  2118  			bus-range = <0x00 0xff>;
7d1158c984d37e Abel Vesa             2023-01-19  2119  
7d1158c984d37e Abel Vesa             2023-01-19  2120  			dma-coherent;
7d1158c984d37e Abel Vesa             2023-01-19  2121  
7d1158c984d37e Abel Vesa             2023-01-19  2122  			linux,pci-domain = <1>;
7d1158c984d37e Abel Vesa             2023-01-19  2123  			num-lanes = <2>;
7d1158c984d37e Abel Vesa             2023-01-19  2124  
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2125  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2126  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2127  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2128  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2129  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2130  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2131  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
3e14b14ec8b94c Neil Armstrong        2024-11-26  2132  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
3e14b14ec8b94c Neil Armstrong        2024-11-26  2133  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2134  			interrupt-names = "msi0",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2135  					  "msi1",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2136  					  "msi2",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2137  					  "msi3",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2138  					  "msi4",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2139  					  "msi5",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  2140  					  "msi6",
3e14b14ec8b94c Neil Armstrong        2024-11-26  2141  					  "msi7",
3e14b14ec8b94c Neil Armstrong        2024-11-26  2142  					  "global";
7d1158c984d37e Abel Vesa             2023-01-19  2143  			#interrupt-cells = <1>;
7d1158c984d37e Abel Vesa             2023-01-19  2144  			interrupt-map-mask = <0 0 0 0x7>;
7d1158c984d37e Abel Vesa             2023-01-19  2145  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
7d1158c984d37e Abel Vesa             2023-01-19  2146  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
7d1158c984d37e Abel Vesa             2023-01-19  2147  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
7d1158c984d37e Abel Vesa             2023-01-19  2148  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
7d1158c984d37e Abel Vesa             2023-01-19  2149  
32734bbd1802ef Abel Vesa             2023-02-08  2150  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2151  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2152  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2153  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2154  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2155  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2156  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2157  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
32734bbd1802ef Abel Vesa             2023-02-08  2158  			clock-names = "aux",
7d1158c984d37e Abel Vesa             2023-01-19  2159  				      "cfg",
7d1158c984d37e Abel Vesa             2023-01-19  2160  				      "bus_master",
7d1158c984d37e Abel Vesa             2023-01-19  2161  				      "bus_slave",
7d1158c984d37e Abel Vesa             2023-01-19  2162  				      "slave_q2a",
7d1158c984d37e Abel Vesa             2023-01-19  2163  				      "ddrss_sf_tbu",
32734bbd1802ef Abel Vesa             2023-02-08  2164  				      "noc_aggr",
32734bbd1802ef Abel Vesa             2023-02-08  2165  				      "cnoc_sf_axi";
7d1158c984d37e Abel Vesa             2023-01-19  2166  
7d1158c984d37e Abel Vesa             2023-01-19  2167  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  2168  			assigned-clock-rates = <19200000>;
7d1158c984d37e Abel Vesa             2023-01-19  2169  
54df5e52777e11 Neil Armstrong        2025-01-15  2170  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2171  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  2172  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  2173  					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
32734bbd1802ef Abel Vesa             2023-02-08  2174  			interconnect-names = "pcie-mem", "cpu-pcie";
7d1158c984d37e Abel Vesa             2023-01-19  2175  
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  2176  			msi-map = <0x0 &gic_its 0x1480 0x1>,
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  2177  				  <0x100 &gic_its 0x1481 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  2178  			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
7d1158c984d37e Abel Vesa             2023-01-19  2179  				    <0x100 &apps_smmu 0x1481 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  2180  
7d1158c984d37e Abel Vesa             2023-01-19  2181  			resets = <&gcc GCC_PCIE_1_BCR>,
7d1158c984d37e Abel Vesa             2023-01-19  2182  				<&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
32734bbd1802ef Abel Vesa             2023-02-08  2183  			reset-names = "pci", "link_down";
7d1158c984d37e Abel Vesa             2023-01-19  2184  
7d1158c984d37e Abel Vesa             2023-01-19  2185  			power-domains = <&gcc PCIE_1_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  2186  
7d1158c984d37e Abel Vesa             2023-01-19  2187  			phys = <&pcie1_phy>;
7d1158c984d37e Abel Vesa             2023-01-19  2188  			phy-names = "pciephy";
7d1158c984d37e Abel Vesa             2023-01-19  2189  
0acd169330b810 Neil Armstrong        2025-01-15  2190  			operating-points-v2 = <&pcie1_opp_table>;
0acd169330b810 Neil Armstrong        2025-01-15  2191  
7d1158c984d37e Abel Vesa             2023-01-19  2192  			status = "disabled";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2193  
0acd169330b810 Neil Armstrong        2025-01-15  2194  			pcie1_opp_table: opp-table {
0acd169330b810 Neil Armstrong        2025-01-15  2195  				compatible = "operating-points-v2";
0acd169330b810 Neil Armstrong        2025-01-15  2196  
0acd169330b810 Neil Armstrong        2025-01-15  2197  				/* GEN 1 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2198  				opp-2500000 {
0acd169330b810 Neil Armstrong        2025-01-15  2199  					opp-hz = /bits/ 64 <2500000>;
0acd169330b810 Neil Armstrong        2025-01-15  2200  					required-opps = <&rpmhpd_opp_low_svs>;
0acd169330b810 Neil Armstrong        2025-01-15  2201  					opp-peak-kBps = <250000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2202  				};
0acd169330b810 Neil Armstrong        2025-01-15  2203  
0acd169330b810 Neil Armstrong        2025-01-15  2204  				/* GEN 1 x2 and GEN 2 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2205  				opp-5000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2206  					opp-hz = /bits/ 64 <5000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2207  					required-opps = <&rpmhpd_opp_low_svs>;
0acd169330b810 Neil Armstrong        2025-01-15  2208  					opp-peak-kBps = <500000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2209  				};
0acd169330b810 Neil Armstrong        2025-01-15  2210  
0acd169330b810 Neil Armstrong        2025-01-15  2211  				/* GEN 2 x2 */
0acd169330b810 Neil Armstrong        2025-01-15  2212  				opp-10000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2213  					opp-hz = /bits/ 64 <10000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2214  					required-opps = <&rpmhpd_opp_low_svs>;
0acd169330b810 Neil Armstrong        2025-01-15  2215  					opp-peak-kBps = <1000000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2216  				};
0acd169330b810 Neil Armstrong        2025-01-15  2217  
0acd169330b810 Neil Armstrong        2025-01-15  2218  				/* GEN 3 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2219  				opp-8000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2220  					opp-hz = /bits/ 64 <8000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2221  					required-opps = <&rpmhpd_opp_nom>;
0acd169330b810 Neil Armstrong        2025-01-15  2222  					opp-peak-kBps = <984500 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2223  				};
0acd169330b810 Neil Armstrong        2025-01-15  2224  
0acd169330b810 Neil Armstrong        2025-01-15  2225  				/* GEN 3 x2 and GEN 4 x1 */
0acd169330b810 Neil Armstrong        2025-01-15  2226  				opp-16000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2227  					opp-hz = /bits/ 64 <16000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2228  					required-opps = <&rpmhpd_opp_nom>;
0acd169330b810 Neil Armstrong        2025-01-15  2229  					opp-peak-kBps = <1969000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2230  				};
0acd169330b810 Neil Armstrong        2025-01-15  2231  
0acd169330b810 Neil Armstrong        2025-01-15  2232  				/* GEN 4 x2 */
0acd169330b810 Neil Armstrong        2025-01-15  2233  				opp-32000000 {
0acd169330b810 Neil Armstrong        2025-01-15  2234  					opp-hz = /bits/ 64 <32000000>;
0acd169330b810 Neil Armstrong        2025-01-15  2235  					required-opps = <&rpmhpd_opp_nom>;
0acd169330b810 Neil Armstrong        2025-01-15  2236  					opp-peak-kBps = <3938000 1>;
0acd169330b810 Neil Armstrong        2025-01-15  2237  				};
0acd169330b810 Neil Armstrong        2025-01-15  2238  			};
0acd169330b810 Neil Armstrong        2025-01-15  2239  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2240  			pcie@0 {
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2241  				device_type = "pci";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2242  				reg = <0x0 0x0 0x0 0x0 0x0>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2243  				bus-range = <0x01 0xff>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2244  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2245  				#address-cells = <3>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2246  				#size-cells = <2>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2247  				ranges;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  2248  			};
7d1158c984d37e Abel Vesa             2023-01-19  2249  		};
7d1158c984d37e Abel Vesa             2023-01-19  2250  
7d1158c984d37e Abel Vesa             2023-01-19  2251  		pcie1_phy: phy@1c0e000 {
7d1158c984d37e Abel Vesa             2023-01-19  2252  			compatible = "qcom,sm8550-qmp-gen4x2-pcie-phy";
7d1158c984d37e Abel Vesa             2023-01-19  2253  			reg = <0x0 0x01c0e000 0x0 0x2000>;
7d1158c984d37e Abel Vesa             2023-01-19  2254  
32734bbd1802ef Abel Vesa             2023-02-08  2255  			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2256  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  2257  				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
7d1158c984d37e Abel Vesa             2023-01-19  2258  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
32734bbd1802ef Abel Vesa             2023-02-08  2259  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  2260  			clock-names = "aux", "cfg_ahb", "ref", "rchng",
32734bbd1802ef Abel Vesa             2023-02-08  2261  				      "pipe";
7d1158c984d37e Abel Vesa             2023-01-19  2262  
7d1158c984d37e Abel Vesa             2023-01-19  2263  			resets = <&gcc GCC_PCIE_1_PHY_BCR>,
7d1158c984d37e Abel Vesa             2023-01-19  2264  				 <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
32734bbd1802ef Abel Vesa             2023-02-08  2265  			reset-names = "phy", "phy_nocsr";
7d1158c984d37e Abel Vesa             2023-01-19  2266  
7d1158c984d37e Abel Vesa             2023-01-19  2267  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  2268  			assigned-clock-rates = <100000000>;
7d1158c984d37e Abel Vesa             2023-01-19  2269  
7d1158c984d37e Abel Vesa             2023-01-19  2270  			power-domains = <&gcc PCIE_1_PHY_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  2271  
0cc97d9e3fdf9a Neil Armstrong        2024-05-02  2272  			#clock-cells = <1>;
84ea430eb0719e Dmitry Baryshkov      2024-06-14  2273  			clock-output-names = "pcie1_pipe_clk";
7d1158c984d37e Abel Vesa             2023-01-19  2274  
7d1158c984d37e Abel Vesa             2023-01-19  2275  			#phy-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  2276  
7d1158c984d37e Abel Vesa             2023-01-19  2277  			status = "disabled";
7d1158c984d37e Abel Vesa             2023-01-19  2278  		};
7d1158c984d37e Abel Vesa             2023-01-19  2279  
433477c3bf0b7f Neil Armstrong        2022-11-16  2280  		cryptobam: dma-controller@1dc4000 {
31dfb8014f6bbe Bhupesh Sharma        2023-05-27  2281  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
433477c3bf0b7f Neil Armstrong        2022-11-16  2282  			reg = <0x0 0x01dc4000 0x0 0x28000>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2283  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2284  			#dma-cells = <1>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2285  			qcom,ee = <0>;
663cd2cad36da2 Stephan Gerhold       2025-02-12  2286  			qcom,num-ees = <4>;
663cd2cad36da2 Stephan Gerhold       2025-02-12  2287  			num-channels = <20>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2288  			qcom,controlled-remotely;
433477c3bf0b7f Neil Armstrong        2022-11-16  2289  			iommus = <&apps_smmu 0x480 0x0>,
433477c3bf0b7f Neil Armstrong        2022-11-16  2290  				 <&apps_smmu 0x481 0x0>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2291  		};
433477c3bf0b7f Neil Armstrong        2022-11-16  2292  
3cbf49ef16962a Krzysztof Kozlowski   2023-04-19  2293  		crypto: crypto@1dfa000 {
e47a80784306a5 Vladimir Zapolskiy    2023-02-22  2294  			compatible = "qcom,sm8550-qce", "qcom,sm8150-qce", "qcom,qce";
433477c3bf0b7f Neil Armstrong        2022-11-16  2295  			reg = <0x0 0x01dfa000 0x0 0x6000>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2296  			dmas = <&cryptobam 4>, <&cryptobam 5>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2297  			dma-names = "rx", "tx";
433477c3bf0b7f Neil Armstrong        2022-11-16  2298  			iommus = <&apps_smmu 0x480 0x0>,
433477c3bf0b7f Neil Armstrong        2022-11-16  2299  				 <&apps_smmu 0x481 0x0>;
54df5e52777e11 Neil Armstrong        2025-01-15  2300  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2301  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
433477c3bf0b7f Neil Armstrong        2022-11-16  2302  			interconnect-names = "memory";
433477c3bf0b7f Neil Armstrong        2022-11-16  2303  		};
433477c3bf0b7f Neil Armstrong        2022-11-16  2304  
35cf1aaab169e0 Abel Vesa             2023-01-16  2305  		ufs_mem_phy: phy@1d80000 {
35cf1aaab169e0 Abel Vesa             2023-01-16  2306  			compatible = "qcom,sm8550-qmp-ufs-phy";
35cf1aaab169e0 Abel Vesa             2023-01-16  2307  			reg = <0x0 0x01d80000 0x0 0x2000>;
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  2308  			clocks = <&rpmhcc RPMH_CXO_CLK>,
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  2309  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  2310  				 <&tcsr TCSR_UFS_CLKREF_EN>;
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  2311  			clock-names = "ref",
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  2312  				      "ref_aux",
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  2313  				      "qref";
35cf1aaab169e0 Abel Vesa             2023-01-16  2314  
35cf1aaab169e0 Abel Vesa             2023-01-16  2315  			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2316  
35cf1aaab169e0 Abel Vesa             2023-01-16  2317  			resets = <&ufs_mem_hc 0>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2318  			reset-names = "ufsphy";
35cf1aaab169e0 Abel Vesa             2023-01-16  2319  
35cf1aaab169e0 Abel Vesa             2023-01-16  2320  			#clock-cells = <1>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2321  			#phy-cells = <0>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2322  
35cf1aaab169e0 Abel Vesa             2023-01-16  2323  			status = "disabled";
35cf1aaab169e0 Abel Vesa             2023-01-16  2324  		};
35cf1aaab169e0 Abel Vesa             2023-01-16  2325  
15288649e4c037 Manivannan Sadhasivam 2024-05-14  2326  		ufs_mem_hc: ufshc@1d84000 {
35cf1aaab169e0 Abel Vesa             2023-01-16  2327  			compatible = "qcom,sm8550-ufshc", "qcom,ufshc",
35cf1aaab169e0 Abel Vesa             2023-01-16  2328  				     "jedec,ufs-2.0";
35cf1aaab169e0 Abel Vesa             2023-01-16  2329  			reg = <0x0 0x01d84000 0x0 0x3000>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2330  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2331  			phys = <&ufs_mem_phy>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2332  			phy-names = "ufsphy";
35cf1aaab169e0 Abel Vesa             2023-01-16  2333  			lanes-per-direction = <2>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2334  			#reset-cells = <1>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2335  			resets = <&gcc GCC_UFS_PHY_BCR>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2336  			reset-names = "rst";
35cf1aaab169e0 Abel Vesa             2023-01-16  2337  
35cf1aaab169e0 Abel Vesa             2023-01-16  2338  			power-domains = <&gcc UFS_PHY_GDSC>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2339  			required-opps = <&rpmhpd_opp_nom>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2340  
35cf1aaab169e0 Abel Vesa             2023-01-16  2341  			iommus = <&apps_smmu 0x60 0x0>;
ee1d5100c37e7a Manivannan Sadhasivam 2023-03-08  2342  			dma-coherent;
35cf1aaab169e0 Abel Vesa             2023-01-16  2343  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2344  			operating-points-v2 = <&ufs_opp_table>;
54df5e52777e11 Neil Armstrong        2025-01-15  2345  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2346  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  2347  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  2348  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2349  
35cf1aaab169e0 Abel Vesa             2023-01-16  2350  			interconnect-names = "ufs-ddr", "cpu-ufs";
35cf1aaab169e0 Abel Vesa             2023-01-16  2351  			clock-names = "core_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2352  				      "bus_aggr_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2353  				      "iface_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2354  				      "core_clk_unipro",
35cf1aaab169e0 Abel Vesa             2023-01-16  2355  				      "ref_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2356  				      "tx_lane0_sync_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2357  				      "rx_lane0_sync_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2358  				      "rx_lane1_sync_clk";
35cf1aaab169e0 Abel Vesa             2023-01-16  2359  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2360  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2361  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2362  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2363  				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2364  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2365  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2366  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
b8630c48b43fcf Abel Vesa             2023-04-07  2367  			qcom,ice = <&ice>;
b8630c48b43fcf Abel Vesa             2023-04-07  2368  
35cf1aaab169e0 Abel Vesa             2023-01-16  2369  			status = "disabled";
2f7be4caacd264 Konrad Dybcio         2024-02-03  2370  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2371  			ufs_opp_table: opp-table {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2372  				compatible = "operating-points-v2";
2f7be4caacd264 Konrad Dybcio         2024-02-03  2373  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2374  				opp-75000000 {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2375  					opp-hz = /bits/ 64 <75000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2376  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2377  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2378  						 /bits/ 64 <75000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2379  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2380  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2381  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2382  						 /bits/ 64 <0>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2383  					required-opps = <&rpmhpd_opp_low_svs>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2384  				};
2f7be4caacd264 Konrad Dybcio         2024-02-03  2385  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2386  				opp-150000000 {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2387  					opp-hz = /bits/ 64 <150000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2388  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2389  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2390  						 /bits/ 64 <150000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2391  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2392  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2393  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2394  						 /bits/ 64 <0>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2395  					required-opps = <&rpmhpd_opp_svs>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2396  				};
2f7be4caacd264 Konrad Dybcio         2024-02-03  2397  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2398  				opp-300000000 {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2399  					opp-hz = /bits/ 64 <300000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2400  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2401  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2402  						 /bits/ 64 <300000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2403  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2404  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2405  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2406  						 /bits/ 64 <0>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2407  					required-opps = <&rpmhpd_opp_nom>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2408  				};
2f7be4caacd264 Konrad Dybcio         2024-02-03  2409  			};
35cf1aaab169e0 Abel Vesa             2023-01-16  2410  		};
35cf1aaab169e0 Abel Vesa             2023-01-16  2411  
b8630c48b43fcf Abel Vesa             2023-04-07  2412  		ice: crypto@1d88000 {
b8630c48b43fcf Abel Vesa             2023-04-07  2413  			compatible = "qcom,sm8550-inline-crypto-engine",
b8630c48b43fcf Abel Vesa             2023-04-07  2414  				     "qcom,inline-crypto-engine";
5a25ef30a84c12 Bartosz Golaszewski   2024-10-07  2415  			reg = <0 0x01d88000 0 0x18000>;
5a25ef30a84c12 Bartosz Golaszewski   2024-10-07  2416  
b8630c48b43fcf Abel Vesa             2023-04-07  2417  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
b8630c48b43fcf Abel Vesa             2023-04-07  2418  		};
b8630c48b43fcf Abel Vesa             2023-04-07  2419  
ffc50b2d382879 Abel Vesa             2023-01-06  2420  		tcsr_mutex: hwlock@1f40000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2421  			compatible = "qcom,tcsr-mutex";
ffc50b2d382879 Abel Vesa             2023-01-06  2422  			reg = <0 0x01f40000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2423  			#hwlock-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2424  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2425  
ffc50b2d382879 Abel Vesa             2023-01-06  2426  		tcsr: clock-controller@1fc0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2427  			compatible = "qcom,sm8550-tcsr", "syscon";
ffc50b2d382879 Abel Vesa             2023-01-06  2428  			reg = <0 0x01fc0000 0 0x30000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2429  			clocks = <&rpmhcc RPMH_CXO_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  2430  			#clock-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2431  			#reset-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2432  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2433  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2434  		gpu: gpu@3d00000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2435  			compatible = "qcom,adreno-43050a01", "qcom,adreno";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2436  			reg = <0x0 0x03d00000 0x0 0x40000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2437  			      <0x0 0x03d9e000 0x0 0x1000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2438  			      <0x0 0x03d61000 0x0 0x800>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2439  			reg-names = "kgsl_3d0_reg_memory",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2440  				    "cx_mem",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2441  				    "cx_dbgc";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2442  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2443  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2444  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2445  			iommus = <&adreno_smmu 0 0x0>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2446  				 <&adreno_smmu 1 0x0>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2447  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2448  			operating-points-v2 = <&gpu_opp_table>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2449  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2450  			qcom,gmu = <&gmu>;
6a464089284a61 Konrad Dybcio         2024-01-02  2451  			#cooling-cells = <2>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2452  
1ba40079267930 Neil Armstrong        2024-12-17  2453  			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
1ba40079267930 Neil Armstrong        2024-12-17  2454  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1ba40079267930 Neil Armstrong        2024-12-17  2455  			interconnect-names = "gfx-mem";
1ba40079267930 Neil Armstrong        2024-12-17  2456  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2457  			status = "disabled";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2458  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2459  			zap-shader {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2460  				memory-region = <&gpu_micro_code_mem>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2461  			};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2462  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2463  			/* Speedbin needs more work on A740+, keep only lower freqs */
ef19923ae103b5 Konrad Dybcio         2023-12-04  2464  			gpu_opp_table: opp-table {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2465  				compatible = "operating-points-v2";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2466  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2467  				opp-680000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2468  					opp-hz = /bits/ 64 <680000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2469  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
1ba40079267930 Neil Armstrong        2024-12-17  2470  					opp-peak-kBps = <16500000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2471  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2472  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2473  				opp-615000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2474  					opp-hz = /bits/ 64 <615000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2475  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
1ba40079267930 Neil Armstrong        2024-12-17  2476  					opp-peak-kBps = <12449218>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2477  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2478  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2479  				opp-550000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2480  					opp-hz = /bits/ 64 <550000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2481  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
1ba40079267930 Neil Armstrong        2024-12-17  2482  					opp-peak-kBps = <10687500>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2483  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2484  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2485  				opp-475000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2486  					opp-hz = /bits/ 64 <475000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2487  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
1ba40079267930 Neil Armstrong        2024-12-17  2488  					opp-peak-kBps = <6074218>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2489  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2490  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2491  				opp-401000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2492  					opp-hz = /bits/ 64 <401000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2493  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
1ba40079267930 Neil Armstrong        2024-12-17  2494  					opp-peak-kBps = <6074218>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2495  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2496  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2497  				opp-348000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2498  					opp-hz = /bits/ 64 <348000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2499  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
1ba40079267930 Neil Armstrong        2024-12-17  2500  					opp-peak-kBps = <6074218>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2501  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2502  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2503  				opp-295000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2504  					opp-hz = /bits/ 64 <295000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2505  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
1ba40079267930 Neil Armstrong        2024-12-17  2506  					opp-peak-kBps = <6074218>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2507  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2508  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2509  				opp-220000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2510  					opp-hz = /bits/ 64 <220000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2511  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
1ba40079267930 Neil Armstrong        2024-12-17  2512  					opp-peak-kBps = <2136718>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2513  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2514  			};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2515  		};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2516  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2517  		gmu: gmu@3d6a000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2518  			compatible = "qcom,adreno-gmu-740.1", "qcom,adreno-gmu";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2519  			reg = <0x0 0x03d6a000 0x0 0x35000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2520  			      <0x0 0x03d50000 0x0 0x10000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2521  			      <0x0 0x0b280000 0x0 0x10000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2522  			reg-names = "gmu", "rscc", "gmu_pdc";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2523  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2524  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2525  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2526  			interrupt-names = "hfi", "gmu";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2527  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2528  			clocks = <&gpucc GPU_CC_AHB_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2529  				 <&gpucc GPU_CC_CX_GMU_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2530  				 <&gpucc GPU_CC_CXO_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2531  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2532  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2533  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2534  				 <&gpucc GPU_CC_DEMET_CLK>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2535  			clock-names = "ahb",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2536  				      "gmu",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2537  				      "cxo",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2538  				      "axi",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2539  				      "memnoc",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2540  				      "hub",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2541  				      "demet";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2542  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2543  			power-domains = <&gpucc GPU_CC_CX_GDSC>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2544  					<&gpucc GPU_CC_GX_GDSC>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2545  			power-domain-names = "cx",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2546  					     "gx";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2547  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2548  			iommus = <&adreno_smmu 5 0x0>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2549  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2550  			qcom,qmp = <&aoss_qmp>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2551  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2552  			operating-points-v2 = <&gmu_opp_table>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2553  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2554  			gmu_opp_table: opp-table {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2555  				compatible = "operating-points-v2";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2556  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2557  				opp-500000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2558  					opp-hz = /bits/ 64 <500000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2559  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2560  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2561  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2562  				opp-200000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2563  					opp-hz = /bits/ 64 <200000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2564  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2565  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2566  			};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2567  		};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2568  
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2569  		gpucc: clock-controller@3d90000 {
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2570  			compatible = "qcom,sm8550-gpucc";
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2571  			reg = <0 0x03d90000 0 0xa000>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2572  			clocks = <&bi_tcxo_div2>,
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2573  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2574  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2575  			#clock-cells = <1>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2576  			#reset-cells = <1>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2577  			#power-domain-cells = <1>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2578  		};
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2579  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2580  		adreno_smmu: iommu@3da0000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2581  			compatible = "qcom,sm8550-smmu-500", "qcom,adreno-smmu",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2582  				     "qcom,smmu-500", "arm,mmu-500";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2583  			reg = <0x0 0x03da0000 0x0 0x40000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2584  			#iommu-cells = <2>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2585  			#global-interrupts = <1>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2586  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2587  				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2588  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2589  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2590  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2591  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2592  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2593  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2594  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2595  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2596  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2597  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2598  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2599  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2600  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2601  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2602  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2603  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2604  				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2605  				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2606  				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2607  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2608  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2609  				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2610  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2611  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2612  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2613  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2614  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2615  				 <&gpucc GPU_CC_AHB_CLK>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2616  			clock-names = "hlos",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2617  				      "bus",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2618  				      "iface",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2619  				      "ahb";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2620  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2621  			dma-coherent;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2622  		};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2623  
32c5a8b93ba543 Alex Elder            2023-11-24  2624  		ipa: ipa@3f40000 {
32c5a8b93ba543 Alex Elder            2023-11-24  2625  			compatible = "qcom,sm8550-ipa";
32c5a8b93ba543 Alex Elder            2023-11-24  2626  
32c5a8b93ba543 Alex Elder            2023-11-24  2627  			iommus = <&apps_smmu 0x4a0 0x0>,
32c5a8b93ba543 Alex Elder            2023-11-24  2628  				 <&apps_smmu 0x4a2 0x0>;
32c5a8b93ba543 Alex Elder            2023-11-24  2629  			reg = <0 0x3f40000 0 0x10000>,
32c5a8b93ba543 Alex Elder            2023-11-24  2630  			      <0 0x3f50000 0 0x5000>,
32c5a8b93ba543 Alex Elder            2023-11-24  2631  			      <0 0x3e04000 0 0xfc000>;
32c5a8b93ba543 Alex Elder            2023-11-24  2632  			reg-names = "ipa-reg",
32c5a8b93ba543 Alex Elder            2023-11-24  2633  				    "ipa-shared",
32c5a8b93ba543 Alex Elder            2023-11-24  2634  				    "gsi";
32c5a8b93ba543 Alex Elder            2023-11-24  2635  
32c5a8b93ba543 Alex Elder            2023-11-24  2636  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
32c5a8b93ba543 Alex Elder            2023-11-24  2637  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
32c5a8b93ba543 Alex Elder            2023-11-24  2638  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
32c5a8b93ba543 Alex Elder            2023-11-24  2639  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
32c5a8b93ba543 Alex Elder            2023-11-24  2640  			interrupt-names = "ipa",
32c5a8b93ba543 Alex Elder            2023-11-24  2641  					  "gsi",
32c5a8b93ba543 Alex Elder            2023-11-24  2642  					  "ipa-clock-query",
32c5a8b93ba543 Alex Elder            2023-11-24  2643  					  "ipa-setup-ready";
32c5a8b93ba543 Alex Elder            2023-11-24  2644  
32c5a8b93ba543 Alex Elder            2023-11-24  2645  			clocks = <&rpmhcc RPMH_IPA_CLK>;
32c5a8b93ba543 Alex Elder            2023-11-24  2646  			clock-names = "core";
32c5a8b93ba543 Alex Elder            2023-11-24  2647  
54df5e52777e11 Neil Armstrong        2025-01-15  2648  			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2649  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  2650  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  2651  					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
32c5a8b93ba543 Alex Elder            2023-11-24  2652  			interconnect-names = "memory",
32c5a8b93ba543 Alex Elder            2023-11-24  2653  					     "config";
32c5a8b93ba543 Alex Elder            2023-11-24  2654  
32c5a8b93ba543 Alex Elder            2023-11-24  2655  			qcom,qmp = <&aoss_qmp>;
32c5a8b93ba543 Alex Elder            2023-11-24  2656  
32c5a8b93ba543 Alex Elder            2023-11-24  2657  			qcom,smem-states = <&ipa_smp2p_out 0>,
32c5a8b93ba543 Alex Elder            2023-11-24  2658  					   <&ipa_smp2p_out 1>;
32c5a8b93ba543 Alex Elder            2023-11-24  2659  			qcom,smem-state-names = "ipa-clock-enabled-valid",
32c5a8b93ba543 Alex Elder            2023-11-24  2660  						"ipa-clock-enabled";
32c5a8b93ba543 Alex Elder            2023-11-24  2661  
32c5a8b93ba543 Alex Elder            2023-11-24  2662  			status = "disabled";
32c5a8b93ba543 Alex Elder            2023-11-24  2663  		};
32c5a8b93ba543 Alex Elder            2023-11-24  2664  
d0c061e366ed55 Neil Armstrong        2023-01-18  2665  		remoteproc_mpss: remoteproc@4080000 {
d0c061e366ed55 Neil Armstrong        2023-01-18  2666  			compatible = "qcom,sm8550-mpss-pas";
8ef227e93a513d Krzysztof Kozlowski   2024-12-13  2667  			reg = <0x0 0x04080000 0x0 0x10000>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2668  
d0c061e366ed55 Neil Armstrong        2023-01-18  2669  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2670  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2671  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2672  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2673  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2674  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2675  			interrupt-names = "wdog", "fatal", "ready", "handover",
d0c061e366ed55 Neil Armstrong        2023-01-18  2676  					  "stop-ack", "shutdown-ack";
d0c061e366ed55 Neil Armstrong        2023-01-18  2677  
d0c061e366ed55 Neil Armstrong        2023-01-18  2678  			clocks = <&rpmhcc RPMH_CXO_CLK>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2679  			clock-names = "xo";
d0c061e366ed55 Neil Armstrong        2023-01-18  2680  
1d14bcffb49c9d Rohit Agarwal         2023-07-20  2681  			power-domains = <&rpmhpd RPMHPD_CX>,
1d14bcffb49c9d Rohit Agarwal         2023-07-20  2682  					<&rpmhpd RPMHPD_MSS>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2683  			power-domain-names = "cx", "mss";
d0c061e366ed55 Neil Armstrong        2023-01-18  2684  
54df5e52777e11 Neil Armstrong        2025-01-15  2685  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2686  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2687  
d0c061e366ed55 Neil Armstrong        2023-01-18  2688  			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>, <&mpss_dsm_mem>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2689  
d0c061e366ed55 Neil Armstrong        2023-01-18  2690  			qcom,qmp = <&aoss_qmp>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2691  
d0c061e366ed55 Neil Armstrong        2023-01-18  2692  			qcom,smem-states = <&smp2p_modem_out 0>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2693  			qcom,smem-state-names = "stop";
d0c061e366ed55 Neil Armstrong        2023-01-18  2694  
d0c061e366ed55 Neil Armstrong        2023-01-18  2695  			status = "disabled";
d0c061e366ed55 Neil Armstrong        2023-01-18  2696  
d0c061e366ed55 Neil Armstrong        2023-01-18  2697  			glink-edge {
d0c061e366ed55 Neil Armstrong        2023-01-18  2698  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18  2699  							     IPCC_MPROC_SIGNAL_GLINK_QMP
d0c061e366ed55 Neil Armstrong        2023-01-18  2700  							     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2701  				mboxes = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18  2702  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2703  				label = "mpss";
d0c061e366ed55 Neil Armstrong        2023-01-18  2704  				qcom,remote-pid = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2705  			};
d0c061e366ed55 Neil Armstrong        2023-01-18  2706  		};
d0c061e366ed55 Neil Armstrong        2023-01-18  2707  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2708  		remoteproc_adsp: remoteproc@6800000 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2709  			compatible = "qcom,sm8550-adsp-pas";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2710  			reg = <0x0 0x06800000 0x0 0x10000>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2711  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2712  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2713  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2714  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2715  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2716  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2717  			interrupt-names = "wdog", "fatal", "ready",
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2718  					  "handover", "stop-ack";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2719  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2720  			clocks = <&rpmhcc RPMH_CXO_CLK>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2721  			clock-names = "xo";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2722  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2723  			power-domains = <&rpmhpd RPMHPD_LCX>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2724  					<&rpmhpd RPMHPD_LMX>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2725  			power-domain-names = "lcx", "lmx";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2726  
54df5e52777e11 Neil Armstrong        2025-01-15  2727  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  2728  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2729  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2730  			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2731  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2732  			qcom,qmp = <&aoss_qmp>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2733  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2734  			qcom,smem-states = <&smp2p_adsp_out 0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2735  			qcom,smem-state-names = "stop";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2736  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2737  			status = "disabled";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2738  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2739  			remoteproc_adsp_glink: glink-edge {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2740  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2741  							     IPCC_MPROC_SIGNAL_GLINK_QMP
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2742  							     IRQ_TYPE_EDGE_RISING>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2743  				mboxes = <&ipcc IPCC_CLIENT_LPASS
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2744  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2745  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2746  				label = "lpass";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2747  				qcom,remote-pid = <2>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2748  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2749  				fastrpc {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2750  					compatible = "qcom,fastrpc";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2751  					qcom,glink-channels = "fastrpcglink-apps-dsp";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2752  					label = "adsp";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2753  					qcom,non-secure-domain;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2754  					#address-cells = <1>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2755  					#size-cells = <0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2756  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2757  					compute-cb@3 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2758  						compatible = "qcom,fastrpc-compute-cb";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2759  						reg = <3>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2760  						iommus = <&apps_smmu 0x1003 0x80>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2761  							 <&apps_smmu 0x1063 0x0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2762  						dma-coherent;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2763  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2764  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2765  					compute-cb@4 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2766  						compatible = "qcom,fastrpc-compute-cb";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2767  						reg = <4>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2768  						iommus = <&apps_smmu 0x1004 0x80>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2769  							 <&apps_smmu 0x1064 0x0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2770  						dma-coherent;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2771  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2772  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2773  					compute-cb@5 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2774  						compatible = "qcom,fastrpc-compute-cb";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2775  						reg = <5>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2776  						iommus = <&apps_smmu 0x1005 0x80>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2777  							 <&apps_smmu 0x1065 0x0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2778  						dma-coherent;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2779  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2780  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2781  					compute-cb@6 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2782  						compatible = "qcom,fastrpc-compute-cb";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2783  						reg = <6>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2784  						iommus = <&apps_smmu 0x1006 0x80>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2785  							 <&apps_smmu 0x1066 0x0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2786  						dma-coherent;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2787  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2788  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2789  					compute-cb@7 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2790  						compatible = "qcom,fastrpc-compute-cb";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2791  						reg = <7>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2792  						iommus = <&apps_smmu 0x1007 0x80>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2793  							 <&apps_smmu 0x1067 0x0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2794  						dma-coherent;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2795  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2796  				};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2797  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2798  				gpr {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2799  					compatible = "qcom,gpr";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2800  					qcom,glink-channels = "adsp_apps";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2801  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2802  					qcom,intents = <512 20>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2803  					#address-cells = <1>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2804  					#size-cells = <0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2805  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2806  					q6apm: service@1 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2807  						compatible = "qcom,q6apm";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2808  						reg = <GPR_APM_MODULE_IID>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2809  						#sound-dai-cells = <0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2810  						qcom,protection-domain = "avs/audio",
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2811  									 "msm/adsp/audio_pd";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2812  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2813  						q6apmdai: dais {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2814  							compatible = "qcom,q6apm-dais";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2815  							iommus = <&apps_smmu 0x1001 0x80>,
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2816  								 <&apps_smmu 0x1061 0x0>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2817  						};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2818  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2819  						q6apmbedai: bedais {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2820  							compatible = "qcom,q6apm-lpass-dais";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2821  							#sound-dai-cells = <1>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2822  						};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2823  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2824  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2825  					q6prm: service@2 {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2826  						compatible = "qcom,q6prm";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2827  						reg = <GPR_PRM_MODULE_IID>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2828  						qcom,protection-domain = "avs/audio",
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2829  									 "msm/adsp/audio_pd";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2830  
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2831  						q6prmcc: clock-controller {
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2832  							compatible = "qcom,q6prm-lpass-clocks";
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2833  							#clock-cells = <2>;
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2834  						};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2835  					};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2836  				};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2837  			};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2838  		};
a6a8f54bc2af55 Krzysztof Kozlowski   2024-12-13  2839  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2840  		lpass_wsa2macro: codec@6aa0000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2841  			compatible = "qcom,sm8550-lpass-wsa-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2842  			reg = <0 0x06aa0000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2843  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2844  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2845  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2846  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2847  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2848  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2849  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2850  			clock-output-names = "wsa2-mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2851  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2852  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2853  
07c88da81caf0e Neil Armstrong        2023-11-06  2854  		swr3: soundwire@6ab0000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2855  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2856  			reg = <0 0x06ab0000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2857  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2858  			clocks = <&lpass_wsa2macro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2859  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2860  			label = "WSA2";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2861  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2862  			pinctrl-0 = <&wsa2_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2863  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2864  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2865  			qcom,din-ports = <4>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2866  			qcom,dout-ports = <9>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2867  
4c8bb2d567588c Krzysztof Kozlowski   2023-04-18  2868  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2869  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2870  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2871  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2872  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2873  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2874  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2875  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2876  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2877  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2878  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2879  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2880  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2881  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2882  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2883  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2884  		lpass_rxmacro: codec@6ac0000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2885  			compatible = "qcom,sm8550-lpass-rx-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2886  			reg = <0 0x06ac0000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2887  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2888  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2889  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2890  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2891  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2892  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2893  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2894  			clock-output-names = "mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2895  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2896  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2897  
07c88da81caf0e Neil Armstrong        2023-11-06  2898  		swr1: soundwire@6ad0000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2899  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2900  			reg = <0 0x06ad0000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2901  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2902  			clocks = <&lpass_rxmacro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2903  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2904  			label = "RX";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2905  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2906  			pinctrl-0 = <&rx_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2907  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2908  
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2909  			qcom,din-ports = <1>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2910  			qcom,dout-ports = <11>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2911  
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2912  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2913  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2914  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2915  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2916  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2917  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2918  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2919  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2920  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2921  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2922  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2923  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2924  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2925  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2926  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2927  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2928  		lpass_txmacro: codec@6ae0000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2929  			compatible = "qcom,sm8550-lpass-tx-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2930  			reg = <0 0x06ae0000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2931  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2932  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2933  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2934  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2935  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2936  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2937  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2938  			clock-output-names = "mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2939  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2940  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2941  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2942  		lpass_wsamacro: codec@6b00000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2943  			compatible = "qcom,sm8550-lpass-wsa-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2944  			reg = <0 0x06b00000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2945  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2946  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2947  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2948  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2949  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2950  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2951  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2952  			clock-output-names = "mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2953  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2954  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2955  
07c88da81caf0e Neil Armstrong        2023-11-06  2956  		swr0: soundwire@6b10000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2957  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2958  			reg = <0 0x06b10000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2959  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2960  			clocks = <&lpass_wsamacro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2961  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2962  			label = "WSA";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2963  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2964  			pinctrl-0 = <&wsa_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2965  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2966  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2967  			qcom,din-ports = <4>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2968  			qcom,dout-ports = <9>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2969  
4c8bb2d567588c Krzysztof Kozlowski   2023-04-18  2970  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2971  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2972  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2973  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2974  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2975  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2976  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2977  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2978  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2979  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2980  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2981  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2982  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2983  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2984  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2985  
07c88da81caf0e Neil Armstrong        2023-11-06  2986  		swr2: soundwire@6d30000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2987  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2988  			reg = <0 0x06d30000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2989  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2990  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2991  			interrupt-names = "core", "wakeup";
ead0f132fc494b Krzysztof Kozlowski   2023-11-29  2992  			clocks = <&lpass_txmacro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2993  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2994  			label = "TX";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2995  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2996  			pinctrl-0 = <&tx_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2997  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2998  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2999  			qcom,din-ports = <4>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3000  			qcom,dout-ports = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3001  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3002  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3003  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3004  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3005  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3006  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3007  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3008  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3009  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3010  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3011  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3012  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3013  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3014  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3015  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  3016  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3017  		lpass_vamacro: codec@6d44000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3018  			compatible = "qcom,sm8550-lpass-va-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3019  			reg = <0 0x06d44000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3020  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3021  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3022  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3023  			clock-names = "mclk", "macro", "dcodec";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3024  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3025  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3026  			clock-output-names = "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3027  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3028  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3029  
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3030  		lpass_tlmm: pinctrl@6e80000 {
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3031  			compatible = "qcom,sm8550-lpass-lpi-pinctrl";
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3032  			reg = <0 0x06e80000 0 0x20000>,
a5982b39710071 Krzysztof Kozlowski   2023-03-02  3033  			      <0 0x07250000 0 0x10000>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3034  			gpio-controller;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3035  			#gpio-cells = <2>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3036  			gpio-ranges = <&lpass_tlmm 0 0 23>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3037  
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3038  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3039  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3040  			clock-names = "core", "audio";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3041  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3042  			tx_swr_active: tx-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3043  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3044  					pins = "gpio0";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3045  					function = "swr_tx_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3046  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3047  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3048  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3049  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3050  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3051  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3052  					pins = "gpio1", "gpio2", "gpio14";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3053  					function = "swr_tx_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3054  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3055  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3056  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3057  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3058  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3059  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3060  			rx_swr_active: rx-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3061  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3062  					pins = "gpio3";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3063  					function = "swr_rx_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3064  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3065  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3066  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3067  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3068  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3069  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3070  					pins = "gpio4", "gpio5";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3071  					function = "swr_rx_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3072  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3073  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3074  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3075  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3076  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3077  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3078  			dmic01_default: dmic01-default-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3079  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3080  					pins = "gpio6";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3081  					function = "dmic1_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3082  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3083  					output-high;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3084  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3085  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3086  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3087  					pins = "gpio7";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3088  					function = "dmic1_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3089  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3090  					input-enable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3091  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3092  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3093  
c6e5bf9278749e Krzysztof Kozlowski   2024-02-12  3094  			dmic23_default: dmic23-default-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3095  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3096  					pins = "gpio8";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3097  					function = "dmic2_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3098  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3099  					output-high;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3100  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3101  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3102  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3103  					pins = "gpio9";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3104  					function = "dmic2_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3105  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3106  					input-enable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3107  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3108  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3109  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3110  			wsa_swr_active: wsa-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3111  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3112  					pins = "gpio10";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3113  					function = "wsa_swr_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3114  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3115  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3116  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3117  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3118  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3119  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3120  					pins = "gpio11";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3121  					function = "wsa_swr_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3122  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3123  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3124  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3125  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3126  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3127  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3128  			wsa2_swr_active: wsa2-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3129  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3130  					pins = "gpio15";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3131  					function = "wsa2_swr_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3132  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3133  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3134  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3135  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3136  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3137  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3138  					pins = "gpio16";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3139  					function = "wsa2_swr_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3140  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3141  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3142  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3143  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  3144  			};
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3145  		};
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  3146  
ffc50b2d382879 Abel Vesa             2023-01-06  3147  		lpass_lpiaon_noc: interconnect@7400000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3148  			compatible = "qcom,sm8550-lpass-lpiaon-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  3149  			reg = <0 0x07400000 0 0x19080>;
ffc50b2d382879 Abel Vesa             2023-01-06  3150  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  3151  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  3152  		};
ffc50b2d382879 Abel Vesa             2023-01-06  3153  
ffc50b2d382879 Abel Vesa             2023-01-06  3154  		lpass_lpicx_noc: interconnect@7430000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3155  			compatible = "qcom,sm8550-lpass-lpicx-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  3156  			reg = <0 0x07430000 0 0x3a200>;
ffc50b2d382879 Abel Vesa             2023-01-06  3157  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  3158  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  3159  		};
ffc50b2d382879 Abel Vesa             2023-01-06  3160  
ffc50b2d382879 Abel Vesa             2023-01-06  3161  		lpass_ag_noc: interconnect@7e40000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3162  			compatible = "qcom,sm8550-lpass-ag-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  3163  			reg = <0 0x07e40000 0 0xe080>;
ffc50b2d382879 Abel Vesa             2023-01-06  3164  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  3165  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  3166  		};
ffc50b2d382879 Abel Vesa             2023-01-06  3167  
ffc50b2d382879 Abel Vesa             2023-01-06  3168  		sdhc_2: mmc@8804000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3169  			compatible = "qcom,sm8550-sdhci", "qcom,sdhci-msm-v5";
ffc50b2d382879 Abel Vesa             2023-01-06  3170  			reg = <0 0x08804000 0 0x1000>;
ffc50b2d382879 Abel Vesa             2023-01-06  3171  
ffc50b2d382879 Abel Vesa             2023-01-06  3172  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  3173  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  3174  			interrupt-names = "hc_irq", "pwr_irq";
ffc50b2d382879 Abel Vesa             2023-01-06  3175  
ffc50b2d382879 Abel Vesa             2023-01-06  3176  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  3177  				 <&gcc GCC_SDCC2_APPS_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  3178  				 <&rpmhcc RPMH_CXO_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  3179  			clock-names = "iface", "core", "xo";
ffc50b2d382879 Abel Vesa             2023-01-06  3180  			iommus = <&apps_smmu 0x540 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  3181  			qcom,dll-config = <0x0007642c>;
ffc50b2d382879 Abel Vesa             2023-01-06  3182  			qcom,ddr-config = <0x80040868>;
1d14bcffb49c9d Rohit Agarwal         2023-07-20  3183  			power-domains = <&rpmhpd RPMHPD_CX>;
ffc50b2d382879 Abel Vesa             2023-01-06  3184  			operating-points-v2 = <&sdhc2_opp_table>;
ffc50b2d382879 Abel Vesa             2023-01-06  3185  
54df5e52777e11 Neil Armstrong        2025-01-15  3186  			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
54df5e52777e11 Neil Armstrong        2025-01-15  3187  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
48c84d96dcd022 Neil Armstrong        2025-01-15  3188  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
48c84d96dcd022 Neil Armstrong        2025-01-15  3189  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
ffc50b2d382879 Abel Vesa             2023-01-06  3190  			interconnect-names = "sdhc-ddr", "cpu-sdhc";
ffc50b2d382879 Abel Vesa             2023-01-06  3191  			bus-width = <4>;
ffc50b2d382879 Abel Vesa             2023-01-06  3192  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06  3193  
ffc50b2d382879 Abel Vesa             2023-01-06  3194  			/* Forbid SDR104/SDR50 - broken hw! */
ffc50b2d382879 Abel Vesa             2023-01-06  3195  			sdhci-caps-mask = <0x3 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  3196  
ffc50b2d382879 Abel Vesa             2023-01-06  3197  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  3198  
ffc50b2d382879 Abel Vesa             2023-01-06  3199  			sdhc2_opp_table: opp-table {
ffc50b2d382879 Abel Vesa             2023-01-06  3200  				compatible = "operating-points-v2";
ffc50b2d382879 Abel Vesa             2023-01-06  3201  
ffc50b2d382879 Abel Vesa             2023-01-06  3202  				opp-19200000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3203  					opp-hz = /bits/ 64 <19200000>;
ffc50b2d382879 Abel Vesa             2023-01-06  3204  					required-opps = <&rpmhpd_opp_min_svs>;
ffc50b2d382879 Abel Vesa             2023-01-06  3205  				};
ffc50b2d382879 Abel Vesa             2023-01-06  3206  
ffc50b2d382879 Abel Vesa             2023-01-06  3207  				opp-50000000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3208  					opp-hz = /bits/ 64 <50000000>;
ffc50b2d382879 Abel Vesa             2023-01-06  3209  					required-opps = <&rpmhpd_opp_low_svs>;
ffc50b2d382879 Abel Vesa             2023-01-06  3210  				};
ffc50b2d382879 Abel Vesa             2023-01-06  3211  
ffc50b2d382879 Abel Vesa             2023-01-06  3212  				opp-100000000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3213  					opp-hz = /bits/ 64 <100000000>;
ffc50b2d382879 Abel Vesa             2023-01-06  3214  					required-opps = <&rpmhpd_opp_svs>;
ffc50b2d382879 Abel Vesa             2023-01-06  3215  				};
ffc50b2d382879 Abel Vesa             2023-01-06  3216  
ffc50b2d382879 Abel Vesa             2023-01-06  3217  				opp-202000000 {
ffc50b2d382879 Abel Vesa             2023-01-06  3218  					opp-hz = /bits/ 64 <202000000>;
ffc50b2d382879 Abel Vesa             2023-01-06  3219  					required-opps = <&rpmhpd_opp_svs_l1>;
ffc50b2d382879 Abel Vesa             2023-01-06  3220  				};
ffc50b2d382879 Abel Vesa             2023-01-06  3221  			};
ffc50b2d382879 Abel Vesa             2023-01-06  3222  		};
ffc50b2d382879 Abel Vesa             2023-01-06  3223  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3224  		iris: video-codec@aa00000 {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3225  			compatible = "qcom,sm8550-iris";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3226  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3227  			reg = <0 0x0aa00000 0 0xf0000>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3228  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3229  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3230  			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3231  					<&videocc VIDEO_CC_MVS0_GDSC>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3232  					<&rpmhpd RPMHPD_MXC>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3233  					<&rpmhpd RPMHPD_MMCX>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3234  			power-domain-names = "venus",
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3235  					     "vcodec0",
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3236  					     "mxc",
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3237  					     "mmcx";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3238  			operating-points-v2 = <&iris_opp_table>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3239  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3240  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3241  				 <&videocc VIDEO_CC_MVS0C_CLK>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3242  				 <&videocc VIDEO_CC_MVS0_CLK>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3243  			clock-names = "iface",
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3244  				      "core",
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3245  				      "vcodec0_core";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3246  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3247  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3248  					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3249  					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3250  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3251  			interconnect-names = "cpu-cfg",
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3252  					     "video-mem";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3253  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3254  			memory-region = <&video_mem>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3255  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3256  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3257  			reset-names = "bus";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3258  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3259  			iommus = <&apps_smmu 0x1940 0>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3260  				 <&apps_smmu 0x1947 0>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3261  			dma-coherent;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3262  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3263  			/*
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3264  			 * IRIS firmware is signed by vendors, only
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3265  			 * enable in boards where the proper signed firmware
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3266  			 * is available.
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3267  			 */
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3268  			status = "disabled";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3269  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3270  			iris_opp_table: opp-table {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3271  				compatible = "operating-points-v2";
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3272  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3273  				opp-240000000 {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3274  					opp-hz = /bits/ 64 <240000000>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3275  					required-opps = <&rpmhpd_opp_svs>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3276  							<&rpmhpd_opp_low_svs>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3277  				};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3278  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3279  				opp-338000000 {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3280  					opp-hz = /bits/ 64 <338000000>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3281  					required-opps = <&rpmhpd_opp_svs>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3282  							<&rpmhpd_opp_svs>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3283  				};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3284  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3285  				opp-366000000 {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3286  					opp-hz = /bits/ 64 <366000000>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3287  					required-opps = <&rpmhpd_opp_svs_l1>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3288  							<&rpmhpd_opp_svs_l1>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3289  				};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3290  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3291  				opp-444000000 {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3292  					opp-hz = /bits/ 64 <444000000>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3293  					required-opps = <&rpmhpd_opp_nom>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3294  							<&rpmhpd_opp_nom>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3295  				};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3296  
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3297  				opp-533333334 {
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3298  					opp-hz = /bits/ 64 <533333334>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3299  					required-opps = <&rpmhpd_opp_turbo>,
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3300  							<&rpmhpd_opp_turbo>;
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3301  				};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3302  			};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3303  		};
41661853ae8ed3 Dikshita Agarwal      2025-05-09  3304  
22ff170d455175 Jagadeesh Kona        2023-05-24  3305  		videocc: clock-controller@aaf0000 {
22ff170d455175 Jagadeesh Kona        2023-05-24  3306  			compatible = "qcom,sm8550-videocc";
22ff170d455175 Jagadeesh Kona        2023-05-24  3307  			reg = <0 0x0aaf0000 0 0x10000>;
22ff170d455175 Jagadeesh Kona        2023-05-24  3308  			clocks = <&bi_tcxo_div2>,
22ff170d455175 Jagadeesh Kona        2023-05-24  3309  				 <&gcc GCC_VIDEO_AHB_CLK>;
1d14bcffb49c9d Rohit Agarwal         2023-07-20  3310  			power-domains = <&rpmhpd RPMHPD_MMCX>;
22ff170d455175 Jagadeesh Kona        2023-05-24  3311  			required-opps = <&rpmhpd_opp_low_svs>;
22ff170d455175 Jagadeesh Kona        2023-05-24  3312  			#clock-cells = <1>;
22ff170d455175 Jagadeesh Kona        2023-05-24  3313  			#reset-cells = <1>;
22ff170d455175 Jagadeesh Kona        2023-05-24  3314  			#power-domain-cells = <1>;
22ff170d455175 Jagadeesh Kona        2023-05-24  3315  		};
22ff170d455175 Jagadeesh Kona        2023-05-24  3316  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3317  		cci0: cci@ac15000 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3318  			compatible = "qcom,sm8550-cci", "qcom,msm8996-cci";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3319  			reg = <0 0x0ac15000 0 0x1000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3320  			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3321  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3322  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3323  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3324  				 <&camcc CAM_CC_CCI_0_CLK>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3325  			clock-names = "camnoc_axi",
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3326  				      "cpas_ahb",
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3327  				      "cci";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3328  			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3329  			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3330  			pinctrl-names = "default", "sleep";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3331  			status = "disabled";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3332  			#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3333  			#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3334  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3335  			cci0_i2c0: i2c-bus@0 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3336  				reg = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3337  				clock-frequency = <1000000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3338  				#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3339  				#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3340  			};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3341  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3342  			cci0_i2c1: i2c-bus@1 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3343  				reg = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3344  				clock-frequency = <1000000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3345  				#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3346  				#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3347  			};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3348  		};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3349  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3350  		cci1: cci@ac16000 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3351  			compatible = "qcom,sm8550-cci", "qcom,msm8996-cci";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3352  			reg = <0 0x0ac16000 0 0x1000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3353  			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3354  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3355  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3356  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3357  				 <&camcc CAM_CC_CCI_1_CLK>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3358  			clock-names = "camnoc_axi",
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3359  				      "cpas_ahb",
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3360  				      "cci";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3361  			pinctrl-0 = <&cci1_0_default>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3362  			pinctrl-1 = <&cci1_0_sleep>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3363  			pinctrl-names = "default", "sleep";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3364  			status = "disabled";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3365  			#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3366  			#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3367  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3368  			cci1_i2c0: i2c-bus@0 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3369  				reg = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3370  				clock-frequency = <1000000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3371  				#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3372  				#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3373  			};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3374  		};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3375  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3376  		cci2: cci@ac17000 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3377  			compatible = "qcom,sm8550-cci", "qcom,msm8996-cci";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3378  			reg = <0 0x0ac17000 0 0x1000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3379  			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3380  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3381  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3382  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3383  				 <&camcc CAM_CC_CCI_2_CLK>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3384  			clock-names = "camnoc_axi",
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3385  				      "cpas_ahb",
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3386  				      "cci";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3387  			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3388  			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3389  			pinctrl-names = "default", "sleep";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3390  			status = "disabled";
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3391  			#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3392  			#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3393  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3394  			cci2_i2c0: i2c-bus@0 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3395  				reg = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3396  				clock-frequency = <1000000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3397  				#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3398  				#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3399  			};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3400  
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3401  			cci2_i2c1: i2c-bus@1 {
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3402  				reg = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3403  				clock-frequency = <1000000>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3404  				#address-cells = <1>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3405  				#size-cells = <0>;
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3406  			};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3407  		};
4f33e6432f0859 Vladimir Zapolskiy    2024-06-13  3408  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3409  		camss: isp@acb7000 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3410  			compatible = "qcom,sm8550-camss";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3411  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3412  			reg = <0x0 0x0acb7000 0x0 0x0d00>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3413  			      <0x0 0x0acb9000 0x0 0x0d00>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3414  			      <0x0 0x0acbb000 0x0 0x0d00>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3415  			      <0x0 0x0acca000 0x0 0x0a00>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3416  			      <0x0 0x0acce000 0x0 0x0a00>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3417  			      <0x0 0x0acb6000 0x0 0x1000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3418  			      <0x0 0x0ace4000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3419  			      <0x0 0x0ace6000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3420  			      <0x0 0x0ace8000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3421  			      <0x0 0x0acea000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3422  			      <0x0 0x0acec000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3423  			      <0x0 0x0acee000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3424  			      <0x0 0x0acf0000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3425  			      <0x0 0x0acf2000 0x0 0x2000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3426  			      <0x0 0x0ac62000 0x0 0xf000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3427  			      <0x0 0x0ac71000 0x0 0xf000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3428  			      <0x0 0x0ac80000 0x0 0xf000>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3429  			      <0x0 0x0accb000 0x0 0x1800>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3430  			      <0x0 0x0accf000 0x0 0x1800>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3431  			reg-names = "csid0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3432  				    "csid1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3433  				    "csid2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3434  				    "csid_lite0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3435  				    "csid_lite1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3436  				    "csid_wrapper",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3437  				    "csiphy0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3438  				    "csiphy1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3439  				    "csiphy2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3440  				    "csiphy3",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3441  				    "csiphy4",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3442  				    "csiphy5",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3443  				    "csiphy6",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3444  				    "csiphy7",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3445  				    "vfe0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3446  				    "vfe1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3447  				    "vfe2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3448  				    "vfe_lite0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3449  				    "vfe_lite1";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3450  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3451  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3452  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3453  				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3454  				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3455  				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3456  				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3457  				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3458  				 <&camcc CAM_CC_CSID_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3459  				 <&camcc CAM_CC_CSIPHY0_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3460  				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3461  				 <&camcc CAM_CC_CSIPHY1_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3462  				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3463  				 <&camcc CAM_CC_CSIPHY2_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3464  				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3465  				 <&camcc CAM_CC_CSIPHY3_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3466  				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3467  				 <&camcc CAM_CC_CSIPHY4_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3468  				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3469  				 <&camcc CAM_CC_CSIPHY5_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3470  				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3471  				 <&camcc CAM_CC_CSIPHY6_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3472  				 <&camcc CAM_CC_CSI6PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3473  				 <&camcc CAM_CC_CSIPHY7_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3474  				 <&camcc CAM_CC_CSI7PHYTIMER_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3475  				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3476  				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3477  				 <&camcc CAM_CC_IFE_0_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3478  				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3479  				 <&camcc CAM_CC_IFE_1_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3480  				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3481  				 <&camcc CAM_CC_IFE_2_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3482  				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3483  				 <&camcc CAM_CC_IFE_LITE_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3484  				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3485  				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3486  				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3487  			clock-names = "camnoc_axi",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3488  				      "cpas_ahb",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3489  				      "cpas_fast_ahb_clk",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3490  				      "cpas_ife_lite",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3491  				      "cpas_vfe0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3492  				      "cpas_vfe1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3493  				      "cpas_vfe2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3494  				      "csid",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3495  				      "csiphy0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3496  				      "csiphy0_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3497  				      "csiphy1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3498  				      "csiphy1_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3499  				      "csiphy2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3500  				      "csiphy2_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3501  				      "csiphy3",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3502  				      "csiphy3_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3503  				      "csiphy4",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3504  				      "csiphy4_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3505  				      "csiphy5",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3506  				      "csiphy5_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3507  				      "csiphy6",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3508  				      "csiphy6_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3509  				      "csiphy7",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3510  				      "csiphy7_timer",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3511  				      "csiphy_rx",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3512  				      "gcc_axi_hf",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3513  				      "vfe0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3514  				      "vfe0_fast_ahb",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3515  				      "vfe1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3516  				      "vfe1_fast_ahb",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3517  				      "vfe2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3518  				      "vfe2_fast_ahb",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3519  				      "vfe_lite",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3520  				      "vfe_lite_ahb",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3521  				      "vfe_lite_cphy_rx",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3522  				      "vfe_lite_csid";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3523  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3524  			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3525  				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3526  				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3527  				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3528  				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3529  				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3530  				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3531  				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3532  				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3533  				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3534  				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3535  				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3536  				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3537  				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3538  				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3539  				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3540  				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3541  				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3542  			interrupt-names = "csid0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3543  					  "csid1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3544  					  "csid2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3545  					  "csid_lite0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3546  					  "csid_lite1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3547  					  "csiphy0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3548  					  "csiphy1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3549  					  "csiphy2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3550  					  "csiphy3",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3551  					  "csiphy4",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3552  					  "csiphy5",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3553  					  "csiphy6",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3554  					  "csiphy7",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3555  					  "vfe0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3556  					  "vfe1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3557  					  "vfe2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3558  					  "vfe_lite0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3559  					  "vfe_lite1";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3560  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3561  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3562  					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3563  					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3564  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3565  			interconnect-names = "ahb",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3566  					     "hf_0_mnoc";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3567  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3568  			iommus = <&apps_smmu 0x800 0x20>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3569  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3570  			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3571  					<&camcc CAM_CC_IFE_1_GDSC>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3572  					<&camcc CAM_CC_IFE_2_GDSC>,
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3573  					<&camcc CAM_CC_TITAN_TOP_GDSC>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3574  			power-domain-names = "ife0",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3575  					     "ife1",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3576  					     "ife2",
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3577  					     "top";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3578  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3579  			status = "disabled";
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3580  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3581  			ports {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3582  				#address-cells = <1>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3583  				#size-cells = <0>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3584  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3585  				port@0 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3586  					reg = <0>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3587  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3588  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3589  				port@1 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3590  					reg = <1>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3591  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3592  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3593  				port@2 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3594  					reg = <2>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3595  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3596  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3597  				port@3 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3598  					reg = <3>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3599  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3600  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3601  				port@4 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3602  					reg = <4>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3603  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3604  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3605  				port@5 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3606  					reg = <5>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3607  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3608  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3609  				port@6 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3610  					reg = <6>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3611  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3612  
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3613  				port@7 {
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3614  					reg = <7>;
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3615  				};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3616  			};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3617  		};
c5aeb681fcdd23 Wenmeng Liu           2025-06-12  3618  
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3619  		camcc: clock-controller@ade0000 {
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3620  			compatible = "qcom,sm8550-camcc";
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3621  			reg = <0 0x0ade0000 0 0x20000>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3622  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3623  				 <&bi_tcxo_div2>,
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3624  				 <&bi_tcxo_ao_div2>,
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3625  				 <&sleep_clk>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3626  			power-domains = <&rpmhpd SM8550_MMCX>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3627  			required-opps = <&rpmhpd_opp_low_svs>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3628  			#clock-cells = <1>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3629  			#reset-cells = <1>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3630  			#power-domain-cells = <1>;
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3631  		};
e271b59e39a6fb Jagadeesh Kona        2023-07-07  3632  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3633  		mdss: display-subsystem@ae00000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3634  			compatible = "qcom,sm8550-mdss";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3635  			reg = <0 0x0ae00000 0 0x1000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3636  			reg-names = "mdss";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3637  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3638  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3639  			interrupt-controller;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3640  			#interrupt-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3641  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3642  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3643  				 <&gcc GCC_DISP_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3644  				 <&gcc GCC_DISP_HF_AXI_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3645  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3646  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3647  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3648  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3649  			power-domains = <&dispcc MDSS_GDSC>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3650  
54df5e52777e11 Neil Armstrong        2025-01-15  3651  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
327d489d1ecaf1 Neil Armstrong        2025-02-27  3652  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
327d489d1ecaf1 Neil Armstrong        2025-02-27  3653  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
327d489d1ecaf1 Neil Armstrong        2025-02-27  3654  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
327d489d1ecaf1 Neil Armstrong        2025-02-27  3655  			interconnect-names = "mdp0-mem", "cpu-cfg";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3656  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3657  			iommus = <&apps_smmu 0x1c00 0x2>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3658  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3659  			#address-cells = <2>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3660  			#size-cells = <2>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3661  			ranges;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3662  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3663  			status = "disabled";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3664  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3665  			mdss_mdp: display-controller@ae01000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3666  				compatible = "qcom,sm8550-dpu";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3667  				reg = <0 0x0ae01000 0 0x8f000>,
9e9d8349e76252 Dmitry Baryshkov      2025-04-15  3668  				      <0 0x0aeb0000 0 0x3000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3669  				reg-names = "mdp", "vbif";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3670  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3671  				interrupt-parent = <&mdss>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3672  				interrupts = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3673  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3674  				clocks = <&gcc GCC_DISP_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3675  					 <&gcc GCC_DISP_HF_AXI_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3676  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3677  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3678  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3679  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3680  				clock-names = "bus",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3681  					      "nrt_bus",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3682  					      "iface",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3683  					      "lut",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3684  					      "core",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3685  					      "vsync";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3686  
1d14bcffb49c9d Rohit Agarwal         2023-07-20  3687  				power-domains = <&rpmhpd RPMHPD_MMCX>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3688  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3689  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3690  				assigned-clock-rates = <19200000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3691  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3692  				operating-points-v2 = <&mdp_opp_table>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3693  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3694  				ports {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3695  					#address-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3696  					#size-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3697  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3698  					port@0 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3699  						reg = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3700  						dpu_intf1_out: endpoint {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3701  							remote-endpoint = <&mdss_dsi0_in>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3702  						};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3703  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3704  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3705  					port@1 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3706  						reg = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3707  						dpu_intf2_out: endpoint {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3708  							remote-endpoint = <&mdss_dsi1_in>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3709  						};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3710  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3711  
66adfbc4d33993 Neil Armstrong        2023-06-13  3712  					port@2 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3713  						reg = <2>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3714  						dpu_intf0_out: endpoint {
66adfbc4d33993 Neil Armstrong        2023-06-13  3715  							remote-endpoint = <&mdss_dp0_in>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3716  						};
66adfbc4d33993 Neil Armstrong        2023-06-13  3717  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3718  				};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3719  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3720  				mdp_opp_table: opp-table {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3721  					compatible = "operating-points-v2";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3722  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3723  					opp-200000000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3724  						opp-hz = /bits/ 64 <200000000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3725  						required-opps = <&rpmhpd_opp_low_svs>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3726  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3727  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3728  					opp-325000000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3729  						opp-hz = /bits/ 64 <325000000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3730  						required-opps = <&rpmhpd_opp_svs>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3731  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3732  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3733  					opp-375000000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3734  						opp-hz = /bits/ 64 <375000000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3735  						required-opps = <&rpmhpd_opp_svs_l1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3736  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3737  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3738  					opp-514000000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3739  						opp-hz = /bits/ 64 <514000000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3740  						required-opps = <&rpmhpd_opp_nom>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3741  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3742  				};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3743  			};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3744  
66adfbc4d33993 Neil Armstrong        2023-06-13  3745  			mdss_dp0: displayport-controller@ae90000 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3746  				compatible = "qcom,sm8550-dp", "qcom,sm8350-dp";
66adfbc4d33993 Neil Armstrong        2023-06-13  3747  				reg = <0 0xae90000 0 0x200>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3748  				      <0 0xae90200 0 0x200>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3749  				      <0 0xae90400 0 0xc00>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3750  				      <0 0xae91000 0 0x400>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3751  				      <0 0xae91400 0 0x400>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3752  				interrupt-parent = <&mdss>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3753  				interrupts = <12>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3754  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3755  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3756  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3757  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3758  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3759  				clock-names = "core_iface",
66adfbc4d33993 Neil Armstrong        2023-06-13  3760  					      "core_aux",
66adfbc4d33993 Neil Armstrong        2023-06-13  3761  					      "ctrl_link",
66adfbc4d33993 Neil Armstrong        2023-06-13  3762  					      "ctrl_link_iface",
66adfbc4d33993 Neil Armstrong        2023-06-13  3763  					      "stream_pixel";
66adfbc4d33993 Neil Armstrong        2023-06-13  3764  
66adfbc4d33993 Neil Armstrong        2023-06-13  3765  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3766  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3767  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  3768  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3769  
66adfbc4d33993 Neil Armstrong        2023-06-13  3770  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3771  				phy-names = "dp";
66adfbc4d33993 Neil Armstrong        2023-06-13  3772  
66adfbc4d33993 Neil Armstrong        2023-06-13  3773  				#sound-dai-cells = <0>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3774  
66adfbc4d33993 Neil Armstrong        2023-06-13  3775  				operating-points-v2 = <&dp_opp_table>;
1d14bcffb49c9d Rohit Agarwal         2023-07-20  3776  				power-domains = <&rpmhpd RPMHPD_MMCX>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3777  
66adfbc4d33993 Neil Armstrong        2023-06-13  3778  				status = "disabled";
66adfbc4d33993 Neil Armstrong        2023-06-13  3779  
66adfbc4d33993 Neil Armstrong        2023-06-13  3780  				ports {
66adfbc4d33993 Neil Armstrong        2023-06-13  3781  					#address-cells = <1>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3782  					#size-cells = <0>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3783  
66adfbc4d33993 Neil Armstrong        2023-06-13  3784  					port@0 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3785  						reg = <0>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3786  						mdss_dp0_in: endpoint {
66adfbc4d33993 Neil Armstrong        2023-06-13  3787  							remote-endpoint = <&dpu_intf0_out>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3788  						};
66adfbc4d33993 Neil Armstrong        2023-06-13  3789  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3790  
66adfbc4d33993 Neil Armstrong        2023-06-13  3791  					port@1 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3792  						reg = <1>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3793  						mdss_dp0_out: endpoint {
2f212acedbbfe7 Dmitry Baryshkov      2024-04-29  3794  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3795  						};
66adfbc4d33993 Neil Armstrong        2023-06-13  3796  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3797  				};
66adfbc4d33993 Neil Armstrong        2023-06-13  3798  
66adfbc4d33993 Neil Armstrong        2023-06-13  3799  				dp_opp_table: opp-table {
66adfbc4d33993 Neil Armstrong        2023-06-13  3800  					compatible = "operating-points-v2";
66adfbc4d33993 Neil Armstrong        2023-06-13  3801  
66adfbc4d33993 Neil Armstrong        2023-06-13  3802  					opp-162000000 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3803  						opp-hz = /bits/ 64 <162000000>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3804  						required-opps = <&rpmhpd_opp_low_svs_d1>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3805  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3806  
66adfbc4d33993 Neil Armstrong        2023-06-13  3807  					opp-270000000 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3808  						opp-hz = /bits/ 64 <270000000>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3809  						required-opps = <&rpmhpd_opp_low_svs>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3810  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3811  
66adfbc4d33993 Neil Armstrong        2023-06-13  3812  					opp-540000000 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3813  						opp-hz = /bits/ 64 <540000000>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3814  						required-opps = <&rpmhpd_opp_svs_l1>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3815  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3816  
66adfbc4d33993 Neil Armstrong        2023-06-13  3817  					opp-810000000 {
66adfbc4d33993 Neil Armstrong        2023-06-13  3818  						opp-hz = /bits/ 64 <810000000>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3819  						required-opps = <&rpmhpd_opp_nom>;
66adfbc4d33993 Neil Armstrong        2023-06-13  3820  					};
66adfbc4d33993 Neil Armstrong        2023-06-13  3821  				};
66adfbc4d33993 Neil Armstrong        2023-06-13  3822  			};
66adfbc4d33993 Neil Armstrong        2023-06-13  3823  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3824  			mdss_dsi0: dsi@ae94000 {
c64c1c245f667e Neil Armstrong        2023-02-07  3825  				compatible = "qcom,sm8550-dsi-ctrl", "qcom,mdss-dsi-ctrl";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3826  				reg = <0 0x0ae94000 0 0x400>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3827  				reg-names = "dsi_ctrl";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3828  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3829  				interrupt-parent = <&mdss>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3830  				interrupts = <4>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3831  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3832  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3833  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3834  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3835  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3836  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3837  					 <&gcc GCC_DISP_HF_AXI_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3838  				clock-names = "byte",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3839  					      "byte_intf",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3840  					      "pixel",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3841  					      "core",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3842  					      "iface",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3843  					      "bus";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3844  
1d14bcffb49c9d Rohit Agarwal         2023-07-20  3845  				power-domains = <&rpmhpd RPMHPD_MMCX>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3846  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3847  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3848  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  3849  				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  3850  							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3851  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3852  				operating-points-v2 = <&mdss_dsi_opp_table>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3853  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3854  				phys = <&mdss_dsi0_phy>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3855  				phy-names = "dsi";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3856  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3857  				#address-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3858  				#size-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3859  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3860  				status = "disabled";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3861  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3862  				ports {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3863  					#address-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3864  					#size-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3865  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3866  					port@0 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3867  						reg = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3868  						mdss_dsi0_in: endpoint {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3869  							remote-endpoint = <&dpu_intf1_out>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3870  						};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3871  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3872  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3873  					port@1 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3874  						reg = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3875  						mdss_dsi0_out: endpoint {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3876  						};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3877  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3878  				};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3879  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3880  				mdss_dsi_opp_table: opp-table {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3881  					compatible = "operating-points-v2";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3882  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3883  					opp-187500000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3884  						opp-hz = /bits/ 64 <187500000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3885  						required-opps = <&rpmhpd_opp_low_svs>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3886  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3887  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3888  					opp-300000000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3889  						opp-hz = /bits/ 64 <300000000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3890  						required-opps = <&rpmhpd_opp_svs>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3891  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3892  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3893  					opp-358000000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3894  						opp-hz = /bits/ 64 <358000000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3895  						required-opps = <&rpmhpd_opp_svs_l1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3896  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3897  				};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3898  			};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3899  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3900  			mdss_dsi0_phy: phy@ae95000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3901  				compatible = "qcom,sm8550-dsi-phy-4nm";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3902  				reg = <0 0x0ae95000 0 0x200>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3903  				      <0 0x0ae95200 0 0x280>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3904  				      <0 0x0ae95500 0 0x400>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3905  				reg-names = "dsi_phy",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3906  					    "dsi_phy_lane",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3907  					    "dsi_pll";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3908  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3909  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3910  					 <&rpmhcc RPMH_CXO_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3911  				clock-names = "iface", "ref";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3912  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3913  				#clock-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3914  				#phy-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3915  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3916  				status = "disabled";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3917  			};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3918  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3919  			mdss_dsi1: dsi@ae96000 {
c64c1c245f667e Neil Armstrong        2023-02-07  3920  				compatible = "qcom,sm8550-dsi-ctrl", "qcom,mdss-dsi-ctrl";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3921  				reg = <0 0x0ae96000 0 0x400>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3922  				reg-names = "dsi_ctrl";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3923  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3924  				interrupt-parent = <&mdss>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3925  				interrupts = <5>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3926  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3927  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3928  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3929  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3930  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3931  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3932  					 <&gcc GCC_DISP_HF_AXI_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3933  				clock-names = "byte",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3934  					      "byte_intf",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3935  					      "pixel",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3936  					      "core",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3937  					      "iface",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3938  					      "bus";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3939  
1d14bcffb49c9d Rohit Agarwal         2023-07-20  3940  				power-domains = <&rpmhpd RPMHPD_MMCX>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3941  
f03908b23f84ec Neil Armstrong        2023-03-08  3942  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
f03908b23f84ec Neil Armstrong        2023-03-08  3943  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  3944  				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  3945  							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3946  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3947  				operating-points-v2 = <&mdss_dsi_opp_table>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3948  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3949  				phys = <&mdss_dsi1_phy>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3950  				phy-names = "dsi";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3951  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3952  				#address-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3953  				#size-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3954  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3955  				status = "disabled";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3956  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3957  				ports {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3958  					#address-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3959  					#size-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3960  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3961  					port@0 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3962  						reg = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3963  						mdss_dsi1_in: endpoint {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3964  							remote-endpoint = <&dpu_intf2_out>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3965  						};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3966  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3967  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3968  					port@1 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3969  						reg = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3970  						mdss_dsi1_out: endpoint {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3971  						};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3972  					};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3973  				};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3974  			};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3975  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3976  			mdss_dsi1_phy: phy@ae97000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3977  				compatible = "qcom,sm8550-dsi-phy-4nm";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3978  				reg = <0 0x0ae97000 0 0x200>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3979  				      <0 0x0ae97200 0 0x280>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3980  				      <0 0x0ae97500 0 0x400>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3981  				reg-names = "dsi_phy",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3982  					    "dsi_phy_lane",
d7da51db5b81a0 Neil Armstrong        2023-01-18  3983  					    "dsi_pll";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3984  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3985  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  3986  					 <&rpmhcc RPMH_CXO_CLK>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3987  				clock-names = "iface", "ref";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3988  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3989  				#clock-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3990  				#phy-cells = <0>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3991  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3992  				status = "disabled";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3993  			};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3994  		};
d7da51db5b81a0 Neil Armstrong        2023-01-18  3995  
d7da51db5b81a0 Neil Armstrong        2023-01-18  3996  		dispcc: clock-controller@af00000 {
d7da51db5b81a0 Neil Armstrong        2023-01-18  3997  			compatible = "qcom,sm8550-dispcc";
d7da51db5b81a0 Neil Armstrong        2023-01-18  3998  			reg = <0 0x0af00000 0 0x20000>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  3999  			clocks = <&bi_tcxo_div2>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  4000  				 <&bi_tcxo_ao_div2>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  4001  				 <&gcc GCC_DISP_AHB_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  4002  				 <&sleep_clk>,
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  4003  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  4004  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  4005  				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
0d046b7ad7d3c7 Krzysztof Kozlowski   2025-04-08  4006  				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  4007  				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
66adfbc4d33993 Neil Armstrong        2023-06-13  4008  				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  4009  				 <0>, /* dp1 */
d7da51db5b81a0 Neil Armstrong        2023-01-18  4010  				 <0>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  4011  				 <0>, /* dp2 */
d7da51db5b81a0 Neil Armstrong        2023-01-18  4012  				 <0>,
d7da51db5b81a0 Neil Armstrong        2023-01-18  4013  				 <0>, /* dp3 */
d7da51db5b81a0 Neil Armstrong        2023-01-18  4014  				 <0>;
1d14bcffb49c9d Rohit Agarwal         2023-07-20  4015  			power-domains = <&rpmhpd RPMHPD_MMCX>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  4016  			required-opps = <&rpmhpd_opp_low_svs>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  4017  			#clock-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  4018  			#reset-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  4019  			#power-domain-cells = <1>;
d7da51db5b81a0 Neil Armstrong        2023-01-18  4020  		};
d7da51db5b81a0 Neil Armstrong        2023-01-18  4021  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4022  		usb_1_hsphy: phy@88e3000 {
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4023  			compatible = "qcom,sm8550-snps-eusb2-phy";
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4024  			reg = <0x0 0x088e3000 0x0 0x154>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4025  			#phy-cells = <0>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4026  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4027  			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4028  			clock-names = "ref";
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4029  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4030  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4031  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4032  			status = "disabled";
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4033  		};
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4034  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4035  		usb_dp_qmpphy: phy@88e8000 {
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4036  			compatible = "qcom,sm8550-qmp-usb3-dp-phy";
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4037  			reg = <0x0 0x088e8000 0x0 0x3000>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4038  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4039  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4040  				 <&rpmhcc RPMH_CXO_CLK>,
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4041  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4042  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4043  			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4044  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4045  			power-domains = <&gcc USB3_PHY_GDSC>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4046  
cd649ac4059bd7 Johan Hovold          2023-01-23  4047  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
cd649ac4059bd7 Johan Hovold          2023-01-23  4048  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4049  			reset-names = "phy", "common";
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4050  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4051  			#clock-cells = <1>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4052  			#phy-cells = <1>;
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4053  
d02c0027ea20f6 Dmitry Baryshkov      2024-04-29  4054  			orientation-switch;
d02c0027ea20f6 Dmitry Baryshkov      2024-04-29  4055  
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4056  			status = "disabled";
243f1a6d3df947 Neil Armstrong        2023-06-19  4057  
243f1a6d3df947 Neil Armstrong        2023-06-19  4058  			ports {
243f1a6d3df947 Neil Armstrong        2023-06-19  4059  				#address-cells = <1>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4060  				#size-cells = <0>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4061  
243f1a6d3df947 Neil Armstrong        2023-06-19  4062  				port@0 {
243f1a6d3df947 Neil Armstrong        2023-06-19  4063  					reg = <0>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4064  
243f1a6d3df947 Neil Armstrong        2023-06-19  4065  					usb_dp_qmpphy_out: endpoint {
243f1a6d3df947 Neil Armstrong        2023-06-19  4066  					};
243f1a6d3df947 Neil Armstrong        2023-06-19  4067  				};
243f1a6d3df947 Neil Armstrong        2023-06-19  4068  
243f1a6d3df947 Neil Armstrong        2023-06-19  4069  				port@1 {
243f1a6d3df947 Neil Armstrong        2023-06-19  4070  					reg = <1>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4071  
243f1a6d3df947 Neil Armstrong        2023-06-19  4072  					usb_dp_qmpphy_usb_ss_in: endpoint {
2f212acedbbfe7 Dmitry Baryshkov      2024-04-29  4073  						remote-endpoint = <&usb_1_dwc3_ss>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4074  					};
243f1a6d3df947 Neil Armstrong        2023-06-19  4075  				};
243f1a6d3df947 Neil Armstrong        2023-06-19  4076  
243f1a6d3df947 Neil Armstrong        2023-06-19  4077  				port@2 {
243f1a6d3df947 Neil Armstrong        2023-06-19  4078  					reg = <2>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4079  
243f1a6d3df947 Neil Armstrong        2023-06-19  4080  					usb_dp_qmpphy_dp_in: endpoint {
2f212acedbbfe7 Dmitry Baryshkov      2024-04-29  4081  						remote-endpoint = <&mdss_dp0_out>;
243f1a6d3df947 Neil Armstrong        2023-06-19  4082  					};
243f1a6d3df947 Neil Armstrong        2023-06-19  4083  				};
243f1a6d3df947 Neil Armstrong        2023-06-19  4084  			};
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4085  		};
7f7e5c1b037fc3 Abel Vesa             2023-01-19  4086  
d6fdac499f939a Neil Armstrong        2025-07-29 @4087  		usb_1: usb@a600000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
