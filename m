Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584F21C16D
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jun 2025 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871495; cv=none; b=SZf9rm+VzhHrwpOfwVyp84i2qHeAhX+ii3sy2VldjQ8bhWeL3819N1TyWV8ZvQd7xG0Hbq7l1GUgZmNCpeGfwMBkmj3h1SbTUkXubD4gIgl5kTfx+ktFnljQVZC6+nlMAwHaK4HBLSY5/MQs6iLgTsXU8+lOGAQzJbu2bliZQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871495; c=relaxed/simple;
	bh=dxkfjv7SkaKXDdsHwvf4TU3oa0+fD3+iNxN4OEeVlQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTBl2HpmJdcJbs41vDdBDns/2FpqadrmudOailf4GkLDiPTnNTiI02bBsor2eI4F7IyqbETPIN1qQbPeX0D4zce6YxNxL+mzSZdHn37GtjmcGYIzyfQQThqG31gkqBTwU9SlQUzphDYXE7kLCnvnnkUyMTOWtTg+iu+76gmhszQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtuP9AWL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtuP9AWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748871485; x=1780407485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxkfjv7SkaKXDdsHwvf4TU3oa0+fD3+iNxN4OEeVlQU=;
  b=JtuP9AWLn1pH30fryJn7OdXxPAfUe4hV3/2lGBX21FweQ5+awTSH9NwH
   R7Eii0kO8glP1UR8rf01q+Fg3a4LBD0TuQmzFviNhRtqaXq8CFdOokE7k
   JBsXf0zF3CGxY58swFtI6wK4gtSoKJ6keae2ECd3OGU31/kxHw7vjFvuL
   QhgtheQnDKtAzvl4TRXuHJxzjj7NMaHI/nV5xUQQLAxuogBJ2hN6dKLSa
   hgl7BiQ09BVlfr9TaMCdXXYdUrVlgzDjXWSI9NzsUNrc0uS1SrzepUD0x
   u55UB3hOjheSex7E3XMT58An66XVRVUfJzT47HAGmoWeNtopzqPd3CJ+s
   g==;
X-CSE-ConnectionGUID: v6tYmNqtRFukNG+jTrQ5TA==
X-CSE-MsgGUID: 4oswclXqRQa5AosjFyZwPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50934025"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="50934025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 06:38:05 -0700
X-CSE-ConnectionGUID: jStrogkHRqSnF5TEWh50gQ==
X-CSE-MsgGUID: YcJOLGDlTei9Ir2NdetYuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="149316504"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jun 2025 06:38:03 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uM5MW-0001K2-2D;
	Mon, 02 Jun 2025 13:38:00 +0000
Date: Mon, 2 Jun 2025 21:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/sm8750-audio-part-3 23/23]
 arch/arm64/boot/dts/qcom/sm8750.dtsi:3052.34-3053.8: Warning
 (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection
 to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
Message-ID: <202506022126.bfSZLMlH-lkp@intel.com>
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

tree:   https://github.com/krzk/linux n/sm8750-audio-part-3
head:   a016380204f5cf5f488e9314594442243281adfd
commit: ec641b25cc78eae045852d032319ef3a846f2912 [23/23] arm64: dts: qcom: Add USB orientation support for MTP and QRD
:::::: branch date: 7 days ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-2005-20250502 (https://download.01.org/0day-ci/archive/20250602/202506022126.bfSZLMlH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506022126.bfSZLMlH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506022126.bfSZLMlH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2709.27-2791.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2813.27-2869.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:3052.34-3053.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:3153.31-3154.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'

vim +3052 arch/arm64/boot/dts/qcom/sm8750.dtsi

068c3d3c83be47 Melody Olvera        2024-12-04    22  
068c3d3c83be47 Melody Olvera        2024-12-04    23  / {
068c3d3c83be47 Melody Olvera        2024-12-04    24  	interrupt-parent = <&intc>;
068c3d3c83be47 Melody Olvera        2024-12-04    25  
068c3d3c83be47 Melody Olvera        2024-12-04    26  	#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04    27  	#size-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04    28  
068c3d3c83be47 Melody Olvera        2024-12-04    29  	cpus {
068c3d3c83be47 Melody Olvera        2024-12-04    30  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04    31  		#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04    32  
068c3d3c83be47 Melody Olvera        2024-12-04    33  		cpu0: cpu@0 {
068c3d3c83be47 Melody Olvera        2024-12-04    34  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04    35  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04    36  			reg = <0x0 0x0>;
068c3d3c83be47 Melody Olvera        2024-12-04    37  			enable-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    38  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera        2024-12-04    39  			power-domains = <&cpu_pd0>;
068c3d3c83be47 Melody Olvera        2024-12-04    40  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    41  
068c3d3c83be47 Melody Olvera        2024-12-04    42  			l2_0: l2-cache {
068c3d3c83be47 Melody Olvera        2024-12-04    43  				compatible = "cache";
068c3d3c83be47 Melody Olvera        2024-12-04    44  				cache-level = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04    45  				cache-unified;
068c3d3c83be47 Melody Olvera        2024-12-04    46  			};
068c3d3c83be47 Melody Olvera        2024-12-04    47  		};
068c3d3c83be47 Melody Olvera        2024-12-04    48  
068c3d3c83be47 Melody Olvera        2024-12-04    49  		cpu1: cpu@100 {
068c3d3c83be47 Melody Olvera        2024-12-04    50  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04    51  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04    52  			reg = <0x0 0x100>;
068c3d3c83be47 Melody Olvera        2024-12-04    53  			enable-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    54  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera        2024-12-04    55  			power-domains = <&cpu_pd1>;
068c3d3c83be47 Melody Olvera        2024-12-04    56  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    57  		};
068c3d3c83be47 Melody Olvera        2024-12-04    58  
068c3d3c83be47 Melody Olvera        2024-12-04    59  		cpu2: cpu@200 {
068c3d3c83be47 Melody Olvera        2024-12-04    60  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04    61  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04    62  			reg = <0x0 0x200>;
068c3d3c83be47 Melody Olvera        2024-12-04    63  			enable-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    64  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera        2024-12-04    65  			power-domains = <&cpu_pd2>;
068c3d3c83be47 Melody Olvera        2024-12-04    66  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    67  		};
068c3d3c83be47 Melody Olvera        2024-12-04    68  
068c3d3c83be47 Melody Olvera        2024-12-04    69  		cpu3: cpu@300 {
068c3d3c83be47 Melody Olvera        2024-12-04    70  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04    71  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04    72  			reg = <0x0 0x300>;
068c3d3c83be47 Melody Olvera        2024-12-04    73  			enable-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    74  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera        2024-12-04    75  			power-domains = <&cpu_pd3>;
068c3d3c83be47 Melody Olvera        2024-12-04    76  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    77  		};
068c3d3c83be47 Melody Olvera        2024-12-04    78  
068c3d3c83be47 Melody Olvera        2024-12-04    79  		cpu4: cpu@400 {
068c3d3c83be47 Melody Olvera        2024-12-04    80  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04    81  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04    82  			reg = <0x0 0x400>;
068c3d3c83be47 Melody Olvera        2024-12-04    83  			enable-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    84  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera        2024-12-04    85  			power-domains = <&cpu_pd4>;
068c3d3c83be47 Melody Olvera        2024-12-04    86  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    87  		};
068c3d3c83be47 Melody Olvera        2024-12-04    88  
068c3d3c83be47 Melody Olvera        2024-12-04    89  		cpu5: cpu@500 {
068c3d3c83be47 Melody Olvera        2024-12-04    90  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04    91  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04    92  			reg = <0x0 0x500>;
068c3d3c83be47 Melody Olvera        2024-12-04    93  			enable-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    94  			next-level-cache = <&l2_0>;
068c3d3c83be47 Melody Olvera        2024-12-04    95  			power-domains = <&cpu_pd5>;
068c3d3c83be47 Melody Olvera        2024-12-04    96  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04    97  		};
068c3d3c83be47 Melody Olvera        2024-12-04    98  
068c3d3c83be47 Melody Olvera        2024-12-04    99  		cpu6: cpu@10000 {
068c3d3c83be47 Melody Olvera        2024-12-04   100  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04   101  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04   102  			reg = <0x0 0x10000>;
068c3d3c83be47 Melody Olvera        2024-12-04   103  			enable-method = "psci";
91e3ac15523fda Krzysztof Kozlowski  2025-02-19   104  			next-level-cache = <&l2_1>;
068c3d3c83be47 Melody Olvera        2024-12-04   105  			power-domains = <&cpu_pd6>;
068c3d3c83be47 Melody Olvera        2024-12-04   106  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04   107  
91e3ac15523fda Krzysztof Kozlowski  2025-02-19   108  			l2_1: l2-cache {
068c3d3c83be47 Melody Olvera        2024-12-04   109  				compatible = "cache";
068c3d3c83be47 Melody Olvera        2024-12-04   110  				cache-level = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   111  				cache-unified;
068c3d3c83be47 Melody Olvera        2024-12-04   112  			};
068c3d3c83be47 Melody Olvera        2024-12-04   113  		};
068c3d3c83be47 Melody Olvera        2024-12-04   114  
068c3d3c83be47 Melody Olvera        2024-12-04   115  		cpu7: cpu@10100 {
068c3d3c83be47 Melody Olvera        2024-12-04   116  			device_type = "cpu";
068c3d3c83be47 Melody Olvera        2024-12-04   117  			compatible = "qcom,oryon";
068c3d3c83be47 Melody Olvera        2024-12-04   118  			reg = <0x0 0x10100>;
068c3d3c83be47 Melody Olvera        2024-12-04   119  			enable-method = "psci";
91e3ac15523fda Krzysztof Kozlowski  2025-02-19   120  			next-level-cache = <&l2_1>;
068c3d3c83be47 Melody Olvera        2024-12-04   121  			power-domains = <&cpu_pd7>;
068c3d3c83be47 Melody Olvera        2024-12-04   122  			power-domain-names = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04   123  		};
068c3d3c83be47 Melody Olvera        2024-12-04   124  
068c3d3c83be47 Melody Olvera        2024-12-04   125  		cpu-map {
068c3d3c83be47 Melody Olvera        2024-12-04   126  			cluster0 {
068c3d3c83be47 Melody Olvera        2024-12-04   127  				core0 {
068c3d3c83be47 Melody Olvera        2024-12-04   128  					cpu = <&cpu0>;
068c3d3c83be47 Melody Olvera        2024-12-04   129  				};
068c3d3c83be47 Melody Olvera        2024-12-04   130  
068c3d3c83be47 Melody Olvera        2024-12-04   131  				core1 {
068c3d3c83be47 Melody Olvera        2024-12-04   132  					cpu = <&cpu1>;
068c3d3c83be47 Melody Olvera        2024-12-04   133  				};
068c3d3c83be47 Melody Olvera        2024-12-04   134  
068c3d3c83be47 Melody Olvera        2024-12-04   135  				core2 {
068c3d3c83be47 Melody Olvera        2024-12-04   136  					cpu = <&cpu2>;
068c3d3c83be47 Melody Olvera        2024-12-04   137  				};
068c3d3c83be47 Melody Olvera        2024-12-04   138  
068c3d3c83be47 Melody Olvera        2024-12-04   139  				core3 {
068c3d3c83be47 Melody Olvera        2024-12-04   140  					cpu = <&cpu3>;
068c3d3c83be47 Melody Olvera        2024-12-04   141  				};
068c3d3c83be47 Melody Olvera        2024-12-04   142  
068c3d3c83be47 Melody Olvera        2024-12-04   143  				core4 {
068c3d3c83be47 Melody Olvera        2024-12-04   144  					cpu = <&cpu4>;
068c3d3c83be47 Melody Olvera        2024-12-04   145  				};
068c3d3c83be47 Melody Olvera        2024-12-04   146  
068c3d3c83be47 Melody Olvera        2024-12-04   147  				core5 {
068c3d3c83be47 Melody Olvera        2024-12-04   148  					cpu = <&cpu5>;
068c3d3c83be47 Melody Olvera        2024-12-04   149  				};
068c3d3c83be47 Melody Olvera        2024-12-04   150  			};
068c3d3c83be47 Melody Olvera        2024-12-04   151  
068c3d3c83be47 Melody Olvera        2024-12-04   152  			cluster1 {
068c3d3c83be47 Melody Olvera        2024-12-04   153  				core0 {
068c3d3c83be47 Melody Olvera        2024-12-04   154  					cpu = <&cpu6>;
068c3d3c83be47 Melody Olvera        2024-12-04   155  				};
068c3d3c83be47 Melody Olvera        2024-12-04   156  
068c3d3c83be47 Melody Olvera        2024-12-04   157  				core1 {
068c3d3c83be47 Melody Olvera        2024-12-04   158  					cpu = <&cpu7>;
068c3d3c83be47 Melody Olvera        2024-12-04   159  				};
068c3d3c83be47 Melody Olvera        2024-12-04   160  			};
068c3d3c83be47 Melody Olvera        2024-12-04   161  		};
068c3d3c83be47 Melody Olvera        2024-12-04   162  
068c3d3c83be47 Melody Olvera        2024-12-04   163  		idle-states {
068c3d3c83be47 Melody Olvera        2024-12-04   164  			entry-method = "psci";
068c3d3c83be47 Melody Olvera        2024-12-04   165  
068c3d3c83be47 Melody Olvera        2024-12-04   166  			cluster0_c4: cpu-sleep-0 {
068c3d3c83be47 Melody Olvera        2024-12-04   167  				compatible = "arm,idle-state";
068c3d3c83be47 Melody Olvera        2024-12-04   168  				idle-state-name = "ret";
068c3d3c83be47 Melody Olvera        2024-12-04   169  				arm,psci-suspend-param = <0x00000004>;
068c3d3c83be47 Melody Olvera        2024-12-04   170  				entry-latency-us = <93>;
068c3d3c83be47 Melody Olvera        2024-12-04   171  				exit-latency-us = <129>;
068c3d3c83be47 Melody Olvera        2024-12-04   172  				min-residency-us = <560>;
068c3d3c83be47 Melody Olvera        2024-12-04   173  			};
068c3d3c83be47 Melody Olvera        2024-12-04   174  
068c3d3c83be47 Melody Olvera        2024-12-04   175  			cluster1_c4: cpu-sleep-1 {
068c3d3c83be47 Melody Olvera        2024-12-04   176  				compatible = "arm,idle-state";
068c3d3c83be47 Melody Olvera        2024-12-04   177  				idle-state-name = "ret";
068c3d3c83be47 Melody Olvera        2024-12-04   178  				arm,psci-suspend-param = <0x00000004>;
068c3d3c83be47 Melody Olvera        2024-12-04   179  				entry-latency-us = <172>;
068c3d3c83be47 Melody Olvera        2024-12-04   180  				exit-latency-us = <130>;
068c3d3c83be47 Melody Olvera        2024-12-04   181  				min-residency-us = <686>;
068c3d3c83be47 Melody Olvera        2024-12-04   182  			};
068c3d3c83be47 Melody Olvera        2024-12-04   183  
068c3d3c83be47 Melody Olvera        2024-12-04   184  		};
068c3d3c83be47 Melody Olvera        2024-12-04   185  
068c3d3c83be47 Melody Olvera        2024-12-04   186  		domain-idle-states {
068c3d3c83be47 Melody Olvera        2024-12-04   187  			cluster_cl5: cluster-sleep-0 {
068c3d3c83be47 Melody Olvera        2024-12-04   188  				compatible = "domain-idle-state";
068c3d3c83be47 Melody Olvera        2024-12-04   189  				arm,psci-suspend-param = <0x01000054>;
068c3d3c83be47 Melody Olvera        2024-12-04   190  				entry-latency-us = <2150>;
068c3d3c83be47 Melody Olvera        2024-12-04   191  				exit-latency-us = <1983>;
068c3d3c83be47 Melody Olvera        2024-12-04   192  				min-residency-us = <9144>;
068c3d3c83be47 Melody Olvera        2024-12-04   193  			};
068c3d3c83be47 Melody Olvera        2024-12-04   194  
068c3d3c83be47 Melody Olvera        2024-12-04   195  			domain_ss3: domain-sleep-0 {
068c3d3c83be47 Melody Olvera        2024-12-04   196  				compatible = "domain-idle-state";
068c3d3c83be47 Melody Olvera        2024-12-04   197  				arm,psci-suspend-param = <0x0200c354>;
068c3d3c83be47 Melody Olvera        2024-12-04   198  				entry-latency-us = <2800>;
068c3d3c83be47 Melody Olvera        2024-12-04   199  				exit-latency-us = <4400>;
068c3d3c83be47 Melody Olvera        2024-12-04   200  				min-residency-us = <10150>;
068c3d3c83be47 Melody Olvera        2024-12-04   201  			};
068c3d3c83be47 Melody Olvera        2024-12-04   202  		};
068c3d3c83be47 Melody Olvera        2024-12-04   203  	};
068c3d3c83be47 Melody Olvera        2024-12-04   204  
068c3d3c83be47 Melody Olvera        2024-12-04   205  	firmware {
068c3d3c83be47 Melody Olvera        2024-12-04   206  		scm: scm {
068c3d3c83be47 Melody Olvera        2024-12-04   207  			compatible = "qcom,scm-sm8750", "qcom,scm";
068c3d3c83be47 Melody Olvera        2024-12-04   208  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   209  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   210  		};
068c3d3c83be47 Melody Olvera        2024-12-04   211  	};
068c3d3c83be47 Melody Olvera        2024-12-04   212  
068c3d3c83be47 Melody Olvera        2024-12-04   213  	clk_virt: interconnect-0 {
068c3d3c83be47 Melody Olvera        2024-12-04   214  		compatible = "qcom,sm8750-clk-virt";
068c3d3c83be47 Melody Olvera        2024-12-04   215  		#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   216  		qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04   217  	};
068c3d3c83be47 Melody Olvera        2024-12-04   218  
068c3d3c83be47 Melody Olvera        2024-12-04   219  	mc_virt: interconnect-1 {
068c3d3c83be47 Melody Olvera        2024-12-04   220  		compatible = "qcom,sm8750-mc-virt";
068c3d3c83be47 Melody Olvera        2024-12-04   221  		#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   222  		qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04   223  	};
068c3d3c83be47 Melody Olvera        2024-12-04   224  
068c3d3c83be47 Melody Olvera        2024-12-04   225  	memory@a0000000 {
068c3d3c83be47 Melody Olvera        2024-12-04   226  		device_type = "memory";
068c3d3c83be47 Melody Olvera        2024-12-04   227  		/* We expect the bootloader to fill in the size */
068c3d3c83be47 Melody Olvera        2024-12-04   228  		reg = <0x0 0xa0000000 0x0 0x0>;
068c3d3c83be47 Melody Olvera        2024-12-04   229  	};
068c3d3c83be47 Melody Olvera        2024-12-04   230  
068c3d3c83be47 Melody Olvera        2024-12-04   231  	pmu {
068c3d3c83be47 Melody Olvera        2024-12-04   232  		compatible = "arm,armv8-pmuv3";
068c3d3c83be47 Melody Olvera        2024-12-04   233  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
068c3d3c83be47 Melody Olvera        2024-12-04   234  	};
068c3d3c83be47 Melody Olvera        2024-12-04   235  
068c3d3c83be47 Melody Olvera        2024-12-04   236  	psci {
068c3d3c83be47 Melody Olvera        2024-12-04   237  		compatible = "arm,psci-1.0";
068c3d3c83be47 Melody Olvera        2024-12-04   238  		method = "smc";
068c3d3c83be47 Melody Olvera        2024-12-04   239  
068c3d3c83be47 Melody Olvera        2024-12-04   240  		cpu_pd0: power-domain-cpu0 {
068c3d3c83be47 Melody Olvera        2024-12-04   241  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   242  			power-domains = <&cluster0_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   243  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   244  		};
068c3d3c83be47 Melody Olvera        2024-12-04   245  
068c3d3c83be47 Melody Olvera        2024-12-04   246  		cpu_pd1: power-domain-cpu1 {
068c3d3c83be47 Melody Olvera        2024-12-04   247  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   248  			power-domains = <&cluster0_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   249  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   250  		};
068c3d3c83be47 Melody Olvera        2024-12-04   251  
068c3d3c83be47 Melody Olvera        2024-12-04   252  		cpu_pd2: power-domain-cpu2 {
068c3d3c83be47 Melody Olvera        2024-12-04   253  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   254  			power-domains = <&cluster0_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   255  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   256  		};
068c3d3c83be47 Melody Olvera        2024-12-04   257  
068c3d3c83be47 Melody Olvera        2024-12-04   258  		cpu_pd3: power-domain-cpu3 {
068c3d3c83be47 Melody Olvera        2024-12-04   259  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   260  			power-domains = <&cluster0_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   261  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   262  		};
068c3d3c83be47 Melody Olvera        2024-12-04   263  
068c3d3c83be47 Melody Olvera        2024-12-04   264  		cpu_pd4: power-domain-cpu4 {
068c3d3c83be47 Melody Olvera        2024-12-04   265  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   266  			power-domains = <&cluster0_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   267  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   268  		};
068c3d3c83be47 Melody Olvera        2024-12-04   269  
068c3d3c83be47 Melody Olvera        2024-12-04   270  		cpu_pd5: power-domain-cpu5 {
068c3d3c83be47 Melody Olvera        2024-12-04   271  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   272  			power-domains = <&cluster0_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   273  			domain-idle-states = <&cluster0_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   274  		};
068c3d3c83be47 Melody Olvera        2024-12-04   275  
068c3d3c83be47 Melody Olvera        2024-12-04   276  		cpu_pd6: power-domain-cpu6 {
068c3d3c83be47 Melody Olvera        2024-12-04   277  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   278  			power-domains = <&cluster1_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   279  			domain-idle-states = <&cluster1_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   280  		};
068c3d3c83be47 Melody Olvera        2024-12-04   281  
068c3d3c83be47 Melody Olvera        2024-12-04   282  		cpu_pd7: power-domain-cpu7 {
068c3d3c83be47 Melody Olvera        2024-12-04   283  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   284  			power-domains = <&cluster1_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   285  			domain-idle-states = <&cluster1_c4>;
068c3d3c83be47 Melody Olvera        2024-12-04   286  		};
068c3d3c83be47 Melody Olvera        2024-12-04   287  
778dc0f876c70b Maulik Shah          2025-02-26   288  		cluster0_pd: power-domain-cluster0 {
778dc0f876c70b Maulik Shah          2025-02-26   289  			#power-domain-cells = <0>;
778dc0f876c70b Maulik Shah          2025-02-26   290  			domain-idle-states = <&cluster_cl5>;
778dc0f876c70b Maulik Shah          2025-02-26   291  			power-domains = <&system_pd>;
778dc0f876c70b Maulik Shah          2025-02-26   292  		};
778dc0f876c70b Maulik Shah          2025-02-26   293  
778dc0f876c70b Maulik Shah          2025-02-26   294  		cluster1_pd: power-domain-cluster1 {
068c3d3c83be47 Melody Olvera        2024-12-04   295  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   296  			domain-idle-states = <&cluster_cl5>;
068c3d3c83be47 Melody Olvera        2024-12-04   297  			power-domains = <&system_pd>;
068c3d3c83be47 Melody Olvera        2024-12-04   298  		};
068c3d3c83be47 Melody Olvera        2024-12-04   299  
068c3d3c83be47 Melody Olvera        2024-12-04   300  		system_pd: power-domain-system {
068c3d3c83be47 Melody Olvera        2024-12-04   301  			#power-domain-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   302  			domain-idle-states = <&domain_ss3>;
068c3d3c83be47 Melody Olvera        2024-12-04   303  		};
068c3d3c83be47 Melody Olvera        2024-12-04   304  	};
068c3d3c83be47 Melody Olvera        2024-12-04   305  
068c3d3c83be47 Melody Olvera        2024-12-04   306  	reserved-memory {
068c3d3c83be47 Melody Olvera        2024-12-04   307  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   308  		#size-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   309  		ranges;
068c3d3c83be47 Melody Olvera        2024-12-04   310  
068c3d3c83be47 Melody Olvera        2024-12-04   311  		gunyah_hyp_mem: gunyah-hyp@80000000 {
068c3d3c83be47 Melody Olvera        2024-12-04   312  			reg = <0x0 0x80000000 0x0 0xe00000>;
068c3d3c83be47 Melody Olvera        2024-12-04   313  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   314  		};
068c3d3c83be47 Melody Olvera        2024-12-04   315  
068c3d3c83be47 Melody Olvera        2024-12-04   316  		cpusys_vm_mem: cpusys-vm-mem@80e00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   317  			reg = <0x0 0x80e00000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera        2024-12-04   318  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   319  		};
068c3d3c83be47 Melody Olvera        2024-12-04   320  
068c3d3c83be47 Melody Olvera        2024-12-04   321  		cpucp_mem: cpucp@81200000 {
068c3d3c83be47 Melody Olvera        2024-12-04   322  			reg = <0x0 0x81200000 0x0 0x200000>;
068c3d3c83be47 Melody Olvera        2024-12-04   323  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   324  		};
068c3d3c83be47 Melody Olvera        2024-12-04   325  
068c3d3c83be47 Melody Olvera        2024-12-04   326  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   327  			reg = <0x0 0x81a00000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera        2024-12-04   328  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   329  		};
068c3d3c83be47 Melody Olvera        2024-12-04   330  
068c3d3c83be47 Melody Olvera        2024-12-04   331  		aop_image_mem: aop-image@81c00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   332  			reg = <0x0 0x81c00000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera        2024-12-04   333  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   334  		};
068c3d3c83be47 Melody Olvera        2024-12-04   335  
068c3d3c83be47 Melody Olvera        2024-12-04   336  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
068c3d3c83be47 Melody Olvera        2024-12-04   337  			compatible = "qcom,cmd-db";
068c3d3c83be47 Melody Olvera        2024-12-04   338  			reg = <0x0 0x81c60000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera        2024-12-04   339  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   340  		};
068c3d3c83be47 Melody Olvera        2024-12-04   341  
068c3d3c83be47 Melody Olvera        2024-12-04   342  		/* Merged aop_config, tme_crash_dump, tme_log and uefi_log regions */
068c3d3c83be47 Melody Olvera        2024-12-04   343  		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
068c3d3c83be47 Melody Olvera        2024-12-04   344  			reg = <0x0 0x81c80000 0x0 0x74000>;
068c3d3c83be47 Melody Olvera        2024-12-04   345  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   346  		};
068c3d3c83be47 Melody Olvera        2024-12-04   347  
068c3d3c83be47 Melody Olvera        2024-12-04   348  		/* Secdata region can be reused by apps */
068c3d3c83be47 Melody Olvera        2024-12-04   349  
068c3d3c83be47 Melody Olvera        2024-12-04   350  		smem_mem: smem@81d00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   351  			compatible = "qcom,smem";
068c3d3c83be47 Melody Olvera        2024-12-04   352  			reg = <0x0 0x81d00000 0x0 0x200000>;
068c3d3c83be47 Melody Olvera        2024-12-04   353  			hwlocks = <&tcsr_mutex 3>;
068c3d3c83be47 Melody Olvera        2024-12-04   354  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   355  		};
068c3d3c83be47 Melody Olvera        2024-12-04   356  
068c3d3c83be47 Melody Olvera        2024-12-04   357  		pdp_ns_shared_mem: pdp-ns-shared@81f00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   358  			reg = <0x0 0x81f00000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera        2024-12-04   359  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   360  		};
068c3d3c83be47 Melody Olvera        2024-12-04   361  
068c3d3c83be47 Melody Olvera        2024-12-04   362  		cpucp_scandump_mem: cpucp-scandump@82000000 {
068c3d3c83be47 Melody Olvera        2024-12-04   363  			reg = <0x0 0x82000000 0x0 0x380000>;
068c3d3c83be47 Melody Olvera        2024-12-04   364  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   365  		};
068c3d3c83be47 Melody Olvera        2024-12-04   366  
068c3d3c83be47 Melody Olvera        2024-12-04   367  		adsp_mhi_mem: adsp-mhi@82380000 {
068c3d3c83be47 Melody Olvera        2024-12-04   368  			reg = <0x0 0x82380000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera        2024-12-04   369  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   370  		};
068c3d3c83be47 Melody Olvera        2024-12-04   371  
068c3d3c83be47 Melody Olvera        2024-12-04   372  		soccp_sdi_mem: soccp-sdi@823a0000 {
068c3d3c83be47 Melody Olvera        2024-12-04   373  			reg = <0x0 0x823a0000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera        2024-12-04   374  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   375  		};
068c3d3c83be47 Melody Olvera        2024-12-04   376  
068c3d3c83be47 Melody Olvera        2024-12-04   377  		pmic_minii_dump_mem: pmic-minii-dump@823e0000 {
068c3d3c83be47 Melody Olvera        2024-12-04   378  			reg = <0x0 0x823e0000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera        2024-12-04   379  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   380  		};
068c3d3c83be47 Melody Olvera        2024-12-04   381  
068c3d3c83be47 Melody Olvera        2024-12-04   382  		pvmfw_mem: pvmfw@824a0000 {
068c3d3c83be47 Melody Olvera        2024-12-04   383  			reg = <0x0 0x824a0000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera        2024-12-04   384  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   385  		};
068c3d3c83be47 Melody Olvera        2024-12-04   386  
068c3d3c83be47 Melody Olvera        2024-12-04   387  		global_sync_mem: global-sync@82600000 {
068c3d3c83be47 Melody Olvera        2024-12-04   388  			reg = <0x0 0x82600000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera        2024-12-04   389  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   390  		};
068c3d3c83be47 Melody Olvera        2024-12-04   391  
068c3d3c83be47 Melody Olvera        2024-12-04   392  		tz_stat_mem: tz-stat@82700000 {
068c3d3c83be47 Melody Olvera        2024-12-04   393  			reg = <0x0 0x82700000 0x0 0x100000>;
068c3d3c83be47 Melody Olvera        2024-12-04   394  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   395  		};
068c3d3c83be47 Melody Olvera        2024-12-04   396  
068c3d3c83be47 Melody Olvera        2024-12-04   397  		qdss_mem: qdss@82800000 {
068c3d3c83be47 Melody Olvera        2024-12-04   398  			reg = <0x0 0x82800000 0x0 0x2000000>;
068c3d3c83be47 Melody Olvera        2024-12-04   399  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   400  		};
068c3d3c83be47 Melody Olvera        2024-12-04   401  
068c3d3c83be47 Melody Olvera        2024-12-04   402  		dsm_partition_1_mem: dsm-partition-1@84a00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   403  			reg = <0x0 0x84a00000 0x0 0x4900000>;
068c3d3c83be47 Melody Olvera        2024-12-04   404  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   405  		};
068c3d3c83be47 Melody Olvera        2024-12-04   406  
068c3d3c83be47 Melody Olvera        2024-12-04   407  		dsm_partition_2_mem: dsm-partition-2@89300000 {
068c3d3c83be47 Melody Olvera        2024-12-04   408  			reg = <0x0 0x89300000 0x0 0xa80000>;
068c3d3c83be47 Melody Olvera        2024-12-04   409  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   410  		};
068c3d3c83be47 Melody Olvera        2024-12-04   411  
068c3d3c83be47 Melody Olvera        2024-12-04   412  		mpss_mem: mpss@8ba00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   413  			reg = <0x0 0x8ba00000 0x0 0xf600000>;
068c3d3c83be47 Melody Olvera        2024-12-04   414  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   415  		};
068c3d3c83be47 Melody Olvera        2024-12-04   416  
068c3d3c83be47 Melody Olvera        2024-12-04   417  		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
068c3d3c83be47 Melody Olvera        2024-12-04   418  			reg = <0x0 0x9b000000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera        2024-12-04   419  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   420  		};
068c3d3c83be47 Melody Olvera        2024-12-04   421  
068c3d3c83be47 Melody Olvera        2024-12-04   422  		ipa_fw_mem: ipa-fw@9b080000 {
068c3d3c83be47 Melody Olvera        2024-12-04   423  			reg = <0x0 0x9b080000 0x0 0x10000>;
068c3d3c83be47 Melody Olvera        2024-12-04   424  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   425  		};
068c3d3c83be47 Melody Olvera        2024-12-04   426  
068c3d3c83be47 Melody Olvera        2024-12-04   427  		ipa_gsi_mem: ipa-gsi@9b090000 {
068c3d3c83be47 Melody Olvera        2024-12-04   428  			reg = <0x0 0x9b090000 0x0 0xa000>;
068c3d3c83be47 Melody Olvera        2024-12-04   429  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   430  		};
068c3d3c83be47 Melody Olvera        2024-12-04   431  
068c3d3c83be47 Melody Olvera        2024-12-04   432  		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
068c3d3c83be47 Melody Olvera        2024-12-04   433  			reg = <0x0 0x9b09a000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera        2024-12-04   434  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   435  		};
068c3d3c83be47 Melody Olvera        2024-12-04   436  
068c3d3c83be47 Melody Olvera        2024-12-04   437  		spss_region_mem: spss@9b0a0000  {
068c3d3c83be47 Melody Olvera        2024-12-04   438  			reg = <0x0 0x9b0a0000 0x0 0x1e0000>;
068c3d3c83be47 Melody Olvera        2024-12-04   439  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   440  		};
068c3d3c83be47 Melody Olvera        2024-12-04   441  
068c3d3c83be47 Melody Olvera        2024-12-04   442  		/* First part of the "SPU secure shared memory" region */
068c3d3c83be47 Melody Olvera        2024-12-04   443  		spu_tz_shared_mem: spu-tz-shared@9b280000 {
068c3d3c83be47 Melody Olvera        2024-12-04   444  			reg = <0x0 0x9b280000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera        2024-12-04   445  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   446  		};
068c3d3c83be47 Melody Olvera        2024-12-04   447  
068c3d3c83be47 Melody Olvera        2024-12-04   448  		/* Second part of the "SPU secure shared memory" region */
068c3d3c83be47 Melody Olvera        2024-12-04   449  		spu_modem_shared_mem: spu-modem-shared@9b2c0000 {
068c3d3c83be47 Melody Olvera        2024-12-04   450  			reg = <0x0 0x9b2c0000 0x0 0x40000>;
068c3d3c83be47 Melody Olvera        2024-12-04   451  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   452  		};
068c3d3c83be47 Melody Olvera        2024-12-04   453  
068c3d3c83be47 Melody Olvera        2024-12-04   454  		camera_mem: camera@9b300000 {
068c3d3c83be47 Melody Olvera        2024-12-04   455  			reg = <0x0 0x9b300000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera        2024-12-04   456  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   457  		};
068c3d3c83be47 Melody Olvera        2024-12-04   458  
068c3d3c83be47 Melody Olvera        2024-12-04   459  		camera_2_mem: camera-2@9bb00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   460  			reg = <0x0 0x9bb00000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera        2024-12-04   461  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   462  		};
068c3d3c83be47 Melody Olvera        2024-12-04   463  
068c3d3c83be47 Melody Olvera        2024-12-04   464  		video_mem: video@9c300000 {
068c3d3c83be47 Melody Olvera        2024-12-04   465  			reg = <0x0 0x9c300000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera        2024-12-04   466  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   467  		};
068c3d3c83be47 Melody Olvera        2024-12-04   468  
068c3d3c83be47 Melody Olvera        2024-12-04   469  		cvp_mem: cvp@9cb00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   470  			reg = <0x0 0x9cb00000 0x0 0x700000>;
068c3d3c83be47 Melody Olvera        2024-12-04   471  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   472  		};
068c3d3c83be47 Melody Olvera        2024-12-04   473  
068c3d3c83be47 Melody Olvera        2024-12-04   474  		cdsp_mem: cdsp@9d200000 {
068c3d3c83be47 Melody Olvera        2024-12-04   475  			reg = <0x0 0x9d200000 0x0 0x1900000>;
068c3d3c83be47 Melody Olvera        2024-12-04   476  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   477  		};
068c3d3c83be47 Melody Olvera        2024-12-04   478  
068c3d3c83be47 Melody Olvera        2024-12-04   479  		q6_cdsp_dtb_mem: q6-cdsp-dtb@9eb00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   480  			reg = <0x0 0x9eb00000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera        2024-12-04   481  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   482  		};
068c3d3c83be47 Melody Olvera        2024-12-04   483  
068c3d3c83be47 Melody Olvera        2024-12-04   484  		soccp_mem: soccp@9ec00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   485  			reg = <0x0 0x9ec00000 0x0 0x180000>;
068c3d3c83be47 Melody Olvera        2024-12-04   486  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   487  		};
068c3d3c83be47 Melody Olvera        2024-12-04   488  
068c3d3c83be47 Melody Olvera        2024-12-04   489  		q6_adsp_dtb_mem: q6-adsp-dtb@9ed80000 {
068c3d3c83be47 Melody Olvera        2024-12-04   490  			reg = <0x0 0x9ed80000 0x0 0x80000>;
068c3d3c83be47 Melody Olvera        2024-12-04   491  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   492  		};
068c3d3c83be47 Melody Olvera        2024-12-04   493  
068c3d3c83be47 Melody Olvera        2024-12-04   494  		adspslpi_mem: adspslpi@9ee00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   495  			reg = <0x0 0x9ee00000 0x0 0x3a80000>;
068c3d3c83be47 Melody Olvera        2024-12-04   496  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   497  		};
068c3d3c83be47 Melody Olvera        2024-12-04   498  
068c3d3c83be47 Melody Olvera        2024-12-04   499  		xbl_ramdump_mem: xbl-ramdump@b8000000 {
068c3d3c83be47 Melody Olvera        2024-12-04   500  			reg = <0x0 0xb8000000 0x0 0x1c0000>;
068c3d3c83be47 Melody Olvera        2024-12-04   501  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   502  		};
068c3d3c83be47 Melody Olvera        2024-12-04   503  
068c3d3c83be47 Melody Olvera        2024-12-04   504  		hwfence_shbuf: hwfence-shbuf@d4e23000 {
068c3d3c83be47 Melody Olvera        2024-12-04   505  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   506  			reg = <0x0 0xd4e23000 0x0 0x2dd000>;
068c3d3c83be47 Melody Olvera        2024-12-04   507  		};
068c3d3c83be47 Melody Olvera        2024-12-04   508  
068c3d3c83be47 Melody Olvera        2024-12-04   509  		/* Merged tz_reserved, xbl_sc, and qtee regions */
068c3d3c83be47 Melody Olvera        2024-12-04   510  		tz_merged_mem: tz-merged@d8000000 {
068c3d3c83be47 Melody Olvera        2024-12-04   511  			reg = <0x0 0xd8000000 0x0 0x600000>;
068c3d3c83be47 Melody Olvera        2024-12-04   512  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   513  		};
068c3d3c83be47 Melody Olvera        2024-12-04   514  
068c3d3c83be47 Melody Olvera        2024-12-04   515  		trust_ui_vm_mem: trust-ui-vm@f3800000 {
068c3d3c83be47 Melody Olvera        2024-12-04   516  			reg = <0x0 0xf3800000 0x0 0x4400000>;
068c3d3c83be47 Melody Olvera        2024-12-04   517  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   518  		};
068c3d3c83be47 Melody Olvera        2024-12-04   519  
068c3d3c83be47 Melody Olvera        2024-12-04   520  		oem_vm_mem: oem-vm@f7c00000 {
068c3d3c83be47 Melody Olvera        2024-12-04   521  			reg = <0x0 0xf7c00000 0x0 0x4c00000>;
068c3d3c83be47 Melody Olvera        2024-12-04   522  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   523  		};
068c3d3c83be47 Melody Olvera        2024-12-04   524  
068c3d3c83be47 Melody Olvera        2024-12-04   525  		llcc_lpi_mem: llcc-lpi@ff800000 {
068c3d3c83be47 Melody Olvera        2024-12-04   526  			reg = <0x0 0xff800000 0x0 0x800000>;
068c3d3c83be47 Melody Olvera        2024-12-04   527  			no-map;
068c3d3c83be47 Melody Olvera        2024-12-04   528  		};
068c3d3c83be47 Melody Olvera        2024-12-04   529  	};
068c3d3c83be47 Melody Olvera        2024-12-04   530  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   531  	smp2p-adsp {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   532  		compatible = "qcom,smp2p";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   533  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   534  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   535  					     IPCC_MPROC_SIGNAL_SMP2P
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   536  					     IRQ_TYPE_EDGE_RISING>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   537  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   538  		mboxes = <&ipcc IPCC_CLIENT_LPASS
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   539  				IPCC_MPROC_SIGNAL_SMP2P>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   540  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   541  		qcom,smem = <443>, <429>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   542  		qcom,local-pid = <0>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   543  		qcom,remote-pid = <2>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   544  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   545  		smp2p_adsp_out: master-kernel {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   546  			qcom,entry-name = "master-kernel";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   547  			#qcom,smem-state-cells = <1>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   548  		};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   549  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   550  		smp2p_adsp_in: slave-kernel {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   551  			qcom,entry-name = "slave-kernel";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   552  			interrupt-controller;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   553  			#interrupt-cells = <2>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   554  		};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   555  	};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   556  
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   557  	smp2p-cdsp {
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   558  		compatible = "qcom,smp2p";
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   559  
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   560  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   561  					     IPCC_MPROC_SIGNAL_SMP2P
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   562  					     IRQ_TYPE_EDGE_RISING>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   563  
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   564  		mboxes = <&ipcc IPCC_CLIENT_CDSP
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   565  				IPCC_MPROC_SIGNAL_SMP2P>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   566  
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   567  		qcom,smem = <94>, <432>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   568  		qcom,local-pid = <0>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   569  		qcom,remote-pid = <5>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   570  
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   571  		smp2p_cdsp_out: master-kernel {
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   572  			qcom,entry-name = "master-kernel";
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   573  			#qcom,smem-state-cells = <1>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   574  		};
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   575  
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   576  		smp2p_cdsp_in: slave-kernel {
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   577  			qcom,entry-name = "slave-kernel";
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   578  			interrupt-controller;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   579  			#interrupt-cells = <2>;
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   580  		};
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   581  	};
58471055ae76f6 Krzysztof Kozlowski  2025-03-12   582  
104790b0699462 Krzysztof Kozlowski  2025-02-21   583  	smp2p-modem {
104790b0699462 Krzysztof Kozlowski  2025-02-21   584  		compatible = "qcom,smp2p";
104790b0699462 Krzysztof Kozlowski  2025-02-21   585  
104790b0699462 Krzysztof Kozlowski  2025-02-21   586  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
104790b0699462 Krzysztof Kozlowski  2025-02-21   587  					     IPCC_MPROC_SIGNAL_SMP2P
104790b0699462 Krzysztof Kozlowski  2025-02-21   588  					     IRQ_TYPE_EDGE_RISING>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   589  
104790b0699462 Krzysztof Kozlowski  2025-02-21   590  		mboxes = <&ipcc IPCC_CLIENT_MPSS
104790b0699462 Krzysztof Kozlowski  2025-02-21   591  				IPCC_MPROC_SIGNAL_SMP2P>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   592  
104790b0699462 Krzysztof Kozlowski  2025-02-21   593  		qcom,smem = <435>, <428>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   594  		qcom,local-pid = <0>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   595  		qcom,remote-pid = <1>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   596  
104790b0699462 Krzysztof Kozlowski  2025-02-21   597  		smp2p_modem_out: master-kernel {
104790b0699462 Krzysztof Kozlowski  2025-02-21   598  			qcom,entry-name = "master-kernel";
104790b0699462 Krzysztof Kozlowski  2025-02-21   599  			#qcom,smem-state-cells = <1>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   600  		};
104790b0699462 Krzysztof Kozlowski  2025-02-21   601  
104790b0699462 Krzysztof Kozlowski  2025-02-21   602  		smp2p_modem_in: slave-kernel {
104790b0699462 Krzysztof Kozlowski  2025-02-21   603  			qcom,entry-name = "slave-kernel";
104790b0699462 Krzysztof Kozlowski  2025-02-21   604  			interrupt-controller;
104790b0699462 Krzysztof Kozlowski  2025-02-21   605  			#interrupt-cells = <2>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   606  		};
104790b0699462 Krzysztof Kozlowski  2025-02-21   607  
104790b0699462 Krzysztof Kozlowski  2025-02-21   608  		ipa_smp2p_out: ipa-ap-to-modem {
104790b0699462 Krzysztof Kozlowski  2025-02-21   609  			qcom,entry-name = "ipa";
104790b0699462 Krzysztof Kozlowski  2025-02-21   610  			#qcom,smem-state-cells = <1>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   611  		};
104790b0699462 Krzysztof Kozlowski  2025-02-21   612  
104790b0699462 Krzysztof Kozlowski  2025-02-21   613  		ipa_smp2p_in: ipa-modem-to-ap {
104790b0699462 Krzysztof Kozlowski  2025-02-21   614  			qcom,entry-name = "ipa";
104790b0699462 Krzysztof Kozlowski  2025-02-21   615  			interrupt-controller;
104790b0699462 Krzysztof Kozlowski  2025-02-21   616  			#interrupt-cells = <2>;
104790b0699462 Krzysztof Kozlowski  2025-02-21   617  		};
104790b0699462 Krzysztof Kozlowski  2025-02-21   618  
104790b0699462 Krzysztof Kozlowski  2025-02-21   619  		/* TODO: smem mailbox in and out */
104790b0699462 Krzysztof Kozlowski  2025-02-21   620  	};
104790b0699462 Krzysztof Kozlowski  2025-02-21   621  
068c3d3c83be47 Melody Olvera        2024-12-04   622  	soc: soc@0 {
068c3d3c83be47 Melody Olvera        2024-12-04   623  		compatible = "simple-bus";
068c3d3c83be47 Melody Olvera        2024-12-04   624  
068c3d3c83be47 Melody Olvera        2024-12-04   625  		#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   626  		#size-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   627  		dma-ranges = <0 0 0 0 0x10 0>;
068c3d3c83be47 Melody Olvera        2024-12-04   628  		ranges = <0 0 0 0 0x10 0>;
068c3d3c83be47 Melody Olvera        2024-12-04   629  
068c3d3c83be47 Melody Olvera        2024-12-04   630  		gcc: clock-controller@100000 {
068c3d3c83be47 Melody Olvera        2024-12-04   631  			compatible = "qcom,sm8750-gcc";
068c3d3c83be47 Melody Olvera        2024-12-04   632  			reg = <0x0 0x00100000 0x0 0x1f4200>;
068c3d3c83be47 Melody Olvera        2024-12-04   633  
068c3d3c83be47 Melody Olvera        2024-12-04   634  			clocks = <&bi_tcxo_div2>,
068c3d3c83be47 Melody Olvera        2024-12-04   635  				 <0>,
068c3d3c83be47 Melody Olvera        2024-12-04   636  				 <&sleep_clk>,
068c3d3c83be47 Melody Olvera        2024-12-04   637  				 <0>,
068c3d3c83be47 Melody Olvera        2024-12-04   638  				 <0>,
068c3d3c83be47 Melody Olvera        2024-12-04   639  				 <0>,
068c3d3c83be47 Melody Olvera        2024-12-04   640  				 <0>,
068c3d3c83be47 Melody Olvera        2024-12-04   641  				 <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   642  
068c3d3c83be47 Melody Olvera        2024-12-04   643  			#clock-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   644  			#reset-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   645  			#power-domain-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   646  		};
068c3d3c83be47 Melody Olvera        2024-12-04   647  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   648  		ipcc: mailbox@406000 {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   649  			compatible = "qcom,sm8750-ipcc", "qcom,ipcc";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   650  			reg = <0x0 0x00406000 0x0 0x1000>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   651  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   652  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   653  			interrupt-controller;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   654  			#interrupt-cells = <3>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   655  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   656  			#mbox-cells = <2>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   657  		};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12   658  
068c3d3c83be47 Melody Olvera        2024-12-04   659  		gpi_dma2: dma-controller@800000 {
068c3d3c83be47 Melody Olvera        2024-12-04   660  			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
068c3d3c83be47 Melody Olvera        2024-12-04   661  			reg = <0x0 0x00800000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera        2024-12-04   662  
068c3d3c83be47 Melody Olvera        2024-12-04   663  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   664  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   665  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   666  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   667  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   668  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   669  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   670  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   671  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   672  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   673  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04   674  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   675  
068c3d3c83be47 Melody Olvera        2024-12-04   676  			dma-channels = <12>;
068c3d3c83be47 Melody Olvera        2024-12-04   677  			dma-channel-mask = <0x1e>;
068c3d3c83be47 Melody Olvera        2024-12-04   678  			#dma-cells = <3>;
068c3d3c83be47 Melody Olvera        2024-12-04   679  
068c3d3c83be47 Melody Olvera        2024-12-04   680  			iommus = <&apps_smmu 0x436 0x0>;
068c3d3c83be47 Melody Olvera        2024-12-04   681  
068c3d3c83be47 Melody Olvera        2024-12-04   682  			status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   683  		};
068c3d3c83be47 Melody Olvera        2024-12-04   684  
068c3d3c83be47 Melody Olvera        2024-12-04   685  		qupv3_2: geniqup@8c0000 {
068c3d3c83be47 Melody Olvera        2024-12-04   686  			compatible = "qcom,geni-se-qup";
068c3d3c83be47 Melody Olvera        2024-12-04   687  			reg = <0x0 0x008c0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera        2024-12-04   688  
068c3d3c83be47 Melody Olvera        2024-12-04   689  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04   690  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   691  			clock-names = "m-ahb",
068c3d3c83be47 Melody Olvera        2024-12-04   692  				      "s-ahb";
068c3d3c83be47 Melody Olvera        2024-12-04   693  
068c3d3c83be47 Melody Olvera        2024-12-04   694  			iommus = <&apps_smmu 0x423 0x0>;
068c3d3c83be47 Melody Olvera        2024-12-04   695  
068c3d3c83be47 Melody Olvera        2024-12-04   696  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   697  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04   698  			ranges;
068c3d3c83be47 Melody Olvera        2024-12-04   699  
068c3d3c83be47 Melody Olvera        2024-12-04   700  			status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   701  
068c3d3c83be47 Melody Olvera        2024-12-04   702  			i2c8: i2c@880000 {
068c3d3c83be47 Melody Olvera        2024-12-04   703  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04   704  				reg = <0x0 0x00880000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   705  
068c3d3c83be47 Melody Olvera        2024-12-04   706  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   707  
068c3d3c83be47 Melody Olvera        2024-12-04   708  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   709  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   710  
068c3d3c83be47 Melody Olvera        2024-12-04   711  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   712  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   713  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   714  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   715  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   716  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   717  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   718  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   719  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   720  
068c3d3c83be47 Melody Olvera        2024-12-04   721  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04   722  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04   723  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   724  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   725  
068c3d3c83be47 Melody Olvera        2024-12-04   726  				pinctrl-0 = <&qup_i2c8_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04   727  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   728  
068c3d3c83be47 Melody Olvera        2024-12-04   729  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   730  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   731  
068c3d3c83be47 Melody Olvera        2024-12-04   732  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   733  			};
068c3d3c83be47 Melody Olvera        2024-12-04   734  
068c3d3c83be47 Melody Olvera        2024-12-04   735  			spi8: spi@880000 {
068c3d3c83be47 Melody Olvera        2024-12-04   736  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04   737  				reg = <0x0 0x00880000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   738  
068c3d3c83be47 Melody Olvera        2024-12-04   739  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   740  
068c3d3c83be47 Melody Olvera        2024-12-04   741  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   742  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   743  
068c3d3c83be47 Melody Olvera        2024-12-04   744  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   745  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   746  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   747  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   748  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   749  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   750  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   751  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   752  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   753  
068c3d3c83be47 Melody Olvera        2024-12-04   754  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04   755  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04   756  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   757  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   758  
068c3d3c83be47 Melody Olvera        2024-12-04   759  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04   760  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   761  
068c3d3c83be47 Melody Olvera        2024-12-04   762  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   763  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   764  
068c3d3c83be47 Melody Olvera        2024-12-04   765  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   766  			};
068c3d3c83be47 Melody Olvera        2024-12-04   767  
068c3d3c83be47 Melody Olvera        2024-12-04   768  			i2c9: i2c@884000 {
068c3d3c83be47 Melody Olvera        2024-12-04   769  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04   770  				reg = <0x0 0x00884000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   771  
068c3d3c83be47 Melody Olvera        2024-12-04   772  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   773  
068c3d3c83be47 Melody Olvera        2024-12-04   774  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   775  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   776  
068c3d3c83be47 Melody Olvera        2024-12-04   777  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   778  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   779  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   780  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   781  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   782  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   783  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   784  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   785  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   786  
068c3d3c83be47 Melody Olvera        2024-12-04   787  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04   788  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04   789  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   790  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   791  
068c3d3c83be47 Melody Olvera        2024-12-04   792  				pinctrl-0 = <&qup_i2c9_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04   793  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   794  
068c3d3c83be47 Melody Olvera        2024-12-04   795  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   796  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   797  
068c3d3c83be47 Melody Olvera        2024-12-04   798  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   799  			};
068c3d3c83be47 Melody Olvera        2024-12-04   800  
068c3d3c83be47 Melody Olvera        2024-12-04   801  			spi9: spi@884000 {
068c3d3c83be47 Melody Olvera        2024-12-04   802  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04   803  				reg = <0x0 0x00884000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   804  
068c3d3c83be47 Melody Olvera        2024-12-04   805  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   806  
068c3d3c83be47 Melody Olvera        2024-12-04   807  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   808  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   809  
068c3d3c83be47 Melody Olvera        2024-12-04   810  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   811  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   812  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   813  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   814  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   815  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   816  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   817  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   818  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   819  
068c3d3c83be47 Melody Olvera        2024-12-04   820  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04   821  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04   822  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   823  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   824  
068c3d3c83be47 Melody Olvera        2024-12-04   825  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04   826  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   827  
068c3d3c83be47 Melody Olvera        2024-12-04   828  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   829  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   830  
068c3d3c83be47 Melody Olvera        2024-12-04   831  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   832  			};
068c3d3c83be47 Melody Olvera        2024-12-04   833  
068c3d3c83be47 Melody Olvera        2024-12-04   834  			i2c10: i2c@888000 {
068c3d3c83be47 Melody Olvera        2024-12-04   835  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04   836  				reg = <0x0 0x00888000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   837  
068c3d3c83be47 Melody Olvera        2024-12-04   838  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   839  
068c3d3c83be47 Melody Olvera        2024-12-04   840  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   841  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   842  
068c3d3c83be47 Melody Olvera        2024-12-04   843  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   844  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   845  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   846  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   847  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   848  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   849  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   850  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   851  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   852  
068c3d3c83be47 Melody Olvera        2024-12-04   853  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04   854  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04   855  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   856  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   857  
068c3d3c83be47 Melody Olvera        2024-12-04   858  				pinctrl-0 = <&qup_i2c10_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04   859  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   860  
068c3d3c83be47 Melody Olvera        2024-12-04   861  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   862  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   863  
068c3d3c83be47 Melody Olvera        2024-12-04   864  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   865  			};
068c3d3c83be47 Melody Olvera        2024-12-04   866  
068c3d3c83be47 Melody Olvera        2024-12-04   867  			spi10: spi@888000 {
068c3d3c83be47 Melody Olvera        2024-12-04   868  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04   869  				reg = <0x0 0x00888000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   870  
068c3d3c83be47 Melody Olvera        2024-12-04   871  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   872  
068c3d3c83be47 Melody Olvera        2024-12-04   873  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   874  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   875  
068c3d3c83be47 Melody Olvera        2024-12-04   876  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   877  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   878  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   879  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   880  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   881  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   882  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   883  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   884  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   885  
068c3d3c83be47 Melody Olvera        2024-12-04   886  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04   887  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04   888  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   889  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   890  
068c3d3c83be47 Melody Olvera        2024-12-04   891  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04   892  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   893  
068c3d3c83be47 Melody Olvera        2024-12-04   894  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   895  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   896  
068c3d3c83be47 Melody Olvera        2024-12-04   897  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   898  			};
068c3d3c83be47 Melody Olvera        2024-12-04   899  
068c3d3c83be47 Melody Olvera        2024-12-04   900  			i2c11: i2c@88c000 {
068c3d3c83be47 Melody Olvera        2024-12-04   901  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04   902  				reg = <0x0 0x0088c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   903  
068c3d3c83be47 Melody Olvera        2024-12-04   904  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   905  
068c3d3c83be47 Melody Olvera        2024-12-04   906  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   907  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   908  
068c3d3c83be47 Melody Olvera        2024-12-04   909  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   910  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   911  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   912  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   913  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   914  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   915  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   916  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   917  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   918  
068c3d3c83be47 Melody Olvera        2024-12-04   919  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04   920  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04   921  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   922  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   923  
068c3d3c83be47 Melody Olvera        2024-12-04   924  				pinctrl-0 = <&qup_i2c11_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04   925  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   926  
068c3d3c83be47 Melody Olvera        2024-12-04   927  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   928  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   929  
068c3d3c83be47 Melody Olvera        2024-12-04   930  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   931  			};
068c3d3c83be47 Melody Olvera        2024-12-04   932  
068c3d3c83be47 Melody Olvera        2024-12-04   933  			spi11: spi@88c000 {
068c3d3c83be47 Melody Olvera        2024-12-04   934  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04   935  				reg = <0x0 0x0088c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   936  
068c3d3c83be47 Melody Olvera        2024-12-04   937  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   938  
068c3d3c83be47 Melody Olvera        2024-12-04   939  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   940  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   941  
068c3d3c83be47 Melody Olvera        2024-12-04   942  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   943  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   944  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   945  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   946  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   947  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   948  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   949  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   950  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   951  
068c3d3c83be47 Melody Olvera        2024-12-04   952  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04   953  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04   954  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   955  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   956  
068c3d3c83be47 Melody Olvera        2024-12-04   957  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04   958  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   959  
068c3d3c83be47 Melody Olvera        2024-12-04   960  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   961  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   962  
068c3d3c83be47 Melody Olvera        2024-12-04   963  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   964  			};
068c3d3c83be47 Melody Olvera        2024-12-04   965  
068c3d3c83be47 Melody Olvera        2024-12-04   966  			i2c12: i2c@890000 {
068c3d3c83be47 Melody Olvera        2024-12-04   967  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04   968  				reg = <0x0 0x00890000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04   969  
068c3d3c83be47 Melody Olvera        2024-12-04   970  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04   971  
068c3d3c83be47 Melody Olvera        2024-12-04   972  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04   973  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04   974  
068c3d3c83be47 Melody Olvera        2024-12-04   975  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   976  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   977  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   978  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04   979  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04   980  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04   981  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04   982  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04   983  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04   984  
068c3d3c83be47 Melody Olvera        2024-12-04   985  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04   986  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04   987  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04   988  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04   989  
068c3d3c83be47 Melody Olvera        2024-12-04   990  				pinctrl-0 = <&qup_i2c12_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04   991  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04   992  
068c3d3c83be47 Melody Olvera        2024-12-04   993  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04   994  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04   995  
068c3d3c83be47 Melody Olvera        2024-12-04   996  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04   997  			};
068c3d3c83be47 Melody Olvera        2024-12-04   998  
068c3d3c83be47 Melody Olvera        2024-12-04   999  			spi12: spi@890000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1000  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1001  				reg = <0x0 0x00890000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1002  
068c3d3c83be47 Melody Olvera        2024-12-04  1003  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1004  
068c3d3c83be47 Melody Olvera        2024-12-04  1005  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1006  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1007  
068c3d3c83be47 Melody Olvera        2024-12-04  1008  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1009  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1010  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1011  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1012  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1013  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1014  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1015  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1016  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1017  
068c3d3c83be47 Melody Olvera        2024-12-04  1018  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1019  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1020  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1021  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1022  
068c3d3c83be47 Melody Olvera        2024-12-04  1023  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1024  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1025  
068c3d3c83be47 Melody Olvera        2024-12-04  1026  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1027  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1028  
068c3d3c83be47 Melody Olvera        2024-12-04  1029  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1030  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1031  
068c3d3c83be47 Melody Olvera        2024-12-04  1032  			i2c13: i2c@894000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1033  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1034  				reg = <0x0 0x00894000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1035  
068c3d3c83be47 Melody Olvera        2024-12-04  1036  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1037  
068c3d3c83be47 Melody Olvera        2024-12-04  1038  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1039  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1040  
068c3d3c83be47 Melody Olvera        2024-12-04  1041  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1042  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1043  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1044  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1045  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1046  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1047  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1048  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1049  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1050  
068c3d3c83be47 Melody Olvera        2024-12-04  1051  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1052  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1053  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1054  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1055  
068c3d3c83be47 Melody Olvera        2024-12-04  1056  				pinctrl-0 = <&qup_i2c13_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1057  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1058  
068c3d3c83be47 Melody Olvera        2024-12-04  1059  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1060  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1061  
068c3d3c83be47 Melody Olvera        2024-12-04  1062  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1063  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1064  
068c3d3c83be47 Melody Olvera        2024-12-04  1065  			spi13: spi@894000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1066  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1067  				reg = <0x0 0x00894000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1068  
068c3d3c83be47 Melody Olvera        2024-12-04  1069  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1070  
068c3d3c83be47 Melody Olvera        2024-12-04  1071  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1072  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1073  
068c3d3c83be47 Melody Olvera        2024-12-04  1074  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1075  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1076  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1077  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1078  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1079  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1080  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1081  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1082  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1083  
068c3d3c83be47 Melody Olvera        2024-12-04  1084  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1085  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1086  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1087  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1088  
068c3d3c83be47 Melody Olvera        2024-12-04  1089  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1090  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1091  
068c3d3c83be47 Melody Olvera        2024-12-04  1092  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1093  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1094  
068c3d3c83be47 Melody Olvera        2024-12-04  1095  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1096  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1097  
068c3d3c83be47 Melody Olvera        2024-12-04  1098  			uart14: serial@898000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1099  				compatible = "qcom,geni-uart";
068c3d3c83be47 Melody Olvera        2024-12-04  1100  				reg = <0x0 0x00898000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1101  
068c3d3c83be47 Melody Olvera        2024-12-04  1102  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1103  
515551e65635b9 Jyothi Kumar Seerapu 2025-03-12  1104  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1105  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1106  
068c3d3c83be47 Melody Olvera        2024-12-04  1107  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1108  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1109  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1110  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1111  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1112  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1113  
068c3d3c83be47 Melody Olvera        2024-12-04  1114  				pinctrl-0 = <&qup_uart14_default>;
068c3d3c83be47 Melody Olvera        2024-12-04  1115  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1116  
068c3d3c83be47 Melody Olvera        2024-12-04  1117  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1118  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1119  
068c3d3c83be47 Melody Olvera        2024-12-04  1120  			i2c15: i2c@89c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1121  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1122  				reg = <0x0 0x0089c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1123  
068c3d3c83be47 Melody Olvera        2024-12-04  1124  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1125  
068c3d3c83be47 Melody Olvera        2024-12-04  1126  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1127  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1128  
068c3d3c83be47 Melody Olvera        2024-12-04  1129  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1130  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1131  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1132  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1133  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1134  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1135  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1136  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1137  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1138  
068c3d3c83be47 Melody Olvera        2024-12-04  1139  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1140  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1141  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1142  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1143  
068c3d3c83be47 Melody Olvera        2024-12-04  1144  				pinctrl-0 = <&qup_i2c15_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1145  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1146  
068c3d3c83be47 Melody Olvera        2024-12-04  1147  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1148  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1149  
068c3d3c83be47 Melody Olvera        2024-12-04  1150  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1151  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1152  
068c3d3c83be47 Melody Olvera        2024-12-04  1153  			spi15: spi@89c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1154  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1155  				reg = <0x0 0x0089c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1156  
068c3d3c83be47 Melody Olvera        2024-12-04  1157  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1158  
068c3d3c83be47 Melody Olvera        2024-12-04  1159  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1160  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1161  
068c3d3c83be47 Melody Olvera        2024-12-04  1162  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1163  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1164  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1165  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1166  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1167  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1168  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1169  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1170  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1171  
068c3d3c83be47 Melody Olvera        2024-12-04  1172  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1173  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1174  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1175  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1176  
068c3d3c83be47 Melody Olvera        2024-12-04  1177  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1178  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1179  
068c3d3c83be47 Melody Olvera        2024-12-04  1180  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1181  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1182  
068c3d3c83be47 Melody Olvera        2024-12-04  1183  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1184  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1185  		};
068c3d3c83be47 Melody Olvera        2024-12-04  1186  
068c3d3c83be47 Melody Olvera        2024-12-04  1187  		i2c_master_hub_0: geniqup@9c0000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1188  			compatible = "qcom,geni-se-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1189  			reg = <0x0 0x009c0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1190  
068c3d3c83be47 Melody Olvera        2024-12-04  1191  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1192  			clock-names = "s-ahb";
068c3d3c83be47 Melody Olvera        2024-12-04  1193  
068c3d3c83be47 Melody Olvera        2024-12-04  1194  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  1195  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  1196  			ranges;
068c3d3c83be47 Melody Olvera        2024-12-04  1197  
068c3d3c83be47 Melody Olvera        2024-12-04  1198  			status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1199  
068c3d3c83be47 Melody Olvera        2024-12-04  1200  			i2c_hub_0: i2c@980000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1201  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1202  				reg = <0x0 0x00980000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1203  
068c3d3c83be47 Melody Olvera        2024-12-04  1204  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1205  
068c3d3c83be47 Melody Olvera        2024-12-04  1206  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1207  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1208  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1209  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1210  
068c3d3c83be47 Melody Olvera        2024-12-04  1211  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1212  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1213  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1214  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1215  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1216  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1217  
068c3d3c83be47 Melody Olvera        2024-12-04  1218  				pinctrl-0 = <&hub_i2c0_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1219  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1220  
068c3d3c83be47 Melody Olvera        2024-12-04  1221  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1222  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1223  
068c3d3c83be47 Melody Olvera        2024-12-04  1224  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1225  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1226  
068c3d3c83be47 Melody Olvera        2024-12-04  1227  			i2c_hub_1: i2c@984000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1228  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1229  				reg = <0x0 0x00984000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1230  
068c3d3c83be47 Melody Olvera        2024-12-04  1231  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1232  
068c3d3c83be47 Melody Olvera        2024-12-04  1233  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1234  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1235  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1236  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1237  
068c3d3c83be47 Melody Olvera        2024-12-04  1238  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1239  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1240  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1241  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1242  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1243  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1244  
068c3d3c83be47 Melody Olvera        2024-12-04  1245  				pinctrl-0 = <&hub_i2c1_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1246  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1247  
068c3d3c83be47 Melody Olvera        2024-12-04  1248  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1249  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1250  
068c3d3c83be47 Melody Olvera        2024-12-04  1251  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1252  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1253  
068c3d3c83be47 Melody Olvera        2024-12-04  1254  			i2c_hub_2: i2c@988000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1255  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1256  				reg = <0x0 0x00988000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1257  
068c3d3c83be47 Melody Olvera        2024-12-04  1258  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1259  
068c3d3c83be47 Melody Olvera        2024-12-04  1260  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1261  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1262  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1263  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1264  
068c3d3c83be47 Melody Olvera        2024-12-04  1265  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1266  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1267  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1268  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1269  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1270  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1271  
068c3d3c83be47 Melody Olvera        2024-12-04  1272  				pinctrl-0 = <&hub_i2c2_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1273  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1274  
068c3d3c83be47 Melody Olvera        2024-12-04  1275  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1276  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1277  
068c3d3c83be47 Melody Olvera        2024-12-04  1278  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1279  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1280  
068c3d3c83be47 Melody Olvera        2024-12-04  1281  			i2c_hub_3: i2c@98c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1282  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1283  				reg = <0x0 0x0098c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1284  
068c3d3c83be47 Melody Olvera        2024-12-04  1285  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1286  
068c3d3c83be47 Melody Olvera        2024-12-04  1287  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1288  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1289  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1290  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1291  
068c3d3c83be47 Melody Olvera        2024-12-04  1292  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1293  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1294  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1295  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1296  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1297  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1298  
068c3d3c83be47 Melody Olvera        2024-12-04  1299  				pinctrl-0 = <&hub_i2c3_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1300  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1301  
068c3d3c83be47 Melody Olvera        2024-12-04  1302  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1303  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1304  
068c3d3c83be47 Melody Olvera        2024-12-04  1305  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1306  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1307  
068c3d3c83be47 Melody Olvera        2024-12-04  1308  			i2c_hub_4: i2c@990000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1309  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1310  				reg = <0x0 0x00990000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1311  
068c3d3c83be47 Melody Olvera        2024-12-04  1312  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1313  
068c3d3c83be47 Melody Olvera        2024-12-04  1314  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1315  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1316  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1317  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1318  
068c3d3c83be47 Melody Olvera        2024-12-04  1319  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1320  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1321  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1322  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1323  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1324  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1325  
068c3d3c83be47 Melody Olvera        2024-12-04  1326  				pinctrl-0 = <&hub_i2c4_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1327  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1328  
068c3d3c83be47 Melody Olvera        2024-12-04  1329  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1330  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1331  
068c3d3c83be47 Melody Olvera        2024-12-04  1332  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1333  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1334  
068c3d3c83be47 Melody Olvera        2024-12-04  1335  			i2c_hub_5: i2c@994000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1336  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1337  				reg = <0x0 0x00994000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1338  
068c3d3c83be47 Melody Olvera        2024-12-04  1339  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1340  
068c3d3c83be47 Melody Olvera        2024-12-04  1341  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1342  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1343  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1344  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1345  
068c3d3c83be47 Melody Olvera        2024-12-04  1346  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1347  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1348  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1349  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1350  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1351  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1352  
068c3d3c83be47 Melody Olvera        2024-12-04  1353  				pinctrl-0 = <&hub_i2c5_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1354  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1355  
068c3d3c83be47 Melody Olvera        2024-12-04  1356  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1357  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1358  
068c3d3c83be47 Melody Olvera        2024-12-04  1359  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1360  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1361  
068c3d3c83be47 Melody Olvera        2024-12-04  1362  			i2c_hub_6: i2c@998000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1363  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1364  				reg = <0x0 0x00998000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1365  
068c3d3c83be47 Melody Olvera        2024-12-04  1366  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1367  
068c3d3c83be47 Melody Olvera        2024-12-04  1368  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1369  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1370  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1371  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1372  
068c3d3c83be47 Melody Olvera        2024-12-04  1373  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1374  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1375  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1376  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1377  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1378  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1379  
068c3d3c83be47 Melody Olvera        2024-12-04  1380  				pinctrl-0 = <&hub_i2c6_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1381  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1382  
068c3d3c83be47 Melody Olvera        2024-12-04  1383  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1384  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1385  
068c3d3c83be47 Melody Olvera        2024-12-04  1386  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1387  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1388  
068c3d3c83be47 Melody Olvera        2024-12-04  1389  			i2c_hub_7: i2c@99c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1390  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1391  				reg = <0x0 0x0099c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1392  
068c3d3c83be47 Melody Olvera        2024-12-04  1393  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1394  
068c3d3c83be47 Melody Olvera        2024-12-04  1395  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1396  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1397  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1398  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1399  
068c3d3c83be47 Melody Olvera        2024-12-04  1400  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1401  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1402  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1403  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1404  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1405  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1406  
068c3d3c83be47 Melody Olvera        2024-12-04  1407  				pinctrl-0 = <&hub_i2c7_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1408  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1409  
068c3d3c83be47 Melody Olvera        2024-12-04  1410  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1411  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1412  
068c3d3c83be47 Melody Olvera        2024-12-04  1413  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1414  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1415  
068c3d3c83be47 Melody Olvera        2024-12-04  1416  			i2c_hub_8: i2c@9a0000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1417  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1418  				reg = <0x0 0x009a0000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1419  
068c3d3c83be47 Melody Olvera        2024-12-04  1420  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1421  
068c3d3c83be47 Melody Olvera        2024-12-04  1422  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1423  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1424  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1425  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1426  
068c3d3c83be47 Melody Olvera        2024-12-04  1427  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1428  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1429  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1430  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1431  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1432  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1433  
068c3d3c83be47 Melody Olvera        2024-12-04  1434  				pinctrl-0 = <&hub_i2c8_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1435  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1436  
068c3d3c83be47 Melody Olvera        2024-12-04  1437  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1438  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1439  
068c3d3c83be47 Melody Olvera        2024-12-04  1440  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1441  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1442  
068c3d3c83be47 Melody Olvera        2024-12-04  1443  			i2c_hub_9: i2c@9a4000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1444  				compatible = "qcom,geni-i2c-master-hub";
068c3d3c83be47 Melody Olvera        2024-12-04  1445  				reg = <0x0 0x009a4000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1446  
068c3d3c83be47 Melody Olvera        2024-12-04  1447  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1448  
068c3d3c83be47 Melody Olvera        2024-12-04  1449  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1450  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1451  				clock-names = "se",
068c3d3c83be47 Melody Olvera        2024-12-04  1452  					      "core";
068c3d3c83be47 Melody Olvera        2024-12-04  1453  
068c3d3c83be47 Melody Olvera        2024-12-04  1454  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1455  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1456  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1457  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1458  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1459  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1460  
068c3d3c83be47 Melody Olvera        2024-12-04  1461  				pinctrl-0 = <&hub_i2c9_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1462  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1463  
068c3d3c83be47 Melody Olvera        2024-12-04  1464  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1465  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1466  
068c3d3c83be47 Melody Olvera        2024-12-04  1467  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1468  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1469  		};
068c3d3c83be47 Melody Olvera        2024-12-04  1470  
068c3d3c83be47 Melody Olvera        2024-12-04  1471  		gpi_dma1: dma-controller@a00000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1472  			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
068c3d3c83be47 Melody Olvera        2024-12-04  1473  			reg = <0x0 0x00a00000 0x0 0x60000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1474  
068c3d3c83be47 Melody Olvera        2024-12-04  1475  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1476  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1477  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1478  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1479  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1480  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1481  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1482  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1483  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1484  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1485  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
068c3d3c83be47 Melody Olvera        2024-12-04  1486  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1487  
068c3d3c83be47 Melody Olvera        2024-12-04  1488  			dma-channels = <12>;
068c3d3c83be47 Melody Olvera        2024-12-04  1489  			dma-channel-mask = <0x1e>;
068c3d3c83be47 Melody Olvera        2024-12-04  1490  			#dma-cells = <3>;
068c3d3c83be47 Melody Olvera        2024-12-04  1491  
068c3d3c83be47 Melody Olvera        2024-12-04  1492  			iommus = <&apps_smmu 0xb6 0x0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1493  
068c3d3c83be47 Melody Olvera        2024-12-04  1494  			status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1495  		};
068c3d3c83be47 Melody Olvera        2024-12-04  1496  
068c3d3c83be47 Melody Olvera        2024-12-04  1497  		qupv3_1: geniqup@ac0000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1498  			compatible = "qcom,geni-se-qup";
068c3d3c83be47 Melody Olvera        2024-12-04  1499  			reg = <0x0 0x00ac0000 0x0 0x2000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1500  
068c3d3c83be47 Melody Olvera        2024-12-04  1501  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  1502  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1503  			clock-names = "m-ahb",
068c3d3c83be47 Melody Olvera        2024-12-04  1504  				      "s-ahb";
068c3d3c83be47 Melody Olvera        2024-12-04  1505  
068c3d3c83be47 Melody Olvera        2024-12-04  1506  			iommus = <&apps_smmu 0xa3 0x0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1507  
068c3d3c83be47 Melody Olvera        2024-12-04  1508  			#address-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  1509  			#size-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  1510  			ranges;
068c3d3c83be47 Melody Olvera        2024-12-04  1511  
068c3d3c83be47 Melody Olvera        2024-12-04  1512  			status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1513  
068c3d3c83be47 Melody Olvera        2024-12-04  1514  			i2c0: i2c@a80000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1515  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1516  				reg = <0x0 0x00a80000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1517  
068c3d3c83be47 Melody Olvera        2024-12-04  1518  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1519  
068c3d3c83be47 Melody Olvera        2024-12-04  1520  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1521  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1522  
068c3d3c83be47 Melody Olvera        2024-12-04  1523  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1524  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1525  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1526  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1527  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1528  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1529  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1530  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1531  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1532  
068c3d3c83be47 Melody Olvera        2024-12-04  1533  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1534  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1535  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1536  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1537  
068c3d3c83be47 Melody Olvera        2024-12-04  1538  				pinctrl-0 = <&qup_i2c0_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1539  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1540  
068c3d3c83be47 Melody Olvera        2024-12-04  1541  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1542  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1543  
068c3d3c83be47 Melody Olvera        2024-12-04  1544  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1545  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1546  
068c3d3c83be47 Melody Olvera        2024-12-04  1547  			spi0: spi@a80000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1548  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1549  				reg = <0x0 0x00a80000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1550  
068c3d3c83be47 Melody Olvera        2024-12-04  1551  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1552  
068c3d3c83be47 Melody Olvera        2024-12-04  1553  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1554  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1555  
068c3d3c83be47 Melody Olvera        2024-12-04  1556  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1557  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1558  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1559  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1560  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1561  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1562  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1563  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1564  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1565  
068c3d3c83be47 Melody Olvera        2024-12-04  1566  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1567  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1568  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1569  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1570  
068c3d3c83be47 Melody Olvera        2024-12-04  1571  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1572  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1573  
068c3d3c83be47 Melody Olvera        2024-12-04  1574  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1575  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1576  
068c3d3c83be47 Melody Olvera        2024-12-04  1577  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1578  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1579  
068c3d3c83be47 Melody Olvera        2024-12-04  1580  			i2c1: i2c@a84000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1581  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1582  				reg = <0x0 0x00a84000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1583  
068c3d3c83be47 Melody Olvera        2024-12-04  1584  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1585  
068c3d3c83be47 Melody Olvera        2024-12-04  1586  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1587  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1588  
068c3d3c83be47 Melody Olvera        2024-12-04  1589  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1590  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1591  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1592  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1593  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1594  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1595  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1596  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1597  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1598  
068c3d3c83be47 Melody Olvera        2024-12-04  1599  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1600  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1601  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1602  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1603  
068c3d3c83be47 Melody Olvera        2024-12-04  1604  				pinctrl-0 = <&qup_i2c1_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1605  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1606  
068c3d3c83be47 Melody Olvera        2024-12-04  1607  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1608  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1609  
068c3d3c83be47 Melody Olvera        2024-12-04  1610  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1611  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1612  
068c3d3c83be47 Melody Olvera        2024-12-04  1613  			spi1: spi@a84000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1614  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1615  				reg = <0x0 0x00a84000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1616  
068c3d3c83be47 Melody Olvera        2024-12-04  1617  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1618  
068c3d3c83be47 Melody Olvera        2024-12-04  1619  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1620  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1621  
068c3d3c83be47 Melody Olvera        2024-12-04  1622  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1623  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1624  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1625  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1626  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1627  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1628  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1629  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1630  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1631  
068c3d3c83be47 Melody Olvera        2024-12-04  1632  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1633  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1634  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1635  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1636  
068c3d3c83be47 Melody Olvera        2024-12-04  1637  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1638  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1639  
068c3d3c83be47 Melody Olvera        2024-12-04  1640  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1641  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1642  
068c3d3c83be47 Melody Olvera        2024-12-04  1643  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1644  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1645  
068c3d3c83be47 Melody Olvera        2024-12-04  1646  			i2c2: i2c@a88000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1647  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1648  				reg = <0x0 0x00a88000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1649  
068c3d3c83be47 Melody Olvera        2024-12-04  1650  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1651  
068c3d3c83be47 Melody Olvera        2024-12-04  1652  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1653  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1654  
068c3d3c83be47 Melody Olvera        2024-12-04  1655  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1656  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1657  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1658  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1659  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1660  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1661  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1662  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1663  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1664  
068c3d3c83be47 Melody Olvera        2024-12-04  1665  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1666  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1667  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1668  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1669  
068c3d3c83be47 Melody Olvera        2024-12-04  1670  				pinctrl-0 = <&qup_i2c2_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1671  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1672  
068c3d3c83be47 Melody Olvera        2024-12-04  1673  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1674  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1675  
068c3d3c83be47 Melody Olvera        2024-12-04  1676  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1677  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1678  
068c3d3c83be47 Melody Olvera        2024-12-04  1679  			spi2: spi@a88000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1680  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1681  				reg = <0x0 0x00a88000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1682  
068c3d3c83be47 Melody Olvera        2024-12-04  1683  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1684  
068c3d3c83be47 Melody Olvera        2024-12-04  1685  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1686  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1687  
068c3d3c83be47 Melody Olvera        2024-12-04  1688  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1689  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1690  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1691  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1692  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1693  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1694  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1695  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1696  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1697  
068c3d3c83be47 Melody Olvera        2024-12-04  1698  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1699  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1700  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1701  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1702  
068c3d3c83be47 Melody Olvera        2024-12-04  1703  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1704  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1705  
068c3d3c83be47 Melody Olvera        2024-12-04  1706  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1707  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1708  
068c3d3c83be47 Melody Olvera        2024-12-04  1709  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1710  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1711  
068c3d3c83be47 Melody Olvera        2024-12-04  1712  			i2c3: i2c@a8c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1713  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1714  				reg = <0x0 0x00a8c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1715  
068c3d3c83be47 Melody Olvera        2024-12-04  1716  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1717  
068c3d3c83be47 Melody Olvera        2024-12-04  1718  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1719  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1720  
068c3d3c83be47 Melody Olvera        2024-12-04  1721  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1722  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1723  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1724  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1725  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1726  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1727  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1728  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1729  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1730  
068c3d3c83be47 Melody Olvera        2024-12-04  1731  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1732  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1733  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1734  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1735  
068c3d3c83be47 Melody Olvera        2024-12-04  1736  				pinctrl-0 = <&qup_i2c3_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1737  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1738  
068c3d3c83be47 Melody Olvera        2024-12-04  1739  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1740  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1741  
068c3d3c83be47 Melody Olvera        2024-12-04  1742  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1743  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1744  
068c3d3c83be47 Melody Olvera        2024-12-04  1745  			spi3: spi@a8c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1746  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1747  				reg = <0x0 0x00a8c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1748  
068c3d3c83be47 Melody Olvera        2024-12-04  1749  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1750  
068c3d3c83be47 Melody Olvera        2024-12-04  1751  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1752  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1753  
068c3d3c83be47 Melody Olvera        2024-12-04  1754  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1755  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1756  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1757  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1758  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1759  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1760  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1761  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1762  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1763  
068c3d3c83be47 Melody Olvera        2024-12-04  1764  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1765  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1766  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1767  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1768  
068c3d3c83be47 Melody Olvera        2024-12-04  1769  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1770  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1771  
068c3d3c83be47 Melody Olvera        2024-12-04  1772  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1773  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1774  
068c3d3c83be47 Melody Olvera        2024-12-04  1775  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1776  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1777  
068c3d3c83be47 Melody Olvera        2024-12-04  1778  			i2c4: i2c@a90000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1779  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1780  				reg = <0x0 0x00a90000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1781  
068c3d3c83be47 Melody Olvera        2024-12-04  1782  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1783  
068c3d3c83be47 Melody Olvera        2024-12-04  1784  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1785  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1786  
068c3d3c83be47 Melody Olvera        2024-12-04  1787  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1788  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1789  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1790  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1791  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1792  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1793  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1794  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1795  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1796  
068c3d3c83be47 Melody Olvera        2024-12-04  1797  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1798  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1799  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1800  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1801  
068c3d3c83be47 Melody Olvera        2024-12-04  1802  				pinctrl-0 = <&qup_i2c4_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1803  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1804  
068c3d3c83be47 Melody Olvera        2024-12-04  1805  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1806  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1807  
068c3d3c83be47 Melody Olvera        2024-12-04  1808  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1809  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1810  
068c3d3c83be47 Melody Olvera        2024-12-04  1811  			spi4: spi@a90000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1812  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1813  				reg = <0x0 0x00a90000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1814  
068c3d3c83be47 Melody Olvera        2024-12-04  1815  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1816  
068c3d3c83be47 Melody Olvera        2024-12-04  1817  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1818  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1819  
068c3d3c83be47 Melody Olvera        2024-12-04  1820  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1821  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1822  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1823  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1824  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1825  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1826  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1827  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1828  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1829  
068c3d3c83be47 Melody Olvera        2024-12-04  1830  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1831  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1832  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1833  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1834  
068c3d3c83be47 Melody Olvera        2024-12-04  1835  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1836  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1837  
068c3d3c83be47 Melody Olvera        2024-12-04  1838  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1839  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1840  
068c3d3c83be47 Melody Olvera        2024-12-04  1841  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1842  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1843  
068c3d3c83be47 Melody Olvera        2024-12-04  1844  			i2c5: i2c@a94000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1845  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1846  				reg = <0x0 0x00a94000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1847  
068c3d3c83be47 Melody Olvera        2024-12-04  1848  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1849  
068c3d3c83be47 Melody Olvera        2024-12-04  1850  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1851  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1852  
068c3d3c83be47 Melody Olvera        2024-12-04  1853  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1854  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1855  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1856  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1857  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1858  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1859  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1860  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1861  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1862  
068c3d3c83be47 Melody Olvera        2024-12-04  1863  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1864  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1865  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1866  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1867  
068c3d3c83be47 Melody Olvera        2024-12-04  1868  				pinctrl-0 = <&qup_i2c5_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1869  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1870  
068c3d3c83be47 Melody Olvera        2024-12-04  1871  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1872  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1873  
068c3d3c83be47 Melody Olvera        2024-12-04  1874  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1875  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1876  
068c3d3c83be47 Melody Olvera        2024-12-04  1877  			spi5: spi@a94000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1878  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1879  				reg = <0x0 0x00a94000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1880  
068c3d3c83be47 Melody Olvera        2024-12-04  1881  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1882  
068c3d3c83be47 Melody Olvera        2024-12-04  1883  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1884  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1885  
068c3d3c83be47 Melody Olvera        2024-12-04  1886  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1887  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1888  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1889  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1890  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1891  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1892  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1893  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1894  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1895  
068c3d3c83be47 Melody Olvera        2024-12-04  1896  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1897  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1898  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1899  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1900  
068c3d3c83be47 Melody Olvera        2024-12-04  1901  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1902  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1903  
068c3d3c83be47 Melody Olvera        2024-12-04  1904  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1905  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1906  
068c3d3c83be47 Melody Olvera        2024-12-04  1907  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1908  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1909  
068c3d3c83be47 Melody Olvera        2024-12-04  1910  			i2c6: i2c@a98000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1911  				compatible = "qcom,geni-i2c";
068c3d3c83be47 Melody Olvera        2024-12-04  1912  				reg = <0x0 0x00a98000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1913  
068c3d3c83be47 Melody Olvera        2024-12-04  1914  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1915  
068c3d3c83be47 Melody Olvera        2024-12-04  1916  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1917  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1918  
068c3d3c83be47 Melody Olvera        2024-12-04  1919  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1920  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1921  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1922  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1923  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1924  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1925  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1926  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1927  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1928  
068c3d3c83be47 Melody Olvera        2024-12-04  1929  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
068c3d3c83be47 Melody Olvera        2024-12-04  1930  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
068c3d3c83be47 Melody Olvera        2024-12-04  1931  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1932  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1933  
068c3d3c83be47 Melody Olvera        2024-12-04  1934  				pinctrl-0 = <&qup_i2c6_data_clk>;
068c3d3c83be47 Melody Olvera        2024-12-04  1935  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1936  
068c3d3c83be47 Melody Olvera        2024-12-04  1937  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1938  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1939  
068c3d3c83be47 Melody Olvera        2024-12-04  1940  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1941  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1942  
068c3d3c83be47 Melody Olvera        2024-12-04  1943  			spi6: spi@a98000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1944  				compatible = "qcom,geni-spi";
068c3d3c83be47 Melody Olvera        2024-12-04  1945  				reg = <0x0 0x00a98000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1946  
068c3d3c83be47 Melody Olvera        2024-12-04  1947  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1948  
068c3d3c83be47 Melody Olvera        2024-12-04  1949  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1950  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1951  
068c3d3c83be47 Melody Olvera        2024-12-04  1952  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1953  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1954  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1955  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1956  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1957  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1958  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1959  						     "qup-config",
068c3d3c83be47 Melody Olvera        2024-12-04  1960  						     "qup-memory";
068c3d3c83be47 Melody Olvera        2024-12-04  1961  
068c3d3c83be47 Melody Olvera        2024-12-04  1962  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
068c3d3c83be47 Melody Olvera        2024-12-04  1963  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
068c3d3c83be47 Melody Olvera        2024-12-04  1964  				dma-names = "tx",
068c3d3c83be47 Melody Olvera        2024-12-04  1965  					    "rx";
068c3d3c83be47 Melody Olvera        2024-12-04  1966  
068c3d3c83be47 Melody Olvera        2024-12-04  1967  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
068c3d3c83be47 Melody Olvera        2024-12-04  1968  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1969  
068c3d3c83be47 Melody Olvera        2024-12-04  1970  				#address-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  1971  				#size-cells = <0>;
068c3d3c83be47 Melody Olvera        2024-12-04  1972  
068c3d3c83be47 Melody Olvera        2024-12-04  1973  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1974  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1975  
068c3d3c83be47 Melody Olvera        2024-12-04  1976  			uart7: serial@a9c000 {
068c3d3c83be47 Melody Olvera        2024-12-04  1977  				compatible = "qcom,geni-debug-uart";
068c3d3c83be47 Melody Olvera        2024-12-04  1978  				reg = <0x0 0x00a9c000 0x0 0x4000>;
068c3d3c83be47 Melody Olvera        2024-12-04  1979  
068c3d3c83be47 Melody Olvera        2024-12-04  1980  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
068c3d3c83be47 Melody Olvera        2024-12-04  1981  
068c3d3c83be47 Melody Olvera        2024-12-04  1982  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  1983  				clock-names = "se";
068c3d3c83be47 Melody Olvera        2024-12-04  1984  
068c3d3c83be47 Melody Olvera        2024-12-04  1985  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1986  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
068c3d3c83be47 Melody Olvera        2024-12-04  1987  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
068c3d3c83be47 Melody Olvera        2024-12-04  1988  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
068c3d3c83be47 Melody Olvera        2024-12-04  1989  				interconnect-names = "qup-core",
068c3d3c83be47 Melody Olvera        2024-12-04  1990  						     "qup-config";
068c3d3c83be47 Melody Olvera        2024-12-04  1991  
068c3d3c83be47 Melody Olvera        2024-12-04  1992  
068c3d3c83be47 Melody Olvera        2024-12-04  1993  				pinctrl-0 = <&qup_uart7_default>;
068c3d3c83be47 Melody Olvera        2024-12-04  1994  				pinctrl-names = "default";
068c3d3c83be47 Melody Olvera        2024-12-04  1995  
068c3d3c83be47 Melody Olvera        2024-12-04  1996  				status = "disabled";
068c3d3c83be47 Melody Olvera        2024-12-04  1997  			};
068c3d3c83be47 Melody Olvera        2024-12-04  1998  		};
068c3d3c83be47 Melody Olvera        2024-12-04  1999  
9f9dcac2f85e6a Gaurav Kashyap       2025-01-13  2000  		rng: rng@10c3000 {
9f9dcac2f85e6a Gaurav Kashyap       2025-01-13  2001  			compatible = "qcom,sm8750-trng", "qcom,trng";
9f9dcac2f85e6a Gaurav Kashyap       2025-01-13  2002  			reg = <0x0 0x010c3000 0x0 0x1000>;
9f9dcac2f85e6a Gaurav Kashyap       2025-01-13  2003  		};
9f9dcac2f85e6a Gaurav Kashyap       2025-01-13  2004  
068c3d3c83be47 Melody Olvera        2024-12-04  2005  		cnoc_main: interconnect@1500000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2006  			compatible = "qcom,sm8750-cnoc-main";
068c3d3c83be47 Melody Olvera        2024-12-04  2007  			reg = <0x0 0x01500000 0x0 0x16080>;
068c3d3c83be47 Melody Olvera        2024-12-04  2008  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2009  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2010  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2011  
068c3d3c83be47 Melody Olvera        2024-12-04  2012  		config_noc: interconnect@1600000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2013  			compatible = "qcom,sm8750-config-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2014  			reg = <0x0 0x01600000 0x0 0x6200>;
068c3d3c83be47 Melody Olvera        2024-12-04  2015  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2016  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2017  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2018  
068c3d3c83be47 Melody Olvera        2024-12-04  2019  		system_noc: interconnect@1680000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2020  			compatible = "qcom,sm8750-system-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2021  			reg = <0x0 0x01680000 0x0 0x1d080>;
068c3d3c83be47 Melody Olvera        2024-12-04  2022  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2023  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2024  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2025  
068c3d3c83be47 Melody Olvera        2024-12-04  2026  		pcie_noc: interconnect@16c0000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2027  			compatible = "qcom,sm8750-pcie-anoc";
068c3d3c83be47 Melody Olvera        2024-12-04  2028  			reg = <0x0 0x016c0000 0x0 0x11400>;
068c3d3c83be47 Melody Olvera        2024-12-04  2029  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2030  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2031  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  2032  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  2033  
068c3d3c83be47 Melody Olvera        2024-12-04  2034  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2035  
068c3d3c83be47 Melody Olvera        2024-12-04  2036  		aggre1_noc: interconnect@16e0000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2037  			compatible = "qcom,sm8750-aggre1-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2038  			reg = <0x0 0x016e0000 0x0 0x16400>;
068c3d3c83be47 Melody Olvera        2024-12-04  2039  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2040  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2041  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
068c3d3c83be47 Melody Olvera        2024-12-04  2042  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  2043  
068c3d3c83be47 Melody Olvera        2024-12-04  2044  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2045  
068c3d3c83be47 Melody Olvera        2024-12-04  2046  		aggre2_noc: interconnect@1700000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2047  			compatible = "qcom,sm8750-aggre2-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2048  			reg = <0x0 0x01700000 0x0 0x1f400>;
068c3d3c83be47 Melody Olvera        2024-12-04  2049  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2050  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2051  			clocks = <&rpmhcc RPMH_IPA_CLK>;
068c3d3c83be47 Melody Olvera        2024-12-04  2052  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2053  
068c3d3c83be47 Melody Olvera        2024-12-04  2054  		mmss_noc: interconnect@1780000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2055  			compatible = "qcom,sm8750-mmss-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2056  			reg = <0x0 0x01780000 0x0 0x5b800>;
068c3d3c83be47 Melody Olvera        2024-12-04  2057  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2058  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2059  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2060  
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2061  		ice: crypto@1d88000 {
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2062  			compatible = "qcom,sm8750-inline-crypto-engine",
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2063  				     "qcom,inline-crypto-engine";
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2064  			reg = <0x0 0x01d88000 0x0 0x18000>;
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2065  
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2066  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2067  		};
b1dac789c650a2 Gaurav Kashyap       2025-01-13  2068  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2069  		cryptobam: dma-controller@1dc4000 {
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2070  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2071  			reg = <0x0 0x01dc4000 0x0 0x28000>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2072  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2073  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2074  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2075  			#dma-cells = <1>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2076  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2077  			iommus = <&apps_smmu 0x480 0>,
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2078  				 <&apps_smmu 0x481 0>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2079  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2080  			qcom,ee = <0>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2081  			qcom,controlled-remotely;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2082  		};
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2083  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2084  		crypto: crypto@1dfa000 {
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2085  			compatible = "qcom,sm8750-qce", "qcom,sm8150-qce", "qcom,qce";
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2086  			reg = <0x0 0x01dfa000 0x0 0x6000>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2087  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2088  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2089  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2090  			interconnect-names = "memory";
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2091  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2092  			dmas = <&cryptobam 4>, <&cryptobam 5>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2093  			dma-names = "rx", "tx";
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2094  
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2095  			iommus = <&apps_smmu 0x480 0>,
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2096  				 <&apps_smmu 0x481 0>;
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2097  		};
eeb0f3e4ea67cb Gaurav Kashyap       2025-01-13  2098  
068c3d3c83be47 Melody Olvera        2024-12-04  2099  		tcsr_mutex: hwlock@1f40000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2100  			compatible = "qcom,tcsr-mutex";
068c3d3c83be47 Melody Olvera        2024-12-04  2101  			reg = <0x0 0x01f40000 0x0 0x20000>;
068c3d3c83be47 Melody Olvera        2024-12-04  2102  			#hwlock-cells = <1>;
068c3d3c83be47 Melody Olvera        2024-12-04  2103  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2104  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2105  		remoteproc_mpss: remoteproc@4080000 {
104790b0699462 Krzysztof Kozlowski  2025-02-21  2106  			compatible = "qcom,sm8750-mpss-pas";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2107  			reg = <0x0 0x04080000 0x0 0x10000>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2108  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2109  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2110  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2111  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2112  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2113  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2114  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2115  			interrupt-names = "wdog",
104790b0699462 Krzysztof Kozlowski  2025-02-21  2116  					  "fatal",
104790b0699462 Krzysztof Kozlowski  2025-02-21  2117  					  "ready",
104790b0699462 Krzysztof Kozlowski  2025-02-21  2118  					  "handover",
104790b0699462 Krzysztof Kozlowski  2025-02-21  2119  					  "stop-ack",
104790b0699462 Krzysztof Kozlowski  2025-02-21  2120  					  "shutdown-ack";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2121  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2122  			clocks = <&rpmhcc RPMH_CXO_CLK>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2123  			clock-names = "xo";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2124  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2125  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
104790b0699462 Krzysztof Kozlowski  2025-02-21  2126  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2127  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2128  			power-domains = <&rpmhpd RPMHPD_CX>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2129  					<&rpmhpd RPMHPD_MSS>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2130  			power-domain-names = "cx",
104790b0699462 Krzysztof Kozlowski  2025-02-21  2131  					     "mss";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2132  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2133  			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2134  					<&dsm_partition_1_mem>,
104790b0699462 Krzysztof Kozlowski  2025-02-21  2135  					<&dsm_partition_2_mem>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2136  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2137  			qcom,qmp = <&aoss_qmp>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2138  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2139  			qcom,smem-states = <&smp2p_modem_out 0>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2140  			qcom,smem-state-names = "stop";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2141  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2142  			status = "disabled";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2143  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2144  			glink-edge {
104790b0699462 Krzysztof Kozlowski  2025-02-21  2145  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
104790b0699462 Krzysztof Kozlowski  2025-02-21  2146  							     IPCC_MPROC_SIGNAL_GLINK_QMP
104790b0699462 Krzysztof Kozlowski  2025-02-21  2147  							     IRQ_TYPE_EDGE_RISING>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2148  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2149  				mboxes = <&ipcc IPCC_CLIENT_MPSS
104790b0699462 Krzysztof Kozlowski  2025-02-21  2150  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2151  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2152  				qcom,remote-pid = <1>;
104790b0699462 Krzysztof Kozlowski  2025-02-21  2153  
104790b0699462 Krzysztof Kozlowski  2025-02-21  2154  				label = "mpss";
104790b0699462 Krzysztof Kozlowski  2025-02-21  2155  			};
104790b0699462 Krzysztof Kozlowski  2025-02-21  2156  		};
104790b0699462 Krzysztof Kozlowski  2025-02-21  2157  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2158  		remoteproc_adsp: remoteproc@6800000 {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2159  			compatible = "qcom,sm8750-adsp-pas", "qcom,sm8550-adsp-pas";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2160  			reg = <0x0 0x06800000 0x0 0x10000>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2161  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2162  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2163  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2164  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2165  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2166  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2167  					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2168  			interrupt-names = "wdog",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2169  					  "fatal",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2170  					  "ready",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2171  					  "handover",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2172  					  "stop-ack",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2173  					  "shutdown-ack";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2174  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2175  			clocks = <&rpmhcc RPMH_CXO_CLK>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2176  			clock-names = "xo";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2177  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2178  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2179  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2180  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2181  			power-domains = <&rpmhpd RPMHPD_LCX>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2182  					<&rpmhpd RPMHPD_LMX>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2183  			power-domain-names = "lcx",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2184  					     "lmx";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2185  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2186  			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2187  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2188  			qcom,qmp = <&aoss_qmp>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2189  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2190  			qcom,smem-states = <&smp2p_adsp_out 0>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2191  			qcom,smem-state-names = "stop";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2192  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2193  			status = "disabled";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2194  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2195  			remoteproc_adsp_glink: glink-edge {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2196  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2197  							     IPCC_MPROC_SIGNAL_GLINK_QMP
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2198  							     IRQ_TYPE_EDGE_RISING>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2199  				mboxes = <&ipcc IPCC_CLIENT_LPASS
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2200  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2201  				qcom,remote-pid = <2>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2202  				label = "lpass";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2203  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2204  				gpr {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2205  					compatible = "qcom,gpr";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2206  					qcom,glink-channels = "adsp_apps";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2207  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2208  					qcom,intents = <512 20>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2209  					#address-cells = <1>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2210  					#size-cells = <0>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2211  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2212  					q6apm: service@1 {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2213  						compatible = "qcom,q6apm";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2214  						reg = <GPR_APM_MODULE_IID>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2215  						#sound-dai-cells = <0>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2216  						qcom,protection-domain = "avs/audio",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2217  									 "msm/adsp/audio_pd";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2218  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2219  						q6apmbedai: bedais {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2220  							compatible = "qcom,q6apm-lpass-dais";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2221  							#sound-dai-cells = <1>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2222  						};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2223  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2224  						q6apmdai: dais {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2225  							compatible = "qcom,q6apm-dais";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2226  							iommus = <&apps_smmu 0x1001 0x80>,
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2227  								 <&apps_smmu 0x1041 0x20>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2228  						};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2229  					};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2230  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2231  					q6prm: service@2 {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2232  						compatible = "qcom,q6prm";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2233  						reg = <GPR_PRM_MODULE_IID>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2234  						qcom,protection-domain = "avs/audio",
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2235  									 "msm/adsp/audio_pd";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2236  
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2237  						q6prmcc: clock-controller {
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2238  							compatible = "qcom,q6prm-lpass-clocks";
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2239  							#clock-cells = <2>;
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2240  						};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2241  					};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2242  				};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2243  			};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2244  		};
8744dd90cd6b8e Krzysztof Kozlowski  2025-03-12  2245  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2246  		lpass_wsa2macro: codec@6aa0000 {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2247  			compatible = "qcom,sm8750-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2248  			reg = <0x0 0x06aa0000 0x0 0x1000>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2249  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2250  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2251  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2252  				 <&lpass_vamacro>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2253  			clock-names = "mclk",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2254  				      "macro",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2255  				      "dcodec",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2256  				      "fsgen";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2257  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2258  			#clock-cells = <0>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2259  			clock-output-names = "wsa2-mclk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2260  			#sound-dai-cells = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2261  		};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2262  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2263  		swr3: soundwire@6ab0000 {
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2264  			compatible = "qcom,soundwire-v2.0.0";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2265  			reg = <0 0x06ab0000 0 0x10000>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2266  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2267  			clocks = <&lpass_wsa2macro>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2268  			clock-names = "iface";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2269  			label = "WSA2";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2270  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2271  			pinctrl-0 = <&wsa2_swr_active>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2272  			pinctrl-names = "default";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2273  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2274  			qcom,din-ports = <4>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2275  			qcom,dout-ports = <9>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2276  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2277  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2278  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2279  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2280  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2281  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2282  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2283  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2284  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2285  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2286  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2287  			#address-cells = <2>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2288  			#size-cells = <0>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2289  			#sound-dai-cells = <1>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2290  			status = "disabled";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2291  		};
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2292  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2293  		lpass_rxmacro: codec@6ac0000 {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2294  			compatible = "qcom,sm8750-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2295  			reg = <0x0 0x06ac0000 0x0 0x1000>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2296  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2297  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2298  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2299  				 <&lpass_vamacro>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2300  			clock-names = "mclk",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2301  				      "macro",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2302  				      "dcodec",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2303  				      "fsgen";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2304  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2305  			#clock-cells = <0>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2306  			clock-output-names = "mclk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2307  			#sound-dai-cells = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2308  		};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2309  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2310  		swr1: soundwire@6ad0000 {
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2311  			compatible = "qcom,soundwire-v2.0.0";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2312  			reg = <0 0x06ad0000 0 0x10000>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2313  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2314  			clocks = <&lpass_rxmacro>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2315  			clock-names = "iface";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2316  			label = "RX";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2317  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2318  			pinctrl-0 = <&rx_swr_active>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2319  			pinctrl-names = "default";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2320  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2321  			qcom,din-ports = <1>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2322  			qcom,dout-ports = <11>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2323  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2324  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2325  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2326  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2327  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0x00 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2328  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0x0f 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2329  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0x18 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2330  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2331  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2332  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2333  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2334  			#address-cells = <2>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2335  			#size-cells = <0>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2336  			#sound-dai-cells = <1>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2337  			status = "disabled";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2338  		};
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2339  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2340  		lpass_txmacro: codec@6ae0000 {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2341  			compatible = "qcom,sm8750-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2342  			reg = <0x0 0x06ae0000 0x0 0x1000>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2343  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2344  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2345  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2346  				 <&lpass_vamacro>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2347  			clock-names = "mclk",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2348  				      "macro",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2349  				      "dcodec",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2350  				      "fsgen";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2351  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2352  			#clock-cells = <0>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2353  			clock-output-names = "mclk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2354  			#sound-dai-cells = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2355  		};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2356  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2357  		lpass_wsamacro: codec@6b00000 {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2358  			compatible = "qcom,sm8750-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2359  			reg = <0x0 0x06b00000 0x0 0x1000>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2360  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2361  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2362  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2363  				 <&lpass_vamacro>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2364  			clock-names = "mclk",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2365  				      "macro",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2366  				      "dcodec",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2367  				      "fsgen";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2368  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2369  			#clock-cells = <0>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2370  			clock-output-names = "mclk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2371  			#sound-dai-cells = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2372  		};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2373  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2374  		swr0: soundwire@6b10000 {
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2375  			compatible = "qcom,soundwire-v2.0.0";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2376  			reg = <0 0x06b10000 0 0x10000>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2377  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2378  			clocks = <&lpass_wsamacro>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2379  			clock-names = "iface";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2380  			label = "WSA";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2381  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2382  			pinctrl-0 = <&wsa_swr_active>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2383  			pinctrl-names = "default";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2384  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2385  			qcom,din-ports = <4>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2386  			qcom,dout-ports = <9>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2387  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2388  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2389  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2390  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2391  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2392  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2393  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2394  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2395  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2396  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2397  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2398  			#address-cells = <2>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2399  			#size-cells = <0>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2400  			#sound-dai-cells = <1>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2401  			status = "disabled";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2402  		};
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2403  
068c3d3c83be47 Melody Olvera        2024-12-04  2404  		lpass_ag_noc: interconnect@7e40000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2405  			compatible = "qcom,sm8750-lpass-ag-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2406  			reg = <0x0 0x07e40000 0x0 0xe080>;
068c3d3c83be47 Melody Olvera        2024-12-04  2407  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2408  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2409  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2410  
068c3d3c83be47 Melody Olvera        2024-12-04  2411  		lpass_lpiaon_noc: interconnect@7400000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2412  			compatible = "qcom,sm8750-lpass-lpiaon-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2413  			reg = <0x0 0x07400000 0x0 0x19080>;
068c3d3c83be47 Melody Olvera        2024-12-04  2414  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2415  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2416  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2417  
068c3d3c83be47 Melody Olvera        2024-12-04  2418  		lpass_lpicx_noc: interconnect@7420000 {
068c3d3c83be47 Melody Olvera        2024-12-04  2419  			compatible = "qcom,sm8750-lpass-lpicx-noc";
068c3d3c83be47 Melody Olvera        2024-12-04  2420  			reg = <0x0 0x07420000 0x0 0x44080>;
068c3d3c83be47 Melody Olvera        2024-12-04  2421  			qcom,bcm-voters = <&apps_bcm_voter>;
068c3d3c83be47 Melody Olvera        2024-12-04  2422  			#interconnect-cells = <2>;
068c3d3c83be47 Melody Olvera        2024-12-04  2423  		};
068c3d3c83be47 Melody Olvera        2024-12-04  2424  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2425  		swr2: soundwire@7630000 {
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2426  			compatible = "qcom,soundwire-v2.0.0";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2427  			reg = <0 0x07630000 0 0x10000>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2428  			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2429  				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2430  			interrupt-names = "core", "wakeup";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2431  			clocks = <&lpass_txmacro>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2432  			clock-names = "iface";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2433  			label = "TX";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2434  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2435  			pinctrl-0 = <&tx_swr_active>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2436  			pinctrl-names = "default";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2437  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2438  			qcom,din-ports = <4>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2439  			qcom,dout-ports = <0>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2440  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2441  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2442  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2443  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2444  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2445  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2446  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2447  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2448  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2449  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2450  
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2451  			#address-cells = <2>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2452  			#size-cells = <0>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2453  			#sound-dai-cells = <1>;
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2454  			status = "disabled";
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2455  		};
9c401e80a79128 Krzysztof Kozlowski  2024-10-07  2456  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2457  		lpass_vamacro: codec@7660000 {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2458  			compatible = "qcom,sm8750-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2459  			reg = <0x0 0x07660000 0x0 0x2000>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2460  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2461  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2462  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2463  			clock-names = "mclk",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2464  				      "macro",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2465  				      "dcodec";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2466  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2467  			#clock-cells = <0>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2468  			clock-output-names = "fsgen";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2469  			#sound-dai-cells = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2470  		};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2471  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2472  		lpass_tlmm: pinctrl@7760000 {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2473  			compatible = "qcom,sm8750-lpass-lpi-pinctrl",
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2474  				     "qcom,sm8650-lpass-lpi-pinctrl";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2475  			reg = <0x0 0x07760000 0x0 0x20000>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2476  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2477  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2478  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2479  			clock-names = "core", "audio";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2480  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2481  			gpio-controller;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2482  			#gpio-cells = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2483  			gpio-ranges = <&lpass_tlmm 0 0 23>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2484  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2485  			tx_swr_active: tx-swr-active-state {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2486  				clk-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2487  					pins = "gpio0";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2488  					function = "swr_tx_clk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2489  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2490  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2491  					bias-disable;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2492  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2493  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2494  				data-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2495  					pins = "gpio1", "gpio2", "gpio14";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2496  					function = "swr_tx_data";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2497  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2498  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2499  					bias-bus-hold;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2500  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2501  			};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2502  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2503  			rx_swr_active: rx-swr-active-state {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2504  				clk-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2505  					pins = "gpio3";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2506  					function = "swr_rx_clk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2507  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2508  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2509  					bias-disable;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2510  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2511  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2512  				data-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2513  					pins = "gpio4", "gpio5";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2514  					function = "swr_rx_data";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2515  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2516  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2517  					bias-bus-hold;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2518  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2519  			};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2520  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2521  			dmic01_default: dmic01-default-state {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2522  				clk-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2523  					pins = "gpio6";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2524  					function = "dmic1_clk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2525  					drive-strength = <8>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2526  					output-high;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2527  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2528  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2529  				data-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2530  					pins = "gpio7";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2531  					function = "dmic1_data";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2532  					drive-strength = <8>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2533  					input-enable;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2534  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2535  			};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2536  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2537  			dmic23_default: dmic23-default-state {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2538  				clk-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2539  					pins = "gpio8";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2540  					function = "dmic2_clk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2541  					drive-strength = <8>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2542  					output-high;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2543  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2544  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2545  				data-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2546  					pins = "gpio9";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2547  					function = "dmic2_data";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2548  					drive-strength = <8>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2549  					input-enable;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2550  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2551  			};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2552  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2553  			wsa_swr_active: wsa-swr-active-state {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2554  				clk-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2555  					pins = "gpio10";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2556  					function = "wsa_swr_clk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2557  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2558  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2559  					bias-disable;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2560  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2561  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2562  				data-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2563  					pins = "gpio11";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2564  					function = "wsa_swr_data";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2565  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2566  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2567  					bias-bus-hold;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2568  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2569  			};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2570  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2571  			wsa2_swr_active: wsa2-swr-active-state {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2572  				clk-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2573  					pins = "gpio15";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2574  					function = "wsa2_swr_clk";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2575  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2576  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2577  					bias-disable;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2578  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2579  
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2580  				data-pins {
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2581  					pins = "gpio16";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2582  					function = "wsa2_swr_data";
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2583  					drive-strength = <2>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2584  					slew-rate = <1>;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2585  					bias-bus-hold;
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2586  				};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2587  			};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2588  		};
0fe088574b3058 Krzysztof Kozlowski  2025-03-12  2589  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2590  		mdss: display-subsystem@ae00000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2591  			compatible = "qcom,sm8750-mdss";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2592  			reg = <0x0 0x0ae00000 0x0 0x1000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2593  			reg-names = "mdss";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2594  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2595  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2596  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2597  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2598  				 <&gcc GCC_DISP_HF_AXI_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2599  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2600  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2601  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2602  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2603  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2604  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2605  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2606  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2607  			interconnect-names = "mdp0-mem",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2608  					     "cpu-cfg";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2609  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2610  			power-domains = <&dispcc MDSS_GDSC>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2611  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2612  			iommus = <&apps_smmu 0x800 0x2>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2613  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2614  			interrupt-controller;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2615  			#interrupt-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2616  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2617  			#address-cells = <2>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2618  			#size-cells = <2>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2619  			ranges;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2620  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2621  			status = "disabled";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2622  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2623  			mdss_mdp: display-controller@ae01000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2624  				compatible = "qcom,sm8750-dpu";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2625  				reg = <0 0x0ae01000 0 0x93000>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2626  				      <0 0x0aeb0000 0 0x2008>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2627  				reg-names = "mdp",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2628  					    "vbif";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2629  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2630  				interrupts-extended = <&mdss 0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2631  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2632  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2633  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2634  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2635  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2636  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2637  				clock-names = "nrt_bus",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2638  					      "iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2639  					      "lut",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2640  					      "core",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2641  					      "vsync";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2642  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2643  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2644  				assigned-clock-rates = <19200000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2645  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2646  				operating-points-v2 = <&mdp_opp_table>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2647  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2648  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2649  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2650  				ports {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2651  					#address-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2652  					#size-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2653  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2654  					port@0 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2655  						reg = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2656  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2657  						dpu_intf1_out: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2658  							remote-endpoint = <&mdss_dsi0_in>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2659  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2660  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2661  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2662  					port@1 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2663  						reg = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2664  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2665  						dpu_intf2_out: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2666  							remote-endpoint = <&mdss_dsi1_in>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2667  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2668  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2669  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2670  					port@2 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2671  						reg = <2>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2672  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2673  						dpu_intf0_out: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2674  							remote-endpoint = <&mdss_dp0_in>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2675  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2676  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2677  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2678  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2679  				mdp_opp_table: opp-table {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2680  					compatible = "operating-points-v2";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2681  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2682  					opp-207000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2683  						opp-hz = /bits/ 64 <207000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2684  						required-opps = <&rpmhpd_opp_low_svs>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2685  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2686  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2687  					opp-337000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2688  						opp-hz = /bits/ 64 <337000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2689  						required-opps = <&rpmhpd_opp_svs>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2690  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2691  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2692  					opp-417000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2693  						opp-hz = /bits/ 64 <417000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2694  						required-opps = <&rpmhpd_opp_svs_l1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2695  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2696  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2697  					opp-532000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2698  						opp-hz = /bits/ 64 <532000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2699  						required-opps = <&rpmhpd_opp_nom>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2700  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2701  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2702  					opp-575000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2703  						opp-hz = /bits/ 64 <575000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2704  						required-opps = <&rpmhpd_opp_nom_l1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2705  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2706  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2707  			};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2708  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2709  			mdss_dsi0: dsi@ae94000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2710  				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2711  				reg = <0x0 0x0ae94000 0x0 0x400>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2712  				reg-names = "dsi_ctrl";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2713  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2714  				interrupts-extended = <&mdss 4>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2715  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2716  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2717  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2718  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2719  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2720  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2721  					 <&gcc GCC_DISP_HF_AXI_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2722  					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2723  					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2724  					 <&dispcc DISP_CC_ESYNC0_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2725  					 <&dispcc DISP_CC_OSC_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2726  					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2727  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2728  				clock-names = "byte",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2729  					      "byte_intf",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2730  					      "pixel",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2731  					      "core",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2732  					      "iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2733  					      "bus",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2734  					      "dsi_pll_pixel",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2735  					      "dsi_pll_byte",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2736  					      "esync",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2737  					      "osc",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2738  					      "byte_src",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2739  					      "pixel_src";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2740  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2741  				operating-points-v2 = <&mdss_dsi_opp_table>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2742  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2743  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2744  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2745  				phys = <&mdss_dsi0_phy>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2746  				phy-names = "dsi";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2747  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2748  				#address-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2749  				#size-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2750  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2751  				status = "disabled";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2752  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2753  				ports {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2754  					#address-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2755  					#size-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2756  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2757  					port@0 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2758  						reg = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2759  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2760  						mdss_dsi0_in: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2761  							remote-endpoint = <&dpu_intf1_out>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2762  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2763  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2764  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2765  					port@1 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2766  						reg = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2767  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2768  						mdss_dsi0_out: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2769  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2770  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2771  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2772  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2773  				mdss_dsi_opp_table: opp-table {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2774  					compatible = "operating-points-v2";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2775  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2776  					opp-187500000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2777  						opp-hz = /bits/ 64 <187500000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2778  						required-opps = <&rpmhpd_opp_low_svs>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2779  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2780  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2781  					opp-300000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2782  						opp-hz = /bits/ 64 <300000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2783  						required-opps = <&rpmhpd_opp_svs>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2784  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2785  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2786  					opp-358000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2787  						opp-hz = /bits/ 64 <358000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2788  						required-opps = <&rpmhpd_opp_svs_l1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2789  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2790  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2791  			};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2792  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2793  			mdss_dsi0_phy: phy@ae95000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2794  				compatible = "qcom,sm8750-dsi-phy-3nm";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2795  				reg = <0x0 0x0ae95000 0x0 0x200>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2796  				      <0x0 0x0ae95200 0x0 0x280>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2797  				      <0x0 0x0ae95500 0x0 0x400>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2798  				reg-names = "dsi_phy",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2799  					    "dsi_phy_lane",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2800  					    "dsi_pll";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2801  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2802  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2803  					 <&bi_tcxo_div2>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2804  				clock-names = "iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2805  					      "ref";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2806  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2807  				#clock-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2808  				#phy-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2809  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2810  				status = "disabled";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2811  			};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2812  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2813  			mdss_dsi1: dsi@ae96000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2814  				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2815  				reg = <0x0 0x0ae96000 0x0 0x400>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2816  				reg-names = "dsi_ctrl";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2817  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2818  				interrupts-extended = <&mdss 5>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2819  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2820  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2821  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2822  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2823  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2824  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2825  					 <&gcc GCC_DISP_HF_AXI_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2826  				clock-names = "byte",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2827  					      "byte_intf",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2828  					      "pixel",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2829  					      "core",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2830  					      "iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2831  					      "bus";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2832  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2833  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2834  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2835  				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2836  							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2837  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2838  				operating-points-v2 = <&mdss_dsi_opp_table>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2839  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2840  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2841  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2842  				phys = <&mdss_dsi1_phy>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2843  				phy-names = "dsi";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2844  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2845  				#address-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2846  				#size-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2847  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2848  				status = "disabled";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2849  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2850  				ports {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2851  					#address-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2852  					#size-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2853  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2854  					port@0 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2855  						reg = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2856  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2857  						mdss_dsi1_in: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2858  							remote-endpoint = <&dpu_intf2_out>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2859  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2860  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2861  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2862  					port@1 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2863  						reg = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2864  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2865  						mdss_dsi1_out: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2866  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2867  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2868  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2869  			};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2870  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2871  			mdss_dsi1_phy: phy@ae97000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2872  				compatible = "qcom,sm8750-dsi-phy-3nm";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2873  				reg = <0x0 0x0ae97000 0x0 0x200>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2874  				      <0x0 0x0ae97200 0x0 0x280>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2875  				      <0x0 0x0ae97500 0x0 0x400>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2876  				reg-names = "dsi_phy",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2877  					    "dsi_phy_lane",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2878  					    "dsi_pll";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2879  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2880  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2881  					 <&rpmhcc RPMH_CXO_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2882  				clock-names = "iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2883  					      "ref";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2884  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2885  				#clock-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2886  				#phy-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2887  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2888  				status = "disabled";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2889  			};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2890  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2891  			mdss_dp0: displayport-controller@af54000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2892  				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2893  				reg = <0x0 0xaf54000 0x0 0x104>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2894  				      <0x0 0xaf54200 0x0 0xc0>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2895  				      <0x0 0xaf55000 0x0 0x770>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2896  				      <0x0 0xaf56000 0x0 0x9c>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2897  				      <0x0 0xaf57000 0x0 0x9c>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2898  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2899  				interrupts-extended = <&mdss 12>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2900  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2901  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2902  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2903  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2904  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2905  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2906  				clock-names = "core_iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2907  					      "core_aux",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2908  					      "ctrl_link",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2909  					      "ctrl_link_iface",
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2910  					      "stream_pixel";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2911  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2912  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2913  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2914  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2915  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2916  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2917  				operating-points-v2 = <&dp_opp_table>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2918  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2919  				power-domains = <&rpmhpd RPMHPD_MMCX>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2920  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2921  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2922  				phy-names = "dp";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2923  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2924  				#sound-dai-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2925  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2926  				status = "disabled";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2927  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2928  				dp_opp_table: opp-table {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2929  					compatible = "operating-points-v2";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2930  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2931  					opp-192000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2932  						opp-hz = /bits/ 64 <192000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2933  						required-opps = <&rpmhpd_opp_low_svs_d1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2934  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2935  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2936  					opp-270000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2937  						opp-hz = /bits/ 64 <270000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2938  						required-opps = <&rpmhpd_opp_low_svs>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2939  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2940  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2941  					opp-540000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2942  						opp-hz = /bits/ 64 <540000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2943  						required-opps = <&rpmhpd_opp_svs_l1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2944  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2945  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2946  					opp-810000000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2947  						opp-hz = /bits/ 64 <810000000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2948  						required-opps = <&rpmhpd_opp_nom>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2949  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2950  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2951  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2952  				ports {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2953  					#address-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2954  					#size-cells = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2955  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2956  					port@0 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2957  						reg = <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2958  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2959  						mdss_dp0_in: endpoint {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2960  							remote-endpoint = <&dpu_intf0_out>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2961  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2962  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2963  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2964  					port@1 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2965  						reg = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2966  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2967  						mdss_dp0_out: endpoint {
ff4630d9ef1f3a Krzysztof Kozlowski  2025-04-24  2968  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2969  						};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2970  					};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2971  				};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2972  			};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2973  		};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2974  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2975  		dispcc: clock-controller@af00000 {
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2976  			compatible = "qcom,sm8750-dispcc";
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2977  			reg = <0 0x0af00000 0 0x20000>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2978  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2979  			clocks = <&bi_tcxo_div2>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2980  				 <&bi_tcxo_ao_div2>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2981  				 <&gcc GCC_DISP_AHB_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2982  				 <&sleep_clk>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2983  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2984  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2985  				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2986  				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2987  				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2988  				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2989  				 <0>, /* dp1 */
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2990  				 <0>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2991  				 <0>, /* dp2 */
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2992  				 <0>,
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2993  				 <0>, /* dp3 */
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2994  				 <0>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2995  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2996  			power-domains = <&rpmhpd RPMHPD_MMCX>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2997  			required-opps = <&rpmhpd_opp_low_svs>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2998  
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  2999  			#clock-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  3000  			#reset-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  3001  			#power-domain-cells = <1>;
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  3002  		};
a880ed13c2dd5b Krzysztof Kozlowski  2024-11-28  3003  
051188e0bc270a Wesley Cheng         2025-04-21  3004  		usb_1_hsphy: phy@88e3000 {
051188e0bc270a Wesley Cheng         2025-04-21  3005  			compatible = "qcom,sm8750-m31-eusb2-phy";
051188e0bc270a Wesley Cheng         2025-04-21  3006  			reg = <0x0 0x88e3000 0x0 0x29c>;
051188e0bc270a Wesley Cheng         2025-04-21  3007  
051188e0bc270a Wesley Cheng         2025-04-21  3008  			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
051188e0bc270a Wesley Cheng         2025-04-21  3009  			clock-names = "ref";
051188e0bc270a Wesley Cheng         2025-04-21  3010  
051188e0bc270a Wesley Cheng         2025-04-21  3011  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
051188e0bc270a Wesley Cheng         2025-04-21  3012  
051188e0bc270a Wesley Cheng         2025-04-21  3013  			#phy-cells = <0>;
051188e0bc270a Wesley Cheng         2025-04-21  3014  
051188e0bc270a Wesley Cheng         2025-04-21  3015  			status = "disabled";
051188e0bc270a Wesley Cheng         2025-04-21  3016  		};
051188e0bc270a Wesley Cheng         2025-04-21  3017  
051188e0bc270a Wesley Cheng         2025-04-21  3018  		usb_dp_qmpphy: phy@88e8000 {
051188e0bc270a Wesley Cheng         2025-04-21  3019  			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
051188e0bc270a Wesley Cheng         2025-04-21  3020  			reg = <0x0 0x088e8000 0x0 0x4000>;
051188e0bc270a Wesley Cheng         2025-04-21  3021  
051188e0bc270a Wesley Cheng         2025-04-21  3022  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3023  				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
051188e0bc270a Wesley Cheng         2025-04-21  3024  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3025  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
051188e0bc270a Wesley Cheng         2025-04-21  3026  			clock-names = "aux",
051188e0bc270a Wesley Cheng         2025-04-21  3027  				      "ref",
051188e0bc270a Wesley Cheng         2025-04-21  3028  				      "com_aux",
051188e0bc270a Wesley Cheng         2025-04-21  3029  				      "usb3_pipe";
051188e0bc270a Wesley Cheng         2025-04-21  3030  
051188e0bc270a Wesley Cheng         2025-04-21  3031  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
051188e0bc270a Wesley Cheng         2025-04-21  3032  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
051188e0bc270a Wesley Cheng         2025-04-21  3033  			reset-names = "phy",
051188e0bc270a Wesley Cheng         2025-04-21  3034  				      "common";
051188e0bc270a Wesley Cheng         2025-04-21  3035  
051188e0bc270a Wesley Cheng         2025-04-21  3036  			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
051188e0bc270a Wesley Cheng         2025-04-21  3037  
051188e0bc270a Wesley Cheng         2025-04-21  3038  			#clock-cells = <1>;
051188e0bc270a Wesley Cheng         2025-04-21  3039  			#phy-cells = <1>;
051188e0bc270a Wesley Cheng         2025-04-21  3040  
051188e0bc270a Wesley Cheng         2025-04-21  3041  			orientation-switch;
051188e0bc270a Wesley Cheng         2025-04-21  3042  
051188e0bc270a Wesley Cheng         2025-04-21  3043  			status = "disabled";
051188e0bc270a Wesley Cheng         2025-04-21  3044  
051188e0bc270a Wesley Cheng         2025-04-21  3045  			ports {
051188e0bc270a Wesley Cheng         2025-04-21  3046  				#address-cells = <1>;
051188e0bc270a Wesley Cheng         2025-04-21  3047  				#size-cells = <0>;
051188e0bc270a Wesley Cheng         2025-04-21  3048  
051188e0bc270a Wesley Cheng         2025-04-21  3049  				port@0 {
051188e0bc270a Wesley Cheng         2025-04-21  3050  					reg = <0>;
051188e0bc270a Wesley Cheng         2025-04-21  3051  
051188e0bc270a Wesley Cheng         2025-04-21 @3052  					usb_dp_qmpphy_out: endpoint {
051188e0bc270a Wesley Cheng         2025-04-21  3053  					};
051188e0bc270a Wesley Cheng         2025-04-21  3054  				};
051188e0bc270a Wesley Cheng         2025-04-21  3055  
051188e0bc270a Wesley Cheng         2025-04-21  3056  				port@1 {
051188e0bc270a Wesley Cheng         2025-04-21  3057  					reg = <1>;
051188e0bc270a Wesley Cheng         2025-04-21  3058  
051188e0bc270a Wesley Cheng         2025-04-21  3059  					usb_dp_qmpphy_usb_ss_in: endpoint {
051188e0bc270a Wesley Cheng         2025-04-21  3060  						remote-endpoint = <&usb_1_dwc3_ss>;
051188e0bc270a Wesley Cheng         2025-04-21  3061  					};
051188e0bc270a Wesley Cheng         2025-04-21  3062  				};
051188e0bc270a Wesley Cheng         2025-04-21  3063  
051188e0bc270a Wesley Cheng         2025-04-21  3064  				port@2 {
051188e0bc270a Wesley Cheng         2025-04-21  3065  					reg = <2>;
051188e0bc270a Wesley Cheng         2025-04-21  3066  
051188e0bc270a Wesley Cheng         2025-04-21  3067  					usb_dp_qmpphy_dp_in: endpoint {
ff4630d9ef1f3a Krzysztof Kozlowski  2025-04-24  3068  						remote-endpoint = <&mdss_dp0_out>;
051188e0bc270a Wesley Cheng         2025-04-21  3069  					};
051188e0bc270a Wesley Cheng         2025-04-21  3070  				};
051188e0bc270a Wesley Cheng         2025-04-21  3071  			};
051188e0bc270a Wesley Cheng         2025-04-21  3072  		};
051188e0bc270a Wesley Cheng         2025-04-21  3073  
051188e0bc270a Wesley Cheng         2025-04-21  3074  		usb_1: usb@a6f8800 {
051188e0bc270a Wesley Cheng         2025-04-21  3075  			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
051188e0bc270a Wesley Cheng         2025-04-21  3076  			reg = <0x0 0x0a6f8800 0x0 0x400>;
051188e0bc270a Wesley Cheng         2025-04-21  3077  
051188e0bc270a Wesley Cheng         2025-04-21  3078  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3079  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3080  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3081  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3082  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
051188e0bc270a Wesley Cheng         2025-04-21  3083  			clock-names = "cfg_noc",
051188e0bc270a Wesley Cheng         2025-04-21  3084  				      "core",
051188e0bc270a Wesley Cheng         2025-04-21  3085  				      "iface",
051188e0bc270a Wesley Cheng         2025-04-21  3086  				      "sleep",
051188e0bc270a Wesley Cheng         2025-04-21  3087  				      "mock_utmi";
051188e0bc270a Wesley Cheng         2025-04-21  3088  
051188e0bc270a Wesley Cheng         2025-04-21  3089  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
051188e0bc270a Wesley Cheng         2025-04-21  3090  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
051188e0bc270a Wesley Cheng         2025-04-21  3091  			assigned-clock-rates = <19200000>, <200000000>;
051188e0bc270a Wesley Cheng         2025-04-21  3092  
051188e0bc270a Wesley Cheng         2025-04-21  3093  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
051188e0bc270a Wesley Cheng         2025-04-21  3094  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
051188e0bc270a Wesley Cheng         2025-04-21  3095  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
051188e0bc270a Wesley Cheng         2025-04-21  3096  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
051188e0bc270a Wesley Cheng         2025-04-21  3097  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
051188e0bc270a Wesley Cheng         2025-04-21  3098  			interrupt-names = "pwr_event",
051188e0bc270a Wesley Cheng         2025-04-21  3099  					  "hs_phy_irq",
051188e0bc270a Wesley Cheng         2025-04-21  3100  					  "dp_hs_phy_irq",
051188e0bc270a Wesley Cheng         2025-04-21  3101  					  "dm_hs_phy_irq",
051188e0bc270a Wesley Cheng         2025-04-21  3102  					  "ss_phy_irq";
051188e0bc270a Wesley Cheng         2025-04-21  3103  
051188e0bc270a Wesley Cheng         2025-04-21  3104  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
051188e0bc270a Wesley Cheng         2025-04-21  3105  			required-opps = <&rpmhpd_opp_nom>;
051188e0bc270a Wesley Cheng         2025-04-21  3106  
051188e0bc270a Wesley Cheng         2025-04-21  3107  			resets = <&gcc GCC_USB30_PRIM_BCR>;
051188e0bc270a Wesley Cheng         2025-04-21  3108  
051188e0bc270a Wesley Cheng         2025-04-21  3109  			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
051188e0bc270a Wesley Cheng         2025-04-21  3110  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
051188e0bc270a Wesley Cheng         2025-04-21  3111  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
051188e0bc270a Wesley Cheng         2025-04-21  3112  					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
051188e0bc270a Wesley Cheng         2025-04-21  3113  			interconnect-names = "usb-ddr", "apps-usb";
051188e0bc270a Wesley Cheng         2025-04-21  3114  
051188e0bc270a Wesley Cheng         2025-04-21  3115  			#address-cells = <2>;
051188e0bc270a Wesley Cheng         2025-04-21  3116  			#size-cells = <2>;
051188e0bc270a Wesley Cheng         2025-04-21  3117  			ranges;
051188e0bc270a Wesley Cheng         2025-04-21  3118  
051188e0bc270a Wesley Cheng         2025-04-21  3119  			status = "disabled";
051188e0bc270a Wesley Cheng         2025-04-21  3120  
051188e0bc270a Wesley Cheng         2025-04-21  3121  			usb_1_dwc3: usb@a600000 {
051188e0bc270a Wesley Cheng         2025-04-21  3122  				compatible = "snps,dwc3";
051188e0bc270a Wesley Cheng         2025-04-21  3123  				reg = <0x0 0x0a600000 0x0 0xe000>;
051188e0bc270a Wesley Cheng         2025-04-21  3124  
051188e0bc270a Wesley Cheng         2025-04-21  3125  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
051188e0bc270a Wesley Cheng         2025-04-21  3126  
051188e0bc270a Wesley Cheng         2025-04-21  3127  				iommus = <&apps_smmu 0x40 0x0>;
051188e0bc270a Wesley Cheng         2025-04-21  3128  
051188e0bc270a Wesley Cheng         2025-04-21  3129  				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
051188e0bc270a Wesley Cheng         2025-04-21  3130  				phy-names = "usb2-phy", "usb3-phy";
051188e0bc270a Wesley Cheng         2025-04-21  3131  
051188e0bc270a Wesley Cheng         2025-04-21  3132  				snps,hird-threshold = /bits/ 8 <0x0>;
051188e0bc270a Wesley Cheng         2025-04-21  3133  				snps,usb2-gadget-lpm-disable;
051188e0bc270a Wesley Cheng         2025-04-21  3134  				snps,dis_u2_susphy_quirk;
051188e0bc270a Wesley Cheng         2025-04-21  3135  				snps,dis_enblslpm_quirk;
051188e0bc270a Wesley Cheng         2025-04-21  3136  				snps,dis-u1-entry-quirk;
051188e0bc270a Wesley Cheng         2025-04-21  3137  				snps,dis-u2-entry-quirk;
051188e0bc270a Wesley Cheng         2025-04-21  3138  				snps,is-utmi-l1-suspend;
051188e0bc270a Wesley Cheng         2025-04-21  3139  				snps,usb3_lpm_capable;
051188e0bc270a Wesley Cheng         2025-04-21  3140  				snps,usb2-lpm-disable;
051188e0bc270a Wesley Cheng         2025-04-21  3141  				snps,has-lpm-erratum;
051188e0bc270a Wesley Cheng         2025-04-21  3142  				tx-fifo-resize;
051188e0bc270a Wesley Cheng         2025-04-21  3143  
051188e0bc270a Wesley Cheng         2025-04-21  3144  				dma-coherent;
051188e0bc270a Wesley Cheng         2025-04-21  3145  
051188e0bc270a Wesley Cheng         2025-04-21  3146  				ports {
051188e0bc270a Wesley Cheng         2025-04-21  3147  					#address-cells = <1>;
051188e0bc270a Wesley Cheng         2025-04-21  3148  					#size-cells = <0>;
051188e0bc270a Wesley Cheng         2025-04-21  3149  
051188e0bc270a Wesley Cheng         2025-04-21  3150  					port@0 {
051188e0bc270a Wesley Cheng         2025-04-21  3151  						reg = <0>;
051188e0bc270a Wesley Cheng         2025-04-21  3152  
051188e0bc270a Wesley Cheng         2025-04-21 @3153  						usb_1_dwc3_hs: endpoint {

:::::: The code at line 3052 was first introduced by commit
:::::: 051188e0bc270afffc5a00fe0a0d1dee0a384378 arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs

:::::: TO: Wesley Cheng <quic_wcheng@quicinc.com>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
