Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FE6C139
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727525718; cv=none; b=JoRuIh3CgUSBuFNz/zmTzksI/rs9mNYxAiIC41Wg4MOGR2iyulx4bW+jW44RKqVDNP+30Yx6CiEuBvWeyvll6JnjaqVjSWvEh3XKn5nLpJCfAqcZWXKVOHOEv3lnka2pymfLYd4ADfU/YnIYWtiQrs0etjih+t/OniNcPjIMLKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727525718; c=relaxed/simple;
	bh=UBRiWahnx7dOAVQdXZN4RhdnYttzt2th8TUsGhpcLY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CV0UxsqkwWy9vuguNP0HjWrTrEU1revlGuWhH4Qvts33uwyalG7xHFqd5ee6M8vQFJZmmEq+Ezjc3IGniy866JzCA5tPyNf3RtXCcsIkLQdyLyVdwevVgyI7S9Pl25eauWiV8/07kLTF2AakL9WGC4ak2kgSx6JoJH62td7IJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNSf9qy4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNSf9qy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727525717; x=1759061717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBRiWahnx7dOAVQdXZN4RhdnYttzt2th8TUsGhpcLY0=;
  b=NNSf9qy4sMa/a5uzCutEaul3I7xpORzUdnxOn898kE0770v3TM5IyHpZ
   En5nu93Dc4inwDDv1t98mDl7SPOdw03HtHYBzOGCfudhx3lZi7BkIZ0Sy
   xvGZ2OstTKoIvHt3DMohbKNC3xVDoi6VY3ISRFqFQmHMI2NYzd3aBJ1Du
   e49pUMquodTeGL8AFp0fzh0XrIj4TYHYHT5K4UH1lfZDpMFl3WupTp438
   wDGlrC0vqWGGss4CWwhvMr/4fXZc1DTCacj+Rarcqfo1r1QJ9TW7JqEbf
   JIHUNY1EMLehEKnni+F6HRh6DXeF/KwWJDNV1CvfqPmlpgRBNeZQYCNi3
   w==;
X-CSE-ConnectionGUID: BfccKku1QJSpXRHw+8m4JQ==
X-CSE-MsgGUID: 42i/A2+jRP6ZLPr+qdMcYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26174085"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26174085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:15:16 -0700
X-CSE-ConnectionGUID: Om8m2QCWQWKyiGo4lIPWkg==
X-CSE-MsgGUID: e+pyuNKxRXCnC+VLDKiIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="110289190"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2024 05:15:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWLw-000NFM-0K;
	Sat, 28 Sep 2024 12:15:12 +0000
Date: Sat, 28 Sep 2024 20:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 756/1001]
 arch/arm64/boot/dts/xilinx/versal.dtsi:295.27-305.5: Warning
 (avoid_unnecessary_addr_size): /axi/ethernet@ff0d0000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202409282040.3jsAMYqq-lkp@intel.com>
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
CC: git@amd.com
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 822544d3e453f11292dbf89e2e6ba46f09108dd9 [756/1001] arm64: versal: Move ethernet phys to mdio node
:::::: branch date: 8 weeks ago
:::::: commit date: 8 months ago
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240928/202409282040.3jsAMYqq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282040.3jsAMYqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409282040.3jsAMYqq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/versal.dtsi:295.27-305.5: Warning (avoid_unnecessary_addr_size): /axi/ethernet@ff0d0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +295 arch/arm64/boot/dts/xilinx/versal.dtsi

2ab457093da8ac Michal Simek 2022-02-14   11  
2ab457093da8ac Michal Simek 2022-02-14   12  / {
2ab457093da8ac Michal Simek 2022-02-14   13  	compatible = "xlnx,versal";
2ab457093da8ac Michal Simek 2022-02-14   14  	#address-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14   15  	#size-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14   16  	model = "Xilinx Versal";
2ab457093da8ac Michal Simek 2022-02-14   17  
2ab457093da8ac Michal Simek 2022-02-14   18  	cpus: cpus {
2ab457093da8ac Michal Simek 2022-02-14   19  		#address-cells = <1>;
2ab457093da8ac Michal Simek 2022-02-14   20  		#size-cells = <0>;
2ab457093da8ac Michal Simek 2022-02-14   21  
2ab457093da8ac Michal Simek 2022-02-14   22  		cpu0: cpu@0 {
2ab457093da8ac Michal Simek 2022-02-14   23  			compatible = "arm,cortex-a72", "arm,armv8";
2ab457093da8ac Michal Simek 2022-02-14   24  			device_type = "cpu";
2ab457093da8ac Michal Simek 2022-02-14   25  			enable-method = "psci";
2ab457093da8ac Michal Simek 2022-02-14   26  			operating-points-v2 = <&cpu_opp_table>;
2ab457093da8ac Michal Simek 2022-02-14   27  			reg = <0>;
2ab457093da8ac Michal Simek 2022-02-14   28  			cpu-idle-states = <&CPU_SLEEP_0>;
2ab457093da8ac Michal Simek 2022-02-14   29  		};
2ab457093da8ac Michal Simek 2022-02-14   30  
2ab457093da8ac Michal Simek 2022-02-14   31  		cpu1: cpu@1 {
2ab457093da8ac Michal Simek 2022-02-14   32  			compatible = "arm,cortex-a72", "arm,armv8";
2ab457093da8ac Michal Simek 2022-02-14   33  			device_type = "cpu";
2ab457093da8ac Michal Simek 2022-02-14   34  			enable-method = "psci";
2ab457093da8ac Michal Simek 2022-02-14   35  			operating-points-v2 = <&cpu_opp_table>;
2ab457093da8ac Michal Simek 2022-02-14   36  			reg = <1>;
2ab457093da8ac Michal Simek 2022-02-14   37  			cpu-idle-states = <&CPU_SLEEP_0>;
2ab457093da8ac Michal Simek 2022-02-14   38  		};
2ab457093da8ac Michal Simek 2022-02-14   39  
2ab457093da8ac Michal Simek 2022-02-14   40  		idle-states {
2ab457093da8ac Michal Simek 2022-02-14   41  			entry-method = "psci";
2ab457093da8ac Michal Simek 2022-02-14   42  
2ab457093da8ac Michal Simek 2022-02-14   43  			CPU_SLEEP_0: cpu-sleep-0 {
2ab457093da8ac Michal Simek 2022-02-14   44  				compatible = "arm,idle-state";
2ab457093da8ac Michal Simek 2022-02-14   45  				arm,psci-suspend-param = <0x40000000>;
2ab457093da8ac Michal Simek 2022-02-14   46  				local-timer-stop;
2ab457093da8ac Michal Simek 2022-02-14   47  				entry-latency-us = <300>;
2ab457093da8ac Michal Simek 2022-02-14   48  				exit-latency-us = <600>;
2ab457093da8ac Michal Simek 2022-02-14   49  				min-residency-us = <10000>;
2ab457093da8ac Michal Simek 2022-02-14   50  			};
2ab457093da8ac Michal Simek 2022-02-14   51  		};
2ab457093da8ac Michal Simek 2022-02-14   52  	};
2ab457093da8ac Michal Simek 2022-02-14   53  
2ab457093da8ac Michal Simek 2022-02-14   54  	cpu_opp_table: cpu-opp-table {
2ab457093da8ac Michal Simek 2022-02-14   55  		compatible = "operating-points-v2";
2ab457093da8ac Michal Simek 2022-02-14   56  		opp-shared;
2ab457093da8ac Michal Simek 2022-02-14   57  		opp00 {
2ab457093da8ac Michal Simek 2022-02-14   58  			opp-hz = /bits/ 64 <1199999988>;
2ab457093da8ac Michal Simek 2022-02-14   59  			opp-microvolt = <1000000>;
2ab457093da8ac Michal Simek 2022-02-14   60  			clock-latency-ns = <500000>;
2ab457093da8ac Michal Simek 2022-02-14   61  		};
2ab457093da8ac Michal Simek 2022-02-14   62  		opp01 {
2ab457093da8ac Michal Simek 2022-02-14   63  			opp-hz = /bits/ 64 <599999994>;
2ab457093da8ac Michal Simek 2022-02-14   64  			opp-microvolt = <1000000>;
2ab457093da8ac Michal Simek 2022-02-14   65  			clock-latency-ns = <500000>;
2ab457093da8ac Michal Simek 2022-02-14   66  		};
2ab457093da8ac Michal Simek 2022-02-14   67  		opp02 {
2ab457093da8ac Michal Simek 2022-02-14   68  			opp-hz = /bits/ 64 <399999996>;
2ab457093da8ac Michal Simek 2022-02-14   69  			opp-microvolt = <1000000>;
2ab457093da8ac Michal Simek 2022-02-14   70  			clock-latency-ns = <500000>;
2ab457093da8ac Michal Simek 2022-02-14   71  		};
2ab457093da8ac Michal Simek 2022-02-14   72  		opp03 {
2ab457093da8ac Michal Simek 2022-02-14   73  			opp-hz = /bits/ 64 <299999997>;
2ab457093da8ac Michal Simek 2022-02-14   74  			opp-microvolt = <1000000>;
2ab457093da8ac Michal Simek 2022-02-14   75  			clock-latency-ns = <500000>;
2ab457093da8ac Michal Simek 2022-02-14   76  		};
2ab457093da8ac Michal Simek 2022-02-14   77  	};
2ab457093da8ac Michal Simek 2022-02-14   78  
2ab457093da8ac Michal Simek 2022-02-14   79  	dcc: dcc {
2ab457093da8ac Michal Simek 2022-02-14   80  		compatible = "arm,dcc";
2ab457093da8ac Michal Simek 2022-02-14   81  		status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14   82  		bootph-all;
2ab457093da8ac Michal Simek 2022-02-14   83  	};
2ab457093da8ac Michal Simek 2022-02-14   84  
2ab457093da8ac Michal Simek 2022-02-14   85  	fpga: fpga {
2ab457093da8ac Michal Simek 2022-02-14   86  		compatible = "fpga-region";
2ab457093da8ac Michal Simek 2022-02-14   87  		fpga-mgr = <&versal_fpga>;
2ab457093da8ac Michal Simek 2022-02-14   88  		#address-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14   89  		#size-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14   90  	};
2ab457093da8ac Michal Simek 2022-02-14   91  
2ab457093da8ac Michal Simek 2022-02-14   92  	psci: psci {
2ab457093da8ac Michal Simek 2022-02-14   93  		compatible = "arm,psci-0.2";
2ab457093da8ac Michal Simek 2022-02-14   94  		method = "smc";
2ab457093da8ac Michal Simek 2022-02-14   95  	};
2ab457093da8ac Michal Simek 2022-02-14   96  
2ab457093da8ac Michal Simek 2022-02-14   97  	pmu {
2ab457093da8ac Michal Simek 2022-02-14   98  		compatible = "arm,armv8-pmuv3";
2ab457093da8ac Michal Simek 2022-02-14   99  		interrupt-parent = <&gic>;
2ab457093da8ac Michal Simek 2022-02-14  100  		interrupts = <1 7 0x304>;
2ab457093da8ac Michal Simek 2022-02-14  101  	};
2ab457093da8ac Michal Simek 2022-02-14  102  
2ab457093da8ac Michal Simek 2022-02-14  103  	timer: timer {
2ab457093da8ac Michal Simek 2022-02-14  104  		compatible = "arm,armv8-timer";
2ab457093da8ac Michal Simek 2022-02-14  105  		interrupt-parent = <&gic>;
2ab457093da8ac Michal Simek 2022-02-14  106  		interrupts = <1 13 4>,
2ab457093da8ac Michal Simek 2022-02-14  107  			     <1 14 4>,
2ab457093da8ac Michal Simek 2022-02-14  108  			     <1 11 4>,
2ab457093da8ac Michal Simek 2022-02-14  109  			     <1 10 4>;
2ab457093da8ac Michal Simek 2022-02-14  110  	};
2ab457093da8ac Michal Simek 2022-02-14  111  
2ab457093da8ac Michal Simek 2022-02-14  112  	versal_fpga: versal-fpga {
2ab457093da8ac Michal Simek 2022-02-14  113  		compatible = "xlnx,versal-fpga";
2ab457093da8ac Michal Simek 2022-02-14  114  	};
2ab457093da8ac Michal Simek 2022-02-14  115  
2ab457093da8ac Michal Simek 2022-02-14  116  	amba: axi {
2ab457093da8ac Michal Simek 2022-02-14  117  		compatible = "simple-bus";
2ab457093da8ac Michal Simek 2022-02-14  118  		#address-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14  119  		#size-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14  120  		ranges;
2ab457093da8ac Michal Simek 2022-02-14  121  		interrupt-parent = <&gic>;
2ab457093da8ac Michal Simek 2022-02-14  122  		bootph-all;
2ab457093da8ac Michal Simek 2022-02-14  123  
2ab457093da8ac Michal Simek 2022-02-14  124  		gic: interrupt-controller@f9000000 {
2ab457093da8ac Michal Simek 2022-02-14  125  			compatible = "arm,gic-v3";
2ab457093da8ac Michal Simek 2022-02-14  126  			#interrupt-cells = <3>;
2ab457093da8ac Michal Simek 2022-02-14  127  			#address-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14  128  			#size-cells = <2>;
2ab457093da8ac Michal Simek 2022-02-14  129  			ranges;
2ab457093da8ac Michal Simek 2022-02-14  130  			reg = <0 0xf9000000 0 0x80000>, /* GICD */
2ab457093da8ac Michal Simek 2022-02-14  131  			      <0 0xf9080000 0 0x80000>; /* GICR */
2ab457093da8ac Michal Simek 2022-02-14  132  			interrupt-controller;
2ab457093da8ac Michal Simek 2022-02-14  133  			interrupts = <1 9 4>;
2ab457093da8ac Michal Simek 2022-02-14  134  
2ab457093da8ac Michal Simek 2022-02-14  135  			gic_its: gic-its@f9020000 {
2ab457093da8ac Michal Simek 2022-02-14  136  				compatible = "arm,gic-v3-its";
2ab457093da8ac Michal Simek 2022-02-14  137  				status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  138  				msi-controller;
2ab457093da8ac Michal Simek 2022-02-14  139  				msi-cells = <1>;
2ab457093da8ac Michal Simek 2022-02-14  140  				reg = <0 0xf9020000 0 0x20000>;
2ab457093da8ac Michal Simek 2022-02-14  141  			};
2ab457093da8ac Michal Simek 2022-02-14  142  		};
2ab457093da8ac Michal Simek 2022-02-14  143  
2ab457093da8ac Michal Simek 2022-02-14  144  		apm: performance-monitor@f0920000 {
2ab457093da8ac Michal Simek 2022-02-14  145  			compatible = "xlnx,flexnoc-pm-2.7";
2ab457093da8ac Michal Simek 2022-02-14  146  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  147  			reg-names = "funnel", "baselpd", "basefpd";
2ab457093da8ac Michal Simek 2022-02-14  148  			reg = <0x0 0xf0920000 0x0 0x1000>,
2ab457093da8ac Michal Simek 2022-02-14  149  			      <0x0 0xf0980000 0x0 0x9000>,
2ab457093da8ac Michal Simek 2022-02-14  150  			      <0x0 0xf0b80000 0x0 0x9000>;
2ab457093da8ac Michal Simek 2022-02-14  151  		};
2ab457093da8ac Michal Simek 2022-02-14  152  
2ab457093da8ac Michal Simek 2022-02-14  153  		can0: can@ff060000 {
2ab457093da8ac Michal Simek 2022-02-14  154  			compatible = "xlnx,canfd-2.0";
2ab457093da8ac Michal Simek 2022-02-14  155  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  156  			reg = <0 0xff060000 0 0x6000>;
2ab457093da8ac Michal Simek 2022-02-14  157  			interrupts = <0 20 4>;
2ab457093da8ac Michal Simek 2022-02-14  158  			clock-names = "can_clk", "s_axi_aclk";
2ab457093da8ac Michal Simek 2022-02-14  159  			rx-fifo-depth = <0x40>;
2ab457093da8ac Michal Simek 2022-02-14  160  			tx-mailbox-count = <0x20>;
2ab457093da8ac Michal Simek 2022-02-14  161  		};
2ab457093da8ac Michal Simek 2022-02-14  162  
2ab457093da8ac Michal Simek 2022-02-14  163  		can1: can@ff070000 {
2ab457093da8ac Michal Simek 2022-02-14  164  			compatible = "xlnx,canfd-2.0";
2ab457093da8ac Michal Simek 2022-02-14  165  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  166  			reg = <0 0xff070000 0 0x6000>;
2ab457093da8ac Michal Simek 2022-02-14  167  			interrupts = <0 21 4>;
2ab457093da8ac Michal Simek 2022-02-14  168  			clock-names = "can_clk", "s_axi_aclk";
2ab457093da8ac Michal Simek 2022-02-14  169  			rx-fifo-depth = <0x40>;
2ab457093da8ac Michal Simek 2022-02-14  170  			tx-mailbox-count = <0x20>;
2ab457093da8ac Michal Simek 2022-02-14  171  		};
2ab457093da8ac Michal Simek 2022-02-14  172  
2ab457093da8ac Michal Simek 2022-02-14  173  		cci: cci@fd000000 {
2ab457093da8ac Michal Simek 2022-02-14  174  			compatible = "arm,cci-500";
2ab457093da8ac Michal Simek 2022-02-14  175  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  176  			reg = <0 0xfd000000 0 0x10000>;
2ab457093da8ac Michal Simek 2022-02-14  177  			ranges = <0 0 0xfd000000 0xa0000>;
2ab457093da8ac Michal Simek 2022-02-14  178  			#address-cells = <1>;
2ab457093da8ac Michal Simek 2022-02-14  179  			#size-cells = <1>;
2ab457093da8ac Michal Simek 2022-02-14  180  			cci_pmu: pmu@10000 {
2ab457093da8ac Michal Simek 2022-02-14  181  				compatible = "arm,cci-500-pmu,r0";
2ab457093da8ac Michal Simek 2022-02-14  182  				reg = <0x10000 0x90000>;
2ab457093da8ac Michal Simek 2022-02-14  183  				interrupts = <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  184  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  185  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  186  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  187  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  188  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  189  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  190  					     <0 106 4>,
2ab457093da8ac Michal Simek 2022-02-14  191  					     <0 106 4>;
2ab457093da8ac Michal Simek 2022-02-14  192  			};
2ab457093da8ac Michal Simek 2022-02-14  193  		};
2ab457093da8ac Michal Simek 2022-02-14  194  
2ab457093da8ac Michal Simek 2022-02-14  195  		lpd_dma_chan0: dma@ffa80000 {
2ab457093da8ac Michal Simek 2022-02-14  196  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  197  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  198  			reg = <0 0xffa80000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  199  			interrupts = <0 60 4>;
2ab457093da8ac Michal Simek 2022-02-14  200  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  201  			/* iommus = <&smmu 0x210>; */
2ab457093da8ac Michal Simek 2022-02-14  202  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  203  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  204  		};
2ab457093da8ac Michal Simek 2022-02-14  205  
2ab457093da8ac Michal Simek 2022-02-14  206  		lpd_dma_chan1: dma@ffa90000 {
2ab457093da8ac Michal Simek 2022-02-14  207  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  208  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  209  			reg = <0 0xffa90000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  210  			interrupts = <0 61 4>;
2ab457093da8ac Michal Simek 2022-02-14  211  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  212  			/* iommus = <&smmu 0x212>; */
2ab457093da8ac Michal Simek 2022-02-14  213  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  214  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  215  		};
2ab457093da8ac Michal Simek 2022-02-14  216  
2ab457093da8ac Michal Simek 2022-02-14  217  		lpd_dma_chan2: dma@ffaa0000 {
2ab457093da8ac Michal Simek 2022-02-14  218  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  219  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  220  			reg = <0 0xffaa0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  221  			interrupts = <0 62 4>;
2ab457093da8ac Michal Simek 2022-02-14  222  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  223  			/* iommus = <&smmu 0x214>; */
2ab457093da8ac Michal Simek 2022-02-14  224  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  225  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  226  		};
2ab457093da8ac Michal Simek 2022-02-14  227  
2ab457093da8ac Michal Simek 2022-02-14  228  		lpd_dma_chan3: dma@ffab0000 {
2ab457093da8ac Michal Simek 2022-02-14  229  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  230  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  231  			reg = <0 0xffab0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  232  			interrupts = <0 63 4>;
2ab457093da8ac Michal Simek 2022-02-14  233  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  234  			/* iommus = <&smmu 0x216>; */
2ab457093da8ac Michal Simek 2022-02-14  235  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  236  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  237  		};
2ab457093da8ac Michal Simek 2022-02-14  238  
2ab457093da8ac Michal Simek 2022-02-14  239  		lpd_dma_chan4: dma@ffac0000 {
2ab457093da8ac Michal Simek 2022-02-14  240  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  241  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  242  			reg = <0 0xffac0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  243  			interrupts = <0 64 4>;
2ab457093da8ac Michal Simek 2022-02-14  244  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  245  			/* iommus = <&smmu 0x218>; */
2ab457093da8ac Michal Simek 2022-02-14  246  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  247  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  248  		};
2ab457093da8ac Michal Simek 2022-02-14  249  
2ab457093da8ac Michal Simek 2022-02-14  250  		lpd_dma_chan5: dma@ffad0000 {
2ab457093da8ac Michal Simek 2022-02-14  251  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  252  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  253  			reg = <0 0xffad0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  254  			interrupts = <0 65 4>;
2ab457093da8ac Michal Simek 2022-02-14  255  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  256  			/* iommus = <&smmu 0x21a>; */
2ab457093da8ac Michal Simek 2022-02-14  257  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  258  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  259  		};
2ab457093da8ac Michal Simek 2022-02-14  260  
2ab457093da8ac Michal Simek 2022-02-14  261  		lpd_dma_chan6: dma@ffae0000 {
2ab457093da8ac Michal Simek 2022-02-14  262  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  263  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  264  			reg = <0 0xffae0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  265  			interrupts = <0 66 4>;
2ab457093da8ac Michal Simek 2022-02-14  266  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  267  			/* iommus = <&smmu 0x21c>; */
2ab457093da8ac Michal Simek 2022-02-14  268  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  269  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  270  		};
2ab457093da8ac Michal Simek 2022-02-14  271  
2ab457093da8ac Michal Simek 2022-02-14  272  		lpd_dma_chan7: dma@ffaf0000 {
2ab457093da8ac Michal Simek 2022-02-14  273  			compatible = "xlnx,zynqmp-dma-1.0";
2ab457093da8ac Michal Simek 2022-02-14  274  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  275  			reg = <0 0xffaf0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  276  			interrupts = <0 67 4>;
2ab457093da8ac Michal Simek 2022-02-14  277  			clock-names = "clk_main", "clk_apb";
2ab457093da8ac Michal Simek 2022-02-14  278  			/* iommus = <&smmu 0x21e>; */
2ab457093da8ac Michal Simek 2022-02-14  279  			xlnx,bus-width = <64>;
2ab457093da8ac Michal Simek 2022-02-14  280  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  281  		};
2ab457093da8ac Michal Simek 2022-02-14  282  
2ab457093da8ac Michal Simek 2022-02-14  283  		gem0: ethernet@ff0c0000 {
2ab457093da8ac Michal Simek 2022-02-14  284  			compatible = "xlnx,versal-gem", "cdns,gem";
2ab457093da8ac Michal Simek 2022-02-14  285  			status = "disabled";
2ab457093da8ac Michal Simek 2022-02-14  286  			reg = <0 0xff0c0000 0 0x1000>;
2ab457093da8ac Michal Simek 2022-02-14  287  			interrupts = <0 56 4>, <0 56 4>;
2ab457093da8ac Michal Simek 2022-02-14  288  			clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
2ab457093da8ac Michal Simek 2022-02-14  289  			/* iommus = <&smmu 0x234>; */
2ab457093da8ac Michal Simek 2022-02-14  290  			/* dma-coherent; */
2ab457093da8ac Michal Simek 2022-02-14  291  			#address-cells = <1>;
2ab457093da8ac Michal Simek 2022-02-14  292  			#size-cells = <0>;
2ab457093da8ac Michal Simek 2022-02-14  293  		};
2ab457093da8ac Michal Simek 2022-02-14  294  
2ab457093da8ac Michal Simek 2022-02-14 @295  		gem1: ethernet@ff0d0000 {

:::::: The code at line 295 was first introduced by commit
:::::: 2ab457093da8ac4ed0b8cf6bd78a7ed2bba13947 arm64: versal: Add all missing dt files for Xilinx boards

:::::: TO: Michal Simek <michal.simek@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
