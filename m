Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D202B196DA2
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590764; cv=none; b=LVS6rNQzBcbdC2Ni7Yvcm0piFmi7fXl0pFwRgklFkKZwc9c756l2PJknsy58faSretoBxU526osWoESL7MWxaYlnAwtuhqqwwadjzZq4BkjEG/tUkc9dRvKu3OpPaQ612jU+nXwBzJbZ8xbzc0htOmEh1Z0wkX9Tq5rDJqu/sk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590764; c=relaxed/simple;
	bh=zXoiG2TbToCoqax7LPjRdLwjuqfVmhmXD2428rtDS8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dbg/3qVoGVcA+vhQZB/S0dWNmL+/F9USGy5yjWpkBnL4zvu1zxBG/CTiyNq954N9Qx9AP3lFiPeeoLwV1EnrJMIXcMDHlooISkR9T2eZVyfa2bpgDxOX5Ij83No9NtyMCIP8vS7YVilEbvJFyHpEHs+EaddtTfr6NLgq0xIMY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ+vOlri; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ+vOlri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729590760; x=1761126760;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zXoiG2TbToCoqax7LPjRdLwjuqfVmhmXD2428rtDS8k=;
  b=kQ+vOlritIzKwr6c3VvMMAUc/KPHAPkLoUS6OCySdGB8HRRA634mTTcd
   xe6Xbd2dtm2rI2qE3+dBLcN77tUSYJWQzMK/QqiotTqvzde9BlYOczaVF
   3/pISU7PdPEiumKX/rKxnQNV5+cGlr/Ib4se0xZJF8cnu3pb8SVTp5hEA
   8dZYH7IV7uqSbTCZRYac5+vKs108nNCjHXBMNYIR1XeakyvrwVGBQfREJ
   rvJ8/MN6UfsoEOY9J6eE9INZ5UbOJxfrqEL27FFdw7L3guzeNEBiioeLM
   nc7D1XUL5T4Y2gzrfcnNuqoMNNQVBAzSUTn5a+qj+GsUSh0U7VDWC7TM9
   g==;
X-CSE-ConnectionGUID: BqKCiip+Q0my4q+ffunJpg==
X-CSE-MsgGUID: Dd1He35xRCSEwYp4u4wMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29005386"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29005386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 02:52:33 -0700
X-CSE-ConnectionGUID: 2wOcR1frQBq3CjEBf/C+aQ==
X-CSE-MsgGUID: XcY5Yo0SRomA7UYTp7UfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="117244433"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2024 02:52:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3BYy-000TPo-0X;
	Tue, 22 Oct 2024 09:52:28 +0000
Date: Tue, 22 Oct 2024 17:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi 13/210]
 arch/arm64/boot/dts/apple/t8103.dtsi:673.43-676.8: Warning
 (unique_unit_address_if_enabled):
 /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate
 unit-address (also used in node
 /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@...
Message-ID: <202410221746.IR05GADQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi
head:   de1c5a8be0ee99602e472f3ca861cc2d249597da
commit: d7ec904dbc428ea8795da845ff5dac001657c6d4 [13/210] arm64: dts: apple: Add PMU NVMEM and SMC RTC/reboot nodes
:::::: branch date: 4 weeks ago
:::::: commit date: 5 weeks ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241022/202410221746.IR05GADQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221746.IR05GADQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410221746.IR05GADQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103.dtsi:673.43-676.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:62.10-71.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:87.10-96.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +673 arch/arm64/boot/dts/apple/t8103.dtsi

7d2d16ccf15d8e Hector Martin     2021-02-04    15  
7d2d16ccf15d8e Hector Martin     2021-02-04    16  / {
7d2d16ccf15d8e Hector Martin     2021-02-04    17  	compatible = "apple,t8103", "apple,arm-platform";
7d2d16ccf15d8e Hector Martin     2021-02-04    18  
7d2d16ccf15d8e Hector Martin     2021-02-04    19  	#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    20  	#size-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    21  
7d2d16ccf15d8e Hector Martin     2021-02-04    22  	cpus {
7d2d16ccf15d8e Hector Martin     2021-02-04    23  		#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    24  		#size-cells = <0>;
7d2d16ccf15d8e Hector Martin     2021-02-04    25  
3e895a6460ec38 Hector Martin     2022-05-03    26  		cpu-map {
3e895a6460ec38 Hector Martin     2022-05-03    27  			cluster0 {
3e895a6460ec38 Hector Martin     2022-05-03    28  				core0 {
3e895a6460ec38 Hector Martin     2022-05-03    29  					cpu = <&cpu_e0>;
3e895a6460ec38 Hector Martin     2022-05-03    30  				};
3e895a6460ec38 Hector Martin     2022-05-03    31  				core1 {
3e895a6460ec38 Hector Martin     2022-05-03    32  					cpu = <&cpu_e1>;
3e895a6460ec38 Hector Martin     2022-05-03    33  				};
3e895a6460ec38 Hector Martin     2022-05-03    34  				core2 {
3e895a6460ec38 Hector Martin     2022-05-03    35  					cpu = <&cpu_e2>;
3e895a6460ec38 Hector Martin     2022-05-03    36  				};
3e895a6460ec38 Hector Martin     2022-05-03    37  				core3 {
3e895a6460ec38 Hector Martin     2022-05-03    38  					cpu = <&cpu_e3>;
3e895a6460ec38 Hector Martin     2022-05-03    39  				};
3e895a6460ec38 Hector Martin     2022-05-03    40  			};
3e895a6460ec38 Hector Martin     2022-05-03    41  
3e895a6460ec38 Hector Martin     2022-05-03    42  			cluster1 {
3e895a6460ec38 Hector Martin     2022-05-03    43  				core0 {
3e895a6460ec38 Hector Martin     2022-05-03    44  					cpu = <&cpu_p0>;
3e895a6460ec38 Hector Martin     2022-05-03    45  				};
3e895a6460ec38 Hector Martin     2022-05-03    46  				core1 {
3e895a6460ec38 Hector Martin     2022-05-03    47  					cpu = <&cpu_p1>;
3e895a6460ec38 Hector Martin     2022-05-03    48  				};
3e895a6460ec38 Hector Martin     2022-05-03    49  				core2 {
3e895a6460ec38 Hector Martin     2022-05-03    50  					cpu = <&cpu_p2>;
3e895a6460ec38 Hector Martin     2022-05-03    51  				};
3e895a6460ec38 Hector Martin     2022-05-03    52  				core3 {
3e895a6460ec38 Hector Martin     2022-05-03    53  					cpu = <&cpu_p3>;
3e895a6460ec38 Hector Martin     2022-05-03    54  				};
3e895a6460ec38 Hector Martin     2022-05-03    55  			};
3e895a6460ec38 Hector Martin     2022-05-03    56  		};
3e895a6460ec38 Hector Martin     2022-05-03    57  
3e895a6460ec38 Hector Martin     2022-05-03    58  		cpu_e0: cpu@0 {
7d2d16ccf15d8e Hector Martin     2021-02-04    59  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04    60  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04    61  			reg = <0x0 0x0>;
7d2d16ccf15d8e Hector Martin     2021-02-04    62  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04    63  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03    64  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03    65  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03    66  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    67  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    68  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    69  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04    70  		};
7d2d16ccf15d8e Hector Martin     2021-02-04    71  
3e895a6460ec38 Hector Martin     2022-05-03    72  		cpu_e1: cpu@1 {
7d2d16ccf15d8e Hector Martin     2021-02-04    73  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04    74  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04    75  			reg = <0x0 0x1>;
7d2d16ccf15d8e Hector Martin     2021-02-04    76  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04    77  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03    78  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03    79  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03    80  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    81  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    82  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    83  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04    84  		};
7d2d16ccf15d8e Hector Martin     2021-02-04    85  
3e895a6460ec38 Hector Martin     2022-05-03    86  		cpu_e2: cpu@2 {
7d2d16ccf15d8e Hector Martin     2021-02-04    87  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04    88  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04    89  			reg = <0x0 0x2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    90  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04    91  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03    92  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03    93  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03    94  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    95  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    96  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    97  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04    98  		};
7d2d16ccf15d8e Hector Martin     2021-02-04    99  
3e895a6460ec38 Hector Martin     2022-05-03   100  		cpu_e3: cpu@3 {
7d2d16ccf15d8e Hector Martin     2021-02-04   101  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   102  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   103  			reg = <0x0 0x3>;
7d2d16ccf15d8e Hector Martin     2021-02-04   104  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   105  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   106  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   107  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03   108  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   109  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   110  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   111  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   112  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   113  
3e895a6460ec38 Hector Martin     2022-05-03   114  		cpu_p0: cpu@10100 {
7d2d16ccf15d8e Hector Martin     2021-02-04   115  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   116  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   117  			reg = <0x0 0x10100>;
7d2d16ccf15d8e Hector Martin     2021-02-04   118  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   119  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   120  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   121  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   122  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   123  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   124  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   125  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   126  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   127  
3e895a6460ec38 Hector Martin     2022-05-03   128  		cpu_p1: cpu@10101 {
7d2d16ccf15d8e Hector Martin     2021-02-04   129  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   130  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   131  			reg = <0x0 0x10101>;
7d2d16ccf15d8e Hector Martin     2021-02-04   132  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   133  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   134  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   135  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   136  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   137  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   138  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   139  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   140  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   141  
3e895a6460ec38 Hector Martin     2022-05-03   142  		cpu_p2: cpu@10102 {
7d2d16ccf15d8e Hector Martin     2021-02-04   143  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   144  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   145  			reg = <0x0 0x10102>;
7d2d16ccf15d8e Hector Martin     2021-02-04   146  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   147  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   148  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   149  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   150  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   151  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   152  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   153  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   154  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   155  
3e895a6460ec38 Hector Martin     2022-05-03   156  		cpu_p3: cpu@10103 {
7d2d16ccf15d8e Hector Martin     2021-02-04   157  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   158  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   159  			reg = <0x0 0x10103>;
7d2d16ccf15d8e Hector Martin     2021-02-04   160  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   161  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   162  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   163  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   164  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   165  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   166  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   167  			d-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   168  		};
9ecb7a4b8ac67c Janne Grunau      2022-12-06   169  
9ecb7a4b8ac67c Janne Grunau      2022-12-06   170  		l2_cache_0: l2-cache-0 {
9ecb7a4b8ac67c Janne Grunau      2022-12-06   171  			compatible = "cache";
9ecb7a4b8ac67c Janne Grunau      2022-12-06   172  			cache-level = <2>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   173  			cache-unified;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   174  			cache-size = <0x400000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   175  		};
9ecb7a4b8ac67c Janne Grunau      2022-12-06   176  
9ecb7a4b8ac67c Janne Grunau      2022-12-06   177  		l2_cache_1: l2-cache-1 {
9ecb7a4b8ac67c Janne Grunau      2022-12-06   178  			compatible = "cache";
9ecb7a4b8ac67c Janne Grunau      2022-12-06   179  			cache-level = <2>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   180  			cache-unified;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   181  			cache-size = <0xc00000>;
3e895a6460ec38 Hector Martin     2022-05-03   182  		};
3e895a6460ec38 Hector Martin     2022-05-03   183  	};
3e895a6460ec38 Hector Martin     2022-05-03   184  
3e895a6460ec38 Hector Martin     2022-05-03   185  	ecluster_opp: opp-table-0 {
3e895a6460ec38 Hector Martin     2022-05-03   186  		compatible = "operating-points-v2";
3e895a6460ec38 Hector Martin     2022-05-03   187  
3e895a6460ec38 Hector Martin     2022-05-03   188  		opp01 {
3e895a6460ec38 Hector Martin     2022-05-03   189  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38 Hector Martin     2022-05-03   190  			opp-level = <1>;
3e895a6460ec38 Hector Martin     2022-05-03   191  			clock-latency-ns = <7500>;
7d2d16ccf15d8e Hector Martin     2021-02-04   192  		};
3e895a6460ec38 Hector Martin     2022-05-03   193  		opp02 {
3e895a6460ec38 Hector Martin     2022-05-03   194  			opp-hz = /bits/ 64 <972000000>;
3e895a6460ec38 Hector Martin     2022-05-03   195  			opp-level = <2>;
3e895a6460ec38 Hector Martin     2022-05-03   196  			clock-latency-ns = <22000>;
3e895a6460ec38 Hector Martin     2022-05-03   197  		};
3e895a6460ec38 Hector Martin     2022-05-03   198  		opp03 {
3e895a6460ec38 Hector Martin     2022-05-03   199  			opp-hz = /bits/ 64 <1332000000>;
3e895a6460ec38 Hector Martin     2022-05-03   200  			opp-level = <3>;
3e895a6460ec38 Hector Martin     2022-05-03   201  			clock-latency-ns = <27000>;
3e895a6460ec38 Hector Martin     2022-05-03   202  		};
3e895a6460ec38 Hector Martin     2022-05-03   203  		opp04 {
3e895a6460ec38 Hector Martin     2022-05-03   204  			opp-hz = /bits/ 64 <1704000000>;
3e895a6460ec38 Hector Martin     2022-05-03   205  			opp-level = <4>;
3e895a6460ec38 Hector Martin     2022-05-03   206  			clock-latency-ns = <33000>;
3e895a6460ec38 Hector Martin     2022-05-03   207  		};
3e895a6460ec38 Hector Martin     2022-05-03   208  		opp05 {
3e895a6460ec38 Hector Martin     2022-05-03   209  			opp-hz = /bits/ 64 <2064000000>;
3e895a6460ec38 Hector Martin     2022-05-03   210  			opp-level = <5>;
3e895a6460ec38 Hector Martin     2022-05-03   211  			clock-latency-ns = <50000>;
3e895a6460ec38 Hector Martin     2022-05-03   212  		};
3e895a6460ec38 Hector Martin     2022-05-03   213  	};
3e895a6460ec38 Hector Martin     2022-05-03   214  
3e895a6460ec38 Hector Martin     2022-05-03   215  	pcluster_opp: opp-table-1 {
3e895a6460ec38 Hector Martin     2022-05-03   216  		compatible = "operating-points-v2";
3e895a6460ec38 Hector Martin     2022-05-03   217  
3e895a6460ec38 Hector Martin     2022-05-03   218  		opp01 {
3e895a6460ec38 Hector Martin     2022-05-03   219  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38 Hector Martin     2022-05-03   220  			opp-level = <1>;
3e895a6460ec38 Hector Martin     2022-05-03   221  			clock-latency-ns = <8000>;
3e895a6460ec38 Hector Martin     2022-05-03   222  		};
3e895a6460ec38 Hector Martin     2022-05-03   223  		opp02 {
3e895a6460ec38 Hector Martin     2022-05-03   224  			opp-hz = /bits/ 64 <828000000>;
3e895a6460ec38 Hector Martin     2022-05-03   225  			opp-level = <2>;
3e895a6460ec38 Hector Martin     2022-05-03   226  			clock-latency-ns = <19000>;
3e895a6460ec38 Hector Martin     2022-05-03   227  		};
3e895a6460ec38 Hector Martin     2022-05-03   228  		opp03 {
3e895a6460ec38 Hector Martin     2022-05-03   229  			opp-hz = /bits/ 64 <1056000000>;
3e895a6460ec38 Hector Martin     2022-05-03   230  			opp-level = <3>;
3e895a6460ec38 Hector Martin     2022-05-03   231  			clock-latency-ns = <21000>;
3e895a6460ec38 Hector Martin     2022-05-03   232  		};
3e895a6460ec38 Hector Martin     2022-05-03   233  		opp04 {
3e895a6460ec38 Hector Martin     2022-05-03   234  			opp-hz = /bits/ 64 <1284000000>;
3e895a6460ec38 Hector Martin     2022-05-03   235  			opp-level = <4>;
3e895a6460ec38 Hector Martin     2022-05-03   236  			clock-latency-ns = <23000>;
3e895a6460ec38 Hector Martin     2022-05-03   237  		};
3e895a6460ec38 Hector Martin     2022-05-03   238  		opp05 {
3e895a6460ec38 Hector Martin     2022-05-03   239  			opp-hz = /bits/ 64 <1500000000>;
3e895a6460ec38 Hector Martin     2022-05-03   240  			opp-level = <5>;
3e895a6460ec38 Hector Martin     2022-05-03   241  			clock-latency-ns = <24000>;
3e895a6460ec38 Hector Martin     2022-05-03   242  		};
3e895a6460ec38 Hector Martin     2022-05-03   243  		opp06 {
3e895a6460ec38 Hector Martin     2022-05-03   244  			opp-hz = /bits/ 64 <1728000000>;
3e895a6460ec38 Hector Martin     2022-05-03   245  			opp-level = <6>;
3e895a6460ec38 Hector Martin     2022-05-03   246  			clock-latency-ns = <29000>;
3e895a6460ec38 Hector Martin     2022-05-03   247  		};
3e895a6460ec38 Hector Martin     2022-05-03   248  		opp07 {
3e895a6460ec38 Hector Martin     2022-05-03   249  			opp-hz = /bits/ 64 <1956000000>;
3e895a6460ec38 Hector Martin     2022-05-03   250  			opp-level = <7>;
3e895a6460ec38 Hector Martin     2022-05-03   251  			clock-latency-ns = <31000>;
3e895a6460ec38 Hector Martin     2022-05-03   252  		};
3e895a6460ec38 Hector Martin     2022-05-03   253  		opp08 {
3e895a6460ec38 Hector Martin     2022-05-03   254  			opp-hz = /bits/ 64 <2184000000>;
3e895a6460ec38 Hector Martin     2022-05-03   255  			opp-level = <8>;
3e895a6460ec38 Hector Martin     2022-05-03   256  			clock-latency-ns = <34000>;
3e895a6460ec38 Hector Martin     2022-05-03   257  		};
3e895a6460ec38 Hector Martin     2022-05-03   258  		opp09 {
3e895a6460ec38 Hector Martin     2022-05-03   259  			opp-hz = /bits/ 64 <2388000000>;
3e895a6460ec38 Hector Martin     2022-05-03   260  			opp-level = <9>;
3e895a6460ec38 Hector Martin     2022-05-03   261  			clock-latency-ns = <36000>;
3e895a6460ec38 Hector Martin     2022-05-03   262  		};
3e895a6460ec38 Hector Martin     2022-05-03   263  		opp10 {
3e895a6460ec38 Hector Martin     2022-05-03   264  			opp-hz = /bits/ 64 <2592000000>;
3e895a6460ec38 Hector Martin     2022-05-03   265  			opp-level = <10>;
3e895a6460ec38 Hector Martin     2022-05-03   266  			clock-latency-ns = <51000>;
3e895a6460ec38 Hector Martin     2022-05-03   267  		};
3e895a6460ec38 Hector Martin     2022-05-03   268  		opp11 {
3e895a6460ec38 Hector Martin     2022-05-03   269  			opp-hz = /bits/ 64 <2772000000>;
3e895a6460ec38 Hector Martin     2022-05-03   270  			opp-level = <11>;
3e895a6460ec38 Hector Martin     2022-05-03   271  			clock-latency-ns = <54000>;
3e895a6460ec38 Hector Martin     2022-05-03   272  		};
3e895a6460ec38 Hector Martin     2022-05-03   273  		opp12 {
3e895a6460ec38 Hector Martin     2022-05-03   274  			opp-hz = /bits/ 64 <2988000000>;
3e895a6460ec38 Hector Martin     2022-05-03   275  			opp-level = <12>;
3e895a6460ec38 Hector Martin     2022-05-03   276  			clock-latency-ns = <55000>;
3e895a6460ec38 Hector Martin     2022-05-03   277  		};
3e895a6460ec38 Hector Martin     2022-05-03   278  #if 0
3e895a6460ec38 Hector Martin     2022-05-03   279  		/* Not available until CPU deep sleep is implemented */
3e895a6460ec38 Hector Martin     2022-05-03   280  		opp13 {
3e895a6460ec38 Hector Martin     2022-05-03   281  			opp-hz = /bits/ 64 <3096000000>;
3e895a6460ec38 Hector Martin     2022-05-03   282  			opp-level = <13>;
3e895a6460ec38 Hector Martin     2022-05-03   283  			clock-latency-ns = <55000>;
3e895a6460ec38 Hector Martin     2022-05-03   284  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03   285  		};
3e895a6460ec38 Hector Martin     2022-05-03   286  		opp14 {
3e895a6460ec38 Hector Martin     2022-05-03   287  			opp-hz = /bits/ 64 <3144000000>;
3e895a6460ec38 Hector Martin     2022-05-03   288  			opp-level = <14>;
3e895a6460ec38 Hector Martin     2022-05-03   289  			clock-latency-ns = <56000>;
3e895a6460ec38 Hector Martin     2022-05-03   290  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03   291  		};
3e895a6460ec38 Hector Martin     2022-05-03   292  		opp15 {
3e895a6460ec38 Hector Martin     2022-05-03   293  			opp-hz = /bits/ 64 <3204000000>;
3e895a6460ec38 Hector Martin     2022-05-03   294  			opp-level = <15>;
3e895a6460ec38 Hector Martin     2022-05-03   295  			clock-latency-ns = <56000>;
3e895a6460ec38 Hector Martin     2022-05-03   296  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03   297  		};
3e895a6460ec38 Hector Martin     2022-05-03   298  #endif
7d2d16ccf15d8e Hector Martin     2021-02-04   299  	};
7d2d16ccf15d8e Hector Martin     2021-02-04   300  
7d2d16ccf15d8e Hector Martin     2021-02-04   301  	timer {
7d2d16ccf15d8e Hector Martin     2021-02-04   302  		compatible = "arm,armv8-timer";
7d2d16ccf15d8e Hector Martin     2021-02-04   303  		interrupt-parent = <&aic>;
7d2d16ccf15d8e Hector Martin     2021-02-04   304  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
7d2d16ccf15d8e Hector Martin     2021-02-04   305  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04   306  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04   307  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04   308  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8e Hector Martin     2021-02-04   309  	};
7d2d16ccf15d8e Hector Martin     2021-02-04   310  
0f522efcd79634 Marc Zyngier      2021-11-02   311  	pmu-e {
0f522efcd79634 Marc Zyngier      2021-11-02   312  		compatible = "apple,icestorm-pmu";
0f522efcd79634 Marc Zyngier      2021-11-02   313  		interrupt-parent = <&aic>;
0f522efcd79634 Marc Zyngier      2021-11-02   314  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634 Marc Zyngier      2021-11-02   315  	};
0f522efcd79634 Marc Zyngier      2021-11-02   316  
0f522efcd79634 Marc Zyngier      2021-11-02   317  	pmu-p {
0f522efcd79634 Marc Zyngier      2021-11-02   318  		compatible = "apple,firestorm-pmu";
0f522efcd79634 Marc Zyngier      2021-11-02   319  		interrupt-parent = <&aic>;
0f522efcd79634 Marc Zyngier      2021-11-02   320  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634 Marc Zyngier      2021-11-02   321  	};
0f522efcd79634 Marc Zyngier      2021-11-02   322  
57337b25244212 Hector Martin     2021-10-05   323  	clkref: clock-ref {
7d2d16ccf15d8e Hector Martin     2021-02-04   324  		compatible = "fixed-clock";
7d2d16ccf15d8e Hector Martin     2021-02-04   325  		#clock-cells = <0>;
7d2d16ccf15d8e Hector Martin     2021-02-04   326  		clock-frequency = <24000000>;
57337b25244212 Hector Martin     2021-10-05   327  		clock-output-names = "clkref";
7d2d16ccf15d8e Hector Martin     2021-02-04   328  	};
7d2d16ccf15d8e Hector Martin     2021-02-04   329  
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   330  	clk_120m: clock-120m {
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   331  		compatible = "fixed-clock";
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   332  		#clock-cells = <0>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   333  		clock-frequency = <120000000>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   334  		clock-output-names = "clk_120m";
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   335  	};
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   336  
8a3df85ad87d2e Martin Povišer    2022-09-16   337  	/*
8a3df85ad87d2e Martin Povišer    2022-09-16   338  	 * This is a fabulated representation of the input clock
8a3df85ad87d2e Martin Povišer    2022-09-16   339  	 * to NCO since we don't know the true clock tree.
8a3df85ad87d2e Martin Povišer    2022-09-16   340  	 */
8a3df85ad87d2e Martin Povišer    2022-09-16   341  	nco_clkref: clock-ref-nco {
8a3df85ad87d2e Martin Povišer    2022-09-16   342  		compatible = "fixed-clock";
8a3df85ad87d2e Martin Povišer    2022-09-16   343  		#clock-cells = <0>;
8a3df85ad87d2e Martin Povišer    2022-09-16   344  		clock-output-names = "nco_ref";
8a3df85ad87d2e Martin Povišer    2022-09-16   345  	};
8a3df85ad87d2e Martin Povišer    2022-09-16   346  
7d2d16ccf15d8e Hector Martin     2021-02-04   347  	soc {
7d2d16ccf15d8e Hector Martin     2021-02-04   348  		compatible = "simple-bus";
7d2d16ccf15d8e Hector Martin     2021-02-04   349  		#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   350  		#size-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   351  
7d2d16ccf15d8e Hector Martin     2021-02-04   352  		ranges;
7d2d16ccf15d8e Hector Martin     2021-02-04   353  		nonposted-mmio;
7d2d16ccf15d8e Hector Martin     2021-02-04   354  
3e895a6460ec38 Hector Martin     2022-05-03   355  		cpufreq_e: performance-controller@210e20000 {
3e895a6460ec38 Hector Martin     2022-05-03   356  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38 Hector Martin     2022-05-03   357  			reg = <0x2 0x10e20000 0 0x1000>;
3e895a6460ec38 Hector Martin     2022-05-03   358  			#performance-domain-cells = <0>;
3e895a6460ec38 Hector Martin     2022-05-03   359  		};
3e895a6460ec38 Hector Martin     2022-05-03   360  
3e895a6460ec38 Hector Martin     2022-05-03   361  		cpufreq_p: performance-controller@211e20000 {
3e895a6460ec38 Hector Martin     2022-05-03   362  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38 Hector Martin     2022-05-03   363  			reg = <0x2 0x11e20000 0 0x1000>;
3e895a6460ec38 Hector Martin     2022-05-03   364  			#performance-domain-cells = <0>;
3e895a6460ec38 Hector Martin     2022-05-03   365  		};
3e895a6460ec38 Hector Martin     2022-05-03   366  
63bf0b66ddfa67 Hector Martin     2022-12-05   367  		sio_dart: iommu@235004000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   368  			compatible = "apple,t8103-dart";
8a3df85ad87d2e Martin Povišer    2022-09-16   369  			reg = <0x2 0x35004000 0x0 0x4000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   370  			interrupt-parent = <&aic>;
8a3df85ad87d2e Martin Povišer    2022-09-16   371  			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e Martin Povišer    2022-09-16   372  			#iommu-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16   373  			power-domains = <&ps_sio_cpu>;
8a3df85ad87d2e Martin Povišer    2022-09-16   374  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   375  
90458f6eec42aa Janne Grunau      2021-11-23   376  		i2c0: i2c@235010000 {
90458f6eec42aa Janne Grunau      2021-11-23   377  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   378  			reg = <0x2 0x35010000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   379  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   380  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   381  			interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   382  			pinctrl-0 = <&i2c0_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   383  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   384  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   385  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   386  			power-domains = <&ps_i2c0>;
90458f6eec42aa Janne Grunau      2021-11-23   387  		};
90458f6eec42aa Janne Grunau      2021-11-23   388  
90458f6eec42aa Janne Grunau      2021-11-23   389  		i2c1: i2c@235014000 {
90458f6eec42aa Janne Grunau      2021-11-23   390  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   391  			reg = <0x2 0x35014000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   392  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   393  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   394  			interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   395  			pinctrl-0 = <&i2c1_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   396  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   397  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   398  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   399  			power-domains = <&ps_i2c1>;
90458f6eec42aa Janne Grunau      2021-11-23   400  		};
90458f6eec42aa Janne Grunau      2021-11-23   401  
90458f6eec42aa Janne Grunau      2021-11-23   402  		i2c2: i2c@235018000 {
90458f6eec42aa Janne Grunau      2021-11-23   403  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   404  			reg = <0x2 0x35018000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   405  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   406  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   407  			interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   408  			pinctrl-0 = <&i2c2_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   409  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   410  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   411  			#size-cells = <0x0>;
90458f6eec42aa Janne Grunau      2021-11-23   412  			status = "disabled"; /* not used in all devices */
106ba3b48a35dd Hector Martin     2021-11-24   413  			power-domains = <&ps_i2c2>;
90458f6eec42aa Janne Grunau      2021-11-23   414  		};
90458f6eec42aa Janne Grunau      2021-11-23   415  
90458f6eec42aa Janne Grunau      2021-11-23   416  		i2c3: i2c@23501c000 {
90458f6eec42aa Janne Grunau      2021-11-23   417  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   418  			reg = <0x2 0x3501c000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   419  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   420  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   421  			interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   422  			pinctrl-0 = <&i2c3_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   423  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   424  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   425  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   426  			power-domains = <&ps_i2c3>;
90458f6eec42aa Janne Grunau      2021-11-23   427  		};
90458f6eec42aa Janne Grunau      2021-11-23   428  
90458f6eec42aa Janne Grunau      2021-11-23   429  		i2c4: i2c@235020000 {
90458f6eec42aa Janne Grunau      2021-11-23   430  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   431  			reg = <0x2 0x35020000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   432  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   433  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   434  			interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   435  			pinctrl-0 = <&i2c4_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   436  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   437  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   438  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   439  			power-domains = <&ps_i2c4>;
90458f6eec42aa Janne Grunau      2021-11-23   440  			status = "disabled"; /* only used in J293 */
90458f6eec42aa Janne Grunau      2021-11-23   441  		};
90458f6eec42aa Janne Grunau      2021-11-23   442  
348981c783b985 Sasha Finkelstein 2023-04-03   443  		fpwm1: pwm@235044000 {
348981c783b985 Sasha Finkelstein 2023-04-03   444  			compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
348981c783b985 Sasha Finkelstein 2023-04-03   445  			reg = <0x2 0x35044000 0x0 0x4000>;
348981c783b985 Sasha Finkelstein 2023-04-03   446  			power-domains = <&ps_fpwm1>;
348981c783b985 Sasha Finkelstein 2023-04-03   447  			clocks = <&clkref>;
348981c783b985 Sasha Finkelstein 2023-04-03   448  			#pwm-cells = <2>;
348981c783b985 Sasha Finkelstein 2023-04-03   449  			status = "disabled";
348981c783b985 Sasha Finkelstein 2023-04-03   450  		};
348981c783b985 Sasha Finkelstein 2023-04-03   451  
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   452  		spi3: spi@23510c000 {
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   453  			compatible = "apple,t8103-spi", "apple,spi";
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   454  			reg = <0x2 0x3510c000 0x0 0x4000>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   455  			interrupt-parent = <&aic>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   456  			interrupts = <AIC_IRQ 617 IRQ_TYPE_LEVEL_HIGH>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   457  			clocks = <&clk_120m>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   458  			pinctrl-0 = <&spi3_pins>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   459  			pinctrl-names = "default";
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   460  			power-domains = <&ps_spi3>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   461  			#address-cells = <1>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   462  			#size-cells = <0>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   463  			status = "disabled"; /* only used in J293/J313 */
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   464  		};
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   465  
7d2d16ccf15d8e Hector Martin     2021-02-04   466  		serial0: serial@235200000 {
7d2d16ccf15d8e Hector Martin     2021-02-04   467  			compatible = "apple,s5l-uart";
7d2d16ccf15d8e Hector Martin     2021-02-04   468  			reg = <0x2 0x35200000 0x0 0x1000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   469  			reg-io-width = <4>;
7d2d16ccf15d8e Hector Martin     2021-02-04   470  			interrupt-parent = <&aic>;
7d2d16ccf15d8e Hector Martin     2021-02-04   471  			interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8e Hector Martin     2021-02-04   472  			/*
7d2d16ccf15d8e Hector Martin     2021-02-04   473  			 * TODO: figure out the clocking properly, there may
7d2d16ccf15d8e Hector Martin     2021-02-04   474  			 * be a third selectable clock.
7d2d16ccf15d8e Hector Martin     2021-02-04   475  			 */
57337b25244212 Hector Martin     2021-10-05   476  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8e Hector Martin     2021-02-04   477  			clock-names = "uart", "clk_uart_baud0";
106ba3b48a35dd Hector Martin     2021-11-24   478  			power-domains = <&ps_uart0>;
7d2d16ccf15d8e Hector Martin     2021-02-04   479  			status = "disabled";
7d2d16ccf15d8e Hector Martin     2021-02-04   480  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   481  
2ba22cfeda4456 Hector Martin     2021-09-20   482  		serial2: serial@235208000 {
2ba22cfeda4456 Hector Martin     2021-09-20   483  			compatible = "apple,s5l-uart";
2ba22cfeda4456 Hector Martin     2021-09-20   484  			reg = <0x2 0x35208000 0x0 0x1000>;
2ba22cfeda4456 Hector Martin     2021-09-20   485  			reg-io-width = <4>;
2ba22cfeda4456 Hector Martin     2021-09-20   486  			interrupt-parent = <&aic>;
2ba22cfeda4456 Hector Martin     2021-09-20   487  			interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
57337b25244212 Hector Martin     2021-10-05   488  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8e Hector Martin     2021-02-04   489  			clock-names = "uart", "clk_uart_baud0";
2ba22cfeda4456 Hector Martin     2021-09-20   490  			power-domains = <&ps_uart2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   491  			status = "disabled";
7d2d16ccf15d8e Hector Martin     2021-02-04   492  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   493  
8a3df85ad87d2e Martin Povišer    2022-09-16   494  		admac: dma-controller@238200000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   495  			compatible = "apple,t8103-admac", "apple,admac";
8a3df85ad87d2e Martin Povišer    2022-09-16   496  			reg = <0x2 0x38200000 0x0 0x34000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   497  			dma-channels = <24>;
8a3df85ad87d2e Martin Povišer    2022-09-16   498  			interrupts-extended = <0>,
8a3df85ad87d2e Martin Povišer    2022-09-16   499  					      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   500  					      <0>,
8a3df85ad87d2e Martin Povišer    2022-09-16   501  					      <0>;
8a3df85ad87d2e Martin Povišer    2022-09-16   502  			#dma-cells = <1>;
63bf0b66ddfa67 Hector Martin     2022-12-05   503  			iommus = <&sio_dart 2>;
8a3df85ad87d2e Martin Povišer    2022-09-16   504  			power-domains = <&ps_sio_adma>;
56fed763f6b2dc Martin Povišer    2022-09-18   505  			resets = <&ps_audio_p>;
8a3df85ad87d2e Martin Povišer    2022-09-16   506  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   507  
8a3df85ad87d2e Martin Povišer    2022-09-16   508  		mca: i2s@238400000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   509  			compatible = "apple,t8103-mca", "apple,mca";
8a3df85ad87d2e Martin Povišer    2022-09-16   510  			reg = <0x2 0x38400000 0x0 0x18000>,
8a3df85ad87d2e Martin Povišer    2022-09-16   511  			      <0x2 0x38300000 0x0 0x30000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   512  
8a3df85ad87d2e Martin Povišer    2022-09-16   513  			interrupt-parent = <&aic>;
8a3df85ad87d2e Martin Povišer    2022-09-16   514  			interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   515  				     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   516  				     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   517  				     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   518  				     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   519  				     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e Martin Povišer    2022-09-16   520  
8a3df85ad87d2e Martin Povišer    2022-09-16   521  			resets = <&ps_audio_p>;
8a3df85ad87d2e Martin Povišer    2022-09-16   522  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
8a3df85ad87d2e Martin Povišer    2022-09-16   523  				 <&nco 3>, <&nco 4>, <&nco 4>;
8a3df85ad87d2e Martin Povišer    2022-09-16   524  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
8a3df85ad87d2e Martin Povišer    2022-09-16   525  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
8a3df85ad87d2e Martin Povišer    2022-09-16   526  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
8a3df85ad87d2e Martin Povišer    2022-09-16   527  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
8a3df85ad87d2e Martin Povišer    2022-09-16   528  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
8a3df85ad87d2e Martin Povišer    2022-09-16   529  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
8a3df85ad87d2e Martin Povišer    2022-09-16   530  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
8a3df85ad87d2e Martin Povišer    2022-09-16   531  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
8a3df85ad87d2e Martin Povišer    2022-09-16   532  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
8a3df85ad87d2e Martin Povišer    2022-09-16   533  				"tx1a", "rx1a", "tx1b", "rx1b",
8a3df85ad87d2e Martin Povišer    2022-09-16   534  				"tx2a", "rx2a", "tx2b", "rx2b",
8a3df85ad87d2e Martin Povišer    2022-09-16   535  				"tx3a", "rx3a", "tx3b", "rx3b",
8a3df85ad87d2e Martin Povišer    2022-09-16   536  				"tx4a", "rx4a", "tx4b", "rx4b",
8a3df85ad87d2e Martin Povišer    2022-09-16   537  				"tx5a", "rx5a", "tx5b", "rx5b";
8a3df85ad87d2e Martin Povišer    2022-09-16   538  
8a3df85ad87d2e Martin Povišer    2022-09-16   539  			#sound-dai-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16   540  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   541  
8a3df85ad87d2e Martin Povišer    2022-09-16   542  		nco: clock-controller@23b044000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   543  			compatible = "apple,t8103-nco", "apple,nco";
8a3df85ad87d2e Martin Povišer    2022-09-16   544  			reg = <0x2 0x3b044000 0x0 0x14000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   545  			clocks = <&nco_clkref>;
8a3df85ad87d2e Martin Povišer    2022-09-16   546  			#clock-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16   547  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   548  
7d2d16ccf15d8e Hector Martin     2021-02-04   549  		aic: interrupt-controller@23b100000 {
7d2d16ccf15d8e Hector Martin     2021-02-04   550  			compatible = "apple,t8103-aic", "apple,aic";
7d2d16ccf15d8e Hector Martin     2021-02-04   551  			#interrupt-cells = <3>;
7d2d16ccf15d8e Hector Martin     2021-02-04   552  			interrupt-controller;
7d2d16ccf15d8e Hector Martin     2021-02-04   553  			reg = <0x2 0x3b100000 0x0 0x8000>;
106ba3b48a35dd Hector Martin     2021-11-24   554  			power-domains = <&ps_aic>;
1852e22b318b8d Marc Zyngier      2021-12-14   555  
1852e22b318b8d Marc Zyngier      2021-12-14   556  			affinities {
1852e22b318b8d Marc Zyngier      2021-12-14   557  				e-core-pmu-affinity {
1852e22b318b8d Marc Zyngier      2021-12-14   558  					apple,fiq-index = <AIC_CPU_PMU_E>;
3e895a6460ec38 Hector Martin     2022-05-03   559  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
1852e22b318b8d Marc Zyngier      2021-12-14   560  				};
1852e22b318b8d Marc Zyngier      2021-12-14   561  
1852e22b318b8d Marc Zyngier      2021-12-14   562  				p-core-pmu-affinity {
1852e22b318b8d Marc Zyngier      2021-12-14   563  					apple,fiq-index = <AIC_CPU_PMU_P>;
3e895a6460ec38 Hector Martin     2022-05-03   564  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
1852e22b318b8d Marc Zyngier      2021-12-14   565  				};
1852e22b318b8d Marc Zyngier      2021-12-14   566  			};
106ba3b48a35dd Hector Martin     2021-11-24   567  		};
106ba3b48a35dd Hector Martin     2021-11-24   568  
106ba3b48a35dd Hector Martin     2021-11-24   569  		pmgr: power-management@23b700000 {
106ba3b48a35dd Hector Martin     2021-11-24   570  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
106ba3b48a35dd Hector Martin     2021-11-24   571  			#address-cells = <1>;
106ba3b48a35dd Hector Martin     2021-11-24   572  			#size-cells = <1>;
106ba3b48a35dd Hector Martin     2021-11-24   573  			reg = <0x2 0x3b700000 0 0x14000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   574  		};
0a8282b831196b Mark Kettenis     2021-10-25   575  
0a8282b831196b Mark Kettenis     2021-10-25   576  		pinctrl_ap: pinctrl@23c100000 {
0a8282b831196b Mark Kettenis     2021-10-25   577  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25   578  			reg = <0x2 0x3c100000 0x0 0x100000>;
106ba3b48a35dd Hector Martin     2021-11-24   579  			power-domains = <&ps_gpio>;
0a8282b831196b Mark Kettenis     2021-10-25   580  
0a8282b831196b Mark Kettenis     2021-10-25   581  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25   582  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25   583  			gpio-ranges = <&pinctrl_ap 0 0 212>;
0a8282b831196b Mark Kettenis     2021-10-25   584  			apple,npins = <212>;
0a8282b831196b Mark Kettenis     2021-10-25   585  
0a8282b831196b Mark Kettenis     2021-10-25   586  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22   587  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25   588  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25   589  			interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   590  				     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   591  				     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   592  				     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   593  				     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   594  				     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   595  				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25   596  
90458f6eec42aa Janne Grunau      2021-11-23   597  			i2c0_pins: i2c0-pins {
90458f6eec42aa Janne Grunau      2021-11-23   598  				pinmux = <APPLE_PINMUX(192, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23   599  					 <APPLE_PINMUX(188, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25   600  			};
90458f6eec42aa Janne Grunau      2021-11-23   601  
90458f6eec42aa Janne Grunau      2021-11-23   602  			i2c1_pins: i2c1-pins {
90458f6eec42aa Janne Grunau      2021-11-23   603  				pinmux = <APPLE_PINMUX(201, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23   604  					 <APPLE_PINMUX(199, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25   605  			};
0a8282b831196b Mark Kettenis     2021-10-25   606  
90458f6eec42aa Janne Grunau      2021-11-23   607  			i2c2_pins: i2c2-pins {
90458f6eec42aa Janne Grunau      2021-11-23   608  				pinmux = <APPLE_PINMUX(163, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23   609  					 <APPLE_PINMUX(162, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23   610  			};
0a8282b831196b Mark Kettenis     2021-10-25   611  
90458f6eec42aa Janne Grunau      2021-11-23   612  			i2c3_pins: i2c3-pins {
90458f6eec42aa Janne Grunau      2021-11-23   613  				pinmux = <APPLE_PINMUX(73, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23   614  					 <APPLE_PINMUX(72, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23   615  			};
0a8282b831196b Mark Kettenis     2021-10-25   616  
90458f6eec42aa Janne Grunau      2021-11-23   617  			i2c4_pins: i2c4-pins {
90458f6eec42aa Janne Grunau      2021-11-23   618  				pinmux = <APPLE_PINMUX(135, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23   619  					 <APPLE_PINMUX(134, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23   620  			};
90458f6eec42aa Janne Grunau      2021-11-23   621  
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   622  			spi3_pins: spi3-pins {
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   623  				pinmux = <APPLE_PINMUX(46, 1)>,
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   624  					<APPLE_PINMUX(47, 1)>,
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   625  					<APPLE_PINMUX(48, 1)>,
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   626  					<APPLE_PINMUX(49, 1)>;
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   627  			};
2ec0cb42c8bfb8 Janne Grunau      2021-11-26   628  
0a8282b831196b Mark Kettenis     2021-10-25   629  			pcie_pins: pcie-pins {
0a8282b831196b Mark Kettenis     2021-10-25   630  				pinmux = <APPLE_PINMUX(150, 1)>,
0a8282b831196b Mark Kettenis     2021-10-25   631  					 <APPLE_PINMUX(151, 1)>,
0a8282b831196b Mark Kettenis     2021-10-25   632  					 <APPLE_PINMUX(32, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25   633  			};
0a8282b831196b Mark Kettenis     2021-10-25   634  		};
0a8282b831196b Mark Kettenis     2021-10-25   635  
d7ec904dbc428e Hector Martin     2022-02-15   636  		nub_spmi: spmi@23d0d9300 {
d7ec904dbc428e Hector Martin     2022-02-15   637  			compatible = "apple,t8103-spmi", "apple,spmi";
d7ec904dbc428e Hector Martin     2022-02-15   638  			reg = <0x2 0x3d0d9300 0x0 0x100>;
d7ec904dbc428e Hector Martin     2022-02-15   639  			#address-cells = <2>;
d7ec904dbc428e Hector Martin     2022-02-15   640  			#size-cells = <0>;
d7ec904dbc428e Hector Martin     2022-02-15   641  
d7ec904dbc428e Hector Martin     2022-02-15   642  			pmu1: pmu@f {
d7ec904dbc428e Hector Martin     2022-02-15   643  				compatible = "apple,sera-pmu", "apple,spmi-pmu";
d7ec904dbc428e Hector Martin     2022-02-15   644  				reg = <0xf SPMI_USID>;
d7ec904dbc428e Hector Martin     2022-02-15   645  				#address-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   646  				#size-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   647  
d7ec904dbc428e Hector Martin     2022-02-15   648  				rtc_nvmem@d000 {
d7ec904dbc428e Hector Martin     2022-02-15   649  					compatible = "apple,spmi-pmu-nvmem";
d7ec904dbc428e Hector Martin     2022-02-15   650  					reg = <0xd000 0x300>;
d7ec904dbc428e Hector Martin     2022-02-15   651  					#address-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   652  					#size-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   653  
d7ec904dbc428e Hector Martin     2022-02-15   654  					pm_setting: pm-setting@1 {
d7ec904dbc428e Hector Martin     2022-02-15   655  						reg = <0x1 0x1>;
d7ec904dbc428e Hector Martin     2022-02-15   656  					};
d7ec904dbc428e Hector Martin     2022-02-15   657  
d7ec904dbc428e Hector Martin     2022-02-15   658  					rtc_offset: rtc-offset@100 {
d7ec904dbc428e Hector Martin     2022-02-15   659  						reg = <0x100 0x6>;
d7ec904dbc428e Hector Martin     2022-02-15   660  					};
d7ec904dbc428e Hector Martin     2022-02-15   661  				};
d7ec904dbc428e Hector Martin     2022-02-15   662  
d7ec904dbc428e Hector Martin     2022-02-15   663  				legacy_nvmem@9f00 {
d7ec904dbc428e Hector Martin     2022-02-15   664  					compatible = "apple,spmi-pmu-nvmem";
d7ec904dbc428e Hector Martin     2022-02-15   665  					reg = <0x9f00 0x20>;
d7ec904dbc428e Hector Martin     2022-02-15   666  					#address-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   667  					#size-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   668  
d7ec904dbc428e Hector Martin     2022-02-15   669  					boot_stage: boot-stage@1 {
d7ec904dbc428e Hector Martin     2022-02-15   670  						reg = <0x1 0x1>;
d7ec904dbc428e Hector Martin     2022-02-15   671  					};
d7ec904dbc428e Hector Martin     2022-02-15   672  
d7ec904dbc428e Hector Martin     2022-02-15  @673  					boot_error_count: boot-error-count@2 {
d7ec904dbc428e Hector Martin     2022-02-15   674  						reg = <0x2 0x1>;
d7ec904dbc428e Hector Martin     2022-02-15   675  						bits = <0 4>;
d7ec904dbc428e Hector Martin     2022-02-15   676  					};
d7ec904dbc428e Hector Martin     2022-02-15   677  
d7ec904dbc428e Hector Martin     2022-02-15   678  					panic_count: panic-count@2 {
d7ec904dbc428e Hector Martin     2022-02-15   679  						reg = <0x2 0x1>;
d7ec904dbc428e Hector Martin     2022-02-15   680  						bits = <4 4>;
d7ec904dbc428e Hector Martin     2022-02-15   681  					};
d7ec904dbc428e Hector Martin     2022-02-15   682  
d7ec904dbc428e Hector Martin     2022-02-15   683  					boot_error_stage: boot-error-stage@3 {
d7ec904dbc428e Hector Martin     2022-02-15   684  						reg = <0x3 0x1>;
d7ec904dbc428e Hector Martin     2022-02-15   685  					};
d7ec904dbc428e Hector Martin     2022-02-15   686  
d7ec904dbc428e Hector Martin     2022-02-15   687  					shutdown_flag: shutdown-flag@f {
d7ec904dbc428e Hector Martin     2022-02-15   688  						reg = <0xf 0x1>;
d7ec904dbc428e Hector Martin     2022-02-15   689  						bits = <3 1>;
d7ec904dbc428e Hector Martin     2022-02-15   690  					};
d7ec904dbc428e Hector Martin     2022-02-15   691  				};
d7ec904dbc428e Hector Martin     2022-02-15   692  
d7ec904dbc428e Hector Martin     2022-02-15   693  				scrpad_nvmem@a000 {
d7ec904dbc428e Hector Martin     2022-02-15   694  					compatible = "apple,spmi-pmu-nvmem";
d7ec904dbc428e Hector Martin     2022-02-15   695  					reg = <0xa000 0x1000>;
d7ec904dbc428e Hector Martin     2022-02-15   696  					#address-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   697  					#size-cells = <1>;
d7ec904dbc428e Hector Martin     2022-02-15   698  
d7ec904dbc428e Hector Martin     2022-02-15   699  					fault_shadow: fault-shadow@67b {
d7ec904dbc428e Hector Martin     2022-02-15   700  						reg = <0x67b 0x10>;
d7ec904dbc428e Hector Martin     2022-02-15   701  					};
d7ec904dbc428e Hector Martin     2022-02-15   702  
d7ec904dbc428e Hector Martin     2022-02-15   703  					socd: socd@b00 {
d7ec904dbc428e Hector Martin     2022-02-15   704  						reg = <0xb00 0x400>;
d7ec904dbc428e Hector Martin     2022-02-15   705  					};
d7ec904dbc428e Hector Martin     2022-02-15   706  				};
d7ec904dbc428e Hector Martin     2022-02-15   707  
d7ec904dbc428e Hector Martin     2022-02-15   708  			};
d7ec904dbc428e Hector Martin     2022-02-15   709  		};
d7ec904dbc428e Hector Martin     2022-02-15   710  
0a8282b831196b Mark Kettenis     2021-10-25   711  		pinctrl_nub: pinctrl@23d1f0000 {
0a8282b831196b Mark Kettenis     2021-10-25   712  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25   713  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
106ba3b48a35dd Hector Martin     2021-11-24   714  			power-domains = <&ps_nub_gpio>;
0a8282b831196b Mark Kettenis     2021-10-25   715  
0a8282b831196b Mark Kettenis     2021-10-25   716  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25   717  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25   718  			gpio-ranges = <&pinctrl_nub 0 0 23>;
0a8282b831196b Mark Kettenis     2021-10-25   719  			apple,npins = <23>;
0a8282b831196b Mark Kettenis     2021-10-25   720  
0a8282b831196b Mark Kettenis     2021-10-25   721  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22   722  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25   723  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25   724  			interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   725  				     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   726  				     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   727  				     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   728  				     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   729  				     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   730  				     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25   731  		};
0a8282b831196b Mark Kettenis     2021-10-25   732  
8adf987ce08275 Hector Martin     2021-12-12   733  		pmgr_mini: power-management@23d280000 {
8adf987ce08275 Hector Martin     2021-12-12   734  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
8adf987ce08275 Hector Martin     2021-12-12   735  			#address-cells = <1>;
8adf987ce08275 Hector Martin     2021-12-12   736  			#size-cells = <1>;
8adf987ce08275 Hector Martin     2021-12-12   737  			reg = <0x2 0x3d280000 0 0x4000>;
8adf987ce08275 Hector Martin     2021-12-12   738  		};
8adf987ce08275 Hector Martin     2021-12-12   739  
b4d11106d751a4 Sven Peter        2021-12-11   740  		wdt: watchdog@23d2b0000 {
b4d11106d751a4 Sven Peter        2021-12-11   741  			compatible = "apple,t8103-wdt", "apple,wdt";
b4d11106d751a4 Sven Peter        2021-12-11   742  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   743  			clocks = <&clkref>;
b4d11106d751a4 Sven Peter        2021-12-11   744  			interrupt-parent = <&aic>;
b4d11106d751a4 Sven Peter        2021-12-11   745  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
b4d11106d751a4 Sven Peter        2021-12-11   746  		};
b4d11106d751a4 Sven Peter        2021-12-11   747  
e64bfdc722c3a1 Hector Martin     2022-02-04   748  		smc_mbox: mbox@23e408000 {
e64bfdc722c3a1 Hector Martin     2022-02-04   749  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
e64bfdc722c3a1 Hector Martin     2022-02-04   750  			reg = <0x2 0x3e408000 0x0 0x4000>;
e64bfdc722c3a1 Hector Martin     2022-02-04   751  			interrupt-parent = <&aic>;
e64bfdc722c3a1 Hector Martin     2022-02-04   752  			interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
e64bfdc722c3a1 Hector Martin     2022-02-04   753  				<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
e64bfdc722c3a1 Hector Martin     2022-02-04   754  				<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
e64bfdc722c3a1 Hector Martin     2022-02-04   755  				<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
e64bfdc722c3a1 Hector Martin     2022-02-04   756  			interrupt-names = "send-empty", "send-not-empty",
e64bfdc722c3a1 Hector Martin     2022-02-04   757  				"recv-empty", "recv-not-empty";
e64bfdc722c3a1 Hector Martin     2022-02-04   758  			#mbox-cells = <0>;
e64bfdc722c3a1 Hector Martin     2022-02-04   759  		};
e64bfdc722c3a1 Hector Martin     2022-02-04   760  
e64bfdc722c3a1 Hector Martin     2022-02-04   761  		smc: smc@23e400000 {
e64bfdc722c3a1 Hector Martin     2022-02-04   762  			compatible = "apple,t8103-smc", "apple,smc";
e64bfdc722c3a1 Hector Martin     2022-02-04   763  			reg = <0x2 0x3e400000 0x0 0x4000>,
e64bfdc722c3a1 Hector Martin     2022-02-04   764  				<0x2 0x3fe00000 0x0 0x100000>;
e64bfdc722c3a1 Hector Martin     2022-02-04   765  			reg-names = "smc", "sram";
e64bfdc722c3a1 Hector Martin     2022-02-04   766  			mboxes = <&smc_mbox>;
e64bfdc722c3a1 Hector Martin     2022-02-04   767  
e64bfdc722c3a1 Hector Martin     2022-02-04   768  			smc_gpio: gpio {
e64bfdc722c3a1 Hector Martin     2022-02-04   769  				gpio-controller;
e64bfdc722c3a1 Hector Martin     2022-02-04   770  				#gpio-cells = <2>;
e64bfdc722c3a1 Hector Martin     2022-02-04   771  			};
d7ec904dbc428e Hector Martin     2022-02-15   772  
d7ec904dbc428e Hector Martin     2022-02-15   773  			smc_rtc: rtc {
d7ec904dbc428e Hector Martin     2022-02-15   774  				nvmem-cells = <&rtc_offset>;
d7ec904dbc428e Hector Martin     2022-02-15   775  				nvmem-cell-names = "rtc_offset";
d7ec904dbc428e Hector Martin     2022-02-15   776  			};
d7ec904dbc428e Hector Martin     2022-02-15   777  
d7ec904dbc428e Hector Martin     2022-02-15   778  			smc_reboot: reboot {
d7ec904dbc428e Hector Martin     2022-02-15   779  				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
d7ec904dbc428e Hector Martin     2022-02-15   780  					<&boot_error_count>, <&panic_count>, <&pm_setting>;
d7ec904dbc428e Hector Martin     2022-02-15   781  				nvmem-cell-names = "shutdown_flag", "boot_stage",
d7ec904dbc428e Hector Martin     2022-02-15   782  					"boot_error_count", "panic_count", "pm_setting";
d7ec904dbc428e Hector Martin     2022-02-15   783  			};
e64bfdc722c3a1 Hector Martin     2022-02-04   784  		};
e64bfdc722c3a1 Hector Martin     2022-02-04   785  
0a8282b831196b Mark Kettenis     2021-10-25   786  		pinctrl_smc: pinctrl@23e820000 {
0a8282b831196b Mark Kettenis     2021-10-25   787  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25   788  			reg = <0x2 0x3e820000 0x0 0x4000>;
0a8282b831196b Mark Kettenis     2021-10-25   789  
0a8282b831196b Mark Kettenis     2021-10-25   790  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25   791  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25   792  			gpio-ranges = <&pinctrl_smc 0 0 16>;
0a8282b831196b Mark Kettenis     2021-10-25   793  			apple,npins = <16>;
0a8282b831196b Mark Kettenis     2021-10-25   794  
0a8282b831196b Mark Kettenis     2021-10-25   795  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22   796  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25   797  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25   798  			interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   799  				     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   800  				     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   801  				     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   802  				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   803  				     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25   804  				     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25   805  		};
ff2a8d91d80c54 Mark Kettenis     2021-10-25   806  
8adf987ce08275 Hector Martin     2021-12-12   807  		pinctrl_aop: pinctrl@24a820000 {
8adf987ce08275 Hector Martin     2021-12-12   808  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
8adf987ce08275 Hector Martin     2021-12-12   809  			reg = <0x2 0x4a820000 0x0 0x4000>;
8adf987ce08275 Hector Martin     2021-12-12   810  
8adf987ce08275 Hector Martin     2021-12-12   811  			gpio-controller;
8adf987ce08275 Hector Martin     2021-12-12   812  			#gpio-cells = <2>;
8adf987ce08275 Hector Martin     2021-12-12   813  			gpio-ranges = <&pinctrl_aop 0 0 42>;
8adf987ce08275 Hector Martin     2021-12-12   814  			apple,npins = <42>;
8adf987ce08275 Hector Martin     2021-12-12   815  
8adf987ce08275 Hector Martin     2021-12-12   816  			interrupt-controller;
8adf987ce08275 Hector Martin     2021-12-12   817  			#interrupt-cells = <2>;
8adf987ce08275 Hector Martin     2021-12-12   818  			interrupt-parent = <&aic>;
8adf987ce08275 Hector Martin     2021-12-12   819  			interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12   820  				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12   821  				     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12   822  				     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12   823  				     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12   824  				     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12   825  				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
8adf987ce08275 Hector Martin     2021-12-12   826  		};
8adf987ce08275 Hector Martin     2021-12-12   827  
5316d73ba81b5d Sven Peter        2022-06-02   828  		ans_mbox: mbox@277408000 {
5316d73ba81b5d Sven Peter        2022-06-02   829  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
5316d73ba81b5d Sven Peter        2022-06-02   830  			reg = <0x2 0x77408000 0x0 0x4000>;
5316d73ba81b5d Sven Peter        2022-06-02   831  			interrupt-parent = <&aic>;
5316d73ba81b5d Sven Peter        2022-06-02   832  			interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02   833  				<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02   834  				<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02   835  				<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5d Sven Peter        2022-06-02   836  			interrupt-names = "send-empty", "send-not-empty",
5316d73ba81b5d Sven Peter        2022-06-02   837  				"recv-empty", "recv-not-empty";
5316d73ba81b5d Sven Peter        2022-06-02   838  			#mbox-cells = <0>;
5316d73ba81b5d Sven Peter        2022-06-02   839  			power-domains = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02   840  		};
5316d73ba81b5d Sven Peter        2022-06-02   841  
5316d73ba81b5d Sven Peter        2022-06-02   842  		sart: iommu@27bc50000 {
5316d73ba81b5d Sven Peter        2022-06-02   843  			compatible = "apple,t8103-sart";
5316d73ba81b5d Sven Peter        2022-06-02   844  			reg = <0x2 0x7bc50000 0x0 0x10000>;
5316d73ba81b5d Sven Peter        2022-06-02   845  			power-domains = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02   846  		};
5316d73ba81b5d Sven Peter        2022-06-02   847  
5316d73ba81b5d Sven Peter        2022-06-02   848  		nvme@27bcc0000 {
5316d73ba81b5d Sven Peter        2022-06-02   849  			compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
5316d73ba81b5d Sven Peter        2022-06-02   850  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
5316d73ba81b5d Sven Peter        2022-06-02   851  				<0x2 0x77400000 0x0 0x4000>;
5316d73ba81b5d Sven Peter        2022-06-02   852  			reg-names = "nvme", "ans";
5316d73ba81b5d Sven Peter        2022-06-02   853  			interrupt-parent = <&aic>;
5316d73ba81b5d Sven Peter        2022-06-02   854  			interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5d Sven Peter        2022-06-02   855  			mboxes = <&ans_mbox>;
5316d73ba81b5d Sven Peter        2022-06-02   856  			apple,sart = <&sart>;
5316d73ba81b5d Sven Peter        2022-06-02   857  			power-domains = <&ps_ans2>, <&ps_apcie_st>;
5316d73ba81b5d Sven Peter        2022-06-02   858  			power-domain-names = "ans", "apcie0";
5316d73ba81b5d Sven Peter        2022-06-02   859  			resets = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02   860  		};
5316d73ba81b5d Sven Peter        2022-06-02   861  
c940244de93488 Hector Martin     2021-11-26   862  		dwc3_0: usb@382280000 {
c940244de93488 Hector Martin     2021-11-26   863  			compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
c940244de93488 Hector Martin     2021-11-26   864  			reg = <0x3 0x82280000 0x0 0x100000>;
c940244de93488 Hector Martin     2021-11-26   865  			interrupt-parent = <&aic>;
c940244de93488 Hector Martin     2021-11-26   866  			interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
c940244de93488 Hector Martin     2021-11-26   867  			dr_mode = "otg";
c940244de93488 Hector Martin     2021-11-26   868  			usb-role-switch;
c940244de93488 Hector Martin     2021-11-26   869  			role-switch-default-mode = "host";
c940244de93488 Hector Martin     2021-11-26   870  			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
c940244de93488 Hector Martin     2021-11-26   871  			power-domains = <&ps_atc0_usb>;
c940244de93488 Hector Martin     2021-11-26   872  		};
c940244de93488 Hector Martin     2021-11-26   873  
c940244de93488 Hector Martin     2021-11-26   874  		dwc3_0_dart_0: iommu@382f00000 {
c940244de93488 Hector Martin     2021-11-26   875  			compatible = "apple,t8103-dart";
c940244de93488 Hector Martin     2021-11-26   876  			reg = <0x3 0x82f00000 0x0 0x4000>;
c940244de93488 Hector Martin     2021-11-26   877  			interrupt-parent = <&aic>;
c940244de93488 Hector Martin     2021-11-26   878  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
c940244de93488 Hector Martin     2021-11-26   879  			#iommu-cells = <1>;
c940244de93488 Hector Martin     2021-11-26   880  			power-domains = <&ps_atc0_usb>;
c940244de93488 Hector Martin     2021-11-26   881  		};
c940244de93488 Hector Martin     2021-11-26   882  
c940244de93488 Hector Martin     2021-11-26   883  		dwc3_0_dart_1: iommu@382f80000 {
c940244de93488 Hector Martin     2021-11-26   884  			compatible = "apple,t8103-dart";
c940244de93488 Hector Martin     2021-11-26   885  			reg = <0x3 0x82f80000 0x0 0x4000>;
c940244de93488 Hector Martin     2021-11-26   886  			interrupt-parent = <&aic>;
c940244de93488 Hector Martin     2021-11-26   887  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
c940244de93488 Hector Martin     2021-11-26   888  			#iommu-cells = <1>;
c940244de93488 Hector Martin     2021-11-26   889  			power-domains = <&ps_atc0_usb>;
c940244de93488 Hector Martin     2021-11-26   890  		};
c940244de93488 Hector Martin     2021-11-26   891  
c940244de93488 Hector Martin     2021-11-26   892  		dwc3_1: usb@502280000 {
c940244de93488 Hector Martin     2021-11-26   893  			compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
c940244de93488 Hector Martin     2021-11-26   894  			reg = <0x5 0x02280000 0x0 0x100000>;
c940244de93488 Hector Martin     2021-11-26   895  			interrupt-parent = <&aic>;
c940244de93488 Hector Martin     2021-11-26   896  			interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
c940244de93488 Hector Martin     2021-11-26   897  			dr_mode = "otg";
c940244de93488 Hector Martin     2021-11-26   898  			usb-role-switch;
c940244de93488 Hector Martin     2021-11-26   899  			role-switch-default-mode = "host";
c940244de93488 Hector Martin     2021-11-26   900  			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
c940244de93488 Hector Martin     2021-11-26   901  			power-domains = <&ps_atc1_usb>;
c940244de93488 Hector Martin     2021-11-26   902  		};
c940244de93488 Hector Martin     2021-11-26   903  
c940244de93488 Hector Martin     2021-11-26   904  		dwc3_1_dart_0: iommu@502f00000 {
c940244de93488 Hector Martin     2021-11-26   905  			compatible = "apple,t8103-dart";
c940244de93488 Hector Martin     2021-11-26   906  			reg = <0x5 0x02f00000 0x0 0x4000>;
c940244de93488 Hector Martin     2021-11-26   907  			interrupt-parent = <&aic>;
c940244de93488 Hector Martin     2021-11-26   908  			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
c940244de93488 Hector Martin     2021-11-26   909  			#iommu-cells = <1>;
c940244de93488 Hector Martin     2021-11-26   910  			power-domains = <&ps_atc1_usb>;
c940244de93488 Hector Martin     2021-11-26   911  		};
c940244de93488 Hector Martin     2021-11-26   912  
c940244de93488 Hector Martin     2021-11-26   913  		dwc3_1_dart_1: iommu@502f80000 {
c940244de93488 Hector Martin     2021-11-26   914  			compatible = "apple,t8103-dart";
c940244de93488 Hector Martin     2021-11-26   915  			reg = <0x5 0x02f80000 0x0 0x4000>;
c940244de93488 Hector Martin     2021-11-26   916  			interrupt-parent = <&aic>;
c940244de93488 Hector Martin     2021-11-26   917  			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
c940244de93488 Hector Martin     2021-11-26   918  			#iommu-cells = <1>;
c940244de93488 Hector Martin     2021-11-26   919  			power-domains = <&ps_atc1_usb>;
c940244de93488 Hector Martin     2021-11-26   920  		};
c940244de93488 Hector Martin     2021-11-26   921  
56d32c51dffac8 Janne Grunau      2022-12-06   922  		pcie0_dart_0: iommu@681008000 {
3c866bb79577ed Marc Zyngier      2021-10-25   923  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25   924  			reg = <0x6 0x81008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25   925  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25   926  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25   927  			interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24   928  			power-domains = <&ps_apcie_gp>;
3c866bb79577ed Marc Zyngier      2021-10-25   929  		};
3c866bb79577ed Marc Zyngier      2021-10-25   930  
56d32c51dffac8 Janne Grunau      2022-12-06   931  		pcie0_dart_1: iommu@682008000 {
3c866bb79577ed Marc Zyngier      2021-10-25   932  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25   933  			reg = <0x6 0x82008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25   934  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25   935  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25   936  			interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24   937  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac Janne Grunau      2023-02-14   938  			status = "disabled";
3c866bb79577ed Marc Zyngier      2021-10-25   939  		};
3c866bb79577ed Marc Zyngier      2021-10-25   940  
56d32c51dffac8 Janne Grunau      2022-12-06   941  		pcie0_dart_2: iommu@683008000 {
3c866bb79577ed Marc Zyngier      2021-10-25   942  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25   943  			reg = <0x6 0x83008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25   944  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25   945  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25   946  			interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24   947  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac Janne Grunau      2023-02-14   948  			status = "disabled";
3c866bb79577ed Marc Zyngier      2021-10-25   949  		};
3c866bb79577ed Marc Zyngier      2021-10-25   950  
ff2a8d91d80c54 Mark Kettenis     2021-10-25   951  		pcie0: pcie@690000000 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25   952  			compatible = "apple,t8103-pcie", "apple,pcie";
ff2a8d91d80c54 Mark Kettenis     2021-10-25   953  			device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25   954  
ff2a8d91d80c54 Mark Kettenis     2021-10-25   955  			reg = <0x6 0x90000000 0x0 0x1000000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   956  			      <0x6 0x80000000 0x0 0x100000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   957  			      <0x6 0x81000000 0x0 0x4000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   958  			      <0x6 0x82000000 0x0 0x4000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   959  			      <0x6 0x83000000 0x0 0x4000>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   960  			reg-names = "config", "rc", "port0", "port1", "port2";
ff2a8d91d80c54 Mark Kettenis     2021-10-25   961  
ff2a8d91d80c54 Mark Kettenis     2021-10-25   962  			interrupt-parent = <&aic>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   963  			interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   964  				     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   965  				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   966  
ff2a8d91d80c54 Mark Kettenis     2021-10-25   967  			msi-controller;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   968  			msi-parent = <&pcie0>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   969  			msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   970  
3c866bb79577ed Marc Zyngier      2021-10-25   971  
3c866bb79577ed Marc Zyngier      2021-10-25   972  			iommu-map = <0x100 &pcie0_dart_0 1 1>,
3c866bb79577ed Marc Zyngier      2021-10-25   973  				    <0x200 &pcie0_dart_1 1 1>,
3c866bb79577ed Marc Zyngier      2021-10-25   974  				    <0x300 &pcie0_dart_2 1 1>;
3c866bb79577ed Marc Zyngier      2021-10-25   975  			iommu-map-mask = <0xff00>;
3c866bb79577ed Marc Zyngier      2021-10-25   976  
ff2a8d91d80c54 Mark Kettenis     2021-10-25   977  			bus-range = <0 3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   978  			#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   979  			#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   980  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25   981  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   982  
106ba3b48a35dd Hector Martin     2021-11-24   983  			power-domains = <&ps_apcie_gp>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   984  			pinctrl-0 = <&pcie_pins>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   985  			pinctrl-names = "default";
ff2a8d91d80c54 Mark Kettenis     2021-10-25   986  
128888a6fdb695 Marc Zyngier      2021-10-25   987  			port00: pci@0,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25   988  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25   989  				reg = <0x0 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23   990  				reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   991  
ff2a8d91d80c54 Mark Kettenis     2021-10-25   992  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   993  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25   994  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25   995  
128888a6fdb695 Marc Zyngier      2021-10-25   996  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25   997  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25   998  
128888a6fdb695 Marc Zyngier      2021-10-25   999  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  1000  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  1001  						<0 0 0 2 &port00 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  1002  						<0 0 0 3 &port00 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  1003  						<0 0 0 4 &port00 0 0 0 3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1004  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1005  
128888a6fdb695 Marc Zyngier      2021-10-25  1006  			port01: pci@1,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1007  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1008  				reg = <0x800 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  1009  				reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1010  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1011  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1012  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1013  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  1014  
128888a6fdb695 Marc Zyngier      2021-10-25  1015  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  1016  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  1017  
128888a6fdb695 Marc Zyngier      2021-10-25  1018  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  1019  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  1020  						<0 0 0 2 &port01 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  1021  						<0 0 0 3 &port01 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  1022  						<0 0 0 4 &port01 0 0 0 3>;
a0189fdfb73dac Janne Grunau      2023-02-14  1023  				status = "disabled";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1024  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1025  
128888a6fdb695 Marc Zyngier      2021-10-25  1026  			port02: pci@2,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1027  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1028  				reg = <0x1000 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  1029  				reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1030  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1031  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1032  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1033  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  1034  
128888a6fdb695 Marc Zyngier      2021-10-25  1035  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  1036  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  1037  
128888a6fdb695 Marc Zyngier      2021-10-25  1038  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  1039  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  1040  						<0 0 0 2 &port02 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  1041  						<0 0 0 3 &port02 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  1042  						<0 0 0 4 &port02 0 0 0 3>;
a0189fdfb73dac Janne Grunau      2023-02-14  1043  				status = "disabled";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1044  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1045  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  1046  	};
7d2d16ccf15d8e Hector Martin     2021-02-04  1047  };
106ba3b48a35dd Hector Martin     2021-11-24  1048  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
