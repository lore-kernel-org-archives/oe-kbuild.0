Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54E2E3388
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742036318; cv=none; b=Xvbl1XdWI7g8E3GyZHPXekiHShQLoHC3vDtk/dJS1mrxRz7RaGB6R9Kyk8vFp3hmjSwspHXMD1V3m3H/7ClPSe9IJZmoDdLaKSs+Kq5V18qpM8zW4wpuZhHoredGbnFPj3gbL9XUrAz2EcT1d2IiD32yWJNaY67exBVWc/MSiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742036318; c=relaxed/simple;
	bh=dj2qe5lPkZ6UttY8sVIbb/hGGq51v5l69/uBVbK9iF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fL4Yr2VJkS02gSPXIRFGY0cAmZujVUvbgGdcb8y73HqpX4+DcbgMqsCSP8wJeT+MuNOPh9jCqJ7UgCJ3Lv3QhOPfdFl8U3A8AofgqYRfl6nh93ZToIBdzeYF9ZzXIKNZQjweKm97QGFwp5dVv4uhFWG0xfeRgNm4cGdwfaPkCcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOaJIEvg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOaJIEvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742036304; x=1773572304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dj2qe5lPkZ6UttY8sVIbb/hGGq51v5l69/uBVbK9iF4=;
  b=hOaJIEvgC/089uZK72iA34NSbq/HQifRizvTMPvbkSz8s2kLxp15V/Tc
   WG94Io6V2SCv1LT8HWOgYd689BGPypT8RP/YmXgxvJ/aJm75+7B1bCzqj
   Ldnts9xKA0CE+crlspBON3n7TbpIcM+21Od0P5YUaLOVf9jBF9UmSVLcq
   cWFSPMVLK6o/CKTcV9YENjleeqBx3WZmAsKMYckB6MtuyNrZ7swRzkc07
   xFoMSMX3OFdm+iKI64GvXonIJkBbh1MwSqJ/7wlYYQWdj/+5ihzq1ClMp
   5czlZgYnu/1yuVNs3qUwjPK3VpZ2q1NL6t1CejU8XCIUkdN8PPPqqLXfM
   w==;
X-CSE-ConnectionGUID: cStQU6vxT5G6imh3J9GOZg==
X-CSE-MsgGUID: 6EwNUbJpQO+lZ/HHUP1xKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60585516"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="60585516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 03:58:23 -0700
X-CSE-ConnectionGUID: emn3TzGeQ2yDZUxS0fd5dg==
X-CSE-MsgGUID: /47jUO1zQqO8VtYZPEzymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121550363"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2025 03:58:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPDf-000BI5-0w;
	Sat, 15 Mar 2025 10:58:19 +0000
Date: Sat, 15 Mar 2025 18:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Message-ID: <202503151845.utolDNLi-lkp@intel.com>
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
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Todor Tomov <todor.too@gmail.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-clock-qcom-x1e80100-camcc-Fix-the-list-of-required-opps/20250314-211659
base:   9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
patch link:    https://lore.kernel.org/r/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122%40linaro.org
patch subject: [PATCH v6 5/5] arm64: dts: qcom: x1e80100: Add CAMSS block definition
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151845.utolDNLi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151845.utolDNLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503151845.utolDNLi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5198.22-5381.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4825.11-4835.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/acb7000 +5198 arch/arm64/boot/dts/qcom/x1e80100.dtsi

af16b00578a7a1d Rajendra Nayak      2023-12-05    25  
af16b00578a7a1d Rajendra Nayak      2023-12-05    26  / {
af16b00578a7a1d Rajendra Nayak      2023-12-05    27  	interrupt-parent = <&intc>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    28  
af16b00578a7a1d Rajendra Nayak      2023-12-05    29  	#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    30  	#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    31  
af16b00578a7a1d Rajendra Nayak      2023-12-05    32  	chosen { };
af16b00578a7a1d Rajendra Nayak      2023-12-05    33  
af16b00578a7a1d Rajendra Nayak      2023-12-05    34  	clocks {
af16b00578a7a1d Rajendra Nayak      2023-12-05    35  		xo_board: xo-board {
af16b00578a7a1d Rajendra Nayak      2023-12-05    36  			compatible = "fixed-clock";
af16b00578a7a1d Rajendra Nayak      2023-12-05    37  			clock-frequency = <76800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    38  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    39  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    40  
af16b00578a7a1d Rajendra Nayak      2023-12-05    41  		sleep_clk: sleep-clk {
af16b00578a7a1d Rajendra Nayak      2023-12-05    42  			compatible = "fixed-clock";
67e25a3e12d1283 Dmitry Baryshkov    2024-12-24    43  			clock-frequency = <32764>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    44  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    45  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    46  
af16b00578a7a1d Rajendra Nayak      2023-12-05    47  		bi_tcxo_div2: bi-tcxo-div2-clk {
af16b00578a7a1d Rajendra Nayak      2023-12-05    48  			compatible = "fixed-factor-clock";
af16b00578a7a1d Rajendra Nayak      2023-12-05    49  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    50  
af16b00578a7a1d Rajendra Nayak      2023-12-05    51  			clocks = <&rpmhcc RPMH_CXO_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    52  			clock-mult = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    53  			clock-div = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    54  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    55  
af16b00578a7a1d Rajendra Nayak      2023-12-05    56  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
af16b00578a7a1d Rajendra Nayak      2023-12-05    57  			compatible = "fixed-factor-clock";
af16b00578a7a1d Rajendra Nayak      2023-12-05    58  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    59  
af16b00578a7a1d Rajendra Nayak      2023-12-05    60  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    61  			clock-mult = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    62  			clock-div = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    63  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    64  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05    65  
af16b00578a7a1d Rajendra Nayak      2023-12-05    66  	cpus {
af16b00578a7a1d Rajendra Nayak      2023-12-05    67  		#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    68  		#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    69  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    70  		cpu0: cpu@0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05    71  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05    72  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05    73  			reg = <0x0 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    74  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    75  			next-level-cache = <&l2_0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    76  			power-domains = <&cpu_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    77  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    78  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    79  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    80  			l2_0: l2-cache {
af16b00578a7a1d Rajendra Nayak      2023-12-05    81  				compatible = "cache";
af16b00578a7a1d Rajendra Nayak      2023-12-05    82  				cache-level = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    83  				cache-unified;
af16b00578a7a1d Rajendra Nayak      2023-12-05    84  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05    85  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    86  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    87  		cpu1: cpu@100 {
af16b00578a7a1d Rajendra Nayak      2023-12-05    88  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05    89  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05    90  			reg = <0x0 0x100>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    91  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    92  			next-level-cache = <&l2_0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    93  			power-domains = <&cpu_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    94  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    95  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    96  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    97  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    98  		cpu2: cpu@200 {
af16b00578a7a1d Rajendra Nayak      2023-12-05    99  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   100  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   101  			reg = <0x0 0x200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   102  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   103  			next-level-cache = <&l2_0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   104  			power-domains = <&cpu_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   105  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   106  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   107  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   108  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   109  		cpu3: cpu@300 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   110  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   111  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   112  			reg = <0x0 0x300>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   113  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   114  			next-level-cache = <&l2_0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   115  			power-domains = <&cpu_pd3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   116  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   117  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   118  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   119  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   120  		cpu4: cpu@10000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   121  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   122  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   123  			reg = <0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   124  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   125  			next-level-cache = <&l2_1>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   126  			power-domains = <&cpu_pd4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   127  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   128  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   129  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   130  			l2_1: l2-cache {
af16b00578a7a1d Rajendra Nayak      2023-12-05   131  				compatible = "cache";
af16b00578a7a1d Rajendra Nayak      2023-12-05   132  				cache-level = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   133  				cache-unified;
af16b00578a7a1d Rajendra Nayak      2023-12-05   134  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   135  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   136  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   137  		cpu5: cpu@10100 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   138  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   139  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   140  			reg = <0x0 0x10100>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   141  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   142  			next-level-cache = <&l2_1>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   143  			power-domains = <&cpu_pd5>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   144  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   145  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   146  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   147  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   148  		cpu6: cpu@10200 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   149  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   150  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   151  			reg = <0x0 0x10200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   152  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   153  			next-level-cache = <&l2_1>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   154  			power-domains = <&cpu_pd6>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   155  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   156  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   157  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   158  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   159  		cpu7: cpu@10300 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   160  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   161  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   162  			reg = <0x0 0x10300>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   163  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   164  			next-level-cache = <&l2_1>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   165  			power-domains = <&cpu_pd7>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   166  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   167  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   168  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   169  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   170  		cpu8: cpu@20000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   171  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   172  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   173  			reg = <0x0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   174  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   175  			next-level-cache = <&l2_2>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   176  			power-domains = <&cpu_pd8>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   177  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   178  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   179  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   180  			l2_2: l2-cache {
af16b00578a7a1d Rajendra Nayak      2023-12-05   181  				compatible = "cache";
af16b00578a7a1d Rajendra Nayak      2023-12-05   182  				cache-level = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   183  				cache-unified;
af16b00578a7a1d Rajendra Nayak      2023-12-05   184  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   185  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   186  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   187  		cpu9: cpu@20100 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   188  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   189  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   190  			reg = <0x0 0x20100>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   191  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   192  			next-level-cache = <&l2_2>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   193  			power-domains = <&cpu_pd9>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   194  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   195  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   196  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   197  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   198  		cpu10: cpu@20200 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   199  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   200  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   201  			reg = <0x0 0x20200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   202  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   203  			next-level-cache = <&l2_2>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   204  			power-domains = <&cpu_pd10>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   205  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   206  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   207  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   208  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   209  		cpu11: cpu@20300 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   210  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   211  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   212  			reg = <0x0 0x20300>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   213  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   214  			next-level-cache = <&l2_2>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   215  			power-domains = <&cpu_pd11>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   216  			power-domain-names = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   217  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   218  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   219  
af16b00578a7a1d Rajendra Nayak      2023-12-05   220  		cpu-map {
af16b00578a7a1d Rajendra Nayak      2023-12-05   221  			cluster0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   222  				core0 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   223  					cpu = <&cpu0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   224  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   225  
af16b00578a7a1d Rajendra Nayak      2023-12-05   226  				core1 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   227  					cpu = <&cpu1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   228  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   229  
af16b00578a7a1d Rajendra Nayak      2023-12-05   230  				core2 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   231  					cpu = <&cpu2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   232  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   233  
af16b00578a7a1d Rajendra Nayak      2023-12-05   234  				core3 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   235  					cpu = <&cpu3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   236  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   237  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   238  
af16b00578a7a1d Rajendra Nayak      2023-12-05   239  			cluster1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   240  				core0 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   241  					cpu = <&cpu4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   242  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   243  
af16b00578a7a1d Rajendra Nayak      2023-12-05   244  				core1 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   245  					cpu = <&cpu5>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   246  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   247  
af16b00578a7a1d Rajendra Nayak      2023-12-05   248  				core2 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   249  					cpu = <&cpu6>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   250  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   251  
af16b00578a7a1d Rajendra Nayak      2023-12-05   252  				core3 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   253  					cpu = <&cpu7>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   254  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   255  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   256  
f08edb5299166b7 Konrad Dybcio       2025-02-03   257  			cpu_map_cluster2: cluster2 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   258  				core0 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   259  					cpu = <&cpu8>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   260  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   261  
af16b00578a7a1d Rajendra Nayak      2023-12-05   262  				core1 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   263  					cpu = <&cpu9>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   264  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   265  
af16b00578a7a1d Rajendra Nayak      2023-12-05   266  				core2 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   267  					cpu = <&cpu10>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   268  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   269  
af16b00578a7a1d Rajendra Nayak      2023-12-05   270  				core3 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   271  					cpu = <&cpu11>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   272  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   273  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   274  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   275  
af16b00578a7a1d Rajendra Nayak      2023-12-05   276  		idle-states {
af16b00578a7a1d Rajendra Nayak      2023-12-05   277  			entry-method = "psci";
af16b00578a7a1d Rajendra Nayak      2023-12-05   278  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   279  			cluster_c4: cpu-sleep-0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   280  				compatible = "arm,idle-state";
af16b00578a7a1d Rajendra Nayak      2023-12-05   281  				idle-state-name = "ret";
af16b00578a7a1d Rajendra Nayak      2023-12-05   282  				arm,psci-suspend-param = <0x00000004>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   283  				entry-latency-us = <180>;
2e65616ef07fa4c Konrad Dybcio       2024-07-16   284  				exit-latency-us = <500>;
2e65616ef07fa4c Konrad Dybcio       2024-07-16   285  				min-residency-us = <600>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   286  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   287  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   288  
af16b00578a7a1d Rajendra Nayak      2023-12-05   289  		domain-idle-states {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   290  			cluster_cl4: cluster-sleep-0 {
cb939b9b3542685 Rajendra Nayak      2024-03-17   291  				compatible = "domain-idle-state";
af16b00578a7a1d Rajendra Nayak      2023-12-05   292  				arm,psci-suspend-param = <0x01000044>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   293  				entry-latency-us = <350>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   294  				exit-latency-us = <500>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   295  				min-residency-us = <2500>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   296  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   297  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   298  			cluster_cl5: cluster-sleep-1 {
cb939b9b3542685 Rajendra Nayak      2024-03-17   299  				compatible = "domain-idle-state";
af16b00578a7a1d Rajendra Nayak      2023-12-05   300  				arm,psci-suspend-param = <0x01000054>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   301  				entry-latency-us = <2200>;
2e65616ef07fa4c Konrad Dybcio       2024-07-16   302  				exit-latency-us = <4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   303  				min-residency-us = <7000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   304  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   305  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   306  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   307  
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   308  	dummy-sink {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   309  		compatible = "arm,coresight-dummy-sink";
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   310  
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   311  		in-ports {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   312  			port {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   313  				eud_in: endpoint {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   314  					remote-endpoint = <&swao_rep_out1>;
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   315  				};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   316  			};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   317  		};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   318  	};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   319  
af16b00578a7a1d Rajendra Nayak      2023-12-05   320  	firmware {
af16b00578a7a1d Rajendra Nayak      2023-12-05   321  		scm: scm {
af16b00578a7a1d Rajendra Nayak      2023-12-05   322  			compatible = "qcom,scm-x1e80100", "qcom,scm";
af16b00578a7a1d Rajendra Nayak      2023-12-05   323  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   324  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
8beaf6e08d986eb Johan Hovold        2024-10-02   325  			qcom,dload-mode = <&tcsr 0x19000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   326  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   327  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   328  
af16b00578a7a1d Rajendra Nayak      2023-12-05   329  	clk_virt: interconnect-0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   330  		compatible = "qcom,x1e80100-clk-virt";
af16b00578a7a1d Rajendra Nayak      2023-12-05   331  		#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   332  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   333  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   334  
af16b00578a7a1d Rajendra Nayak      2023-12-05   335  	mc_virt: interconnect-1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   336  		compatible = "qcom,x1e80100-mc-virt";
af16b00578a7a1d Rajendra Nayak      2023-12-05   337  		#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   338  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   339  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   340  
af16b00578a7a1d Rajendra Nayak      2023-12-05   341  	memory@80000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   342  		device_type = "memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   343  		/* We expect the bootloader to fill in the size */
af16b00578a7a1d Rajendra Nayak      2023-12-05   344  		reg = <0 0x80000000 0 0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   345  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   346  
af16b00578a7a1d Rajendra Nayak      2023-12-05   347  	pmu {
af16b00578a7a1d Rajendra Nayak      2023-12-05   348  		compatible = "arm,armv8-pmuv3";
af16b00578a7a1d Rajendra Nayak      2023-12-05   349  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   350  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   351  
af16b00578a7a1d Rajendra Nayak      2023-12-05   352  	psci {
af16b00578a7a1d Rajendra Nayak      2023-12-05   353  		compatible = "arm,psci-1.0";
af16b00578a7a1d Rajendra Nayak      2023-12-05   354  		method = "smc";
af16b00578a7a1d Rajendra Nayak      2023-12-05   355  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   356  		cpu_pd0: power-domain-cpu0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   357  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   358  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   359  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   360  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   361  		cpu_pd1: power-domain-cpu1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   362  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   363  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   364  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   365  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   366  		cpu_pd2: power-domain-cpu2 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   367  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   368  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   369  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   370  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   371  		cpu_pd3: power-domain-cpu3 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   372  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   373  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   374  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   375  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   376  		cpu_pd4: power-domain-cpu4 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   377  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   378  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   379  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   380  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   381  		cpu_pd5: power-domain-cpu5 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   382  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   383  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   384  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   385  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   386  		cpu_pd6: power-domain-cpu6 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   387  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   388  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   389  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   390  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   391  		cpu_pd7: power-domain-cpu7 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   392  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   393  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   394  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   395  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   396  		cpu_pd8: power-domain-cpu8 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   397  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   398  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   399  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   400  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   401  		cpu_pd9: power-domain-cpu9 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   402  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   403  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   404  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   405  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   406  		cpu_pd10: power-domain-cpu10 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   407  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   408  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   409  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   410  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   411  		cpu_pd11: power-domain-cpu11 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   412  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   413  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   414  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   415  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   416  		cluster_pd0: power-domain-cpu-cluster0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   417  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   418  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   419  			power-domains = <&system_pd>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   420  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   421  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   422  		cluster_pd1: power-domain-cpu-cluster1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   423  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   424  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   425  			power-domains = <&system_pd>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   426  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   427  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   428  		cluster_pd2: power-domain-cpu-cluster2 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   429  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   430  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   431  			power-domains = <&system_pd>;
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   432  		};
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   433  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   434  		system_pd: power-domain-system {
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   435  			#power-domain-cells = <0>;
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   436  			/* TODO: system-wide idle states */
af16b00578a7a1d Rajendra Nayak      2023-12-05   437  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   438  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   439  
af16b00578a7a1d Rajendra Nayak      2023-12-05   440  	reserved-memory {
af16b00578a7a1d Rajendra Nayak      2023-12-05   441  		#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   442  		#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   443  		ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05   444  
af16b00578a7a1d Rajendra Nayak      2023-12-05   445  		gunyah_hyp_mem: gunyah-hyp@80000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   446  			reg = <0x0 0x80000000 0x0 0x800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   447  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   448  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   449  
af16b00578a7a1d Rajendra Nayak      2023-12-05   450  		hyp_elf_package_mem: hyp-elf-package@80800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   451  			reg = <0x0 0x80800000 0x0 0x200000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   452  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   453  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   454  
af16b00578a7a1d Rajendra Nayak      2023-12-05   455  		ncc_mem: ncc@80a00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   456  			reg = <0x0 0x80a00000 0x0 0x400000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   457  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   458  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   459  
af16b00578a7a1d Rajendra Nayak      2023-12-05   460  		cpucp_log_mem: cpucp-log@80e00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   461  			reg = <0x0 0x80e00000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   462  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   463  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   464  
af16b00578a7a1d Rajendra Nayak      2023-12-05   465  		cpucp_mem: cpucp@80e40000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   466  			reg = <0x0 0x80e40000 0x0 0x540000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   467  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   468  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   469  
af16b00578a7a1d Rajendra Nayak      2023-12-05   470  		reserved-region@81380000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   471  			reg = <0x0 0x81380000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   472  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   473  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   474  
af16b00578a7a1d Rajendra Nayak      2023-12-05   475  		tags_mem: tags-region@81400000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   476  			reg = <0x0 0x81400000 0x0 0x1a0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   477  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   478  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   479  
af16b00578a7a1d Rajendra Nayak      2023-12-05   480  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   481  			reg = <0x0 0x81a00000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   482  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   483  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   484  
af16b00578a7a1d Rajendra Nayak      2023-12-05   485  		xbl_ramdump_mem: xbl-ramdump@81a40000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   486  			reg = <0x0 0x81a40000 0x0 0x1c0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   487  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   488  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   489  
af16b00578a7a1d Rajendra Nayak      2023-12-05   490  		aop_image_mem: aop-image@81c00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   491  			reg = <0x0 0x81c00000 0x0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   492  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   493  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   494  
af16b00578a7a1d Rajendra Nayak      2023-12-05   495  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   496  			compatible = "qcom,cmd-db";
af16b00578a7a1d Rajendra Nayak      2023-12-05   497  			reg = <0x0 0x81c60000 0x0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   498  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   499  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   500  
af16b00578a7a1d Rajendra Nayak      2023-12-05   501  		aop_config_mem: aop-config@81c80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   502  			reg = <0x0 0x81c80000 0x0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   503  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   504  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   505  
af16b00578a7a1d Rajendra Nayak      2023-12-05   506  		tme_crash_dump_mem: tme-crash-dump@81ca0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   507  			reg = <0x0 0x81ca0000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   508  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   509  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   510  
af16b00578a7a1d Rajendra Nayak      2023-12-05   511  		tme_log_mem: tme-log@81ce0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   512  			reg = <0x0 0x81ce0000 0x0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   513  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   514  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   515  
af16b00578a7a1d Rajendra Nayak      2023-12-05   516  		uefi_log_mem: uefi-log@81ce4000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   517  			reg = <0x0 0x81ce4000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   518  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   519  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   520  
af16b00578a7a1d Rajendra Nayak      2023-12-05   521  		secdata_apss_mem: secdata-apss@81cff000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   522  			reg = <0x0 0x81cff000 0x0 0x1000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   523  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   524  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   525  
af16b00578a7a1d Rajendra Nayak      2023-12-05   526  		pdp_ns_shared_mem: pdp-ns-shared@81e00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   527  			reg = <0x0 0x81e00000 0x0 0x100000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   528  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   529  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   530  
af16b00578a7a1d Rajendra Nayak      2023-12-05   531  		gpu_prr_mem: gpu-prr@81f00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   532  			reg = <0x0 0x81f00000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   533  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   534  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   535  
af16b00578a7a1d Rajendra Nayak      2023-12-05   536  		tpm_control_mem: tpm-control@81f10000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   537  			reg = <0x0 0x81f10000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   538  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   539  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   540  
af16b00578a7a1d Rajendra Nayak      2023-12-05   541  		usb_ucsi_shared_mem: usb-ucsi-shared@81f20000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   542  			reg = <0x0 0x81f20000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   543  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   544  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   545  
af16b00578a7a1d Rajendra Nayak      2023-12-05   546  		pld_pep_mem: pld-pep@81f30000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   547  			reg = <0x0 0x81f30000 0x0 0x6000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   548  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   549  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   550  
af16b00578a7a1d Rajendra Nayak      2023-12-05   551  		pld_gmu_mem: pld-gmu@81f36000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   552  			reg = <0x0 0x81f36000 0x0 0x1000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   553  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   554  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   555  
af16b00578a7a1d Rajendra Nayak      2023-12-05   556  		pld_pdp_mem: pld-pdp@81f37000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   557  			reg = <0x0 0x81f37000 0x0 0x1000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   558  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   559  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   560  
af16b00578a7a1d Rajendra Nayak      2023-12-05   561  		tz_stat_mem: tz-stat@82700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   562  			reg = <0x0 0x82700000 0x0 0x100000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   563  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   564  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   565  
af16b00578a7a1d Rajendra Nayak      2023-12-05   566  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   567  			reg = <0x0 0x82800000 0x0 0xc00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   568  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   569  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   570  
af16b00578a7a1d Rajendra Nayak      2023-12-05   571  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@84b00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   572  			reg = <0x0 0x84b00000 0x0 0x800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   573  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   574  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   575  
af16b00578a7a1d Rajendra Nayak      2023-12-05   576  		spu_secure_shared_memory_mem: spu-secure-shared-memory@85300000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   577  			reg = <0x0 0x85300000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   578  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   579  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   580  
af16b00578a7a1d Rajendra Nayak      2023-12-05   581  		adsp_boot_dtb_mem: adsp-boot-dtb@866c0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   582  			reg = <0x0 0x866c0000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   583  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   584  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   585  
af16b00578a7a1d Rajendra Nayak      2023-12-05   586  		spss_region_mem: spss-region@86700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   587  			reg = <0x0 0x86700000 0x0 0x400000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   588  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   589  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   590  
af16b00578a7a1d Rajendra Nayak      2023-12-05   591  		adsp_boot_mem: adsp-boot@86b00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   592  			reg = <0x0 0x86b00000 0x0 0xc00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   593  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   594  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   595  
af16b00578a7a1d Rajendra Nayak      2023-12-05   596  		video_mem: video@87700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   597  			reg = <0x0 0x87700000 0x0 0x700000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   598  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   599  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   600  
af16b00578a7a1d Rajendra Nayak      2023-12-05   601  		adspslpi_mem: adspslpi@87e00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   602  			reg = <0x0 0x87e00000 0x0 0x3a00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   603  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   604  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   605  
af16b00578a7a1d Rajendra Nayak      2023-12-05   606  		q6_adsp_dtb_mem: q6-adsp-dtb@8b800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   607  			reg = <0x0 0x8b800000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   608  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   609  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   610  
af16b00578a7a1d Rajendra Nayak      2023-12-05   611  		cdsp_mem: cdsp@8b900000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   612  			reg = <0x0 0x8b900000 0x0 0x2000000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   613  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   614  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   615  
af16b00578a7a1d Rajendra Nayak      2023-12-05   616  		q6_cdsp_dtb_mem: q6-cdsp-dtb@8d900000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   617  			reg = <0x0 0x8d900000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   618  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   619  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   620  
af16b00578a7a1d Rajendra Nayak      2023-12-05   621  		gpu_microcode_mem: gpu-microcode@8d9fe000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   622  			reg = <0x0 0x8d9fe000 0x0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   623  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   624  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   625  
af16b00578a7a1d Rajendra Nayak      2023-12-05   626  		cvp_mem: cvp@8da00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   627  			reg = <0x0 0x8da00000 0x0 0x700000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   628  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   629  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   630  
af16b00578a7a1d Rajendra Nayak      2023-12-05   631  		camera_mem: camera@8e100000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   632  			reg = <0x0 0x8e100000 0x0 0x800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   633  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   634  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   635  
af16b00578a7a1d Rajendra Nayak      2023-12-05   636  		av1_encoder_mem: av1-encoder@8e900000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   637  			reg = <0x0 0x8e900000 0x0 0x700000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   638  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   639  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   640  
af16b00578a7a1d Rajendra Nayak      2023-12-05   641  		reserved-region@8f000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   642  			reg = <0x0 0x8f000000 0x0 0xa00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   643  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   644  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   645  
af16b00578a7a1d Rajendra Nayak      2023-12-05   646  		wpss_mem: wpss@8fa00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   647  			reg = <0x0 0x8fa00000 0x0 0x1900000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   648  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   649  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   650  
af16b00578a7a1d Rajendra Nayak      2023-12-05   651  		q6_wpss_dtb_mem: q6-wpss-dtb@91300000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   652  			reg = <0x0 0x91300000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   653  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   654  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   655  
af16b00578a7a1d Rajendra Nayak      2023-12-05   656  		xbl_sc_mem: xbl-sc@d8000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   657  			reg = <0x0 0xd8000000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   658  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   659  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   660  
af16b00578a7a1d Rajendra Nayak      2023-12-05   661  		reserved-region@d8040000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   662  			reg = <0x0 0xd8040000 0x0 0xa0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   663  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   664  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   665  
af16b00578a7a1d Rajendra Nayak      2023-12-05   666  		qtee_mem: qtee@d80e0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   667  			reg = <0x0 0xd80e0000 0x0 0x520000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   668  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   669  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   670  
af16b00578a7a1d Rajendra Nayak      2023-12-05   671  		ta_mem: ta@d8600000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   672  			reg = <0x0 0xd8600000 0x0 0x8a00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   673  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   674  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   675  
af16b00578a7a1d Rajendra Nayak      2023-12-05   676  		tags_mem1: tags@e1000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   677  			reg = <0x0 0xe1000000 0x0 0x26a0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   678  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   679  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   680  
af16b00578a7a1d Rajendra Nayak      2023-12-05   681  		llcc_lpi_mem: llcc-lpi@ff800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   682  			reg = <0x0 0xff800000 0x0 0x600000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   683  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   684  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   685  
af16b00578a7a1d Rajendra Nayak      2023-12-05   686  		smem_mem: smem@ffe00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   687  			compatible = "qcom,smem";
af16b00578a7a1d Rajendra Nayak      2023-12-05   688  			reg = <0x0 0xffe00000 0x0 0x200000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   689  			hwlocks = <&tcsr_mutex 3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   690  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   691  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   692  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   693  
c8327bb53b87285 Stephan Gerhold     2024-10-07   694  	qup_opp_table_100mhz: opp-table-qup100mhz {
c8327bb53b87285 Stephan Gerhold     2024-10-07   695  		compatible = "operating-points-v2";
c8327bb53b87285 Stephan Gerhold     2024-10-07   696  
c8327bb53b87285 Stephan Gerhold     2024-10-07   697  		opp-75000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   698  			opp-hz = /bits/ 64 <75000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   699  			required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   700  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   701  
c8327bb53b87285 Stephan Gerhold     2024-10-07   702  		opp-100000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   703  			opp-hz = /bits/ 64 <100000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   704  			required-opps = <&rpmhpd_opp_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   705  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   706  	};
c8327bb53b87285 Stephan Gerhold     2024-10-07   707  
c8327bb53b87285 Stephan Gerhold     2024-10-07   708  	qup_opp_table_120mhz: opp-table-qup120mhz {
c8327bb53b87285 Stephan Gerhold     2024-10-07   709  		compatible = "operating-points-v2";
c8327bb53b87285 Stephan Gerhold     2024-10-07   710  
c8327bb53b87285 Stephan Gerhold     2024-10-07   711  		opp-75000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   712  			opp-hz = /bits/ 64 <75000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   713  			required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   714  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   715  
c8327bb53b87285 Stephan Gerhold     2024-10-07   716  		opp-120000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   717  			opp-hz = /bits/ 64 <120000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   718  			required-opps = <&rpmhpd_opp_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   719  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   720  	};
c8327bb53b87285 Stephan Gerhold     2024-10-07   721  
0b6ae7364b1133f Sibi Sankar         2024-01-29   722  	smp2p-adsp {
0b6ae7364b1133f Sibi Sankar         2024-01-29   723  		compatible = "qcom,smp2p";
0b6ae7364b1133f Sibi Sankar         2024-01-29   724  
0b6ae7364b1133f Sibi Sankar         2024-01-29   725  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133f Sibi Sankar         2024-01-29   726  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133f Sibi Sankar         2024-01-29   727  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   728  
0b6ae7364b1133f Sibi Sankar         2024-01-29   729  		mboxes = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133f Sibi Sankar         2024-01-29   730  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   731  
0b6ae7364b1133f Sibi Sankar         2024-01-29   732  		qcom,smem = <443>, <429>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   733  		qcom,local-pid = <0>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   734  		qcom,remote-pid = <2>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   735  
0b6ae7364b1133f Sibi Sankar         2024-01-29   736  		smp2p_adsp_out: master-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   737  			qcom,entry-name = "master-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   738  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   739  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   740  
0b6ae7364b1133f Sibi Sankar         2024-01-29   741  		smp2p_adsp_in: slave-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   742  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   743  			interrupt-controller;
0b6ae7364b1133f Sibi Sankar         2024-01-29   744  			#interrupt-cells = <2>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   745  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   746  	};
0b6ae7364b1133f Sibi Sankar         2024-01-29   747  
0b6ae7364b1133f Sibi Sankar         2024-01-29   748  	smp2p-cdsp {
0b6ae7364b1133f Sibi Sankar         2024-01-29   749  		compatible = "qcom,smp2p";
0b6ae7364b1133f Sibi Sankar         2024-01-29   750  
0b6ae7364b1133f Sibi Sankar         2024-01-29   751  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133f Sibi Sankar         2024-01-29   752  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133f Sibi Sankar         2024-01-29   753  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   754  
0b6ae7364b1133f Sibi Sankar         2024-01-29   755  		mboxes = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133f Sibi Sankar         2024-01-29   756  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   757  
0b6ae7364b1133f Sibi Sankar         2024-01-29   758  		qcom,smem = <94>, <432>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   759  		qcom,local-pid = <0>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   760  		qcom,remote-pid = <5>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   761  
0b6ae7364b1133f Sibi Sankar         2024-01-29   762  		smp2p_cdsp_out: master-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   763  			qcom,entry-name = "master-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   764  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   765  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   766  
0b6ae7364b1133f Sibi Sankar         2024-01-29   767  		smp2p_cdsp_in: slave-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   768  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   769  			interrupt-controller;
0b6ae7364b1133f Sibi Sankar         2024-01-29   770  			#interrupt-cells = <2>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   771  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   772  	};
0b6ae7364b1133f Sibi Sankar         2024-01-29   773  
af16b00578a7a1d Rajendra Nayak      2023-12-05   774  	soc: soc@0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   775  		compatible = "simple-bus";
af16b00578a7a1d Rajendra Nayak      2023-12-05   776  
af16b00578a7a1d Rajendra Nayak      2023-12-05   777  		#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   778  		#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   779  		dma-ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   780  		ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   781  
af16b00578a7a1d Rajendra Nayak      2023-12-05   782  		gcc: clock-controller@100000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   783  			compatible = "qcom,x1e80100-gcc";
af16b00578a7a1d Rajendra Nayak      2023-12-05   784  			reg = <0 0x00100000 0 0x200000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   785  
af16b00578a7a1d Rajendra Nayak      2023-12-05   786  			clocks = <&bi_tcxo_div2>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   787  				 <&sleep_clk>,
f8af195beeb0096 Qiang Yu            2024-11-04   788  				 <&pcie3_phy>,
5eb83fc10289db0 Abel Vesa           2024-01-29   789  				 <&pcie4_phy>,
62ab23e1550820e Johan Hovold        2024-07-22   790  				 <&pcie5_phy>,
5eb83fc10289db0 Abel Vesa           2024-01-29   791  				 <&pcie6a_phy>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   792  				 <0>,
4af46b7bd66fa3a Abel Vesa           2024-01-29   793  				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29   794  				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29   795  				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   796  
af16b00578a7a1d Rajendra Nayak      2023-12-05   797  			power-domains = <&rpmhpd RPMHPD_CX>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   798  			#clock-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   799  			#reset-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   800  			#power-domain-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   801  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   802  
6a07a4f3f509c37 Sibi Sankar         2024-01-29   803  		ipcc: mailbox@408000 {
6a07a4f3f509c37 Sibi Sankar         2024-01-29   804  			compatible = "qcom,x1e80100-ipcc", "qcom,ipcc";
6a07a4f3f509c37 Sibi Sankar         2024-01-29   805  			reg = <0 0x00408000 0 0x1000>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   806  
6a07a4f3f509c37 Sibi Sankar         2024-01-29   807  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   808  			interrupt-controller;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   809  			#interrupt-cells = <3>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   810  
6a07a4f3f509c37 Sibi Sankar         2024-01-29   811  			#mbox-cells = <2>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   812  		};
6a07a4f3f509c37 Sibi Sankar         2024-01-29   813  
af16b00578a7a1d Rajendra Nayak      2023-12-05   814  		gpi_dma2: dma-controller@800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   815  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1d Rajendra Nayak      2023-12-05   816  			reg = <0 0x00800000 0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   817  
af16b00578a7a1d Rajendra Nayak      2023-12-05   818  			interrupts = <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   819  				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   820  				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   821  				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   822  				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   823  				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   824  				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   825  				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   826  				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   827  				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   828  				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   829  				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   830  
af16b00578a7a1d Rajendra Nayak      2023-12-05   831  			dma-channels = <12>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   832  			dma-channel-mask = <0x3e>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   833  			#dma-cells = <3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   834  
af16b00578a7a1d Rajendra Nayak      2023-12-05   835  			iommus = <&apps_smmu 0x436 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   836  
af16b00578a7a1d Rajendra Nayak      2023-12-05   837  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   838  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   839  
af16b00578a7a1d Rajendra Nayak      2023-12-05   840  		qupv3_2: geniqup@8c0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   841  			compatible = "qcom,geni-se-qup";
af16b00578a7a1d Rajendra Nayak      2023-12-05   842  			reg = <0 0x008c0000 0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   843  
af16b00578a7a1d Rajendra Nayak      2023-12-05   844  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   845  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   846  			clock-names = "m-ahb",
af16b00578a7a1d Rajendra Nayak      2023-12-05   847  				      "s-ahb";
af16b00578a7a1d Rajendra Nayak      2023-12-05   848  
af16b00578a7a1d Rajendra Nayak      2023-12-05   849  			iommus = <&apps_smmu 0x423 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   850  
af16b00578a7a1d Rajendra Nayak      2023-12-05   851  			#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   852  			#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   853  			ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05   854  
af16b00578a7a1d Rajendra Nayak      2023-12-05   855  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   856  
af16b00578a7a1d Rajendra Nayak      2023-12-05   857  			i2c16: i2c@880000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   858  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05   859  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   860  
af16b00578a7a1d Rajendra Nayak      2023-12-05   861  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   862  
af16b00578a7a1d Rajendra Nayak      2023-12-05   863  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   864  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   865  
af16b00578a7a1d Rajendra Nayak      2023-12-05   866  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   867  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   868  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   869  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   870  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   871  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   872  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   873  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   874  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   875  
c8327bb53b87285 Stephan Gerhold     2024-10-07   876  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   877  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   878  
af16b00578a7a1d Rajendra Nayak      2023-12-05   879  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   880  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   881  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   882  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   883  
af16b00578a7a1d Rajendra Nayak      2023-12-05   884  				pinctrl-0 = <&qup_i2c16_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   885  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   886  
af16b00578a7a1d Rajendra Nayak      2023-12-05   887  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   888  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   889  
af16b00578a7a1d Rajendra Nayak      2023-12-05   890  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   891  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   892  
af16b00578a7a1d Rajendra Nayak      2023-12-05   893  			spi16: spi@880000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   894  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05   895  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   896  
af16b00578a7a1d Rajendra Nayak      2023-12-05   897  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   898  
af16b00578a7a1d Rajendra Nayak      2023-12-05   899  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   900  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   901  
af16b00578a7a1d Rajendra Nayak      2023-12-05   902  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   903  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   904  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   905  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   906  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   907  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   908  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   909  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   910  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   911  
c8327bb53b87285 Stephan Gerhold     2024-10-07   912  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   913  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   914  
af16b00578a7a1d Rajendra Nayak      2023-12-05   915  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   916  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   917  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   918  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   919  
af16b00578a7a1d Rajendra Nayak      2023-12-05   920  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   921  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   922  
af16b00578a7a1d Rajendra Nayak      2023-12-05   923  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   924  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   925  
af16b00578a7a1d Rajendra Nayak      2023-12-05   926  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   927  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   928  
af16b00578a7a1d Rajendra Nayak      2023-12-05   929  			i2c17: i2c@884000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   930  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05   931  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   932  
af16b00578a7a1d Rajendra Nayak      2023-12-05   933  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   934  
af16b00578a7a1d Rajendra Nayak      2023-12-05   935  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   936  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   937  
af16b00578a7a1d Rajendra Nayak      2023-12-05   938  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   939  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   940  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   941  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   942  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   943  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   944  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   945  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   946  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   947  
c8327bb53b87285 Stephan Gerhold     2024-10-07   948  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   949  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   950  
af16b00578a7a1d Rajendra Nayak      2023-12-05   951  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   952  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   953  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   954  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   955  
af16b00578a7a1d Rajendra Nayak      2023-12-05   956  				pinctrl-0 = <&qup_i2c17_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   957  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   958  
af16b00578a7a1d Rajendra Nayak      2023-12-05   959  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   960  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   961  
af16b00578a7a1d Rajendra Nayak      2023-12-05   962  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   963  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   964  
af16b00578a7a1d Rajendra Nayak      2023-12-05   965  			spi17: spi@884000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   966  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05   967  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   968  
af16b00578a7a1d Rajendra Nayak      2023-12-05   969  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   970  
af16b00578a7a1d Rajendra Nayak      2023-12-05   971  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   972  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   973  
af16b00578a7a1d Rajendra Nayak      2023-12-05   974  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   975  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   976  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   977  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   978  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   979  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   980  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   981  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   982  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   983  
c8327bb53b87285 Stephan Gerhold     2024-10-07   984  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   985  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   986  
af16b00578a7a1d Rajendra Nayak      2023-12-05   987  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   988  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   989  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   990  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   991  
af16b00578a7a1d Rajendra Nayak      2023-12-05   992  				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   993  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   994  
af16b00578a7a1d Rajendra Nayak      2023-12-05   995  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   996  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   997  
af16b00578a7a1d Rajendra Nayak      2023-12-05   998  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   999  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1000  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1001  			i2c18: i2c@888000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1002  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1003  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1004  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1005  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1006  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1007  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1008  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1009  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1010  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1011  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1012  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1013  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1014  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1015  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1016  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1017  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1018  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1019  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1020  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1021  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1022  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1023  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1024  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1025  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1026  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1027  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1028  				pinctrl-0 = <&qup_i2c18_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1029  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1030  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1031  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1032  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1033  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1034  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1035  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1036  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1037  			spi18: spi@888000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1038  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1039  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1040  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1041  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1042  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1043  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1044  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1045  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1046  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1047  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1048  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1049  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1050  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1051  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1052  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1053  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1054  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1055  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1056  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1057  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1058  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1059  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1060  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1061  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1062  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1063  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1064  				pinctrl-0 = <&qup_spi18_data_clk>, <&qup_spi18_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1065  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1066  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1067  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1068  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1069  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1070  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1071  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1072  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1073  			i2c19: i2c@88c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1074  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1075  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1076  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1077  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1078  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1079  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1080  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1081  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1082  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1083  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1084  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1085  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1086  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1087  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1088  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1089  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1090  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1091  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1092  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1093  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1094  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1095  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1096  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1097  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1098  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1099  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1100  				pinctrl-0 = <&qup_i2c19_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1101  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1102  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1103  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1104  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1105  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1106  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1107  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1108  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1109  			spi19: spi@88c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1110  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1111  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1112  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1113  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1114  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1115  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1116  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1117  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1118  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1119  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1120  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1121  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1122  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1123  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1124  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1125  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1126  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1127  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1128  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1129  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1130  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1131  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1132  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1133  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1134  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1135  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1136  				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1137  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1138  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1139  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1140  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1141  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1142  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1143  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1144  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1145  			i2c20: i2c@890000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1146  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1147  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1148  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1149  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1150  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1151  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1152  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1153  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1154  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1155  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1156  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1157  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1158  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1159  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1160  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1161  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1162  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1163  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1164  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1165  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1166  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1167  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1168  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1169  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1170  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1171  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1172  				pinctrl-0 = <&qup_i2c20_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1173  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1174  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1175  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1176  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1177  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1178  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1179  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1180  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1181  			spi20: spi@890000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1182  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1183  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1184  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1185  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1186  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1187  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1188  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1189  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1190  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1191  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1192  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1193  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1194  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1195  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1196  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1197  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1198  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1199  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1200  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1201  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1202  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1203  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1204  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1205  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1206  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1207  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1208  				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1209  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1210  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1211  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1212  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1213  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1214  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1215  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1216  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1217  			i2c21: i2c@894000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1218  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1219  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1220  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1221  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1222  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1223  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1224  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1225  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1226  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1227  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1228  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1229  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1230  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1231  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1232  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1233  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1234  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1235  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1236  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1237  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1238  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1239  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1240  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1241  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1242  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1243  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1244  				pinctrl-0 = <&qup_i2c21_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1245  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1246  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1247  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1248  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1249  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1250  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1251  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1252  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1253  			spi21: spi@894000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1254  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1255  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1256  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1257  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1258  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1259  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1260  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1261  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1262  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1263  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1264  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1265  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1266  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1267  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1268  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1269  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1270  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1271  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1272  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1273  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1274  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1275  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1276  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1277  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1278  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1279  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1280  				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1281  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1282  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1283  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1284  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1285  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1286  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1287  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1288  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1289  			uart21: serial@894000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1290  				compatible = "qcom,geni-uart";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1291  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1292  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1293  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1294  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1295  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1296  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1297  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1298  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1299  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1300  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1301  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1302  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1303  						     "qup-config";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1304  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1305  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1306  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1307  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1308  				pinctrl-0 = <&qup_uart21_default>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1309  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1310  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1311  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1312  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1313  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1314  			i2c22: i2c@898000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1315  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1316  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1317  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1318  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1319  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1320  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1321  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1322  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1323  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1324  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1325  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1326  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1327  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1328  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1329  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1330  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1331  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1332  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1333  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1334  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1335  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1336  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1337  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1338  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1339  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1340  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1341  				pinctrl-0 = <&qup_i2c22_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1342  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1343  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1344  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1345  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1346  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1347  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1348  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1349  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1350  			spi22: spi@898000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1351  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1352  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1353  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1354  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1355  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1356  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1357  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1358  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1359  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1360  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1361  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1362  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1363  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1364  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1365  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1366  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1367  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1368  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1369  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1370  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1371  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1372  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1373  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1374  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1375  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1376  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1377  				pinctrl-0 = <&qup_spi22_data_clk>, <&qup_spi22_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1378  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1379  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1380  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1381  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1382  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1383  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1384  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1385  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1386  			i2c23: i2c@89c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1387  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1388  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1389  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1390  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1391  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1392  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1393  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1394  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1395  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1396  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1397  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1398  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1399  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1400  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1401  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1402  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1403  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1404  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1405  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1406  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1407  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1408  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1409  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1410  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1411  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1412  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1413  				pinctrl-0 = <&qup_i2c23_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1414  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1415  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1416  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1417  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1418  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1419  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1420  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1421  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1422  			spi23: spi@89c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1423  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1424  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1425  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1426  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1427  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1428  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1429  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1430  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1431  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1432  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1433  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1434  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1435  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1436  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1437  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1438  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1439  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1440  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1441  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1442  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1443  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1444  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1445  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1446  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1447  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1448  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1449  				pinctrl-0 = <&qup_spi23_data_clk>, <&qup_spi23_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1450  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1451  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1452  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1453  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1454  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1455  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1456  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1457  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1458  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1459  		gpi_dma1: dma-controller@a00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1460  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1461  			reg = <0 0x00a00000 0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1462  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1463  			interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1464  				     <GIC_SPI 777 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1465  				     <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1466  				     <GIC_SPI 779 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1467  				     <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1468  				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1469  				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1470  				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1471  				     <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1472  				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1473  				     <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1474  				     <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1475  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1476  			dma-channels = <12>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1477  			dma-channel-mask = <0x3e>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1478  			#dma-cells = <3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1479  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1480  			iommus = <&apps_smmu 0x136 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1481  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1482  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1483  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1484  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1485  		qupv3_1: geniqup@ac0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1486  			compatible = "qcom,geni-se-qup";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1487  			reg = <0 0x00ac0000 0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1488  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1489  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1490  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1491  			clock-names = "m-ahb",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1492  				      "s-ahb";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1493  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1494  			iommus = <&apps_smmu 0x123 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1495  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1496  			#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1497  			#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1498  			ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1499  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1500  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1501  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1502  			i2c8: i2c@a80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1503  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1504  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1505  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1506  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1507  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1508  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1509  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1510  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1511  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1512  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1513  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1514  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1515  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1516  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1517  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1518  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1519  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1520  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1521  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1522  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1523  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1524  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1525  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1526  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1527  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1528  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1529  				pinctrl-0 = <&qup_i2c8_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1530  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1531  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1532  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1533  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1534  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1535  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1536  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1537  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1538  			spi8: spi@a80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1539  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1540  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1541  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1542  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1543  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1544  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1545  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1546  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1547  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1548  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1549  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1550  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1551  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1552  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1553  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1554  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1555  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1556  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1557  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1558  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1559  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1560  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1561  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1562  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1563  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1564  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1565  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1566  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1567  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1568  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1569  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1570  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1571  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1572  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1573  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1574  			i2c9: i2c@a84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1575  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1576  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1577  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1578  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1579  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1580  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1581  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1582  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1583  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1584  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1585  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1586  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1587  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1588  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1589  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1590  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1591  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1592  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1593  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1594  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1595  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1596  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1597  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1598  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1599  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1600  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1601  				pinctrl-0 = <&qup_i2c9_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1602  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1603  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1604  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1605  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1606  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1607  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1608  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1609  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1610  			spi9: spi@a84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1611  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1612  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1613  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1614  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1615  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1616  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1617  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1618  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1619  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1620  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1621  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1622  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1623  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1624  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1625  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1626  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1627  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1628  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1629  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1630  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1631  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1632  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1633  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1634  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1635  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1636  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1637  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1638  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1639  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1640  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1641  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1642  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1643  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1644  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1645  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1646  			i2c10: i2c@a88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1647  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1648  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1649  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1650  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1651  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1652  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1653  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1654  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1655  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1656  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1657  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1658  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1659  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1660  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1661  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1662  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1663  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1664  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1665  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1666  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1667  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1668  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1669  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1670  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1671  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1672  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1673  				pinctrl-0 = <&qup_i2c10_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1674  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1675  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1676  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1677  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1678  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1679  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1680  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1681  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1682  			spi10: spi@a88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1683  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1684  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1685  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1686  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1687  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1688  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1689  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1690  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1691  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1692  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1693  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1694  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1695  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1696  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1697  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1698  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1699  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1700  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1701  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1702  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1703  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1704  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1705  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1706  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1707  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1708  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1709  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1710  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1711  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1712  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1713  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1714  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1715  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1716  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1717  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1718  			i2c11: i2c@a8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1719  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1720  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1721  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1722  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1723  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1724  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1725  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1726  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1727  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1728  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1729  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1730  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1731  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1732  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1733  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1734  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1735  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1736  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1737  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1738  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1739  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1740  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1741  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1742  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1743  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1744  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1745  				pinctrl-0 = <&qup_i2c11_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1746  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1747  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1748  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1749  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1750  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1751  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1752  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1753  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1754  			spi11: spi@a8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1755  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1756  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1757  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1758  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1759  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1760  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1761  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1762  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1763  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1764  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1765  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1766  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1767  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1768  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1769  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1770  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1771  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1772  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1773  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1774  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1775  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1776  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1777  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1778  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1779  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1780  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1781  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1782  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1783  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1784  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1785  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1786  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1787  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1788  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1789  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1790  			i2c12: i2c@a90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1791  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1792  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1793  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1794  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1795  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1796  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1797  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1798  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1799  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1800  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1801  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1802  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1803  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1804  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1805  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1806  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1807  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1808  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1809  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1810  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1811  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1812  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1813  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1814  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1815  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1816  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1817  				pinctrl-0 = <&qup_i2c12_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1818  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1819  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1820  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1821  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1822  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1823  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1824  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1825  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1826  			spi12: spi@a90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1827  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1828  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1829  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1830  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1831  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1832  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1833  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1834  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1835  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1836  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1837  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1838  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1839  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1840  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1841  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1842  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1843  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1844  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1845  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1846  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1847  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1848  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1849  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1850  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1851  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1852  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1853  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1854  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1855  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1856  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1857  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1858  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1859  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1860  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1861  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1862  			i2c13: i2c@a94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1863  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1864  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1865  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1866  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1867  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1868  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1869  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1870  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1871  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1872  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1873  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1874  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1875  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1876  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1877  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1878  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1879  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1880  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1881  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1882  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1883  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1884  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1885  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1886  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1887  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1888  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1889  				pinctrl-0 = <&qup_i2c13_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1890  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1891  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1892  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1893  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1894  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1895  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1896  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1897  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1898  			spi13: spi@a94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1899  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1900  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1901  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1902  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1903  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1904  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1905  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1906  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1907  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1908  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1909  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1910  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1911  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1912  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1913  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1914  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1915  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1916  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1917  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1918  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1919  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1920  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1921  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1922  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1923  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1924  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1925  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1926  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1927  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1928  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1929  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1930  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1931  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1932  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1933  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1934  			i2c14: i2c@a98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1935  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1936  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1937  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1938  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1939  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1940  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1941  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1942  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1943  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1944  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1945  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1946  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1947  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1948  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1949  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1950  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1951  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1952  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1953  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1954  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1955  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1956  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1957  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1958  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1959  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1960  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1961  				pinctrl-0 = <&qup_i2c14_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1962  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1963  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1964  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1965  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1966  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1967  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1968  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1969  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1970  			spi14: spi@a98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1971  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1972  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1973  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1974  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1975  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1976  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1977  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1978  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1979  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1980  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1981  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1982  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1983  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1984  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1985  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1986  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1987  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1988  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1989  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1990  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1991  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1992  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1993  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1994  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1995  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1996  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1997  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1998  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1999  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2000  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2001  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2002  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2003  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2004  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2005  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2006  			uart14: serial@a98000 {
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2007  				compatible = "qcom,geni-uart";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2008  				reg = <0 0x00a98000 0 0x4000>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2009  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2010  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2011  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2012  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2013  				clock-names = "se";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2014  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2015  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2016  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2017  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2018  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2019  				interconnect-names = "qup-core",
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2020  						     "qup-config";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2021  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2022  				power-domains = <&rpmhpd RPMHPD_CX>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2023  				operating-points-v2 = <&qup_opp_table_100mhz>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2024  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2025  				pinctrl-0 = <&qup_uart14_default>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2026  				pinctrl-names = "default";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2027  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2028  				status = "disabled";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2029  			};
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2030  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2031  			i2c15: i2c@a9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2032  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2033  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2034  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2035  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2036  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2037  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2038  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2039  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2040  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2041  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2042  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2043  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2044  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2045  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2046  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2047  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2048  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2049  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2050  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2051  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2052  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2053  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2054  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2055  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2056  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2057  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2058  				pinctrl-0 = <&qup_i2c15_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2059  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2060  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2061  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2062  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2063  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2064  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2065  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2066  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2067  			spi15: spi@a9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2068  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2069  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2070  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2071  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2072  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2073  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2074  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2075  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2076  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2077  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2078  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2079  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2080  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2081  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2082  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2083  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2084  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2085  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2086  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2087  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2088  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2089  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2090  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2091  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2092  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2093  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2094  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2095  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2096  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2097  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2098  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2099  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2100  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2101  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2102  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2103  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2104  		gpi_dma0: dma-controller@b00000  {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2105  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2106  			reg = <0 0x00b00000 0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2107  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2108  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2109  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2110  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2111  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2112  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2113  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2114  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2115  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2116  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2117  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2118  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2119  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2120  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2121  			dma-channels = <12>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2122  			dma-channel-mask = <0x3e>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2123  			#dma-cells = <3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2124  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2125  			iommus = <&apps_smmu 0x456 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2126  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2127  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2128  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2129  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2130  		qupv3_0: geniqup@bc0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2131  			compatible = "qcom,geni-se-qup";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2132  			reg = <0 0x00bc0000 0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2133  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2134  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2135  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2136  			clock-names = "m-ahb",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2137  				      "s-ahb";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2138  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2139  			iommus = <&apps_smmu 0x443 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2140  			#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2141  			#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2142  			ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2143  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2144  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2145  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2146  			i2c0: i2c@b80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2147  				compatible = "qcom,geni-i2c";
27302c7d8590995 Konrad Dybcio       2024-07-11  2148  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2149  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2150  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2151  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2152  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2153  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2154  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2155  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2156  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2157  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2158  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2159  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2160  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2161  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2162  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2163  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2164  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2165  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2166  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2167  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2168  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2169  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2170  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2171  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2172  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2173  				pinctrl-0 = <&qup_i2c0_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2174  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2175  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2176  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2177  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2178  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2179  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2180  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2181  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2182  			spi0: spi@b80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2183  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2184  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2185  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2186  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2187  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2188  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2189  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2190  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2191  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2192  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2193  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2194  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2195  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2196  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2197  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2198  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2199  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2200  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2201  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2202  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2203  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2204  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2205  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2206  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2207  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2208  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2209  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2210  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2211  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2212  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2213  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2214  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2215  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2216  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2217  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2218  			i2c1: i2c@b84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2219  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2220  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2221  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2222  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2223  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2224  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2225  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2226  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2227  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2228  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2229  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2230  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2231  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2232  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2233  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2234  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2235  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2236  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2237  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2238  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2239  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2240  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2241  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2242  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2243  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2244  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2245  				pinctrl-0 = <&qup_i2c1_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2246  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2247  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2248  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2249  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2250  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2251  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2252  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2253  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2254  			spi1: spi@b84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2255  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2256  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2257  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2258  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2259  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2260  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2261  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2262  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2263  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2264  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2265  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2266  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2267  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2268  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2269  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2270  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2271  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2272  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2273  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2274  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2275  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2276  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2277  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2278  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2279  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2280  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2281  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2282  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2283  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2284  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2285  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2286  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2287  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2288  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2289  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2290  			i2c2: i2c@b88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2291  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2292  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2293  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2294  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2295  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2296  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2297  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2298  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2299  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2300  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2301  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2302  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2303  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2304  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2305  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2306  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2307  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2308  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2309  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2310  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2311  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2312  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2313  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2314  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2315  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2316  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2317  				pinctrl-0 = <&qup_i2c2_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2318  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2319  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2320  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2321  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2322  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2323  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2324  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2325  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2326  			uart2: serial@b88000 {
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2327  				compatible = "qcom,geni-uart";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2328  				reg = <0 0x00b88000 0 0x4000>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2329  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2330  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2331  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2332  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2333  				clock-names = "se";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2334  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2335  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2336  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2337  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2338  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2339  				interconnect-names = "qup-core",
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2340  						     "qup-config";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2341  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2342  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2343  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2344  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2345  				pinctrl-0 = <&qup_uart2_default>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2346  				pinctrl-names = "default";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2347  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2348  				status = "disabled";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2349  			};
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2350  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2351  			spi2: spi@b88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2352  				compatible = "qcom,geni-spi";
27302c7d8590995 Konrad Dybcio       2024-07-11  2353  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2354  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2355  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2356  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2357  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2358  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2359  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2360  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2361  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2362  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2363  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2364  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2365  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2366  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2367  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2368  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2369  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2370  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2371  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2372  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2373  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2374  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2375  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2376  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2377  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2378  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2379  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2380  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2381  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2382  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2383  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2384  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2385  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2386  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2387  			i2c3: i2c@b8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2388  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2389  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2390  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2391  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2392  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2393  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2394  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2395  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2396  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2397  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2398  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2399  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2400  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2401  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2402  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2403  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2404  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2405  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2406  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2407  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2408  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2409  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2410  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2411  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2412  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2413  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2414  				pinctrl-0 = <&qup_i2c3_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2415  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2416  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2417  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2418  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2419  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2420  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2421  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2422  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2423  			spi3: spi@b8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2424  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2425  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2426  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2427  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2428  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2429  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2430  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2431  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2432  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2433  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2434  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2435  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2436  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2437  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2438  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2439  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2440  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2441  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2442  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2443  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2444  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2445  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2446  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2447  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2448  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2449  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2450  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2451  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2452  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2453  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2454  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2455  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2456  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2457  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2458  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2459  			i2c4: i2c@b90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2460  				compatible = "qcom,geni-i2c";
27302c7d8590995 Konrad Dybcio       2024-07-11  2461  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2462  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2463  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2464  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2465  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2466  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2467  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2468  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2469  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2470  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2471  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2472  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2473  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2474  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2475  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2476  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2477  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2478  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2479  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2480  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2481  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2482  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2483  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2484  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2485  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2486  				pinctrl-0 = <&qup_i2c4_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2487  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2488  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2489  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2490  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2491  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2492  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2493  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2494  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2495  			spi4: spi@b90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2496  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2497  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2498  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2499  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2500  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2501  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2502  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2503  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2504  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2505  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2506  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2507  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2508  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2509  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2510  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2511  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2512  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2513  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2514  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2515  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2516  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2517  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2518  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2519  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2520  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2521  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2522  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2523  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2524  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2525  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2526  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2527  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2528  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2529  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2530  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2531  			i2c5: i2c@b94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2532  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2533  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2534  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2535  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2536  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2537  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2538  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2539  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2540  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2541  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2542  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2543  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2544  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2545  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2546  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2547  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2548  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2549  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2550  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2551  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2552  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2553  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2554  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2555  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2556  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2557  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2558  				pinctrl-0 = <&qup_i2c5_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2559  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2560  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2561  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2562  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2563  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2564  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2565  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2566  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2567  			spi5: spi@b94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2568  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2569  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2570  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2571  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2572  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2573  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2574  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2575  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2576  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2577  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2578  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2579  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2580  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2581  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2582  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2583  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2584  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2585  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2586  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2587  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2588  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2589  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2590  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2591  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2592  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2593  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2594  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2595  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2596  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2597  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2598  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2599  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2600  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2601  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2602  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2603  			i2c6: i2c@b98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2604  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2605  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2606  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2607  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2608  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2609  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2610  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2611  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2612  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2613  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2614  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2615  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2616  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2617  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2618  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2619  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2620  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2621  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2622  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2623  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2624  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2625  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2626  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2627  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2628  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2629  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2630  				pinctrl-0 = <&qup_i2c6_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2631  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2632  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2633  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2634  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2635  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2636  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2637  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2638  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2639  			spi6: spi@b98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2640  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2641  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2642  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2643  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2644  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2645  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2646  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2647  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2648  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2649  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2650  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2651  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2652  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2653  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2654  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2655  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2656  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2657  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2658  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2659  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2660  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2661  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2662  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2663  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2664  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2665  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2666  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2667  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2668  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2669  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2670  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2671  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2672  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2673  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2674  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2675  			i2c7: i2c@b9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2676  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2677  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2678  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2679  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2680  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2681  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2682  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2683  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2684  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2685  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2686  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2687  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2688  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2689  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2690  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2691  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2692  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2693  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2694  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2695  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2696  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2697  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2698  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2699  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2700  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2701  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2702  				pinctrl-0 = <&qup_i2c7_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2703  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2704  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2705  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2706  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2707  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2708  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2709  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2710  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2711  			spi7: spi@b9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2712  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2713  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2714  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2715  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2716  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2717  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2718  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2719  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2720  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2721  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2722  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2723  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2724  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2725  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2726  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2727  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2728  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2729  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2730  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2731  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2732  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2733  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2734  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2735  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2736  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2737  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2738  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2739  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2740  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2741  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2742  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2743  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2744  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2745  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2746  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2747  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2748  		tsens0: thermal-sensor@c271000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2749  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2750  			reg = <0 0x0c271000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2751  			      <0 0x0c222000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2752  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2753  			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2754  					      <&intc GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2755  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2756  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2757  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2758  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2759  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2760  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2761  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2762  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2763  		tsens1: thermal-sensor@c272000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2764  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2765  			reg = <0 0x0c272000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2766  			      <0 0x0c223000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2767  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2768  			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2769  					      <&intc GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2770  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2771  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2772  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2773  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2774  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2775  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2776  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2777  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2778  		tsens2: thermal-sensor@c273000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2779  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2780  			reg = <0 0x0c273000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2781  			      <0 0x0c224000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2782  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2783  			interrupts-extended = <&pdc 28 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2784  					      <&intc GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2785  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2786  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2787  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2788  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2789  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2790  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2791  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2792  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2793  		tsens3: thermal-sensor@c274000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2794  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2795  			reg = <0 0x0c274000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2796  			      <0 0x0c225000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2797  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2798  			interrupts-extended = <&pdc 29 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2799  					      <&intc GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2800  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2801  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2802  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2803  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2804  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2805  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2806  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2807  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2808  		usb_1_ss0_hsphy: phy@fd3000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  2809  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2810  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2811  			reg = <0 0x00fd3000 0 0x154>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2812  			#phy-cells = <0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2813  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2814  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2815  			clock-names = "ref";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2816  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2817  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2818  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2819  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2820  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2821  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2822  		usb_1_ss0_qmpphy: phy@fd5000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  2823  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2824  			reg = <0 0x00fd5000 0 0x4000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2825  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2826  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2827  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2828  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2829  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2830  			clock-names = "aux",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2831  				      "ref",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2832  				      "com_aux",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2833  				      "usb3_pipe";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2834  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2835  			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2836  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2837  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2838  				 <&gcc GCC_USB4_0_DP0_PHY_PRIM_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2839  			reset-names = "phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2840  				      "common";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2841  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2842  			#clock-cells = <1>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2843  			#phy-cells = <1>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2844  
17c5909f53e01c1 Abel Vesa           2024-08-29  2845  			orientation-switch;
17c5909f53e01c1 Abel Vesa           2024-08-29  2846  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2847  			status = "disabled";
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2848  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2849  			ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2850  				#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2851  				#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2852  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2853  				port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2854  					reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2855  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2856  					usb_1_ss0_qmpphy_out: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2857  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2858  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2859  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2860  				port@1 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2861  					reg = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2862  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2863  					usb_1_ss0_qmpphy_usb_ss_in: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2864  						remote-endpoint = <&usb_1_ss0_dwc3_ss>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2865  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2866  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2867  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2868  				port@2 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2869  					reg = <2>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2870  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2871  					usb_1_ss0_qmpphy_dp_in: endpoint {
aa48a8a5d642b58 Abel Vesa           2024-06-06  2872  						remote-endpoint = <&mdss_dp0_out>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2873  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2874  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2875  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2876  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2877  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2878  		usb_1_ss1_hsphy: phy@fd9000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  2879  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2880  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2881  			reg = <0 0x00fd9000 0 0x154>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2882  			#phy-cells = <0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2883  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2884  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2885  			clock-names = "ref";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2886  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2887  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2888  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2889  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2890  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2891  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2892  		usb_1_ss1_qmpphy: phy@fda000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  2893  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2894  			reg = <0 0x00fda000 0 0x4000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2895  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2896  			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2897  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2898  				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2899  				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2900  			clock-names = "aux",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2901  				      "ref",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2902  				      "com_aux",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2903  				      "usb3_pipe";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2904  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2905  			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2906  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2907  			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2908  				 <&gcc GCC_USB4_1_DP0_PHY_SEC_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2909  			reset-names = "phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2910  				      "common";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2911  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2912  			#clock-cells = <1>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2913  			#phy-cells = <1>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2914  
17c5909f53e01c1 Abel Vesa           2024-08-29  2915  			orientation-switch;
17c5909f53e01c1 Abel Vesa           2024-08-29  2916  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2917  			status = "disabled";
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2918  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2919  			ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2920  				#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2921  				#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2922  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2923  				port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2924  					reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2925  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2926  					usb_1_ss1_qmpphy_out: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2927  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2928  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2929  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2930  				port@1 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2931  					reg = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2932  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2933  					usb_1_ss1_qmpphy_usb_ss_in: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2934  						remote-endpoint = <&usb_1_ss1_dwc3_ss>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2935  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2936  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2937  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2938  				port@2 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2939  					reg = <2>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2940  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2941  					usb_1_ss1_qmpphy_dp_in: endpoint {
aa48a8a5d642b58 Abel Vesa           2024-06-06  2942  						remote-endpoint = <&mdss_dp1_out>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2943  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2944  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2945  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2946  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2947  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2948  		usb_1_ss2_hsphy: phy@fde000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  2949  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2950  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2951  			reg = <0 0x00fde000 0 0x154>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2952  			#phy-cells = <0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2953  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2954  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2955  			clock-names = "ref";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2956  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2957  			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2958  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2959  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2960  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  2961  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2962  		usb_1_ss2_qmpphy: phy@fdf000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  2963  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2964  			reg = <0 0x00fdf000 0 0x4000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2965  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2966  			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2967  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2968  				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2969  				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2970  			clock-names = "aux",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2971  				      "ref",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2972  				      "com_aux",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2973  				      "usb3_pipe";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2974  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2975  			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2976  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2977  			resets = <&gcc GCC_USB3_PHY_TERT_BCR>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  2978  				 <&gcc GCC_USB4_2_DP0_PHY_TERT_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2979  			reset-names = "phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  2980  				      "common";
4af46b7bd66fa3a Abel Vesa           2024-01-29  2981  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2982  			#clock-cells = <1>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2983  			#phy-cells = <1>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  2984  
17c5909f53e01c1 Abel Vesa           2024-08-29  2985  			orientation-switch;
17c5909f53e01c1 Abel Vesa           2024-08-29  2986  
4af46b7bd66fa3a Abel Vesa           2024-01-29  2987  			status = "disabled";
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2988  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2989  			ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2990  				#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2991  				#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2992  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2993  				port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2994  					reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2995  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2996  					usb_1_ss2_qmpphy_out: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2997  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2998  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  2999  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3000  				port@1 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3001  					reg = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3002  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3003  					usb_1_ss2_qmpphy_usb_ss_in: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3004  						remote-endpoint = <&usb_1_ss2_dwc3_ss>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3005  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3006  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3007  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3008  				port@2 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3009  					reg = <2>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3010  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3011  					usb_1_ss2_qmpphy_dp_in: endpoint {
aa48a8a5d642b58 Abel Vesa           2024-06-06  3012  						remote-endpoint = <&mdss_dp2_out>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3013  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3014  				};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  3015  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  3016  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  3017  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3018  		cnoc_main: interconnect@1500000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3019  			compatible = "qcom,x1e80100-cnoc-main";
27302c7d8590995 Konrad Dybcio       2024-07-11  3020  			reg = <0 0x01500000 0 0x14400>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3021  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3022  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3023  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3024  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3025  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3026  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3027  		config_noc: interconnect@1600000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3028  			compatible = "qcom,x1e80100-cnoc-cfg";
27302c7d8590995 Konrad Dybcio       2024-07-11  3029  			reg = <0 0x01600000 0 0x6600>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3030  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3031  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3032  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3033  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3034  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3035  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3036  		system_noc: interconnect@1680000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3037  			compatible = "qcom,x1e80100-system-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3038  			reg = <0 0x01680000 0 0x1c080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3039  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3040  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3041  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3042  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3043  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3044  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3045  		pcie_south_anoc: interconnect@16c0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3046  			compatible = "qcom,x1e80100-pcie-south-anoc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3047  			reg = <0 0x016c0000 0 0xd080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3048  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3049  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3050  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3051  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3052  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3053  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3054  		pcie_center_anoc: interconnect@16d0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3055  			compatible = "qcom,x1e80100-pcie-center-anoc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3056  			reg = <0 0x016d0000 0 0x7000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3057  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3058  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3059  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3060  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3061  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3062  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3063  		aggre1_noc: interconnect@16e0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3064  			compatible = "qcom,x1e80100-aggre1-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3065  			reg = <0 0x016e0000 0 0x14400>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3066  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3067  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3068  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3069  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3070  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3071  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3072  		aggre2_noc: interconnect@1700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3073  			compatible = "qcom,x1e80100-aggre2-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3074  			reg = <0 0x01700000 0 0x1c400>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3075  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3076  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3077  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3078  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3079  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3080  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3081  		pcie_north_anoc: interconnect@1740000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3082  			compatible = "qcom,x1e80100-pcie-north-anoc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3083  			reg = <0 0x01740000 0 0x9080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3084  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3085  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3086  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3087  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3088  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3089  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3090  		usb_center_anoc: interconnect@1750000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3091  			compatible = "qcom,x1e80100-usb-center-anoc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3092  			reg = <0 0x01750000 0 0x8800>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3093  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3094  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3095  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3096  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3097  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3098  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3099  		usb_north_anoc: interconnect@1760000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3100  			compatible = "qcom,x1e80100-usb-north-anoc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3101  			reg = <0 0x01760000 0 0x7080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3102  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3103  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3104  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3105  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3106  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3107  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3108  		usb_south_anoc: interconnect@1770000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3109  			compatible = "qcom,x1e80100-usb-south-anoc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3110  			reg = <0 0x01770000 0 0xf080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3111  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3112  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3113  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3114  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3115  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3116  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3117  		mmss_noc: interconnect@1780000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3118  			compatible = "qcom,x1e80100-mmss-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3119  			reg = <0 0x01780000 0 0x5B800>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3120  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3121  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3122  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3123  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3124  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3125  
f8af195beeb0096 Qiang Yu            2024-11-04  3126  		pcie3: pcie@1bd0000 {
5eb83fc10289db0 Abel Vesa           2024-01-29  3127  			device_type = "pci";
5eb83fc10289db0 Abel Vesa           2024-01-29  3128  			compatible = "qcom,pcie-x1e80100";
f8af195beeb0096 Qiang Yu            2024-11-04  3129  			reg = <0x0 0x01bd0000 0x0 0x3000>,
f8af195beeb0096 Qiang Yu            2024-11-04  3130  			      <0x0 0x78000000 0x0 0xf1d>,
f8af195beeb0096 Qiang Yu            2024-11-04  3131  			      <0x0 0x78000f40 0x0 0xa8>,
f8af195beeb0096 Qiang Yu            2024-11-04  3132  			      <0x0 0x78001000 0x0 0x1000>,
f8af195beeb0096 Qiang Yu            2024-11-04  3133  			      <0x0 0x78100000 0x0 0x100000>,
f8af195beeb0096 Qiang Yu            2024-11-04  3134  			      <0x0 0x01bd3000 0x0 0x1000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3135  			reg-names = "parf",
5eb83fc10289db0 Abel Vesa           2024-01-29  3136  				    "dbi",
5eb83fc10289db0 Abel Vesa           2024-01-29  3137  				    "elbi",
5eb83fc10289db0 Abel Vesa           2024-01-29  3138  				    "atu",
8e99e770f7eab8f Abel Vesa           2024-06-04  3139  				    "config",
8e99e770f7eab8f Abel Vesa           2024-06-04  3140  				    "mhi";
5eb83fc10289db0 Abel Vesa           2024-01-29  3141  			#address-cells = <3>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3142  			#size-cells = <2>;
f8af195beeb0096 Qiang Yu            2024-11-04  3143  			ranges = <0x01000000 0x0 0x00000000 0x0 0x78200000 0x0 0x100000>,
f8af195beeb0096 Qiang Yu            2024-11-04  3144  				 <0x02000000 0x0 0x78300000 0x0 0x78300000 0x0 0x3d00000>,
f8af195beeb0096 Qiang Yu            2024-11-04  3145  				 <0x03000000 0x7 0x40000000 0x7 0x40000000 0x0 0x40000000>;
7af141850012415 Konrad Dybcio       2024-07-10  3146  			bus-range = <0x00 0xff>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3147  
5eb83fc10289db0 Abel Vesa           2024-01-29  3148  			dma-coherent;
5eb83fc10289db0 Abel Vesa           2024-01-29  3149  
f8af195beeb0096 Qiang Yu            2024-11-04  3150  			linux,pci-domain = <3>;
f8af195beeb0096 Qiang Yu            2024-11-04  3151  			num-lanes = <8>;
f8af195beeb0096 Qiang Yu            2024-11-04  3152  
f8af195beeb0096 Qiang Yu            2024-11-04  3153  			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3154  				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3155  				     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3156  				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3157  				     <GIC_SPI 671 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3158  				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3159  				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3160  				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3161  				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3162  			interrupt-names = "msi0",
5eb83fc10289db0 Abel Vesa           2024-01-29  3163  					  "msi1",
5eb83fc10289db0 Abel Vesa           2024-01-29  3164  					  "msi2",
5eb83fc10289db0 Abel Vesa           2024-01-29  3165  					  "msi3",
5eb83fc10289db0 Abel Vesa           2024-01-29  3166  					  "msi4",
5eb83fc10289db0 Abel Vesa           2024-01-29  3167  					  "msi5",
5eb83fc10289db0 Abel Vesa           2024-01-29  3168  					  "msi6",
f8af195beeb0096 Qiang Yu            2024-11-04  3169  					  "msi7",
f8af195beeb0096 Qiang Yu            2024-11-04  3170  					  "global";
5eb83fc10289db0 Abel Vesa           2024-01-29  3171  
5eb83fc10289db0 Abel Vesa           2024-01-29  3172  			#interrupt-cells = <1>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3173  			interrupt-map-mask = <0 0 0 0x7>;
f8af195beeb0096 Qiang Yu            2024-11-04  3174  			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3175  					<0 0 0 2 &intc 0 0 GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3176  					<0 0 0 3 &intc 0 0 GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
f8af195beeb0096 Qiang Yu            2024-11-04  3177  					<0 0 0 4 &intc 0 0 GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
f8af195beeb0096 Qiang Yu            2024-11-04  3178  
f8af195beeb0096 Qiang Yu            2024-11-04  3179  			clocks = <&gcc GCC_PCIE_3_AUX_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3180  				 <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3181  				 <&gcc GCC_PCIE_3_MSTR_AXI_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3182  				 <&gcc GCC_PCIE_3_SLV_AXI_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3183  				 <&gcc GCC_PCIE_3_SLV_Q2A_AXI_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3184  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3185  				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3186  			clock-names = "aux",
5eb83fc10289db0 Abel Vesa           2024-01-29  3187  				      "cfg",
5eb83fc10289db0 Abel Vesa           2024-01-29  3188  				      "bus_master",
5eb83fc10289db0 Abel Vesa           2024-01-29  3189  				      "bus_slave",
5eb83fc10289db0 Abel Vesa           2024-01-29  3190  				      "slave_q2a",
5eb83fc10289db0 Abel Vesa           2024-01-29  3191  				      "noc_aggr",
5eb83fc10289db0 Abel Vesa           2024-01-29  3192  				      "cnoc_sf_axi";
5eb83fc10289db0 Abel Vesa           2024-01-29  3193  
f8af195beeb0096 Qiang Yu            2024-11-04  3194  			assigned-clocks = <&gcc GCC_PCIE_3_AUX_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3195  			assigned-clock-rates = <19200000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3196  
f8af195beeb0096 Qiang Yu            2024-11-04  3197  			interconnects = <&pcie_north_anoc MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
5eb83fc10289db0 Abel Vesa           2024-01-29  3198  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  3199  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  3200  					 &cnoc_main SLAVE_PCIE_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3201  			interconnect-names = "pcie-mem",
5eb83fc10289db0 Abel Vesa           2024-01-29  3202  					     "cpu-pcie";
5eb83fc10289db0 Abel Vesa           2024-01-29  3203  
f8af195beeb0096 Qiang Yu            2024-11-04  3204  			resets = <&gcc GCC_PCIE_3_BCR>,
f8af195beeb0096 Qiang Yu            2024-11-04  3205  				 <&gcc GCC_PCIE_3_LINK_DOWN_BCR>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3206  			reset-names = "pci",
5eb83fc10289db0 Abel Vesa           2024-01-29  3207  				      "link_down";
5eb83fc10289db0 Abel Vesa           2024-01-29  3208  
f8af195beeb0096 Qiang Yu            2024-11-04  3209  			power-domains = <&gcc GCC_PCIE_3_GDSC>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3210  
f8af195beeb0096 Qiang Yu            2024-11-04  3211  			phys = <&pcie3_phy>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3212  			phy-names = "pciephy";
5eb83fc10289db0 Abel Vesa           2024-01-29  3213  
f8af195beeb0096 Qiang Yu            2024-11-04  3214  			operating-points-v2 = <&pcie3_opp_table>;
f8af195beeb0096 Qiang Yu            2024-11-04  3215  
5eb83fc10289db0 Abel Vesa           2024-01-29  3216  			status = "disabled";
5eb83fc10289db0 Abel Vesa           2024-01-29  3217  
f8af195beeb0096 Qiang Yu            2024-11-04  3218  			pcie3_opp_table: opp-table {
f8af195beeb0096 Qiang Yu            2024-11-04  3219  				compatible = "operating-points-v2";
5eb83fc10289db0 Abel Vesa           2024-01-29  3220  
f8af195beeb0096 Qiang Yu            2024-11-04  3221  				/* GEN 1 x1 */
f8af195beeb0096 Qiang Yu            2024-11-04  3222  				opp-2500000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3223  					opp-hz = /bits/ 64 <2500000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3224  					required-opps = <&rpmhpd_opp_low_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3225  					opp-peak-kBps = <250000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3226  				};
5eb83fc10289db0 Abel Vesa           2024-01-29  3227  
f8af195beeb0096 Qiang Yu            2024-11-04  3228  				/* GEN 1 x2 and GEN 2 x1 */
f8af195beeb0096 Qiang Yu            2024-11-04  3229  				opp-5000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3230  					opp-hz = /bits/ 64 <5000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3231  					required-opps = <&rpmhpd_opp_low_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3232  					opp-peak-kBps = <500000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3233  				};
5eb83fc10289db0 Abel Vesa           2024-01-29  3234  
f8af195beeb0096 Qiang Yu            2024-11-04  3235  				/* GEN 1 x4 and GEN 2 x2 */
f8af195beeb0096 Qiang Yu            2024-11-04  3236  				opp-10000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3237  					opp-hz = /bits/ 64 <10000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3238  					required-opps = <&rpmhpd_opp_low_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3239  					opp-peak-kBps = <1000000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3240  				};
5eb83fc10289db0 Abel Vesa           2024-01-29  3241  
f8af195beeb0096 Qiang Yu            2024-11-04  3242  				/* GEN 1 x8 and GEN 2 x4 */
f8af195beeb0096 Qiang Yu            2024-11-04  3243  				opp-20000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3244  					opp-hz = /bits/ 64 <20000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3245  					required-opps = <&rpmhpd_opp_low_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3246  					opp-peak-kBps = <2000000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3247  				};
5eb83fc10289db0 Abel Vesa           2024-01-29  3248  
f8af195beeb0096 Qiang Yu            2024-11-04  3249  				/* GEN 2 x8 */
f8af195beeb0096 Qiang Yu            2024-11-04  3250  				opp-40000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3251  					opp-hz = /bits/ 64 <40000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3252  					required-opps = <&rpmhpd_opp_low_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3253  					opp-peak-kBps = <4000000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3254  				};
837c333f46df8ce Abel Vesa           2024-10-09  3255  
f8af195beeb0096 Qiang Yu            2024-11-04  3256  				/* GEN 3 x1 */
f8af195beeb0096 Qiang Yu            2024-11-04  3257  				opp-8000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3258  					opp-hz = /bits/ 64 <8000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3259  					required-opps = <&rpmhpd_opp_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3260  					opp-peak-kBps = <984500 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3261  				};
f8af195beeb0096 Qiang Yu            2024-11-04  3262  
f8af195beeb0096 Qiang Yu            2024-11-04  3263  				/* GEN 3 x2 and GEN 4 x1 */
f8af195beeb0096 Qiang Yu            2024-11-04  3264  				opp-16000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3265  					opp-hz = /bits/ 64 <16000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3266  					required-opps = <&rpmhpd_opp_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3267  					opp-peak-kBps = <1969000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3268  				};
f8af195beeb0096 Qiang Yu            2024-11-04  3269  
f8af195beeb0096 Qiang Yu            2024-11-04  3270  				/* GEN 3 x4 and GEN 4 x2 */
f8af195beeb0096 Qiang Yu            2024-11-04  3271  				opp-32000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3272  					opp-hz = /bits/ 64 <32000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3273  					required-opps = <&rpmhpd_opp_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3274  					opp-peak-kBps = <3938000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3275  				};
f8af195beeb0096 Qiang Yu            2024-11-04  3276  
f8af195beeb0096 Qiang Yu            2024-11-04  3277  				/* GEN 3 x8 and GEN 4 x4 */
f8af195beeb0096 Qiang Yu            2024-11-04  3278  				opp-64000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3279  					opp-hz = /bits/ 64 <64000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3280  					required-opps = <&rpmhpd_opp_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3281  					opp-peak-kBps = <7876000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3282  				};
f8af195beeb0096 Qiang Yu            2024-11-04  3283  
f8af195beeb0096 Qiang Yu            2024-11-04  3284  				/* GEN 4 x8 */
f8af195beeb0096 Qiang Yu            2024-11-04  3285  				opp-128000000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3286  					opp-hz = /bits/ 64 <128000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3287  					required-opps = <&rpmhpd_opp_svs>;
f8af195beeb0096 Qiang Yu            2024-11-04  3288  					opp-peak-kBps = <15753000 1>;
f8af195beeb0096 Qiang Yu            2024-11-04  3289  				};
f8af195beeb0096 Qiang Yu            2024-11-04  3290  			};
f8af195beeb0096 Qiang Yu            2024-11-04  3291  		};
f8af195beeb0096 Qiang Yu            2024-11-04  3292  
f8af195beeb0096 Qiang Yu            2024-11-04  3293  		pcie3_phy: phy@1be0000 {
f8af195beeb0096 Qiang Yu            2024-11-04  3294  			compatible = "qcom,x1e80100-qmp-gen4x8-pcie-phy";
f8af195beeb0096 Qiang Yu            2024-11-04  3295  			reg = <0 0x01be0000 0 0x10000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3296  
f8af195beeb0096 Qiang Yu            2024-11-04  3297  			clocks = <&gcc GCC_PCIE_3_PHY_AUX_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3298  				 <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3299  				 <&tcsr TCSR_PCIE_8L_CLKREF_EN>,
f8af195beeb0096 Qiang Yu            2024-11-04  3300  				 <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3301  				 <&gcc GCC_PCIE_3_PIPE_CLK>,
f8af195beeb0096 Qiang Yu            2024-11-04  3302  				 <&gcc GCC_PCIE_3_PIPEDIV2_CLK>;
f8af195beeb0096 Qiang Yu            2024-11-04  3303  			clock-names = "aux",
f8af195beeb0096 Qiang Yu            2024-11-04  3304  				      "cfg_ahb",
f8af195beeb0096 Qiang Yu            2024-11-04  3305  				      "ref",
f8af195beeb0096 Qiang Yu            2024-11-04  3306  				      "rchng",
f8af195beeb0096 Qiang Yu            2024-11-04  3307  				      "pipe",
f8af195beeb0096 Qiang Yu            2024-11-04  3308  				      "pipediv2";
f8af195beeb0096 Qiang Yu            2024-11-04  3309  
f8af195beeb0096 Qiang Yu            2024-11-04  3310  			resets = <&gcc GCC_PCIE_3_PHY_BCR>,
f8af195beeb0096 Qiang Yu            2024-11-04  3311  				 <&gcc GCC_PCIE_3_NOCSR_COM_PHY_BCR>;
f8af195beeb0096 Qiang Yu            2024-11-04  3312  			reset-names = "phy",
f8af195beeb0096 Qiang Yu            2024-11-04  3313  				      "phy_nocsr";
f8af195beeb0096 Qiang Yu            2024-11-04  3314  
f8af195beeb0096 Qiang Yu            2024-11-04  3315  			assigned-clocks = <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>;
f8af195beeb0096 Qiang Yu            2024-11-04  3316  			assigned-clock-rates = <100000000>;
f8af195beeb0096 Qiang Yu            2024-11-04  3317  
f8af195beeb0096 Qiang Yu            2024-11-04  3318  			power-domains = <&gcc GCC_PCIE_3_PHY_GDSC>;
f8af195beeb0096 Qiang Yu            2024-11-04  3319  
f8af195beeb0096 Qiang Yu            2024-11-04  3320  			#clock-cells = <0>;
f8af195beeb0096 Qiang Yu            2024-11-04  3321  			clock-output-names = "pcie3_pipe_clk";
f8af195beeb0096 Qiang Yu            2024-11-04  3322  
f8af195beeb0096 Qiang Yu            2024-11-04  3323  			#phy-cells = <0>;
f8af195beeb0096 Qiang Yu            2024-11-04  3324  
f8af195beeb0096 Qiang Yu            2024-11-04  3325  			status = "disabled";
f8af195beeb0096 Qiang Yu            2024-11-04  3326  		};
f8af195beeb0096 Qiang Yu            2024-11-04  3327  
5eb83fc10289db0 Abel Vesa           2024-01-29  3328  		pcie6a: pci@1bf8000 {
5eb83fc10289db0 Abel Vesa           2024-01-29  3329  			device_type = "pci";
5eb83fc10289db0 Abel Vesa           2024-01-29  3330  			compatible = "qcom,pcie-x1e80100";
5eb83fc10289db0 Abel Vesa           2024-01-29  3331  			reg = <0 0x01bf8000 0 0x3000>,
8e99e770f7eab8f Abel Vesa           2024-06-04  3332  			      <0 0x70000000 0 0xf20>,
8e99e770f7eab8f Abel Vesa           2024-06-04  3333  			      <0 0x70000f40 0 0xa8>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3334  			      <0 0x70001000 0 0x1000>,
8e99e770f7eab8f Abel Vesa           2024-06-04  3335  			      <0 0x70100000 0 0x100000>,
8e99e770f7eab8f Abel Vesa           2024-06-04  3336  			      <0 0x01bfb000 0 0x1000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3337  			reg-names = "parf",
5eb83fc10289db0 Abel Vesa           2024-01-29  3338  				    "dbi",
5eb83fc10289db0 Abel Vesa           2024-01-29  3339  				    "elbi",
5eb83fc10289db0 Abel Vesa           2024-01-29  3340  				    "atu",
8e99e770f7eab8f Abel Vesa           2024-06-04  3341  				    "config",
8e99e770f7eab8f Abel Vesa           2024-06-04  3342  				    "mhi";
5eb83fc10289db0 Abel Vesa           2024-01-29  3343  			#address-cells = <3>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3344  			#size-cells = <2>;
7af141850012415 Konrad Dybcio       2024-07-10  3345  			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
f10203927097ff9 Linus Torvalds      2025-01-24  3346  				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x3d00000>;
7af141850012415 Konrad Dybcio       2024-07-10  3347  			bus-range = <0x00 0xff>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3348  
5eb83fc10289db0 Abel Vesa           2024-01-29  3349  			dma-coherent;
5eb83fc10289db0 Abel Vesa           2024-01-29  3350  
f8fa1f2f6412bff Johan Hovold        2024-07-22  3351  			linux,pci-domain = <6>;
837c333f46df8ce Abel Vesa           2024-10-09  3352  			num-lanes = <4>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3353  
9c4cd0aef259d41 Johan Hovold        2024-10-09  3354  			msi-map = <0x0 &gic_its 0xe0000 0x10000>;
9c4cd0aef259d41 Johan Hovold        2024-10-09  3355  
5eb83fc10289db0 Abel Vesa           2024-01-29  3356  			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3357  				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3358  				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3359  				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3360  				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3361  				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3362  				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3363  				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3364  			interrupt-names = "msi0",
5eb83fc10289db0 Abel Vesa           2024-01-29  3365  					  "msi1",
5eb83fc10289db0 Abel Vesa           2024-01-29  3366  					  "msi2",
5eb83fc10289db0 Abel Vesa           2024-01-29  3367  					  "msi3",
5eb83fc10289db0 Abel Vesa           2024-01-29  3368  					  "msi4",
5eb83fc10289db0 Abel Vesa           2024-01-29  3369  					  "msi5",
5eb83fc10289db0 Abel Vesa           2024-01-29  3370  					  "msi6",
5eb83fc10289db0 Abel Vesa           2024-01-29  3371  					  "msi7";
5eb83fc10289db0 Abel Vesa           2024-01-29  3372  
5eb83fc10289db0 Abel Vesa           2024-01-29  3373  			#interrupt-cells = <1>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3374  			interrupt-map-mask = <0 0 0 0x7>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3375  			interrupt-map = <0 0 0 1 &intc 0 0 0 843 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3376  					<0 0 0 2 &intc 0 0 0 844 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3377  					<0 0 0 3 &intc 0 0 0 845 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3378  					<0 0 0 4 &intc 0 0 0 772 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3379  
5eb83fc10289db0 Abel Vesa           2024-01-29  3380  			clocks = <&gcc GCC_PCIE_6A_AUX_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3381  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3382  				 <&gcc GCC_PCIE_6A_MSTR_AXI_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3383  				 <&gcc GCC_PCIE_6A_SLV_AXI_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3384  				 <&gcc GCC_PCIE_6A_SLV_Q2A_AXI_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3385  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3386  				 <&gcc GCC_CNOC_PCIE_SOUTH_SF_AXI_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3387  			clock-names = "aux",
5eb83fc10289db0 Abel Vesa           2024-01-29  3388  				      "cfg",
5eb83fc10289db0 Abel Vesa           2024-01-29  3389  				      "bus_master",
5eb83fc10289db0 Abel Vesa           2024-01-29  3390  				      "bus_slave",
5eb83fc10289db0 Abel Vesa           2024-01-29  3391  				      "slave_q2a",
5eb83fc10289db0 Abel Vesa           2024-01-29  3392  				      "noc_aggr",
5eb83fc10289db0 Abel Vesa           2024-01-29  3393  				      "cnoc_sf_axi";
5eb83fc10289db0 Abel Vesa           2024-01-29  3394  
5eb83fc10289db0 Abel Vesa           2024-01-29  3395  			assigned-clocks = <&gcc GCC_PCIE_6A_AUX_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3396  			assigned-clock-rates = <19200000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3397  
5eb83fc10289db0 Abel Vesa           2024-01-29  3398  			interconnects = <&pcie_south_anoc MASTER_PCIE_6A QCOM_ICC_TAG_ALWAYS
5eb83fc10289db0 Abel Vesa           2024-01-29  3399  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  3400  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  3401  					 &cnoc_main SLAVE_PCIE_6A QCOM_ICC_TAG_ACTIVE_ONLY>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3402  			interconnect-names = "pcie-mem",
5eb83fc10289db0 Abel Vesa           2024-01-29  3403  					     "cpu-pcie";
5eb83fc10289db0 Abel Vesa           2024-01-29  3404  
5eb83fc10289db0 Abel Vesa           2024-01-29  3405  			resets = <&gcc GCC_PCIE_6A_BCR>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3406  				 <&gcc GCC_PCIE_6A_LINK_DOWN_BCR>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3407  			reset-names = "pci",
5eb83fc10289db0 Abel Vesa           2024-01-29  3408  				      "link_down";
5eb83fc10289db0 Abel Vesa           2024-01-29  3409  
5eb83fc10289db0 Abel Vesa           2024-01-29  3410  			power-domains = <&gcc GCC_PCIE_6A_GDSC>;
98abf2fbd179017 Johan Hovold        2024-07-22  3411  			required-opps = <&rpmhpd_opp_nom>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3412  
5eb83fc10289db0 Abel Vesa           2024-01-29  3413  			phys = <&pcie6a_phy>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3414  			phy-names = "pciephy";
5eb83fc10289db0 Abel Vesa           2024-01-29  3415  
5eb83fc10289db0 Abel Vesa           2024-01-29  3416  			status = "disabled";
5eb83fc10289db0 Abel Vesa           2024-01-29  3417  		};
5eb83fc10289db0 Abel Vesa           2024-01-29  3418  
5eb83fc10289db0 Abel Vesa           2024-01-29  3419  		pcie6a_phy: phy@1bfc000 {
837c333f46df8ce Abel Vesa           2024-10-09  3420  			compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy";
837c333f46df8ce Abel Vesa           2024-10-09  3421  			reg = <0 0x01bfc000 0 0x2000>,
837c333f46df8ce Abel Vesa           2024-10-09  3422  			      <0 0x01bfe000 0 0x2000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3423  
5eb83fc10289db0 Abel Vesa           2024-01-29  3424  			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3425  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
27727cb6604e099 Johan Hovold        2024-09-16  3426  				 <&tcsr TCSR_PCIE_4L_CLKREF_EN>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3427  				 <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>,
27727cb6604e099 Johan Hovold        2024-09-16  3428  				 <&gcc GCC_PCIE_6A_PIPE_CLK>,
27727cb6604e099 Johan Hovold        2024-09-16  3429  				 <&gcc GCC_PCIE_6A_PIPEDIV2_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3430  			clock-names = "aux",
5eb83fc10289db0 Abel Vesa           2024-01-29  3431  				      "cfg_ahb",
5eb83fc10289db0 Abel Vesa           2024-01-29  3432  				      "ref",
5eb83fc10289db0 Abel Vesa           2024-01-29  3433  				      "rchng",
27727cb6604e099 Johan Hovold        2024-09-16  3434  				      "pipe",
27727cb6604e099 Johan Hovold        2024-09-16  3435  				      "pipediv2";
5eb83fc10289db0 Abel Vesa           2024-01-29  3436  
5eb83fc10289db0 Abel Vesa           2024-01-29  3437  			resets = <&gcc GCC_PCIE_6A_PHY_BCR>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3438  				 <&gcc GCC_PCIE_6A_NOCSR_COM_PHY_BCR>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3439  			reset-names = "phy",
5eb83fc10289db0 Abel Vesa           2024-01-29  3440  				      "phy_nocsr";
5eb83fc10289db0 Abel Vesa           2024-01-29  3441  
5eb83fc10289db0 Abel Vesa           2024-01-29  3442  			assigned-clocks = <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3443  			assigned-clock-rates = <100000000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3444  
5eb83fc10289db0 Abel Vesa           2024-01-29  3445  			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3446  
837c333f46df8ce Abel Vesa           2024-10-09  3447  			qcom,4ln-config-sel = <&tcsr 0x1a000 0>;
837c333f46df8ce Abel Vesa           2024-10-09  3448  
5eb83fc10289db0 Abel Vesa           2024-01-29  3449  			#clock-cells = <0>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3450  			clock-output-names = "pcie6a_pipe_clk";
5eb83fc10289db0 Abel Vesa           2024-01-29  3451  
5eb83fc10289db0 Abel Vesa           2024-01-29  3452  			#phy-cells = <0>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3453  
5eb83fc10289db0 Abel Vesa           2024-01-29  3454  			status = "disabled";
5eb83fc10289db0 Abel Vesa           2024-01-29  3455  		};
5eb83fc10289db0 Abel Vesa           2024-01-29  3456  
62ab23e1550820e Johan Hovold        2024-07-22  3457  		pcie5: pci@1c00000 {
62ab23e1550820e Johan Hovold        2024-07-22  3458  			device_type = "pci";
62ab23e1550820e Johan Hovold        2024-07-22  3459  			compatible = "qcom,pcie-x1e80100";
62ab23e1550820e Johan Hovold        2024-07-22  3460  			reg = <0 0x01c00000 0 0x3000>,
62ab23e1550820e Johan Hovold        2024-07-22  3461  			      <0 0x7e000000 0 0xf1d>,
62ab23e1550820e Johan Hovold        2024-07-22  3462  			      <0 0x7e000f40 0 0xa8>,
62ab23e1550820e Johan Hovold        2024-07-22  3463  			      <0 0x7e001000 0 0x1000>,
62ab23e1550820e Johan Hovold        2024-07-22  3464  			      <0 0x7e100000 0 0x100000>,
62ab23e1550820e Johan Hovold        2024-07-22  3465  			      <0 0x01c03000 0 0x1000>;
62ab23e1550820e Johan Hovold        2024-07-22  3466  			reg-names = "parf",
62ab23e1550820e Johan Hovold        2024-07-22  3467  				    "dbi",
62ab23e1550820e Johan Hovold        2024-07-22  3468  				    "elbi",
62ab23e1550820e Johan Hovold        2024-07-22  3469  				    "atu",
62ab23e1550820e Johan Hovold        2024-07-22  3470  				    "config",
62ab23e1550820e Johan Hovold        2024-07-22  3471  				    "mhi";
62ab23e1550820e Johan Hovold        2024-07-22  3472  			#address-cells = <3>;
62ab23e1550820e Johan Hovold        2024-07-22  3473  			#size-cells = <2>;
62ab23e1550820e Johan Hovold        2024-07-22  3474  			ranges = <0x01000000 0x0 0x00000000 0x0 0x7e200000 0x0 0x100000>,
62ab23e1550820e Johan Hovold        2024-07-22  3475  				 <0x02000000 0x0 0x7e300000 0x0 0x7e300000 0x0 0x1d00000>;
62ab23e1550820e Johan Hovold        2024-07-22  3476  			bus-range = <0x00 0xff>;
62ab23e1550820e Johan Hovold        2024-07-22  3477  
62ab23e1550820e Johan Hovold        2024-07-22  3478  			dma-coherent;
62ab23e1550820e Johan Hovold        2024-07-22  3479  
62ab23e1550820e Johan Hovold        2024-07-22  3480  			linux,pci-domain = <5>;
62ab23e1550820e Johan Hovold        2024-07-22  3481  			num-lanes = <2>;
62ab23e1550820e Johan Hovold        2024-07-22  3482  
62ab23e1550820e Johan Hovold        2024-07-22  3483  			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3484  				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3485  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3486  				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3487  				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3488  				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3489  				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3490  				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
62ab23e1550820e Johan Hovold        2024-07-22  3491  			interrupt-names = "msi0",
62ab23e1550820e Johan Hovold        2024-07-22  3492  					  "msi1",
62ab23e1550820e Johan Hovold        2024-07-22  3493  					  "msi2",
62ab23e1550820e Johan Hovold        2024-07-22  3494  					  "msi3",
62ab23e1550820e Johan Hovold        2024-07-22  3495  					  "msi4",
62ab23e1550820e Johan Hovold        2024-07-22  3496  					  "msi5",
62ab23e1550820e Johan Hovold        2024-07-22  3497  					  "msi6",
62ab23e1550820e Johan Hovold        2024-07-22  3498  					  "msi7";
62ab23e1550820e Johan Hovold        2024-07-22  3499  
62ab23e1550820e Johan Hovold        2024-07-22  3500  			#interrupt-cells = <1>;
62ab23e1550820e Johan Hovold        2024-07-22  3501  			interrupt-map-mask = <0 0 0 0x7>;
62ab23e1550820e Johan Hovold        2024-07-22  3502  			interrupt-map = <0 0 0 1 &intc 0 0 0 70 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3503  					<0 0 0 2 &intc 0 0 0 71 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3504  					<0 0 0 3 &intc 0 0 0 72 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820e Johan Hovold        2024-07-22  3505  					<0 0 0 4 &intc 0 0 0 73 IRQ_TYPE_LEVEL_HIGH>;
62ab23e1550820e Johan Hovold        2024-07-22  3506  
62ab23e1550820e Johan Hovold        2024-07-22  3507  			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3508  				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3509  				 <&gcc GCC_PCIE_5_MSTR_AXI_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3510  				 <&gcc GCC_PCIE_5_SLV_AXI_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3511  				 <&gcc GCC_PCIE_5_SLV_Q2A_AXI_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3512  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3513  				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
62ab23e1550820e Johan Hovold        2024-07-22  3514  			clock-names = "aux",
62ab23e1550820e Johan Hovold        2024-07-22  3515  				      "cfg",
62ab23e1550820e Johan Hovold        2024-07-22  3516  				      "bus_master",
62ab23e1550820e Johan Hovold        2024-07-22  3517  				      "bus_slave",
62ab23e1550820e Johan Hovold        2024-07-22  3518  				      "slave_q2a",
62ab23e1550820e Johan Hovold        2024-07-22  3519  				      "noc_aggr",
62ab23e1550820e Johan Hovold        2024-07-22  3520  				      "cnoc_sf_axi";
62ab23e1550820e Johan Hovold        2024-07-22  3521  
62ab23e1550820e Johan Hovold        2024-07-22  3522  			assigned-clocks = <&gcc GCC_PCIE_5_AUX_CLK>;
62ab23e1550820e Johan Hovold        2024-07-22  3523  			assigned-clock-rates = <19200000>;
62ab23e1550820e Johan Hovold        2024-07-22  3524  
54376fe116ef69c Johan Hovold        2024-10-24  3525  			interconnects = <&pcie_north_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
62ab23e1550820e Johan Hovold        2024-07-22  3526  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  3527  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  3528  					 &cnoc_main SLAVE_PCIE_5 QCOM_ICC_TAG_ACTIVE_ONLY>;
62ab23e1550820e Johan Hovold        2024-07-22  3529  			interconnect-names = "pcie-mem",
62ab23e1550820e Johan Hovold        2024-07-22  3530  					     "cpu-pcie";
62ab23e1550820e Johan Hovold        2024-07-22  3531  
62ab23e1550820e Johan Hovold        2024-07-22  3532  			resets = <&gcc GCC_PCIE_5_BCR>,
62ab23e1550820e Johan Hovold        2024-07-22  3533  				 <&gcc GCC_PCIE_5_LINK_DOWN_BCR>;
62ab23e1550820e Johan Hovold        2024-07-22  3534  			reset-names = "pci",
62ab23e1550820e Johan Hovold        2024-07-22  3535  				      "link_down";
62ab23e1550820e Johan Hovold        2024-07-22  3536  
62ab23e1550820e Johan Hovold        2024-07-22  3537  			power-domains = <&gcc GCC_PCIE_5_GDSC>;
62ab23e1550820e Johan Hovold        2024-07-22  3538  			required-opps = <&rpmhpd_opp_nom>;
62ab23e1550820e Johan Hovold        2024-07-22  3539  
62ab23e1550820e Johan Hovold        2024-07-22  3540  			phys = <&pcie5_phy>;
62ab23e1550820e Johan Hovold        2024-07-22  3541  			phy-names = "pciephy";
62ab23e1550820e Johan Hovold        2024-07-22  3542  
62ab23e1550820e Johan Hovold        2024-07-22  3543  			status = "disabled";
62ab23e1550820e Johan Hovold        2024-07-22  3544  		};
62ab23e1550820e Johan Hovold        2024-07-22  3545  
62ab23e1550820e Johan Hovold        2024-07-22  3546  		pcie5_phy: phy@1c06000 {
62ab23e1550820e Johan Hovold        2024-07-22  3547  			compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy";
62ab23e1550820e Johan Hovold        2024-07-22  3548  			reg = <0 0x01c06000 0 0x2000>;
62ab23e1550820e Johan Hovold        2024-07-22  3549  
62ab23e1550820e Johan Hovold        2024-07-22  3550  			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
62ab23e1550820e Johan Hovold        2024-07-22  3551  				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
0b80b3c0f6d20f1 Johan Hovold        2024-09-16  3552  				 <&tcsr TCSR_PCIE_2L_5_CLKREF_EN>,
62ab23e1550820e Johan Hovold        2024-07-22  3553  				 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
0b80b3c0f6d20f1 Johan Hovold        2024-09-16  3554  				 <&gcc GCC_PCIE_5_PIPE_CLK>,
0b80b3c0f6d20f1 Johan Hovold        2024-09-16  3555  				 <&gcc GCC_PCIE_5_PIPEDIV2_CLK>;
62ab23e1550820e Johan Hovold        2024-07-22  3556  			clock-names = "aux",
62ab23e1550820e Johan Hovold        2024-07-22  3557  				      "cfg_ahb",
62ab23e1550820e Johan Hovold        2024-07-22  3558  				      "ref",
62ab23e1550820e Johan Hovold        2024-07-22  3559  				      "rchng",
0b80b3c0f6d20f1 Johan Hovold        2024-09-16  3560  				      "pipe",
0b80b3c0f6d20f1 Johan Hovold        2024-09-16  3561  				      "pipediv2";
62ab23e1550820e Johan Hovold        2024-07-22  3562  
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3563  			resets = <&gcc GCC_PCIE_5_PHY_BCR>,
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3564  				 <&gcc GCC_PCIE_5_NOCSR_COM_PHY_BCR>;
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3565  			reset-names = "phy",
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3566  				      "phy_nocsr";
62ab23e1550820e Johan Hovold        2024-07-22  3567  
62ab23e1550820e Johan Hovold        2024-07-22  3568  			assigned-clocks = <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>;
62ab23e1550820e Johan Hovold        2024-07-22  3569  			assigned-clock-rates = <100000000>;
62ab23e1550820e Johan Hovold        2024-07-22  3570  
62ab23e1550820e Johan Hovold        2024-07-22  3571  			power-domains = <&gcc GCC_PCIE_5_PHY_GDSC>;
62ab23e1550820e Johan Hovold        2024-07-22  3572  
62ab23e1550820e Johan Hovold        2024-07-22  3573  			#clock-cells = <0>;
62ab23e1550820e Johan Hovold        2024-07-22  3574  			clock-output-names = "pcie5_pipe_clk";
62ab23e1550820e Johan Hovold        2024-07-22  3575  
62ab23e1550820e Johan Hovold        2024-07-22  3576  			#phy-cells = <0>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3577  
5eb83fc10289db0 Abel Vesa           2024-01-29  3578  			status = "disabled";
5eb83fc10289db0 Abel Vesa           2024-01-29  3579  		};
5eb83fc10289db0 Abel Vesa           2024-01-29  3580  
5eb83fc10289db0 Abel Vesa           2024-01-29  3581  		pcie4: pci@1c08000 {
5eb83fc10289db0 Abel Vesa           2024-01-29  3582  			device_type = "pci";
5eb83fc10289db0 Abel Vesa           2024-01-29  3583  			compatible = "qcom,pcie-x1e80100";
5eb83fc10289db0 Abel Vesa           2024-01-29  3584  			reg = <0 0x01c08000 0 0x3000>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3585  			      <0 0x7c000000 0 0xf1d>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3586  			      <0 0x7c000f40 0 0xa8>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3587  			      <0 0x7c001000 0 0x1000>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3588  			      <0 0x7c100000 0 0x100000>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3589  			      <0 0x01c0b000 0 0x1000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3590  			reg-names = "parf",
5eb83fc10289db0 Abel Vesa           2024-01-29  3591  			            "dbi",
5eb83fc10289db0 Abel Vesa           2024-01-29  3592  				    "elbi",
5eb83fc10289db0 Abel Vesa           2024-01-29  3593  				    "atu",
5eb83fc10289db0 Abel Vesa           2024-01-29  3594  				    "config",
5eb83fc10289db0 Abel Vesa           2024-01-29  3595  				    "mhi";
5eb83fc10289db0 Abel Vesa           2024-01-29  3596  			#address-cells = <3>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3597  			#size-cells = <2>;
7af141850012415 Konrad Dybcio       2024-07-10  3598  			ranges = <0x01000000 0x0 0x00000000 0x0 0x7c200000 0x0 0x100000>,
7af141850012415 Konrad Dybcio       2024-07-10  3599  				 <0x02000000 0x0 0x7c300000 0x0 0x7c300000 0x0 0x1d00000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3600  			bus-range = <0x00 0xff>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3601  
5eb83fc10289db0 Abel Vesa           2024-01-29  3602  			dma-coherent;
5eb83fc10289db0 Abel Vesa           2024-01-29  3603  
f8fa1f2f6412bff Johan Hovold        2024-07-22  3604  			linux,pci-domain = <4>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3605  			num-lanes = <2>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3606  
9c4cd0aef259d41 Johan Hovold        2024-10-09  3607  			msi-map = <0x0 &gic_its 0xc0000 0x10000>;
9c4cd0aef259d41 Johan Hovold        2024-10-09  3608  
5eb83fc10289db0 Abel Vesa           2024-01-29  3609  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3610  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3611  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3612  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3613  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3614  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3615  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3616  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3617  			interrupt-names = "msi0",
5eb83fc10289db0 Abel Vesa           2024-01-29  3618  					  "msi1",
5eb83fc10289db0 Abel Vesa           2024-01-29  3619  					  "msi2",
5eb83fc10289db0 Abel Vesa           2024-01-29  3620  					  "msi3",
5eb83fc10289db0 Abel Vesa           2024-01-29  3621  					  "msi4",
5eb83fc10289db0 Abel Vesa           2024-01-29  3622  					  "msi5",
5eb83fc10289db0 Abel Vesa           2024-01-29  3623  					  "msi6",
5eb83fc10289db0 Abel Vesa           2024-01-29  3624  					  "msi7";
5eb83fc10289db0 Abel Vesa           2024-01-29  3625  
5eb83fc10289db0 Abel Vesa           2024-01-29  3626  			#interrupt-cells = <1>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3627  			interrupt-map-mask = <0 0 0 0x7>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3628  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3629  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3630  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3631  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3632  
5eb83fc10289db0 Abel Vesa           2024-01-29  3633  			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3634  				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3635  				 <&gcc GCC_PCIE_4_MSTR_AXI_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3636  				 <&gcc GCC_PCIE_4_SLV_AXI_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3637  				 <&gcc GCC_PCIE_4_SLV_Q2A_AXI_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3638  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3639  				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3640  			clock-names = "aux",
5eb83fc10289db0 Abel Vesa           2024-01-29  3641  				      "cfg",
5eb83fc10289db0 Abel Vesa           2024-01-29  3642  				      "bus_master",
5eb83fc10289db0 Abel Vesa           2024-01-29  3643  				      "bus_slave",
5eb83fc10289db0 Abel Vesa           2024-01-29  3644  				      "slave_q2a",
5eb83fc10289db0 Abel Vesa           2024-01-29  3645  				      "noc_aggr",
5eb83fc10289db0 Abel Vesa           2024-01-29  3646  				      "cnoc_sf_axi";
5eb83fc10289db0 Abel Vesa           2024-01-29  3647  
5eb83fc10289db0 Abel Vesa           2024-01-29  3648  			assigned-clocks = <&gcc GCC_PCIE_4_AUX_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3649  			assigned-clock-rates = <19200000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3650  
f3bba5eb46ddb8f Johan Hovold        2024-10-24  3651  			interconnects = <&pcie_north_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
5eb83fc10289db0 Abel Vesa           2024-01-29  3652  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  3653  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  3654  					 &cnoc_main SLAVE_PCIE_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3655  			interconnect-names = "pcie-mem",
5eb83fc10289db0 Abel Vesa           2024-01-29  3656  					     "cpu-pcie";
5eb83fc10289db0 Abel Vesa           2024-01-29  3657  
5eb83fc10289db0 Abel Vesa           2024-01-29  3658  			resets = <&gcc GCC_PCIE_4_BCR>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3659  				 <&gcc GCC_PCIE_4_LINK_DOWN_BCR>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3660  			reset-names = "pci",
5eb83fc10289db0 Abel Vesa           2024-01-29  3661  				      "link_down";
5eb83fc10289db0 Abel Vesa           2024-01-29  3662  
5eb83fc10289db0 Abel Vesa           2024-01-29  3663  			power-domains = <&gcc GCC_PCIE_4_GDSC>;
98abf2fbd179017 Johan Hovold        2024-07-22  3664  			required-opps = <&rpmhpd_opp_nom>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3665  
5eb83fc10289db0 Abel Vesa           2024-01-29  3666  			phys = <&pcie4_phy>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3667  			phy-names = "pciephy";
5eb83fc10289db0 Abel Vesa           2024-01-29  3668  
5eb83fc10289db0 Abel Vesa           2024-01-29  3669  			status = "disabled";
8bc7cb73df86444 Patrick Wildt       2024-07-15  3670  
8bc7cb73df86444 Patrick Wildt       2024-07-15  3671  			pcie4_port0: pcie@0 {
8bc7cb73df86444 Patrick Wildt       2024-07-15  3672  				device_type = "pci";
8bc7cb73df86444 Patrick Wildt       2024-07-15  3673  				reg = <0x0 0x0 0x0 0x0 0x0>;
8bc7cb73df86444 Patrick Wildt       2024-07-15  3674  				bus-range = <0x01 0xff>;
8bc7cb73df86444 Patrick Wildt       2024-07-15  3675  
8bc7cb73df86444 Patrick Wildt       2024-07-15  3676  				#address-cells = <3>;
8bc7cb73df86444 Patrick Wildt       2024-07-15  3677  				#size-cells = <2>;
8bc7cb73df86444 Patrick Wildt       2024-07-15  3678  				ranges;
8bc7cb73df86444 Patrick Wildt       2024-07-15  3679  			};
5eb83fc10289db0 Abel Vesa           2024-01-29  3680  		};
5eb83fc10289db0 Abel Vesa           2024-01-29  3681  
5eb83fc10289db0 Abel Vesa           2024-01-29  3682  		pcie4_phy: phy@1c0e000 {
5eb83fc10289db0 Abel Vesa           2024-01-29  3683  			compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy";
5eb83fc10289db0 Abel Vesa           2024-01-29  3684  			reg = <0 0x01c0e000 0 0x2000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3685  
5eb83fc10289db0 Abel Vesa           2024-01-29  3686  			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3687  				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
27727cb6604e099 Johan Hovold        2024-09-16  3688  				 <&tcsr TCSR_PCIE_2L_4_CLKREF_EN>,
5eb83fc10289db0 Abel Vesa           2024-01-29  3689  				 <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>,
27727cb6604e099 Johan Hovold        2024-09-16  3690  				 <&gcc GCC_PCIE_4_PIPE_CLK>,
27727cb6604e099 Johan Hovold        2024-09-16  3691  				 <&gcc GCC_PCIE_4_PIPEDIV2_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3692  			clock-names = "aux",
5eb83fc10289db0 Abel Vesa           2024-01-29  3693  				      "cfg_ahb",
5eb83fc10289db0 Abel Vesa           2024-01-29  3694  				      "ref",
5eb83fc10289db0 Abel Vesa           2024-01-29  3695  				      "rchng",
27727cb6604e099 Johan Hovold        2024-09-16  3696  				      "pipe",
27727cb6604e099 Johan Hovold        2024-09-16  3697  				      "pipediv2";
5eb83fc10289db0 Abel Vesa           2024-01-29  3698  
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3699  			resets = <&gcc GCC_PCIE_4_PHY_BCR>,
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3700  				 <&gcc GCC_PCIE_4_NOCSR_COM_PHY_BCR>;
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3701  			reset-names = "phy",
62ca6669d62eb55 Konrad Dybcio       2025-02-03  3702  				      "phy_nocsr";
5eb83fc10289db0 Abel Vesa           2024-01-29  3703  
5eb83fc10289db0 Abel Vesa           2024-01-29  3704  			assigned-clocks = <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3705  			assigned-clock-rates = <100000000>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3706  
5eb83fc10289db0 Abel Vesa           2024-01-29  3707  			power-domains = <&gcc GCC_PCIE_4_PHY_GDSC>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3708  
5eb83fc10289db0 Abel Vesa           2024-01-29  3709  			#clock-cells = <0>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3710  			clock-output-names = "pcie4_pipe_clk";
5eb83fc10289db0 Abel Vesa           2024-01-29  3711  
5eb83fc10289db0 Abel Vesa           2024-01-29  3712  			#phy-cells = <0>;
5eb83fc10289db0 Abel Vesa           2024-01-29  3713  
5eb83fc10289db0 Abel Vesa           2024-01-29  3714  			status = "disabled";
5eb83fc10289db0 Abel Vesa           2024-01-29  3715  		};
5eb83fc10289db0 Abel Vesa           2024-01-29  3716  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3717  		tcsr_mutex: hwlock@1f40000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3718  			compatible = "qcom,tcsr-mutex";
af16b00578a7a1d Rajendra Nayak      2023-12-05  3719  			reg = <0 0x01f40000 0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3720  			#hwlock-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3721  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3722  
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3723  		tcsr: clock-controller@1fc0000 {
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3724  			compatible = "qcom,x1e80100-tcsr", "syscon";
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3725  			reg = <0 0x01fc0000 0 0x30000>;
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3726  			clocks = <&rpmhcc RPMH_CXO_CLK>;
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3727  			#clock-cells = <1>;
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3728  			#reset-cells = <1>;
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3729  		};
8b6e2bf94b278c6 Abel Vesa           2024-01-29  3730  
721e38301b79a6e Akhil P Oommen      2024-06-29  3731  		gpu: gpu@3d00000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3732  			compatible = "qcom,adreno-43050c01", "qcom,adreno";
721e38301b79a6e Akhil P Oommen      2024-06-29  3733  			reg = <0x0 0x03d00000 0x0 0x40000>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3734  			      <0x0 0x03d9e000 0x0 0x1000>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3735  			      <0x0 0x03d61000 0x0 0x800>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3736  
721e38301b79a6e Akhil P Oommen      2024-06-29  3737  			reg-names = "kgsl_3d0_reg_memory",
721e38301b79a6e Akhil P Oommen      2024-06-29  3738  				    "cx_mem",
721e38301b79a6e Akhil P Oommen      2024-06-29  3739  				    "cx_dbgc";
721e38301b79a6e Akhil P Oommen      2024-06-29  3740  
721e38301b79a6e Akhil P Oommen      2024-06-29  3741  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3742  
721e38301b79a6e Akhil P Oommen      2024-06-29  3743  			iommus = <&adreno_smmu 0 0x0>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3744  				 <&adreno_smmu 1 0x0>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3745  
721e38301b79a6e Akhil P Oommen      2024-06-29  3746  			operating-points-v2 = <&gpu_opp_table>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3747  
721e38301b79a6e Akhil P Oommen      2024-06-29  3748  			qcom,gmu = <&gmu>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3749  			#cooling-cells = <2>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3750  
721e38301b79a6e Akhil P Oommen      2024-06-29  3751  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3752  			interconnect-names = "gfx-mem";
721e38301b79a6e Akhil P Oommen      2024-06-29  3753  
1f7574a1f9a892d Dmitry Baryshkov    2024-07-15  3754  			status = "disabled";
1f7574a1f9a892d Dmitry Baryshkov    2024-07-15  3755  
fbf5e007588f3f2 Konrad Dybcio       2025-02-03  3756  			gpu_zap_shader: zap-shader {
721e38301b79a6e Akhil P Oommen      2024-06-29  3757  				memory-region = <&gpu_microcode_mem>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3758  			};
721e38301b79a6e Akhil P Oommen      2024-06-29  3759  
721e38301b79a6e Akhil P Oommen      2024-06-29  3760  			gpu_opp_table: opp-table {
721e38301b79a6e Akhil P Oommen      2024-06-29  3761  				compatible = "operating-points-v2";
721e38301b79a6e Akhil P Oommen      2024-06-29  3762  
721e38301b79a6e Akhil P Oommen      2024-06-29  3763  				opp-1100000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3764  					opp-hz = /bits/ 64 <1100000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3765  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3766  					opp-peak-kBps = <16500000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3767  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3768  
721e38301b79a6e Akhil P Oommen      2024-06-29  3769  				opp-1000000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3770  					opp-hz = /bits/ 64 <1000000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3771  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3772  					opp-peak-kBps = <14398438>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3773  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3774  
721e38301b79a6e Akhil P Oommen      2024-06-29  3775  				opp-925000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3776  					opp-hz = /bits/ 64 <925000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3777  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3778  					opp-peak-kBps = <14398438>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3779  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3780  
721e38301b79a6e Akhil P Oommen      2024-06-29  3781  				opp-800000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3782  					opp-hz = /bits/ 64 <800000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3783  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3784  					opp-peak-kBps = <12449219>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3785  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3786  
721e38301b79a6e Akhil P Oommen      2024-06-29  3787  				opp-744000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3788  					opp-hz = /bits/ 64 <744000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3789  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3790  					opp-peak-kBps = <10687500>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3791  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3792  
721e38301b79a6e Akhil P Oommen      2024-06-29  3793  				opp-687000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3794  					opp-hz = /bits/ 64 <687000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3795  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3796  					opp-peak-kBps = <8171875>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3797  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3798  
721e38301b79a6e Akhil P Oommen      2024-06-29  3799  				opp-550000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3800  					opp-hz = /bits/ 64 <550000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3801  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3802  					opp-peak-kBps = <6074219>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3803  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3804  
721e38301b79a6e Akhil P Oommen      2024-06-29  3805  				opp-390000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3806  					opp-hz = /bits/ 64 <390000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3807  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3808  					opp-peak-kBps = <3000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3809  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3810  
721e38301b79a6e Akhil P Oommen      2024-06-29  3811  				opp-300000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3812  					opp-hz = /bits/ 64 <300000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3813  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3814  					opp-peak-kBps = <2136719>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3815  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3816  			};
721e38301b79a6e Akhil P Oommen      2024-06-29  3817  		};
721e38301b79a6e Akhil P Oommen      2024-06-29  3818  
721e38301b79a6e Akhil P Oommen      2024-06-29  3819  		gmu: gmu@3d6a000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3820  			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
721e38301b79a6e Akhil P Oommen      2024-06-29  3821  			reg = <0x0 0x03d6a000 0x0 0x35000>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3822  			      <0x0 0x03d50000 0x0 0x10000>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3823  			      <0x0 0x0b280000 0x0 0x10000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3824  			reg-names = "gmu", "rscc", "gmu_pdc";
721e38301b79a6e Akhil P Oommen      2024-06-29  3825  
721e38301b79a6e Akhil P Oommen      2024-06-29  3826  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3827  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3828  			interrupt-names = "hfi", "gmu";
721e38301b79a6e Akhil P Oommen      2024-06-29  3829  
721e38301b79a6e Akhil P Oommen      2024-06-29  3830  			clocks = <&gpucc GPU_CC_AHB_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3831  				 <&gpucc GPU_CC_CX_GMU_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3832  				 <&gpucc GPU_CC_CXO_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3833  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3834  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3835  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3836  				 <&gpucc GPU_CC_DEMET_CLK>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3837  			clock-names = "ahb",
721e38301b79a6e Akhil P Oommen      2024-06-29  3838  				      "gmu",
721e38301b79a6e Akhil P Oommen      2024-06-29  3839  				      "cxo",
721e38301b79a6e Akhil P Oommen      2024-06-29  3840  				      "axi",
721e38301b79a6e Akhil P Oommen      2024-06-29  3841  				      "memnoc",
721e38301b79a6e Akhil P Oommen      2024-06-29  3842  				      "hub",
721e38301b79a6e Akhil P Oommen      2024-06-29  3843  				      "demet";
721e38301b79a6e Akhil P Oommen      2024-06-29  3844  
721e38301b79a6e Akhil P Oommen      2024-06-29  3845  			power-domains = <&gpucc GPU_CX_GDSC>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3846  					<&gpucc GPU_GX_GDSC>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3847  			power-domain-names = "cx",
721e38301b79a6e Akhil P Oommen      2024-06-29  3848  					     "gx";
721e38301b79a6e Akhil P Oommen      2024-06-29  3849  
721e38301b79a6e Akhil P Oommen      2024-06-29  3850  			iommus = <&adreno_smmu 5 0x0>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3851  
721e38301b79a6e Akhil P Oommen      2024-06-29  3852  			qcom,qmp = <&aoss_qmp>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3853  
721e38301b79a6e Akhil P Oommen      2024-06-29  3854  			operating-points-v2 = <&gmu_opp_table>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3855  
721e38301b79a6e Akhil P Oommen      2024-06-29  3856  			gmu_opp_table: opp-table {
721e38301b79a6e Akhil P Oommen      2024-06-29  3857  				compatible = "operating-points-v2";
721e38301b79a6e Akhil P Oommen      2024-06-29  3858  
721e38301b79a6e Akhil P Oommen      2024-06-29  3859  				opp-550000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3860  					opp-hz = /bits/ 64 <550000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3861  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3862  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3863  
721e38301b79a6e Akhil P Oommen      2024-06-29  3864  				opp-220000000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3865  					opp-hz = /bits/ 64 <220000000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3866  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3867  				};
721e38301b79a6e Akhil P Oommen      2024-06-29  3868  			};
721e38301b79a6e Akhil P Oommen      2024-06-29  3869  		};
721e38301b79a6e Akhil P Oommen      2024-06-29  3870  
721e38301b79a6e Akhil P Oommen      2024-06-29  3871  		gpucc: clock-controller@3d90000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3872  			compatible = "qcom,x1e80100-gpucc";
721e38301b79a6e Akhil P Oommen      2024-06-29  3873  			reg = <0 0x03d90000 0 0xa000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3874  			clocks = <&bi_tcxo_div2>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3875  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3876  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3877  			#clock-cells = <1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3878  			#reset-cells = <1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3879  			#power-domain-cells = <1>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3880  		};
721e38301b79a6e Akhil P Oommen      2024-06-29  3881  
721e38301b79a6e Akhil P Oommen      2024-06-29  3882  		adreno_smmu: iommu@3da0000 {
721e38301b79a6e Akhil P Oommen      2024-06-29  3883  			compatible = "qcom,x1e80100-smmu-500", "qcom,adreno-smmu",
721e38301b79a6e Akhil P Oommen      2024-06-29  3884  				     "qcom,smmu-500", "arm,mmu-500";
721e38301b79a6e Akhil P Oommen      2024-06-29  3885  			reg = <0x0 0x03da0000 0x0 0x40000>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3886  			#iommu-cells = <2>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3887  			#global-interrupts = <1>;
dfbe93f32c12f56 Konrad Dybcio       2024-07-16  3888  			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3889  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3890  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3891  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3892  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3893  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3894  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3895  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3896  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3897  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3898  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3899  				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3900  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3901  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3902  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3903  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3904  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3905  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3906  				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3907  				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3908  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3909  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3910  				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3911  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3912  				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3913  				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3914  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3915  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3916  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
721e38301b79a6e Akhil P Oommen      2024-06-29  3917  				 <&gpucc GPU_CC_AHB_CLK>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3918  			clock-names = "hlos",
721e38301b79a6e Akhil P Oommen      2024-06-29  3919  				      "bus",
721e38301b79a6e Akhil P Oommen      2024-06-29  3920  				      "iface",
721e38301b79a6e Akhil P Oommen      2024-06-29  3921  				      "ahb";
721e38301b79a6e Akhil P Oommen      2024-06-29  3922  			power-domains = <&gpucc GPU_CX_GDSC>;
721e38301b79a6e Akhil P Oommen      2024-06-29  3923  			dma-coherent;
721e38301b79a6e Akhil P Oommen      2024-06-29  3924  		};
721e38301b79a6e Akhil P Oommen      2024-06-29  3925  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3926  		gem_noc: interconnect@26400000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3927  			compatible = "qcom,x1e80100-gem-noc";
af16b00578a7a1d Rajendra Nayak      2023-12-05  3928  			reg = <0 0x26400000 0 0x311200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3929  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3930  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3931  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3932  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3933  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3934  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3935  		nsp_noc: interconnect@320c0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  3936  			compatible = "qcom,x1e80100-nsp-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  3937  			reg = <0 0x320C0000 0 0xe080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3938  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3939  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3940  
af16b00578a7a1d Rajendra Nayak      2023-12-05  3941  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  3942  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  3943  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3944  		remoteproc_adsp: remoteproc@6800000 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  3945  			compatible = "qcom,x1e80100-adsp-pas";
7a003077366946a Krzysztof Kozlowski 2024-12-13  3946  			reg = <0x0 0x06800000 0x0 0x10000>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  3947  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3948  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  3949  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  3950  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  3951  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  3952  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3953  			interrupt-names = "wdog",
7a003077366946a Krzysztof Kozlowski 2024-12-13  3954  					  "fatal",
7a003077366946a Krzysztof Kozlowski 2024-12-13  3955  					  "ready",
7a003077366946a Krzysztof Kozlowski 2024-12-13  3956  					  "handover",
7a003077366946a Krzysztof Kozlowski 2024-12-13  3957  					  "stop-ack";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  3958  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3959  			clocks = <&rpmhcc RPMH_CXO_CLK>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3960  			clock-names = "xo";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  3961  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3962  			power-domains = <&rpmhpd RPMHPD_LCX>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  3963  					<&rpmhpd RPMHPD_LMX>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3964  			power-domain-names = "lcx",
7a003077366946a Krzysztof Kozlowski 2024-12-13  3965  					     "lmx";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  3966  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3967  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
7a003077366946a Krzysztof Kozlowski 2024-12-13  3968  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  3969  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3970  			memory-region = <&adspslpi_mem>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  3971  					<&q6_adsp_dtb_mem>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  3972  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3973  			qcom,qmp = <&aoss_qmp>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  3974  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3975  			qcom,smem-states = <&smp2p_adsp_out 0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3976  			qcom,smem-state-names = "stop";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  3977  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3978  			status = "disabled";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  3979  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3980  			glink-edge {
7a003077366946a Krzysztof Kozlowski 2024-12-13  3981  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
7a003077366946a Krzysztof Kozlowski 2024-12-13  3982  							     IPCC_MPROC_SIGNAL_GLINK_QMP
7a003077366946a Krzysztof Kozlowski 2024-12-13  3983  							     IRQ_TYPE_EDGE_RISING>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3984  				mboxes = <&ipcc IPCC_CLIENT_LPASS
7a003077366946a Krzysztof Kozlowski 2024-12-13  3985  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  3986  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3987  				label = "lpass";
7a003077366946a Krzysztof Kozlowski 2024-12-13  3988  				qcom,remote-pid = <2>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3989  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3990  				fastrpc {
7a003077366946a Krzysztof Kozlowski 2024-12-13  3991  					compatible = "qcom,fastrpc";
7a003077366946a Krzysztof Kozlowski 2024-12-13  3992  					qcom,glink-channels = "fastrpcglink-apps-dsp";
7a003077366946a Krzysztof Kozlowski 2024-12-13  3993  					label = "adsp";
7a003077366946a Krzysztof Kozlowski 2024-12-13  3994  					qcom,non-secure-domain;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3995  					#address-cells = <1>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3996  					#size-cells = <0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  3997  
7a003077366946a Krzysztof Kozlowski 2024-12-13  3998  					compute-cb@3 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  3999  						compatible = "qcom,fastrpc-compute-cb";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4000  						reg = <3>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4001  						iommus = <&apps_smmu 0x1003 0x80>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  4002  							 <&apps_smmu 0x1063 0x0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4003  						dma-coherent;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4004  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4005  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4006  					compute-cb@4 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4007  						compatible = "qcom,fastrpc-compute-cb";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4008  						reg = <4>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4009  						iommus = <&apps_smmu 0x1004 0x80>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  4010  							 <&apps_smmu 0x1064 0x0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4011  						dma-coherent;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4012  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4013  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4014  					compute-cb@5 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4015  						compatible = "qcom,fastrpc-compute-cb";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4016  						reg = <5>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4017  						iommus = <&apps_smmu 0x1005 0x80>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  4018  							 <&apps_smmu 0x1065 0x0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4019  						dma-coherent;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4020  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4021  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4022  					compute-cb@6 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4023  						compatible = "qcom,fastrpc-compute-cb";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4024  						reg = <6>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4025  						iommus = <&apps_smmu 0x1006 0x80>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  4026  							 <&apps_smmu 0x1066 0x0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4027  						dma-coherent;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4028  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4029  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4030  					compute-cb@7 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4031  						compatible = "qcom,fastrpc-compute-cb";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4032  						reg = <7>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4033  						iommus = <&apps_smmu 0x1007 0x80>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  4034  							 <&apps_smmu 0x1067 0x0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4035  						dma-coherent;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4036  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4037  				};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4038  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4039  				gpr {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4040  					compatible = "qcom,gpr";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4041  					qcom,glink-channels = "adsp_apps";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4042  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4043  					qcom,intents = <512 20>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4044  					#address-cells = <1>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4045  					#size-cells = <0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4046  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4047  					q6apm: service@1 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4048  						compatible = "qcom,q6apm";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4049  						reg = <GPR_APM_MODULE_IID>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4050  						#sound-dai-cells = <0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4051  						qcom,protection-domain = "avs/audio",
7a003077366946a Krzysztof Kozlowski 2024-12-13  4052  									 "msm/adsp/audio_pd";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4053  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4054  						q6apmbedai: bedais {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4055  							compatible = "qcom,q6apm-lpass-dais";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4056  							#sound-dai-cells = <1>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4057  						};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4058  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4059  						q6apmdai: dais {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4060  							compatible = "qcom,q6apm-dais";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4061  							iommus = <&apps_smmu 0x1001 0x80>,
7a003077366946a Krzysztof Kozlowski 2024-12-13  4062  								 <&apps_smmu 0x1061 0x0>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4063  						};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4064  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4065  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4066  					q6prm: service@2 {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4067  						compatible = "qcom,q6prm";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4068  						reg = <GPR_PRM_MODULE_IID>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4069  						qcom,protection-domain = "avs/audio",
7a003077366946a Krzysztof Kozlowski 2024-12-13  4070  									 "msm/adsp/audio_pd";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4071  
7a003077366946a Krzysztof Kozlowski 2024-12-13  4072  						q6prmcc: clock-controller {
7a003077366946a Krzysztof Kozlowski 2024-12-13  4073  							compatible = "qcom,q6prm-lpass-clocks";
7a003077366946a Krzysztof Kozlowski 2024-12-13  4074  							#clock-cells = <2>;
7a003077366946a Krzysztof Kozlowski 2024-12-13  4075  						};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4076  					};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4077  				};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4078  			};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4079  		};
7a003077366946a Krzysztof Kozlowski 2024-12-13  4080  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4081  		lpass_wsa2macro: codec@6aa0000 {
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4082  			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4083  			reg = <0 0x06aa0000 0 0x1000>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4084  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4085  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4086  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4087  				 <&lpass_vamacro>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4088  			clock-names = "mclk",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4089  				      "macro",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4090  				      "dcodec",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4091  				      "fsgen";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4092  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4093  			#clock-cells = <0>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4094  			clock-output-names = "wsa2-mclk";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4095  			#sound-dai-cells = <1>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4096  			sound-name-prefix = "WSA2";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4097  		};
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4098  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4099  		swr3: soundwire@6ab0000 {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4100  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4101  			reg = <0 0x06ab0000 0 0x10000>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4102  			clocks = <&lpass_wsa2macro>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4103  			clock-names = "iface";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4104  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4105  			label = "WSA2";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4106  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4107  			pinctrl-0 = <&wsa2_swr_active>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4108  			pinctrl-names = "default";
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4109  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA2_CGCR>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4110  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4111  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4112  			qcom,din-ports = <4>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4113  			qcom,dout-ports = <9>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4114  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4115  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4116  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4117  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4118  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4119  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4120  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4121  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4122  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4123  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4124  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4125  			#address-cells = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4126  			#size-cells = <0>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4127  			#sound-dai-cells = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4128  			status = "disabled";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4129  		};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4130  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4131  		lpass_rxmacro: codec@6ac0000 {
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4132  			compatible = "qcom,x1e80100-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4133  			reg = <0 0x06ac0000 0 0x1000>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4134  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4135  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4136  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4137  				 <&lpass_vamacro>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4138  			clock-names = "mclk",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4139  				      "macro",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4140  				      "dcodec",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4141  				      "fsgen";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4142  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4143  			#clock-cells = <0>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4144  			clock-output-names = "mclk";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4145  			#sound-dai-cells = <1>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4146  		};
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4147  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4148  		swr1: soundwire@6ad0000 {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4149  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4150  			reg = <0 0x06ad0000 0 0x10000>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4151  			clocks = <&lpass_rxmacro>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4152  			clock-names = "iface";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4153  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4154  			label = "RX";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4155  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4156  			pinctrl-0 = <&rx_swr_active>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4157  			pinctrl-names = "default";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4158  
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4159  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4160  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4161  			qcom,din-ports = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4162  			qcom,dout-ports = <11>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4163  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4164  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4165  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4166  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4167  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4168  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0x0f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4169  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
d4fac32cbe95046 Krzysztof Kozlowski 2024-02-27  4170  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0x01 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4171  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4172  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4173  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4174  			#address-cells = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4175  			#size-cells = <0>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4176  			#sound-dai-cells = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4177  			status = "disabled";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4178  		};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4179  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4180  		lpass_txmacro: codec@6ae0000 {
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4181  			compatible = "qcom,x1e80100-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4182  			reg = <0 0x06ae0000 0 0x1000>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4183  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4184  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4185  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4186  				 <&lpass_vamacro>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4187  			clock-names = "mclk",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4188  				      "macro",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4189  				      "dcodec",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4190  				      "fsgen";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4191  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4192  			#clock-cells = <0>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4193  			clock-output-names = "mclk";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4194  			#sound-dai-cells = <1>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4195  		};
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4196  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4197  		lpass_wsamacro: codec@6b00000 {
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4198  			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4199  			reg = <0 0x06b00000 0 0x1000>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4200  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4201  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4202  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4203  				 <&lpass_vamacro>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4204  			clock-names = "mclk",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4205  				      "macro",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4206  				      "dcodec",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4207  				      "fsgen";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4208  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4209  			#clock-cells = <0>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4210  			clock-output-names = "mclk";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4211  			#sound-dai-cells = <1>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4212  			sound-name-prefix = "WSA";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4213  		};
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4214  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4215  		swr0: soundwire@6b10000 {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4216  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4217  			reg = <0 0x06b10000 0 0x10000>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4218  			clocks = <&lpass_wsamacro>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4219  			clock-names = "iface";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4220  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4221  			label = "WSA";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4222  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4223  			pinctrl-0 = <&wsa_swr_active>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4224  			pinctrl-names = "default";
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4225  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4226  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4227  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4228  			qcom,din-ports = <4>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4229  			qcom,dout-ports = <9>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4230  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4231  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4232  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4233  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4234  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4235  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4236  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4237  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4238  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4239  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4240  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4241  			#address-cells = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4242  			#size-cells = <0>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4243  			#sound-dai-cells = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4244  			status = "disabled";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4245  		};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4246  
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4247  		lpass_audiocc: clock-controller@6b6c000 {
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4248  			compatible = "qcom,x1e80100-lpassaudiocc", "qcom,sc8280xp-lpassaudiocc";
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4249  			reg = <0 0x06b6c000 0 0x1000>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4250  			#clock-cells = <1>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4251  			#reset-cells = <1>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4252  		};
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4253  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4254  		swr2: soundwire@6d30000 {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4255  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4256  			reg = <0 0x06d30000 0 0x10000>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4257  			clocks = <&lpass_txmacro>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4258  			clock-names = "iface";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4259  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4260  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4261  			interrupt-names = "core", "wakeup";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4262  			label = "TX";
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4263  			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4264  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4265  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4266  			pinctrl-0 = <&tx_swr_active>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4267  			pinctrl-names = "default";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4268  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4269  			qcom,din-ports = <4>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4270  			qcom,dout-ports = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4271  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4272  			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4273  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4274  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4275  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4276  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4277  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4278  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4279  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4280  			qcom,ports-lane-control =	/bits/ 8 <0xff 0x00 0x00 0x01 0xff>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4281  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4282  			#address-cells = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4283  			#size-cells = <0>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4284  			#sound-dai-cells = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4285  			status = "disabled";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4286  		};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4287  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4288  		lpass_vamacro: codec@6d44000 {
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4289  			compatible = "qcom,x1e80100-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4290  			reg = <0 0x06d44000 0 0x1000>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4291  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4292  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4293  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4294  			clock-names = "mclk",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4295  				      "macro",
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4296  				      "dcodec";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4297  
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4298  			#clock-cells = <0>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4299  			clock-output-names = "fsgen";
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4300  			#sound-dai-cells = <1>;
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4301  		};
c6d6df1703d47c6 Krzysztof Kozlowski 2023-12-14  4302  
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4303  		lpass_tlmm: pinctrl@6e80000 {
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4304  			compatible = "qcom,x1e80100-lpass-lpi-pinctrl", "qcom,sm8550-lpass-lpi-pinctrl";
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4305  			reg = <0 0x06e80000 0 0x20000>,
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4306  			      <0 0x07250000 0 0x10000>;
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4307  
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4308  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4309  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4310  			clock-names = "core", "audio";
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4311  
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4312  			gpio-controller;
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4313  			#gpio-cells = <2>;
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4314  			gpio-ranges = <&lpass_tlmm 0 0 23>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4315  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4316  			tx_swr_active: tx-swr-active-state {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4317  				clk-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4318  					pins = "gpio0";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4319  					function = "swr_tx_clk";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4320  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4321  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4322  					bias-disable;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4323  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4324  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4325  				data-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4326  					pins = "gpio1", "gpio2";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4327  					function = "swr_tx_data";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4328  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4329  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4330  					bias-bus-hold;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4331  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4332  			};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4333  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4334  			rx_swr_active: rx-swr-active-state {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4335  				clk-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4336  					pins = "gpio3";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4337  					function = "swr_rx_clk";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4338  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4339  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4340  					bias-disable;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4341  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4342  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4343  				data-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4344  					pins = "gpio4", "gpio5";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4345  					function = "swr_rx_data";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4346  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4347  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4348  					bias-bus-hold;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4349  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4350  			};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4351  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4352  			dmic01_default: dmic01-default-state {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4353  				clk-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4354  					pins = "gpio6";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4355  					function = "dmic1_clk";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4356  					drive-strength = <8>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4357  					output-high;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4358  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4359  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4360  				data-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4361  					pins = "gpio7";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4362  					function = "dmic1_data";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4363  					drive-strength = <8>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4364  					input-enable;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4365  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4366  			};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4367  
8794916799d61f3 Krzysztof Kozlowski 2024-02-12  4368  			dmic23_default: dmic23-default-state {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4369  				clk-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4370  					pins = "gpio8";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4371  					function = "dmic2_clk";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4372  					drive-strength = <8>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4373  					output-high;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4374  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4375  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4376  				data-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4377  					pins = "gpio9";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4378  					function = "dmic2_data";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4379  					drive-strength = <8>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4380  					input-enable;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4381  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4382  			};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4383  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4384  			wsa_swr_active: wsa-swr-active-state {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4385  				clk-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4386  					pins = "gpio10";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4387  					function = "wsa_swr_clk";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4388  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4389  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4390  					bias-disable;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4391  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4392  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4393  				data-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4394  					pins = "gpio11";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4395  					function = "wsa_swr_data";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4396  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4397  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4398  					bias-bus-hold;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4399  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4400  			};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4401  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4402  			wsa2_swr_active: wsa2-swr-active-state {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4403  				clk-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4404  					pins = "gpio15";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4405  					function = "wsa2_swr_clk";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4406  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4407  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4408  					bias-disable;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4409  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4410  
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4411  				data-pins {
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4412  					pins = "gpio16";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4413  					function = "wsa2_swr_data";
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4414  					drive-strength = <2>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4415  					slew-rate = <1>;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4416  					bias-bus-hold;
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4417  				};
641a7e7e97b6cf6 Krzysztof Kozlowski 2023-12-14  4418  			};
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4419  		};
060df4cbfe111d9 Krzysztof Kozlowski 2023-12-12  4420  
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4421  		lpasscc: clock-controller@6ea0000 {
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4422  			compatible = "qcom,x1e80100-lpasscc", "qcom,sc8280xp-lpasscc";
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4423  			reg = <0 0x06ea0000 0 0x12000>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4424  			#clock-cells = <1>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4425  			#reset-cells = <1>;
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4426  		};
8c7dbbed27723c4 Srinivas Kandagatla 2024-06-24  4427  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4428  		lpass_ag_noc: interconnect@7e40000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  4429  			compatible = "qcom,x1e80100-lpass-ag-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  4430  			reg = <0 0x07e40000 0 0xe080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4431  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4432  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4433  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4434  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4435  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  4436  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4437  		lpass_lpiaon_noc: interconnect@7400000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  4438  			compatible = "qcom,x1e80100-lpass-lpiaon-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  4439  			reg = <0 0x07400000 0 0x19080>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4440  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4441  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4442  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4443  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4444  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  4445  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4446  		lpass_lpicx_noc: interconnect@7430000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  4447  			compatible = "qcom,x1e80100-lpass-lpicx-noc";
27302c7d8590995 Konrad Dybcio       2024-07-11  4448  			reg = <0 0x07430000 0 0x3A200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4449  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4450  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4451  
af16b00578a7a1d Rajendra Nayak      2023-12-05  4452  			#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  4453  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  4454  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4455  		sdhc_2: mmc@8804000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4456  			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4457  			reg = <0 0x08804000 0 0x1000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4458  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4459  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4460  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4461  			interrupt-names = "hc_irq", "pwr_irq";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4462  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4463  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4464  				 <&gcc GCC_SDCC2_APPS_CLK>,
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4465  				 <&rpmhcc RPMH_CXO_CLK>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4466  			clock-names = "iface", "core", "xo";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4467  			iommus = <&apps_smmu 0x520 0>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4468  			qcom,dll-config = <0x0007642c>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4469  			qcom,ddr-config = <0x80040868>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4470  			power-domains = <&rpmhpd RPMHPD_CX>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4471  			operating-points-v2 = <&sdhc2_opp_table>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4472  
fabdaa29f58124a Abel Vesa           2024-12-27  4473  			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
fabdaa29f58124a Abel Vesa           2024-12-27  4474  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
fabdaa29f58124a Abel Vesa           2024-12-27  4475  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
fabdaa29f58124a Abel Vesa           2024-12-27  4476  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4477  			interconnect-names = "sdhc-ddr", "cpu-sdhc";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4478  			bus-width = <4>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4479  			dma-coherent;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4480  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4481  			status = "disabled";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4482  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4483  			sdhc2_opp_table: opp-table {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4484  				compatible = "operating-points-v2";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4485  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4486  				opp-19200000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4487  					opp-hz = /bits/ 64 <19200000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4488  					required-opps = <&rpmhpd_opp_min_svs>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4489  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4490  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4491  				opp-50000000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4492  					opp-hz = /bits/ 64 <50000000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4493  					required-opps = <&rpmhpd_opp_low_svs>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4494  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4495  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4496  				opp-100000000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4497  					opp-hz = /bits/ 64 <100000000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4498  					required-opps = <&rpmhpd_opp_svs>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4499  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4500  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4501  				opp-202000000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4502  					opp-hz = /bits/ 64 <202000000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4503  					required-opps = <&rpmhpd_opp_svs_l1>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4504  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4505  			};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4506  		};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4507  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4508  		sdhc_4: mmc@8844000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4509  			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4510  			reg = <0 0x08844000 0 0x1000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4511  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4512  			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4513  				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4514  			interrupt-names = "hc_irq", "pwr_irq";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4515  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4516  			clocks = <&gcc GCC_SDCC4_AHB_CLK>,
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4517  				 <&gcc GCC_SDCC4_APPS_CLK>,
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4518  				 <&rpmhcc RPMH_CXO_CLK>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4519  			clock-names = "iface", "core", "xo";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4520  			iommus = <&apps_smmu 0x160 0>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4521  			qcom,dll-config = <0x0007642c>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4522  			qcom,ddr-config = <0x80040868>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4523  			power-domains = <&rpmhpd RPMHPD_CX>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4524  			operating-points-v2 = <&sdhc4_opp_table>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4525  
fabdaa29f58124a Abel Vesa           2024-12-27  4526  			interconnects = <&aggre2_noc MASTER_SDCC_4 QCOM_ICC_TAG_ALWAYS
fabdaa29f58124a Abel Vesa           2024-12-27  4527  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
fabdaa29f58124a Abel Vesa           2024-12-27  4528  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
fabdaa29f58124a Abel Vesa           2024-12-27  4529  					 &config_noc SLAVE_SDCC_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4530  			interconnect-names = "sdhc-ddr", "cpu-sdhc";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4531  			bus-width = <4>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4532  			dma-coherent;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4533  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4534  			status = "disabled";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4535  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4536  			sdhc4_opp_table: opp-table {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4537  				compatible = "operating-points-v2";
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4538  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4539  				opp-19200000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4540  					opp-hz = /bits/ 64 <19200000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4541  					required-opps = <&rpmhpd_opp_min_svs>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4542  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4543  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4544  				opp-50000000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4545  					opp-hz = /bits/ 64 <50000000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4546  					required-opps = <&rpmhpd_opp_low_svs>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4547  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4548  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4549  				opp-100000000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4550  					opp-hz = /bits/ 64 <100000000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4551  					required-opps = <&rpmhpd_opp_svs>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4552  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4553  
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4554  				opp-202000000 {
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4555  					opp-hz = /bits/ 64 <202000000>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4556  					required-opps = <&rpmhpd_opp_svs_l1>;
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4557  				};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4558  			};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4559  		};
ffb21c1e19b17f3 Abel Vesa           2024-12-12  4560  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4561  		usb_2_hsphy: phy@88e0000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4562  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4563  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4564  			reg = <0 0x088e0000 0 0x154>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4565  			#phy-cells = <0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4566  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4567  			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4568  			clock-names = "ref";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4569  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4570  			resets = <&gcc GCC_QUSB2PHY_USB20_HS_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4571  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4572  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4573  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4574  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4575  		usb_mp_hsphy0: phy@88e1000 {
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4576  			compatible = "qcom,x1e80100-snps-eusb2-phy",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4577  				     "qcom,sm8550-snps-eusb2-phy";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4578  			reg = <0 0x088e1000 0 0x154>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4579  			#phy-cells = <0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4580  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4581  			clocks = <&tcsr TCSR_USB3_MP0_CLKREF_EN>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4582  			clock-names = "ref";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4583  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4584  			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4585  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4586  			status = "disabled";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4587  		};
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4588  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4589  		usb_mp_hsphy1: phy@88e2000 {
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4590  			compatible = "qcom,x1e80100-snps-eusb2-phy",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4591  				     "qcom,sm8550-snps-eusb2-phy";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4592  			reg = <0 0x088e2000 0 0x154>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4593  			#phy-cells = <0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4594  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4595  			clocks = <&tcsr TCSR_USB3_MP1_CLKREF_EN>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4596  			clock-names = "ref";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4597  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4598  			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4599  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4600  			status = "disabled";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4601  		};
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4602  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4603  		usb_mp_qmpphy0: phy@88e3000 {
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4604  			compatible = "qcom,x1e80100-qmp-usb3-uni-phy";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4605  			reg = <0 0x088e3000 0 0x2000>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4606  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4607  			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4608  				 <&rpmhcc RPMH_CXO_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4609  				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4610  				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4611  			clock-names = "aux",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4612  				      "ref",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4613  				      "com_aux",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4614  				      "pipe";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4615  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4616  			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4617  				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4618  			reset-names = "phy",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4619  				      "phy_phy";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4620  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4621  			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4622  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4623  			#clock-cells = <0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4624  			clock-output-names = "usb_mp_phy0_pipe_clk";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4625  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4626  			#phy-cells = <0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4627  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4628  			status = "disabled";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4629  		};
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4630  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4631  		usb_mp_qmpphy1: phy@88e5000 {
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4632  			compatible = "qcom,x1e80100-qmp-usb3-uni-phy";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4633  			reg = <0 0x088e5000 0 0x2000>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4634  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4635  			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4636  				 <&rpmhcc RPMH_CXO_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4637  				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4638  				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4639  			clock-names = "aux",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4640  				      "ref",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4641  				      "com_aux",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4642  				      "pipe";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4643  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4644  			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4645  				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4646  			reset-names = "phy",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4647  				      "phy_phy";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4648  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4649  			power-domains = <&gcc GCC_USB3_MP_SS1_PHY_GDSC>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4650  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4651  			#clock-cells = <0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4652  			clock-output-names = "usb_mp_phy1_pipe_clk";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4653  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4654  			#phy-cells = <0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4655  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4656  			status = "disabled";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4657  		};
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4658  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4659  		usb_1_ss2: usb@a0f8800 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4660  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4661  			reg = <0 0x0a0f8800 0 0x400>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4662  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4663  			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4664  				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4665  				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4666  				 <&gcc GCC_USB30_TERT_SLEEP_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4667  				 <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4668  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4669  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4670  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4671  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4672  			clock-names = "cfg_noc",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4673  				      "core",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4674  				      "iface",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4675  				      "sleep",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4676  				      "mock_utmi",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4677  				      "noc_aggr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4678  				      "noc_aggr_north",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4679  				      "noc_aggr_south",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4680  				      "noc_sys";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4681  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4682  			assigned-clocks = <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4683  					  <&gcc GCC_USB30_TERT_MASTER_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4684  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4685  					       <200000000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4686  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4687  			interrupts-extended = <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4688  					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4689  					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4690  					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4691  			interrupt-names = "pwr_event",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4692  					  "dp_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4693  					  "dm_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4694  					  "ss_phy_irq";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4695  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4696  			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4697  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4698  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4699  			resets = <&gcc GCC_USB30_TERT_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4700  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4701  			interconnects = <&usb_south_anoc MASTER_USB3_2 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3a Abel Vesa           2024-01-29  4702  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  4703  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  4704  					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4705  			interconnect-names = "usb-ddr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4706  					     "apps-usb";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4707  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4708  			wakeup-source;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4709  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4710  			#address-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4711  			#size-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4712  			ranges;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4713  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4714  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4715  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4716  			usb_1_ss2_dwc3: usb@a000000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4717  				compatible = "snps,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4718  				reg = <0 0x0a000000 0 0xcd00>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4719  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4720  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4721  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4722  				iommus = <&apps_smmu 0x14a0 0x0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4723  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4724  				phys = <&usb_1_ss2_hsphy>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4725  				       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4726  				phy-names = "usb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4727  				            "usb3-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4728  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4729  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4730  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4731  				snps,usb3_lpm_capable;
9555a30e5f5d6fe Prashanth K         2024-12-31  4732  				snps,dis-u1-entry-quirk;
9555a30e5f5d6fe Prashanth K         2024-12-31  4733  				snps,dis-u2-entry-quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4734  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4735  				dma-coherent;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4736  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4737  				ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4738  					#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4739  					#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4740  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4741  					port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4742  						reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4743  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4744  						usb_1_ss2_dwc3_hs: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4745  						};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4746  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4747  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4748  					port@1 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4749  						reg = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4750  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4751  						usb_1_ss2_dwc3_ss: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4752  							remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4753  						};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4754  					};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4755  				};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4756  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4757  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4758  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4759  		usb_2: usb@a2f8800 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4760  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4761  			reg = <0 0x0a2f8800 0 0x400>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4762  			#address-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4763  			#size-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4764  			ranges;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4765  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4766  			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4767  				 <&gcc GCC_USB20_MASTER_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4768  				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4769  				 <&gcc GCC_USB20_SLEEP_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4770  				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4771  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4772  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4773  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4774  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4775  			clock-names = "cfg_noc",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4776  				      "core",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4777  				      "iface",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4778  				      "sleep",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4779  				      "mock_utmi",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4780  				      "noc_aggr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4781  				      "noc_aggr_north",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4782  				      "noc_aggr_south",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4783  				      "noc_sys";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4784  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4785  			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4786  					  <&gcc GCC_USB20_MASTER_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4787  			assigned-clock-rates = <19200000>, <200000000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4788  
680421056216efe Abel Vesa           2025-01-07  4789  			interrupts-extended = <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4790  					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4791  					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4792  			interrupt-names = "pwr_event",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4793  					  "dp_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4794  					  "dm_hs_phy_irq";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4795  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4796  			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4797  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4798  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4799  			resets = <&gcc GCC_USB20_PRIM_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4800  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4801  			interconnects = <&usb_north_anoc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3a Abel Vesa           2024-01-29  4802  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  4803  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  4804  					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ACTIVE_ONLY>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4805  			interconnect-names = "usb-ddr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4806  					     "apps-usb";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4807  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4808  			wakeup-source;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4809  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4810  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4811  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4812  			usb_2_dwc3: usb@a200000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4813  				compatible = "snps,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4814  				reg = <0 0x0a200000 0 0xcd00>;
680421056216efe Abel Vesa           2025-01-07  4815  				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4816  				iommus = <&apps_smmu 0x14e0 0x0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4817  				phys = <&usb_2_hsphy>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4818  				phy-names = "usb2-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4819  				maximum-speed = "high-speed";
9555a30e5f5d6fe Prashanth K         2024-12-31  4820  				snps,dis-u1-entry-quirk;
9555a30e5f5d6fe Prashanth K         2024-12-31  4821  				snps,dis-u2-entry-quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4822  
45bd6ff900cfe50 Mark Kettenis       2025-01-09  4823  				dma-coherent;
45bd6ff900cfe50 Mark Kettenis       2025-01-09  4824  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4825  				ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4826  					#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4827  					#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4828  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4829  					port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4830  						reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4831  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4832  						usb_2_dwc3_hs: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4833  						};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4834  					};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4835  				};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4836  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4837  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  4838  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4839  		usb_mp: usb@a4f8800 {
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4840  			compatible = "qcom,x1e80100-dwc3-mp", "qcom,dwc3";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4841  			reg = <0 0x0a4f8800 0 0x400>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4842  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4843  			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4844  				 <&gcc GCC_USB30_MP_MASTER_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4845  				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4846  				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4847  				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4848  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4849  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4850  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4851  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4852  			clock-names = "cfg_noc",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4853  				      "core",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4854  				      "iface",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4855  				      "sleep",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4856  				      "mock_utmi",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4857  				      "noc_aggr",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4858  				      "noc_aggr_north",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4859  				      "noc_aggr_south",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4860  				      "noc_sys";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4861  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4862  			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4863  					  <&gcc GCC_USB30_MP_MASTER_CLK>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4864  			assigned-clock-rates = <19200000>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4865  					       <200000000>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4866  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4867  			interrupts-extended = <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4868  					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4869  					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4870  					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4871  					      <&pdc 52 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4872  					      <&pdc 51 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4873  					      <&pdc 54 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4874  					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4875  					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4876  					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4877  			interrupt-names = "pwr_event_1", "pwr_event_2",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4878  					  "hs_phy_1",	 "hs_phy_2",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4879  					  "dp_hs_phy_1", "dm_hs_phy_1",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4880  					  "dp_hs_phy_2", "dm_hs_phy_2",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4881  					  "ss_phy_1",	 "ss_phy_2";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4882  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4883  			power-domains = <&gcc GCC_USB30_MP_GDSC>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4884  			required-opps = <&rpmhpd_opp_nom>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4885  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4886  			resets = <&gcc GCC_USB30_MP_BCR>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4887  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4888  			interconnects = <&usb_north_anoc MASTER_USB3_MP QCOM_ICC_TAG_ALWAYS
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4889  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  4890  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  4891  					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ACTIVE_ONLY>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4892  			interconnect-names = "usb-ddr",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4893  					     "apps-usb";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4894  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4895  			wakeup-source;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4896  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4897  			#address-cells = <2>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4898  			#size-cells = <2>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4899  			ranges;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4900  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4901  			status = "disabled";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4902  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4903  			usb_mp_dwc3: usb@a400000 {
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4904  				compatible = "snps,dwc3";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4905  				reg = <0 0x0a400000 0 0xcd00>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4906  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4907  				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4908  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4909  				iommus = <&apps_smmu 0x1400 0x0>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4910  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4911  				phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4912  				       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4913  				phy-names = "usb2-0", "usb3-0",
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4914  					    "usb2-1", "usb3-1";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4915  				dr_mode = "host";
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4916  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4917  				snps,dis_u2_susphy_quirk;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4918  				snps,dis_enblslpm_quirk;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4919  				snps,usb3_lpm_capable;
9555a30e5f5d6fe Prashanth K         2024-12-31  4920  				snps,dis-u1-entry-quirk;
9555a30e5f5d6fe Prashanth K         2024-12-31  4921  				snps,dis-u2-entry-quirk;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4922  
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4923  				dma-coherent;
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4924  			};
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4925  		};
5c5edbf46177e63 Konrad Dybcio       2024-08-20  4926  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4927  		usb_1_ss0: usb@a6f8800 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4928  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4929  			reg = <0 0x0a6f8800 0 0x400>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4930  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4931  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4932  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4933  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4934  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4935  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4936  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4937  				 <&gcc GCC_CFG_NOC_USB_ANOC_NORTH_AHB_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4938  				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4939  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4940  			clock-names = "cfg_noc",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4941  				      "core",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4942  				      "iface",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4943  				      "sleep",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4944  				      "mock_utmi",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4945  				      "noc_aggr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4946  				      "noc_aggr_north",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4947  				      "noc_aggr_south",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4948  				      "noc_sys";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4949  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4950  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4951  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4952  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4953  					       <200000000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4954  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4955  			interrupts-extended = <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4956  					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4957  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4958  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4959  			interrupt-names = "pwr_event",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4960  					  "dp_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4961  					  "dm_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4962  					  "ss_phy_irq";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4963  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4964  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4965  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4966  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4967  			resets = <&gcc GCC_USB30_PRIM_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4968  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4969  			wakeup-source;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4970  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4971  			#address-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4972  			#size-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4973  			ranges;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4974  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4975  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4976  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4977  			usb_1_ss0_dwc3: usb@a600000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  4978  				compatible = "snps,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4979  				reg = <0 0x0a600000 0 0xcd00>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4980  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4981  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4982  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4983  				iommus = <&apps_smmu 0x1420 0x0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4984  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4985  				phys = <&usb_1_ss0_hsphy>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  4986  				       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4987  				phy-names = "usb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  4988  					    "usb3-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  4989  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4990  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4991  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4992  				snps,usb3_lpm_capable;
9555a30e5f5d6fe Prashanth K         2024-12-31  4993  				snps,dis-u1-entry-quirk;
9555a30e5f5d6fe Prashanth K         2024-12-31  4994  				snps,dis-u2-entry-quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4995  
4af46b7bd66fa3a Abel Vesa           2024-01-29  4996  				dma-coherent;
4af46b7bd66fa3a Abel Vesa           2024-01-29  4997  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4998  				ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  4999  					#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5000  					#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5001  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5002  					port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5003  						reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5004  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5005  						usb_1_ss0_dwc3_hs: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5006  						};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5007  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5008  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5009  					port@1 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5010  						reg = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5011  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5012  						usb_1_ss0_dwc3_ss: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5013  							remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5014  						};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5015  					};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5016  				};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5017  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5018  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5019  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5020  		usb_1_ss1: usb@a8f8800 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  5021  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5022  			reg = <0 0x0a8f8800 0 0x400>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5023  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5024  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5025  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5026  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5027  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5028  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5029  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5030  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5031  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5032  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5033  			clock-names = "cfg_noc",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5034  				      "core",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5035  				      "iface",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5036  				      "sleep",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5037  				      "mock_utmi",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5038  				      "noc_aggr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5039  				      "noc_aggr_north",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5040  				      "noc_aggr_south",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5041  				      "noc_sys";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5042  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5043  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5044  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5045  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5046  					       <200000000>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5047  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5048  			interrupts-extended = <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5049  					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5050  					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5051  					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5052  			interrupt-names = "pwr_event",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5053  					  "dp_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5054  					  "dm_hs_phy_irq",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5055  					  "ss_phy_irq";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5056  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5057  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5058  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5059  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5060  			resets = <&gcc GCC_USB30_SEC_BCR>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5061  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5062  			interconnects = <&usb_south_anoc MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3a Abel Vesa           2024-01-29  5063  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  5064  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  5065  					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5066  			interconnect-names = "usb-ddr",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5067  					     "apps-usb";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5068  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5069  			wakeup-source;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5070  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5071  			#address-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5072  			#size-cells = <2>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5073  			ranges;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5074  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5075  			status = "disabled";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5076  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5077  			usb_1_ss1_dwc3: usb@a800000 {
4af46b7bd66fa3a Abel Vesa           2024-01-29  5078  				compatible = "snps,dwc3";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5079  				reg = <0 0x0a800000 0 0xcd00>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5080  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5081  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5082  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5083  				iommus = <&apps_smmu 0x1460 0x0>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5084  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5085  				phys = <&usb_1_ss1_hsphy>,
4af46b7bd66fa3a Abel Vesa           2024-01-29  5086  				       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5087  				phy-names = "usb2-phy",
4af46b7bd66fa3a Abel Vesa           2024-01-29  5088  					    "usb3-phy";
4af46b7bd66fa3a Abel Vesa           2024-01-29  5089  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5090  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5091  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5092  				snps,usb3_lpm_capable;
9555a30e5f5d6fe Prashanth K         2024-12-31  5093  				snps,dis-u1-entry-quirk;
9555a30e5f5d6fe Prashanth K         2024-12-31  5094  				snps,dis-u2-entry-quirk;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5095  
4af46b7bd66fa3a Abel Vesa           2024-01-29  5096  				dma-coherent;
4af46b7bd66fa3a Abel Vesa           2024-01-29  5097  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5098  				ports {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5099  					#address-cells = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5100  					#size-cells = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5101  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5102  					port@0 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5103  						reg = <0>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5104  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5105  						usb_1_ss1_dwc3_hs: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5106  						};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5107  					};
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5108  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5109  					port@1 {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5110  						reg = <1>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5111  
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5112  						usb_1_ss1_dwc3_ss: endpoint {
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5113  							remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
b73ed308f9f6949 Dmitry Baryshkov    2024-05-12  5114  						};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5115  					};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5116  				};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5117  			};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5118  		};
4af46b7bd66fa3a Abel Vesa           2024-01-29  5119  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5120  		cci0: cci@ac15000 {
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5121  			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5122  			reg = <0 0x0ac15000 0 0x1000>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5123  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5124  			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5125  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5126  			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5127  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5128  				 <&camcc CAM_CC_CCI_0_CLK>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5129  			clock-names = "camnoc_axi",
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5130  				      "cpas_ahb",
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5131  				      "cci";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5132  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5133  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5134  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5135  			pinctrl-0 = <&cci0_default>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5136  			pinctrl-1 = <&cci0_sleep>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5137  			pinctrl-names = "default", "sleep";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5138  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5139  			#address-cells = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5140  			#size-cells = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5141  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5142  			status = "disabled";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5143  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5144  			cci0_i2c0: i2c-bus@0 {
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5145  				reg = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5146  				clock-frequency = <1000000>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5147  				#address-cells = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5148  				#size-cells = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5149  			};
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5150  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5151  			cci0_i2c1: i2c-bus@1 {
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5152  				reg = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5153  				clock-frequency = <1000000>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5154  				#address-cells = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5155  				#size-cells = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5156  			};
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5157  		};
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5158  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5159  		cci1: cci@ac16000 {
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5160  			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5161  			reg = <0 0x0ac16000 0 0x1000>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5162  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5163  			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5164  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5165  			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5166  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5167  				 <&camcc CAM_CC_CCI_1_CLK>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5168  			clock-names = "camnoc_axi",
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5169  				      "cpas_ahb",
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5170  				      "cci";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5171  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5172  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5173  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5174  			pinctrl-0 = <&cci1_default>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5175  			pinctrl-1 = <&cci1_sleep>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5176  			pinctrl-names = "default", "sleep";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5177  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5178  			#address-cells = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5179  			#size-cells = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5180  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5181  			status = "disabled";
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5182  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5183  			cci1_i2c0: i2c-bus@0 {
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5184  				reg = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5185  				clock-frequency = <1000000>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5186  				#address-cells = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5187  				#size-cells = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5188  			};
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5189  
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5190  			cci1_i2c1: i2c-bus@1 {
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5191  				reg = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5192  				clock-frequency = <1000000>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5193  				#address-cells = <1>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5194  				#size-cells = <0>;
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5195  			};
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5196  		};
9884b939230ca6c Bryan O'Donoghue    2025-03-14  5197  
c8388addd09f50e Bryan O'Donoghue    2025-03-14 @5198  		camss: isp@acb6000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
