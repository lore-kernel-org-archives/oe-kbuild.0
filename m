Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24C2A1A4
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 20:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742501951; cv=none; b=WwWCi964dcNcP/PTpkdhFTElk1EhaRx1YX/PTak0guBorHpkF0D2G/PeUs28rjqFygnMzy8BqtHzkXdeOOaQ84yS8y1jOQt1tSp+TvpwxRBGFyisWekoIsbDgTOBjoQGZid7bb9tf5+OuahAKlMBE6P1sR09aGu3rHpzH9+ojlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742501951; c=relaxed/simple;
	bh=K64M2PqhvoHhcaNyAuAz4A1yyMzpBXC97W8Z+hcmCLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fud1PWqJCH9reiUATCSyZh/n4TaXy8eOnpWMHVGgSmn5fx+bqK8cmCe5d0E+8PTsCONA0DlzNzDEghSdNFRKHD2y7gPplv4QVbfrvZCuPX2RhH8KoLR2DpTajGTFIxNTK+pcA112XszjRi8d+lkazY1g2oN42WPBUypWPs8CEMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMBSg9Dm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMBSg9Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742501945; x=1774037945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K64M2PqhvoHhcaNyAuAz4A1yyMzpBXC97W8Z+hcmCLE=;
  b=kMBSg9DmYZw85khRyZNuJXBGg8UOn/Pvq54YZLsfKqN0cBAksJYx1BJ8
   0IeDT52Q+j28i+X4qSvRcidzA/HF54haDDCrwU1ISfOHgOJlyW7xDZE2d
   rwJZSjJFTbi6FyFYWtdUL6wEk8cN1MwOvl4ocuTnTwEEESuEdub7vs9BM
   m0z3pfheqUkuUXGX2ykY2b/230CiStw4c3uBm+Ej+vu0nh65GCq2b9c+w
   j7B5OLiuceRKJzv718PdNN894W7hLZF9EpsSqWodEi36mgAy/OUjP7qv6
   En1LN7l3QaAM1bp/XLvGaQ0thpjsTiNlJ3VfqzBFnP2o8rUpetBgttMXA
   w==;
X-CSE-ConnectionGUID: 6cTuhlHLTMOumJ44jZUqHA==
X-CSE-MsgGUID: IbOlK8cmSaOr16x64+g8Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43683304"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43683304"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 13:19:05 -0700
X-CSE-ConnectionGUID: oDuAGWI3TIW1t2ValO1kdg==
X-CSE-MsgGUID: uW+hNpurTX2kkofypqMMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="127889537"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2025 13:19:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvMM0-0000kN-1H;
	Thu, 20 Mar 2025 20:19:00 +0000
Date: Fri, 21 Mar 2025 04:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/sm8750-base 11/28]
 arch/arm64/boot/dts/qcom/sm8750.dtsi:2018.34-2019.8: Warning
 (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection
 to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
Message-ID: <202503210419.UyzhH4Y9-lkp@intel.com>
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
TO: Wesley Cheng <quic_wcheng@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux track/sm8750-base
head:   d01c3a28dfc0a3260ba638894b372f269523822b
commit: e36f92c96f6fabc9c0316b72398d2a31c2c976e6 [11/28] arm64: dts: qcom: Add USB orientation support for MTP and QRD
:::::: branch date: 25 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210419.UyzhH4Y9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210419.UyzhH4Y9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503210419.UyzhH4Y9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:2018.34-2019.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:2111.31-2112.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
--
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:2018.34-2019.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:2111.31-2112.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'

vim +2018 arch/arm64/boot/dts/qcom/sm8750.dtsi

068c3d3c83be47 Melody Olvera       2024-12-04    17  
068c3d3c83be47 Melody Olvera       2024-12-04    18  / {
068c3d3c83be47 Melody Olvera       2024-12-04    19  	interrupt-parent = <&intc>;
068c3d3c83be47 Melody Olvera       2024-12-04    20  
068c3d3c83be47 Melody Olvera       2024-12-04    21  	#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    22  	#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    23  
068c3d3c83be47 Melody Olvera       2024-12-04    24  	cpus {
068c3d3c83be47 Melody Olvera       2024-12-04    25  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    26  		#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04    27  
068c3d3c83be47 Melody Olvera       2024-12-04    28  		cpu0: cpu@0 {
068c3d3c83be47 Melody Olvera       2024-12-04    29  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    30  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    31  			reg = <0x0 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04    32  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    33  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    34  			power-domains = <&cpu_pd0>;
068c3d3c83be47 Melody Olvera       2024-12-04    35  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    36  
068c3d3c83be47 Melody Olvera       2024-12-04    37  			l2_0: l2-cache {
068c3d3c83be47 Melody Olvera       2024-12-04    38  				compatible = "cache";
068c3d3c83be47 Melody Olvera       2024-12-04    39  				cache-level = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    40  				cache-unified;
068c3d3c83be47 Melody Olvera       2024-12-04    41  			};
068c3d3c83be47 Melody Olvera       2024-12-04    42  		};
068c3d3c83be47 Melody Olvera       2024-12-04    43  
068c3d3c83be47 Melody Olvera       2024-12-04    44  		cpu1: cpu@100 {
068c3d3c83be47 Melody Olvera       2024-12-04    45  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    46  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    47  			reg = <0x0 0x100>;
068c3d3c83be47 Melody Olvera       2024-12-04    48  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    49  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    50  			power-domains = <&cpu_pd1>;
068c3d3c83be47 Melody Olvera       2024-12-04    51  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    52  		};
068c3d3c83be47 Melody Olvera       2024-12-04    53  
068c3d3c83be47 Melody Olvera       2024-12-04    54  		cpu2: cpu@200 {
068c3d3c83be47 Melody Olvera       2024-12-04    55  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    56  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    57  			reg = <0x0 0x200>;
068c3d3c83be47 Melody Olvera       2024-12-04    58  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    59  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    60  			power-domains = <&cpu_pd2>;
068c3d3c83be47 Melody Olvera       2024-12-04    61  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    62  		};
068c3d3c83be47 Melody Olvera       2024-12-04    63  
068c3d3c83be47 Melody Olvera       2024-12-04    64  		cpu3: cpu@300 {
068c3d3c83be47 Melody Olvera       2024-12-04    65  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    66  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    67  			reg = <0x0 0x300>;
068c3d3c83be47 Melody Olvera       2024-12-04    68  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    69  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    70  			power-domains = <&cpu_pd3>;
068c3d3c83be47 Melody Olvera       2024-12-04    71  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    72  		};
068c3d3c83be47 Melody Olvera       2024-12-04    73  
068c3d3c83be47 Melody Olvera       2024-12-04    74  		cpu4: cpu@400 {
068c3d3c83be47 Melody Olvera       2024-12-04    75  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    76  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    77  			reg = <0x0 0x400>;
068c3d3c83be47 Melody Olvera       2024-12-04    78  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    79  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    80  			power-domains = <&cpu_pd4>;
068c3d3c83be47 Melody Olvera       2024-12-04    81  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    82  		};
068c3d3c83be47 Melody Olvera       2024-12-04    83  
068c3d3c83be47 Melody Olvera       2024-12-04    84  		cpu5: cpu@500 {
068c3d3c83be47 Melody Olvera       2024-12-04    85  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    86  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    87  			reg = <0x0 0x500>;
068c3d3c83be47 Melody Olvera       2024-12-04    88  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    89  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    90  			power-domains = <&cpu_pd5>;
068c3d3c83be47 Melody Olvera       2024-12-04    91  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    92  		};
068c3d3c83be47 Melody Olvera       2024-12-04    93  
068c3d3c83be47 Melody Olvera       2024-12-04    94  		cpu6: cpu@10000 {
068c3d3c83be47 Melody Olvera       2024-12-04    95  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    96  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    97  			reg = <0x0 0x10000>;
068c3d3c83be47 Melody Olvera       2024-12-04    98  			enable-method = "psci";
91e3ac15523fda Krzysztof Kozlowski 2025-02-19    99  			next-level-cache = <&l2_1>;
068c3d3c83be47 Melody Olvera       2024-12-04   100  			power-domains = <&cpu_pd6>;
068c3d3c83be47 Melody Olvera       2024-12-04   101  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   102  
91e3ac15523fda Krzysztof Kozlowski 2025-02-19   103  			l2_1: l2-cache {
068c3d3c83be47 Melody Olvera       2024-12-04   104  				compatible = "cache";
068c3d3c83be47 Melody Olvera       2024-12-04   105  				cache-level = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   106  				cache-unified;
068c3d3c83be47 Melody Olvera       2024-12-04   107  			};
068c3d3c83be47 Melody Olvera       2024-12-04   108  		};
068c3d3c83be47 Melody Olvera       2024-12-04   109  
068c3d3c83be47 Melody Olvera       2024-12-04   110  		cpu7: cpu@10100 {
068c3d3c83be47 Melody Olvera       2024-12-04   111  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04   112  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04   113  			reg = <0x0 0x10100>;
068c3d3c83be47 Melody Olvera       2024-12-04   114  			enable-method = "psci";
91e3ac15523fda Krzysztof Kozlowski 2025-02-19   115  			next-level-cache = <&l2_1>;
068c3d3c83be47 Melody Olvera       2024-12-04   116  			power-domains = <&cpu_pd7>;
068c3d3c83be47 Melody Olvera       2024-12-04   117  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   118  		};
068c3d3c83be47 Melody Olvera       2024-12-04   119  
068c3d3c83be47 Melody Olvera       2024-12-04   120  		cpu-map {
068c3d3c83be47 Melody Olvera       2024-12-04   121  			cluster0 {
068c3d3c83be47 Melody Olvera       2024-12-04   122  				core0 {
068c3d3c83be47 Melody Olvera       2024-12-04   123  					cpu = <&cpu0>;
068c3d3c83be47 Melody Olvera       2024-12-04   124  				};
068c3d3c83be47 Melody Olvera       2024-12-04   125  
068c3d3c83be47 Melody Olvera       2024-12-04   126  				core1 {
068c3d3c83be47 Melody Olvera       2024-12-04   127  					cpu = <&cpu1>;
068c3d3c83be47 Melody Olvera       2024-12-04   128  				};
068c3d3c83be47 Melody Olvera       2024-12-04   129  
068c3d3c83be47 Melody Olvera       2024-12-04   130  				core2 {
068c3d3c83be47 Melody Olvera       2024-12-04   131  					cpu = <&cpu2>;
068c3d3c83be47 Melody Olvera       2024-12-04   132  				};
068c3d3c83be47 Melody Olvera       2024-12-04   133  
068c3d3c83be47 Melody Olvera       2024-12-04   134  				core3 {
068c3d3c83be47 Melody Olvera       2024-12-04   135  					cpu = <&cpu3>;
068c3d3c83be47 Melody Olvera       2024-12-04   136  				};
068c3d3c83be47 Melody Olvera       2024-12-04   137  
068c3d3c83be47 Melody Olvera       2024-12-04   138  				core4 {
068c3d3c83be47 Melody Olvera       2024-12-04   139  					cpu = <&cpu4>;
068c3d3c83be47 Melody Olvera       2024-12-04   140  				};
068c3d3c83be47 Melody Olvera       2024-12-04   141  
068c3d3c83be47 Melody Olvera       2024-12-04   142  				core5 {
068c3d3c83be47 Melody Olvera       2024-12-04   143  					cpu = <&cpu5>;
068c3d3c83be47 Melody Olvera       2024-12-04   144  				};
068c3d3c83be47 Melody Olvera       2024-12-04   145  			};
068c3d3c83be47 Melody Olvera       2024-12-04   146  
068c3d3c83be47 Melody Olvera       2024-12-04   147  			cluster1 {
068c3d3c83be47 Melody Olvera       2024-12-04   148  				core0 {
068c3d3c83be47 Melody Olvera       2024-12-04   149  					cpu = <&cpu6>;
068c3d3c83be47 Melody Olvera       2024-12-04   150  				};
068c3d3c83be47 Melody Olvera       2024-12-04   151  
068c3d3c83be47 Melody Olvera       2024-12-04   152  				core1 {
068c3d3c83be47 Melody Olvera       2024-12-04   153  					cpu = <&cpu7>;
068c3d3c83be47 Melody Olvera       2024-12-04   154  				};
068c3d3c83be47 Melody Olvera       2024-12-04   155  			};
068c3d3c83be47 Melody Olvera       2024-12-04   156  		};
068c3d3c83be47 Melody Olvera       2024-12-04   157  
068c3d3c83be47 Melody Olvera       2024-12-04   158  		idle-states {
068c3d3c83be47 Melody Olvera       2024-12-04   159  			entry-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   160  
068c3d3c83be47 Melody Olvera       2024-12-04   161  			cluster0_c4: cpu-sleep-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   162  				compatible = "arm,idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   163  				idle-state-name = "ret";
068c3d3c83be47 Melody Olvera       2024-12-04   164  				arm,psci-suspend-param = <0x00000004>;
068c3d3c83be47 Melody Olvera       2024-12-04   165  				entry-latency-us = <93>;
068c3d3c83be47 Melody Olvera       2024-12-04   166  				exit-latency-us = <129>;
068c3d3c83be47 Melody Olvera       2024-12-04   167  				min-residency-us = <560>;
068c3d3c83be47 Melody Olvera       2024-12-04   168  			};
068c3d3c83be47 Melody Olvera       2024-12-04   169  
068c3d3c83be47 Melody Olvera       2024-12-04   170  			cluster1_c4: cpu-sleep-1 {
068c3d3c83be47 Melody Olvera       2024-12-04   171  				compatible = "arm,idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   172  				idle-state-name = "ret";
068c3d3c83be47 Melody Olvera       2024-12-04   173  				arm,psci-suspend-param = <0x00000004>;
068c3d3c83be47 Melody Olvera       2024-12-04   174  				entry-latency-us = <172>;
068c3d3c83be47 Melody Olvera       2024-12-04   175  				exit-latency-us = <130>;
068c3d3c83be47 Melody Olvera       2024-12-04   176  				min-residency-us = <686>;
068c3d3c83be47 Melody Olvera       2024-12-04   177  			};
068c3d3c83be47 Melody Olvera       2024-12-04   178  
068c3d3c83be47 Melody Olvera       2024-12-04   179  		};
068c3d3c83be47 Melody Olvera       2024-12-04   180  
068c3d3c83be47 Melody Olvera       2024-12-04   181  		domain-idle-states {
068c3d3c83be47 Melody Olvera       2024-12-04   182  			cluster_cl5: cluster-sleep-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   183  				compatible = "domain-idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   184  				arm,psci-suspend-param = <0x01000054>;
068c3d3c83be47 Melody Olvera       2024-12-04   185  				entry-latency-us = <2150>;
068c3d3c83be47 Melody Olvera       2024-12-04   186  				exit-latency-us = <1983>;
068c3d3c83be47 Melody Olvera       2024-12-04   187  				min-residency-us = <9144>;
068c3d3c83be47 Melody Olvera       2024-12-04   188  			};
068c3d3c83be47 Melody Olvera       2024-12-04   189  
068c3d3c83be47 Melody Olvera       2024-12-04   190  			domain_ss3: domain-sleep-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   191  				compatible = "domain-idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   192  				arm,psci-suspend-param = <0x0200c354>;
068c3d3c83be47 Melody Olvera       2024-12-04   193  				entry-latency-us = <2800>;
068c3d3c83be47 Melody Olvera       2024-12-04   194  				exit-latency-us = <4400>;
068c3d3c83be47 Melody Olvera       2024-12-04   195  				min-residency-us = <10150>;
068c3d3c83be47 Melody Olvera       2024-12-04   196  			};
068c3d3c83be47 Melody Olvera       2024-12-04   197  		};
068c3d3c83be47 Melody Olvera       2024-12-04   198  	};
068c3d3c83be47 Melody Olvera       2024-12-04   199  
068c3d3c83be47 Melody Olvera       2024-12-04   200  	firmware {
068c3d3c83be47 Melody Olvera       2024-12-04   201  		scm: scm {
068c3d3c83be47 Melody Olvera       2024-12-04   202  			compatible = "qcom,scm-sm8750", "qcom,scm";
068c3d3c83be47 Melody Olvera       2024-12-04   203  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   204  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   205  		};
068c3d3c83be47 Melody Olvera       2024-12-04   206  	};
068c3d3c83be47 Melody Olvera       2024-12-04   207  
068c3d3c83be47 Melody Olvera       2024-12-04   208  	clk_virt: interconnect-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   209  		compatible = "qcom,sm8750-clk-virt";
068c3d3c83be47 Melody Olvera       2024-12-04   210  		#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   211  		qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04   212  	};
068c3d3c83be47 Melody Olvera       2024-12-04   213  
068c3d3c83be47 Melody Olvera       2024-12-04   214  	mc_virt: interconnect-1 {
068c3d3c83be47 Melody Olvera       2024-12-04   215  		compatible = "qcom,sm8750-mc-virt";
068c3d3c83be47 Melody Olvera       2024-12-04   216  		#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   217  		qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04   218  	};
068c3d3c83be47 Melody Olvera       2024-12-04   219  
068c3d3c83be47 Melody Olvera       2024-12-04   220  	memory@a0000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   221  		device_type = "memory";
068c3d3c83be47 Melody Olvera       2024-12-04   222  		/* We expect the bootloader to fill in the size */
068c3d3c83be47 Melody Olvera       2024-12-04   223  		reg = <0x0 0xa0000000 0x0 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04   224  	};
068c3d3c83be47 Melody Olvera       2024-12-04   225  
068c3d3c83be47 Melody Olvera       2024-12-04   226  	pmu {
068c3d3c83be47 Melody Olvera       2024-12-04   227  		compatible = "arm,armv8-pmuv3";
068c3d3c83be47 Melody Olvera       2024-12-04   228  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
068c3d3c83be47 Melody Olvera       2024-12-04   229  	};
068c3d3c83be47 Melody Olvera       2024-12-04   230  
068c3d3c83be47 Melody Olvera       2024-12-04   231  	psci {
068c3d3c83be47 Melody Olvera       2024-12-04   232  		compatible = "arm,psci-1.0";
068c3d3c83be47 Melody Olvera       2024-12-04   233  		method = "smc";
068c3d3c83be47 Melody Olvera       2024-12-04   234  
068c3d3c83be47 Melody Olvera       2024-12-04   235  		cpu_pd0: power-domain-cpu0 {
068c3d3c83be47 Melody Olvera       2024-12-04   236  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   237  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   238  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   239  		};
068c3d3c83be47 Melody Olvera       2024-12-04   240  
068c3d3c83be47 Melody Olvera       2024-12-04   241  		cpu_pd1: power-domain-cpu1 {
068c3d3c83be47 Melody Olvera       2024-12-04   242  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   243  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   244  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   245  		};
068c3d3c83be47 Melody Olvera       2024-12-04   246  
068c3d3c83be47 Melody Olvera       2024-12-04   247  		cpu_pd2: power-domain-cpu2 {
068c3d3c83be47 Melody Olvera       2024-12-04   248  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   249  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   250  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   251  		};
068c3d3c83be47 Melody Olvera       2024-12-04   252  
068c3d3c83be47 Melody Olvera       2024-12-04   253  		cpu_pd3: power-domain-cpu3 {
068c3d3c83be47 Melody Olvera       2024-12-04   254  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   255  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   256  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   257  		};
068c3d3c83be47 Melody Olvera       2024-12-04   258  
068c3d3c83be47 Melody Olvera       2024-12-04   259  		cpu_pd4: power-domain-cpu4 {
068c3d3c83be47 Melody Olvera       2024-12-04   260  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   261  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   262  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   263  		};
068c3d3c83be47 Melody Olvera       2024-12-04   264  
068c3d3c83be47 Melody Olvera       2024-12-04   265  		cpu_pd5: power-domain-cpu5 {
068c3d3c83be47 Melody Olvera       2024-12-04   266  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   267  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   268  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   269  		};
068c3d3c83be47 Melody Olvera       2024-12-04   270  
068c3d3c83be47 Melody Olvera       2024-12-04   271  		cpu_pd6: power-domain-cpu6 {
068c3d3c83be47 Melody Olvera       2024-12-04   272  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   273  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   274  			domain-idle-states = <&cluster1_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   275  		};
068c3d3c83be47 Melody Olvera       2024-12-04   276  
068c3d3c83be47 Melody Olvera       2024-12-04   277  		cpu_pd7: power-domain-cpu7 {
068c3d3c83be47 Melody Olvera       2024-12-04   278  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   279  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   280  			domain-idle-states = <&cluster1_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   281  		};
068c3d3c83be47 Melody Olvera       2024-12-04   282  
068c3d3c83be47 Melody Olvera       2024-12-04   283  		cluster_pd: power-domain-cluster {
068c3d3c83be47 Melody Olvera       2024-12-04   284  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   285  			domain-idle-states = <&cluster_cl5>;
068c3d3c83be47 Melody Olvera       2024-12-04   286  			power-domains = <&system_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   287  		};
068c3d3c83be47 Melody Olvera       2024-12-04   288  
068c3d3c83be47 Melody Olvera       2024-12-04   289  		system_pd: power-domain-system {
068c3d3c83be47 Melody Olvera       2024-12-04   290  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   291  			domain-idle-states = <&domain_ss3>;
068c3d3c83be47 Melody Olvera       2024-12-04   292  		};
068c3d3c83be47 Melody Olvera       2024-12-04   293  	};
068c3d3c83be47 Melody Olvera       2024-12-04   294  
068c3d3c83be47 Melody Olvera       2024-12-04   295  	reserved-memory {
068c3d3c83be47 Melody Olvera       2024-12-04   296  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   297  		#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   298  		ranges;
068c3d3c83be47 Melody Olvera       2024-12-04   299  
068c3d3c83be47 Melody Olvera       2024-12-04   300  		gunyah_hyp_mem: gunyah-hyp@80000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   301  			reg = <0x0 0x80000000 0x0 0xe00000>;
068c3d3c83be47 Melody Olvera       2024-12-04   302  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   303  		};
068c3d3c83be47 Melody Olvera       2024-12-04   304  
068c3d3c83be47 Melody Olvera       2024-12-04   305  		cpusys_vm_mem: cpusys-vm-mem@80e00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   306  			reg = <0x0 0x80e00000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   307  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   308  		};
068c3d3c83be47 Melody Olvera       2024-12-04   309  
068c3d3c83be47 Melody Olvera       2024-12-04   310  		cpucp_mem: cpucp@81200000 {
068c3d3c83be47 Melody Olvera       2024-12-04   311  			reg = <0x0 0x81200000 0x0 0x200000>;
068c3d3c83be47 Melody Olvera       2024-12-04   312  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   313  		};
068c3d3c83be47 Melody Olvera       2024-12-04   314  
068c3d3c83be47 Melody Olvera       2024-12-04   315  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   316  			reg = <0x0 0x81a00000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   317  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   318  		};
068c3d3c83be47 Melody Olvera       2024-12-04   319  
068c3d3c83be47 Melody Olvera       2024-12-04   320  		aop_image_mem: aop-image@81c00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   321  			reg = <0x0 0x81c00000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera       2024-12-04   322  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   323  		};
068c3d3c83be47 Melody Olvera       2024-12-04   324  
068c3d3c83be47 Melody Olvera       2024-12-04   325  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
068c3d3c83be47 Melody Olvera       2024-12-04   326  			compatible = "qcom,cmd-db";
068c3d3c83be47 Melody Olvera       2024-12-04   327  			reg = <0x0 0x81c60000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera       2024-12-04   328  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   329  		};
068c3d3c83be47 Melody Olvera       2024-12-04   330  
068c3d3c83be47 Melody Olvera       2024-12-04   331  		/* Merged aop_config, tme_crash_dump, tme_log and uefi_log regions */
068c3d3c83be47 Melody Olvera       2024-12-04   332  		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
068c3d3c83be47 Melody Olvera       2024-12-04   333  			reg = <0x0 0x81c80000 0x0 0x74000>;
068c3d3c83be47 Melody Olvera       2024-12-04   334  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   335  		};
068c3d3c83be47 Melody Olvera       2024-12-04   336  
068c3d3c83be47 Melody Olvera       2024-12-04   337  		/* Secdata region can be reused by apps */
068c3d3c83be47 Melody Olvera       2024-12-04   338  
068c3d3c83be47 Melody Olvera       2024-12-04   339  		smem_mem: smem@81d00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   340  			compatible = "qcom,smem";
068c3d3c83be47 Melody Olvera       2024-12-04   341  			reg = <0x0 0x81d00000 0x0 0x200000>;
068c3d3c83be47 Melody Olvera       2024-12-04   342  			hwlocks = <&tcsr_mutex 3>;
068c3d3c83be47 Melody Olvera       2024-12-04   343  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   344  		};
068c3d3c83be47 Melody Olvera       2024-12-04   345  
068c3d3c83be47 Melody Olvera       2024-12-04   346  		pdp_ns_shared_mem: pdp-ns-shared@81f00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   347  			reg = <0x0 0x81f00000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   348  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   349  		};
068c3d3c83be47 Melody Olvera       2024-12-04   350  
068c3d3c83be47 Melody Olvera       2024-12-04   351  		cpucp_scandump_mem: cpucp-scandump@82000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   352  			reg = <0x0 0x82000000 0x0 0x380000>;
068c3d3c83be47 Melody Olvera       2024-12-04   353  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   354  		};
068c3d3c83be47 Melody Olvera       2024-12-04   355  
068c3d3c83be47 Melody Olvera       2024-12-04   356  		adsp_mhi_mem: adsp-mhi@82380000 {
068c3d3c83be47 Melody Olvera       2024-12-04   357  			reg = <0x0 0x82380000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera       2024-12-04   358  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   359  		};
068c3d3c83be47 Melody Olvera       2024-12-04   360  
068c3d3c83be47 Melody Olvera       2024-12-04   361  		soccp_sdi_mem: soccp-sdi@823a0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   362  			reg = <0x0 0x823a0000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   363  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   364  		};
068c3d3c83be47 Melody Olvera       2024-12-04   365  
068c3d3c83be47 Melody Olvera       2024-12-04   366  		pmic_minii_dump_mem: pmic-minii-dump@823e0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   367  			reg = <0x0 0x823e0000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   368  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   369  		};
068c3d3c83be47 Melody Olvera       2024-12-04   370  
068c3d3c83be47 Melody Olvera       2024-12-04   371  		pvmfw_mem: pvmfw@824a0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   372  			reg = <0x0 0x824a0000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   373  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   374  		};
068c3d3c83be47 Melody Olvera       2024-12-04   375  
068c3d3c83be47 Melody Olvera       2024-12-04   376  		global_sync_mem: global-sync@82600000 {
068c3d3c83be47 Melody Olvera       2024-12-04   377  			reg = <0x0 0x82600000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   378  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   379  		};
068c3d3c83be47 Melody Olvera       2024-12-04   380  
068c3d3c83be47 Melody Olvera       2024-12-04   381  		tz_stat_mem: tz-stat@82700000 {
068c3d3c83be47 Melody Olvera       2024-12-04   382  			reg = <0x0 0x82700000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   383  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   384  		};
068c3d3c83be47 Melody Olvera       2024-12-04   385  
068c3d3c83be47 Melody Olvera       2024-12-04   386  		qdss_mem: qdss@82800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   387  			reg = <0x0 0x82800000 0x0 0x2000000>;
068c3d3c83be47 Melody Olvera       2024-12-04   388  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   389  		};
068c3d3c83be47 Melody Olvera       2024-12-04   390  
068c3d3c83be47 Melody Olvera       2024-12-04   391  		dsm_partition_1_mem: dsm-partition-1@84a00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   392  			reg = <0x0 0x84a00000 0x0 0x4900000>;
068c3d3c83be47 Melody Olvera       2024-12-04   393  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   394  		};
068c3d3c83be47 Melody Olvera       2024-12-04   395  
068c3d3c83be47 Melody Olvera       2024-12-04   396  		dsm_partition_2_mem: dsm-partition-2@89300000 {
068c3d3c83be47 Melody Olvera       2024-12-04   397  			reg = <0x0 0x89300000 0x0 0xa80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   398  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   399  		};
068c3d3c83be47 Melody Olvera       2024-12-04   400  
068c3d3c83be47 Melody Olvera       2024-12-04   401  		mpss_mem: mpss@8ba00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   402  			reg = <0x0 0x8ba00000 0x0 0xf600000>;
068c3d3c83be47 Melody Olvera       2024-12-04   403  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   404  		};
068c3d3c83be47 Melody Olvera       2024-12-04   405  
068c3d3c83be47 Melody Olvera       2024-12-04   406  		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   407  			reg = <0x0 0x9b000000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   408  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   409  		};
068c3d3c83be47 Melody Olvera       2024-12-04   410  
068c3d3c83be47 Melody Olvera       2024-12-04   411  		ipa_fw_mem: ipa-fw@9b080000 {
068c3d3c83be47 Melody Olvera       2024-12-04   412  			reg = <0x0 0x9b080000 0x0 0x10000>;
068c3d3c83be47 Melody Olvera       2024-12-04   413  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   414  		};
068c3d3c83be47 Melody Olvera       2024-12-04   415  
068c3d3c83be47 Melody Olvera       2024-12-04   416  		ipa_gsi_mem: ipa-gsi@9b090000 {
068c3d3c83be47 Melody Olvera       2024-12-04   417  			reg = <0x0 0x9b090000 0x0 0xa000>;
068c3d3c83be47 Melody Olvera       2024-12-04   418  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   419  		};
068c3d3c83be47 Melody Olvera       2024-12-04   420  
068c3d3c83be47 Melody Olvera       2024-12-04   421  		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
068c3d3c83be47 Melody Olvera       2024-12-04   422  			reg = <0x0 0x9b09a000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04   423  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   424  		};
068c3d3c83be47 Melody Olvera       2024-12-04   425  
068c3d3c83be47 Melody Olvera       2024-12-04   426  		spss_region_mem: spss@9b0a0000  {
068c3d3c83be47 Melody Olvera       2024-12-04   427  			reg = <0x0 0x9b0a0000 0x0 0x1e0000>;
068c3d3c83be47 Melody Olvera       2024-12-04   428  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   429  		};
068c3d3c83be47 Melody Olvera       2024-12-04   430  
068c3d3c83be47 Melody Olvera       2024-12-04   431  		/* First part of the "SPU secure shared memory" region */
068c3d3c83be47 Melody Olvera       2024-12-04   432  		spu_tz_shared_mem: spu-tz-shared@9b280000 {
068c3d3c83be47 Melody Olvera       2024-12-04   433  			reg = <0x0 0x9b280000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   434  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   435  		};
068c3d3c83be47 Melody Olvera       2024-12-04   436  
068c3d3c83be47 Melody Olvera       2024-12-04   437  		/* Second part of the "SPU secure shared memory" region */
068c3d3c83be47 Melody Olvera       2024-12-04   438  		spu_modem_shared_mem: spu-modem-shared@9b2c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   439  			reg = <0x0 0x9b2c0000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   440  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   441  		};
068c3d3c83be47 Melody Olvera       2024-12-04   442  
068c3d3c83be47 Melody Olvera       2024-12-04   443  		camera_mem: camera@9b300000 {
068c3d3c83be47 Melody Olvera       2024-12-04   444  			reg = <0x0 0x9b300000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   445  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   446  		};
068c3d3c83be47 Melody Olvera       2024-12-04   447  
068c3d3c83be47 Melody Olvera       2024-12-04   448  		camera_2_mem: camera-2@9bb00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   449  			reg = <0x0 0x9bb00000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   450  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   451  		};
068c3d3c83be47 Melody Olvera       2024-12-04   452  
068c3d3c83be47 Melody Olvera       2024-12-04   453  		video_mem: video@9c300000 {
068c3d3c83be47 Melody Olvera       2024-12-04   454  			reg = <0x0 0x9c300000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   455  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   456  		};
068c3d3c83be47 Melody Olvera       2024-12-04   457  
068c3d3c83be47 Melody Olvera       2024-12-04   458  		cvp_mem: cvp@9cb00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   459  			reg = <0x0 0x9cb00000 0x0 0x700000>;
068c3d3c83be47 Melody Olvera       2024-12-04   460  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   461  		};
068c3d3c83be47 Melody Olvera       2024-12-04   462  
068c3d3c83be47 Melody Olvera       2024-12-04   463  		cdsp_mem: cdsp@9d200000 {
068c3d3c83be47 Melody Olvera       2024-12-04   464  			reg = <0x0 0x9d200000 0x0 0x1900000>;
068c3d3c83be47 Melody Olvera       2024-12-04   465  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   466  		};
068c3d3c83be47 Melody Olvera       2024-12-04   467  
068c3d3c83be47 Melody Olvera       2024-12-04   468  		q6_cdsp_dtb_mem: q6-cdsp-dtb@9eb00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   469  			reg = <0x0 0x9eb00000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   470  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   471  		};
068c3d3c83be47 Melody Olvera       2024-12-04   472  
068c3d3c83be47 Melody Olvera       2024-12-04   473  		soccp_mem: soccp@9ec00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   474  			reg = <0x0 0x9ec00000 0x0 0x180000>;
068c3d3c83be47 Melody Olvera       2024-12-04   475  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   476  		};
068c3d3c83be47 Melody Olvera       2024-12-04   477  
068c3d3c83be47 Melody Olvera       2024-12-04   478  		q6_adsp_dtb_mem: q6-adsp-dtb@9ed80000 {
068c3d3c83be47 Melody Olvera       2024-12-04   479  			reg = <0x0 0x9ed80000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   480  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   481  		};
068c3d3c83be47 Melody Olvera       2024-12-04   482  
068c3d3c83be47 Melody Olvera       2024-12-04   483  		adspslpi_mem: adspslpi@9ee00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   484  			reg = <0x0 0x9ee00000 0x0 0x3a80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   485  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   486  		};
068c3d3c83be47 Melody Olvera       2024-12-04   487  
068c3d3c83be47 Melody Olvera       2024-12-04   488  		xbl_ramdump_mem: xbl-ramdump@b8000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   489  			reg = <0x0 0xb8000000 0x0 0x1c0000>;
068c3d3c83be47 Melody Olvera       2024-12-04   490  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   491  		};
068c3d3c83be47 Melody Olvera       2024-12-04   492  
068c3d3c83be47 Melody Olvera       2024-12-04   493  		hwfence_shbuf: hwfence-shbuf@d4e23000 {
068c3d3c83be47 Melody Olvera       2024-12-04   494  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   495  			reg = <0x0 0xd4e23000 0x0 0x2dd000>;
068c3d3c83be47 Melody Olvera       2024-12-04   496  		};
068c3d3c83be47 Melody Olvera       2024-12-04   497  
068c3d3c83be47 Melody Olvera       2024-12-04   498  		/* Merged tz_reserved, xbl_sc, and qtee regions */
068c3d3c83be47 Melody Olvera       2024-12-04   499  		tz_merged_mem: tz-merged@d8000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   500  			reg = <0x0 0xd8000000 0x0 0x600000>;
068c3d3c83be47 Melody Olvera       2024-12-04   501  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   502  		};
068c3d3c83be47 Melody Olvera       2024-12-04   503  
068c3d3c83be47 Melody Olvera       2024-12-04   504  		trust_ui_vm_mem: trust-ui-vm@f3800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   505  			reg = <0x0 0xf3800000 0x0 0x4400000>;
068c3d3c83be47 Melody Olvera       2024-12-04   506  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   507  		};
068c3d3c83be47 Melody Olvera       2024-12-04   508  
068c3d3c83be47 Melody Olvera       2024-12-04   509  		oem_vm_mem: oem-vm@f7c00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   510  			reg = <0x0 0xf7c00000 0x0 0x4c00000>;
068c3d3c83be47 Melody Olvera       2024-12-04   511  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   512  		};
068c3d3c83be47 Melody Olvera       2024-12-04   513  
068c3d3c83be47 Melody Olvera       2024-12-04   514  		llcc_lpi_mem: llcc-lpi@ff800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   515  			reg = <0x0 0xff800000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   516  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   517  		};
068c3d3c83be47 Melody Olvera       2024-12-04   518  	};
068c3d3c83be47 Melody Olvera       2024-12-04   519  
068c3d3c83be47 Melody Olvera       2024-12-04   520  	soc: soc@0 {
068c3d3c83be47 Melody Olvera       2024-12-04   521  		compatible = "simple-bus";
068c3d3c83be47 Melody Olvera       2024-12-04   522  
068c3d3c83be47 Melody Olvera       2024-12-04   523  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   524  		#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   525  		dma-ranges = <0 0 0 0 0x10 0>;
068c3d3c83be47 Melody Olvera       2024-12-04   526  		ranges = <0 0 0 0 0x10 0>;
068c3d3c83be47 Melody Olvera       2024-12-04   527  
068c3d3c83be47 Melody Olvera       2024-12-04   528  		gcc: clock-controller@100000 {
068c3d3c83be47 Melody Olvera       2024-12-04   529  			compatible = "qcom,sm8750-gcc";
068c3d3c83be47 Melody Olvera       2024-12-04   530  			reg = <0x0 0x00100000 0x0 0x1f4200>;
068c3d3c83be47 Melody Olvera       2024-12-04   531  
068c3d3c83be47 Melody Olvera       2024-12-04   532  			clocks = <&bi_tcxo_div2>,
068c3d3c83be47 Melody Olvera       2024-12-04   533  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   534  				 <&sleep_clk>,
068c3d3c83be47 Melody Olvera       2024-12-04   535  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   536  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   537  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   538  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   539  				 <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   540  
068c3d3c83be47 Melody Olvera       2024-12-04   541  			#clock-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   542  			#reset-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   543  			#power-domain-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   544  		};
068c3d3c83be47 Melody Olvera       2024-12-04   545  
068c3d3c83be47 Melody Olvera       2024-12-04   546  		gpi_dma2: dma-controller@800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   547  			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
068c3d3c83be47 Melody Olvera       2024-12-04   548  			reg = <0x0 0x00800000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera       2024-12-04   549  
068c3d3c83be47 Melody Olvera       2024-12-04   550  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   551  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   552  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   553  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   554  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   555  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   556  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   557  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   558  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   559  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   560  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   561  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   562  
068c3d3c83be47 Melody Olvera       2024-12-04   563  			dma-channels = <12>;
068c3d3c83be47 Melody Olvera       2024-12-04   564  			dma-channel-mask = <0x1e>;
068c3d3c83be47 Melody Olvera       2024-12-04   565  			#dma-cells = <3>;
068c3d3c83be47 Melody Olvera       2024-12-04   566  
068c3d3c83be47 Melody Olvera       2024-12-04   567  			iommus = <&apps_smmu 0x436 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04   568  
068c3d3c83be47 Melody Olvera       2024-12-04   569  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   570  		};
068c3d3c83be47 Melody Olvera       2024-12-04   571  
068c3d3c83be47 Melody Olvera       2024-12-04   572  		qupv3_2: geniqup@8c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   573  			compatible = "qcom,geni-se-qup";
068c3d3c83be47 Melody Olvera       2024-12-04   574  			reg = <0x0 0x008c0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04   575  
068c3d3c83be47 Melody Olvera       2024-12-04   576  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04   577  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   578  			clock-names = "m-ahb",
068c3d3c83be47 Melody Olvera       2024-12-04   579  				      "s-ahb";
068c3d3c83be47 Melody Olvera       2024-12-04   580  
068c3d3c83be47 Melody Olvera       2024-12-04   581  			iommus = <&apps_smmu 0x423 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04   582  
068c3d3c83be47 Melody Olvera       2024-12-04   583  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   584  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   585  			ranges;
068c3d3c83be47 Melody Olvera       2024-12-04   586  
068c3d3c83be47 Melody Olvera       2024-12-04   587  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   588  
068c3d3c83be47 Melody Olvera       2024-12-04   589  			i2c8: i2c@880000 {
068c3d3c83be47 Melody Olvera       2024-12-04   590  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   591  				reg = <0x0 0x00880000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   592  
068c3d3c83be47 Melody Olvera       2024-12-04   593  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   594  
068c3d3c83be47 Melody Olvera       2024-12-04   595  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   596  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   597  
068c3d3c83be47 Melody Olvera       2024-12-04   598  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   599  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   600  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   601  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   602  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   603  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   604  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   605  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   606  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   607  
068c3d3c83be47 Melody Olvera       2024-12-04   608  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   609  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   610  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   611  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   612  
068c3d3c83be47 Melody Olvera       2024-12-04   613  				pinctrl-0 = <&qup_i2c8_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   614  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   615  
068c3d3c83be47 Melody Olvera       2024-12-04   616  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   617  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   618  
068c3d3c83be47 Melody Olvera       2024-12-04   619  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   620  			};
068c3d3c83be47 Melody Olvera       2024-12-04   621  
068c3d3c83be47 Melody Olvera       2024-12-04   622  			spi8: spi@880000 {
068c3d3c83be47 Melody Olvera       2024-12-04   623  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   624  				reg = <0x0 0x00880000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   625  
068c3d3c83be47 Melody Olvera       2024-12-04   626  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   627  
068c3d3c83be47 Melody Olvera       2024-12-04   628  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   629  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   630  
068c3d3c83be47 Melody Olvera       2024-12-04   631  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   632  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   633  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   634  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   635  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   636  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   637  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   638  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   639  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   640  
068c3d3c83be47 Melody Olvera       2024-12-04   641  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   642  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   643  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   644  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   645  
068c3d3c83be47 Melody Olvera       2024-12-04   646  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   647  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   648  
068c3d3c83be47 Melody Olvera       2024-12-04   649  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   650  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   651  
068c3d3c83be47 Melody Olvera       2024-12-04   652  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   653  			};
068c3d3c83be47 Melody Olvera       2024-12-04   654  
068c3d3c83be47 Melody Olvera       2024-12-04   655  			i2c9: i2c@884000 {
068c3d3c83be47 Melody Olvera       2024-12-04   656  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   657  				reg = <0x0 0x00884000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   658  
068c3d3c83be47 Melody Olvera       2024-12-04   659  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   660  
068c3d3c83be47 Melody Olvera       2024-12-04   661  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   662  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   663  
068c3d3c83be47 Melody Olvera       2024-12-04   664  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   665  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   666  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   667  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   668  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   669  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   670  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   671  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   672  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   673  
068c3d3c83be47 Melody Olvera       2024-12-04   674  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   675  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   676  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   677  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   678  
068c3d3c83be47 Melody Olvera       2024-12-04   679  				pinctrl-0 = <&qup_i2c9_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   680  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   681  
068c3d3c83be47 Melody Olvera       2024-12-04   682  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   683  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   684  
068c3d3c83be47 Melody Olvera       2024-12-04   685  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   686  			};
068c3d3c83be47 Melody Olvera       2024-12-04   687  
068c3d3c83be47 Melody Olvera       2024-12-04   688  			spi9: spi@884000 {
068c3d3c83be47 Melody Olvera       2024-12-04   689  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   690  				reg = <0x0 0x00884000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   691  
068c3d3c83be47 Melody Olvera       2024-12-04   692  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   693  
068c3d3c83be47 Melody Olvera       2024-12-04   694  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   695  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   696  
068c3d3c83be47 Melody Olvera       2024-12-04   697  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   698  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   699  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   700  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   701  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   702  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   703  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   704  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   705  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   706  
068c3d3c83be47 Melody Olvera       2024-12-04   707  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   708  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   709  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   710  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   711  
068c3d3c83be47 Melody Olvera       2024-12-04   712  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   713  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   714  
068c3d3c83be47 Melody Olvera       2024-12-04   715  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   716  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   717  
068c3d3c83be47 Melody Olvera       2024-12-04   718  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   719  			};
068c3d3c83be47 Melody Olvera       2024-12-04   720  
068c3d3c83be47 Melody Olvera       2024-12-04   721  			i2c10: i2c@888000 {
068c3d3c83be47 Melody Olvera       2024-12-04   722  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   723  				reg = <0x0 0x00888000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   724  
068c3d3c83be47 Melody Olvera       2024-12-04   725  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   726  
068c3d3c83be47 Melody Olvera       2024-12-04   727  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   728  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   729  
068c3d3c83be47 Melody Olvera       2024-12-04   730  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   731  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   732  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   733  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   734  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   735  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   736  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   737  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   738  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   739  
068c3d3c83be47 Melody Olvera       2024-12-04   740  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   741  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   742  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   743  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   744  
068c3d3c83be47 Melody Olvera       2024-12-04   745  				pinctrl-0 = <&qup_i2c10_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   746  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   747  
068c3d3c83be47 Melody Olvera       2024-12-04   748  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   749  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   750  
068c3d3c83be47 Melody Olvera       2024-12-04   751  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   752  			};
068c3d3c83be47 Melody Olvera       2024-12-04   753  
068c3d3c83be47 Melody Olvera       2024-12-04   754  			spi10: spi@888000 {
068c3d3c83be47 Melody Olvera       2024-12-04   755  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   756  				reg = <0x0 0x00888000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   757  
068c3d3c83be47 Melody Olvera       2024-12-04   758  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   759  
068c3d3c83be47 Melody Olvera       2024-12-04   760  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   761  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   762  
068c3d3c83be47 Melody Olvera       2024-12-04   763  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   764  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   765  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   766  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   767  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   768  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   769  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   770  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   771  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   772  
068c3d3c83be47 Melody Olvera       2024-12-04   773  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   774  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   775  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   776  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   777  
068c3d3c83be47 Melody Olvera       2024-12-04   778  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   779  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   780  
068c3d3c83be47 Melody Olvera       2024-12-04   781  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   782  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   783  
068c3d3c83be47 Melody Olvera       2024-12-04   784  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   785  			};
068c3d3c83be47 Melody Olvera       2024-12-04   786  
068c3d3c83be47 Melody Olvera       2024-12-04   787  			i2c11: i2c@88c000 {
068c3d3c83be47 Melody Olvera       2024-12-04   788  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   789  				reg = <0x0 0x0088c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   790  
068c3d3c83be47 Melody Olvera       2024-12-04   791  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   792  
068c3d3c83be47 Melody Olvera       2024-12-04   793  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   794  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   795  
068c3d3c83be47 Melody Olvera       2024-12-04   796  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   797  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   798  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   799  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   800  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   801  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   802  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   803  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   804  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   805  
068c3d3c83be47 Melody Olvera       2024-12-04   806  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   807  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   808  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   809  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   810  
068c3d3c83be47 Melody Olvera       2024-12-04   811  				pinctrl-0 = <&qup_i2c11_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   812  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   813  
068c3d3c83be47 Melody Olvera       2024-12-04   814  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   815  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   816  
068c3d3c83be47 Melody Olvera       2024-12-04   817  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   818  			};
068c3d3c83be47 Melody Olvera       2024-12-04   819  
068c3d3c83be47 Melody Olvera       2024-12-04   820  			spi11: spi@88c000 {
068c3d3c83be47 Melody Olvera       2024-12-04   821  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   822  				reg = <0x0 0x0088c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   823  
068c3d3c83be47 Melody Olvera       2024-12-04   824  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   825  
068c3d3c83be47 Melody Olvera       2024-12-04   826  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   827  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   828  
068c3d3c83be47 Melody Olvera       2024-12-04   829  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   830  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   831  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   832  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   833  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   834  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   835  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   836  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   837  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   838  
068c3d3c83be47 Melody Olvera       2024-12-04   839  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   840  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   841  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   842  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   843  
068c3d3c83be47 Melody Olvera       2024-12-04   844  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   845  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   846  
068c3d3c83be47 Melody Olvera       2024-12-04   847  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   848  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   849  
068c3d3c83be47 Melody Olvera       2024-12-04   850  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   851  			};
068c3d3c83be47 Melody Olvera       2024-12-04   852  
068c3d3c83be47 Melody Olvera       2024-12-04   853  			i2c12: i2c@890000 {
068c3d3c83be47 Melody Olvera       2024-12-04   854  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   855  				reg = <0x0 0x00890000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   856  
068c3d3c83be47 Melody Olvera       2024-12-04   857  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   858  
068c3d3c83be47 Melody Olvera       2024-12-04   859  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   860  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   861  
068c3d3c83be47 Melody Olvera       2024-12-04   862  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   863  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   864  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   865  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   866  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   867  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   868  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   869  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   870  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   871  
068c3d3c83be47 Melody Olvera       2024-12-04   872  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   873  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   874  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   875  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   876  
068c3d3c83be47 Melody Olvera       2024-12-04   877  				pinctrl-0 = <&qup_i2c12_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   878  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   879  
068c3d3c83be47 Melody Olvera       2024-12-04   880  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   881  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   882  
068c3d3c83be47 Melody Olvera       2024-12-04   883  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   884  			};
068c3d3c83be47 Melody Olvera       2024-12-04   885  
068c3d3c83be47 Melody Olvera       2024-12-04   886  			spi12: spi@890000 {
068c3d3c83be47 Melody Olvera       2024-12-04   887  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   888  				reg = <0x0 0x00890000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   889  
068c3d3c83be47 Melody Olvera       2024-12-04   890  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   891  
068c3d3c83be47 Melody Olvera       2024-12-04   892  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   893  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   894  
068c3d3c83be47 Melody Olvera       2024-12-04   895  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   896  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   897  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   898  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   899  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   900  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   901  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   902  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   903  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   904  
068c3d3c83be47 Melody Olvera       2024-12-04   905  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   906  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   907  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   908  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   909  
068c3d3c83be47 Melody Olvera       2024-12-04   910  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   911  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   912  
068c3d3c83be47 Melody Olvera       2024-12-04   913  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   914  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   915  
068c3d3c83be47 Melody Olvera       2024-12-04   916  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   917  			};
068c3d3c83be47 Melody Olvera       2024-12-04   918  
068c3d3c83be47 Melody Olvera       2024-12-04   919  			i2c13: i2c@894000 {
068c3d3c83be47 Melody Olvera       2024-12-04   920  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   921  				reg = <0x0 0x00894000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   922  
068c3d3c83be47 Melody Olvera       2024-12-04   923  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   924  
068c3d3c83be47 Melody Olvera       2024-12-04   925  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   926  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   927  
068c3d3c83be47 Melody Olvera       2024-12-04   928  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   929  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   930  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   931  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   932  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   933  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   934  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   935  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   936  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   937  
068c3d3c83be47 Melody Olvera       2024-12-04   938  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   939  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   940  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   941  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   942  
068c3d3c83be47 Melody Olvera       2024-12-04   943  				pinctrl-0 = <&qup_i2c13_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   944  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   945  
068c3d3c83be47 Melody Olvera       2024-12-04   946  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   947  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   948  
068c3d3c83be47 Melody Olvera       2024-12-04   949  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   950  			};
068c3d3c83be47 Melody Olvera       2024-12-04   951  
068c3d3c83be47 Melody Olvera       2024-12-04   952  			spi13: spi@894000 {
068c3d3c83be47 Melody Olvera       2024-12-04   953  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   954  				reg = <0x0 0x00894000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   955  
068c3d3c83be47 Melody Olvera       2024-12-04   956  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   957  
068c3d3c83be47 Melody Olvera       2024-12-04   958  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   959  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   960  
068c3d3c83be47 Melody Olvera       2024-12-04   961  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   962  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   963  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   964  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   965  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   966  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   967  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   968  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   969  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   970  
068c3d3c83be47 Melody Olvera       2024-12-04   971  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   972  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   973  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   974  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   975  
068c3d3c83be47 Melody Olvera       2024-12-04   976  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   977  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   978  
068c3d3c83be47 Melody Olvera       2024-12-04   979  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   980  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   981  
068c3d3c83be47 Melody Olvera       2024-12-04   982  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   983  			};
068c3d3c83be47 Melody Olvera       2024-12-04   984  
068c3d3c83be47 Melody Olvera       2024-12-04   985  			uart14: serial@898000 {
068c3d3c83be47 Melody Olvera       2024-12-04   986  				compatible = "qcom,geni-uart";
068c3d3c83be47 Melody Olvera       2024-12-04   987  				reg = <0x0 0x00898000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   988  
068c3d3c83be47 Melody Olvera       2024-12-04   989  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   990  
068c3d3c83be47 Melody Olvera       2024-12-04   991  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   992  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   993  
068c3d3c83be47 Melody Olvera       2024-12-04   994  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   995  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   996  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   997  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   998  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   999  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1000  
068c3d3c83be47 Melody Olvera       2024-12-04  1001  				pinctrl-0 = <&qup_uart14_default>;
068c3d3c83be47 Melody Olvera       2024-12-04  1002  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1003  
068c3d3c83be47 Melody Olvera       2024-12-04  1004  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1005  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1006  
068c3d3c83be47 Melody Olvera       2024-12-04  1007  			i2c15: i2c@89c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1008  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1009  				reg = <0x0 0x0089c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1010  
068c3d3c83be47 Melody Olvera       2024-12-04  1011  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1012  
068c3d3c83be47 Melody Olvera       2024-12-04  1013  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1014  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1015  
068c3d3c83be47 Melody Olvera       2024-12-04  1016  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1017  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1018  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1019  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1020  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1021  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1022  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1023  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1024  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1025  
068c3d3c83be47 Melody Olvera       2024-12-04  1026  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1027  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1028  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1029  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1030  
068c3d3c83be47 Melody Olvera       2024-12-04  1031  				pinctrl-0 = <&qup_i2c15_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1032  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1033  
068c3d3c83be47 Melody Olvera       2024-12-04  1034  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1035  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1036  
068c3d3c83be47 Melody Olvera       2024-12-04  1037  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1038  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1039  
068c3d3c83be47 Melody Olvera       2024-12-04  1040  			spi15: spi@89c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1041  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1042  				reg = <0x0 0x0089c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1043  
068c3d3c83be47 Melody Olvera       2024-12-04  1044  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1045  
068c3d3c83be47 Melody Olvera       2024-12-04  1046  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1047  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1048  
068c3d3c83be47 Melody Olvera       2024-12-04  1049  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1050  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1051  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1052  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1053  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1054  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1055  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1056  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1057  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1058  
068c3d3c83be47 Melody Olvera       2024-12-04  1059  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1060  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1061  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1062  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1063  
068c3d3c83be47 Melody Olvera       2024-12-04  1064  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1065  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1066  
068c3d3c83be47 Melody Olvera       2024-12-04  1067  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1068  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1069  
068c3d3c83be47 Melody Olvera       2024-12-04  1070  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1071  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1072  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1073  
068c3d3c83be47 Melody Olvera       2024-12-04  1074  		i2c_master_hub_0: geniqup@9c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1075  			compatible = "qcom,geni-se-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1076  			reg = <0x0 0x009c0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1077  
068c3d3c83be47 Melody Olvera       2024-12-04  1078  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1079  			clock-names = "s-ahb";
068c3d3c83be47 Melody Olvera       2024-12-04  1080  
068c3d3c83be47 Melody Olvera       2024-12-04  1081  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1082  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1083  			ranges;
068c3d3c83be47 Melody Olvera       2024-12-04  1084  
068c3d3c83be47 Melody Olvera       2024-12-04  1085  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1086  
068c3d3c83be47 Melody Olvera       2024-12-04  1087  			i2c_hub_0: i2c@980000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1088  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1089  				reg = <0x0 0x00980000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1090  
068c3d3c83be47 Melody Olvera       2024-12-04  1091  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1092  
068c3d3c83be47 Melody Olvera       2024-12-04  1093  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1094  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1095  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1096  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1097  
068c3d3c83be47 Melody Olvera       2024-12-04  1098  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1099  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1100  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1101  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1102  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1103  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1104  
068c3d3c83be47 Melody Olvera       2024-12-04  1105  				pinctrl-0 = <&hub_i2c0_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1106  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1107  
068c3d3c83be47 Melody Olvera       2024-12-04  1108  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1109  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1110  
068c3d3c83be47 Melody Olvera       2024-12-04  1111  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1112  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1113  
068c3d3c83be47 Melody Olvera       2024-12-04  1114  			i2c_hub_1: i2c@984000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1115  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1116  				reg = <0x0 0x00984000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1117  
068c3d3c83be47 Melody Olvera       2024-12-04  1118  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1119  
068c3d3c83be47 Melody Olvera       2024-12-04  1120  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1121  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1122  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1123  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1124  
068c3d3c83be47 Melody Olvera       2024-12-04  1125  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1126  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1127  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1128  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1129  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1130  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1131  
068c3d3c83be47 Melody Olvera       2024-12-04  1132  				pinctrl-0 = <&hub_i2c1_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1133  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1134  
068c3d3c83be47 Melody Olvera       2024-12-04  1135  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1136  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1137  
068c3d3c83be47 Melody Olvera       2024-12-04  1138  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1139  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1140  
068c3d3c83be47 Melody Olvera       2024-12-04  1141  			i2c_hub_2: i2c@988000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1142  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1143  				reg = <0x0 0x00988000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1144  
068c3d3c83be47 Melody Olvera       2024-12-04  1145  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1146  
068c3d3c83be47 Melody Olvera       2024-12-04  1147  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1148  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1149  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1150  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1151  
068c3d3c83be47 Melody Olvera       2024-12-04  1152  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1153  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1154  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1155  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1156  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1157  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1158  
068c3d3c83be47 Melody Olvera       2024-12-04  1159  				pinctrl-0 = <&hub_i2c2_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1160  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1161  
068c3d3c83be47 Melody Olvera       2024-12-04  1162  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1163  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1164  
068c3d3c83be47 Melody Olvera       2024-12-04  1165  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1166  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1167  
068c3d3c83be47 Melody Olvera       2024-12-04  1168  			i2c_hub_3: i2c@98c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1169  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1170  				reg = <0x0 0x0098c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1171  
068c3d3c83be47 Melody Olvera       2024-12-04  1172  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1173  
068c3d3c83be47 Melody Olvera       2024-12-04  1174  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1175  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1176  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1177  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1178  
068c3d3c83be47 Melody Olvera       2024-12-04  1179  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1180  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1181  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1182  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1183  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1184  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1185  
068c3d3c83be47 Melody Olvera       2024-12-04  1186  				pinctrl-0 = <&hub_i2c3_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1187  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1188  
068c3d3c83be47 Melody Olvera       2024-12-04  1189  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1190  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1191  
068c3d3c83be47 Melody Olvera       2024-12-04  1192  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1193  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1194  
068c3d3c83be47 Melody Olvera       2024-12-04  1195  			i2c_hub_4: i2c@990000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1196  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1197  				reg = <0x0 0x00990000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1198  
068c3d3c83be47 Melody Olvera       2024-12-04  1199  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1200  
068c3d3c83be47 Melody Olvera       2024-12-04  1201  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1202  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1203  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1204  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1205  
068c3d3c83be47 Melody Olvera       2024-12-04  1206  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1207  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1208  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1209  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1210  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1211  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1212  
068c3d3c83be47 Melody Olvera       2024-12-04  1213  				pinctrl-0 = <&hub_i2c4_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1214  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1215  
068c3d3c83be47 Melody Olvera       2024-12-04  1216  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1217  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1218  
068c3d3c83be47 Melody Olvera       2024-12-04  1219  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1220  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1221  
068c3d3c83be47 Melody Olvera       2024-12-04  1222  			i2c_hub_5: i2c@994000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1223  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1224  				reg = <0x0 0x00994000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1225  
068c3d3c83be47 Melody Olvera       2024-12-04  1226  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1227  
068c3d3c83be47 Melody Olvera       2024-12-04  1228  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1229  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1230  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1231  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1232  
068c3d3c83be47 Melody Olvera       2024-12-04  1233  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1234  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1235  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1236  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1237  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1238  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1239  
068c3d3c83be47 Melody Olvera       2024-12-04  1240  				pinctrl-0 = <&hub_i2c5_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1241  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1242  
068c3d3c83be47 Melody Olvera       2024-12-04  1243  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1244  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1245  
068c3d3c83be47 Melody Olvera       2024-12-04  1246  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1247  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1248  
068c3d3c83be47 Melody Olvera       2024-12-04  1249  			i2c_hub_6: i2c@998000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1250  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1251  				reg = <0x0 0x00998000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1252  
068c3d3c83be47 Melody Olvera       2024-12-04  1253  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1254  
068c3d3c83be47 Melody Olvera       2024-12-04  1255  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1256  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1257  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1258  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1259  
068c3d3c83be47 Melody Olvera       2024-12-04  1260  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1261  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1262  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1263  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1264  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1265  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1266  
068c3d3c83be47 Melody Olvera       2024-12-04  1267  				pinctrl-0 = <&hub_i2c6_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1268  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1269  
068c3d3c83be47 Melody Olvera       2024-12-04  1270  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1271  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1272  
068c3d3c83be47 Melody Olvera       2024-12-04  1273  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1274  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1275  
068c3d3c83be47 Melody Olvera       2024-12-04  1276  			i2c_hub_7: i2c@99c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1277  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1278  				reg = <0x0 0x0099c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1279  
068c3d3c83be47 Melody Olvera       2024-12-04  1280  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1281  
068c3d3c83be47 Melody Olvera       2024-12-04  1282  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1283  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1284  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1285  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1286  
068c3d3c83be47 Melody Olvera       2024-12-04  1287  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1288  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1289  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1290  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1291  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1292  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1293  
068c3d3c83be47 Melody Olvera       2024-12-04  1294  				pinctrl-0 = <&hub_i2c7_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1295  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1296  
068c3d3c83be47 Melody Olvera       2024-12-04  1297  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1298  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1299  
068c3d3c83be47 Melody Olvera       2024-12-04  1300  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1301  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1302  
068c3d3c83be47 Melody Olvera       2024-12-04  1303  			i2c_hub_8: i2c@9a0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1304  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1305  				reg = <0x0 0x009a0000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1306  
068c3d3c83be47 Melody Olvera       2024-12-04  1307  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1308  
068c3d3c83be47 Melody Olvera       2024-12-04  1309  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1310  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1311  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1312  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1313  
068c3d3c83be47 Melody Olvera       2024-12-04  1314  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1315  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1316  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1317  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1318  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1319  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1320  
068c3d3c83be47 Melody Olvera       2024-12-04  1321  				pinctrl-0 = <&hub_i2c8_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1322  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1323  
068c3d3c83be47 Melody Olvera       2024-12-04  1324  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1325  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1326  
068c3d3c83be47 Melody Olvera       2024-12-04  1327  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1328  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1329  
068c3d3c83be47 Melody Olvera       2024-12-04  1330  			i2c_hub_9: i2c@9a4000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1331  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1332  				reg = <0x0 0x009a4000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1333  
068c3d3c83be47 Melody Olvera       2024-12-04  1334  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1335  
068c3d3c83be47 Melody Olvera       2024-12-04  1336  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1337  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1338  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1339  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1340  
068c3d3c83be47 Melody Olvera       2024-12-04  1341  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1342  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1343  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1344  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1345  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1346  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1347  
068c3d3c83be47 Melody Olvera       2024-12-04  1348  				pinctrl-0 = <&hub_i2c9_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1349  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1350  
068c3d3c83be47 Melody Olvera       2024-12-04  1351  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1352  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1353  
068c3d3c83be47 Melody Olvera       2024-12-04  1354  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1355  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1356  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1357  
068c3d3c83be47 Melody Olvera       2024-12-04  1358  		gpi_dma1: dma-controller@a00000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1359  			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
068c3d3c83be47 Melody Olvera       2024-12-04  1360  			reg = <0x0 0x00a00000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1361  
068c3d3c83be47 Melody Olvera       2024-12-04  1362  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1363  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1364  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1365  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1366  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1367  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1368  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1369  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1370  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1371  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1372  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1373  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1374  
068c3d3c83be47 Melody Olvera       2024-12-04  1375  			dma-channels = <12>;
068c3d3c83be47 Melody Olvera       2024-12-04  1376  			dma-channel-mask = <0x1e>;
068c3d3c83be47 Melody Olvera       2024-12-04  1377  			#dma-cells = <3>;
068c3d3c83be47 Melody Olvera       2024-12-04  1378  
068c3d3c83be47 Melody Olvera       2024-12-04  1379  			iommus = <&apps_smmu 0xb6 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1380  
068c3d3c83be47 Melody Olvera       2024-12-04  1381  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1382  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1383  
068c3d3c83be47 Melody Olvera       2024-12-04  1384  		qupv3_1: geniqup@ac0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1385  			compatible = "qcom,geni-se-qup";
068c3d3c83be47 Melody Olvera       2024-12-04  1386  			reg = <0x0 0x00ac0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1387  
068c3d3c83be47 Melody Olvera       2024-12-04  1388  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1389  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1390  			clock-names = "m-ahb",
068c3d3c83be47 Melody Olvera       2024-12-04  1391  				      "s-ahb";
068c3d3c83be47 Melody Olvera       2024-12-04  1392  
068c3d3c83be47 Melody Olvera       2024-12-04  1393  			iommus = <&apps_smmu 0xa3 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1394  
068c3d3c83be47 Melody Olvera       2024-12-04  1395  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1396  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1397  			ranges;
068c3d3c83be47 Melody Olvera       2024-12-04  1398  
068c3d3c83be47 Melody Olvera       2024-12-04  1399  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1400  
068c3d3c83be47 Melody Olvera       2024-12-04  1401  			i2c0: i2c@a80000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1402  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1403  				reg = <0x0 0x00a80000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1404  
068c3d3c83be47 Melody Olvera       2024-12-04  1405  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1406  
068c3d3c83be47 Melody Olvera       2024-12-04  1407  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1408  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1409  
068c3d3c83be47 Melody Olvera       2024-12-04  1410  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1411  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1412  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1413  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1414  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1415  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1416  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1417  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1418  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1419  
068c3d3c83be47 Melody Olvera       2024-12-04  1420  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1421  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1422  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1423  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1424  
068c3d3c83be47 Melody Olvera       2024-12-04  1425  				pinctrl-0 = <&qup_i2c0_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1426  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1427  
068c3d3c83be47 Melody Olvera       2024-12-04  1428  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1429  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1430  
068c3d3c83be47 Melody Olvera       2024-12-04  1431  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1432  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1433  
068c3d3c83be47 Melody Olvera       2024-12-04  1434  			spi0: spi@a80000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1435  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1436  				reg = <0x0 0x00a80000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1437  
068c3d3c83be47 Melody Olvera       2024-12-04  1438  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1439  
068c3d3c83be47 Melody Olvera       2024-12-04  1440  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1441  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1442  
068c3d3c83be47 Melody Olvera       2024-12-04  1443  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1444  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1445  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1446  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1447  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1448  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1449  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1450  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1451  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1452  
068c3d3c83be47 Melody Olvera       2024-12-04  1453  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1454  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1455  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1456  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1457  
068c3d3c83be47 Melody Olvera       2024-12-04  1458  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1459  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1460  
068c3d3c83be47 Melody Olvera       2024-12-04  1461  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1462  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1463  
068c3d3c83be47 Melody Olvera       2024-12-04  1464  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1465  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1466  
068c3d3c83be47 Melody Olvera       2024-12-04  1467  			i2c1: i2c@a84000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1468  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1469  				reg = <0x0 0x00a84000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1470  
068c3d3c83be47 Melody Olvera       2024-12-04  1471  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1472  
068c3d3c83be47 Melody Olvera       2024-12-04  1473  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1474  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1475  
068c3d3c83be47 Melody Olvera       2024-12-04  1476  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1477  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1478  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1479  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1480  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1481  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1482  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1483  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1484  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1485  
068c3d3c83be47 Melody Olvera       2024-12-04  1486  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1487  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1488  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1489  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1490  
068c3d3c83be47 Melody Olvera       2024-12-04  1491  				pinctrl-0 = <&qup_i2c1_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1492  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1493  
068c3d3c83be47 Melody Olvera       2024-12-04  1494  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1495  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1496  
068c3d3c83be47 Melody Olvera       2024-12-04  1497  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1498  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1499  
068c3d3c83be47 Melody Olvera       2024-12-04  1500  			spi1: spi@a84000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1501  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1502  				reg = <0x0 0x00a84000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1503  
068c3d3c83be47 Melody Olvera       2024-12-04  1504  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1505  
068c3d3c83be47 Melody Olvera       2024-12-04  1506  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1507  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1508  
068c3d3c83be47 Melody Olvera       2024-12-04  1509  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1510  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1511  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1512  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1513  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1514  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1515  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1516  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1517  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1518  
068c3d3c83be47 Melody Olvera       2024-12-04  1519  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1520  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1521  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1522  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1523  
068c3d3c83be47 Melody Olvera       2024-12-04  1524  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1525  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1526  
068c3d3c83be47 Melody Olvera       2024-12-04  1527  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1528  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1529  
068c3d3c83be47 Melody Olvera       2024-12-04  1530  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1531  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1532  
068c3d3c83be47 Melody Olvera       2024-12-04  1533  			i2c2: i2c@a88000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1534  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1535  				reg = <0x0 0x00a88000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1536  
068c3d3c83be47 Melody Olvera       2024-12-04  1537  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1538  
068c3d3c83be47 Melody Olvera       2024-12-04  1539  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1540  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1541  
068c3d3c83be47 Melody Olvera       2024-12-04  1542  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1543  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1544  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1545  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1546  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1547  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1548  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1549  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1550  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1551  
068c3d3c83be47 Melody Olvera       2024-12-04  1552  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1553  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1554  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1555  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1556  
068c3d3c83be47 Melody Olvera       2024-12-04  1557  				pinctrl-0 = <&qup_i2c2_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1558  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1559  
068c3d3c83be47 Melody Olvera       2024-12-04  1560  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1561  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1562  
068c3d3c83be47 Melody Olvera       2024-12-04  1563  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1564  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1565  
068c3d3c83be47 Melody Olvera       2024-12-04  1566  			spi2: spi@a88000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1567  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1568  				reg = <0x0 0x00a88000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1569  
068c3d3c83be47 Melody Olvera       2024-12-04  1570  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1571  
068c3d3c83be47 Melody Olvera       2024-12-04  1572  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1573  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1574  
068c3d3c83be47 Melody Olvera       2024-12-04  1575  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1576  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1577  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1578  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1579  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1580  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1581  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1582  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1583  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1584  
068c3d3c83be47 Melody Olvera       2024-12-04  1585  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1586  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1587  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1588  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1589  
068c3d3c83be47 Melody Olvera       2024-12-04  1590  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1591  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1592  
068c3d3c83be47 Melody Olvera       2024-12-04  1593  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1594  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1595  
068c3d3c83be47 Melody Olvera       2024-12-04  1596  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1597  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1598  
068c3d3c83be47 Melody Olvera       2024-12-04  1599  			i2c3: i2c@a8c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1600  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1601  				reg = <0x0 0x00a8c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1602  
068c3d3c83be47 Melody Olvera       2024-12-04  1603  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1604  
068c3d3c83be47 Melody Olvera       2024-12-04  1605  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1606  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1607  
068c3d3c83be47 Melody Olvera       2024-12-04  1608  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1609  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1610  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1611  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1612  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1613  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1614  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1615  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1616  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1617  
068c3d3c83be47 Melody Olvera       2024-12-04  1618  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1619  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1620  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1621  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1622  
068c3d3c83be47 Melody Olvera       2024-12-04  1623  				pinctrl-0 = <&qup_i2c3_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1624  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1625  
068c3d3c83be47 Melody Olvera       2024-12-04  1626  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1627  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1628  
068c3d3c83be47 Melody Olvera       2024-12-04  1629  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1630  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1631  
068c3d3c83be47 Melody Olvera       2024-12-04  1632  			spi3: spi@a8c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1633  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1634  				reg = <0x0 0x00a8c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1635  
068c3d3c83be47 Melody Olvera       2024-12-04  1636  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1637  
068c3d3c83be47 Melody Olvera       2024-12-04  1638  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1639  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1640  
068c3d3c83be47 Melody Olvera       2024-12-04  1641  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1642  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1643  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1644  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1645  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1646  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1647  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1648  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1649  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1650  
068c3d3c83be47 Melody Olvera       2024-12-04  1651  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1652  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1653  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1654  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1655  
068c3d3c83be47 Melody Olvera       2024-12-04  1656  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1657  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1658  
068c3d3c83be47 Melody Olvera       2024-12-04  1659  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1660  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1661  
068c3d3c83be47 Melody Olvera       2024-12-04  1662  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1663  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1664  
068c3d3c83be47 Melody Olvera       2024-12-04  1665  			i2c4: i2c@a90000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1666  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1667  				reg = <0x0 0x00a90000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1668  
068c3d3c83be47 Melody Olvera       2024-12-04  1669  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1670  
068c3d3c83be47 Melody Olvera       2024-12-04  1671  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1672  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1673  
068c3d3c83be47 Melody Olvera       2024-12-04  1674  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1675  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1676  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1677  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1678  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1679  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1680  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1681  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1682  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1683  
068c3d3c83be47 Melody Olvera       2024-12-04  1684  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1685  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1686  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1687  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1688  
068c3d3c83be47 Melody Olvera       2024-12-04  1689  				pinctrl-0 = <&qup_i2c4_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1690  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1691  
068c3d3c83be47 Melody Olvera       2024-12-04  1692  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1693  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1694  
068c3d3c83be47 Melody Olvera       2024-12-04  1695  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1696  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1697  
068c3d3c83be47 Melody Olvera       2024-12-04  1698  			spi4: spi@a90000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1699  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1700  				reg = <0x0 0x00a90000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1701  
068c3d3c83be47 Melody Olvera       2024-12-04  1702  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1703  
068c3d3c83be47 Melody Olvera       2024-12-04  1704  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1705  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1706  
068c3d3c83be47 Melody Olvera       2024-12-04  1707  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1708  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1709  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1710  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1711  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1712  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1713  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1714  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1715  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1716  
068c3d3c83be47 Melody Olvera       2024-12-04  1717  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1718  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1719  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1720  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1721  
068c3d3c83be47 Melody Olvera       2024-12-04  1722  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1723  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1724  
068c3d3c83be47 Melody Olvera       2024-12-04  1725  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1726  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1727  
068c3d3c83be47 Melody Olvera       2024-12-04  1728  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1729  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1730  
068c3d3c83be47 Melody Olvera       2024-12-04  1731  			i2c5: i2c@a94000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1732  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1733  				reg = <0x0 0x00a94000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1734  
068c3d3c83be47 Melody Olvera       2024-12-04  1735  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1736  
068c3d3c83be47 Melody Olvera       2024-12-04  1737  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1738  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1739  
068c3d3c83be47 Melody Olvera       2024-12-04  1740  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1741  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1742  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1743  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1744  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1745  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1746  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1747  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1748  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1749  
068c3d3c83be47 Melody Olvera       2024-12-04  1750  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1751  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1752  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1753  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1754  
068c3d3c83be47 Melody Olvera       2024-12-04  1755  				pinctrl-0 = <&qup_i2c5_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1756  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1757  
068c3d3c83be47 Melody Olvera       2024-12-04  1758  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1759  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1760  
068c3d3c83be47 Melody Olvera       2024-12-04  1761  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1762  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1763  
068c3d3c83be47 Melody Olvera       2024-12-04  1764  			spi5: spi@a94000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1765  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1766  				reg = <0x0 0x00a94000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1767  
068c3d3c83be47 Melody Olvera       2024-12-04  1768  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1769  
068c3d3c83be47 Melody Olvera       2024-12-04  1770  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1771  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1772  
068c3d3c83be47 Melody Olvera       2024-12-04  1773  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1774  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1775  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1776  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1777  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1778  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1779  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1780  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1781  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1782  
068c3d3c83be47 Melody Olvera       2024-12-04  1783  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1784  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1785  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1786  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1787  
068c3d3c83be47 Melody Olvera       2024-12-04  1788  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1789  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1790  
068c3d3c83be47 Melody Olvera       2024-12-04  1791  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1792  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1793  
068c3d3c83be47 Melody Olvera       2024-12-04  1794  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1795  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1796  
068c3d3c83be47 Melody Olvera       2024-12-04  1797  			i2c6: i2c@a98000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1798  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1799  				reg = <0x0 0x00a98000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1800  
068c3d3c83be47 Melody Olvera       2024-12-04  1801  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1802  
068c3d3c83be47 Melody Olvera       2024-12-04  1803  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1804  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1805  
068c3d3c83be47 Melody Olvera       2024-12-04  1806  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1807  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1808  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1809  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1810  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1811  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1812  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1813  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1814  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1815  
068c3d3c83be47 Melody Olvera       2024-12-04  1816  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1817  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1818  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1819  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1820  
068c3d3c83be47 Melody Olvera       2024-12-04  1821  				pinctrl-0 = <&qup_i2c6_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1822  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1823  
068c3d3c83be47 Melody Olvera       2024-12-04  1824  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1825  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1826  
068c3d3c83be47 Melody Olvera       2024-12-04  1827  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1828  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1829  
068c3d3c83be47 Melody Olvera       2024-12-04  1830  			spi6: spi@a98000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1831  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1832  				reg = <0x0 0x00a98000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1833  
068c3d3c83be47 Melody Olvera       2024-12-04  1834  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1835  
068c3d3c83be47 Melody Olvera       2024-12-04  1836  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1837  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1838  
068c3d3c83be47 Melody Olvera       2024-12-04  1839  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1840  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1841  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1842  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1843  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1844  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1845  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1846  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1847  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1848  
068c3d3c83be47 Melody Olvera       2024-12-04  1849  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1850  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1851  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1852  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1853  
068c3d3c83be47 Melody Olvera       2024-12-04  1854  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1855  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1856  
068c3d3c83be47 Melody Olvera       2024-12-04  1857  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1858  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1859  
068c3d3c83be47 Melody Olvera       2024-12-04  1860  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1861  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1862  
068c3d3c83be47 Melody Olvera       2024-12-04  1863  			uart7: serial@a9c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1864  				compatible = "qcom,geni-debug-uart";
068c3d3c83be47 Melody Olvera       2024-12-04  1865  				reg = <0x0 0x00a9c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1866  
068c3d3c83be47 Melody Olvera       2024-12-04  1867  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1868  
068c3d3c83be47 Melody Olvera       2024-12-04  1869  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1870  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1871  
068c3d3c83be47 Melody Olvera       2024-12-04  1872  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1873  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1874  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1875  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1876  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1877  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1878  
068c3d3c83be47 Melody Olvera       2024-12-04  1879  
068c3d3c83be47 Melody Olvera       2024-12-04  1880  				pinctrl-0 = <&qup_uart7_default>;
068c3d3c83be47 Melody Olvera       2024-12-04  1881  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1882  
068c3d3c83be47 Melody Olvera       2024-12-04  1883  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1884  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1885  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1886  
068c3d3c83be47 Melody Olvera       2024-12-04  1887  		cnoc_main: interconnect@1500000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1888  			compatible = "qcom,sm8750-cnoc-main";
068c3d3c83be47 Melody Olvera       2024-12-04  1889  			reg = <0x0 0x01500000 0x0 0x16080>;
068c3d3c83be47 Melody Olvera       2024-12-04  1890  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1891  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1892  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1893  
068c3d3c83be47 Melody Olvera       2024-12-04  1894  		config_noc: interconnect@1600000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1895  			compatible = "qcom,sm8750-config-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1896  			reg = <0x0 0x01600000 0x0 0x6200>;
068c3d3c83be47 Melody Olvera       2024-12-04  1897  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1898  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1899  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1900  
068c3d3c83be47 Melody Olvera       2024-12-04  1901  		system_noc: interconnect@1680000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1902  			compatible = "qcom,sm8750-system-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1903  			reg = <0x0 0x01680000 0x0 0x1d080>;
068c3d3c83be47 Melody Olvera       2024-12-04  1904  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1905  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1906  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1907  
068c3d3c83be47 Melody Olvera       2024-12-04  1908  		pcie_noc: interconnect@16c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1909  			compatible = "qcom,sm8750-pcie-anoc";
068c3d3c83be47 Melody Olvera       2024-12-04  1910  			reg = <0x0 0x016c0000 0x0 0x11400>;
068c3d3c83be47 Melody Olvera       2024-12-04  1911  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1912  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1913  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1914  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1915  
068c3d3c83be47 Melody Olvera       2024-12-04  1916  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1917  
068c3d3c83be47 Melody Olvera       2024-12-04  1918  		aggre1_noc: interconnect@16e0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1919  			compatible = "qcom,sm8750-aggre1-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1920  			reg = <0x0 0x016e0000 0x0 0x16400>;
068c3d3c83be47 Melody Olvera       2024-12-04  1921  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1922  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1923  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1924  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1925  
068c3d3c83be47 Melody Olvera       2024-12-04  1926  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1927  
068c3d3c83be47 Melody Olvera       2024-12-04  1928  		aggre2_noc: interconnect@1700000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1929  			compatible = "qcom,sm8750-aggre2-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1930  			reg = <0x0 0x01700000 0x0 0x1f400>;
068c3d3c83be47 Melody Olvera       2024-12-04  1931  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1932  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1933  			clocks = <&rpmhcc RPMH_IPA_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1934  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1935  
068c3d3c83be47 Melody Olvera       2024-12-04  1936  		mmss_noc: interconnect@1780000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1937  			compatible = "qcom,sm8750-mmss-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1938  			reg = <0x0 0x01780000 0x0 0x5b800>;
068c3d3c83be47 Melody Olvera       2024-12-04  1939  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1940  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1941  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1942  
068c3d3c83be47 Melody Olvera       2024-12-04  1943  		tcsr_mutex: hwlock@1f40000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1944  			compatible = "qcom,tcsr-mutex";
068c3d3c83be47 Melody Olvera       2024-12-04  1945  			reg = <0x0 0x01f40000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1946  			#hwlock-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1947  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1948  
068c3d3c83be47 Melody Olvera       2024-12-04  1949  		lpass_ag_noc: interconnect@7e40000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1950  			compatible = "qcom,sm8750-lpass-ag-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1951  			reg = <0x0 0x07e40000 0x0 0xe080>;
068c3d3c83be47 Melody Olvera       2024-12-04  1952  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1953  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1954  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1955  
068c3d3c83be47 Melody Olvera       2024-12-04  1956  		lpass_lpiaon_noc: interconnect@7400000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1957  			compatible = "qcom,sm8750-lpass-lpiaon-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1958  			reg = <0x0 0x07400000 0x0 0x19080>;
068c3d3c83be47 Melody Olvera       2024-12-04  1959  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1960  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1961  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1962  
068c3d3c83be47 Melody Olvera       2024-12-04  1963  		lpass_lpicx_noc: interconnect@7420000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1964  			compatible = "qcom,sm8750-lpass-lpicx-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  1965  			reg = <0x0 0x07420000 0x0 0x44080>;
068c3d3c83be47 Melody Olvera       2024-12-04  1966  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1967  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1968  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1969  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1970  		usb_1_hsphy: phy@88e3000 {
1c7e64d6e8259f Wesley Cheng        2025-01-13  1971  			compatible = "qcom,sm8750-m31-eusb2-phy";
1c7e64d6e8259f Wesley Cheng        2025-01-13  1972  			reg = <0x0 0x88e3000 0x0 0x29c>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1973  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1974  			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1975  			clock-names = "ref";
1c7e64d6e8259f Wesley Cheng        2025-01-13  1976  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1977  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1978  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1979  			#phy-cells = <0>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1980  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1981  			status = "disabled";
1c7e64d6e8259f Wesley Cheng        2025-01-13  1982  		};
1c7e64d6e8259f Wesley Cheng        2025-01-13  1983  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1984  		usb_dp_qmpphy: phy@88e8000 {
1c7e64d6e8259f Wesley Cheng        2025-01-13  1985  			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
1c7e64d6e8259f Wesley Cheng        2025-01-13  1986  			reg = <0x0 0x088e8000 0x0 0x3000>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1987  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1988  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  1989  				 <&rpmhcc RPMH_CXO_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  1990  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  1991  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1992  			clock-names = "aux",
1c7e64d6e8259f Wesley Cheng        2025-01-13  1993  				      "ref",
1c7e64d6e8259f Wesley Cheng        2025-01-13  1994  				      "com_aux",
1c7e64d6e8259f Wesley Cheng        2025-01-13  1995  				      "usb3_pipe";
1c7e64d6e8259f Wesley Cheng        2025-01-13  1996  
1c7e64d6e8259f Wesley Cheng        2025-01-13  1997  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  1998  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  1999  			reset-names = "phy",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2000  				      "common";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2001  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2002  			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2003  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2004  			#clock-cells = <1>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2005  			#phy-cells = <1>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2006  
e36f92c96f6fab Wesley Cheng        2024-10-16  2007  			orientation-switch;
e36f92c96f6fab Wesley Cheng        2024-10-16  2008  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2009  			status = "disabled";
e36f92c96f6fab Wesley Cheng        2024-10-16  2010  
e36f92c96f6fab Wesley Cheng        2024-10-16  2011  			ports {
e36f92c96f6fab Wesley Cheng        2024-10-16  2012  				#address-cells = <1>;
e36f92c96f6fab Wesley Cheng        2024-10-16  2013  				#size-cells = <0>;
e36f92c96f6fab Wesley Cheng        2024-10-16  2014  
e36f92c96f6fab Wesley Cheng        2024-10-16  2015  				port@0 {
e36f92c96f6fab Wesley Cheng        2024-10-16  2016  					reg = <0>;
e36f92c96f6fab Wesley Cheng        2024-10-16  2017  
e36f92c96f6fab Wesley Cheng        2024-10-16 @2018  					usb_dp_qmpphy_out: endpoint {
e36f92c96f6fab Wesley Cheng        2024-10-16  2019  					};
e36f92c96f6fab Wesley Cheng        2024-10-16  2020  				};
e36f92c96f6fab Wesley Cheng        2024-10-16  2021  
e36f92c96f6fab Wesley Cheng        2024-10-16  2022  				port@1 {
e36f92c96f6fab Wesley Cheng        2024-10-16  2023  					reg = <1>;
e36f92c96f6fab Wesley Cheng        2024-10-16  2024  
e36f92c96f6fab Wesley Cheng        2024-10-16  2025  					usb_dp_qmpphy_usb_ss_in: endpoint {
e36f92c96f6fab Wesley Cheng        2024-10-16  2026  						remote-endpoint = <&usb_1_dwc3_ss>;
e36f92c96f6fab Wesley Cheng        2024-10-16  2027  					};
e36f92c96f6fab Wesley Cheng        2024-10-16  2028  				};
e36f92c96f6fab Wesley Cheng        2024-10-16  2029  			};
1c7e64d6e8259f Wesley Cheng        2025-01-13  2030  		};
1c7e64d6e8259f Wesley Cheng        2025-01-13  2031  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2032  		usb_1: usb@a6f8800 {
1c7e64d6e8259f Wesley Cheng        2025-01-13  2033  			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2034  			reg = <0x0 0x0a6f8800 0x0 0x400>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2035  			status = "disabled";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2036  			#address-cells = <2>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2037  			#size-cells = <2>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2038  			ranges;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2039  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2040  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2041  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2042  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2043  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2044  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2045  				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2046  			clock-names = "cfg_noc",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2047  				      "core",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2048  				      "iface",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2049  				      "sleep",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2050  				      "mock_utmi",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2051  				      "xo";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2052  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2053  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2054  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2055  			assigned-clock-rates = <19200000>, <200000000>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2056  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2057  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2058  						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2059  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2060  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2061  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2062  			interrupt-names = "pwr_event",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2063  					  "hs_phy_irq",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2064  					  "dp_hs_phy_irq",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2065  					  "dm_hs_phy_irq",
1c7e64d6e8259f Wesley Cheng        2025-01-13  2066  					  "ss_phy_irq";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2067  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2068  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2069  			required-opps = <&rpmhpd_opp_nom>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2070  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2071  			resets = <&gcc GCC_USB30_PRIM_BCR>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2072  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2073  			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
1c7e64d6e8259f Wesley Cheng        2025-01-13  2074  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2075  			interconnect-names = "usb-ddr", "apps-usb";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2076  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2077  			usb_1_dwc3: usb@a600000 {
1c7e64d6e8259f Wesley Cheng        2025-01-13  2078  				compatible = "snps,dwc3";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2079  				reg = <0x0 0x0a600000 0x0 0xe000>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2080  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2081  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2082  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2083  				iommus = <&apps_smmu 0x40 0x0>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2084  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2085  				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2086  				phy-names = "usb2-phy", "usb3-phy";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2087  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2088  				snps,hird-threshold = /bits/ 8 <0x0>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2089  				snps,usb2-gadget-lpm-disable;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2090  				snps,dis_u2_susphy_quirk;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2091  				snps,dis_enblslpm_quirk;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2092  				snps,dis-u1-entry-quirk;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2093  				snps,dis-u2-entry-quirk;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2094  				snps,is-utmi-l1-suspend;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2095  				snps,usb3_lpm_capable;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2096  				snps,usb2-lpm-disable;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2097  				snps,has-lpm-erratum;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2098  				tx-fifo-resize;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2099  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2100  				dr_mode = "peripheral";
1c7e64d6e8259f Wesley Cheng        2025-01-13  2101  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2102  				dma-coherent;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2103  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2104  				ports {
1c7e64d6e8259f Wesley Cheng        2025-01-13  2105  					#address-cells = <1>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2106  					#size-cells = <0>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2107  
1c7e64d6e8259f Wesley Cheng        2025-01-13  2108  					port@0 {
1c7e64d6e8259f Wesley Cheng        2025-01-13  2109  						reg = <0>;
1c7e64d6e8259f Wesley Cheng        2025-01-13  2110  
1c7e64d6e8259f Wesley Cheng        2025-01-13 @2111  						usb_1_dwc3_hs: endpoint {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
