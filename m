Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398B1CAA98
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737590159; cv=none; b=h7LvcY/UT/thvLymyGwP2Rbp5vg8k+Vi1sjmDXZpJwQV9gkG5X3S1qM5AKZxQZEMsvhveQ0HdkIl2dRVV2otgUdOX1SSh6ilS92W1g2h1H+S4x+ZOXtxyRz0XQODbgm2zpYDlCe80S5gRPJEgNMjwLqezWNHd/tCmPGqOrm5XaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737590159; c=relaxed/simple;
	bh=Rg1/Wi1V3ySkNn2i81pTmAkDrW7AyX9YSkiboI9j8fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLnUPiEMYgtwfTJp0nPTvMdDoJfYs3jPtz6XQInzlgsEycPkPJWwxFQz3hV2mwow4nQmUdB+1fOXZDp0Q68d8eCwFTjHIWLKxKxh6jl37nvJr2wbckoru/WunCykpDJ2kKjftxKmw9iZcT2IfrvnQ5vgJVGtOjaNUjnJ+h2Y9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN8/iIq8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN8/iIq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737590151; x=1769126151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rg1/Wi1V3ySkNn2i81pTmAkDrW7AyX9YSkiboI9j8fM=;
  b=PN8/iIq8GkjfzGAL90KaQ5osuClNIHKkdPP4q250binEtYvpWIOCK7BF
   VILGMNYGef5VjkaLq5XuityQ9StEmhyFN7MbGCp0YIG+HI7aqqWTHt4zM
   I7gp6MDN+kNAM4H37yJm/xxpe6iLpGAcGTld72emee9K7kr7IZ+TflVpi
   1f0Pgd6yPCEjLQ4+BguVkx7s0xUoz8BE6Azc5SX1DgLDjOO4OS8dYc6DQ
   wBptE1DjBTYvoWJPrpEnmVRP1THVthjyysthcZE1kJH7b8ofDH2KVYJEZ
   UMfebY2RtMKcn4WYNIS/j2EKZkLFPqJHaRDpnXAxUXi7LOm/nauk799Q0
   A==;
X-CSE-ConnectionGUID: +zmitLkFRUS6kqWRczDfnA==
X-CSE-MsgGUID: RPU3mmkHQOeMGPDu3pP+Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37988892"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37988892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 15:55:50 -0800
X-CSE-ConnectionGUID: JVwQW3UmTGyAHIkBCx+eng==
X-CSE-MsgGUID: gG1N0N0JRIGX6lOLdNDciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112267419"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 15:55:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1takZV-000aQZ-2a;
	Wed, 22 Jan 2025 23:55:45 +0000
Date: Thu, 23 Jan 2025 07:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 70/74]
 arch/arm64/boot/dts/qcom/sm8750.dtsi:2821.27-2904.6: Warning
 (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202501230712.ido2CRpO-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: fbe30c4d7cec45b160138336252258be523894e7 [70/74] WIP: dts: dispcc
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-004-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230712.ido2CRpO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230712.ido2CRpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501230712.ido2CRpO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:2821.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:2926.27-2982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +2821 arch/arm64/boot/dts/qcom/sm8750.dtsi

068c3d3c83be47 Melody Olvera       2024-12-04    22  
068c3d3c83be47 Melody Olvera       2024-12-04    23  / {
068c3d3c83be47 Melody Olvera       2024-12-04    24  	interrupt-parent = <&intc>;
068c3d3c83be47 Melody Olvera       2024-12-04    25  
068c3d3c83be47 Melody Olvera       2024-12-04    26  	#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    27  	#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    28  
068c3d3c83be47 Melody Olvera       2024-12-04    29  	cpus {
068c3d3c83be47 Melody Olvera       2024-12-04    30  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    31  		#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04    32  
068c3d3c83be47 Melody Olvera       2024-12-04    33  		cpu0: cpu@0 {
068c3d3c83be47 Melody Olvera       2024-12-04    34  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    35  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    36  			reg = <0x0 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04    37  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    38  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    39  			power-domains = <&cpu_pd0>;
068c3d3c83be47 Melody Olvera       2024-12-04    40  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    41  
068c3d3c83be47 Melody Olvera       2024-12-04    42  			l2_0: l2-cache {
068c3d3c83be47 Melody Olvera       2024-12-04    43  				compatible = "cache";
068c3d3c83be47 Melody Olvera       2024-12-04    44  				cache-level = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04    45  				cache-unified;
068c3d3c83be47 Melody Olvera       2024-12-04    46  			};
068c3d3c83be47 Melody Olvera       2024-12-04    47  		};
068c3d3c83be47 Melody Olvera       2024-12-04    48  
068c3d3c83be47 Melody Olvera       2024-12-04    49  		cpu1: cpu@100 {
068c3d3c83be47 Melody Olvera       2024-12-04    50  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    51  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    52  			reg = <0x0 0x100>;
068c3d3c83be47 Melody Olvera       2024-12-04    53  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    54  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    55  			power-domains = <&cpu_pd1>;
068c3d3c83be47 Melody Olvera       2024-12-04    56  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    57  		};
068c3d3c83be47 Melody Olvera       2024-12-04    58  
068c3d3c83be47 Melody Olvera       2024-12-04    59  		cpu2: cpu@200 {
068c3d3c83be47 Melody Olvera       2024-12-04    60  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    61  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    62  			reg = <0x0 0x200>;
068c3d3c83be47 Melody Olvera       2024-12-04    63  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    64  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    65  			power-domains = <&cpu_pd2>;
068c3d3c83be47 Melody Olvera       2024-12-04    66  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    67  		};
068c3d3c83be47 Melody Olvera       2024-12-04    68  
068c3d3c83be47 Melody Olvera       2024-12-04    69  		cpu3: cpu@300 {
068c3d3c83be47 Melody Olvera       2024-12-04    70  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    71  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    72  			reg = <0x0 0x300>;
068c3d3c83be47 Melody Olvera       2024-12-04    73  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    74  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    75  			power-domains = <&cpu_pd3>;
068c3d3c83be47 Melody Olvera       2024-12-04    76  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    77  		};
068c3d3c83be47 Melody Olvera       2024-12-04    78  
068c3d3c83be47 Melody Olvera       2024-12-04    79  		cpu4: cpu@400 {
068c3d3c83be47 Melody Olvera       2024-12-04    80  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    81  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    82  			reg = <0x0 0x400>;
068c3d3c83be47 Melody Olvera       2024-12-04    83  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    84  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    85  			power-domains = <&cpu_pd4>;
068c3d3c83be47 Melody Olvera       2024-12-04    86  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    87  		};
068c3d3c83be47 Melody Olvera       2024-12-04    88  
068c3d3c83be47 Melody Olvera       2024-12-04    89  		cpu5: cpu@500 {
068c3d3c83be47 Melody Olvera       2024-12-04    90  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04    91  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04    92  			reg = <0x0 0x500>;
068c3d3c83be47 Melody Olvera       2024-12-04    93  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    94  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera       2024-12-04    95  			power-domains = <&cpu_pd5>;
068c3d3c83be47 Melody Olvera       2024-12-04    96  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04    97  		};
068c3d3c83be47 Melody Olvera       2024-12-04    98  
068c3d3c83be47 Melody Olvera       2024-12-04    99  		cpu6: cpu@10000 {
068c3d3c83be47 Melody Olvera       2024-12-04   100  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04   101  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04   102  			reg = <0x0 0x10000>;
068c3d3c83be47 Melody Olvera       2024-12-04   103  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   104  			next-level-cache = <&L2_1>;
068c3d3c83be47 Melody Olvera       2024-12-04   105  			power-domains = <&cpu_pd6>;
068c3d3c83be47 Melody Olvera       2024-12-04   106  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   107  
068c3d3c83be47 Melody Olvera       2024-12-04   108  			L2_1: l2-cache {
068c3d3c83be47 Melody Olvera       2024-12-04   109  				compatible = "cache";
068c3d3c83be47 Melody Olvera       2024-12-04   110  				cache-level = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   111  				cache-unified;
068c3d3c83be47 Melody Olvera       2024-12-04   112  			};
068c3d3c83be47 Melody Olvera       2024-12-04   113  		};
068c3d3c83be47 Melody Olvera       2024-12-04   114  
068c3d3c83be47 Melody Olvera       2024-12-04   115  		cpu7: cpu@10100 {
068c3d3c83be47 Melody Olvera       2024-12-04   116  			device_type = "cpu";
068c3d3c83be47 Melody Olvera       2024-12-04   117  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera       2024-12-04   118  			reg = <0x0 0x10100>;
068c3d3c83be47 Melody Olvera       2024-12-04   119  			enable-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   120  			next-level-cache = <&L2_1>;
068c3d3c83be47 Melody Olvera       2024-12-04   121  			power-domains = <&cpu_pd7>;
068c3d3c83be47 Melody Olvera       2024-12-04   122  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   123  		};
068c3d3c83be47 Melody Olvera       2024-12-04   124  
068c3d3c83be47 Melody Olvera       2024-12-04   125  		cpu-map {
068c3d3c83be47 Melody Olvera       2024-12-04   126  			cluster0 {
068c3d3c83be47 Melody Olvera       2024-12-04   127  				core0 {
068c3d3c83be47 Melody Olvera       2024-12-04   128  					cpu = <&cpu0>;
068c3d3c83be47 Melody Olvera       2024-12-04   129  				};
068c3d3c83be47 Melody Olvera       2024-12-04   130  
068c3d3c83be47 Melody Olvera       2024-12-04   131  				core1 {
068c3d3c83be47 Melody Olvera       2024-12-04   132  					cpu = <&cpu1>;
068c3d3c83be47 Melody Olvera       2024-12-04   133  				};
068c3d3c83be47 Melody Olvera       2024-12-04   134  
068c3d3c83be47 Melody Olvera       2024-12-04   135  				core2 {
068c3d3c83be47 Melody Olvera       2024-12-04   136  					cpu = <&cpu2>;
068c3d3c83be47 Melody Olvera       2024-12-04   137  				};
068c3d3c83be47 Melody Olvera       2024-12-04   138  
068c3d3c83be47 Melody Olvera       2024-12-04   139  				core3 {
068c3d3c83be47 Melody Olvera       2024-12-04   140  					cpu = <&cpu3>;
068c3d3c83be47 Melody Olvera       2024-12-04   141  				};
068c3d3c83be47 Melody Olvera       2024-12-04   142  
068c3d3c83be47 Melody Olvera       2024-12-04   143  				core4 {
068c3d3c83be47 Melody Olvera       2024-12-04   144  					cpu = <&cpu4>;
068c3d3c83be47 Melody Olvera       2024-12-04   145  				};
068c3d3c83be47 Melody Olvera       2024-12-04   146  
068c3d3c83be47 Melody Olvera       2024-12-04   147  				core5 {
068c3d3c83be47 Melody Olvera       2024-12-04   148  					cpu = <&cpu5>;
068c3d3c83be47 Melody Olvera       2024-12-04   149  				};
068c3d3c83be47 Melody Olvera       2024-12-04   150  			};
068c3d3c83be47 Melody Olvera       2024-12-04   151  
068c3d3c83be47 Melody Olvera       2024-12-04   152  			cluster1 {
068c3d3c83be47 Melody Olvera       2024-12-04   153  				core0 {
068c3d3c83be47 Melody Olvera       2024-12-04   154  					cpu = <&cpu6>;
068c3d3c83be47 Melody Olvera       2024-12-04   155  				};
068c3d3c83be47 Melody Olvera       2024-12-04   156  
068c3d3c83be47 Melody Olvera       2024-12-04   157  				core1 {
068c3d3c83be47 Melody Olvera       2024-12-04   158  					cpu = <&cpu7>;
068c3d3c83be47 Melody Olvera       2024-12-04   159  				};
068c3d3c83be47 Melody Olvera       2024-12-04   160  			};
068c3d3c83be47 Melody Olvera       2024-12-04   161  		};
068c3d3c83be47 Melody Olvera       2024-12-04   162  
068c3d3c83be47 Melody Olvera       2024-12-04   163  		idle-states {
068c3d3c83be47 Melody Olvera       2024-12-04   164  			entry-method = "psci";
068c3d3c83be47 Melody Olvera       2024-12-04   165  
068c3d3c83be47 Melody Olvera       2024-12-04   166  			cluster0_c4: cpu-sleep-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   167  				compatible = "arm,idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   168  				idle-state-name = "ret";
068c3d3c83be47 Melody Olvera       2024-12-04   169  				arm,psci-suspend-param = <0x00000004>;
068c3d3c83be47 Melody Olvera       2024-12-04   170  				entry-latency-us = <93>;
068c3d3c83be47 Melody Olvera       2024-12-04   171  				exit-latency-us = <129>;
068c3d3c83be47 Melody Olvera       2024-12-04   172  				min-residency-us = <560>;
068c3d3c83be47 Melody Olvera       2024-12-04   173  			};
068c3d3c83be47 Melody Olvera       2024-12-04   174  
068c3d3c83be47 Melody Olvera       2024-12-04   175  			cluster1_c4: cpu-sleep-1 {
068c3d3c83be47 Melody Olvera       2024-12-04   176  				compatible = "arm,idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   177  				idle-state-name = "ret";
068c3d3c83be47 Melody Olvera       2024-12-04   178  				arm,psci-suspend-param = <0x00000004>;
068c3d3c83be47 Melody Olvera       2024-12-04   179  				entry-latency-us = <172>;
068c3d3c83be47 Melody Olvera       2024-12-04   180  				exit-latency-us = <130>;
068c3d3c83be47 Melody Olvera       2024-12-04   181  				min-residency-us = <686>;
068c3d3c83be47 Melody Olvera       2024-12-04   182  			};
068c3d3c83be47 Melody Olvera       2024-12-04   183  
068c3d3c83be47 Melody Olvera       2024-12-04   184  		};
068c3d3c83be47 Melody Olvera       2024-12-04   185  
068c3d3c83be47 Melody Olvera       2024-12-04   186  		domain-idle-states {
068c3d3c83be47 Melody Olvera       2024-12-04   187  			cluster_cl5: cluster-sleep-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   188  				compatible = "domain-idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   189  				arm,psci-suspend-param = <0x01000054>;
068c3d3c83be47 Melody Olvera       2024-12-04   190  				entry-latency-us = <2150>;
068c3d3c83be47 Melody Olvera       2024-12-04   191  				exit-latency-us = <1983>;
068c3d3c83be47 Melody Olvera       2024-12-04   192  				min-residency-us = <9144>;
068c3d3c83be47 Melody Olvera       2024-12-04   193  			};
068c3d3c83be47 Melody Olvera       2024-12-04   194  
068c3d3c83be47 Melody Olvera       2024-12-04   195  			domain_ss3: domain-sleep-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   196  				compatible = "domain-idle-state";
068c3d3c83be47 Melody Olvera       2024-12-04   197  				arm,psci-suspend-param = <0x0200c354>;
068c3d3c83be47 Melody Olvera       2024-12-04   198  				entry-latency-us = <2800>;
068c3d3c83be47 Melody Olvera       2024-12-04   199  				exit-latency-us = <4400>;
068c3d3c83be47 Melody Olvera       2024-12-04   200  				min-residency-us = <10150>;
068c3d3c83be47 Melody Olvera       2024-12-04   201  			};
068c3d3c83be47 Melody Olvera       2024-12-04   202  		};
068c3d3c83be47 Melody Olvera       2024-12-04   203  	};
068c3d3c83be47 Melody Olvera       2024-12-04   204  
068c3d3c83be47 Melody Olvera       2024-12-04   205  	firmware {
068c3d3c83be47 Melody Olvera       2024-12-04   206  		scm: scm {
068c3d3c83be47 Melody Olvera       2024-12-04   207  			compatible = "qcom,scm-sm8750", "qcom,scm";
068c3d3c83be47 Melody Olvera       2024-12-04   208  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   209  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   210  		};
068c3d3c83be47 Melody Olvera       2024-12-04   211  	};
068c3d3c83be47 Melody Olvera       2024-12-04   212  
068c3d3c83be47 Melody Olvera       2024-12-04   213  	clk_virt: interconnect-0 {
068c3d3c83be47 Melody Olvera       2024-12-04   214  		compatible = "qcom,sm8750-clk-virt";
068c3d3c83be47 Melody Olvera       2024-12-04   215  		#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   216  		qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04   217  	};
068c3d3c83be47 Melody Olvera       2024-12-04   218  
068c3d3c83be47 Melody Olvera       2024-12-04   219  	mc_virt: interconnect-1 {
068c3d3c83be47 Melody Olvera       2024-12-04   220  		compatible = "qcom,sm8750-mc-virt";
068c3d3c83be47 Melody Olvera       2024-12-04   221  		#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   222  		qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04   223  	};
068c3d3c83be47 Melody Olvera       2024-12-04   224  
068c3d3c83be47 Melody Olvera       2024-12-04   225  	memory@a0000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   226  		device_type = "memory";
068c3d3c83be47 Melody Olvera       2024-12-04   227  		/* We expect the bootloader to fill in the size */
068c3d3c83be47 Melody Olvera       2024-12-04   228  		reg = <0x0 0xa0000000 0x0 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04   229  	};
068c3d3c83be47 Melody Olvera       2024-12-04   230  
068c3d3c83be47 Melody Olvera       2024-12-04   231  	pmu {
068c3d3c83be47 Melody Olvera       2024-12-04   232  		compatible = "arm,armv8-pmuv3";
068c3d3c83be47 Melody Olvera       2024-12-04   233  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
068c3d3c83be47 Melody Olvera       2024-12-04   234  	};
068c3d3c83be47 Melody Olvera       2024-12-04   235  
068c3d3c83be47 Melody Olvera       2024-12-04   236  	psci {
068c3d3c83be47 Melody Olvera       2024-12-04   237  		compatible = "arm,psci-1.0";
068c3d3c83be47 Melody Olvera       2024-12-04   238  		method = "smc";
068c3d3c83be47 Melody Olvera       2024-12-04   239  
068c3d3c83be47 Melody Olvera       2024-12-04   240  		cpu_pd0: power-domain-cpu0 {
068c3d3c83be47 Melody Olvera       2024-12-04   241  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   242  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   243  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   244  		};
068c3d3c83be47 Melody Olvera       2024-12-04   245  
068c3d3c83be47 Melody Olvera       2024-12-04   246  		cpu_pd1: power-domain-cpu1 {
068c3d3c83be47 Melody Olvera       2024-12-04   247  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   248  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   249  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   250  		};
068c3d3c83be47 Melody Olvera       2024-12-04   251  
068c3d3c83be47 Melody Olvera       2024-12-04   252  		cpu_pd2: power-domain-cpu2 {
068c3d3c83be47 Melody Olvera       2024-12-04   253  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   254  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   255  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   256  		};
068c3d3c83be47 Melody Olvera       2024-12-04   257  
068c3d3c83be47 Melody Olvera       2024-12-04   258  		cpu_pd3: power-domain-cpu3 {
068c3d3c83be47 Melody Olvera       2024-12-04   259  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   260  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   261  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   262  		};
068c3d3c83be47 Melody Olvera       2024-12-04   263  
068c3d3c83be47 Melody Olvera       2024-12-04   264  		cpu_pd4: power-domain-cpu4 {
068c3d3c83be47 Melody Olvera       2024-12-04   265  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   266  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   267  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   268  		};
068c3d3c83be47 Melody Olvera       2024-12-04   269  
068c3d3c83be47 Melody Olvera       2024-12-04   270  		cpu_pd5: power-domain-cpu5 {
068c3d3c83be47 Melody Olvera       2024-12-04   271  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   272  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   273  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   274  		};
068c3d3c83be47 Melody Olvera       2024-12-04   275  
068c3d3c83be47 Melody Olvera       2024-12-04   276  		cpu_pd6: power-domain-cpu6 {
068c3d3c83be47 Melody Olvera       2024-12-04   277  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   278  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   279  			domain-idle-states = <&cluster1_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   280  		};
068c3d3c83be47 Melody Olvera       2024-12-04   281  
068c3d3c83be47 Melody Olvera       2024-12-04   282  		cpu_pd7: power-domain-cpu7 {
068c3d3c83be47 Melody Olvera       2024-12-04   283  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   284  			power-domains = <&cluster_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   285  			domain-idle-states = <&cluster1_c4>;
068c3d3c83be47 Melody Olvera       2024-12-04   286  		};
068c3d3c83be47 Melody Olvera       2024-12-04   287  
068c3d3c83be47 Melody Olvera       2024-12-04   288  		cluster_pd: power-domain-cluster {
068c3d3c83be47 Melody Olvera       2024-12-04   289  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   290  			domain-idle-states = <&cluster_cl5>;
068c3d3c83be47 Melody Olvera       2024-12-04   291  			power-domains = <&system_pd>;
068c3d3c83be47 Melody Olvera       2024-12-04   292  		};
068c3d3c83be47 Melody Olvera       2024-12-04   293  
068c3d3c83be47 Melody Olvera       2024-12-04   294  		system_pd: power-domain-system {
068c3d3c83be47 Melody Olvera       2024-12-04   295  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   296  			domain-idle-states = <&domain_ss3>;
068c3d3c83be47 Melody Olvera       2024-12-04   297  		};
068c3d3c83be47 Melody Olvera       2024-12-04   298  	};
068c3d3c83be47 Melody Olvera       2024-12-04   299  
068c3d3c83be47 Melody Olvera       2024-12-04   300  	reserved-memory {
068c3d3c83be47 Melody Olvera       2024-12-04   301  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   302  		#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   303  		ranges;
068c3d3c83be47 Melody Olvera       2024-12-04   304  
068c3d3c83be47 Melody Olvera       2024-12-04   305  		gunyah_hyp_mem: gunyah-hyp@80000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   306  			reg = <0x0 0x80000000 0x0 0xe00000>;
068c3d3c83be47 Melody Olvera       2024-12-04   307  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   308  		};
068c3d3c83be47 Melody Olvera       2024-12-04   309  
068c3d3c83be47 Melody Olvera       2024-12-04   310  		cpusys_vm_mem: cpusys-vm-mem@80e00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   311  			reg = <0x0 0x80e00000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   312  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   313  		};
068c3d3c83be47 Melody Olvera       2024-12-04   314  
068c3d3c83be47 Melody Olvera       2024-12-04   315  		cpucp_mem: cpucp@81200000 {
068c3d3c83be47 Melody Olvera       2024-12-04   316  			reg = <0x0 0x81200000 0x0 0x200000>;
068c3d3c83be47 Melody Olvera       2024-12-04   317  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   318  		};
068c3d3c83be47 Melody Olvera       2024-12-04   319  
068c3d3c83be47 Melody Olvera       2024-12-04   320  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   321  			reg = <0x0 0x81a00000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   322  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   323  		};
068c3d3c83be47 Melody Olvera       2024-12-04   324  
068c3d3c83be47 Melody Olvera       2024-12-04   325  		aop_image_mem: aop-image@81c00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   326  			reg = <0x0 0x81c00000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera       2024-12-04   327  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   328  		};
068c3d3c83be47 Melody Olvera       2024-12-04   329  
068c3d3c83be47 Melody Olvera       2024-12-04   330  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
068c3d3c83be47 Melody Olvera       2024-12-04   331  			compatible = "qcom,cmd-db";
068c3d3c83be47 Melody Olvera       2024-12-04   332  			reg = <0x0 0x81c60000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera       2024-12-04   333  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   334  		};
068c3d3c83be47 Melody Olvera       2024-12-04   335  
068c3d3c83be47 Melody Olvera       2024-12-04   336  		/* Merged aop_config, tme_crash_dump, tme_log and uefi_log regions */
068c3d3c83be47 Melody Olvera       2024-12-04   337  		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
068c3d3c83be47 Melody Olvera       2024-12-04   338  			reg = <0x0 0x81c80000 0x0 0x74000>;
068c3d3c83be47 Melody Olvera       2024-12-04   339  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   340  		};
068c3d3c83be47 Melody Olvera       2024-12-04   341  
068c3d3c83be47 Melody Olvera       2024-12-04   342  		/* Secdata region can be reused by apps */
068c3d3c83be47 Melody Olvera       2024-12-04   343  
068c3d3c83be47 Melody Olvera       2024-12-04   344  		smem_mem: smem@81d00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   345  			compatible = "qcom,smem";
068c3d3c83be47 Melody Olvera       2024-12-04   346  			reg = <0x0 0x81d00000 0x0 0x200000>;
068c3d3c83be47 Melody Olvera       2024-12-04   347  			hwlocks = <&tcsr_mutex 3>;
068c3d3c83be47 Melody Olvera       2024-12-04   348  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   349  		};
068c3d3c83be47 Melody Olvera       2024-12-04   350  
068c3d3c83be47 Melody Olvera       2024-12-04   351  		pdp_ns_shared_mem: pdp-ns-shared@81f00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   352  			reg = <0x0 0x81f00000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   353  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   354  		};
068c3d3c83be47 Melody Olvera       2024-12-04   355  
068c3d3c83be47 Melody Olvera       2024-12-04   356  		cpucp_scandump_mem: cpucp-scandump@82000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   357  			reg = <0x0 0x82000000 0x0 0x380000>;
068c3d3c83be47 Melody Olvera       2024-12-04   358  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   359  		};
068c3d3c83be47 Melody Olvera       2024-12-04   360  
068c3d3c83be47 Melody Olvera       2024-12-04   361  		adsp_mhi_mem: adsp-mhi@82380000 {
068c3d3c83be47 Melody Olvera       2024-12-04   362  			reg = <0x0 0x82380000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera       2024-12-04   363  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   364  		};
068c3d3c83be47 Melody Olvera       2024-12-04   365  
068c3d3c83be47 Melody Olvera       2024-12-04   366  		soccp_sdi_mem: soccp-sdi@823a0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   367  			reg = <0x0 0x823a0000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   368  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   369  		};
068c3d3c83be47 Melody Olvera       2024-12-04   370  
068c3d3c83be47 Melody Olvera       2024-12-04   371  		pmic_minii_dump_mem: pmic-minii-dump@823e0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   372  			reg = <0x0 0x823e0000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   373  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   374  		};
068c3d3c83be47 Melody Olvera       2024-12-04   375  
068c3d3c83be47 Melody Olvera       2024-12-04   376  		pvmfw_mem: pvmfw@824a0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   377  			reg = <0x0 0x824a0000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   378  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   379  		};
068c3d3c83be47 Melody Olvera       2024-12-04   380  
068c3d3c83be47 Melody Olvera       2024-12-04   381  		global_sync_mem: global-sync@82600000 {
068c3d3c83be47 Melody Olvera       2024-12-04   382  			reg = <0x0 0x82600000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   383  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   384  		};
068c3d3c83be47 Melody Olvera       2024-12-04   385  
068c3d3c83be47 Melody Olvera       2024-12-04   386  		tz_stat_mem: tz-stat@82700000 {
068c3d3c83be47 Melody Olvera       2024-12-04   387  			reg = <0x0 0x82700000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera       2024-12-04   388  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   389  		};
068c3d3c83be47 Melody Olvera       2024-12-04   390  
068c3d3c83be47 Melody Olvera       2024-12-04   391  		qdss_mem: qdss@82800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   392  			reg = <0x0 0x82800000 0x0 0x2000000>;
068c3d3c83be47 Melody Olvera       2024-12-04   393  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   394  		};
068c3d3c83be47 Melody Olvera       2024-12-04   395  
068c3d3c83be47 Melody Olvera       2024-12-04   396  		dsm_partition_1_mem: dsm-partition-1@84a00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   397  			reg = <0x0 0x84a00000 0x0 0x4900000>;
068c3d3c83be47 Melody Olvera       2024-12-04   398  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   399  		};
068c3d3c83be47 Melody Olvera       2024-12-04   400  
068c3d3c83be47 Melody Olvera       2024-12-04   401  		dsm_partition_2_mem: dsm-partition-2@89300000 {
068c3d3c83be47 Melody Olvera       2024-12-04   402  			reg = <0x0 0x89300000 0x0 0xa80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   403  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   404  		};
068c3d3c83be47 Melody Olvera       2024-12-04   405  
068c3d3c83be47 Melody Olvera       2024-12-04   406  		mpss_mem: mpss@8ba00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   407  			reg = <0x0 0x8ba00000 0x0 0xf600000>;
068c3d3c83be47 Melody Olvera       2024-12-04   408  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   409  		};
068c3d3c83be47 Melody Olvera       2024-12-04   410  
068c3d3c83be47 Melody Olvera       2024-12-04   411  		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   412  			reg = <0x0 0x9b000000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   413  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   414  		};
068c3d3c83be47 Melody Olvera       2024-12-04   415  
068c3d3c83be47 Melody Olvera       2024-12-04   416  		ipa_fw_mem: ipa-fw@9b080000 {
068c3d3c83be47 Melody Olvera       2024-12-04   417  			reg = <0x0 0x9b080000 0x0 0x10000>;
068c3d3c83be47 Melody Olvera       2024-12-04   418  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   419  		};
068c3d3c83be47 Melody Olvera       2024-12-04   420  
068c3d3c83be47 Melody Olvera       2024-12-04   421  		ipa_gsi_mem: ipa-gsi@9b090000 {
068c3d3c83be47 Melody Olvera       2024-12-04   422  			reg = <0x0 0x9b090000 0x0 0xa000>;
068c3d3c83be47 Melody Olvera       2024-12-04   423  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   424  		};
068c3d3c83be47 Melody Olvera       2024-12-04   425  
068c3d3c83be47 Melody Olvera       2024-12-04   426  		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
068c3d3c83be47 Melody Olvera       2024-12-04   427  			reg = <0x0 0x9b09a000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04   428  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   429  		};
068c3d3c83be47 Melody Olvera       2024-12-04   430  
068c3d3c83be47 Melody Olvera       2024-12-04   431  		spss_region_mem: spss@9b0a0000  {
068c3d3c83be47 Melody Olvera       2024-12-04   432  			reg = <0x0 0x9b0a0000 0x0 0x1e0000>;
068c3d3c83be47 Melody Olvera       2024-12-04   433  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   434  		};
068c3d3c83be47 Melody Olvera       2024-12-04   435  
068c3d3c83be47 Melody Olvera       2024-12-04   436  		/* First part of the "SPU secure shared memory" region */
068c3d3c83be47 Melody Olvera       2024-12-04   437  		spu_tz_shared_mem: spu-tz-shared@9b280000 {
068c3d3c83be47 Melody Olvera       2024-12-04   438  			reg = <0x0 0x9b280000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   439  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   440  		};
068c3d3c83be47 Melody Olvera       2024-12-04   441  
068c3d3c83be47 Melody Olvera       2024-12-04   442  		/* Second part of the "SPU secure shared memory" region */
068c3d3c83be47 Melody Olvera       2024-12-04   443  		spu_modem_shared_mem: spu-modem-shared@9b2c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   444  			reg = <0x0 0x9b2c0000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera       2024-12-04   445  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   446  		};
068c3d3c83be47 Melody Olvera       2024-12-04   447  
068c3d3c83be47 Melody Olvera       2024-12-04   448  		camera_mem: camera@9b300000 {
068c3d3c83be47 Melody Olvera       2024-12-04   449  			reg = <0x0 0x9b300000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   450  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   451  		};
068c3d3c83be47 Melody Olvera       2024-12-04   452  
068c3d3c83be47 Melody Olvera       2024-12-04   453  		camera_2_mem: camera-2@9bb00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   454  			reg = <0x0 0x9bb00000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   455  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   456  		};
068c3d3c83be47 Melody Olvera       2024-12-04   457  
068c3d3c83be47 Melody Olvera       2024-12-04   458  		video_mem: video@9c300000 {
068c3d3c83be47 Melody Olvera       2024-12-04   459  			reg = <0x0 0x9c300000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   460  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   461  		};
068c3d3c83be47 Melody Olvera       2024-12-04   462  
068c3d3c83be47 Melody Olvera       2024-12-04   463  		cvp_mem: cvp@9cb00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   464  			reg = <0x0 0x9cb00000 0x0 0x700000>;
068c3d3c83be47 Melody Olvera       2024-12-04   465  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   466  		};
068c3d3c83be47 Melody Olvera       2024-12-04   467  
068c3d3c83be47 Melody Olvera       2024-12-04   468  		cdsp_mem: cdsp@9d200000 {
068c3d3c83be47 Melody Olvera       2024-12-04   469  			reg = <0x0 0x9d200000 0x0 0x1900000>;
068c3d3c83be47 Melody Olvera       2024-12-04   470  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   471  		};
068c3d3c83be47 Melody Olvera       2024-12-04   472  
068c3d3c83be47 Melody Olvera       2024-12-04   473  		q6_cdsp_dtb_mem: q6-cdsp-dtb@9eb00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   474  			reg = <0x0 0x9eb00000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   475  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   476  		};
068c3d3c83be47 Melody Olvera       2024-12-04   477  
068c3d3c83be47 Melody Olvera       2024-12-04   478  		soccp_mem: soccp@9ec00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   479  			reg = <0x0 0x9ec00000 0x0 0x180000>;
068c3d3c83be47 Melody Olvera       2024-12-04   480  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   481  		};
068c3d3c83be47 Melody Olvera       2024-12-04   482  
068c3d3c83be47 Melody Olvera       2024-12-04   483  		q6_adsp_dtb_mem: q6-adsp-dtb@9ed80000 {
068c3d3c83be47 Melody Olvera       2024-12-04   484  			reg = <0x0 0x9ed80000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   485  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   486  		};
068c3d3c83be47 Melody Olvera       2024-12-04   487  
068c3d3c83be47 Melody Olvera       2024-12-04   488  		adspslpi_mem: adspslpi@9ee00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   489  			reg = <0x0 0x9ee00000 0x0 0x3a80000>;
068c3d3c83be47 Melody Olvera       2024-12-04   490  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   491  		};
068c3d3c83be47 Melody Olvera       2024-12-04   492  
068c3d3c83be47 Melody Olvera       2024-12-04   493  		xbl_ramdump_mem: xbl-ramdump@b8000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   494  			reg = <0x0 0xb8000000 0x0 0x1c0000>;
068c3d3c83be47 Melody Olvera       2024-12-04   495  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   496  		};
068c3d3c83be47 Melody Olvera       2024-12-04   497  
068c3d3c83be47 Melody Olvera       2024-12-04   498  		hwfence_shbuf: hwfence-shbuf@d4e23000 {
068c3d3c83be47 Melody Olvera       2024-12-04   499  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   500  			reg = <0x0 0xd4e23000 0x0 0x2dd000>;
068c3d3c83be47 Melody Olvera       2024-12-04   501  		};
068c3d3c83be47 Melody Olvera       2024-12-04   502  
068c3d3c83be47 Melody Olvera       2024-12-04   503  		/* Merged tz_reserved, xbl_sc, and qtee regions */
068c3d3c83be47 Melody Olvera       2024-12-04   504  		tz_merged_mem: tz-merged@d8000000 {
068c3d3c83be47 Melody Olvera       2024-12-04   505  			reg = <0x0 0xd8000000 0x0 0x600000>;
068c3d3c83be47 Melody Olvera       2024-12-04   506  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   507  		};
068c3d3c83be47 Melody Olvera       2024-12-04   508  
068c3d3c83be47 Melody Olvera       2024-12-04   509  		trust_ui_vm_mem: trust-ui-vm@f3800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   510  			reg = <0x0 0xf3800000 0x0 0x4400000>;
068c3d3c83be47 Melody Olvera       2024-12-04   511  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   512  		};
068c3d3c83be47 Melody Olvera       2024-12-04   513  
068c3d3c83be47 Melody Olvera       2024-12-04   514  		oem_vm_mem: oem-vm@f7c00000 {
068c3d3c83be47 Melody Olvera       2024-12-04   515  			reg = <0x0 0xf7c00000 0x0 0x4c00000>;
068c3d3c83be47 Melody Olvera       2024-12-04   516  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   517  		};
068c3d3c83be47 Melody Olvera       2024-12-04   518  
068c3d3c83be47 Melody Olvera       2024-12-04   519  		llcc_lpi_mem: llcc-lpi@ff800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   520  			reg = <0x0 0xff800000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera       2024-12-04   521  			no-map;
068c3d3c83be47 Melody Olvera       2024-12-04   522  		};
068c3d3c83be47 Melody Olvera       2024-12-04   523  	};
068c3d3c83be47 Melody Olvera       2024-12-04   524  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   525  	smp2p-adsp {
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   526  		compatible = "qcom,smp2p";
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   527  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   528  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   529  					     IPCC_MPROC_SIGNAL_SMP2P
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   530  					     IRQ_TYPE_EDGE_RISING>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   531  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   532  		mboxes = <&ipcc IPCC_CLIENT_LPASS
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   533  				IPCC_MPROC_SIGNAL_SMP2P>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   534  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   535  		qcom,smem = <443>, <429>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   536  		qcom,local-pid = <0>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   537  		qcom,remote-pid = <2>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   538  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   539  		smp2p_adsp_out: master-kernel {
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   540  			qcom,entry-name = "master-kernel";
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   541  			#qcom,smem-state-cells = <1>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   542  		};
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   543  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   544  		smp2p_adsp_in: slave-kernel {
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   545  			qcom,entry-name = "slave-kernel";
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   546  			interrupt-controller;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   547  			#interrupt-cells = <2>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   548  		};
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   549  	};
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   550  
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   551  	smp2p-cdsp {
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   552  		compatible = "qcom,smp2p";
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   553  
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   554  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   555  					     IPCC_MPROC_SIGNAL_SMP2P
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   556  					     IRQ_TYPE_EDGE_RISING>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   557  
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   558  		mboxes = <&ipcc IPCC_CLIENT_CDSP
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   559  				IPCC_MPROC_SIGNAL_SMP2P>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   560  
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   561  		qcom,smem = <94>, <432>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   562  		qcom,local-pid = <0>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   563  		qcom,remote-pid = <5>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   564  
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   565  		smp2p_cdsp_out: master-kernel {
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   566  			qcom,entry-name = "master-kernel";
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   567  			#qcom,smem-state-cells = <1>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   568  		};
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   569  
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   570  		smp2p_cdsp_in: slave-kernel {
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   571  			qcom,entry-name = "slave-kernel";
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   572  			interrupt-controller;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   573  			#interrupt-cells = <2>;
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   574  		};
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   575  	};
ef643b2b612b4f Krzysztof Kozlowski 2024-11-22   576  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   577  	smp2p-modem {
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   578  		compatible = "qcom,smp2p";
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   579  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   580  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   581  					     IPCC_MPROC_SIGNAL_SMP2P
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   582  					     IRQ_TYPE_EDGE_RISING>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   583  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   584  		mboxes = <&ipcc IPCC_CLIENT_MPSS
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   585  				IPCC_MPROC_SIGNAL_SMP2P>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   586  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   587  		qcom,smem = <435>, <428>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   588  		qcom,local-pid = <0>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   589  		qcom,remote-pid = <1>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   590  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   591  		smp2p_modem_out: master-kernel {
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   592  			qcom,entry-name = "master-kernel";
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   593  			#qcom,smem-state-cells = <1>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   594  		};
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   595  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   596  		smp2p_modem_in: slave-kernel {
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   597  			qcom,entry-name = "slave-kernel";
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   598  			interrupt-controller;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   599  			#interrupt-cells = <2>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   600  		};
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   601  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   602  		ipa_smp2p_out: ipa-ap-to-modem {
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   603  			qcom,entry-name = "ipa";
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   604  			#qcom,smem-state-cells = <1>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   605  		};
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   606  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   607  		ipa_smp2p_in: ipa-modem-to-ap {
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   608  			qcom,entry-name = "ipa";
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   609  			interrupt-controller;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   610  			#interrupt-cells = <2>;
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   611  		};
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   612  
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   613  		/* TODO: smem mailbox in and out */
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   614  	};
9f8baac898d48c Krzysztof Kozlowski 2024-11-22   615  
068c3d3c83be47 Melody Olvera       2024-12-04   616  	soc: soc@0 {
068c3d3c83be47 Melody Olvera       2024-12-04   617  		compatible = "simple-bus";
068c3d3c83be47 Melody Olvera       2024-12-04   618  
068c3d3c83be47 Melody Olvera       2024-12-04   619  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   620  		#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   621  		dma-ranges = <0 0 0 0 0x10 0>;
068c3d3c83be47 Melody Olvera       2024-12-04   622  		ranges = <0 0 0 0 0x10 0>;
068c3d3c83be47 Melody Olvera       2024-12-04   623  
068c3d3c83be47 Melody Olvera       2024-12-04   624  		gcc: clock-controller@100000 {
068c3d3c83be47 Melody Olvera       2024-12-04   625  			compatible = "qcom,sm8750-gcc";
068c3d3c83be47 Melody Olvera       2024-12-04   626  			reg = <0x0 0x00100000 0x0 0x1f4200>;
068c3d3c83be47 Melody Olvera       2024-12-04   627  
068c3d3c83be47 Melody Olvera       2024-12-04   628  			clocks = <&bi_tcxo_div2>,
068c3d3c83be47 Melody Olvera       2024-12-04   629  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   630  				 <&sleep_clk>,
068c3d3c83be47 Melody Olvera       2024-12-04   631  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   632  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   633  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   634  				 <0>,
068c3d3c83be47 Melody Olvera       2024-12-04   635  				 <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   636  
068c3d3c83be47 Melody Olvera       2024-12-04   637  			#clock-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   638  			#reset-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   639  			#power-domain-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   640  		};
068c3d3c83be47 Melody Olvera       2024-12-04   641  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   642  		ipcc: mailbox@406000 {
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   643  			compatible = "qcom,sm8750-ipcc", "qcom,ipcc";
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   644  			reg = <0x0 0x00406000 0x0 0x1000>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   645  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   646  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   647  			interrupt-controller;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   648  			#interrupt-cells = <3>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   649  
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   650  			#mbox-cells = <2>;
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   651  		};
6e91f9b71dcd48 Krzysztof Kozlowski 2024-10-09   652  
068c3d3c83be47 Melody Olvera       2024-12-04   653  		gpi_dma2: dma-controller@800000 {
068c3d3c83be47 Melody Olvera       2024-12-04   654  			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
068c3d3c83be47 Melody Olvera       2024-12-04   655  			reg = <0x0 0x00800000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera       2024-12-04   656  
068c3d3c83be47 Melody Olvera       2024-12-04   657  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   658  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   659  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   660  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   661  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   662  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   663  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   664  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   665  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   666  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   667  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04   668  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   669  
068c3d3c83be47 Melody Olvera       2024-12-04   670  			dma-channels = <12>;
068c3d3c83be47 Melody Olvera       2024-12-04   671  			dma-channel-mask = <0x1e>;
068c3d3c83be47 Melody Olvera       2024-12-04   672  			#dma-cells = <3>;
068c3d3c83be47 Melody Olvera       2024-12-04   673  
068c3d3c83be47 Melody Olvera       2024-12-04   674  			iommus = <&apps_smmu 0x436 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04   675  
068c3d3c83be47 Melody Olvera       2024-12-04   676  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   677  		};
068c3d3c83be47 Melody Olvera       2024-12-04   678  
068c3d3c83be47 Melody Olvera       2024-12-04   679  		qupv3_2: geniqup@8c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04   680  			compatible = "qcom,geni-se-qup";
068c3d3c83be47 Melody Olvera       2024-12-04   681  			reg = <0x0 0x008c0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04   682  
068c3d3c83be47 Melody Olvera       2024-12-04   683  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04   684  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   685  			clock-names = "m-ahb",
068c3d3c83be47 Melody Olvera       2024-12-04   686  				      "s-ahb";
068c3d3c83be47 Melody Olvera       2024-12-04   687  
068c3d3c83be47 Melody Olvera       2024-12-04   688  			iommus = <&apps_smmu 0x423 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04   689  
068c3d3c83be47 Melody Olvera       2024-12-04   690  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   691  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04   692  			ranges;
068c3d3c83be47 Melody Olvera       2024-12-04   693  
068c3d3c83be47 Melody Olvera       2024-12-04   694  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   695  
068c3d3c83be47 Melody Olvera       2024-12-04   696  			i2c8: i2c@880000 {
068c3d3c83be47 Melody Olvera       2024-12-04   697  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   698  				reg = <0x0 0x00880000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   699  
068c3d3c83be47 Melody Olvera       2024-12-04   700  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   701  
068c3d3c83be47 Melody Olvera       2024-12-04   702  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   703  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   704  
068c3d3c83be47 Melody Olvera       2024-12-04   705  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   706  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   707  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   708  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   709  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   710  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   711  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   712  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   713  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   714  
068c3d3c83be47 Melody Olvera       2024-12-04   715  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   716  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   717  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   718  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   719  
068c3d3c83be47 Melody Olvera       2024-12-04   720  				pinctrl-0 = <&qup_i2c8_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   721  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   722  
068c3d3c83be47 Melody Olvera       2024-12-04   723  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   724  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   725  
068c3d3c83be47 Melody Olvera       2024-12-04   726  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   727  			};
068c3d3c83be47 Melody Olvera       2024-12-04   728  
068c3d3c83be47 Melody Olvera       2024-12-04   729  			spi8: spi@880000 {
068c3d3c83be47 Melody Olvera       2024-12-04   730  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   731  				reg = <0x0 0x00880000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   732  
068c3d3c83be47 Melody Olvera       2024-12-04   733  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   734  
068c3d3c83be47 Melody Olvera       2024-12-04   735  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   736  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   737  
068c3d3c83be47 Melody Olvera       2024-12-04   738  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   739  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   740  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   741  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   742  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   743  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   744  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   745  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   746  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   747  
068c3d3c83be47 Melody Olvera       2024-12-04   748  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   749  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   750  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   751  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   752  
068c3d3c83be47 Melody Olvera       2024-12-04   753  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   754  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   755  
068c3d3c83be47 Melody Olvera       2024-12-04   756  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   757  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   758  
068c3d3c83be47 Melody Olvera       2024-12-04   759  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   760  			};
068c3d3c83be47 Melody Olvera       2024-12-04   761  
068c3d3c83be47 Melody Olvera       2024-12-04   762  			i2c9: i2c@884000 {
068c3d3c83be47 Melody Olvera       2024-12-04   763  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   764  				reg = <0x0 0x00884000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   765  
068c3d3c83be47 Melody Olvera       2024-12-04   766  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   767  
068c3d3c83be47 Melody Olvera       2024-12-04   768  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   769  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   770  
068c3d3c83be47 Melody Olvera       2024-12-04   771  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   772  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   773  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   774  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   775  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   776  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   777  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   778  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   779  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   780  
068c3d3c83be47 Melody Olvera       2024-12-04   781  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   782  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   783  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   784  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   785  
068c3d3c83be47 Melody Olvera       2024-12-04   786  				pinctrl-0 = <&qup_i2c9_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   787  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   788  
068c3d3c83be47 Melody Olvera       2024-12-04   789  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   790  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   791  
068c3d3c83be47 Melody Olvera       2024-12-04   792  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   793  			};
068c3d3c83be47 Melody Olvera       2024-12-04   794  
068c3d3c83be47 Melody Olvera       2024-12-04   795  			spi9: spi@884000 {
068c3d3c83be47 Melody Olvera       2024-12-04   796  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   797  				reg = <0x0 0x00884000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   798  
068c3d3c83be47 Melody Olvera       2024-12-04   799  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   800  
068c3d3c83be47 Melody Olvera       2024-12-04   801  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   802  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   803  
068c3d3c83be47 Melody Olvera       2024-12-04   804  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   805  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   806  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   807  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   808  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   809  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   810  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   811  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   812  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   813  
068c3d3c83be47 Melody Olvera       2024-12-04   814  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   815  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   816  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   817  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   818  
068c3d3c83be47 Melody Olvera       2024-12-04   819  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   820  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   821  
068c3d3c83be47 Melody Olvera       2024-12-04   822  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   823  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   824  
068c3d3c83be47 Melody Olvera       2024-12-04   825  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   826  			};
068c3d3c83be47 Melody Olvera       2024-12-04   827  
068c3d3c83be47 Melody Olvera       2024-12-04   828  			i2c10: i2c@888000 {
068c3d3c83be47 Melody Olvera       2024-12-04   829  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   830  				reg = <0x0 0x00888000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   831  
068c3d3c83be47 Melody Olvera       2024-12-04   832  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   833  
068c3d3c83be47 Melody Olvera       2024-12-04   834  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   835  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   836  
068c3d3c83be47 Melody Olvera       2024-12-04   837  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   838  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   839  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   840  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   841  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   842  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   843  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   844  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   845  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   846  
068c3d3c83be47 Melody Olvera       2024-12-04   847  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   848  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   849  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   850  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   851  
068c3d3c83be47 Melody Olvera       2024-12-04   852  				pinctrl-0 = <&qup_i2c10_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   853  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   854  
068c3d3c83be47 Melody Olvera       2024-12-04   855  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   856  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   857  
068c3d3c83be47 Melody Olvera       2024-12-04   858  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   859  			};
068c3d3c83be47 Melody Olvera       2024-12-04   860  
068c3d3c83be47 Melody Olvera       2024-12-04   861  			spi10: spi@888000 {
068c3d3c83be47 Melody Olvera       2024-12-04   862  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   863  				reg = <0x0 0x00888000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   864  
068c3d3c83be47 Melody Olvera       2024-12-04   865  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   866  
068c3d3c83be47 Melody Olvera       2024-12-04   867  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   868  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   869  
068c3d3c83be47 Melody Olvera       2024-12-04   870  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   871  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   872  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   873  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   874  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   875  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   876  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   877  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   878  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   879  
068c3d3c83be47 Melody Olvera       2024-12-04   880  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   881  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   882  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   883  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   884  
068c3d3c83be47 Melody Olvera       2024-12-04   885  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   886  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   887  
068c3d3c83be47 Melody Olvera       2024-12-04   888  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   889  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   890  
068c3d3c83be47 Melody Olvera       2024-12-04   891  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   892  			};
068c3d3c83be47 Melody Olvera       2024-12-04   893  
068c3d3c83be47 Melody Olvera       2024-12-04   894  			i2c11: i2c@88c000 {
068c3d3c83be47 Melody Olvera       2024-12-04   895  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   896  				reg = <0x0 0x0088c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   897  
068c3d3c83be47 Melody Olvera       2024-12-04   898  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   899  
068c3d3c83be47 Melody Olvera       2024-12-04   900  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   901  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   902  
068c3d3c83be47 Melody Olvera       2024-12-04   903  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   904  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   905  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   906  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   907  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   908  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   909  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   910  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   911  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   912  
068c3d3c83be47 Melody Olvera       2024-12-04   913  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   914  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   915  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   916  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   917  
068c3d3c83be47 Melody Olvera       2024-12-04   918  				pinctrl-0 = <&qup_i2c11_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   919  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   920  
068c3d3c83be47 Melody Olvera       2024-12-04   921  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   922  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   923  
068c3d3c83be47 Melody Olvera       2024-12-04   924  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   925  			};
068c3d3c83be47 Melody Olvera       2024-12-04   926  
068c3d3c83be47 Melody Olvera       2024-12-04   927  			spi11: spi@88c000 {
068c3d3c83be47 Melody Olvera       2024-12-04   928  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   929  				reg = <0x0 0x0088c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   930  
068c3d3c83be47 Melody Olvera       2024-12-04   931  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   932  
068c3d3c83be47 Melody Olvera       2024-12-04   933  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   934  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   935  
068c3d3c83be47 Melody Olvera       2024-12-04   936  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   937  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   938  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   939  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   940  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   941  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   942  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   943  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   944  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   945  
068c3d3c83be47 Melody Olvera       2024-12-04   946  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04   947  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04   948  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   949  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   950  
068c3d3c83be47 Melody Olvera       2024-12-04   951  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04   952  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   953  
068c3d3c83be47 Melody Olvera       2024-12-04   954  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   955  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   956  
068c3d3c83be47 Melody Olvera       2024-12-04   957  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   958  			};
068c3d3c83be47 Melody Olvera       2024-12-04   959  
068c3d3c83be47 Melody Olvera       2024-12-04   960  			i2c12: i2c@890000 {
068c3d3c83be47 Melody Olvera       2024-12-04   961  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04   962  				reg = <0x0 0x00890000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   963  
068c3d3c83be47 Melody Olvera       2024-12-04   964  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   965  
068c3d3c83be47 Melody Olvera       2024-12-04   966  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04   967  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04   968  
068c3d3c83be47 Melody Olvera       2024-12-04   969  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   970  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   971  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   972  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04   973  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04   974  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04   975  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04   976  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04   977  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04   978  
068c3d3c83be47 Melody Olvera       2024-12-04   979  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04   980  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04   981  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04   982  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04   983  
068c3d3c83be47 Melody Olvera       2024-12-04   984  				pinctrl-0 = <&qup_i2c12_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04   985  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04   986  
068c3d3c83be47 Melody Olvera       2024-12-04   987  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04   988  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04   989  
068c3d3c83be47 Melody Olvera       2024-12-04   990  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04   991  			};
068c3d3c83be47 Melody Olvera       2024-12-04   992  
068c3d3c83be47 Melody Olvera       2024-12-04   993  			spi12: spi@890000 {
068c3d3c83be47 Melody Olvera       2024-12-04   994  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04   995  				reg = <0x0 0x00890000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04   996  
068c3d3c83be47 Melody Olvera       2024-12-04   997  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04   998  
068c3d3c83be47 Melody Olvera       2024-12-04   999  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1000  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1001  
068c3d3c83be47 Melody Olvera       2024-12-04  1002  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1003  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1004  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1005  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1006  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1007  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1008  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1009  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1010  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1011  
068c3d3c83be47 Melody Olvera       2024-12-04  1012  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1013  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1014  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1015  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1016  
068c3d3c83be47 Melody Olvera       2024-12-04  1017  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1018  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1019  
068c3d3c83be47 Melody Olvera       2024-12-04  1020  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1021  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1022  
068c3d3c83be47 Melody Olvera       2024-12-04  1023  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1024  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1025  
068c3d3c83be47 Melody Olvera       2024-12-04  1026  			i2c13: i2c@894000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1027  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1028  				reg = <0x0 0x00894000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1029  
068c3d3c83be47 Melody Olvera       2024-12-04  1030  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1031  
068c3d3c83be47 Melody Olvera       2024-12-04  1032  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1033  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1034  
068c3d3c83be47 Melody Olvera       2024-12-04  1035  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1036  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1037  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1038  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1039  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1040  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1041  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1042  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1043  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1044  
068c3d3c83be47 Melody Olvera       2024-12-04  1045  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1046  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1047  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1048  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1049  
068c3d3c83be47 Melody Olvera       2024-12-04  1050  				pinctrl-0 = <&qup_i2c13_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1051  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1052  
068c3d3c83be47 Melody Olvera       2024-12-04  1053  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1054  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1055  
068c3d3c83be47 Melody Olvera       2024-12-04  1056  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1057  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1058  
068c3d3c83be47 Melody Olvera       2024-12-04  1059  			spi13: spi@894000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1060  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1061  				reg = <0x0 0x00894000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1062  
068c3d3c83be47 Melody Olvera       2024-12-04  1063  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1064  
068c3d3c83be47 Melody Olvera       2024-12-04  1065  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1066  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1067  
068c3d3c83be47 Melody Olvera       2024-12-04  1068  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1069  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1070  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1071  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1072  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1073  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1074  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1075  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1076  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1077  
068c3d3c83be47 Melody Olvera       2024-12-04  1078  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1079  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1080  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1081  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1082  
068c3d3c83be47 Melody Olvera       2024-12-04  1083  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1084  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1085  
068c3d3c83be47 Melody Olvera       2024-12-04  1086  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1087  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1088  
068c3d3c83be47 Melody Olvera       2024-12-04  1089  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1090  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1091  
068c3d3c83be47 Melody Olvera       2024-12-04  1092  			uart14: serial@898000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1093  				compatible = "qcom,geni-uart";
068c3d3c83be47 Melody Olvera       2024-12-04  1094  				reg = <0x0 0x00898000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1095  
068c3d3c83be47 Melody Olvera       2024-12-04  1096  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1097  
068c3d3c83be47 Melody Olvera       2024-12-04  1098  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1099  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1100  
068c3d3c83be47 Melody Olvera       2024-12-04  1101  				interconnects =	<&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1102  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1103  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1104  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1105  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1106  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1107  
068c3d3c83be47 Melody Olvera       2024-12-04  1108  				pinctrl-0 = <&qup_uart14_default>;
068c3d3c83be47 Melody Olvera       2024-12-04  1109  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1110  
068c3d3c83be47 Melody Olvera       2024-12-04  1111  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1112  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1113  
068c3d3c83be47 Melody Olvera       2024-12-04  1114  			i2c15: i2c@89c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1115  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1116  				reg = <0x0 0x0089c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1117  
068c3d3c83be47 Melody Olvera       2024-12-04  1118  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1119  
068c3d3c83be47 Melody Olvera       2024-12-04  1120  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1121  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1122  
068c3d3c83be47 Melody Olvera       2024-12-04  1123  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1124  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1125  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1126  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1127  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1128  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1129  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1130  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1131  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1132  
068c3d3c83be47 Melody Olvera       2024-12-04  1133  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1134  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1135  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1136  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1137  
068c3d3c83be47 Melody Olvera       2024-12-04  1138  				pinctrl-0 = <&qup_i2c15_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1139  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1140  
068c3d3c83be47 Melody Olvera       2024-12-04  1141  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1142  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1143  
068c3d3c83be47 Melody Olvera       2024-12-04  1144  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1145  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1146  
068c3d3c83be47 Melody Olvera       2024-12-04  1147  			spi15: spi@89c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1148  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1149  				reg = <0x0 0x0089c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1150  
068c3d3c83be47 Melody Olvera       2024-12-04  1151  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1152  
068c3d3c83be47 Melody Olvera       2024-12-04  1153  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1154  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1155  
068c3d3c83be47 Melody Olvera       2024-12-04  1156  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1157  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1158  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1159  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1160  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1161  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1162  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1163  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1164  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1165  
068c3d3c83be47 Melody Olvera       2024-12-04  1166  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1167  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1168  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1169  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1170  
068c3d3c83be47 Melody Olvera       2024-12-04  1171  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1172  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1173  
068c3d3c83be47 Melody Olvera       2024-12-04  1174  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1175  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1176  
068c3d3c83be47 Melody Olvera       2024-12-04  1177  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1178  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1179  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1180  
068c3d3c83be47 Melody Olvera       2024-12-04  1181  		i2c_master_hub_0: geniqup@9c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1182  			compatible = "qcom,geni-se-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1183  			reg = <0x0 0x009c0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1184  
068c3d3c83be47 Melody Olvera       2024-12-04  1185  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1186  			clock-names = "s-ahb";
068c3d3c83be47 Melody Olvera       2024-12-04  1187  
068c3d3c83be47 Melody Olvera       2024-12-04  1188  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1189  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1190  			ranges;
068c3d3c83be47 Melody Olvera       2024-12-04  1191  
068c3d3c83be47 Melody Olvera       2024-12-04  1192  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1193  
068c3d3c83be47 Melody Olvera       2024-12-04  1194  			i2c_hub_0: i2c@980000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1195  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1196  				reg = <0x0 0x00980000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1197  
068c3d3c83be47 Melody Olvera       2024-12-04  1198  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1199  
068c3d3c83be47 Melody Olvera       2024-12-04  1200  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1201  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1202  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1203  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1204  
068c3d3c83be47 Melody Olvera       2024-12-04  1205  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1206  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1207  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1208  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1209  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1210  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1211  
068c3d3c83be47 Melody Olvera       2024-12-04  1212  				pinctrl-0 = <&hub_i2c0_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1213  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1214  
068c3d3c83be47 Melody Olvera       2024-12-04  1215  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1216  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1217  
068c3d3c83be47 Melody Olvera       2024-12-04  1218  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1219  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1220  
068c3d3c83be47 Melody Olvera       2024-12-04  1221  			i2c_hub_1: i2c@984000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1222  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1223  				reg = <0x0 0x00984000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1224  
068c3d3c83be47 Melody Olvera       2024-12-04  1225  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1226  
068c3d3c83be47 Melody Olvera       2024-12-04  1227  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1228  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1229  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1230  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1231  
068c3d3c83be47 Melody Olvera       2024-12-04  1232  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1233  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1234  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1235  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1236  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1237  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1238  
068c3d3c83be47 Melody Olvera       2024-12-04  1239  				pinctrl-0 = <&hub_i2c1_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1240  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1241  
068c3d3c83be47 Melody Olvera       2024-12-04  1242  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1243  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1244  
068c3d3c83be47 Melody Olvera       2024-12-04  1245  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1246  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1247  
068c3d3c83be47 Melody Olvera       2024-12-04  1248  			i2c_hub_2: i2c@988000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1249  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1250  				reg = <0x0 0x00988000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1251  
068c3d3c83be47 Melody Olvera       2024-12-04  1252  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1253  
068c3d3c83be47 Melody Olvera       2024-12-04  1254  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1255  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1256  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1257  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1258  
068c3d3c83be47 Melody Olvera       2024-12-04  1259  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1260  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1261  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1262  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1263  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1264  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1265  
068c3d3c83be47 Melody Olvera       2024-12-04  1266  				pinctrl-0 = <&hub_i2c2_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1267  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1268  
068c3d3c83be47 Melody Olvera       2024-12-04  1269  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1270  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1271  
068c3d3c83be47 Melody Olvera       2024-12-04  1272  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1273  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1274  
068c3d3c83be47 Melody Olvera       2024-12-04  1275  			i2c_hub_3: i2c@98c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1276  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1277  				reg = <0x0 0x0098c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1278  
068c3d3c83be47 Melody Olvera       2024-12-04  1279  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1280  
068c3d3c83be47 Melody Olvera       2024-12-04  1281  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1282  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1283  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1284  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1285  
068c3d3c83be47 Melody Olvera       2024-12-04  1286  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1287  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1288  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1289  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1290  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1291  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1292  
068c3d3c83be47 Melody Olvera       2024-12-04  1293  				pinctrl-0 = <&hub_i2c3_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1294  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1295  
068c3d3c83be47 Melody Olvera       2024-12-04  1296  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1297  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1298  
068c3d3c83be47 Melody Olvera       2024-12-04  1299  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1300  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1301  
068c3d3c83be47 Melody Olvera       2024-12-04  1302  			i2c_hub_4: i2c@990000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1303  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1304  				reg = <0x0 0x00990000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1305  
068c3d3c83be47 Melody Olvera       2024-12-04  1306  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1307  
068c3d3c83be47 Melody Olvera       2024-12-04  1308  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1309  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1310  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1311  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1312  
068c3d3c83be47 Melody Olvera       2024-12-04  1313  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1314  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1315  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1316  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1317  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1318  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1319  
068c3d3c83be47 Melody Olvera       2024-12-04  1320  				pinctrl-0 = <&hub_i2c4_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1321  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1322  
068c3d3c83be47 Melody Olvera       2024-12-04  1323  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1324  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1325  
068c3d3c83be47 Melody Olvera       2024-12-04  1326  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1327  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1328  
068c3d3c83be47 Melody Olvera       2024-12-04  1329  			i2c_hub_5: i2c@994000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1330  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1331  				reg = <0x0 0x00994000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1332  
068c3d3c83be47 Melody Olvera       2024-12-04  1333  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1334  
068c3d3c83be47 Melody Olvera       2024-12-04  1335  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1336  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1337  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1338  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1339  
068c3d3c83be47 Melody Olvera       2024-12-04  1340  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1341  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1342  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1343  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1344  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1345  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1346  
068c3d3c83be47 Melody Olvera       2024-12-04  1347  				pinctrl-0 = <&hub_i2c5_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1348  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1349  
068c3d3c83be47 Melody Olvera       2024-12-04  1350  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1351  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1352  
068c3d3c83be47 Melody Olvera       2024-12-04  1353  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1354  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1355  
068c3d3c83be47 Melody Olvera       2024-12-04  1356  			i2c_hub_6: i2c@998000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1357  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1358  				reg = <0x0 0x00998000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1359  
068c3d3c83be47 Melody Olvera       2024-12-04  1360  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1361  
068c3d3c83be47 Melody Olvera       2024-12-04  1362  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1363  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1364  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1365  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1366  
068c3d3c83be47 Melody Olvera       2024-12-04  1367  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1368  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1369  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1370  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1371  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1372  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1373  
068c3d3c83be47 Melody Olvera       2024-12-04  1374  				pinctrl-0 = <&hub_i2c6_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1375  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1376  
068c3d3c83be47 Melody Olvera       2024-12-04  1377  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1378  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1379  
068c3d3c83be47 Melody Olvera       2024-12-04  1380  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1381  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1382  
068c3d3c83be47 Melody Olvera       2024-12-04  1383  			i2c_hub_7: i2c@99c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1384  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1385  				reg = <0x0 0x0099c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1386  
068c3d3c83be47 Melody Olvera       2024-12-04  1387  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1388  
068c3d3c83be47 Melody Olvera       2024-12-04  1389  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1390  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1391  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1392  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1393  
068c3d3c83be47 Melody Olvera       2024-12-04  1394  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1395  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1396  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1397  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1398  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1399  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1400  
068c3d3c83be47 Melody Olvera       2024-12-04  1401  				pinctrl-0 = <&hub_i2c7_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1402  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1403  
068c3d3c83be47 Melody Olvera       2024-12-04  1404  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1405  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1406  
068c3d3c83be47 Melody Olvera       2024-12-04  1407  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1408  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1409  
068c3d3c83be47 Melody Olvera       2024-12-04  1410  			i2c_hub_8: i2c@9a0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1411  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1412  				reg = <0x0 0x009a0000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1413  
068c3d3c83be47 Melody Olvera       2024-12-04  1414  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1415  
068c3d3c83be47 Melody Olvera       2024-12-04  1416  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1417  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1418  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1419  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1420  
068c3d3c83be47 Melody Olvera       2024-12-04  1421  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1422  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1423  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1424  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1425  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1426  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1427  
068c3d3c83be47 Melody Olvera       2024-12-04  1428  				pinctrl-0 = <&hub_i2c8_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1429  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1430  
068c3d3c83be47 Melody Olvera       2024-12-04  1431  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1432  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1433  
068c3d3c83be47 Melody Olvera       2024-12-04  1434  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1435  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1436  
068c3d3c83be47 Melody Olvera       2024-12-04  1437  			i2c_hub_9: i2c@9a4000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1438  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera       2024-12-04  1439  				reg = <0x0 0x009a4000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1440  
068c3d3c83be47 Melody Olvera       2024-12-04  1441  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1442  
068c3d3c83be47 Melody Olvera       2024-12-04  1443  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1444  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1445  				clock-names = "se",
068c3d3c83be47 Melody Olvera       2024-12-04  1446  					      "core";
068c3d3c83be47 Melody Olvera       2024-12-04  1447  
068c3d3c83be47 Melody Olvera       2024-12-04  1448  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1449  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1450  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1451  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1452  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1453  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1454  
068c3d3c83be47 Melody Olvera       2024-12-04  1455  				pinctrl-0 = <&hub_i2c9_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1456  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1457  
068c3d3c83be47 Melody Olvera       2024-12-04  1458  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1459  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1460  
068c3d3c83be47 Melody Olvera       2024-12-04  1461  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1462  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1463  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1464  
068c3d3c83be47 Melody Olvera       2024-12-04  1465  		gpi_dma1: dma-controller@a00000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1466  			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
068c3d3c83be47 Melody Olvera       2024-12-04  1467  			reg = <0x0 0x00a00000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1468  
068c3d3c83be47 Melody Olvera       2024-12-04  1469  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1470  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1471  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1472  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1473  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1474  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1475  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1476  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1477  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1478  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1479  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera       2024-12-04  1480  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1481  
068c3d3c83be47 Melody Olvera       2024-12-04  1482  			dma-channels = <12>;
068c3d3c83be47 Melody Olvera       2024-12-04  1483  			dma-channel-mask = <0x1e>;
068c3d3c83be47 Melody Olvera       2024-12-04  1484  			#dma-cells = <3>;
068c3d3c83be47 Melody Olvera       2024-12-04  1485  
068c3d3c83be47 Melody Olvera       2024-12-04  1486  			iommus = <&apps_smmu 0xb6 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1487  
068c3d3c83be47 Melody Olvera       2024-12-04  1488  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1489  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1490  
068c3d3c83be47 Melody Olvera       2024-12-04  1491  		qupv3_1: geniqup@ac0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1492  			compatible = "qcom,geni-se-qup";
068c3d3c83be47 Melody Olvera       2024-12-04  1493  			reg = <0x0 0x00ac0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1494  
068c3d3c83be47 Melody Olvera       2024-12-04  1495  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  1496  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1497  			clock-names = "m-ahb",
068c3d3c83be47 Melody Olvera       2024-12-04  1498  				      "s-ahb";
068c3d3c83be47 Melody Olvera       2024-12-04  1499  
068c3d3c83be47 Melody Olvera       2024-12-04  1500  			iommus = <&apps_smmu 0xa3 0x0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1501  
068c3d3c83be47 Melody Olvera       2024-12-04  1502  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1503  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1504  			ranges;
068c3d3c83be47 Melody Olvera       2024-12-04  1505  
068c3d3c83be47 Melody Olvera       2024-12-04  1506  			status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1507  
068c3d3c83be47 Melody Olvera       2024-12-04  1508  			i2c0: i2c@a80000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1509  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1510  				reg = <0x0 0x00a80000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1511  
068c3d3c83be47 Melody Olvera       2024-12-04  1512  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1513  
068c3d3c83be47 Melody Olvera       2024-12-04  1514  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1515  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1516  
068c3d3c83be47 Melody Olvera       2024-12-04  1517  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1518  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1519  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1520  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1521  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1522  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1523  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1524  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1525  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1526  
068c3d3c83be47 Melody Olvera       2024-12-04  1527  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1528  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1529  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1530  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1531  
068c3d3c83be47 Melody Olvera       2024-12-04  1532  				pinctrl-0 = <&qup_i2c0_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1533  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1534  
068c3d3c83be47 Melody Olvera       2024-12-04  1535  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1536  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1537  
068c3d3c83be47 Melody Olvera       2024-12-04  1538  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1539  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1540  
068c3d3c83be47 Melody Olvera       2024-12-04  1541  			spi0: spi@a80000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1542  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1543  				reg = <0x0 0x00a80000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1544  
068c3d3c83be47 Melody Olvera       2024-12-04  1545  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1546  
068c3d3c83be47 Melody Olvera       2024-12-04  1547  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1548  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1549  
068c3d3c83be47 Melody Olvera       2024-12-04  1550  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1551  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1552  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1553  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1554  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1555  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1556  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1557  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1558  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1559  
068c3d3c83be47 Melody Olvera       2024-12-04  1560  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1561  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1562  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1563  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1564  
068c3d3c83be47 Melody Olvera       2024-12-04  1565  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1566  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1567  
068c3d3c83be47 Melody Olvera       2024-12-04  1568  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1569  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1570  
068c3d3c83be47 Melody Olvera       2024-12-04  1571  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1572  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1573  
068c3d3c83be47 Melody Olvera       2024-12-04  1574  			i2c1: i2c@a84000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1575  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1576  				reg = <0x0 0x00a84000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1577  
068c3d3c83be47 Melody Olvera       2024-12-04  1578  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1579  
068c3d3c83be47 Melody Olvera       2024-12-04  1580  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1581  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1582  
068c3d3c83be47 Melody Olvera       2024-12-04  1583  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1584  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1585  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1586  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1587  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1588  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1589  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1590  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1591  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1592  
068c3d3c83be47 Melody Olvera       2024-12-04  1593  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1594  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1595  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1596  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1597  
068c3d3c83be47 Melody Olvera       2024-12-04  1598  				pinctrl-0 = <&qup_i2c1_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1599  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1600  
068c3d3c83be47 Melody Olvera       2024-12-04  1601  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1602  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1603  
068c3d3c83be47 Melody Olvera       2024-12-04  1604  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1605  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1606  
068c3d3c83be47 Melody Olvera       2024-12-04  1607  			spi1: spi@a84000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1608  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1609  				reg = <0x0 0x00a84000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1610  
068c3d3c83be47 Melody Olvera       2024-12-04  1611  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1612  
068c3d3c83be47 Melody Olvera       2024-12-04  1613  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1614  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1615  
068c3d3c83be47 Melody Olvera       2024-12-04  1616  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1617  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1618  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1619  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1620  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1621  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1622  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1623  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1624  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1625  
068c3d3c83be47 Melody Olvera       2024-12-04  1626  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1627  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1628  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1629  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1630  
068c3d3c83be47 Melody Olvera       2024-12-04  1631  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1632  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1633  
068c3d3c83be47 Melody Olvera       2024-12-04  1634  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1635  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1636  
068c3d3c83be47 Melody Olvera       2024-12-04  1637  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1638  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1639  
068c3d3c83be47 Melody Olvera       2024-12-04  1640  			i2c2: i2c@a88000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1641  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1642  				reg = <0x0 0x00a88000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1643  
068c3d3c83be47 Melody Olvera       2024-12-04  1644  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1645  
068c3d3c83be47 Melody Olvera       2024-12-04  1646  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1647  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1648  
068c3d3c83be47 Melody Olvera       2024-12-04  1649  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1650  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1651  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1652  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1653  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1654  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1655  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1656  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1657  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1658  
068c3d3c83be47 Melody Olvera       2024-12-04  1659  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1660  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1661  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1662  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1663  
068c3d3c83be47 Melody Olvera       2024-12-04  1664  				pinctrl-0 = <&qup_i2c2_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1665  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1666  
068c3d3c83be47 Melody Olvera       2024-12-04  1667  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1668  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1669  
068c3d3c83be47 Melody Olvera       2024-12-04  1670  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1671  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1672  
068c3d3c83be47 Melody Olvera       2024-12-04  1673  			spi2: spi@a88000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1674  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1675  				reg = <0x0 0x00a88000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1676  
068c3d3c83be47 Melody Olvera       2024-12-04  1677  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1678  
068c3d3c83be47 Melody Olvera       2024-12-04  1679  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1680  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1681  
068c3d3c83be47 Melody Olvera       2024-12-04  1682  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1683  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1684  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1685  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1686  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1687  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1688  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1689  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1690  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1691  
068c3d3c83be47 Melody Olvera       2024-12-04  1692  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1693  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1694  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1695  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1696  
068c3d3c83be47 Melody Olvera       2024-12-04  1697  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1698  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1699  
068c3d3c83be47 Melody Olvera       2024-12-04  1700  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1701  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1702  
068c3d3c83be47 Melody Olvera       2024-12-04  1703  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1704  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1705  
068c3d3c83be47 Melody Olvera       2024-12-04  1706  			i2c3: i2c@a8c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1707  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1708  				reg = <0x0 0x00a8c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1709  
068c3d3c83be47 Melody Olvera       2024-12-04  1710  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1711  
068c3d3c83be47 Melody Olvera       2024-12-04  1712  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1713  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1714  
068c3d3c83be47 Melody Olvera       2024-12-04  1715  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1716  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1717  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1718  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1719  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1720  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1721  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1722  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1723  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1724  
068c3d3c83be47 Melody Olvera       2024-12-04  1725  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1726  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1727  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1728  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1729  
068c3d3c83be47 Melody Olvera       2024-12-04  1730  				pinctrl-0 = <&qup_i2c3_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1731  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1732  
068c3d3c83be47 Melody Olvera       2024-12-04  1733  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1734  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1735  
068c3d3c83be47 Melody Olvera       2024-12-04  1736  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1737  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1738  
068c3d3c83be47 Melody Olvera       2024-12-04  1739  			spi3: spi@a8c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1740  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1741  				reg = <0x0 0x00a8c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1742  
068c3d3c83be47 Melody Olvera       2024-12-04  1743  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1744  
068c3d3c83be47 Melody Olvera       2024-12-04  1745  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1746  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1747  
068c3d3c83be47 Melody Olvera       2024-12-04  1748  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1749  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1750  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1751  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1752  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1753  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1754  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1755  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1756  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1757  
068c3d3c83be47 Melody Olvera       2024-12-04  1758  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1759  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1760  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1761  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1762  
068c3d3c83be47 Melody Olvera       2024-12-04  1763  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1764  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1765  
068c3d3c83be47 Melody Olvera       2024-12-04  1766  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1767  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1768  
068c3d3c83be47 Melody Olvera       2024-12-04  1769  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1770  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1771  
068c3d3c83be47 Melody Olvera       2024-12-04  1772  			i2c4: i2c@a90000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1773  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1774  				reg = <0x0 0x00a90000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1775  
068c3d3c83be47 Melody Olvera       2024-12-04  1776  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1777  
068c3d3c83be47 Melody Olvera       2024-12-04  1778  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1779  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1780  
068c3d3c83be47 Melody Olvera       2024-12-04  1781  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1782  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1783  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1784  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1785  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1786  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1787  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1788  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1789  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1790  
068c3d3c83be47 Melody Olvera       2024-12-04  1791  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1792  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1793  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1794  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1795  
068c3d3c83be47 Melody Olvera       2024-12-04  1796  				pinctrl-0 = <&qup_i2c4_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1797  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1798  
068c3d3c83be47 Melody Olvera       2024-12-04  1799  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1800  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1801  
068c3d3c83be47 Melody Olvera       2024-12-04  1802  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1803  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1804  
068c3d3c83be47 Melody Olvera       2024-12-04  1805  			spi4: spi@a90000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1806  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1807  				reg = <0x0 0x00a90000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1808  
068c3d3c83be47 Melody Olvera       2024-12-04  1809  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1810  
068c3d3c83be47 Melody Olvera       2024-12-04  1811  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1812  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1813  
068c3d3c83be47 Melody Olvera       2024-12-04  1814  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1815  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1816  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1817  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1818  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1819  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1820  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1821  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1822  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1823  
068c3d3c83be47 Melody Olvera       2024-12-04  1824  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1825  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1826  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1827  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1828  
068c3d3c83be47 Melody Olvera       2024-12-04  1829  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1830  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1831  
068c3d3c83be47 Melody Olvera       2024-12-04  1832  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1833  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1834  
068c3d3c83be47 Melody Olvera       2024-12-04  1835  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1836  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1837  
068c3d3c83be47 Melody Olvera       2024-12-04  1838  			i2c5: i2c@a94000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1839  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1840  				reg = <0x0 0x00a94000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1841  
068c3d3c83be47 Melody Olvera       2024-12-04  1842  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1843  
068c3d3c83be47 Melody Olvera       2024-12-04  1844  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1845  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1846  
068c3d3c83be47 Melody Olvera       2024-12-04  1847  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1848  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1849  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1850  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1851  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1852  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1853  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1854  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1855  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1856  
068c3d3c83be47 Melody Olvera       2024-12-04  1857  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1858  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1859  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1860  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1861  
068c3d3c83be47 Melody Olvera       2024-12-04  1862  				pinctrl-0 = <&qup_i2c5_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1863  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1864  
068c3d3c83be47 Melody Olvera       2024-12-04  1865  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1866  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1867  
068c3d3c83be47 Melody Olvera       2024-12-04  1868  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1869  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1870  
068c3d3c83be47 Melody Olvera       2024-12-04  1871  			spi5: spi@a94000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1872  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1873  				reg = <0x0 0x00a94000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1874  
068c3d3c83be47 Melody Olvera       2024-12-04  1875  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1876  
068c3d3c83be47 Melody Olvera       2024-12-04  1877  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1878  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1879  
068c3d3c83be47 Melody Olvera       2024-12-04  1880  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1881  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1882  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1883  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1884  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1885  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1886  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1887  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1888  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1889  
068c3d3c83be47 Melody Olvera       2024-12-04  1890  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1891  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1892  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1893  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1894  
068c3d3c83be47 Melody Olvera       2024-12-04  1895  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1896  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1897  
068c3d3c83be47 Melody Olvera       2024-12-04  1898  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1899  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1900  
068c3d3c83be47 Melody Olvera       2024-12-04  1901  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1902  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1903  
068c3d3c83be47 Melody Olvera       2024-12-04  1904  			i2c6: i2c@a98000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1905  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera       2024-12-04  1906  				reg = <0x0 0x00a98000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1907  
068c3d3c83be47 Melody Olvera       2024-12-04  1908  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1909  
068c3d3c83be47 Melody Olvera       2024-12-04  1910  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1911  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1912  
068c3d3c83be47 Melody Olvera       2024-12-04  1913  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1914  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1915  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1916  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1917  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1918  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1919  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1920  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1921  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1922  
068c3d3c83be47 Melody Olvera       2024-12-04  1923  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera       2024-12-04  1924  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera       2024-12-04  1925  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1926  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1927  
068c3d3c83be47 Melody Olvera       2024-12-04  1928  				pinctrl-0 = <&qup_i2c6_data_clk>;
068c3d3c83be47 Melody Olvera       2024-12-04  1929  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1930  
068c3d3c83be47 Melody Olvera       2024-12-04  1931  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1932  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1933  
068c3d3c83be47 Melody Olvera       2024-12-04  1934  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1935  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1936  
068c3d3c83be47 Melody Olvera       2024-12-04  1937  			spi6: spi@a98000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1938  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera       2024-12-04  1939  				reg = <0x0 0x00a98000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1940  
068c3d3c83be47 Melody Olvera       2024-12-04  1941  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1942  
068c3d3c83be47 Melody Olvera       2024-12-04  1943  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1944  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1945  
068c3d3c83be47 Melody Olvera       2024-12-04  1946  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1947  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1948  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1949  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1950  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1951  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1952  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1953  						     "qup-config",
068c3d3c83be47 Melody Olvera       2024-12-04  1954  						     "qup-memory";
068c3d3c83be47 Melody Olvera       2024-12-04  1955  
068c3d3c83be47 Melody Olvera       2024-12-04  1956  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera       2024-12-04  1957  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera       2024-12-04  1958  				dma-names = "tx",
068c3d3c83be47 Melody Olvera       2024-12-04  1959  					    "rx";
068c3d3c83be47 Melody Olvera       2024-12-04  1960  
068c3d3c83be47 Melody Olvera       2024-12-04  1961  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
068c3d3c83be47 Melody Olvera       2024-12-04  1962  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1963  
068c3d3c83be47 Melody Olvera       2024-12-04  1964  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  1965  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera       2024-12-04  1966  
068c3d3c83be47 Melody Olvera       2024-12-04  1967  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1968  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1969  
068c3d3c83be47 Melody Olvera       2024-12-04  1970  			uart7: serial@a9c000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1971  				compatible = "qcom,geni-debug-uart";
068c3d3c83be47 Melody Olvera       2024-12-04  1972  				reg = <0x0 0x00a9c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera       2024-12-04  1973  
068c3d3c83be47 Melody Olvera       2024-12-04  1974  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera       2024-12-04  1975  
068c3d3c83be47 Melody Olvera       2024-12-04  1976  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  1977  				clock-names = "se";
068c3d3c83be47 Melody Olvera       2024-12-04  1978  
068c3d3c83be47 Melody Olvera       2024-12-04  1979  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1980  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera       2024-12-04  1981  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera       2024-12-04  1982  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera       2024-12-04  1983  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera       2024-12-04  1984  						     "qup-config";
068c3d3c83be47 Melody Olvera       2024-12-04  1985  
068c3d3c83be47 Melody Olvera       2024-12-04  1986  
068c3d3c83be47 Melody Olvera       2024-12-04  1987  				pinctrl-0 = <&qup_uart7_default>;
068c3d3c83be47 Melody Olvera       2024-12-04  1988  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera       2024-12-04  1989  
068c3d3c83be47 Melody Olvera       2024-12-04  1990  				status = "disabled";
068c3d3c83be47 Melody Olvera       2024-12-04  1991  			};
068c3d3c83be47 Melody Olvera       2024-12-04  1992  		};
068c3d3c83be47 Melody Olvera       2024-12-04  1993  
068c3d3c83be47 Melody Olvera       2024-12-04  1994  		cnoc_main: interconnect@1500000 {
068c3d3c83be47 Melody Olvera       2024-12-04  1995  			compatible = "qcom,sm8750-cnoc-main";
068c3d3c83be47 Melody Olvera       2024-12-04  1996  			reg = <0x0 0x01500000 0x0 0x16080>;
068c3d3c83be47 Melody Olvera       2024-12-04  1997  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  1998  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  1999  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2000  
068c3d3c83be47 Melody Olvera       2024-12-04  2001  		config_noc: interconnect@1600000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2002  			compatible = "qcom,sm8750-config-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2003  			reg = <0x0 0x01600000 0x0 0x6200>;
068c3d3c83be47 Melody Olvera       2024-12-04  2004  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2005  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2006  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2007  
068c3d3c83be47 Melody Olvera       2024-12-04  2008  		system_noc: interconnect@1680000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2009  			compatible = "qcom,sm8750-system-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2010  			reg = <0x0 0x01680000 0x0 0x1d080>;
068c3d3c83be47 Melody Olvera       2024-12-04  2011  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2012  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2013  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2014  
068c3d3c83be47 Melody Olvera       2024-12-04  2015  		pcie_noc: interconnect@16c0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2016  			compatible = "qcom,sm8750-pcie-anoc";
068c3d3c83be47 Melody Olvera       2024-12-04  2017  			reg = <0x0 0x016c0000 0x0 0x11400>;
068c3d3c83be47 Melody Olvera       2024-12-04  2018  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2019  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2020  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  2021  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  2022  
068c3d3c83be47 Melody Olvera       2024-12-04  2023  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2024  
068c3d3c83be47 Melody Olvera       2024-12-04  2025  		aggre1_noc: interconnect@16e0000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2026  			compatible = "qcom,sm8750-aggre1-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2027  			reg = <0x0 0x016e0000 0x0 0x16400>;
068c3d3c83be47 Melody Olvera       2024-12-04  2028  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2029  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2030  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
068c3d3c83be47 Melody Olvera       2024-12-04  2031  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  2032  
068c3d3c83be47 Melody Olvera       2024-12-04  2033  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2034  
068c3d3c83be47 Melody Olvera       2024-12-04  2035  		aggre2_noc: interconnect@1700000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2036  			compatible = "qcom,sm8750-aggre2-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2037  			reg = <0x0 0x01700000 0x0 0x1f400>;
068c3d3c83be47 Melody Olvera       2024-12-04  2038  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2039  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2040  			clocks = <&rpmhcc RPMH_IPA_CLK>;
068c3d3c83be47 Melody Olvera       2024-12-04  2041  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2042  
068c3d3c83be47 Melody Olvera       2024-12-04  2043  		mmss_noc: interconnect@1780000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2044  			compatible = "qcom,sm8750-mmss-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2045  			reg = <0x0 0x01780000 0x0 0x5b800>;
068c3d3c83be47 Melody Olvera       2024-12-04  2046  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2047  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2048  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2049  
c178d3588a3452 Nitin Rawat         2025-01-13  2050  		ufs_mem_phy: phy@1d80000 {
c178d3588a3452 Nitin Rawat         2025-01-13  2051  			compatible = "qcom,sm8750-qmp-ufs-phy";
c178d3588a3452 Nitin Rawat         2025-01-13  2052  			reg = <0x0 0x01d80000 0x0 0x2000>;
c178d3588a3452 Nitin Rawat         2025-01-13  2053  
c178d3588a3452 Nitin Rawat         2025-01-13  2054  			clocks = <&rpmhcc RPMH_CXO_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2055  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2056  				 <&tcsrcc TCSR_UFS_CLKREF_EN>;
c178d3588a3452 Nitin Rawat         2025-01-13  2057  			clock-names =	"ref",
c178d3588a3452 Nitin Rawat         2025-01-13  2058  					"ref_aux",
c178d3588a3452 Nitin Rawat         2025-01-13  2059  					"qref";
c178d3588a3452 Nitin Rawat         2025-01-13  2060  
c178d3588a3452 Nitin Rawat         2025-01-13  2061  			resets = <&ufs_mem_hc 0>;
c178d3588a3452 Nitin Rawat         2025-01-13  2062  			reset-names = "ufsphy";
c178d3588a3452 Nitin Rawat         2025-01-13  2063  
c178d3588a3452 Nitin Rawat         2025-01-13  2064  			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
c178d3588a3452 Nitin Rawat         2025-01-13  2065  
c178d3588a3452 Nitin Rawat         2025-01-13  2066  			#clock-cells = <1>;
c178d3588a3452 Nitin Rawat         2025-01-13  2067  			#phy-cells = <0>;
c178d3588a3452 Nitin Rawat         2025-01-13  2068  
c178d3588a3452 Nitin Rawat         2025-01-13  2069  			status = "disabled";
c178d3588a3452 Nitin Rawat         2025-01-13  2070  		};
c178d3588a3452 Nitin Rawat         2025-01-13  2071  
c178d3588a3452 Nitin Rawat         2025-01-13  2072  		ufs_mem_hc: ufs@1d84000 {
c178d3588a3452 Nitin Rawat         2025-01-13  2073  			compatible = "qcom,sm8750-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
c178d3588a3452 Nitin Rawat         2025-01-13  2074  			reg = <0x0 0x01d84000 0x0 0x3000>;
c178d3588a3452 Nitin Rawat         2025-01-13  2075  
c178d3588a3452 Nitin Rawat         2025-01-13  2076  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
c178d3588a3452 Nitin Rawat         2025-01-13  2077  
c178d3588a3452 Nitin Rawat         2025-01-13  2078  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2079  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2080  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2081  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2082  				 <&rpmhcc RPMH_LN_BB_CLK3>,
c178d3588a3452 Nitin Rawat         2025-01-13  2083  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2084  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
c178d3588a3452 Nitin Rawat         2025-01-13  2085  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
c178d3588a3452 Nitin Rawat         2025-01-13  2086  			clock-names = "core_clk",
c178d3588a3452 Nitin Rawat         2025-01-13  2087  				      "bus_aggr_clk",
c178d3588a3452 Nitin Rawat         2025-01-13  2088  				      "iface_clk",
c178d3588a3452 Nitin Rawat         2025-01-13  2089  				      "core_clk_unipro",
c178d3588a3452 Nitin Rawat         2025-01-13  2090  				      "ref_clk",
c178d3588a3452 Nitin Rawat         2025-01-13  2091  				      "tx_lane0_sync_clk",
c178d3588a3452 Nitin Rawat         2025-01-13  2092  				      "rx_lane0_sync_clk",
c178d3588a3452 Nitin Rawat         2025-01-13  2093  				      "rx_lane1_sync_clk";
c178d3588a3452 Nitin Rawat         2025-01-13  2094  			freq-table-hz = <100000000 403000000>,
c178d3588a3452 Nitin Rawat         2025-01-13  2095  					<0 0>,
c178d3588a3452 Nitin Rawat         2025-01-13  2096  					<0 0>,
c178d3588a3452 Nitin Rawat         2025-01-13  2097  					<100000000 403000000>,
c178d3588a3452 Nitin Rawat         2025-01-13  2098  					<100000000 403000000>,
c178d3588a3452 Nitin Rawat         2025-01-13  2099  					<0 0>,
c178d3588a3452 Nitin Rawat         2025-01-13  2100  					<0 0>,
c178d3588a3452 Nitin Rawat         2025-01-13  2101  					<0 0>;
c178d3588a3452 Nitin Rawat         2025-01-13  2102  
c178d3588a3452 Nitin Rawat         2025-01-13  2103  			resets = <&gcc GCC_UFS_PHY_BCR>;
c178d3588a3452 Nitin Rawat         2025-01-13  2104  			reset-names = "rst";
c178d3588a3452 Nitin Rawat         2025-01-13  2105  
c178d3588a3452 Nitin Rawat         2025-01-13  2106  
c178d3588a3452 Nitin Rawat         2025-01-13  2107  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
c178d3588a3452 Nitin Rawat         2025-01-13  2108  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
c178d3588a3452 Nitin Rawat         2025-01-13  2109  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
c178d3588a3452 Nitin Rawat         2025-01-13  2110  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
c178d3588a3452 Nitin Rawat         2025-01-13  2111  			interconnect-names = "ufs-ddr",
c178d3588a3452 Nitin Rawat         2025-01-13  2112  					     "cpu-ufs";
c178d3588a3452 Nitin Rawat         2025-01-13  2113  
c178d3588a3452 Nitin Rawat         2025-01-13  2114  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
c178d3588a3452 Nitin Rawat         2025-01-13  2115  			required-opps = <&rpmhpd_opp_nom>;
c178d3588a3452 Nitin Rawat         2025-01-13  2116  
c178d3588a3452 Nitin Rawat         2025-01-13  2117  			iommus = <&apps_smmu 0x60 0>;
c178d3588a3452 Nitin Rawat         2025-01-13  2118  			dma-coherent;
c178d3588a3452 Nitin Rawat         2025-01-13  2119  
c178d3588a3452 Nitin Rawat         2025-01-13  2120  			lanes-per-direction = <2>;
c178d3588a3452 Nitin Rawat         2025-01-13  2121  
c178d3588a3452 Nitin Rawat         2025-01-13  2122  			phys = <&ufs_mem_phy>;
c178d3588a3452 Nitin Rawat         2025-01-13  2123  			phy-names = "ufsphy";
c178d3588a3452 Nitin Rawat         2025-01-13  2124  
c178d3588a3452 Nitin Rawat         2025-01-13  2125  			#reset-cells = <1>;
c178d3588a3452 Nitin Rawat         2025-01-13  2126  
c178d3588a3452 Nitin Rawat         2025-01-13  2127  			status = "disabled";
c178d3588a3452 Nitin Rawat         2025-01-13  2128  		};
c178d3588a3452 Nitin Rawat         2025-01-13  2129  
068c3d3c83be47 Melody Olvera       2024-12-04  2130  		tcsr_mutex: hwlock@1f40000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2131  			compatible = "qcom,tcsr-mutex";
068c3d3c83be47 Melody Olvera       2024-12-04  2132  			reg = <0x0 0x01f40000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera       2024-12-04  2133  			#hwlock-cells = <1>;
068c3d3c83be47 Melody Olvera       2024-12-04  2134  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2135  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2136  		remoteproc_adsp: remoteproc@6800000 {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2137  			compatible = "qcom,sm8750-adsp-pas", "qcom,sm8550-adsp-pas";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2138  			reg = <0x0 0x06800000 0x0 0x10000>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2139  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2140  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2141  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2142  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2143  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2144  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2145  					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2146  			interrupt-names = "wdog",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2147  					  "fatal",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2148  					  "ready",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2149  					  "handover",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2150  					  "stop-ack",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2151  					  "shutdown-ack";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2152  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2153  			clocks = <&rpmhcc RPMH_CXO_CLK>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2154  			clock-names = "xo";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2155  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2156  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2157  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2158  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2159  			power-domains = <&rpmhpd RPMHPD_LCX>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2160  					<&rpmhpd RPMHPD_LMX>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2161  			power-domain-names = "lcx",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2162  					     "lmx";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2163  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2164  			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2165  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2166  			qcom,qmp = <&aoss_qmp>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2167  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2168  			qcom,smem-states = <&smp2p_adsp_out 0>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2169  			qcom,smem-state-names = "stop";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2170  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2171  			status = "disabled";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2172  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2173  			remoteproc_adsp_glink: glink-edge {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2174  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2175  							     IPCC_MPROC_SIGNAL_GLINK_QMP
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2176  							     IRQ_TYPE_EDGE_RISING>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2177  				mboxes = <&ipcc IPCC_CLIENT_LPASS
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2178  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2179  				qcom,remote-pid = <2>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2180  				label = "lpass";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2181  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2182  				gpr {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2183  					compatible = "qcom,gpr";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2184  					qcom,glink-channels = "adsp_apps";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2185  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2186  					qcom,intents = <512 20>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2187  					#address-cells = <1>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2188  					#size-cells = <0>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2189  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2190  					q6apm: service@1 {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2191  						compatible = "qcom,q6apm";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2192  						reg = <GPR_APM_MODULE_IID>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2193  						#sound-dai-cells = <0>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2194  						qcom,protection-domain = "avs/audio",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2195  									 "msm/adsp/audio_pd";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2196  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2197  						q6apmbedai: bedais {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2198  							compatible = "qcom,q6apm-lpass-dais";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2199  							#sound-dai-cells = <1>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2200  						};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2201  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2202  						q6apmdai: dais {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2203  							compatible = "qcom,q6apm-dais";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2204  							iommus = <&apps_smmu 0x1001 0x80>,
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2205  								 <&apps_smmu 0x1041 0x20>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2206  						};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2207  					};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2208  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2209  					q6prm: service@2 {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2210  						compatible = "qcom,q6prm";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2211  						reg = <GPR_PRM_MODULE_IID>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2212  						qcom,protection-domain = "avs/audio",
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2213  									 "msm/adsp/audio_pd";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2214  
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2215  						q6prmcc: clock-controller {
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2216  							compatible = "qcom,q6prm-lpass-clocks";
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2217  							#clock-cells = <2>;
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2218  						};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2219  					};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2220  				};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2221  			};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2222  		};
f3baf4b486bc88 Krzysztof Kozlowski 2024-12-06  2223  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2224  		lpass_wsa2macro: codec@6aa0000 {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2225  			compatible = "qcom,sm8750-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2226  			reg = <0x0 0x06aa0000 0x0 0x1000>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2227  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2228  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2229  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2230  				 <&lpass_vamacro>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2231  			clock-names = "mclk",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2232  				      "macro",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2233  				      "dcodec",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2234  				      "fsgen";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2235  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2236  			#clock-cells = <0>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2237  			clock-output-names = "wsa2-mclk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2238  			#sound-dai-cells = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2239  		};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2240  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2241  		swr3: soundwire@6ab0000 {
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2242  			compatible = "qcom,soundwire-v2.0.0";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2243  			reg = <0 0x06ab0000 0 0x10000>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2244  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2245  			clocks = <&lpass_wsa2macro>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2246  			clock-names = "iface";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2247  			label = "WSA2";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2248  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2249  			pinctrl-0 = <&wsa2_swr_active>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2250  			pinctrl-names = "default";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2251  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2252  			qcom,din-ports = <4>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2253  			qcom,dout-ports = <9>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2254  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2255  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2256  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2257  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2258  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2259  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2260  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2261  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2262  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2263  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2264  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2265  			#address-cells = <2>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2266  			#size-cells = <0>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2267  			#sound-dai-cells = <1>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2268  			status = "disabled";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2269  		};
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2270  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2271  		lpass_rxmacro: codec@6ac0000 {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2272  			compatible = "qcom,sm8750-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2273  			reg = <0x0 0x06ac0000 0x0 0x1000>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2274  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2275  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2276  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2277  				 <&lpass_vamacro>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2278  			clock-names = "mclk",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2279  				      "macro",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2280  				      "dcodec",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2281  				      "fsgen";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2282  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2283  			#clock-cells = <0>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2284  			clock-output-names = "mclk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2285  			#sound-dai-cells = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2286  		};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2287  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2288  		swr1: soundwire@6ad0000 {
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2289  			compatible = "qcom,soundwire-v2.0.0";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2290  			reg = <0 0x06ad0000 0 0x10000>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2291  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2292  			clocks = <&lpass_rxmacro>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2293  			clock-names = "iface";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2294  			label = "RX";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2295  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2296  			pinctrl-0 = <&rx_swr_active>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2297  			pinctrl-names = "default";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2298  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2299  			qcom,din-ports = <1>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2300  			qcom,dout-ports = <11>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2301  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2302  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2303  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2304  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2305  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0x00 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2306  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0x0f 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2307  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0x18 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2308  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2309  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2310  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2311  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2312  			#address-cells = <2>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2313  			#size-cells = <0>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2314  			#sound-dai-cells = <1>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2315  			status = "disabled";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2316  		};
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2317  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2318  		lpass_txmacro: codec@6ae0000 {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2319  			compatible = "qcom,sm8750-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2320  			reg = <0x0 0x06ae0000 0x0 0x1000>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2321  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2322  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2323  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2324  				 <&lpass_vamacro>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2325  			clock-names = "mclk",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2326  				      "macro",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2327  				      "dcodec",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2328  				      "fsgen";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2329  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2330  			#clock-cells = <0>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2331  			clock-output-names = "mclk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2332  			#sound-dai-cells = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2333  		};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2334  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2335  		lpass_wsamacro: codec@6b00000 {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2336  			compatible = "qcom,sm8750-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2337  			reg = <0x0 0x06b00000 0x0 0x1000>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2338  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2339  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2340  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2341  				 <&lpass_vamacro>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2342  			clock-names = "mclk",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2343  				      "macro",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2344  				      "dcodec",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2345  				      "fsgen";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2346  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2347  			#clock-cells = <0>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2348  			clock-output-names = "mclk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2349  			#sound-dai-cells = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2350  		};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2351  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2352  		swr0: soundwire@6b10000 {
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2353  			compatible = "qcom,soundwire-v2.0.0";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2354  			reg = <0 0x06b10000 0 0x10000>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2355  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2356  			clocks = <&lpass_wsamacro>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2357  			clock-names = "iface";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2358  			label = "WSA";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2359  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2360  			pinctrl-0 = <&wsa_swr_active>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2361  			pinctrl-names = "default";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2362  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2363  			qcom,din-ports = <4>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2364  			qcom,dout-ports = <9>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2365  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2366  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2367  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2368  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2369  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2370  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2371  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2372  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2373  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2374  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2375  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2376  			#address-cells = <2>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2377  			#size-cells = <0>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2378  			#sound-dai-cells = <1>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2379  			status = "disabled";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2380  		};
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2381  
068c3d3c83be47 Melody Olvera       2024-12-04  2382  		lpass_ag_noc: interconnect@7e40000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2383  			compatible = "qcom,sm8750-lpass-ag-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2384  			reg = <0x0 0x07e40000 0x0 0xe080>;
068c3d3c83be47 Melody Olvera       2024-12-04  2385  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2386  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2387  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2388  
068c3d3c83be47 Melody Olvera       2024-12-04  2389  		lpass_lpiaon_noc: interconnect@7400000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2390  			compatible = "qcom,sm8750-lpass-lpiaon-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2391  			reg = <0x0 0x07400000 0x0 0x19080>;
068c3d3c83be47 Melody Olvera       2024-12-04  2392  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2393  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2394  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2395  
068c3d3c83be47 Melody Olvera       2024-12-04  2396  		lpass_lpicx_noc: interconnect@7420000 {
068c3d3c83be47 Melody Olvera       2024-12-04  2397  			compatible = "qcom,sm8750-lpass-lpicx-noc";
068c3d3c83be47 Melody Olvera       2024-12-04  2398  			reg = <0x0 0x07420000 0x0 0x44080>;
068c3d3c83be47 Melody Olvera       2024-12-04  2399  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera       2024-12-04  2400  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera       2024-12-04  2401  		};
068c3d3c83be47 Melody Olvera       2024-12-04  2402  
8e4831b53538b1 Wesley Cheng        2025-01-13  2403  		usb_1_hsphy: phy@88e3000 {
8e4831b53538b1 Wesley Cheng        2025-01-13  2404  			compatible = "qcom,sm8750-m31-eusb2-phy";
8e4831b53538b1 Wesley Cheng        2025-01-13  2405  			reg = <0x0 0x88e3000 0x0 0x29c>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2406  
8e4831b53538b1 Wesley Cheng        2025-01-13  2407  			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2408  			clock-names = "ref";
8e4831b53538b1 Wesley Cheng        2025-01-13  2409  
8e4831b53538b1 Wesley Cheng        2025-01-13  2410  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2411  
8e4831b53538b1 Wesley Cheng        2025-01-13  2412  			#phy-cells = <0>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2413  
8e4831b53538b1 Wesley Cheng        2025-01-13  2414  			status = "disabled";
8e4831b53538b1 Wesley Cheng        2025-01-13  2415  		};
8e4831b53538b1 Wesley Cheng        2025-01-13  2416  
8e4831b53538b1 Wesley Cheng        2025-01-13  2417  		usb_dp_qmpphy: phy@88e8000 {
8e4831b53538b1 Wesley Cheng        2025-01-13  2418  			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
8e4831b53538b1 Wesley Cheng        2025-01-13  2419  			reg = <0x0 0x088e8000 0x0 0x3000>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2420  
8e4831b53538b1 Wesley Cheng        2025-01-13  2421  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2422  				 <&rpmhcc RPMH_CXO_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2423  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2424  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2425  			clock-names = "aux",
8e4831b53538b1 Wesley Cheng        2025-01-13  2426  				      "ref",
8e4831b53538b1 Wesley Cheng        2025-01-13  2427  				      "com_aux",
8e4831b53538b1 Wesley Cheng        2025-01-13  2428  				      "usb3_pipe";
8e4831b53538b1 Wesley Cheng        2025-01-13  2429  
8e4831b53538b1 Wesley Cheng        2025-01-13  2430  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2431  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2432  			reset-names = "phy",
8e4831b53538b1 Wesley Cheng        2025-01-13  2433  				      "common";
8e4831b53538b1 Wesley Cheng        2025-01-13  2434  
8e4831b53538b1 Wesley Cheng        2025-01-13  2435  			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2436  
8e4831b53538b1 Wesley Cheng        2025-01-13  2437  			#clock-cells = <1>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2438  			#phy-cells = <1>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2439  
8e4831b53538b1 Wesley Cheng        2025-01-13  2440  			status = "disabled";
8e4831b53538b1 Wesley Cheng        2025-01-13  2441  		};
8e4831b53538b1 Wesley Cheng        2025-01-13  2442  
8e4831b53538b1 Wesley Cheng        2025-01-13  2443  		usb_1: usb@a6f8800 {
8e4831b53538b1 Wesley Cheng        2025-01-13  2444  			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
8e4831b53538b1 Wesley Cheng        2025-01-13  2445  			reg = <0x0 0x0a6f8800 0x0 0x400>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2446  			status = "disabled";
8e4831b53538b1 Wesley Cheng        2025-01-13  2447  			#address-cells = <2>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2448  			#size-cells = <2>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2449  			ranges;
8e4831b53538b1 Wesley Cheng        2025-01-13  2450  
8e4831b53538b1 Wesley Cheng        2025-01-13  2451  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2452  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2453  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2454  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2455  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2456  				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2457  			clock-names = "cfg_noc",
8e4831b53538b1 Wesley Cheng        2025-01-13  2458  				      "core",
8e4831b53538b1 Wesley Cheng        2025-01-13  2459  				      "iface",
8e4831b53538b1 Wesley Cheng        2025-01-13  2460  				      "sleep",
8e4831b53538b1 Wesley Cheng        2025-01-13  2461  				      "mock_utmi",
8e4831b53538b1 Wesley Cheng        2025-01-13  2462  				      "xo";
8e4831b53538b1 Wesley Cheng        2025-01-13  2463  
8e4831b53538b1 Wesley Cheng        2025-01-13  2464  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2465  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2466  			assigned-clock-rates = <19200000>, <200000000>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2467  
8e4831b53538b1 Wesley Cheng        2025-01-13  2468  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2469  						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2470  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2471  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2472  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2473  			interrupt-names = "pwr_event",
8e4831b53538b1 Wesley Cheng        2025-01-13  2474  					  "hs_phy_irq",
8e4831b53538b1 Wesley Cheng        2025-01-13  2475  					  "dp_hs_phy_irq",
8e4831b53538b1 Wesley Cheng        2025-01-13  2476  					  "dm_hs_phy_irq",
8e4831b53538b1 Wesley Cheng        2025-01-13  2477  					  "ss_phy_irq";
8e4831b53538b1 Wesley Cheng        2025-01-13  2478  
8e4831b53538b1 Wesley Cheng        2025-01-13  2479  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2480  			required-opps = <&rpmhpd_opp_nom>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2481  
8e4831b53538b1 Wesley Cheng        2025-01-13  2482  			resets = <&gcc GCC_USB30_PRIM_BCR>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2483  
8e4831b53538b1 Wesley Cheng        2025-01-13  2484  			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
8e4831b53538b1 Wesley Cheng        2025-01-13  2485  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2486  			interconnect-names = "usb-ddr", "apps-usb";
8e4831b53538b1 Wesley Cheng        2025-01-13  2487  
8e4831b53538b1 Wesley Cheng        2025-01-13  2488  			usb_1_dwc3: usb@a600000 {
8e4831b53538b1 Wesley Cheng        2025-01-13  2489  				compatible = "snps,dwc3";
8e4831b53538b1 Wesley Cheng        2025-01-13  2490  				reg = <0x0 0x0a600000 0x0 0xe000>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2491  
8e4831b53538b1 Wesley Cheng        2025-01-13  2492  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2493  
8e4831b53538b1 Wesley Cheng        2025-01-13  2494  				iommus = <&apps_smmu 0x40 0x0>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2495  
8e4831b53538b1 Wesley Cheng        2025-01-13  2496  				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2497  				phy-names = "usb2-phy", "usb3-phy";
8e4831b53538b1 Wesley Cheng        2025-01-13  2498  
8e4831b53538b1 Wesley Cheng        2025-01-13  2499  				snps,hird-threshold = /bits/ 8 <0x0>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2500  				snps,usb2-gadget-lpm-disable;
8e4831b53538b1 Wesley Cheng        2025-01-13  2501  				snps,dis_u2_susphy_quirk;
8e4831b53538b1 Wesley Cheng        2025-01-13  2502  				snps,dis_enblslpm_quirk;
8e4831b53538b1 Wesley Cheng        2025-01-13  2503  				snps,dis-u1-entry-quirk;
8e4831b53538b1 Wesley Cheng        2025-01-13  2504  				snps,dis-u2-entry-quirk;
8e4831b53538b1 Wesley Cheng        2025-01-13  2505  				snps,is-utmi-l1-suspend;
8e4831b53538b1 Wesley Cheng        2025-01-13  2506  				snps,usb3_lpm_capable;
8e4831b53538b1 Wesley Cheng        2025-01-13  2507  				snps,usb2-lpm-disable;
8e4831b53538b1 Wesley Cheng        2025-01-13  2508  				snps,has-lpm-erratum;
8e4831b53538b1 Wesley Cheng        2025-01-13  2509  				tx-fifo-resize;
8e4831b53538b1 Wesley Cheng        2025-01-13  2510  
8e4831b53538b1 Wesley Cheng        2025-01-13  2511  				dr_mode = "peripheral";
8e4831b53538b1 Wesley Cheng        2025-01-13  2512  
8e4831b53538b1 Wesley Cheng        2025-01-13  2513  				dma-coherent;
8e4831b53538b1 Wesley Cheng        2025-01-13  2514  
8e4831b53538b1 Wesley Cheng        2025-01-13  2515  				ports {
8e4831b53538b1 Wesley Cheng        2025-01-13  2516  					#address-cells = <1>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2517  					#size-cells = <0>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2518  
8e4831b53538b1 Wesley Cheng        2025-01-13  2519  					port@0 {
8e4831b53538b1 Wesley Cheng        2025-01-13  2520  						reg = <0>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2521  
8e4831b53538b1 Wesley Cheng        2025-01-13  2522  						usb_1_dwc3_hs: endpoint {
8e4831b53538b1 Wesley Cheng        2025-01-13  2523  						};
8e4831b53538b1 Wesley Cheng        2025-01-13  2524  					};
8e4831b53538b1 Wesley Cheng        2025-01-13  2525  
8e4831b53538b1 Wesley Cheng        2025-01-13  2526  					port@1 {
8e4831b53538b1 Wesley Cheng        2025-01-13  2527  						reg = <1>;
8e4831b53538b1 Wesley Cheng        2025-01-13  2528  
8e4831b53538b1 Wesley Cheng        2025-01-13  2529  						usb_1_dwc3_ss: endpoint {
8e4831b53538b1 Wesley Cheng        2025-01-13  2530  						};
8e4831b53538b1 Wesley Cheng        2025-01-13  2531  					};
8e4831b53538b1 Wesley Cheng        2025-01-13  2532  				};
8e4831b53538b1 Wesley Cheng        2025-01-13  2533  			};
8e4831b53538b1 Wesley Cheng        2025-01-13  2534  		};
8e4831b53538b1 Wesley Cheng        2025-01-13  2535  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2536  		swr2: soundwire@7630000 {
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2537  			compatible = "qcom,soundwire-v2.0.0";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2538  			reg = <0 0x07630000 0 0x10000>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2539  			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2540  				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2541  			interrupt-names = "core", "wakeup";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2542  			clocks = <&lpass_txmacro>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2543  			clock-names = "iface";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2544  			label = "TX";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2545  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2546  			pinctrl-0 = <&tx_swr_active>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2547  			pinctrl-names = "default";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2548  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2549  			qcom,din-ports = <4>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2550  			qcom,dout-ports = <0>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2551  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2552  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2553  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2554  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2555  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2556  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2557  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2558  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2559  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2560  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2561  
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2562  			#address-cells = <2>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2563  			#size-cells = <0>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2564  			#sound-dai-cells = <1>;
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2565  			status = "disabled";
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2566  		};
572b32b1708200 Krzysztof Kozlowski 2024-10-07  2567  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2568  		lpass_vamacro: codec@7660000 {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2569  			compatible = "qcom,sm8750-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2570  			reg = <0x0 0x07660000 0x0 0x1000>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2571  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2572  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2573  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2574  			clock-names = "mclk",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2575  				      "macro",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2576  				      "dcodec";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2577  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2578  			#clock-cells = <0>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2579  			clock-output-names = "fsgen";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2580  			#sound-dai-cells = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2581  		};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2582  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2583  		lpass_tlmm: pinctrl@7760000 {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2584  			compatible = "qcom,sm8750-lpass-lpi-pinctrl",
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2585  				     "qcom,sm8650-lpass-lpi-pinctrl";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2586  			reg = <0x0 0x07760000 0x0 0x20000>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2587  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2588  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2589  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2590  			clock-names = "core", "audio";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2591  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2592  			gpio-controller;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2593  			#gpio-cells = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2594  			gpio-ranges = <&lpass_tlmm 0 0 23>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2595  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2596  			tx_swr_active: tx-swr-active-state {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2597  				clk-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2598  					pins = "gpio0";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2599  					function = "swr_tx_clk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2600  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2601  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2602  					bias-disable;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2603  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2604  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2605  				data-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2606  					pins = "gpio1", "gpio2", "gpio14";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2607  					function = "swr_tx_data";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2608  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2609  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2610  					bias-bus-hold;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2611  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2612  			};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2613  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2614  			rx_swr_active: rx-swr-active-state {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2615  				clk-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2616  					pins = "gpio3";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2617  					function = "swr_rx_clk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2618  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2619  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2620  					bias-disable;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2621  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2622  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2623  				data-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2624  					pins = "gpio4", "gpio5";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2625  					function = "swr_rx_data";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2626  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2627  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2628  					bias-bus-hold;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2629  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2630  			};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2631  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2632  			dmic01_default: dmic01-default-state {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2633  				clk-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2634  					pins = "gpio6";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2635  					function = "dmic1_clk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2636  					drive-strength = <8>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2637  					output-high;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2638  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2639  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2640  				data-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2641  					pins = "gpio7";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2642  					function = "dmic1_data";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2643  					drive-strength = <8>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2644  					input-enable;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2645  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2646  			};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2647  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2648  			dmic23_default: dmic23-default-state {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2649  				clk-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2650  					pins = "gpio8";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2651  					function = "dmic2_clk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2652  					drive-strength = <8>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2653  					output-high;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2654  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2655  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2656  				data-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2657  					pins = "gpio9";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2658  					function = "dmic2_data";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2659  					drive-strength = <8>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2660  					input-enable;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2661  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2662  			};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2663  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2664  			wsa_swr_active: wsa-swr-active-state {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2665  				clk-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2666  					pins = "gpio10";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2667  					function = "wsa_swr_clk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2668  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2669  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2670  					bias-disable;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2671  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2672  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2673  				data-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2674  					pins = "gpio11";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2675  					function = "wsa_swr_data";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2676  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2677  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2678  					bias-bus-hold;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2679  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2680  			};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2681  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2682  			wsa2_swr_active: wsa2-swr-active-state {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2683  				clk-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2684  					pins = "gpio15";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2685  					function = "wsa2_swr_clk";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2686  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2687  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2688  					bias-disable;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2689  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2690  
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2691  				data-pins {
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2692  					pins = "gpio16";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2693  					function = "wsa2_swr_data";
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2694  					drive-strength = <2>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2695  					slew-rate = <1>;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2696  					bias-bus-hold;
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2697  				};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2698  			};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2699  		};
227f83749b6194 Krzysztof Kozlowski 2024-10-07  2700  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2701  		mdss: display-subsystem@ae00000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2702  			compatible = "qcom,sm8750-mdss";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2703  			reg = <0x0 0x0ae00000 0x0 0x1000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2704  			reg-names = "mdss";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2705  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2706  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2707  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2708  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2709  				 <&gcc GCC_DISP_HF_AXI_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2710  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2711  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2712  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2713  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2714  			// TODO: with fixes for sm8650
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2715  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2716  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2717  			interconnect-names = "mdp0-mem";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2718  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2719  			power-domains = <&dispcc MDSS_GDSC>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2720  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2721  			iommus = <&apps_smmu 0x800 0x2>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2722  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2723  			interrupt-controller;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2724  			#interrupt-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2725  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2726  			#address-cells = <2>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2727  			#size-cells = <2>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2728  			ranges;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2729  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2730  			status = "disabled";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2731  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2732  			mdss_mdp: display-controller@ae01000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2733  				compatible = "qcom,sm8750-dpu";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2734  				reg = <0 0x0ae01000 0 0x93000>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2735  				      <0 0x0aeb0000 0 0x2008>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2736  				reg-names = "mdp",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2737  					    "vbif";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2738  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2739  				interrupts-extended = <&mdss 0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2740  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2741  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2742  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2743  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2744  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2745  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2746  				clock-names = "nrt_bus",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2747  					      "iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2748  					      "lut",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2749  					      "core",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2750  					      "vsync";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2751  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2752  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2753  				assigned-clock-rates = <19200000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2754  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2755  				operating-points-v2 = <&mdp_opp_table>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2756  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2757  				power-domains = <&rpmhpd RPMHPD_MMCX>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2758  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2759  				ports {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2760  					#address-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2761  					#size-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2762  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2763  					port@0 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2764  						reg = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2765  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2766  						dpu_intf1_out: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2767  							remote-endpoint = <&mdss_dsi0_in>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2768  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2769  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2770  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2771  					port@1 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2772  						reg = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2773  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2774  						dpu_intf2_out: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2775  							remote-endpoint = <&mdss_dsi1_in>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2776  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2777  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2778  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2779  					port@2 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2780  						reg = <2>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2781  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2782  						dpu_intf0_out: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2783  							remote-endpoint = <&mdss_dp0_in>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2784  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2785  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2786  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2787  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2788  				mdp_opp_table: opp-table {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2789  					compatible = "operating-points-v2";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2790  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2791  					opp-207000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2792  						opp-hz = /bits/ 64 <207000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2793  						required-opps = <&rpmhpd_opp_low_svs>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2794  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2795  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2796  					opp-337000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2797  						opp-hz = /bits/ 64 <337000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2798  						required-opps = <&rpmhpd_opp_svs>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2799  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2800  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2801  					opp-417000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2802  						opp-hz = /bits/ 64 <417000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2803  						required-opps = <&rpmhpd_opp_svs_l1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2804  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2805  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2806  					opp-532000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2807  						opp-hz = /bits/ 64 <532000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2808  						required-opps = <&rpmhpd_opp_nom>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2809  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2810  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2811  					/*
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2812  					opp-575000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2813  						opp-hz = /bits/ 64 <575000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2814  						required-opps = <&rpmhpd_opp_nom_l1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2815  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2816  					*/
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2817  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2818  			};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2819  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2820  			// TODO: DSI embedded mode cmd difference in downstream drivers
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28 @2821  			mdss_dsi0: dsi@ae94000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2822  				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2823  				reg = <0x0 0x0ae94000 0x0 0x400>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2824  				reg-names = "dsi_ctrl";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2825  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2826  				interrupts-extended = <&mdss 4>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2827  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2828  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2829  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2830  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2831  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2832  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2833  					 <&gcc GCC_DISP_HF_AXI_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2834  					 <&mdss_dsi0_phy 1>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2835  					 <&mdss_dsi0_phy 0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2836  					 <&dispcc DISP_CC_ESYNC0_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2837  					 <&dispcc DISP_CC_OSC_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2838  					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2839  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2840  				clock-names = "byte",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2841  					      "byte_intf",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2842  					      "pixel",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2843  					      "core",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2844  					      "iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2845  					      "bus",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2846  					      "dsi_pll_pixel",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2847  					      "dsi_pll_byte",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2848  					      "esync",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2849  					      "osc",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2850  					      "byte_src",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2851  					      "pixel_src";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2852  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2853  				operating-points-v2 = <&mdss_dsi_opp_table>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2854  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2855  				power-domains = <&rpmhpd RPMHPD_MMCX>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2856  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2857  				phys = <&mdss_dsi0_phy>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2858  				phy-names = "dsi";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2859  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2860  				#address-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2861  				#size-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2862  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2863  				status = "disabled";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2864  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2865  				ports {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2866  					#address-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2867  					#size-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2868  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2869  					port@0 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2870  						reg = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2871  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2872  						mdss_dsi0_in: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2873  							remote-endpoint = <&dpu_intf1_out>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2874  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2875  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2876  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2877  					port@1 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2878  						reg = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2879  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2880  						mdss_dsi0_out: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2881  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2882  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2883  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2884  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2885  				// DONE
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2886  				mdss_dsi_opp_table: opp-table {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2887  					compatible = "operating-points-v2";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2888  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2889  					opp-187500000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2890  						opp-hz = /bits/ 64 <187500000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2891  						required-opps = <&rpmhpd_opp_low_svs>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2892  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2893  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2894  					opp-300000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2895  						opp-hz = /bits/ 64 <300000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2896  						required-opps = <&rpmhpd_opp_svs>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2897  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2898  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2899  					opp-358000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2900  						opp-hz = /bits/ 64 <358000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2901  						required-opps = <&rpmhpd_opp_svs_l1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2902  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2903  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2904  			};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2905  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2906  			mdss_dsi0_phy: phy@ae95000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2907  				compatible = "qcom,sm8750-dsi-phy-3nm";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2908  				reg = <0x0 0x0ae95000 0x0 0x200>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2909  				      <0x0 0x0ae95200 0x0 0x280>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2910  				      <0x0 0x0ae95500 0x0 0x400>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2911  				reg-names = "dsi_phy",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2912  					    "dsi_phy_lane",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2913  					    "dsi_pll";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2914  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2915  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2916  					 <&rpmhcc RPMH_CXO_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2917  				clock-names = "iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2918  					      "ref";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2919  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2920  				#clock-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2921  				#phy-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2922  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2923  				//status = "disabled";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2924  			};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2925  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28 @2926  			mdss_dsi1: dsi@ae96000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2927  				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2928  				reg = <0x0 0x0ae96000 0x0 0x400>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2929  				reg-names = "dsi_ctrl";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2930  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2931  				interrupts-extended = <&mdss 5>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2932  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2933  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2934  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2935  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2936  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2937  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2938  					 <&gcc GCC_DISP_HF_AXI_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2939  				clock-names = "byte",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2940  					      "byte_intf",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2941  					      "pixel",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2942  					      "core",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2943  					      "iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2944  					      "bus";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2945  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2946  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2947  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2948  				assigned-clock-parents = <&mdss_dsi1_phy 0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2949  							 <&mdss_dsi1_phy 1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2950  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2951  				operating-points-v2 = <&mdss_dsi_opp_table>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2952  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2953  				power-domains = <&rpmhpd RPMHPD_MMCX>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2954  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2955  				phys = <&mdss_dsi1_phy>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2956  				phy-names = "dsi";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2957  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2958  				#address-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2959  				#size-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2960  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2961  				status = "disabled";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2962  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2963  				ports {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2964  					#address-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2965  					#size-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2966  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2967  					port@0 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2968  						reg = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2969  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2970  						mdss_dsi1_in: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2971  							remote-endpoint = <&dpu_intf2_out>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2972  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2973  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2974  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2975  					port@1 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2976  						reg = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2977  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2978  						mdss_dsi1_out: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2979  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2980  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2981  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2982  			};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2983  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2984  			mdss_dsi1_phy: phy@ae97000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2985  				compatible = "qcom,sm8750-dsi-phy-3nm";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2986  				reg = <0x0 0x0ae97000 0x0 0x200>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2987  				      <0x0 0x0ae97200 0x0 0x280>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2988  				      <0x0 0x0ae97500 0x0 0x400>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2989  				reg-names = "dsi_phy",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2990  					    "dsi_phy_lane",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2991  					    "dsi_pll";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2992  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2993  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2994  					 <&rpmhcc RPMH_CXO_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2995  				clock-names = "iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2996  					      "ref";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2997  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2998  				#clock-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  2999  				#phy-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3000  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3001  				status = "disabled";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3002  			};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3003  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3004  			mdss_dp0: displayport-controller@af54000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3005  				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3006  				reg = <0x0 0xaf54000 0x0 0x104>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3007  				      <0x0 0xaf54200 0x0 0xc0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3008  				      <0x0 0xaf55000 0x0 0x770>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3009  				      <0x0 0xaf56000 0x0 0x9c>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3010  				      <0x0 0xaf57000 0x0 0x9c>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3011  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3012  				interrupts-extended = <&mdss 12>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3013  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3014  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3015  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3016  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3017  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3018  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3019  				clock-names = "core_iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3020  					      "core_aux",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3021  					      "ctrl_link",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3022  					      "ctrl_link_iface",
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3023  					      "stream_pixel";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3024  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3025  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3026  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3027  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3028  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3029  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3030  				operating-points-v2 = <&dp_opp_table>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3031  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3032  				power-domains = <&rpmhpd RPMHPD_MMCX>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3033  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3034  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3035  				phy-names = "dp";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3036  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3037  				#sound-dai-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3038  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3039  				status = "disabled";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3040  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3041  				// DONE:
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3042  				dp_opp_table: opp-table {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3043  					compatible = "operating-points-v2";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3044  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3045  					opp-192000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3046  						opp-hz = /bits/ 64 <192000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3047  						required-opps = <&rpmhpd_opp_low_svs_d1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3048  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3049  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3050  					opp-270000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3051  						opp-hz = /bits/ 64 <270000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3052  						required-opps = <&rpmhpd_opp_low_svs>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3053  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3054  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3055  					opp-540000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3056  						opp-hz = /bits/ 64 <540000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3057  						required-opps = <&rpmhpd_opp_svs_l1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3058  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3059  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3060  					opp-810000000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3061  						opp-hz = /bits/ 64 <810000000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3062  						required-opps = <&rpmhpd_opp_nom>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3063  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3064  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3065  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3066  				ports {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3067  					#address-cells = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3068  					#size-cells = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3069  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3070  					port@0 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3071  						reg = <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3072  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3073  						mdss_dp0_in: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3074  							remote-endpoint = <&dpu_intf0_out>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3075  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3076  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3077  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3078  					port@1 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3079  						reg = <1>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3080  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3081  						mdss_dp0_out: endpoint {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3082  							// remote-endpoint = <&usb_dp_qmpphy_dp_in>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3083  						};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3084  					};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3085  				};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3086  			};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3087  		};
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3088  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3089  		dispcc: clock-controller@af00000 {
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3090  			compatible = "qcom,sm8750-dispcc";
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3091  			reg = <0 0x0af00000 0 0x20000>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3092  
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3093  			clocks = <&bi_tcxo_div2>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3094  				 <&bi_tcxo_ao_div2>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3095  				 <&gcc GCC_DISP_AHB_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3096  				 <&sleep_clk>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3097  				 <&mdss_dsi0_phy 0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3098  				 <&mdss_dsi0_phy 1>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3099  				 <&mdss_dsi1_phy 0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3100  				 <&mdss_dsi1_phy 1>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3101  				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3102  				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3103  				 <0>, /* dp1 */
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3104  				 <0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3105  				 <0>, /* dp2 */
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3106  				 <0>,
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3107  				 <0>, /* dp3 */
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3108  				 <0>;
fbe30c4d7cec45 Krzysztof Kozlowski 2024-11-28  3109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
