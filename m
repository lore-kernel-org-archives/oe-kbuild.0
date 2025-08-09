Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAD1D8DFB
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 07:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754723762; cv=none; b=HQT3BnDLQFK/QFRlh2cGq5TnJl6rebbWVVoXI4ApKUvjN9dgE+xLSGpbDM18UXsfzxM7y9h+igIjVGPulXZtkKDDlYNfKaOhIzGeq0OKWvE6wIUAcZRzHZiUgAz1198gh8ws3x7Eez9U0L7VRDh2gRllLq/yuw6xA20oDKBphMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754723762; c=relaxed/simple;
	bh=OBqQnaM1UnerPn7nCF/XXwe+Y2Lbbmx26RSQEPdFSAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awrQWK7TcLLQ2iJT3LUP4EtNCIexKg94sHVdRK4xvtK0M3vrDDgs7/SlD2zgfOHNq2OkhSVDFtZa3B9E094INiJO8HPqOlbFWUnjFcxwJ3Ps6V3Smmd5PL2N4oM80J/KrDUs9qwb3VqjuCnTAB7EiDdPORP2KM6yPs3kDRU0slE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oITA1dq5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oITA1dq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754723754; x=1786259754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBqQnaM1UnerPn7nCF/XXwe+Y2Lbbmx26RSQEPdFSAA=;
  b=oITA1dq5IZZjbOXeHahy6AFkT41cGxukhj3Twh6MLgCX5jEtB6B4pE2r
   KKLFQACPoCs2v0hAaMNLaW/YloQIBFjdGKlIG1K6tS/fGx/KWHBzHarBC
   BFMvYJ9yFxp6hayRsym2snUySLInaKGGLE4hW3/usPQFLTiEFxfNMzplt
   /edQghHhc67hLy4U7QXImyOfEETcHM08uAcp2MQ1HKhCMpQGLJ+FT1F/X
   BIsfyN9V1mm6dL78zdvqoAuk7beewMr5YjGJ1CFFlB82abckkN7YbaIgT
   b5pMp5zvj3wXOn/9Bg9gah4KXaZqMdpI/J/sOaOmy5vEnf+j+cLkIXRrE
   A==;
X-CSE-ConnectionGUID: cGLbhTHuTe2rbtxJx8Yb2Q==
X-CSE-MsgGUID: ZhUc3IR+TMuIhMKAmTdhHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56265874"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56265874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 00:15:53 -0700
X-CSE-ConnectionGUID: fGX+NDmoQRSPpIlz3DHzWQ==
X-CSE-MsgGUID: UoOolIk9TyCfYkdkmLmT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169939054"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Aug 2025 00:15:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukdnx-0004b2-16;
	Sat, 09 Aug 2025 07:15:49 +0000
Date: Sat, 9 Aug 2025 15:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
Message-ID: <202508091405.wWM6LReo-lkp@intel.com>
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
In-Reply-To: <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
References: <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
TO: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
TO: Georgi Djakov <djakov@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
CC: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Mike Tipton <mike.tipton@oss.qualcomm.com>

Hi Odelu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Odelu-Kukatla/dt-bindings-interconnect-add-clocks-property-to-enable-QoS-on-sa8775p/20250808-220708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250808140300.14784-4-odelu.kukatla%40oss.qualcomm.com
patch subject: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS configuration
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-001-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091405.wWM6LReo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091405.wWM6LReo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091405.wWM6LReo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:2400.37-2405.5: Warning (simple_bus_reg): /soc@0/interconnect@01680000: simple-bus unit address format error, expected "1680000"

vim +/1680000 +2400 arch/arm64/boot/dts/qcom/sa8775p.dtsi

603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    20  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    21  / {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    22  	interrupt-parent = <&intc>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    23  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    24  	#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    25  	#size-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    26  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    27  	clocks {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    28  		xo_board_clk: xo-board-clk {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    29  			compatible = "fixed-clock";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    30  			#clock-cells = <0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    31  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    32  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    33  		sleep_clk: sleep-clk {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    34  			compatible = "fixed-clock";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    35  			#clock-cells = <0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    36  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    37  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    38  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    39  	cpus {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    40  		#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    41  		#size-cells = <0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    42  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    43  		cpu0: cpu@0 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    44  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    45  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    46  			reg = <0x0 0x0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    47  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12    48  			power-domains = <&cpu_pd0>;
736f50489e08ba Maulik Shah         2024-11-12    49  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21    50  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    51  			next-level-cache = <&l2_0>;
717ca334afd7ce Ankit Sharma        2024-07-31    52  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31    53  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    54  			l2_0: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    55  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    56  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    57  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    58  				next-level-cache = <&l3_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    59  				l3_0: l3-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    60  					compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    61  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    62  					cache-unified;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    63  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    64  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    65  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    66  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    67  		cpu1: cpu@100 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    68  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    69  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    70  			reg = <0x0 0x100>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    71  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12    72  			power-domains = <&cpu_pd1>;
736f50489e08ba Maulik Shah         2024-11-12    73  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21    74  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    75  			next-level-cache = <&l2_1>;
717ca334afd7ce Ankit Sharma        2024-07-31    76  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31    77  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    78  			l2_1: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    79  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    80  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    81  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    82  				next-level-cache = <&l3_0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    83  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    84  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    85  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    86  		cpu2: cpu@200 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    87  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    88  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    89  			reg = <0x0 0x200>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    90  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12    91  			power-domains = <&cpu_pd2>;
736f50489e08ba Maulik Shah         2024-11-12    92  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21    93  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    94  			next-level-cache = <&l2_2>;
717ca334afd7ce Ankit Sharma        2024-07-31    95  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31    96  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    97  			l2_2: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14    98  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16    99  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   100  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   101  				next-level-cache = <&l3_0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   102  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   103  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   104  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   105  		cpu3: cpu@300 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   106  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   107  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   108  			reg = <0x0 0x300>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   109  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12   110  			power-domains = <&cpu_pd3>;
736f50489e08ba Maulik Shah         2024-11-12   111  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21   112  			qcom,freq-domain = <&cpufreq_hw 0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   113  			next-level-cache = <&l2_3>;
717ca334afd7ce Ankit Sharma        2024-07-31   114  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31   115  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   116  			l2_3: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   117  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   118  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   119  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   120  				next-level-cache = <&l3_0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   121  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   122  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   123  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   124  		cpu4: cpu@10000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   125  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   126  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   127  			reg = <0x0 0x10000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   128  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12   129  			power-domains = <&cpu_pd4>;
736f50489e08ba Maulik Shah         2024-11-12   130  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21   131  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   132  			next-level-cache = <&l2_4>;
717ca334afd7ce Ankit Sharma        2024-07-31   133  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31   134  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   135  			l2_4: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   136  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   137  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   138  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   139  				next-level-cache = <&l3_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   140  				l3_1: l3-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   141  					compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   142  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   143  					cache-unified;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   144  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   145  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   146  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   147  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   148  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   149  		cpu5: cpu@10100 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   150  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   151  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   152  			reg = <0x0 0x10100>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   153  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12   154  			power-domains = <&cpu_pd5>;
736f50489e08ba Maulik Shah         2024-11-12   155  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21   156  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   157  			next-level-cache = <&l2_5>;
717ca334afd7ce Ankit Sharma        2024-07-31   158  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31   159  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   160  			l2_5: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   161  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   162  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   163  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   164  				next-level-cache = <&l3_1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   165  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   166  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   167  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   168  		cpu6: cpu@10200 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   169  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   170  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   171  			reg = <0x0 0x10200>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   172  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12   173  			power-domains = <&cpu_pd6>;
736f50489e08ba Maulik Shah         2024-11-12   174  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21   175  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   176  			next-level-cache = <&l2_6>;
717ca334afd7ce Ankit Sharma        2024-07-31   177  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31   178  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   179  			l2_6: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   180  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   181  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   182  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   183  				next-level-cache = <&l3_1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   184  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   185  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   186  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   187  		cpu7: cpu@10300 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   188  			device_type = "cpu";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   189  			compatible = "qcom,kryo";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   190  			reg = <0x0 0x10300>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   191  			enable-method = "psci";
736f50489e08ba Maulik Shah         2024-11-12   192  			power-domains = <&cpu_pd7>;
736f50489e08ba Maulik Shah         2024-11-12   193  			power-domain-names = "psci";
5d793ff40692c9 Bartosz Golaszewski 2023-02-21   194  			qcom,freq-domain = <&cpufreq_hw 1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   195  			next-level-cache = <&l2_7>;
717ca334afd7ce Ankit Sharma        2024-07-31   196  			capacity-dmips-mhz = <1024>;
717ca334afd7ce Ankit Sharma        2024-07-31   197  			dynamic-power-coefficient = <100>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   198  			l2_7: l2-cache {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   199  				compatible = "cache";
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   200  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski 2023-04-16   201  				cache-unified;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   202  				next-level-cache = <&l3_1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   203  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   204  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   205  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   206  		cpu-map {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   207  			cluster0 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   208  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   209  					cpu = <&cpu0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   210  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   211  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   212  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   213  					cpu = <&cpu1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   214  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   215  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   216  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   217  					cpu = <&cpu2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   218  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   219  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   220  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   221  					cpu = <&cpu3>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   222  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   223  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   224  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   225  			cluster1 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   226  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   227  					cpu = <&cpu4>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   228  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   229  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   230  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   231  					cpu = <&cpu5>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   232  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   233  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   234  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   235  					cpu = <&cpu6>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   236  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   237  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   238  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   239  					cpu = <&cpu7>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   240  				};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   241  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   242  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   243  
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   244  		idle-states {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   245  			entry-method = "psci";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   246  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   247  			gold_cpu_sleep_0: cpu-sleep-0 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   248  				compatible = "arm,idle-state";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   249  				idle-state-name = "gold-power-collapse";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   250  				arm,psci-suspend-param = <0x40000003>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   251  				entry-latency-us = <549>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   252  				exit-latency-us = <901>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   253  				min-residency-us = <1774>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   254  				local-timer-stop;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   255  			};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   256  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   257  			gold_rail_cpu_sleep_0: cpu-sleep-1 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   258  				compatible = "arm,idle-state";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   259  				idle-state-name = "gold-rail-power-collapse";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   260  				arm,psci-suspend-param = <0x40000004>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   261  				entry-latency-us = <702>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   262  				exit-latency-us = <1061>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   263  				min-residency-us = <4488>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   264  				local-timer-stop;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   265  			};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   266  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   267  
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   268  		domain-idle-states {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   269  			cluster_sleep_gold: cluster-sleep-0 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   270  				compatible = "domain-idle-state";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   271  				arm,psci-suspend-param = <0x41000044>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   272  				entry-latency-us = <2752>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   273  				exit-latency-us = <3048>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   274  				min-residency-us = <6118>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   275  			};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   276  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   277  			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   278  				compatible = "domain-idle-state";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   279  				arm,psci-suspend-param = <0x42000144>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   280  				entry-latency-us = <3263>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   281  				exit-latency-us = <6562>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   282  				min-residency-us = <9987>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   283  			};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   284  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   285  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   286  
6596118ccdcdb3 Jie Gan             2024-05-21   287  	dummy-sink {
6596118ccdcdb3 Jie Gan             2024-05-21   288  		compatible = "arm,coresight-dummy-sink";
6596118ccdcdb3 Jie Gan             2024-05-21   289  
6596118ccdcdb3 Jie Gan             2024-05-21   290  		in-ports {
6596118ccdcdb3 Jie Gan             2024-05-21   291  			port {
6596118ccdcdb3 Jie Gan             2024-05-21   292  				eud_in: endpoint {
6596118ccdcdb3 Jie Gan             2024-05-21   293  					remote-endpoint =
6596118ccdcdb3 Jie Gan             2024-05-21   294  					<&swao_rep_out1>;
6596118ccdcdb3 Jie Gan             2024-05-21   295  				};
6596118ccdcdb3 Jie Gan             2024-05-21   296  			};
6596118ccdcdb3 Jie Gan             2024-05-21   297  		};
6596118ccdcdb3 Jie Gan             2024-05-21   298  	};
6596118ccdcdb3 Jie Gan             2024-05-21   299  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   300  	firmware {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   301  		scm {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   302  			compatible = "qcom,scm-sa8775p", "qcom,scm";
1a82fbfc87fd76 Mukesh Ojha         2024-08-30   303  			qcom,dload-mode = <&tcsr 0x13000>;
d7aeff30093888 Bartosz Golaszewski 2024-05-27   304  			memory-region = <&tz_ffi_mem>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   305  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   306  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   307  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   308  	clk_virt: interconnect-clk-virt {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   309  		compatible = "qcom,sa8775p-clk-virt";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   310  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   311  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   312  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   313  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   314  	mc_virt: interconnect-mc-virt {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   315  		compatible = "qcom,sa8775p-mc-virt";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   316  		#interconnect-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   317  		qcom,bcm-voters = <&apps_bcm_voter>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   318  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   319  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   320  	/* Will be updated by the bootloader. */
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   321  	memory@80000000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   322  		device_type = "memory";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   323  		reg = <0x0 0x80000000 0x0 0x0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   324  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   325  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   326  	qup_opp_table_100mhz: opp-table-qup100mhz {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   327  		compatible = "operating-points-v2";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   328  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   329  		opp-100000000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   330  			opp-hz = /bits/ 64 <100000000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   331  			required-opps = <&rpmhpd_opp_svs_l1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   332  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   333  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   334  
86c96823d4b5f0 Bartosz Golaszewski 2023-04-14   335  	pmu {
86c96823d4b5f0 Bartosz Golaszewski 2023-04-14   336  		compatible = "arm,armv8-pmuv3";
86c96823d4b5f0 Bartosz Golaszewski 2023-04-14   337  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
86c96823d4b5f0 Bartosz Golaszewski 2023-04-14   338  	};
86c96823d4b5f0 Bartosz Golaszewski 2023-04-14   339  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   340  	psci {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   341  		compatible = "arm,psci-1.0";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   342  		method = "smc";
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   343  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   344  		cpu_pd0: power-domain-cpu0 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   345  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   346  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   347  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   348  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   349  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   350  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   351  		cpu_pd1: power-domain-cpu1 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   352  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   353  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   354  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   355  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   356  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   357  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   358  		cpu_pd2: power-domain-cpu2 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   359  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   360  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   361  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   362  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   363  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   364  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   365  		cpu_pd3: power-domain-cpu3 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   366  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   367  			power-domains = <&cluster_0_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   368  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   369  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   370  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   371  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   372  		cpu_pd4: power-domain-cpu4 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   373  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   374  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   375  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   376  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   377  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   378  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   379  		cpu_pd5: power-domain-cpu5 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   380  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   381  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   382  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   383  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   384  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   385  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   386  		cpu_pd6: power-domain-cpu6 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   387  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   388  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   389  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   390  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   391  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   392  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   393  		cpu_pd7: power-domain-cpu7 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   394  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   395  			power-domains = <&cluster_1_pd>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   396  			domain-idle-states = <&gold_cpu_sleep_0>,
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   397  					     <&gold_rail_cpu_sleep_0>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   398  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   399  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   400  		cluster_0_pd: power-domain-cluster0 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   401  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   402  			domain-idle-states = <&cluster_sleep_gold>;
f275447923600b Konrad Dybcio       2025-03-27   403  			power-domains = <&system_pd>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   404  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   405  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   406  		cluster_1_pd: power-domain-cluster1 {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   407  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   408  			domain-idle-states = <&cluster_sleep_gold>;
f275447923600b Konrad Dybcio       2025-03-27   409  			power-domains = <&system_pd>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   410  		};
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   411  
f275447923600b Konrad Dybcio       2025-03-27   412  		system_pd: power-domain-system {
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   413  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   414  			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
4f79d0deae37c2 Bartosz Golaszewski 2024-08-07   415  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   416  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   417  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   418  	reserved-memory {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   419  		#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   420  		#size-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   421  		ranges;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   422  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   423  		sail_ss_mem: sail-ss@80000000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   424  			reg = <0x0 0x80000000 0x0 0x10000000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   425  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   426  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   427  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   428  		hyp_mem: hyp@90000000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   429  			reg = <0x0 0x90000000 0x0 0x600000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   430  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   431  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   432  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   433  		xbl_boot_mem: xbl-boot@90600000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   434  			reg = <0x0 0x90600000 0x0 0x200000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   435  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   436  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   437  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   438  		aop_image_mem: aop-image@90800000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   439  			reg = <0x0 0x90800000 0x0 0x60000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   440  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   441  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   442  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   443  		aop_cmd_db_mem: aop-cmd-db@90860000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   444  			compatible = "qcom,cmd-db";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   445  			reg = <0x0 0x90860000 0x0 0x20000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   446  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   447  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   448  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   449  		uefi_log: uefi-log@908b0000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   450  			reg = <0x0 0x908b0000 0x0 0x10000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   451  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   452  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   453  
f9491ad2318d5c Ninad Naik          2024-01-25   454  		ddr_training_checksum: ddr-training-checksum@908c0000 {
f9491ad2318d5c Ninad Naik          2024-01-25   455  			reg = <0x0 0x908c0000 0x0 0x1000>;
f9491ad2318d5c Ninad Naik          2024-01-25   456  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   457  		};
f9491ad2318d5c Ninad Naik          2024-01-25   458  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   459  		reserved_mem: reserved@908f0000 {
f9491ad2318d5c Ninad Naik          2024-01-25   460  			reg = <0x0 0x908f0000 0x0 0xe000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   461  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   462  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   463  
f9491ad2318d5c Ninad Naik          2024-01-25   464  		secdata_apss_mem: secdata-apss@908fe000 {
f9491ad2318d5c Ninad Naik          2024-01-25   465  			reg = <0x0 0x908fe000 0x0 0x2000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   466  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   467  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   468  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   469  		smem_mem: smem@90900000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   470  			compatible = "qcom,smem";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   471  			reg = <0x0 0x90900000 0x0 0x200000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   472  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   473  			hwlocks = <&tcsr_mutex 3>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   474  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   475  
f9491ad2318d5c Ninad Naik          2024-01-25   476  		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
f9491ad2318d5c Ninad Naik          2024-01-25   477  			reg = <0x0 0x90c00000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik          2024-01-25   478  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   479  		};
f9491ad2318d5c Ninad Naik          2024-01-25   480  
f9491ad2318d5c Ninad Naik          2024-01-25   481  		sail_mailbox_mem: sail-ss@90d00000 {
f9491ad2318d5c Ninad Naik          2024-01-25   482  			reg = <0x0 0x90d00000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik          2024-01-25   483  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   484  		};
f9491ad2318d5c Ninad Naik          2024-01-25   485  
f9491ad2318d5c Ninad Naik          2024-01-25   486  		sail_ota_mem: sail-ss@90e00000 {
f9491ad2318d5c Ninad Naik          2024-01-25   487  			reg = <0x0 0x90e00000 0x0 0x300000>;
f9491ad2318d5c Ninad Naik          2024-01-25   488  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   489  		};
f9491ad2318d5c Ninad Naik          2024-01-25   490  
f9491ad2318d5c Ninad Naik          2024-01-25   491  		aoss_backup_mem: aoss-backup@91b00000 {
f9491ad2318d5c Ninad Naik          2024-01-25   492  			reg = <0x0 0x91b00000 0x0 0x40000>;
f9491ad2318d5c Ninad Naik          2024-01-25   493  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   494  		};
f9491ad2318d5c Ninad Naik          2024-01-25   495  
f9491ad2318d5c Ninad Naik          2024-01-25   496  		cpucp_backup_mem: cpucp-backup@91b40000 {
f9491ad2318d5c Ninad Naik          2024-01-25   497  			reg = <0x0 0x91b40000 0x0 0x40000>;
f9491ad2318d5c Ninad Naik          2024-01-25   498  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   499  		};
f9491ad2318d5c Ninad Naik          2024-01-25   500  
f9491ad2318d5c Ninad Naik          2024-01-25   501  		tz_config_backup_mem: tz-config-backup@91b80000 {
f9491ad2318d5c Ninad Naik          2024-01-25   502  			reg = <0x0 0x91b80000 0x0 0x10000>;
f9491ad2318d5c Ninad Naik          2024-01-25   503  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   504  		};
f9491ad2318d5c Ninad Naik          2024-01-25   505  
f9491ad2318d5c Ninad Naik          2024-01-25   506  		ddr_training_data_mem: ddr-training-data@91b90000 {
f9491ad2318d5c Ninad Naik          2024-01-25   507  			reg = <0x0 0x91b90000 0x0 0x10000>;
f9491ad2318d5c Ninad Naik          2024-01-25   508  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   509  		};
f9491ad2318d5c Ninad Naik          2024-01-25   510  
f9491ad2318d5c Ninad Naik          2024-01-25   511  		cdt_data_backup_mem: cdt-data-backup@91ba0000 {
f9491ad2318d5c Ninad Naik          2024-01-25   512  			reg = <0x0 0x91ba0000 0x0 0x1000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   513  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   514  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   515  
d7aeff30093888 Bartosz Golaszewski 2024-05-27   516  		tz_ffi_mem: tz-ffi@91c00000 {
d7aeff30093888 Bartosz Golaszewski 2024-05-27   517  			compatible = "shared-dma-pool";
d7aeff30093888 Bartosz Golaszewski 2024-05-27   518  			reg = <0x0 0x91c00000 0x0 0x1400000>;
d7aeff30093888 Bartosz Golaszewski 2024-05-27   519  			no-map;
d7aeff30093888 Bartosz Golaszewski 2024-05-27   520  		};
d7aeff30093888 Bartosz Golaszewski 2024-05-27   521  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   522  		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   523  			reg = <0x0 0x93b00000 0x0 0xf00000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   524  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   525  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   526  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   527  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   528  			reg = <0x0 0x94a00000 0x0 0x800000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   529  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   530  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   531  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   532  		pil_camera_mem: pil-camera@95200000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   533  			reg = <0x0 0x95200000 0x0 0x500000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   534  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   535  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   536  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   537  		pil_adsp_mem: pil-adsp@95c00000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   538  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   539  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   540  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   541  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   542  		pil_gdsp0_mem: pil-gdsp0@97b00000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   543  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   544  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   545  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   546  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   547  		pil_gdsp1_mem: pil-gdsp1@99900000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   548  			reg = <0x0 0x99900000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   549  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   550  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   551  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   552  		pil_cdsp0_mem: pil-cdsp0@9b800000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   553  			reg = <0x0 0x9b800000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   554  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   555  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   556  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   557  		pil_gpu_mem: pil-gpu@9d600000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   558  			reg = <0x0 0x9d600000 0x0 0x2000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   559  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   560  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   561  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   562  		pil_cdsp1_mem: pil-cdsp1@9d700000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   563  			reg = <0x0 0x9d700000 0x0 0x1e00000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   564  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   565  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   566  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   567  		pil_cvp_mem: pil-cvp@9f500000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   568  			reg = <0x0 0x9f500000 0x0 0x700000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   569  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   570  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   571  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   572  		pil_video_mem: pil-video@9fc00000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   573  			reg = <0x0 0x9fc00000 0x0 0x700000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   574  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   575  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   576  
f9491ad2318d5c Ninad Naik          2024-01-25   577  		audio_mdf_mem: audio-mdf-region@ae000000 {
f9491ad2318d5c Ninad Naik          2024-01-25   578  			reg = <0x0 0xae000000 0x0 0x1000000>;
f9491ad2318d5c Ninad Naik          2024-01-25   579  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   580  		};
f9491ad2318d5c Ninad Naik          2024-01-25   581  
f9491ad2318d5c Ninad Naik          2024-01-25   582  		firmware_mem: firmware-region@b0000000 {
f9491ad2318d5c Ninad Naik          2024-01-25   583  			reg = <0x0 0xb0000000 0x0 0x800000>;
f9491ad2318d5c Ninad Naik          2024-01-25   584  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   585  		};
f9491ad2318d5c Ninad Naik          2024-01-25   586  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   587  		hyptz_reserved_mem: hyptz-reserved@beb00000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   588  			reg = <0x0 0xbeb00000 0x0 0x11500000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   589  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   590  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   591  
f9491ad2318d5c Ninad Naik          2024-01-25   592  		scmi_mem: scmi-region@d0000000 {
f9491ad2318d5c Ninad Naik          2024-01-25   593  			reg = <0x0 0xd0000000 0x0 0x40000>;
f9491ad2318d5c Ninad Naik          2024-01-25   594  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   595  		};
f9491ad2318d5c Ninad Naik          2024-01-25   596  
f9491ad2318d5c Ninad Naik          2024-01-25   597  		firmware_logs_mem: firmware-logs@d0040000 {
f9491ad2318d5c Ninad Naik          2024-01-25   598  			reg = <0x0 0xd0040000 0x0 0x10000>;
f9491ad2318d5c Ninad Naik          2024-01-25   599  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   600  		};
f9491ad2318d5c Ninad Naik          2024-01-25   601  
f9491ad2318d5c Ninad Naik          2024-01-25   602  		firmware_audio_mem: firmware-audio@d0050000 {
f9491ad2318d5c Ninad Naik          2024-01-25   603  			reg = <0x0 0xd0050000 0x0 0x4000>;
f9491ad2318d5c Ninad Naik          2024-01-25   604  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   605  		};
f9491ad2318d5c Ninad Naik          2024-01-25   606  
f9491ad2318d5c Ninad Naik          2024-01-25   607  		firmware_reserved_mem: firmware-reserved@d0054000 {
f9491ad2318d5c Ninad Naik          2024-01-25   608  			reg = <0x0 0xd0054000 0x0 0x9c000>;
f9491ad2318d5c Ninad Naik          2024-01-25   609  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   610  		};
f9491ad2318d5c Ninad Naik          2024-01-25   611  
f9491ad2318d5c Ninad Naik          2024-01-25   612  		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
f9491ad2318d5c Ninad Naik          2024-01-25   613  			reg = <0x0 0xd00f0000 0x0 0x10000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   614  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   615  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   616  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   617  		tags_mem: tags@d0100000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   618  			reg = <0x0 0xd0100000 0x0 0x1200000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   619  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   620  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   621  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   622  		qtee_mem: qtee@d1300000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   623  			reg = <0x0 0xd1300000 0x0 0x500000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   624  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   625  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   626  
f9491ad2318d5c Ninad Naik          2024-01-25   627  		deepsleep_backup_mem: deepsleep-backup@d1800000 {
f9491ad2318d5c Ninad Naik          2024-01-25   628  			reg = <0x0 0xd1800000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik          2024-01-25   629  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   630  		};
f9491ad2318d5c Ninad Naik          2024-01-25   631  
f9491ad2318d5c Ninad Naik          2024-01-25   632  		trusted_apps_mem: trusted-apps@d1900000 {
f9491ad2318d5c Ninad Naik          2024-01-25   633  			reg = <0x0 0xd1900000 0x0 0x3800000>;
f9491ad2318d5c Ninad Naik          2024-01-25   634  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   635  		};
f9491ad2318d5c Ninad Naik          2024-01-25   636  
f9491ad2318d5c Ninad Naik          2024-01-25   637  		tz_stat_mem: tz-stat@db100000 {
f9491ad2318d5c Ninad Naik          2024-01-25   638  			reg = <0x0 0xdb100000 0x0 0x100000>;
f9491ad2318d5c Ninad Naik          2024-01-25   639  			no-map;
f9491ad2318d5c Ninad Naik          2024-01-25   640  		};
f9491ad2318d5c Ninad Naik          2024-01-25   641  
f9491ad2318d5c Ninad Naik          2024-01-25   642  		cpucp_fw_mem: cpucp-fw@db200000 {
f9491ad2318d5c Ninad Naik          2024-01-25   643  			reg = <0x0 0xdb200000 0x0 0x100000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   644  			no-map;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   645  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   646  	};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   647  
df54dcb34ff2ea Tengfei Fan         2024-08-05   648  	smp2p-adsp {
df54dcb34ff2ea Tengfei Fan         2024-08-05   649  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan         2024-08-05   650  		qcom,smem = <443>, <429>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   651  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
df54dcb34ff2ea Tengfei Fan         2024-08-05   652  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan         2024-08-05   653  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   654  		mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   655  
df54dcb34ff2ea Tengfei Fan         2024-08-05   656  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   657  		qcom,remote-pid = <2>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   658  
df54dcb34ff2ea Tengfei Fan         2024-08-05   659  		smp2p_adsp_out: master-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   660  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   661  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   662  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   663  
df54dcb34ff2ea Tengfei Fan         2024-08-05   664  		smp2p_adsp_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   665  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   666  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan         2024-08-05   667  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   668  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   669  	};
df54dcb34ff2ea Tengfei Fan         2024-08-05   670  
df54dcb34ff2ea Tengfei Fan         2024-08-05   671  	smp2p-cdsp0 {
df54dcb34ff2ea Tengfei Fan         2024-08-05   672  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan         2024-08-05   673  		qcom,smem = <94>, <432>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   674  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
df54dcb34ff2ea Tengfei Fan         2024-08-05   675  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan         2024-08-05   676  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   677  		mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   678  
df54dcb34ff2ea Tengfei Fan         2024-08-05   679  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   680  		qcom,remote-pid = <5>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   681  
df54dcb34ff2ea Tengfei Fan         2024-08-05   682  		smp2p_cdsp0_out: master-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   683  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   684  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   685  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   686  
df54dcb34ff2ea Tengfei Fan         2024-08-05   687  		smp2p_cdsp0_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   688  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   689  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan         2024-08-05   690  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   691  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   692  	};
df54dcb34ff2ea Tengfei Fan         2024-08-05   693  
df54dcb34ff2ea Tengfei Fan         2024-08-05   694  	smp2p-cdsp1 {
df54dcb34ff2ea Tengfei Fan         2024-08-05   695  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan         2024-08-05   696  		qcom,smem = <617>, <616>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   697  		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
df54dcb34ff2ea Tengfei Fan         2024-08-05   698  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan         2024-08-05   699  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   700  		mboxes = <&ipcc IPCC_CLIENT_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   701  
df54dcb34ff2ea Tengfei Fan         2024-08-05   702  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   703  		qcom,remote-pid = <12>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   704  
df54dcb34ff2ea Tengfei Fan         2024-08-05   705  		smp2p_cdsp1_out: master-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   706  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   707  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   708  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   709  
df54dcb34ff2ea Tengfei Fan         2024-08-05   710  		smp2p_cdsp1_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   711  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   712  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan         2024-08-05   713  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   714  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   715  	};
df54dcb34ff2ea Tengfei Fan         2024-08-05   716  
df54dcb34ff2ea Tengfei Fan         2024-08-05   717  	smp2p-gpdsp0 {
df54dcb34ff2ea Tengfei Fan         2024-08-05   718  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan         2024-08-05   719  		qcom,smem = <617>, <616>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   720  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
df54dcb34ff2ea Tengfei Fan         2024-08-05   721  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan         2024-08-05   722  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   723  		mboxes = <&ipcc IPCC_CLIENT_GPDSP0 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   724  
df54dcb34ff2ea Tengfei Fan         2024-08-05   725  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   726  		qcom,remote-pid = <17>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   727  
df54dcb34ff2ea Tengfei Fan         2024-08-05   728  		smp2p_gpdsp0_out: master-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   729  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   730  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   731  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   732  
df54dcb34ff2ea Tengfei Fan         2024-08-05   733  		smp2p_gpdsp0_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   734  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   735  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan         2024-08-05   736  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   737  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   738  	};
df54dcb34ff2ea Tengfei Fan         2024-08-05   739  
df54dcb34ff2ea Tengfei Fan         2024-08-05   740  	smp2p-gpdsp1 {
df54dcb34ff2ea Tengfei Fan         2024-08-05   741  		compatible = "qcom,smp2p";
df54dcb34ff2ea Tengfei Fan         2024-08-05   742  		qcom,smem = <617>, <616>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   743  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
df54dcb34ff2ea Tengfei Fan         2024-08-05   744  					     IPCC_MPROC_SIGNAL_SMP2P
df54dcb34ff2ea Tengfei Fan         2024-08-05   745  					     IRQ_TYPE_EDGE_RISING>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   746  		mboxes = <&ipcc IPCC_CLIENT_GPDSP1 IPCC_MPROC_SIGNAL_SMP2P>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   747  
df54dcb34ff2ea Tengfei Fan         2024-08-05   748  		qcom,local-pid = <0>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   749  		qcom,remote-pid = <18>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   750  
df54dcb34ff2ea Tengfei Fan         2024-08-05   751  		smp2p_gpdsp1_out: master-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   752  			qcom,entry-name = "master-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   753  			#qcom,smem-state-cells = <1>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   754  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   755  
df54dcb34ff2ea Tengfei Fan         2024-08-05   756  		smp2p_gpdsp1_in: slave-kernel {
df54dcb34ff2ea Tengfei Fan         2024-08-05   757  			qcom,entry-name = "slave-kernel";
df54dcb34ff2ea Tengfei Fan         2024-08-05   758  			interrupt-controller;
df54dcb34ff2ea Tengfei Fan         2024-08-05   759  			#interrupt-cells = <2>;
df54dcb34ff2ea Tengfei Fan         2024-08-05   760  		};
df54dcb34ff2ea Tengfei Fan         2024-08-05   761  	};
df54dcb34ff2ea Tengfei Fan         2024-08-05   762  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   763  	soc: soc@0 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   764  		compatible = "simple-bus";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   765  		#address-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   766  		#size-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   767  		ranges = <0 0 0 0 0x10 0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   768  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   769  		gcc: clock-controller@100000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   770  			compatible = "qcom,sa8775p-gcc";
3fd7e2eec8f4fe Bartosz Golaszewski 2023-03-27   771  			reg = <0x0 0x00100000 0x0 0xc7018>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   772  			#clock-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   773  			#reset-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   774  			#power-domain-cells = <1>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   775  			clocks = <&rpmhcc RPMH_CXO_CLK>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   776  				 <&sleep_clk>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   777  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   778  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   779  				 <0>,
de1001525c1aa2 Shazad Hussain      2023-04-28   780  				 <&usb_0_qmpphy>,
de1001525c1aa2 Shazad Hussain      2023-04-28   781  				 <&usb_1_qmpphy>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   782  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   783  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   784  				 <0>,
489f14be0e0a19 Mrinmay Sarkar      2023-07-21   785  				 <&pcie0_phy>,
489f14be0e0a19 Mrinmay Sarkar      2023-07-21   786  				 <&pcie1_phy>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   787  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   788  				 <0>,
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   789  				 <0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   790  			power-domains = <&rpmhpd SA8775P_CX>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   791  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   792  
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   793  		ipcc: mailbox@408000 {
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   794  			compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
3fd7e2eec8f4fe Bartosz Golaszewski 2023-03-27   795  			reg = <0x0 0x00408000 0x0 0x1000>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   796  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   797  			interrupt-controller;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   798  			#interrupt-cells = <3>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   799  			#mbox-cells = <2>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   800  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14   801  
86348c7587f556 Konrad Dybcio       2024-11-07   802  		gpi_dma2: dma-controller@800000  {
a8d18df5a5a114 Konrad Dybcio       2024-11-08   803  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya     2024-10-21   804  			reg = <0x0 0x00800000 0x0 0x60000>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   805  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   806  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   807  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   808  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   809  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   810  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   811  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   812  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   813  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   814  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   815  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   816  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   817  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   818  			dma-channels = <12>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   819  			dma-channel-mask = <0xfff>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   820  			iommus = <&apps_smmu 0x5b6 0x0>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   821  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya     2024-10-21   822  		};
34d17ccb5db804 Viken Dadhaniya     2024-10-21   823  
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   824  		qupv3_id_2: geniqup@8c0000 {
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   825  			compatible = "qcom,geni-se-qup";
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   826  			reg = <0x0 0x008c0000 0x0 0x6000>;
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   827  			ranges;
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   828  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   829  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   830  			clock-names = "m-ahb", "s-ahb";
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   831  			iommus = <&apps_smmu 0x5a3 0x0>;
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   832  			#address-cells = <2>;
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   833  			#size-cells = <2>;
dc3ad22112de7f Bartosz Golaszewski 2023-03-09   834  			status = "disabled";
a23d122572a4ad Bartosz Golaszewski 2023-03-09   835  
ee2f5f906d69d9 Shazad Hussain      2023-05-26   836  			i2c14: i2c@880000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26   837  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   838  				reg = <0x0 0x880000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   839  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   840  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   841  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   842  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   843  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   844  				pinctrl-0 = <&qup_i2c14_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   845  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   846  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   847  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26   848  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   849  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26   850  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   851  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   852  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26   853  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26   854  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   855  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   856  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   857  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   858  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21   859  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   860  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   861  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26   862  
1b2d7ad5ac14df Shazad Hussain      2023-05-26   863  			spi14: spi@880000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26   864  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   865  				reg = <0x0 0x880000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   866  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   867  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   868  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   869  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   870  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   871  				pinctrl-0 = <&qup_spi14_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   872  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   873  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26   874  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26   875  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26   876  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26   877  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26   878  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   879  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26   880  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26   881  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   882  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   883  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   884  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   885  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21   886  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   887  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   888  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26   889  
34a407316b7d37 Viken Dadhaniya     2024-10-07   890  			uart14: serial@880000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07   891  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07   892  				reg = <0x0 0x00880000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   893  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   894  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   895  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   896  				pinctrl-0 = <&qup_uart14_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   897  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07   898  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07   899  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07   900  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07   901  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   902  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07   903  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   904  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07   905  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07   906  
ee2f5f906d69d9 Shazad Hussain      2023-05-26   907  			i2c15: i2c@884000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26   908  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   909  				reg = <0x0 0x884000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   910  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   911  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   912  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   913  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   914  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   915  				pinctrl-0 = <&qup_i2c15_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   916  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   917  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   918  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26   919  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   920  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26   921  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   922  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   923  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26   924  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26   925  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   926  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   927  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   928  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   929  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21   930  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   931  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   932  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26   933  
1b2d7ad5ac14df Shazad Hussain      2023-05-26   934  			spi15: spi@884000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26   935  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   936  				reg = <0x0 0x884000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   937  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   938  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   939  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   940  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   941  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   942  				pinctrl-0 = <&qup_spi15_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   943  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   944  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26   945  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26   946  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26   947  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26   948  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26   949  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26   950  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26   951  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26   952  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   953  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   954  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   955  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   956  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21   957  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   958  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26   959  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26   960  
34a407316b7d37 Viken Dadhaniya     2024-10-07   961  			uart15: serial@884000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07   962  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07   963  				reg = <0x0 0x00884000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   964  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   965  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   966  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   967  				pinctrl-0 = <&qup_uart15_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   968  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07   969  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07   970  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07   971  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07   972  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   973  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07   974  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07   975  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07   976  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07   977  
ee2f5f906d69d9 Shazad Hussain      2023-05-26   978  			i2c16: i2c@888000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26   979  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   980  				reg = <0x0 0x888000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   981  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   982  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   983  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   984  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   985  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09   986  				pinctrl-0 = <&qup_i2c16_default>;
b0334269743599 Viken Dadhaniya     2025-05-09   987  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   988  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   989  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26   990  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   991  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26   992  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26   993  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26   994  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26   995  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26   996  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26   997  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21   998  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21   999  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1000  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1001  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1002  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1003  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1004  
cfd975f588400e Bartosz Golaszewski 2023-03-09  1005  			spi16: spi@888000 {
cfd975f588400e Bartosz Golaszewski 2023-03-09  1006  				compatible = "qcom,geni-spi";
cfd975f588400e Bartosz Golaszewski 2023-03-09  1007  				reg = <0x0 0x00888000 0x0 0x4000>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  1008  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  1009  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  1010  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1011  				pinctrl-0 = <&qup_spi16_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1012  				pinctrl-names = "default";
cfd975f588400e Bartosz Golaszewski 2023-03-09  1013  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski 2023-03-09  1014  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e Bartosz Golaszewski 2023-03-09  1015  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski 2023-03-09  1016  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e Bartosz Golaszewski 2023-03-09  1017  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski 2023-03-09  1018  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  1019  				interconnect-names = "qup-core",
cfd975f588400e Bartosz Golaszewski 2023-03-09  1020  						     "qup-config",
cfd975f588400e Bartosz Golaszewski 2023-03-09  1021  						     "qup-memory";
cfd975f588400e Bartosz Golaszewski 2023-03-09  1022  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1023  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1024  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1025  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1026  					    "rx";
cfd975f588400e Bartosz Golaszewski 2023-03-09  1027  				#address-cells = <1>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  1028  				#size-cells = <0>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  1029  				status = "disabled";
cfd975f588400e Bartosz Golaszewski 2023-03-09  1030  			};
cfd975f588400e Bartosz Golaszewski 2023-03-09  1031  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1032  			uart16: serial@888000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1033  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1034  				reg = <0x0 0x00888000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1035  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1036  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1037  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1038  				pinctrl-0 = <&qup_uart16_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1039  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1040  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1041  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1042  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1043  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1044  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1045  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1046  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1047  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1048  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1049  			i2c17: i2c@88c000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1050  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1051  				reg = <0x0 0x88c000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1052  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1053  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1054  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1055  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1056  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1057  				pinctrl-0 = <&qup_i2c17_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1058  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1059  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1060  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1061  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1062  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1063  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1064  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1065  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1066  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1067  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1068  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1069  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1070  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1071  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1072  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1073  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1074  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1075  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1076  			spi17: spi@88c000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1077  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1078  				reg = <0x0 0x88c000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1079  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1080  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1081  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1082  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1083  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1084  				pinctrl-0 = <&qup_spi17_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1085  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1086  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1087  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1088  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1089  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1090  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1091  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1092  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1093  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1094  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1095  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1096  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1097  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1098  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1099  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1100  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1101  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1102  
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1103  			uart17: serial@88c000 {
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1104  				compatible = "qcom,geni-uart";
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1105  				reg = <0x0 0x0088c000 0x0 0x4000>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1106  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1107  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1108  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1109  				pinctrl-0 = <&qup_uart17_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1110  				pinctrl-names = "default";
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1111  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1112  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1113  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1114  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1115  				interconnect-names = "qup-core", "qup-config";
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1116  				power-domains = <&rpmhpd SA8775P_CX>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1117  				status = "disabled";
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1118  			};
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  1119  
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1120  			i2c18: i2c@890000 {
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1121  				compatible = "qcom,geni-i2c";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1122  				reg = <0x0 0x00890000 0x0 0x4000>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1123  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1124  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1125  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1126  				pinctrl-0 = <&qup_i2c18_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1127  				pinctrl-names = "default";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1128  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1129  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1130  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1131  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1132  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1133  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1134  				interconnect-names = "qup-core",
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1135  						     "qup-config",
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1136  						     "qup-memory";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1137  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1138  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1139  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1140  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1141  					    "rx";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1142  				#address-cells = <1>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1143  				#size-cells = <0>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1144  				status = "disabled";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  1145  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1146  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1147  			spi18: spi@890000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1148  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1149  				reg = <0x0 0x890000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1150  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1151  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1152  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1153  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1154  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1155  				pinctrl-0 = <&qup_spi18_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1156  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1157  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1158  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1159  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1160  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1161  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1162  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1163  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1164  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1165  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1166  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1167  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1168  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1169  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1170  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1171  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1172  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1173  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1174  			uart18: serial@890000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1175  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1176  				reg = <0x0 0x00890000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1177  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1178  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1179  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1180  				pinctrl-0 = <&qup_uart18_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1181  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1182  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1183  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1184  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1185  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1186  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1187  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1188  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1189  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1190  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1191  			i2c19: i2c@894000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1192  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1193  				reg = <0x0 0x894000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1194  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1195  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1196  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1197  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1198  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1199  				pinctrl-0 = <&qup_i2c19_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1200  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1201  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1202  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1203  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1204  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1205  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1206  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1207  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1208  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1209  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1210  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1211  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1212  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1213  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1214  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1215  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1216  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1217  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1218  			spi19: spi@894000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1219  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1220  				reg = <0x0 0x894000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1221  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1222  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1223  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1224  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1225  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1226  				pinctrl-0 = <&qup_spi19_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1227  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1228  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1229  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1230  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1231  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1232  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1233  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1234  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1235  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1236  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1237  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1238  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1239  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1240  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1241  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1242  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1243  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1244  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1245  			uart19: serial@894000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1246  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1247  				reg = <0x0 0x00894000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1248  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1249  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1250  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1251  				pinctrl-0 = <&qup_uart19_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1252  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1253  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1254  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1255  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1256  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1257  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1258  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1259  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1260  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1261  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1262  			i2c20: i2c@898000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1263  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1264  				reg = <0x0 0x898000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1265  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1266  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1267  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1268  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1269  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1270  				pinctrl-0 = <&qup_i2c20_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1271  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1272  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1273  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1274  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1275  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1276  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1277  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1278  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1279  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1280  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1281  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1282  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1283  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1284  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1285  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1286  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1287  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1288  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1289  			spi20: spi@898000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1290  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1291  				reg = <0x0 0x898000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1292  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1293  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1294  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1295  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1296  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1297  				pinctrl-0 = <&qup_spi20_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1298  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1299  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1300  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1301  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1302  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1303  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1304  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1305  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1306  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1307  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1308  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1309  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1310  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1311  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1312  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1313  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1314  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1315  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1316  			uart20: serial@898000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1317  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1318  				reg = <0x0 0x00898000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1319  				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1320  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1321  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1322  				pinctrl-0 = <&qup_uart20_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1323  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1324  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1325  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1326  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1327  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1328  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1329  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1330  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1331  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1332  
dc3ad22112de7f Bartosz Golaszewski 2023-03-09  1333  		};
dc3ad22112de7f Bartosz Golaszewski 2023-03-09  1334  
86348c7587f556 Konrad Dybcio       2024-11-07  1335  		gpi_dma0: dma-controller@900000  {
a8d18df5a5a114 Konrad Dybcio       2024-11-08  1336  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1337  			reg = <0x0 0x00900000 0x0 0x60000>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1338  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1339  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1340  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1341  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1342  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1343  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1344  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1345  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1346  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1347  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1348  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1349  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1350  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1351  			dma-channels = <12>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1352  			dma-channel-mask = <0xfff>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1353  			iommus = <&apps_smmu 0x416 0x0>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1354  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1355  		};
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1356  
07e3e17205794c Shazad Hussain      2023-05-26  1357  		qupv3_id_0: geniqup@9c0000 {
07e3e17205794c Shazad Hussain      2023-05-26  1358  			compatible = "qcom,geni-se-qup";
07e3e17205794c Shazad Hussain      2023-05-26  1359  			reg = <0x0 0x9c0000 0x0 0x6000>;
07e3e17205794c Shazad Hussain      2023-05-26  1360  			#address-cells = <2>;
07e3e17205794c Shazad Hussain      2023-05-26  1361  			#size-cells = <2>;
07e3e17205794c Shazad Hussain      2023-05-26  1362  			ranges;
07e3e17205794c Shazad Hussain      2023-05-26  1363  			clock-names = "m-ahb", "s-ahb";
07e3e17205794c Shazad Hussain      2023-05-26  1364  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
07e3e17205794c Shazad Hussain      2023-05-26  1365  				<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
07e3e17205794c Shazad Hussain      2023-05-26  1366  			iommus = <&apps_smmu 0x403 0x0>;
07e3e17205794c Shazad Hussain      2023-05-26  1367  			status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1368  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1369  			i2c0: i2c@980000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1370  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1371  				reg = <0x0 0x980000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1372  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1373  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1374  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1375  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1376  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1377  				pinctrl-0 = <&qup_i2c0_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1378  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1379  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1380  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1381  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1382  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1383  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1384  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1385  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1386  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1387  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1388  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1389  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1390  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1391  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1392  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1393  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1394  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1395  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1396  			spi0: spi@980000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1397  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1398  				reg = <0x0 0x980000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1399  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1400  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1401  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1402  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1403  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1404  				pinctrl-0 = <&qup_spi0_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1405  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1406  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1407  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1408  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1409  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1410  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1411  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1412  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1413  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1414  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1415  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1416  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1417  				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1418  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1419  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1420  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1421  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1422  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1423  			uart0: serial@980000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1424  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1425  				reg = <0x0 0x980000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1426  				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1427  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1428  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1429  				pinctrl-0 = <&qup_uart0_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1430  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1431  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1432  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1433  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1434  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1435  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1436  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1437  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1438  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1439  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1440  			i2c1: i2c@984000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1441  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1442  				reg = <0x0 0x984000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1443  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1444  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1445  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1446  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1447  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1448  				pinctrl-0 = <&qup_i2c1_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1449  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1450  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1451  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1452  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1453  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1454  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1455  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1456  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1457  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1458  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1459  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1460  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1461  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1462  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1463  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1464  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1465  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1466  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1467  			spi1: spi@984000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1468  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1469  				reg = <0x0 0x984000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1470  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1471  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1472  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1473  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1474  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1475  				pinctrl-0 = <&qup_spi1_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1476  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1477  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1478  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1479  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1480  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1481  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1482  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1483  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1484  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1485  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1486  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1487  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1488  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1489  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1490  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1491  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1492  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1493  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1494  			uart1: serial@984000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1495  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1496  				reg = <0x0 0x984000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1497  				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1498  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1499  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1500  				pinctrl-0 = <&qup_uart1_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1501  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1502  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1503  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1504  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1505  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1506  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1507  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1508  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1509  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1510  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1511  			i2c2: i2c@988000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1512  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1513  				reg = <0x0 0x988000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1514  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1515  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1516  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1517  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1518  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1519  				pinctrl-0 = <&qup_i2c2_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1520  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1521  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1522  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1523  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1524  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1525  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1526  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1527  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1528  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1529  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1530  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1531  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1532  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1533  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1534  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1535  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1536  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1537  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1538  			spi2: spi@988000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1539  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1540  				reg = <0x0 0x988000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1541  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1542  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1543  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1544  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1545  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1546  				pinctrl-0 = <&qup_spi2_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1547  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1548  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1549  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1550  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1551  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1552  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1553  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1554  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1555  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1556  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1557  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1558  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1559  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1560  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1561  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1562  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1563  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1564  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1565  			uart2: serial@988000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1566  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1567  				reg = <0x0 0x988000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1568  				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1569  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1570  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1571  				pinctrl-0 = <&qup_uart2_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1572  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1573  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1574  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1575  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1576  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1577  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1578  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1579  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1580  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1581  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1582  			i2c3: i2c@98c000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1583  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1584  				reg = <0x0 0x98c000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1585  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1586  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1587  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1588  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1589  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1590  				pinctrl-0 = <&qup_i2c3_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1591  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1592  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1593  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1594  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1595  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1596  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1597  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1598  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1599  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1600  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1601  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1602  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1603  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1604  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1605  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1606  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1607  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1608  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1609  			spi3: spi@98c000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1610  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1611  				reg = <0x0 0x98c000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1612  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1613  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1614  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1615  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1616  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1617  				pinctrl-0 = <&qup_spi3_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1618  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1619  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1620  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1621  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1622  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1623  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1624  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1625  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1626  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1627  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1628  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1629  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1630  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1631  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1632  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1633  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1634  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1635  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1636  			uart3: serial@98c000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1637  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1638  				reg = <0x0 0x98c000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1639  				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1640  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1641  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1642  				pinctrl-0 = <&qup_uart3_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1643  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1644  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1645  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1646  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1647  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1648  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1649  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1650  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1651  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1652  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1653  			i2c4: i2c@990000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1654  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1655  				reg = <0x0 0x990000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1656  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1657  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1658  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1659  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1660  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1661  				pinctrl-0 = <&qup_i2c4_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1662  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1663  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1664  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1665  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1666  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1667  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1668  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1669  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1670  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1671  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1672  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1673  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1674  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1675  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1676  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1677  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1678  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1679  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1680  			spi4: spi@990000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1681  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1682  				reg = <0x0 0x990000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1683  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1684  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1685  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1686  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1687  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1688  				pinctrl-0 = <&qup_spi4_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1689  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1690  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1691  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1692  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1693  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1694  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1695  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1696  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1697  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1698  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1699  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1700  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1701  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1702  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1703  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1704  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1705  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1706  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1707  			uart4: serial@990000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1708  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1709  				reg = <0x0 0x990000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1710  				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1711  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1712  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1713  				pinctrl-0 = <&qup_uart4_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1714  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1715  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1716  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1717  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1718  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1719  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1720  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1721  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1722  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1723  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1724  			i2c5: i2c@994000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1725  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1726  				reg = <0x0 0x994000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1727  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1728  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1729  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1730  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1731  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1732  				pinctrl-0 = <&qup_i2c5_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1733  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1734  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1735  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1736  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1737  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1738  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1739  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1740  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1741  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1742  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1743  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1744  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1745  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1746  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1747  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1748  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1749  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1750  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1751  			spi5: spi@994000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1752  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1753  				reg = <0x0 0x994000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1754  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1755  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1756  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1757  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1758  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1759  				pinctrl-0 = <&qup_spi5_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1760  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1761  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1762  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1763  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1764  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1765  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1766  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1767  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1768  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1769  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1770  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1771  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1772  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1773  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1774  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1775  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1776  			};
445a523d462432 Shazad Hussain      2023-05-26  1777  
445a523d462432 Shazad Hussain      2023-05-26  1778  			uart5: serial@994000 {
445a523d462432 Shazad Hussain      2023-05-26  1779  				compatible = "qcom,geni-uart";
445a523d462432 Shazad Hussain      2023-05-26  1780  				reg = <0x0 0x994000 0x0 0x4000>;
445a523d462432 Shazad Hussain      2023-05-26  1781  				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
445a523d462432 Shazad Hussain      2023-05-26  1782  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
445a523d462432 Shazad Hussain      2023-05-26  1783  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1784  				pinctrl-0 = <&qup_uart5_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1785  				pinctrl-names = "default";
445a523d462432 Shazad Hussain      2023-05-26  1786  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain      2023-05-26  1787  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
445a523d462432 Shazad Hussain      2023-05-26  1788  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain      2023-05-26  1789  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
445a523d462432 Shazad Hussain      2023-05-26  1790  				interconnect-names = "qup-core", "qup-config";
445a523d462432 Shazad Hussain      2023-05-26  1791  				power-domains = <&rpmhpd SA8775P_CX>;
445a523d462432 Shazad Hussain      2023-05-26  1792  				status = "disabled";
445a523d462432 Shazad Hussain      2023-05-26  1793  			};
07e3e17205794c Shazad Hussain      2023-05-26  1794  		};
07e3e17205794c Shazad Hussain      2023-05-26  1795  
86348c7587f556 Konrad Dybcio       2024-11-07  1796  		gpi_dma1: dma-controller@a00000  {
a8d18df5a5a114 Konrad Dybcio       2024-11-08  1797  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1798  			reg = <0x0 0x00a00000 0x0 0x60000>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1799  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1800  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1801  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1802  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1803  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1804  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1805  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1806  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1807  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1808  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1809  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1810  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1811  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1812  			iommus = <&apps_smmu 0x456 0x0>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1813  			dma-channels = <12>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1814  			dma-channel-mask = <0xfff>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1815  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1816  		};
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1817  
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1818  		qupv3_id_1: geniqup@ac0000 {
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1819  			compatible = "qcom,geni-se-qup";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1820  			reg = <0x0 0x00ac0000 0x0 0x6000>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1821  			#address-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1822  			#size-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1823  			ranges;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1824  			clock-names = "m-ahb", "s-ahb";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1825  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1826  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  1827  			iommus = <&apps_smmu 0x443 0x0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  1828  			status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  1829  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1830  			i2c7: i2c@a80000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1831  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1832  				reg = <0x0 0xa80000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1833  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1834  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1835  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1836  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1837  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1838  				pinctrl-0 = <&qup_i2c7_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1839  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1840  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1841  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1842  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1843  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1844  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1845  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1846  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1847  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1848  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1849  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1850  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1851  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1852  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1853  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1854  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1855  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1856  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1857  			spi7: spi@a80000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1858  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1859  				reg = <0x0 0xa80000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1860  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1861  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1862  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1863  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1864  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1865  				pinctrl-0 = <&qup_spi7_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1866  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1867  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1868  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1869  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1870  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1871  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1872  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1873  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1874  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1875  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1876  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1877  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1878  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1879  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1880  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1881  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1882  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1883  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1884  			uart7: serial@a80000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1885  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1886  				reg = <0x0 0x00a80000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1887  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1888  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1889  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
b0334269743599 Viken Dadhaniya     2025-05-09  1890  				pinctrl-0 = <&qup_uart7_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1891  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1892  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1893  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1894  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1895  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1896  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1897  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1898  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1899  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1900  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1901  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1902  			i2c8: i2c@a84000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1903  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1904  				reg = <0x0 0xa84000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1905  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1906  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1907  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1908  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1909  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1910  				pinctrl-0 = <&qup_i2c8_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1911  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1912  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1913  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1914  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1915  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1916  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1917  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1918  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1919  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1920  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1921  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1922  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1923  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1924  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1925  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1926  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1927  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1928  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1929  			spi8: spi@a84000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1930  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1931  				reg = <0x0 0xa84000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1932  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1933  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1934  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1935  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1936  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1937  				pinctrl-0 = <&qup_spi8_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1938  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1939  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1940  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1941  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1942  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1943  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1944  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1945  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1946  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1947  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1948  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1949  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1950  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1951  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1952  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1953  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1954  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  1955  
34a407316b7d37 Viken Dadhaniya     2024-10-07  1956  			uart8: serial@a84000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  1957  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1958  				reg = <0x0 0x00a84000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1959  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1960  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1961  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
b0334269743599 Viken Dadhaniya     2025-05-09  1962  				pinctrl-0 = <&qup_uart8_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1963  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1964  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1965  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1966  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  1967  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  1968  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1969  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1970  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  1971  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  1972  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  1973  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1974  			i2c9: i2c@a88000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1975  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1976  				reg = <0x0 0xa88000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1977  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1978  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1979  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1980  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1981  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  1982  				pinctrl-0 = <&qup_i2c9_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  1983  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1984  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1985  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1986  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1987  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1988  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1989  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1990  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1991  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1992  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1993  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1994  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1995  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1996  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  1997  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1998  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  1999  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2000  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2001  			spi9: spi@a88000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2002  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2003  				reg = <0x0 0xa88000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2004  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2005  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2006  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2007  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2008  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2009  				pinctrl-0 = <&qup_spi9_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2010  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2011  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2012  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2013  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2014  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2015  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2016  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2017  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2018  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2019  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2020  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2021  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2022  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2023  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2024  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2025  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2026  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2027  
445a523d462432 Shazad Hussain      2023-05-26  2028  			uart9: serial@a88000 {
445a523d462432 Shazad Hussain      2023-05-26  2029  				compatible = "qcom,geni-uart";
445a523d462432 Shazad Hussain      2023-05-26  2030  				reg = <0x0 0xa88000 0x0 0x4000>;
445a523d462432 Shazad Hussain      2023-05-26  2031  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
445a523d462432 Shazad Hussain      2023-05-26  2032  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
445a523d462432 Shazad Hussain      2023-05-26  2033  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2034  				pinctrl-0 = <&qup_uart9_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2035  				pinctrl-names = "default";
445a523d462432 Shazad Hussain      2023-05-26  2036  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain      2023-05-26  2037  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
445a523d462432 Shazad Hussain      2023-05-26  2038  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
445a523d462432 Shazad Hussain      2023-05-26  2039  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
445a523d462432 Shazad Hussain      2023-05-26  2040  				interconnect-names = "qup-core", "qup-config";
445a523d462432 Shazad Hussain      2023-05-26  2041  				power-domains = <&rpmhpd SA8775P_CX>;
445a523d462432 Shazad Hussain      2023-05-26  2042  				status = "disabled";
445a523d462432 Shazad Hussain      2023-05-26  2043  			};
445a523d462432 Shazad Hussain      2023-05-26  2044  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2045  			i2c10: i2c@a8c000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2046  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2047  				reg = <0x0 0xa8c000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2048  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2049  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2050  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2051  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2052  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2053  				pinctrl-0 = <&qup_i2c10_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2054  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2055  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2056  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2057  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2058  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2059  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2060  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2061  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2062  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2063  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2064  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2065  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2066  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2067  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2068  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2069  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2070  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2071  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2072  			spi10: spi@a8c000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2073  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2074  				reg = <0x0 0xa8c000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2075  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2076  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2077  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2078  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2079  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2080  				pinctrl-0 = <&qup_spi10_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2081  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2082  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2083  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2084  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2085  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2086  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2087  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2088  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2089  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2090  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2091  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2092  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2093  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2094  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2095  					    "rx";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2096  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2097  			};
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2098  
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2099  			uart10: serial@a8c000 {
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2100  				compatible = "qcom,geni-uart";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2101  				reg = <0x0 0x00a8c000 0x0 0x4000>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2102  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2103  				clock-names = "se";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2104  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
b0334269743599 Viken Dadhaniya     2025-05-09  2105  				pinctrl-0 = <&qup_uart10_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2106  				pinctrl-names = "default";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2107  				interconnect-names = "qup-core", "qup-config";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2108  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2109  						 &clk_virt SLAVE_QUP_CORE_1 0>,
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2110  						<&gem_noc MASTER_APPSS_PROC 0
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2111  						 &config_noc SLAVE_QUP_1 0>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2112  				power-domains = <&rpmhpd SA8775P_CX>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2113  				operating-points-v2 = <&qup_opp_table_100mhz>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2114  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2115  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2116  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2117  			i2c11: i2c@a90000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2118  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2119  				reg = <0x0 0xa90000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2120  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2121  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2122  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2123  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2124  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2125  				pinctrl-0 = <&qup_i2c11_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2126  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2127  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2128  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2129  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2130  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2131  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2132  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2133  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2134  						     "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2135  						     "qup-memory";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2136  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2137  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2138  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2139  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2140  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2141  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2142  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2143  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2144  			spi11: spi@a90000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2145  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2146  				reg = <0x0 0xa90000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2147  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2148  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2149  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2150  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2151  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2152  				pinctrl-0 = <&qup_spi11_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2153  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2154  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2155  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2156  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2157  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2158  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2159  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2160  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2161  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2162  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2163  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2164  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2165  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2166  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2167  					    "rx";
dc3ad22112de7f Bartosz Golaszewski 2023-03-09  2168  				status = "disabled";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2169  			};
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2170  
34a407316b7d37 Viken Dadhaniya     2024-10-07  2171  			uart11: serial@a90000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  2172  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2173  				reg = <0x0 0x00a90000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2174  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2175  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2176  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
b0334269743599 Viken Dadhaniya     2025-05-09  2177  				pinctrl-0 = <&qup_uart11_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2178  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2179  				interconnect-names = "qup-core", "qup-config";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2180  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  2181  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  2182  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  2183  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2184  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2185  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2186  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2187  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  2188  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2189  			i2c12: i2c@a94000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2190  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2191  				reg = <0x0 0xa94000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2192  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2193  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2194  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2195  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  2196  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2197  				pinctrl-0 = <&qup_i2c12_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2198  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2199  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2200  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
cfd975f588400e Bartosz Golaszewski 2023-03-09  2201  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2202  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2203  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
cfd975f588400e Bartosz Golaszewski 2023-03-09  2204  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  2205  				interconnect-names = "qup-core",
cfd975f588400e Bartosz Golaszewski 2023-03-09  2206  						     "qup-config",
cfd975f588400e Bartosz Golaszewski 2023-03-09  2207  						     "qup-memory";
cfd975f588400e Bartosz Golaszewski 2023-03-09  2208  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2209  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2210  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2211  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2212  					    "rx";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2213  				status = "disabled";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2214  			};
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2215  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2216  			spi12: spi@a94000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2217  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2218  				reg = <0x0 0xa94000 0x0 0x4000>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  2219  				#address-cells = <1>;
cfd975f588400e Bartosz Golaszewski 2023-03-09  2220  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2221  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2222  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2223  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2224  				pinctrl-0 = <&qup_spi12_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2225  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2226  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2227  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2228  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2229  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2230  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2231  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2232  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2233  						     "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2234  						     "qup-memory";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2235  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2236  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2237  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2238  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2239  					    "rx";
cfd975f588400e Bartosz Golaszewski 2023-03-09  2240  				status = "disabled";
cfd975f588400e Bartosz Golaszewski 2023-03-09  2241  			};
cfd975f588400e Bartosz Golaszewski 2023-03-09  2242  
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2243  			uart12: serial@a94000 {
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2244  				compatible = "qcom,geni-uart";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2245  				reg = <0x0 0x00a94000 0x0 0x4000>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2246  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2247  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2248  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2249  				pinctrl-0 = <&qup_uart12_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2250  				pinctrl-names = "default";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2251  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2252  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2253  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2254  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2255  				interconnect-names = "qup-core", "qup-config";
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2256  				power-domains = <&rpmhpd SA8775P_CX>;
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2257  				status = "disabled";
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2258  			};
41ae5ca448c21a Bartosz Golaszewski 2023-03-09  2259  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2260  			i2c13: i2c@a98000 {
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2261  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2262  				reg = <0x0 0xa98000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2263  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2264  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2265  				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2266  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2267  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2268  				pinctrl-0 = <&qup_i2c13_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2269  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2270  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2271  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2272  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2273  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2274  						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2275  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2276  				interconnect-names = "qup-core",
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2277  						     "qup-config",
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2278  						     "qup-memory";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2279  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2280  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2281  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2282  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2283  					    "rx";
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2284  				status = "disabled";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2285  
a23d122572a4ad Bartosz Golaszewski 2023-03-09  2286  			};
dc3ad22112de7f Bartosz Golaszewski 2023-03-09  2287  		};
dc3ad22112de7f Bartosz Golaszewski 2023-03-09  2288  
86348c7587f556 Konrad Dybcio       2024-11-07  2289  		gpi_dma3: dma-controller@b00000  {
a8d18df5a5a114 Konrad Dybcio       2024-11-08  2290  			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2291  			reg = <0x0 0x00b00000 0x0 0x58000>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2292  			#dma-cells = <3>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2293  			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2294  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2295  				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2296  				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2297  			iommus = <&apps_smmu 0x056 0x0>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2298  			dma-channels = <4>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2299  			dma-channel-mask = <0xf>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2300  			status = "disabled";
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2301  		};
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2302  
07e3e17205794c Shazad Hussain      2023-05-26  2303  		qupv3_id_3: geniqup@bc0000 {
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2304  			compatible = "qcom,geni-se-qup";
07e3e17205794c Shazad Hussain      2023-05-26  2305  			reg = <0x0 0xbc0000 0x0 0x6000>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2306  			#address-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2307  			#size-cells = <2>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2308  			ranges;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2309  			clock-names = "m-ahb", "s-ahb";
07e3e17205794c Shazad Hussain      2023-05-26  2310  			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
07e3e17205794c Shazad Hussain      2023-05-26  2311  				<&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
07e3e17205794c Shazad Hussain      2023-05-26  2312  			iommus = <&apps_smmu 0x43 0x0>;
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2313  			status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2314  
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2315  			i2c21: i2c@b80000 {
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2316  				compatible = "qcom,geni-i2c";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2317  				reg = <0x0 0xb80000 0x0 0x4000>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2318  				#address-cells = <1>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2319  				#size-cells = <0>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2320  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2321  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2322  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2323  				pinctrl-0 = <&qup_i2c21_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2324  				pinctrl-names = "default";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2325  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2326  						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2327  					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2328  						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2329  					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2330  						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2331  				interconnect-names = "qup-core",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2332  							 "qup-config",
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2333  							 "qup-memory";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2334  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2335  				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2336  				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2337  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2338  					    "rx";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2339  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2340  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2341  
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2342  			spi21: spi@b80000 {
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2343  				compatible = "qcom,geni-spi";
1b2d7ad5ac14df Shazad Hussain      2023-05-26  2344  				reg = <0x0 0xb80000 0x0 0x4000>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2345  				#address-cells = <1>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2346  				#size-cells = <0>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2347  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2348  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2349  				clock-names = "se";
b0334269743599 Viken Dadhaniya     2025-05-09  2350  				pinctrl-0 = <&qup_spi21_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2351  				pinctrl-names = "default";
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2352  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2353  						&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2354  					   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2355  						&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2356  					   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2357  						&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2358  				interconnect-names = "qup-core",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2359  							 "qup-config",
ee2f5f906d69d9 Shazad Hussain      2023-05-26  2360  							 "qup-memory";
f95f988cf7b609 Bartosz Golaszewski 2023-03-27  2361  				power-domains = <&rpmhpd SA8775P_CX>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2362  				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2363  				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2364  				dma-names = "tx",
34d17ccb5db804 Viken Dadhaniya     2024-10-21  2365  					    "rx";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2366  				status = "disabled";
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2367  			};
34a407316b7d37 Viken Dadhaniya     2024-10-07  2368  
34a407316b7d37 Viken Dadhaniya     2024-10-07  2369  			uart21: serial@b80000 {
34a407316b7d37 Viken Dadhaniya     2024-10-07  2370  				compatible = "qcom,geni-uart";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2371  				reg = <0x0 0x00b80000 0x0 0x4000>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2372  				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2373  				clock-names = "se";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2374  				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2375  				interconnect-names = "qup-core", "qup-config";
b0334269743599 Viken Dadhaniya     2025-05-09  2376  				pinctrl-0 = <&qup_uart21_default>;
b0334269743599 Viken Dadhaniya     2025-05-09  2377  				pinctrl-names = "default";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2378  				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  2379  						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
34a407316b7d37 Viken Dadhaniya     2024-10-07  2380  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
34a407316b7d37 Viken Dadhaniya     2024-10-07  2381  						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2382  				power-domains = <&rpmhpd SA8775P_CX>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2383  				operating-points-v2 = <&qup_opp_table_100mhz>;
34a407316b7d37 Viken Dadhaniya     2024-10-07  2384  				status = "disabled";
34a407316b7d37 Viken Dadhaniya     2024-10-07  2385  			};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2386  		};
603f96d4c9d0cb Bartosz Golaszewski 2023-02-14  2387  
2d04f31103921b Om Prakash Singh    2023-10-16  2388  		rng: rng@10d2000 {
2d04f31103921b Om Prakash Singh    2023-10-16  2389  			compatible = "qcom,sa8775p-trng", "qcom,trng";
2d04f31103921b Om Prakash Singh    2023-10-16  2390  			reg = <0 0x010d2000 0 0x1000>;
2d04f31103921b Om Prakash Singh    2023-10-16  2391  		};
2d04f31103921b Om Prakash Singh    2023-10-16  2392  
050bc0f87af97b Odelu Kukatla       2025-08-08  2393  		config_noc: interconnect@14c0000 {
050bc0f87af97b Odelu Kukatla       2025-08-08  2394  			compatible = "qcom,sa8775p-config-noc";
050bc0f87af97b Odelu Kukatla       2025-08-08  2395  			reg = <0x0 0x014c0000 0x0 0x13080>;
050bc0f87af97b Odelu Kukatla       2025-08-08  2396  			#interconnect-cells = <2>;
050bc0f87af97b Odelu Kukatla       2025-08-08  2397  			qcom,bcm-voters = <&apps_bcm_voter>;
050bc0f87af97b Odelu Kukatla       2025-08-08  2398  		};
050bc0f87af97b Odelu Kukatla       2025-08-08  2399  
050bc0f87af97b Odelu Kukatla       2025-08-08 @2400  		system_noc: interconnect@01680000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
