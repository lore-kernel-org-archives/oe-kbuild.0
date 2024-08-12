Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B36139CFE
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 05:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723441953; cv=none; b=KwxwVvAiaxSCucGZQ66Ik8s0zidWNp6MEM7qFq7kVu0+u47/ihW/1UzhyclyvBJySixBG1lu3KnLk4TMO8VJG8SEYjDcDvRwFlxJuBbkyBeGxViFqehUte4K+LoI/Tudx/WI9ttC+Fti4hbzpYwujssnG5spFBnmUShwb9iJ+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723441953; c=relaxed/simple;
	bh=7vA8EAfS6wqthfzAlJLvAQv5WUaDQTF7238pGuRlJk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQpKWnHdCami92AswXxySImhsI+YHpP2j5bmcmF6B8THOWcNXHLrPpi9kFjjX/b4zU8WIcYyri4JAI8xI5/sXS1vyrlXWHxg2EmmBSrjEMht/drbg1IN9z4uD0pcC002qYhUHZF7Vrd4UMqWRzirk+GN8zkpzJxDNVuHX5Q8ISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjUFIT4v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjUFIT4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723441949; x=1754977949;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7vA8EAfS6wqthfzAlJLvAQv5WUaDQTF7238pGuRlJk4=;
  b=mjUFIT4v+vphH9WkQNRHwBFdNhh4SCpi9PTXr67J8HEwuHdZ+wJLP4HL
   ezMhXb4udPPLTB0acZZOmbcux5KUCMZNTrCakJCnbGT49X+3v5vzsEA7I
   LmOsqd3m7oWOFa+iVYiYrGM9pLHvBGijzyBFOMOIiG2SU9KqJhJeOH6QB
   6z1hhCQRR4LlhrAC2aVp/vdFE9H2SskvhrW5QtQf5gsMrsOPmcIkIOiMH
   h2oLdwF9h41iO1hURtVny0H7vZ15XOW5av9OT0Bj71vZumdX1WGqDbIvi
   nYfothM2FtOOpK1N8QDP9k5BMZjQ4A7mJa56SwWieuPFS1mTaoEYsFdoC
   Q==;
X-CSE-ConnectionGUID: KjcOI0BNS7iTe1sTVc4I9A==
X-CSE-MsgGUID: BewMrmh0Qxm57aICP64bsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21682966"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21682966"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 22:52:29 -0700
X-CSE-ConnectionGUID: EC+tI65zQlOsW/rBk9HQzQ==
X-CSE-MsgGUID: WR3z9FA+SKG3JZW9vqzdlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62996102"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Aug 2024 22:52:27 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdNyi-000BQk-1F;
	Mon, 12 Aug 2024 05:52:24 +0000
Date: Mon, 12 Aug 2024 13:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:20240806-atcphy-rewrite 7/12]
 arch/arm64/boot/dts/apple/t8103.dtsi:720.18-725.5: Warning (simple_bus_reg):
 /soc/efuse@3d2bc000: simple-bus unit address format error, expected
 "23d2bc000"
Message-ID: <202408121339.pYGj3Dja-lkp@intel.com>
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
TO: Sven Peter <sven@svenpeter.dev>

tree:   https://github.com/AsahiLinux/linux 20240806-atcphy-rewrite
head:   ae2353de8d392a3c4846899968334797fe47f44c
commit: b13697a935ba3a9d67cc83f12fd8d8fc62c0f756 [7/12] arm64: dts: apple: t8103: Add eFuses node
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240812/202408121339.pYGj3Dja-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121339.pYGj3Dja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121339.pYGj3Dja-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103.dtsi:720.18-725.5: Warning (simple_bus_reg): /soc/efuse@3d2bc000: simple-bus unit address format error, expected "23d2bc000"
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:62.10-71.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:87.10-96.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/23d2bc000 +720 arch/arm64/boot/dts/apple/t8103.dtsi

7d2d16ccf15d8eb Hector Martin     2021-02-04   14  
7d2d16ccf15d8eb Hector Martin     2021-02-04   15  / {
7d2d16ccf15d8eb Hector Martin     2021-02-04   16  	compatible = "apple,t8103", "apple,arm-platform";
7d2d16ccf15d8eb Hector Martin     2021-02-04   17  
7d2d16ccf15d8eb Hector Martin     2021-02-04   18  	#address-cells = <2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   19  	#size-cells = <2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   20  
7d2d16ccf15d8eb Hector Martin     2021-02-04   21  	cpus {
7d2d16ccf15d8eb Hector Martin     2021-02-04   22  		#address-cells = <2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   23  		#size-cells = <0>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   24  
3e895a6460ec38e Hector Martin     2022-05-03   25  		cpu-map {
3e895a6460ec38e Hector Martin     2022-05-03   26  			cluster0 {
3e895a6460ec38e Hector Martin     2022-05-03   27  				core0 {
3e895a6460ec38e Hector Martin     2022-05-03   28  					cpu = <&cpu_e0>;
3e895a6460ec38e Hector Martin     2022-05-03   29  				};
3e895a6460ec38e Hector Martin     2022-05-03   30  				core1 {
3e895a6460ec38e Hector Martin     2022-05-03   31  					cpu = <&cpu_e1>;
3e895a6460ec38e Hector Martin     2022-05-03   32  				};
3e895a6460ec38e Hector Martin     2022-05-03   33  				core2 {
3e895a6460ec38e Hector Martin     2022-05-03   34  					cpu = <&cpu_e2>;
3e895a6460ec38e Hector Martin     2022-05-03   35  				};
3e895a6460ec38e Hector Martin     2022-05-03   36  				core3 {
3e895a6460ec38e Hector Martin     2022-05-03   37  					cpu = <&cpu_e3>;
3e895a6460ec38e Hector Martin     2022-05-03   38  				};
3e895a6460ec38e Hector Martin     2022-05-03   39  			};
3e895a6460ec38e Hector Martin     2022-05-03   40  
3e895a6460ec38e Hector Martin     2022-05-03   41  			cluster1 {
3e895a6460ec38e Hector Martin     2022-05-03   42  				core0 {
3e895a6460ec38e Hector Martin     2022-05-03   43  					cpu = <&cpu_p0>;
3e895a6460ec38e Hector Martin     2022-05-03   44  				};
3e895a6460ec38e Hector Martin     2022-05-03   45  				core1 {
3e895a6460ec38e Hector Martin     2022-05-03   46  					cpu = <&cpu_p1>;
3e895a6460ec38e Hector Martin     2022-05-03   47  				};
3e895a6460ec38e Hector Martin     2022-05-03   48  				core2 {
3e895a6460ec38e Hector Martin     2022-05-03   49  					cpu = <&cpu_p2>;
3e895a6460ec38e Hector Martin     2022-05-03   50  				};
3e895a6460ec38e Hector Martin     2022-05-03   51  				core3 {
3e895a6460ec38e Hector Martin     2022-05-03   52  					cpu = <&cpu_p3>;
3e895a6460ec38e Hector Martin     2022-05-03   53  				};
3e895a6460ec38e Hector Martin     2022-05-03   54  			};
3e895a6460ec38e Hector Martin     2022-05-03   55  		};
3e895a6460ec38e Hector Martin     2022-05-03   56  
3e895a6460ec38e Hector Martin     2022-05-03   57  		cpu_e0: cpu@0 {
7d2d16ccf15d8eb Hector Martin     2021-02-04   58  			compatible = "apple,icestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04   59  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04   60  			reg = <0x0 0x0>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   61  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04   62  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03   63  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03   64  			capacity-dmips-mhz = <714>;
3e895a6460ec38e Hector Martin     2022-05-03   65  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   66  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   67  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   68  			d-cache-size = <0x10000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   69  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04   70  
3e895a6460ec38e Hector Martin     2022-05-03   71  		cpu_e1: cpu@1 {
7d2d16ccf15d8eb Hector Martin     2021-02-04   72  			compatible = "apple,icestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04   73  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04   74  			reg = <0x0 0x1>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   75  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04   76  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03   77  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03   78  			capacity-dmips-mhz = <714>;
3e895a6460ec38e Hector Martin     2022-05-03   79  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   80  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   81  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   82  			d-cache-size = <0x10000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   83  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04   84  
3e895a6460ec38e Hector Martin     2022-05-03   85  		cpu_e2: cpu@2 {
7d2d16ccf15d8eb Hector Martin     2021-02-04   86  			compatible = "apple,icestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04   87  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04   88  			reg = <0x0 0x2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   89  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04   90  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03   91  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03   92  			capacity-dmips-mhz = <714>;
3e895a6460ec38e Hector Martin     2022-05-03   93  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   94  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   95  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06   96  			d-cache-size = <0x10000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04   97  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04   98  
3e895a6460ec38e Hector Martin     2022-05-03   99  		cpu_e3: cpu@3 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  100  			compatible = "apple,icestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04  101  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04  102  			reg = <0x0 0x3>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  103  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04  104  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03  105  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03  106  			capacity-dmips-mhz = <714>;
3e895a6460ec38e Hector Martin     2022-05-03  107  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  108  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  109  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  110  			d-cache-size = <0x10000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  111  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  112  
3e895a6460ec38e Hector Martin     2022-05-03  113  		cpu_p0: cpu@10100 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  114  			compatible = "apple,firestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04  115  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04  116  			reg = <0x0 0x10100>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  117  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04  118  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03  119  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03  120  			capacity-dmips-mhz = <1024>;
3e895a6460ec38e Hector Martin     2022-05-03  121  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  122  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  123  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  124  			d-cache-size = <0x20000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  125  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  126  
3e895a6460ec38e Hector Martin     2022-05-03  127  		cpu_p1: cpu@10101 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  128  			compatible = "apple,firestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04  129  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04  130  			reg = <0x0 0x10101>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  131  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04  132  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03  133  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03  134  			capacity-dmips-mhz = <1024>;
3e895a6460ec38e Hector Martin     2022-05-03  135  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  136  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  137  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  138  			d-cache-size = <0x20000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  139  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  140  
3e895a6460ec38e Hector Martin     2022-05-03  141  		cpu_p2: cpu@10102 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  142  			compatible = "apple,firestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04  143  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04  144  			reg = <0x0 0x10102>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  145  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04  146  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03  147  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03  148  			capacity-dmips-mhz = <1024>;
3e895a6460ec38e Hector Martin     2022-05-03  149  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  150  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  151  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  152  			d-cache-size = <0x20000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  153  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  154  
3e895a6460ec38e Hector Martin     2022-05-03  155  		cpu_p3: cpu@10103 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  156  			compatible = "apple,firestorm";
7d2d16ccf15d8eb Hector Martin     2021-02-04  157  			device_type = "cpu";
7d2d16ccf15d8eb Hector Martin     2021-02-04  158  			reg = <0x0 0x10103>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  159  			enable-method = "spin-table";
7d2d16ccf15d8eb Hector Martin     2021-02-04  160  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38e Hector Martin     2022-05-03  161  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38e Hector Martin     2022-05-03  162  			capacity-dmips-mhz = <1024>;
3e895a6460ec38e Hector Martin     2022-05-03  163  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  164  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  165  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  166  			d-cache-size = <0x20000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  167  		};
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  168  
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  169  		l2_cache_0: l2-cache-0 {
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  170  			compatible = "cache";
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  171  			cache-level = <2>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  172  			cache-unified;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  173  			cache-size = <0x400000>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  174  		};
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  175  
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  176  		l2_cache_1: l2-cache-1 {
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  177  			compatible = "cache";
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  178  			cache-level = <2>;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  179  			cache-unified;
9ecb7a4b8ac67c1 Janne Grunau      2022-12-06  180  			cache-size = <0xc00000>;
3e895a6460ec38e Hector Martin     2022-05-03  181  		};
3e895a6460ec38e Hector Martin     2022-05-03  182  	};
3e895a6460ec38e Hector Martin     2022-05-03  183  
3e895a6460ec38e Hector Martin     2022-05-03  184  	ecluster_opp: opp-table-0 {
3e895a6460ec38e Hector Martin     2022-05-03  185  		compatible = "operating-points-v2";
3e895a6460ec38e Hector Martin     2022-05-03  186  
3e895a6460ec38e Hector Martin     2022-05-03  187  		opp01 {
3e895a6460ec38e Hector Martin     2022-05-03  188  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38e Hector Martin     2022-05-03  189  			opp-level = <1>;
3e895a6460ec38e Hector Martin     2022-05-03  190  			clock-latency-ns = <7500>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  191  		};
3e895a6460ec38e Hector Martin     2022-05-03  192  		opp02 {
3e895a6460ec38e Hector Martin     2022-05-03  193  			opp-hz = /bits/ 64 <972000000>;
3e895a6460ec38e Hector Martin     2022-05-03  194  			opp-level = <2>;
3e895a6460ec38e Hector Martin     2022-05-03  195  			clock-latency-ns = <22000>;
3e895a6460ec38e Hector Martin     2022-05-03  196  		};
3e895a6460ec38e Hector Martin     2022-05-03  197  		opp03 {
3e895a6460ec38e Hector Martin     2022-05-03  198  			opp-hz = /bits/ 64 <1332000000>;
3e895a6460ec38e Hector Martin     2022-05-03  199  			opp-level = <3>;
3e895a6460ec38e Hector Martin     2022-05-03  200  			clock-latency-ns = <27000>;
3e895a6460ec38e Hector Martin     2022-05-03  201  		};
3e895a6460ec38e Hector Martin     2022-05-03  202  		opp04 {
3e895a6460ec38e Hector Martin     2022-05-03  203  			opp-hz = /bits/ 64 <1704000000>;
3e895a6460ec38e Hector Martin     2022-05-03  204  			opp-level = <4>;
3e895a6460ec38e Hector Martin     2022-05-03  205  			clock-latency-ns = <33000>;
3e895a6460ec38e Hector Martin     2022-05-03  206  		};
3e895a6460ec38e Hector Martin     2022-05-03  207  		opp05 {
3e895a6460ec38e Hector Martin     2022-05-03  208  			opp-hz = /bits/ 64 <2064000000>;
3e895a6460ec38e Hector Martin     2022-05-03  209  			opp-level = <5>;
3e895a6460ec38e Hector Martin     2022-05-03  210  			clock-latency-ns = <50000>;
3e895a6460ec38e Hector Martin     2022-05-03  211  		};
3e895a6460ec38e Hector Martin     2022-05-03  212  	};
3e895a6460ec38e Hector Martin     2022-05-03  213  
3e895a6460ec38e Hector Martin     2022-05-03  214  	pcluster_opp: opp-table-1 {
3e895a6460ec38e Hector Martin     2022-05-03  215  		compatible = "operating-points-v2";
3e895a6460ec38e Hector Martin     2022-05-03  216  
3e895a6460ec38e Hector Martin     2022-05-03  217  		opp01 {
3e895a6460ec38e Hector Martin     2022-05-03  218  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38e Hector Martin     2022-05-03  219  			opp-level = <1>;
3e895a6460ec38e Hector Martin     2022-05-03  220  			clock-latency-ns = <8000>;
3e895a6460ec38e Hector Martin     2022-05-03  221  		};
3e895a6460ec38e Hector Martin     2022-05-03  222  		opp02 {
3e895a6460ec38e Hector Martin     2022-05-03  223  			opp-hz = /bits/ 64 <828000000>;
3e895a6460ec38e Hector Martin     2022-05-03  224  			opp-level = <2>;
3e895a6460ec38e Hector Martin     2022-05-03  225  			clock-latency-ns = <19000>;
3e895a6460ec38e Hector Martin     2022-05-03  226  		};
3e895a6460ec38e Hector Martin     2022-05-03  227  		opp03 {
3e895a6460ec38e Hector Martin     2022-05-03  228  			opp-hz = /bits/ 64 <1056000000>;
3e895a6460ec38e Hector Martin     2022-05-03  229  			opp-level = <3>;
3e895a6460ec38e Hector Martin     2022-05-03  230  			clock-latency-ns = <21000>;
3e895a6460ec38e Hector Martin     2022-05-03  231  		};
3e895a6460ec38e Hector Martin     2022-05-03  232  		opp04 {
3e895a6460ec38e Hector Martin     2022-05-03  233  			opp-hz = /bits/ 64 <1284000000>;
3e895a6460ec38e Hector Martin     2022-05-03  234  			opp-level = <4>;
3e895a6460ec38e Hector Martin     2022-05-03  235  			clock-latency-ns = <23000>;
3e895a6460ec38e Hector Martin     2022-05-03  236  		};
3e895a6460ec38e Hector Martin     2022-05-03  237  		opp05 {
3e895a6460ec38e Hector Martin     2022-05-03  238  			opp-hz = /bits/ 64 <1500000000>;
3e895a6460ec38e Hector Martin     2022-05-03  239  			opp-level = <5>;
3e895a6460ec38e Hector Martin     2022-05-03  240  			clock-latency-ns = <24000>;
3e895a6460ec38e Hector Martin     2022-05-03  241  		};
3e895a6460ec38e Hector Martin     2022-05-03  242  		opp06 {
3e895a6460ec38e Hector Martin     2022-05-03  243  			opp-hz = /bits/ 64 <1728000000>;
3e895a6460ec38e Hector Martin     2022-05-03  244  			opp-level = <6>;
3e895a6460ec38e Hector Martin     2022-05-03  245  			clock-latency-ns = <29000>;
3e895a6460ec38e Hector Martin     2022-05-03  246  		};
3e895a6460ec38e Hector Martin     2022-05-03  247  		opp07 {
3e895a6460ec38e Hector Martin     2022-05-03  248  			opp-hz = /bits/ 64 <1956000000>;
3e895a6460ec38e Hector Martin     2022-05-03  249  			opp-level = <7>;
3e895a6460ec38e Hector Martin     2022-05-03  250  			clock-latency-ns = <31000>;
3e895a6460ec38e Hector Martin     2022-05-03  251  		};
3e895a6460ec38e Hector Martin     2022-05-03  252  		opp08 {
3e895a6460ec38e Hector Martin     2022-05-03  253  			opp-hz = /bits/ 64 <2184000000>;
3e895a6460ec38e Hector Martin     2022-05-03  254  			opp-level = <8>;
3e895a6460ec38e Hector Martin     2022-05-03  255  			clock-latency-ns = <34000>;
3e895a6460ec38e Hector Martin     2022-05-03  256  		};
3e895a6460ec38e Hector Martin     2022-05-03  257  		opp09 {
3e895a6460ec38e Hector Martin     2022-05-03  258  			opp-hz = /bits/ 64 <2388000000>;
3e895a6460ec38e Hector Martin     2022-05-03  259  			opp-level = <9>;
3e895a6460ec38e Hector Martin     2022-05-03  260  			clock-latency-ns = <36000>;
3e895a6460ec38e Hector Martin     2022-05-03  261  		};
3e895a6460ec38e Hector Martin     2022-05-03  262  		opp10 {
3e895a6460ec38e Hector Martin     2022-05-03  263  			opp-hz = /bits/ 64 <2592000000>;
3e895a6460ec38e Hector Martin     2022-05-03  264  			opp-level = <10>;
3e895a6460ec38e Hector Martin     2022-05-03  265  			clock-latency-ns = <51000>;
3e895a6460ec38e Hector Martin     2022-05-03  266  		};
3e895a6460ec38e Hector Martin     2022-05-03  267  		opp11 {
3e895a6460ec38e Hector Martin     2022-05-03  268  			opp-hz = /bits/ 64 <2772000000>;
3e895a6460ec38e Hector Martin     2022-05-03  269  			opp-level = <11>;
3e895a6460ec38e Hector Martin     2022-05-03  270  			clock-latency-ns = <54000>;
3e895a6460ec38e Hector Martin     2022-05-03  271  		};
3e895a6460ec38e Hector Martin     2022-05-03  272  		opp12 {
3e895a6460ec38e Hector Martin     2022-05-03  273  			opp-hz = /bits/ 64 <2988000000>;
3e895a6460ec38e Hector Martin     2022-05-03  274  			opp-level = <12>;
3e895a6460ec38e Hector Martin     2022-05-03  275  			clock-latency-ns = <55000>;
3e895a6460ec38e Hector Martin     2022-05-03  276  		};
3e895a6460ec38e Hector Martin     2022-05-03  277  #if 0
3e895a6460ec38e Hector Martin     2022-05-03  278  		/* Not available until CPU deep sleep is implemented */
3e895a6460ec38e Hector Martin     2022-05-03  279  		opp13 {
3e895a6460ec38e Hector Martin     2022-05-03  280  			opp-hz = /bits/ 64 <3096000000>;
3e895a6460ec38e Hector Martin     2022-05-03  281  			opp-level = <13>;
3e895a6460ec38e Hector Martin     2022-05-03  282  			clock-latency-ns = <55000>;
3e895a6460ec38e Hector Martin     2022-05-03  283  			turbo-mode;
3e895a6460ec38e Hector Martin     2022-05-03  284  		};
3e895a6460ec38e Hector Martin     2022-05-03  285  		opp14 {
3e895a6460ec38e Hector Martin     2022-05-03  286  			opp-hz = /bits/ 64 <3144000000>;
3e895a6460ec38e Hector Martin     2022-05-03  287  			opp-level = <14>;
3e895a6460ec38e Hector Martin     2022-05-03  288  			clock-latency-ns = <56000>;
3e895a6460ec38e Hector Martin     2022-05-03  289  			turbo-mode;
3e895a6460ec38e Hector Martin     2022-05-03  290  		};
3e895a6460ec38e Hector Martin     2022-05-03  291  		opp15 {
3e895a6460ec38e Hector Martin     2022-05-03  292  			opp-hz = /bits/ 64 <3204000000>;
3e895a6460ec38e Hector Martin     2022-05-03  293  			opp-level = <15>;
3e895a6460ec38e Hector Martin     2022-05-03  294  			clock-latency-ns = <56000>;
3e895a6460ec38e Hector Martin     2022-05-03  295  			turbo-mode;
3e895a6460ec38e Hector Martin     2022-05-03  296  		};
3e895a6460ec38e Hector Martin     2022-05-03  297  #endif
7d2d16ccf15d8eb Hector Martin     2021-02-04  298  	};
7d2d16ccf15d8eb Hector Martin     2021-02-04  299  
7d2d16ccf15d8eb Hector Martin     2021-02-04  300  	timer {
7d2d16ccf15d8eb Hector Martin     2021-02-04  301  		compatible = "arm,armv8-timer";
7d2d16ccf15d8eb Hector Martin     2021-02-04  302  		interrupt-parent = <&aic>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  303  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
7d2d16ccf15d8eb Hector Martin     2021-02-04  304  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8eb Hector Martin     2021-02-04  305  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8eb Hector Martin     2021-02-04  306  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8eb Hector Martin     2021-02-04  307  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  308  	};
7d2d16ccf15d8eb Hector Martin     2021-02-04  309  
0f522efcd79634a Marc Zyngier      2021-11-02  310  	pmu-e {
0f522efcd79634a Marc Zyngier      2021-11-02  311  		compatible = "apple,icestorm-pmu";
0f522efcd79634a Marc Zyngier      2021-11-02  312  		interrupt-parent = <&aic>;
0f522efcd79634a Marc Zyngier      2021-11-02  313  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634a Marc Zyngier      2021-11-02  314  	};
0f522efcd79634a Marc Zyngier      2021-11-02  315  
0f522efcd79634a Marc Zyngier      2021-11-02  316  	pmu-p {
0f522efcd79634a Marc Zyngier      2021-11-02  317  		compatible = "apple,firestorm-pmu";
0f522efcd79634a Marc Zyngier      2021-11-02  318  		interrupt-parent = <&aic>;
0f522efcd79634a Marc Zyngier      2021-11-02  319  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634a Marc Zyngier      2021-11-02  320  	};
0f522efcd79634a Marc Zyngier      2021-11-02  321  
57337b252442128 Hector Martin     2021-10-05  322  	clkref: clock-ref {
7d2d16ccf15d8eb Hector Martin     2021-02-04  323  		compatible = "fixed-clock";
7d2d16ccf15d8eb Hector Martin     2021-02-04  324  		#clock-cells = <0>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  325  		clock-frequency = <24000000>;
57337b252442128 Hector Martin     2021-10-05  326  		clock-output-names = "clkref";
7d2d16ccf15d8eb Hector Martin     2021-02-04  327  	};
7d2d16ccf15d8eb Hector Martin     2021-02-04  328  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  329  	/*
8a3df85ad87d2e7 Martin Povišer    2022-09-16  330  	 * This is a fabulated representation of the input clock
8a3df85ad87d2e7 Martin Povišer    2022-09-16  331  	 * to NCO since we don't know the true clock tree.
8a3df85ad87d2e7 Martin Povišer    2022-09-16  332  	 */
8a3df85ad87d2e7 Martin Povišer    2022-09-16  333  	nco_clkref: clock-ref-nco {
8a3df85ad87d2e7 Martin Povišer    2022-09-16  334  		compatible = "fixed-clock";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  335  		#clock-cells = <0>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  336  		clock-output-names = "nco_ref";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  337  	};
8a3df85ad87d2e7 Martin Povišer    2022-09-16  338  
7d2d16ccf15d8eb Hector Martin     2021-02-04  339  	soc {
7d2d16ccf15d8eb Hector Martin     2021-02-04  340  		compatible = "simple-bus";
7d2d16ccf15d8eb Hector Martin     2021-02-04  341  		#address-cells = <2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  342  		#size-cells = <2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  343  
7d2d16ccf15d8eb Hector Martin     2021-02-04  344  		ranges;
7d2d16ccf15d8eb Hector Martin     2021-02-04  345  		nonposted-mmio;
7d2d16ccf15d8eb Hector Martin     2021-02-04  346  
3e895a6460ec38e Hector Martin     2022-05-03  347  		cpufreq_e: performance-controller@210e20000 {
3e895a6460ec38e Hector Martin     2022-05-03  348  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38e Hector Martin     2022-05-03  349  			reg = <0x2 0x10e20000 0 0x1000>;
3e895a6460ec38e Hector Martin     2022-05-03  350  			#performance-domain-cells = <0>;
3e895a6460ec38e Hector Martin     2022-05-03  351  		};
3e895a6460ec38e Hector Martin     2022-05-03  352  
3e895a6460ec38e Hector Martin     2022-05-03  353  		cpufreq_p: performance-controller@211e20000 {
3e895a6460ec38e Hector Martin     2022-05-03  354  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38e Hector Martin     2022-05-03  355  			reg = <0x2 0x11e20000 0 0x1000>;
3e895a6460ec38e Hector Martin     2022-05-03  356  			#performance-domain-cells = <0>;
3e895a6460ec38e Hector Martin     2022-05-03  357  		};
3e895a6460ec38e Hector Martin     2022-05-03  358  
63bf0b66ddfa676 Hector Martin     2022-12-05  359  		sio_dart: iommu@235004000 {
8a3df85ad87d2e7 Martin Povišer    2022-09-16  360  			compatible = "apple,t8103-dart";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  361  			reg = <0x2 0x35004000 0x0 0x4000>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  362  			interrupt-parent = <&aic>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  363  			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  364  			#iommu-cells = <1>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  365  			power-domains = <&ps_sio_cpu>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  366  		};
8a3df85ad87d2e7 Martin Povišer    2022-09-16  367  
90458f6eec42aaf Janne Grunau      2021-11-23  368  		i2c0: i2c@235010000 {
90458f6eec42aaf Janne Grunau      2021-11-23  369  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aaf Janne Grunau      2021-11-23  370  			reg = <0x2 0x35010000 0x0 0x4000>;
57337b252442128 Hector Martin     2021-10-05  371  			clocks = <&clkref>;
90458f6eec42aaf Janne Grunau      2021-11-23  372  			interrupt-parent = <&aic>;
90458f6eec42aaf Janne Grunau      2021-11-23  373  			interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aaf Janne Grunau      2021-11-23  374  			pinctrl-0 = <&i2c0_pins>;
90458f6eec42aaf Janne Grunau      2021-11-23  375  			pinctrl-names = "default";
90458f6eec42aaf Janne Grunau      2021-11-23  376  			#address-cells = <0x1>;
90458f6eec42aaf Janne Grunau      2021-11-23  377  			#size-cells = <0x0>;
106ba3b48a35ddf Hector Martin     2021-11-24  378  			power-domains = <&ps_i2c0>;
90458f6eec42aaf Janne Grunau      2021-11-23  379  		};
90458f6eec42aaf Janne Grunau      2021-11-23  380  
90458f6eec42aaf Janne Grunau      2021-11-23  381  		i2c1: i2c@235014000 {
90458f6eec42aaf Janne Grunau      2021-11-23  382  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aaf Janne Grunau      2021-11-23  383  			reg = <0x2 0x35014000 0x0 0x4000>;
57337b252442128 Hector Martin     2021-10-05  384  			clocks = <&clkref>;
90458f6eec42aaf Janne Grunau      2021-11-23  385  			interrupt-parent = <&aic>;
90458f6eec42aaf Janne Grunau      2021-11-23  386  			interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aaf Janne Grunau      2021-11-23  387  			pinctrl-0 = <&i2c1_pins>;
90458f6eec42aaf Janne Grunau      2021-11-23  388  			pinctrl-names = "default";
90458f6eec42aaf Janne Grunau      2021-11-23  389  			#address-cells = <0x1>;
90458f6eec42aaf Janne Grunau      2021-11-23  390  			#size-cells = <0x0>;
106ba3b48a35ddf Hector Martin     2021-11-24  391  			power-domains = <&ps_i2c1>;
90458f6eec42aaf Janne Grunau      2021-11-23  392  		};
90458f6eec42aaf Janne Grunau      2021-11-23  393  
90458f6eec42aaf Janne Grunau      2021-11-23  394  		i2c2: i2c@235018000 {
90458f6eec42aaf Janne Grunau      2021-11-23  395  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aaf Janne Grunau      2021-11-23  396  			reg = <0x2 0x35018000 0x0 0x4000>;
57337b252442128 Hector Martin     2021-10-05  397  			clocks = <&clkref>;
90458f6eec42aaf Janne Grunau      2021-11-23  398  			interrupt-parent = <&aic>;
90458f6eec42aaf Janne Grunau      2021-11-23  399  			interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aaf Janne Grunau      2021-11-23  400  			pinctrl-0 = <&i2c2_pins>;
90458f6eec42aaf Janne Grunau      2021-11-23  401  			pinctrl-names = "default";
90458f6eec42aaf Janne Grunau      2021-11-23  402  			#address-cells = <0x1>;
90458f6eec42aaf Janne Grunau      2021-11-23  403  			#size-cells = <0x0>;
90458f6eec42aaf Janne Grunau      2021-11-23  404  			status = "disabled"; /* not used in all devices */
106ba3b48a35ddf Hector Martin     2021-11-24  405  			power-domains = <&ps_i2c2>;
90458f6eec42aaf Janne Grunau      2021-11-23  406  		};
90458f6eec42aaf Janne Grunau      2021-11-23  407  
90458f6eec42aaf Janne Grunau      2021-11-23  408  		i2c3: i2c@23501c000 {
90458f6eec42aaf Janne Grunau      2021-11-23  409  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aaf Janne Grunau      2021-11-23  410  			reg = <0x2 0x3501c000 0x0 0x4000>;
57337b252442128 Hector Martin     2021-10-05  411  			clocks = <&clkref>;
90458f6eec42aaf Janne Grunau      2021-11-23  412  			interrupt-parent = <&aic>;
90458f6eec42aaf Janne Grunau      2021-11-23  413  			interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aaf Janne Grunau      2021-11-23  414  			pinctrl-0 = <&i2c3_pins>;
90458f6eec42aaf Janne Grunau      2021-11-23  415  			pinctrl-names = "default";
90458f6eec42aaf Janne Grunau      2021-11-23  416  			#address-cells = <0x1>;
90458f6eec42aaf Janne Grunau      2021-11-23  417  			#size-cells = <0x0>;
106ba3b48a35ddf Hector Martin     2021-11-24  418  			power-domains = <&ps_i2c3>;
90458f6eec42aaf Janne Grunau      2021-11-23  419  		};
90458f6eec42aaf Janne Grunau      2021-11-23  420  
90458f6eec42aaf Janne Grunau      2021-11-23  421  		i2c4: i2c@235020000 {
90458f6eec42aaf Janne Grunau      2021-11-23  422  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aaf Janne Grunau      2021-11-23  423  			reg = <0x2 0x35020000 0x0 0x4000>;
57337b252442128 Hector Martin     2021-10-05  424  			clocks = <&clkref>;
90458f6eec42aaf Janne Grunau      2021-11-23  425  			interrupt-parent = <&aic>;
90458f6eec42aaf Janne Grunau      2021-11-23  426  			interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aaf Janne Grunau      2021-11-23  427  			pinctrl-0 = <&i2c4_pins>;
90458f6eec42aaf Janne Grunau      2021-11-23  428  			pinctrl-names = "default";
90458f6eec42aaf Janne Grunau      2021-11-23  429  			#address-cells = <0x1>;
90458f6eec42aaf Janne Grunau      2021-11-23  430  			#size-cells = <0x0>;
106ba3b48a35ddf Hector Martin     2021-11-24  431  			power-domains = <&ps_i2c4>;
90458f6eec42aaf Janne Grunau      2021-11-23  432  			status = "disabled"; /* only used in J293 */
90458f6eec42aaf Janne Grunau      2021-11-23  433  		};
90458f6eec42aaf Janne Grunau      2021-11-23  434  
348981c783b9852 Sasha Finkelstein 2023-04-03  435  		fpwm1: pwm@235044000 {
348981c783b9852 Sasha Finkelstein 2023-04-03  436  			compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
348981c783b9852 Sasha Finkelstein 2023-04-03  437  			reg = <0x2 0x35044000 0x0 0x4000>;
348981c783b9852 Sasha Finkelstein 2023-04-03  438  			power-domains = <&ps_fpwm1>;
348981c783b9852 Sasha Finkelstein 2023-04-03  439  			clocks = <&clkref>;
348981c783b9852 Sasha Finkelstein 2023-04-03  440  			#pwm-cells = <2>;
348981c783b9852 Sasha Finkelstein 2023-04-03  441  			status = "disabled";
348981c783b9852 Sasha Finkelstein 2023-04-03  442  		};
348981c783b9852 Sasha Finkelstein 2023-04-03  443  
7d2d16ccf15d8eb Hector Martin     2021-02-04  444  		serial0: serial@235200000 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  445  			compatible = "apple,s5l-uart";
7d2d16ccf15d8eb Hector Martin     2021-02-04  446  			reg = <0x2 0x35200000 0x0 0x1000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  447  			reg-io-width = <4>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  448  			interrupt-parent = <&aic>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  449  			interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  450  			/*
7d2d16ccf15d8eb Hector Martin     2021-02-04  451  			 * TODO: figure out the clocking properly, there may
7d2d16ccf15d8eb Hector Martin     2021-02-04  452  			 * be a third selectable clock.
7d2d16ccf15d8eb Hector Martin     2021-02-04  453  			 */
57337b252442128 Hector Martin     2021-10-05  454  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  455  			clock-names = "uart", "clk_uart_baud0";
106ba3b48a35ddf Hector Martin     2021-11-24  456  			power-domains = <&ps_uart0>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  457  			status = "disabled";
7d2d16ccf15d8eb Hector Martin     2021-02-04  458  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  459  
2ba22cfeda44566 Hector Martin     2021-09-20  460  		serial2: serial@235208000 {
2ba22cfeda44566 Hector Martin     2021-09-20  461  			compatible = "apple,s5l-uart";
2ba22cfeda44566 Hector Martin     2021-09-20  462  			reg = <0x2 0x35208000 0x0 0x1000>;
2ba22cfeda44566 Hector Martin     2021-09-20  463  			reg-io-width = <4>;
2ba22cfeda44566 Hector Martin     2021-09-20  464  			interrupt-parent = <&aic>;
2ba22cfeda44566 Hector Martin     2021-09-20  465  			interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
57337b252442128 Hector Martin     2021-10-05  466  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  467  			clock-names = "uart", "clk_uart_baud0";
2ba22cfeda44566 Hector Martin     2021-09-20  468  			power-domains = <&ps_uart2>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  469  			status = "disabled";
7d2d16ccf15d8eb Hector Martin     2021-02-04  470  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  471  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  472  		admac: dma-controller@238200000 {
8a3df85ad87d2e7 Martin Povišer    2022-09-16  473  			compatible = "apple,t8103-admac", "apple,admac";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  474  			reg = <0x2 0x38200000 0x0 0x34000>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  475  			dma-channels = <24>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  476  			interrupts-extended = <0>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  477  					      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  478  					      <0>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  479  					      <0>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  480  			#dma-cells = <1>;
63bf0b66ddfa676 Hector Martin     2022-12-05  481  			iommus = <&sio_dart 2>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  482  			power-domains = <&ps_sio_adma>;
56fed763f6b2dc2 Martin Povišer    2022-09-18  483  			resets = <&ps_audio_p>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  484  		};
8a3df85ad87d2e7 Martin Povišer    2022-09-16  485  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  486  		mca: i2s@238400000 {
8a3df85ad87d2e7 Martin Povišer    2022-09-16  487  			compatible = "apple,t8103-mca", "apple,mca";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  488  			reg = <0x2 0x38400000 0x0 0x18000>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  489  			      <0x2 0x38300000 0x0 0x30000>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  490  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  491  			interrupt-parent = <&aic>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  492  			interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  493  				     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  494  				     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  495  				     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  496  				     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  497  				     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  498  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  499  			resets = <&ps_audio_p>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  500  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  501  				 <&nco 3>, <&nco 4>, <&nco 4>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  502  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  503  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  504  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  505  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  506  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  507  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  508  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
8a3df85ad87d2e7 Martin Povišer    2022-09-16  509  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  510  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
8a3df85ad87d2e7 Martin Povišer    2022-09-16  511  				"tx1a", "rx1a", "tx1b", "rx1b",
8a3df85ad87d2e7 Martin Povišer    2022-09-16  512  				"tx2a", "rx2a", "tx2b", "rx2b",
8a3df85ad87d2e7 Martin Povišer    2022-09-16  513  				"tx3a", "rx3a", "tx3b", "rx3b",
8a3df85ad87d2e7 Martin Povišer    2022-09-16  514  				"tx4a", "rx4a", "tx4b", "rx4b",
8a3df85ad87d2e7 Martin Povišer    2022-09-16  515  				"tx5a", "rx5a", "tx5b", "rx5b";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  516  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  517  			#sound-dai-cells = <1>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  518  		};
8a3df85ad87d2e7 Martin Povišer    2022-09-16  519  
8a3df85ad87d2e7 Martin Povišer    2022-09-16  520  		nco: clock-controller@23b044000 {
8a3df85ad87d2e7 Martin Povišer    2022-09-16  521  			compatible = "apple,t8103-nco", "apple,nco";
8a3df85ad87d2e7 Martin Povišer    2022-09-16  522  			reg = <0x2 0x3b044000 0x0 0x14000>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  523  			clocks = <&nco_clkref>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  524  			#clock-cells = <1>;
8a3df85ad87d2e7 Martin Povišer    2022-09-16  525  		};
8a3df85ad87d2e7 Martin Povišer    2022-09-16  526  
7d2d16ccf15d8eb Hector Martin     2021-02-04  527  		aic: interrupt-controller@23b100000 {
7d2d16ccf15d8eb Hector Martin     2021-02-04  528  			compatible = "apple,t8103-aic", "apple,aic";
7d2d16ccf15d8eb Hector Martin     2021-02-04  529  			#interrupt-cells = <3>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  530  			interrupt-controller;
7d2d16ccf15d8eb Hector Martin     2021-02-04  531  			reg = <0x2 0x3b100000 0x0 0x8000>;
106ba3b48a35ddf Hector Martin     2021-11-24  532  			power-domains = <&ps_aic>;
1852e22b318b8d1 Marc Zyngier      2021-12-14  533  
1852e22b318b8d1 Marc Zyngier      2021-12-14  534  			affinities {
1852e22b318b8d1 Marc Zyngier      2021-12-14  535  				e-core-pmu-affinity {
1852e22b318b8d1 Marc Zyngier      2021-12-14  536  					apple,fiq-index = <AIC_CPU_PMU_E>;
3e895a6460ec38e Hector Martin     2022-05-03  537  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
1852e22b318b8d1 Marc Zyngier      2021-12-14  538  				};
1852e22b318b8d1 Marc Zyngier      2021-12-14  539  
1852e22b318b8d1 Marc Zyngier      2021-12-14  540  				p-core-pmu-affinity {
1852e22b318b8d1 Marc Zyngier      2021-12-14  541  					apple,fiq-index = <AIC_CPU_PMU_P>;
3e895a6460ec38e Hector Martin     2022-05-03  542  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
1852e22b318b8d1 Marc Zyngier      2021-12-14  543  				};
1852e22b318b8d1 Marc Zyngier      2021-12-14  544  			};
106ba3b48a35ddf Hector Martin     2021-11-24  545  		};
106ba3b48a35ddf Hector Martin     2021-11-24  546  
106ba3b48a35ddf Hector Martin     2021-11-24  547  		pmgr: power-management@23b700000 {
106ba3b48a35ddf Hector Martin     2021-11-24  548  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
106ba3b48a35ddf Hector Martin     2021-11-24  549  			#address-cells = <1>;
106ba3b48a35ddf Hector Martin     2021-11-24  550  			#size-cells = <1>;
106ba3b48a35ddf Hector Martin     2021-11-24  551  			reg = <0x2 0x3b700000 0 0x14000>;
7d2d16ccf15d8eb Hector Martin     2021-02-04  552  		};
0a8282b831196b7 Mark Kettenis     2021-10-25  553  
0a8282b831196b7 Mark Kettenis     2021-10-25  554  		pinctrl_ap: pinctrl@23c100000 {
0a8282b831196b7 Mark Kettenis     2021-10-25  555  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b7 Mark Kettenis     2021-10-25  556  			reg = <0x2 0x3c100000 0x0 0x100000>;
106ba3b48a35ddf Hector Martin     2021-11-24  557  			power-domains = <&ps_gpio>;
0a8282b831196b7 Mark Kettenis     2021-10-25  558  
0a8282b831196b7 Mark Kettenis     2021-10-25  559  			gpio-controller;
0a8282b831196b7 Mark Kettenis     2021-10-25  560  			#gpio-cells = <2>;
0a8282b831196b7 Mark Kettenis     2021-10-25  561  			gpio-ranges = <&pinctrl_ap 0 0 212>;
0a8282b831196b7 Mark Kettenis     2021-10-25  562  			apple,npins = <212>;
0a8282b831196b7 Mark Kettenis     2021-10-25  563  
0a8282b831196b7 Mark Kettenis     2021-10-25  564  			interrupt-controller;
0668639eaf14813 Janne Grunau      2021-11-22  565  			#interrupt-cells = <2>;
0a8282b831196b7 Mark Kettenis     2021-10-25  566  			interrupt-parent = <&aic>;
0a8282b831196b7 Mark Kettenis     2021-10-25  567  			interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  568  				     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  569  				     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  570  				     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  571  				     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  572  				     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  573  				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b7 Mark Kettenis     2021-10-25  574  
90458f6eec42aaf Janne Grunau      2021-11-23  575  			i2c0_pins: i2c0-pins {
90458f6eec42aaf Janne Grunau      2021-11-23  576  				pinmux = <APPLE_PINMUX(192, 1)>,
90458f6eec42aaf Janne Grunau      2021-11-23  577  					 <APPLE_PINMUX(188, 1)>;
0a8282b831196b7 Mark Kettenis     2021-10-25  578  			};
90458f6eec42aaf Janne Grunau      2021-11-23  579  
90458f6eec42aaf Janne Grunau      2021-11-23  580  			i2c1_pins: i2c1-pins {
90458f6eec42aaf Janne Grunau      2021-11-23  581  				pinmux = <APPLE_PINMUX(201, 1)>,
90458f6eec42aaf Janne Grunau      2021-11-23  582  					 <APPLE_PINMUX(199, 1)>;
0a8282b831196b7 Mark Kettenis     2021-10-25  583  			};
0a8282b831196b7 Mark Kettenis     2021-10-25  584  
90458f6eec42aaf Janne Grunau      2021-11-23  585  			i2c2_pins: i2c2-pins {
90458f6eec42aaf Janne Grunau      2021-11-23  586  				pinmux = <APPLE_PINMUX(163, 1)>,
90458f6eec42aaf Janne Grunau      2021-11-23  587  					 <APPLE_PINMUX(162, 1)>;
90458f6eec42aaf Janne Grunau      2021-11-23  588  			};
0a8282b831196b7 Mark Kettenis     2021-10-25  589  
90458f6eec42aaf Janne Grunau      2021-11-23  590  			i2c3_pins: i2c3-pins {
90458f6eec42aaf Janne Grunau      2021-11-23  591  				pinmux = <APPLE_PINMUX(73, 1)>,
90458f6eec42aaf Janne Grunau      2021-11-23  592  					 <APPLE_PINMUX(72, 1)>;
90458f6eec42aaf Janne Grunau      2021-11-23  593  			};
0a8282b831196b7 Mark Kettenis     2021-10-25  594  
90458f6eec42aaf Janne Grunau      2021-11-23  595  			i2c4_pins: i2c4-pins {
90458f6eec42aaf Janne Grunau      2021-11-23  596  				pinmux = <APPLE_PINMUX(135, 1)>,
90458f6eec42aaf Janne Grunau      2021-11-23  597  					 <APPLE_PINMUX(134, 1)>;
90458f6eec42aaf Janne Grunau      2021-11-23  598  			};
90458f6eec42aaf Janne Grunau      2021-11-23  599  
0a8282b831196b7 Mark Kettenis     2021-10-25  600  			pcie_pins: pcie-pins {
0a8282b831196b7 Mark Kettenis     2021-10-25  601  				pinmux = <APPLE_PINMUX(150, 1)>,
0a8282b831196b7 Mark Kettenis     2021-10-25  602  					 <APPLE_PINMUX(151, 1)>,
0a8282b831196b7 Mark Kettenis     2021-10-25  603  					 <APPLE_PINMUX(32, 1)>;
0a8282b831196b7 Mark Kettenis     2021-10-25  604  			};
0a8282b831196b7 Mark Kettenis     2021-10-25  605  		};
0a8282b831196b7 Mark Kettenis     2021-10-25  606  
0a8282b831196b7 Mark Kettenis     2021-10-25  607  		pinctrl_nub: pinctrl@23d1f0000 {
0a8282b831196b7 Mark Kettenis     2021-10-25  608  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b7 Mark Kettenis     2021-10-25  609  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
106ba3b48a35ddf Hector Martin     2021-11-24  610  			power-domains = <&ps_nub_gpio>;
0a8282b831196b7 Mark Kettenis     2021-10-25  611  
0a8282b831196b7 Mark Kettenis     2021-10-25  612  			gpio-controller;
0a8282b831196b7 Mark Kettenis     2021-10-25  613  			#gpio-cells = <2>;
0a8282b831196b7 Mark Kettenis     2021-10-25  614  			gpio-ranges = <&pinctrl_nub 0 0 23>;
0a8282b831196b7 Mark Kettenis     2021-10-25  615  			apple,npins = <23>;
0a8282b831196b7 Mark Kettenis     2021-10-25  616  
0a8282b831196b7 Mark Kettenis     2021-10-25  617  			interrupt-controller;
0668639eaf14813 Janne Grunau      2021-11-22  618  			#interrupt-cells = <2>;
0a8282b831196b7 Mark Kettenis     2021-10-25  619  			interrupt-parent = <&aic>;
0a8282b831196b7 Mark Kettenis     2021-10-25  620  			interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  621  				     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  622  				     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  623  				     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  624  				     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  625  				     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  626  				     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b7 Mark Kettenis     2021-10-25  627  		};
0a8282b831196b7 Mark Kettenis     2021-10-25  628  
8adf987ce082754 Hector Martin     2021-12-12  629  		pmgr_mini: power-management@23d280000 {
8adf987ce082754 Hector Martin     2021-12-12  630  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
8adf987ce082754 Hector Martin     2021-12-12  631  			#address-cells = <1>;
8adf987ce082754 Hector Martin     2021-12-12  632  			#size-cells = <1>;
8adf987ce082754 Hector Martin     2021-12-12  633  			reg = <0x2 0x3d280000 0 0x4000>;
8adf987ce082754 Hector Martin     2021-12-12  634  		};
8adf987ce082754 Hector Martin     2021-12-12  635  
b4d11106d751a45 Sven Peter        2021-12-11  636  		wdt: watchdog@23d2b0000 {
b4d11106d751a45 Sven Peter        2021-12-11  637  			compatible = "apple,t8103-wdt", "apple,wdt";
b4d11106d751a45 Sven Peter        2021-12-11  638  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
57337b252442128 Hector Martin     2021-10-05  639  			clocks = <&clkref>;
b4d11106d751a45 Sven Peter        2021-12-11  640  			interrupt-parent = <&aic>;
b4d11106d751a45 Sven Peter        2021-12-11  641  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
b4d11106d751a45 Sven Peter        2021-12-11  642  		};
b4d11106d751a45 Sven Peter        2021-12-11  643  
0a8282b831196b7 Mark Kettenis     2021-10-25  644  		pinctrl_smc: pinctrl@23e820000 {
0a8282b831196b7 Mark Kettenis     2021-10-25  645  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b7 Mark Kettenis     2021-10-25  646  			reg = <0x2 0x3e820000 0x0 0x4000>;
0a8282b831196b7 Mark Kettenis     2021-10-25  647  
0a8282b831196b7 Mark Kettenis     2021-10-25  648  			gpio-controller;
0a8282b831196b7 Mark Kettenis     2021-10-25  649  			#gpio-cells = <2>;
0a8282b831196b7 Mark Kettenis     2021-10-25  650  			gpio-ranges = <&pinctrl_smc 0 0 16>;
0a8282b831196b7 Mark Kettenis     2021-10-25  651  			apple,npins = <16>;
0a8282b831196b7 Mark Kettenis     2021-10-25  652  
0a8282b831196b7 Mark Kettenis     2021-10-25  653  			interrupt-controller;
0668639eaf14813 Janne Grunau      2021-11-22  654  			#interrupt-cells = <2>;
0a8282b831196b7 Mark Kettenis     2021-10-25  655  			interrupt-parent = <&aic>;
0a8282b831196b7 Mark Kettenis     2021-10-25  656  			interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  657  				     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  658  				     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  659  				     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  660  				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  661  				     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b7 Mark Kettenis     2021-10-25  662  				     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b7 Mark Kettenis     2021-10-25  663  		};
ff2a8d91d80c548 Mark Kettenis     2021-10-25  664  
8adf987ce082754 Hector Martin     2021-12-12  665  		pinctrl_aop: pinctrl@24a820000 {
8adf987ce082754 Hector Martin     2021-12-12  666  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
8adf987ce082754 Hector Martin     2021-12-12  667  			reg = <0x2 0x4a820000 0x0 0x4000>;
8adf987ce082754 Hector Martin     2021-12-12  668  
8adf987ce082754 Hector Martin     2021-12-12  669  			gpio-controller;
8adf987ce082754 Hector Martin     2021-12-12  670  			#gpio-cells = <2>;
8adf987ce082754 Hector Martin     2021-12-12  671  			gpio-ranges = <&pinctrl_aop 0 0 42>;
8adf987ce082754 Hector Martin     2021-12-12  672  			apple,npins = <42>;
8adf987ce082754 Hector Martin     2021-12-12  673  
8adf987ce082754 Hector Martin     2021-12-12  674  			interrupt-controller;
8adf987ce082754 Hector Martin     2021-12-12  675  			#interrupt-cells = <2>;
8adf987ce082754 Hector Martin     2021-12-12  676  			interrupt-parent = <&aic>;
8adf987ce082754 Hector Martin     2021-12-12  677  			interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce082754 Hector Martin     2021-12-12  678  				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce082754 Hector Martin     2021-12-12  679  				     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce082754 Hector Martin     2021-12-12  680  				     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce082754 Hector Martin     2021-12-12  681  				     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce082754 Hector Martin     2021-12-12  682  				     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce082754 Hector Martin     2021-12-12  683  				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
8adf987ce082754 Hector Martin     2021-12-12  684  		};
8adf987ce082754 Hector Martin     2021-12-12  685  
5316d73ba81b5dd Sven Peter        2022-06-02  686  		ans_mbox: mbox@277408000 {
5316d73ba81b5dd Sven Peter        2022-06-02  687  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
5316d73ba81b5dd Sven Peter        2022-06-02  688  			reg = <0x2 0x77408000 0x0 0x4000>;
5316d73ba81b5dd Sven Peter        2022-06-02  689  			interrupt-parent = <&aic>;
5316d73ba81b5dd Sven Peter        2022-06-02  690  			interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5dd Sven Peter        2022-06-02  691  				<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5dd Sven Peter        2022-06-02  692  				<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5dd Sven Peter        2022-06-02  693  				<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5dd Sven Peter        2022-06-02  694  			interrupt-names = "send-empty", "send-not-empty",
5316d73ba81b5dd Sven Peter        2022-06-02  695  				"recv-empty", "recv-not-empty";
5316d73ba81b5dd Sven Peter        2022-06-02  696  			#mbox-cells = <0>;
5316d73ba81b5dd Sven Peter        2022-06-02  697  			power-domains = <&ps_ans2>;
5316d73ba81b5dd Sven Peter        2022-06-02  698  		};
5316d73ba81b5dd Sven Peter        2022-06-02  699  
5316d73ba81b5dd Sven Peter        2022-06-02  700  		sart: iommu@27bc50000 {
5316d73ba81b5dd Sven Peter        2022-06-02  701  			compatible = "apple,t8103-sart";
5316d73ba81b5dd Sven Peter        2022-06-02  702  			reg = <0x2 0x7bc50000 0x0 0x10000>;
5316d73ba81b5dd Sven Peter        2022-06-02  703  			power-domains = <&ps_ans2>;
5316d73ba81b5dd Sven Peter        2022-06-02  704  		};
5316d73ba81b5dd Sven Peter        2022-06-02  705  
5316d73ba81b5dd Sven Peter        2022-06-02  706  		nvme@27bcc0000 {
5316d73ba81b5dd Sven Peter        2022-06-02  707  			compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
5316d73ba81b5dd Sven Peter        2022-06-02  708  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
5316d73ba81b5dd Sven Peter        2022-06-02  709  				<0x2 0x77400000 0x0 0x4000>;
5316d73ba81b5dd Sven Peter        2022-06-02  710  			reg-names = "nvme", "ans";
5316d73ba81b5dd Sven Peter        2022-06-02  711  			interrupt-parent = <&aic>;
5316d73ba81b5dd Sven Peter        2022-06-02  712  			interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5dd Sven Peter        2022-06-02  713  			mboxes = <&ans_mbox>;
5316d73ba81b5dd Sven Peter        2022-06-02  714  			apple,sart = <&sart>;
5316d73ba81b5dd Sven Peter        2022-06-02  715  			power-domains = <&ps_ans2>, <&ps_apcie_st>;
5316d73ba81b5dd Sven Peter        2022-06-02  716  			power-domain-names = "ans", "apcie0";
5316d73ba81b5dd Sven Peter        2022-06-02  717  			resets = <&ps_ans2>;
5316d73ba81b5dd Sven Peter        2022-06-02  718  		};
5316d73ba81b5dd Sven Peter        2022-06-02  719  
b13697a935ba3a9 Sven Peter        2023-02-19 @720  		efuse@3d2bc000 {
b13697a935ba3a9 Sven Peter        2023-02-19  721  			compatible = "apple,t8103-efuses", "apple,efuses";
b13697a935ba3a9 Sven Peter        2023-02-19  722  			reg = <0x2 0x3d2bc000 0x0 0x1000>;
b13697a935ba3a9 Sven Peter        2023-02-19  723  			#address-cells = <1>;
b13697a935ba3a9 Sven Peter        2023-02-19  724  			#size-cells = <1>;
b13697a935ba3a9 Sven Peter        2023-02-19  725  		};
b13697a935ba3a9 Sven Peter        2023-02-19  726  
8b7767093087f4b Hector Martin     2023-02-19  727  		dwc3_0: usb@382280000 {
8b7767093087f4b Hector Martin     2023-02-19  728  			compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
8b7767093087f4b Hector Martin     2023-02-19  729  			reg = <0x3 0x82280000 0x0 0x100000>;
8b7767093087f4b Hector Martin     2023-02-19  730  			interrupt-parent = <&aic>;
8b7767093087f4b Hector Martin     2023-02-19  731  			interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
8b7767093087f4b Hector Martin     2023-02-19  732  			dr_mode = "otg";
8b7767093087f4b Hector Martin     2023-02-19  733  			usb-role-switch;
8b7767093087f4b Hector Martin     2023-02-19  734  			role-switch-default-mode = "host";
8b7767093087f4b Hector Martin     2023-02-19  735  			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
8b7767093087f4b Hector Martin     2023-02-19  736  			power-domains = <&ps_atc0_usb>;
8b7767093087f4b Hector Martin     2023-02-19  737  		};
8b7767093087f4b Hector Martin     2023-02-19  738  
8b7767093087f4b Hector Martin     2023-02-19  739  		dwc3_0_dart_0: iommu@382f00000 {
8b7767093087f4b Hector Martin     2023-02-19  740  			compatible = "apple,t8103-dart";
8b7767093087f4b Hector Martin     2023-02-19  741  			reg = <0x3 0x82f00000 0x0 0x4000>;
8b7767093087f4b Hector Martin     2023-02-19  742  			interrupt-parent = <&aic>;
8b7767093087f4b Hector Martin     2023-02-19  743  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
8b7767093087f4b Hector Martin     2023-02-19  744  			#iommu-cells = <1>;
8b7767093087f4b Hector Martin     2023-02-19  745  			power-domains = <&ps_atc0_usb>;
8b7767093087f4b Hector Martin     2023-02-19  746  		};
8b7767093087f4b Hector Martin     2023-02-19  747  
8b7767093087f4b Hector Martin     2023-02-19  748  		dwc3_0_dart_1: iommu@382f80000 {
8b7767093087f4b Hector Martin     2023-02-19  749  			compatible = "apple,t8103-dart";
8b7767093087f4b Hector Martin     2023-02-19  750  			reg = <0x3 0x82f80000 0x0 0x4000>;
8b7767093087f4b Hector Martin     2023-02-19  751  			interrupt-parent = <&aic>;
8b7767093087f4b Hector Martin     2023-02-19  752  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
8b7767093087f4b Hector Martin     2023-02-19  753  			#iommu-cells = <1>;
8b7767093087f4b Hector Martin     2023-02-19  754  			power-domains = <&ps_atc0_usb>;
8b7767093087f4b Hector Martin     2023-02-19  755  		};
8b7767093087f4b Hector Martin     2023-02-19  756  
8b7767093087f4b Hector Martin     2023-02-19  757  		dwc3_1: usb@502280000 {
8b7767093087f4b Hector Martin     2023-02-19  758  			compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
8b7767093087f4b Hector Martin     2023-02-19  759  			reg = <0x5 0x02280000 0x0 0x100000>;
8b7767093087f4b Hector Martin     2023-02-19  760  			interrupt-parent = <&aic>;
8b7767093087f4b Hector Martin     2023-02-19  761  			interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
8b7767093087f4b Hector Martin     2023-02-19  762  			dr_mode = "otg";
8b7767093087f4b Hector Martin     2023-02-19  763  			usb-role-switch;
8b7767093087f4b Hector Martin     2023-02-19  764  			role-switch-default-mode = "host";
8b7767093087f4b Hector Martin     2023-02-19  765  			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
8b7767093087f4b Hector Martin     2023-02-19  766  			power-domains = <&ps_atc1_usb>;
8b7767093087f4b Hector Martin     2023-02-19  767  		};
8b7767093087f4b Hector Martin     2023-02-19  768  
8b7767093087f4b Hector Martin     2023-02-19  769  		dwc3_1_dart_0: iommu@502f00000 {
8b7767093087f4b Hector Martin     2023-02-19  770  			compatible = "apple,t8103-dart";
8b7767093087f4b Hector Martin     2023-02-19  771  			reg = <0x5 0x02f00000 0x0 0x4000>;
8b7767093087f4b Hector Martin     2023-02-19  772  			interrupt-parent = <&aic>;
8b7767093087f4b Hector Martin     2023-02-19  773  			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
8b7767093087f4b Hector Martin     2023-02-19  774  			#iommu-cells = <1>;
8b7767093087f4b Hector Martin     2023-02-19  775  			power-domains = <&ps_atc1_usb>;
8b7767093087f4b Hector Martin     2023-02-19  776  		};
8b7767093087f4b Hector Martin     2023-02-19  777  
8b7767093087f4b Hector Martin     2023-02-19  778  		dwc3_1_dart_1: iommu@502f80000 {
8b7767093087f4b Hector Martin     2023-02-19  779  			compatible = "apple,t8103-dart";
8b7767093087f4b Hector Martin     2023-02-19  780  			reg = <0x5 0x02f80000 0x0 0x4000>;
8b7767093087f4b Hector Martin     2023-02-19  781  			interrupt-parent = <&aic>;
8b7767093087f4b Hector Martin     2023-02-19  782  			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
8b7767093087f4b Hector Martin     2023-02-19  783  			#iommu-cells = <1>;
8b7767093087f4b Hector Martin     2023-02-19  784  			power-domains = <&ps_atc1_usb>;
8b7767093087f4b Hector Martin     2023-02-19  785  		};
8b7767093087f4b Hector Martin     2023-02-19  786  
56d32c51dffac8a Janne Grunau      2022-12-06  787  		pcie0_dart_0: iommu@681008000 {
3c866bb79577ed2 Marc Zyngier      2021-10-25  788  			compatible = "apple,t8103-dart";
3c866bb79577ed2 Marc Zyngier      2021-10-25  789  			reg = <0x6 0x81008000 0x0 0x4000>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  790  			#iommu-cells = <1>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  791  			interrupt-parent = <&aic>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  792  			interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35ddf Hector Martin     2021-11-24  793  			power-domains = <&ps_apcie_gp>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  794  		};
3c866bb79577ed2 Marc Zyngier      2021-10-25  795  
56d32c51dffac8a Janne Grunau      2022-12-06  796  		pcie0_dart_1: iommu@682008000 {
3c866bb79577ed2 Marc Zyngier      2021-10-25  797  			compatible = "apple,t8103-dart";
3c866bb79577ed2 Marc Zyngier      2021-10-25  798  			reg = <0x6 0x82008000 0x0 0x4000>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  799  			#iommu-cells = <1>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  800  			interrupt-parent = <&aic>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  801  			interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35ddf Hector Martin     2021-11-24  802  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac8 Janne Grunau      2023-02-14  803  			status = "disabled";
3c866bb79577ed2 Marc Zyngier      2021-10-25  804  		};
3c866bb79577ed2 Marc Zyngier      2021-10-25  805  
56d32c51dffac8a Janne Grunau      2022-12-06  806  		pcie0_dart_2: iommu@683008000 {
3c866bb79577ed2 Marc Zyngier      2021-10-25  807  			compatible = "apple,t8103-dart";
3c866bb79577ed2 Marc Zyngier      2021-10-25  808  			reg = <0x6 0x83008000 0x0 0x4000>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  809  			#iommu-cells = <1>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  810  			interrupt-parent = <&aic>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  811  			interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35ddf Hector Martin     2021-11-24  812  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac8 Janne Grunau      2023-02-14  813  			status = "disabled";
3c866bb79577ed2 Marc Zyngier      2021-10-25  814  		};
3c866bb79577ed2 Marc Zyngier      2021-10-25  815  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  816  		pcie0: pcie@690000000 {
ff2a8d91d80c548 Mark Kettenis     2021-10-25  817  			compatible = "apple,t8103-pcie", "apple,pcie";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  818  			device_type = "pci";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  819  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  820  			reg = <0x6 0x90000000 0x0 0x1000000>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  821  			      <0x6 0x80000000 0x0 0x100000>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  822  			      <0x6 0x81000000 0x0 0x4000>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  823  			      <0x6 0x82000000 0x0 0x4000>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  824  			      <0x6 0x83000000 0x0 0x4000>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  825  			reg-names = "config", "rc", "port0", "port1", "port2";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  826  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  827  			interrupt-parent = <&aic>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  828  			interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  829  				     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  830  				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  831  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  832  			msi-controller;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  833  			msi-parent = <&pcie0>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  834  			msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  835  
3c866bb79577ed2 Marc Zyngier      2021-10-25  836  
3c866bb79577ed2 Marc Zyngier      2021-10-25  837  			iommu-map = <0x100 &pcie0_dart_0 1 1>,
3c866bb79577ed2 Marc Zyngier      2021-10-25  838  				    <0x200 &pcie0_dart_1 1 1>,
3c866bb79577ed2 Marc Zyngier      2021-10-25  839  				    <0x300 &pcie0_dart_2 1 1>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  840  			iommu-map-mask = <0xff00>;
3c866bb79577ed2 Marc Zyngier      2021-10-25  841  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  842  			bus-range = <0 3>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  843  			#address-cells = <3>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  844  			#size-cells = <2>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  845  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
ff2a8d91d80c548 Mark Kettenis     2021-10-25  846  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  847  
106ba3b48a35ddf Hector Martin     2021-11-24  848  			power-domains = <&ps_apcie_gp>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  849  			pinctrl-0 = <&pcie_pins>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  850  			pinctrl-names = "default";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  851  
128888a6fdb6959 Marc Zyngier      2021-10-25  852  			port00: pci@0,0 {
ff2a8d91d80c548 Mark Kettenis     2021-10-25  853  				device_type = "pci";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  854  				reg = <0x0 0x0 0x0 0x0 0x0>;
5b970dfcfee9e04 Marc Zyngier      2021-11-23  855  				reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  856  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  857  				#address-cells = <3>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  858  				#size-cells = <2>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  859  				ranges;
128888a6fdb6959 Marc Zyngier      2021-10-25  860  
128888a6fdb6959 Marc Zyngier      2021-10-25  861  				interrupt-controller;
128888a6fdb6959 Marc Zyngier      2021-10-25  862  				#interrupt-cells = <1>;
128888a6fdb6959 Marc Zyngier      2021-10-25  863  
128888a6fdb6959 Marc Zyngier      2021-10-25  864  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb6959 Marc Zyngier      2021-10-25  865  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
128888a6fdb6959 Marc Zyngier      2021-10-25  866  						<0 0 0 2 &port00 0 0 0 1>,
128888a6fdb6959 Marc Zyngier      2021-10-25  867  						<0 0 0 3 &port00 0 0 0 2>,
128888a6fdb6959 Marc Zyngier      2021-10-25  868  						<0 0 0 4 &port00 0 0 0 3>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  869  			};
ff2a8d91d80c548 Mark Kettenis     2021-10-25  870  
128888a6fdb6959 Marc Zyngier      2021-10-25  871  			port01: pci@1,0 {
ff2a8d91d80c548 Mark Kettenis     2021-10-25  872  				device_type = "pci";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  873  				reg = <0x800 0x0 0x0 0x0 0x0>;
5b970dfcfee9e04 Marc Zyngier      2021-11-23  874  				reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  875  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  876  				#address-cells = <3>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  877  				#size-cells = <2>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  878  				ranges;
128888a6fdb6959 Marc Zyngier      2021-10-25  879  
128888a6fdb6959 Marc Zyngier      2021-10-25  880  				interrupt-controller;
128888a6fdb6959 Marc Zyngier      2021-10-25  881  				#interrupt-cells = <1>;
128888a6fdb6959 Marc Zyngier      2021-10-25  882  
128888a6fdb6959 Marc Zyngier      2021-10-25  883  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb6959 Marc Zyngier      2021-10-25  884  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
128888a6fdb6959 Marc Zyngier      2021-10-25  885  						<0 0 0 2 &port01 0 0 0 1>,
128888a6fdb6959 Marc Zyngier      2021-10-25  886  						<0 0 0 3 &port01 0 0 0 2>,
128888a6fdb6959 Marc Zyngier      2021-10-25  887  						<0 0 0 4 &port01 0 0 0 3>;
a0189fdfb73dac8 Janne Grunau      2023-02-14  888  				status = "disabled";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  889  			};
ff2a8d91d80c548 Mark Kettenis     2021-10-25  890  
128888a6fdb6959 Marc Zyngier      2021-10-25  891  			port02: pci@2,0 {
ff2a8d91d80c548 Mark Kettenis     2021-10-25  892  				device_type = "pci";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  893  				reg = <0x1000 0x0 0x0 0x0 0x0>;
5b970dfcfee9e04 Marc Zyngier      2021-11-23  894  				reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  895  
ff2a8d91d80c548 Mark Kettenis     2021-10-25  896  				#address-cells = <3>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  897  				#size-cells = <2>;
ff2a8d91d80c548 Mark Kettenis     2021-10-25  898  				ranges;
128888a6fdb6959 Marc Zyngier      2021-10-25  899  
128888a6fdb6959 Marc Zyngier      2021-10-25  900  				interrupt-controller;
128888a6fdb6959 Marc Zyngier      2021-10-25  901  				#interrupt-cells = <1>;
128888a6fdb6959 Marc Zyngier      2021-10-25  902  
128888a6fdb6959 Marc Zyngier      2021-10-25  903  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb6959 Marc Zyngier      2021-10-25  904  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
128888a6fdb6959 Marc Zyngier      2021-10-25  905  						<0 0 0 2 &port02 0 0 0 1>,
128888a6fdb6959 Marc Zyngier      2021-10-25  906  						<0 0 0 3 &port02 0 0 0 2>,
128888a6fdb6959 Marc Zyngier      2021-10-25  907  						<0 0 0 4 &port02 0 0 0 3>;
a0189fdfb73dac8 Janne Grunau      2023-02-14  908  				status = "disabled";
ff2a8d91d80c548 Mark Kettenis     2021-10-25  909  			};
ff2a8d91d80c548 Mark Kettenis     2021-10-25  910  		};
7d2d16ccf15d8eb Hector Martin     2021-02-04  911  	};
7d2d16ccf15d8eb Hector Martin     2021-02-04  912  };
106ba3b48a35ddf Hector Martin     2021-11-24  913  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
