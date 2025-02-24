Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FC264A60
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740419440; cv=none; b=BJsEP7la2jARTDL6WkMTCP0GQhVaIMKDJPJTzSEMS75WR5IejnWmJvjtIKuruDeUXaUiMPQ91UhUgVvn9o3Ly6elNp0A2Fbp4F1Iyb52avF8e3AcEfWm5habTqehYUUh4A9RBA+kIowFB5o7GEvkcApE9Xj1SY4fOTMsEQyXp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740419440; c=relaxed/simple;
	bh=nXckgQUXKdlmIOo7fWCidZOmCNPecKCimxTdKpdo9Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AnERNbwNioQo4XiFzirwJ5NS4WxpWYbjKv+AjJd7A5lWK3GMBnLQor+CkTVlNoDlLYIiwEsqA8hSPS1Yu6rMmV4tpvdcRy25XmIL6igMC3gRPJPdPiyS6ErEBOyI4VRv5z68wi8qNHOa4E4e1tcc+hqfYsv08C9Zuam0hFpZYXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nj7XLLPb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nj7XLLPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740419438; x=1771955438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nXckgQUXKdlmIOo7fWCidZOmCNPecKCimxTdKpdo9Ls=;
  b=nj7XLLPbmcir4dIz86+NFzmL9XV88Y12DAUQ4ASSPZgYHkwsDBzzdj29
   dUH3blC2hSJcSaGc46zTWxmOqKMS7qYxRp8fGHYjezIHzrVGpWaNLmBnh
   Nr0Qju6PX2hYTxHVU14nDa5t0YiF4StgxMd9XNAWEE/lzNcn+sANGbLap
   UEdj9CIc323fFNJGYVDGD0Di01hZVvOlVVuKhyzT1NvWYz4ixusYAxc8u
   wSw1EDEwXE//5ljk6TajbyZzz2KKhHJcpefpjs9XpUw2NWVZDDlUTnSjS
   cMv1CuEU1Xq3TYrK0wNDGwgtngE6+hCUI7hGVrLm5GyFpP/i+TgaHtiQX
   Q==;
X-CSE-ConnectionGUID: tcFX48p6S2WRFmZb4qnRyg==
X-CSE-MsgGUID: zEkonFU9SCGGlFN7XIAhLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52615770"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52615770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 09:50:38 -0800
X-CSE-ConnectionGUID: 5DdIAg5AT4ixnPEFWhlODA==
X-CSE-MsgGUID: 7FmJ0FbRT/KWgWnSjmcaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115971123"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2025 09:50:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmcbA-0009AF-1i;
	Mon, 24 Feb 2025 17:50:32 +0000
Date: Tue, 25 Feb 2025 01:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq5018: Add tsens node
Message-ID: <202502250105.58CX3yzF-lkp@intel.com>
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
In-Reply-To: <DS7PR19MB8883F741184F7A82D25CA4719DC02@DS7PR19MB8883.namprd19.prod.outlook.com>
References: <DS7PR19MB8883F741184F7A82D25CA4719DC02@DS7PR19MB8883.namprd19.prod.outlook.com>
TO: George Moussalem <george.moussalem@outlook.com>
TO: linux-arm-msm@vger.kernel.org
TO: linux-pm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: amitk@kernel.org
TO: thara.gopinath@gmail.com
TO: dmitry.baryshkov@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: quic_srichara@quicinc.com
CC: George Moussalem <george.moussalem@outlook.com>

Hi George,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v6.14-rc4]
[cannot apply to next-20250224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Moussalem/dt-bindings-thermal-qcom-tsens-Add-ipq5018-compatible/20250224-141422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/DS7PR19MB8883F741184F7A82D25CA4719DC02%40DS7PR19MB8883.namprd19.prod.outlook.com
patch subject: [PATCH v6 5/5] arm64: dts: qcom: ipq5018: Add tsens node
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250105.58CX3yzF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250105.58CX3yzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502250105.58CX3yzF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5018.dtsi:156.25-159.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a0000/mode@249: duplicate unit-address (also used in node /soc@0/qfprom@a0000/base1@249)
>> arch/arm64/boot/dts/qcom/ipq5018.dtsi:176.27-179.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a0000/s0-p2@24c: duplicate unit-address (also used in node /soc@0/qfprom@a0000/s1-p1@24c)
>> arch/arm64/boot/dts/qcom/ipq5018.dtsi:196.27-199.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a0000/s2-p2@24f: duplicate unit-address (also used in node /soc@0/qfprom@a0000/s3-p1@24f)

vim +156 arch/arm64/boot/dts/qcom/ipq5018.dtsi

570006756a1645 Sricharan Ramabadhran   2023-07-28   12  
570006756a1645 Sricharan Ramabadhran   2023-07-28   13  / {
570006756a1645 Sricharan Ramabadhran   2023-07-28   14  	interrupt-parent = <&intc>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   15  	#address-cells = <2>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   16  	#size-cells = <2>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   17  
570006756a1645 Sricharan Ramabadhran   2023-07-28   18  	clocks {
570006756a1645 Sricharan Ramabadhran   2023-07-28   19  		sleep_clk: sleep-clk {
570006756a1645 Sricharan Ramabadhran   2023-07-28   20  			compatible = "fixed-clock";
570006756a1645 Sricharan Ramabadhran   2023-07-28   21  			#clock-cells = <0>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   22  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28   23  
570006756a1645 Sricharan Ramabadhran   2023-07-28   24  		xo_board_clk: xo-board-clk {
570006756a1645 Sricharan Ramabadhran   2023-07-28   25  			compatible = "fixed-clock";
570006756a1645 Sricharan Ramabadhran   2023-07-28   26  			#clock-cells = <0>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   27  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28   28  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28   29  
570006756a1645 Sricharan Ramabadhran   2023-07-28   30  	cpus {
570006756a1645 Sricharan Ramabadhran   2023-07-28   31  		#address-cells = <1>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   32  		#size-cells = <0>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   33  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22   34  		cpu0: cpu@0 {
570006756a1645 Sricharan Ramabadhran   2023-07-28   35  			device_type = "cpu";
570006756a1645 Sricharan Ramabadhran   2023-07-28   36  			compatible = "arm,cortex-a53";
570006756a1645 Sricharan Ramabadhran   2023-07-28   37  			reg = <0x0>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   38  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22   39  			next-level-cache = <&l2_0>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   40  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   41  			operating-points-v2 = <&cpu_opp_table>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   42  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28   43  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22   44  		cpu1: cpu@1 {
570006756a1645 Sricharan Ramabadhran   2023-07-28   45  			device_type = "cpu";
570006756a1645 Sricharan Ramabadhran   2023-07-28   46  			compatible = "arm,cortex-a53";
570006756a1645 Sricharan Ramabadhran   2023-07-28   47  			reg = <0x1>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   48  			enable-method = "psci";
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22   49  			next-level-cache = <&l2_0>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   50  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   51  			operating-points-v2 = <&cpu_opp_table>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   52  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28   53  
6f8c1ed2580918 Krzysztof Kozlowski     2024-10-22   54  		l2_0: l2-cache {
570006756a1645 Sricharan Ramabadhran   2023-07-28   55  			compatible = "cache";
570006756a1645 Sricharan Ramabadhran   2023-07-28   56  			cache-level = <2>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   57  			cache-size = <0x80000>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   58  			cache-unified;
570006756a1645 Sricharan Ramabadhran   2023-07-28   59  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28   60  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28   61  
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   62  	cpu_opp_table: opp-table-cpu {
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   63  		compatible = "operating-points-v2";
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   64  		opp-shared;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   65  
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   66  		opp-800000000 {
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   67  			opp-hz = /bits/ 64 <800000000>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   68  			opp-microvolt = <1100000>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   69  			clock-latency-ns = <200000>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   70  		};
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   71  
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   72  		opp-1008000000 {
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   73  			opp-hz = /bits/ 64 <1008000000>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   74  			opp-microvolt = <1100000>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   75  			clock-latency-ns = <200000>;
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   76  		};
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   77  	};
3e4b53e04281ed Gokul Sriram Palanisamy 2023-09-25   78  
570006756a1645 Sricharan Ramabadhran   2023-07-28   79  	firmware {
570006756a1645 Sricharan Ramabadhran   2023-07-28   80  		scm {
570006756a1645 Sricharan Ramabadhran   2023-07-28   81  			compatible = "qcom,scm-ipq5018", "qcom,scm";
79796e87215db9 Robert Marko            2023-08-16   82  			qcom,sdi-enabled;
570006756a1645 Sricharan Ramabadhran   2023-07-28   83  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28   84  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28   85  
570006756a1645 Sricharan Ramabadhran   2023-07-28   86  	memory@40000000 {
570006756a1645 Sricharan Ramabadhran   2023-07-28   87  		device_type = "memory";
570006756a1645 Sricharan Ramabadhran   2023-07-28   88  		/* We expect the bootloader to fill in the size */
570006756a1645 Sricharan Ramabadhran   2023-07-28   89  		reg = <0x0 0x40000000 0x0 0x0>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   90  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28   91  
570006756a1645 Sricharan Ramabadhran   2023-07-28   92  	pmu {
570006756a1645 Sricharan Ramabadhran   2023-07-28   93  		compatible = "arm,cortex-a53-pmu";
570006756a1645 Sricharan Ramabadhran   2023-07-28   94  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
570006756a1645 Sricharan Ramabadhran   2023-07-28   95  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28   96  
570006756a1645 Sricharan Ramabadhran   2023-07-28   97  	psci {
570006756a1645 Sricharan Ramabadhran   2023-07-28   98  		compatible = "arm,psci-1.0";
570006756a1645 Sricharan Ramabadhran   2023-07-28   99  		method = "smc";
570006756a1645 Sricharan Ramabadhran   2023-07-28  100  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28  101  
570006756a1645 Sricharan Ramabadhran   2023-07-28  102  	reserved-memory {
570006756a1645 Sricharan Ramabadhran   2023-07-28  103  		#address-cells = <2>;
570006756a1645 Sricharan Ramabadhran   2023-07-28  104  		#size-cells = <2>;
570006756a1645 Sricharan Ramabadhran   2023-07-28  105  		ranges;
570006756a1645 Sricharan Ramabadhran   2023-07-28  106  
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  107  		bootloader@4a800000 {
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  108  			reg = <0x0 0x4a800000 0x0 0x200000>;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  109  			no-map;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  110  		};
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  111  
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  112  		sbl@4aa00000 {
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  113  			reg = <0x0 0x4aa00000 0x0 0x100000>;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  114  			no-map;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  115  		};
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  116  
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  117  		smem@4ab00000 {
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  118  			compatible = "qcom,smem";
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  119  			reg = <0x0 0x4ab00000 0x0 0x100000>;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  120  			no-map;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  121  
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  122  			hwlocks = <&tcsr_mutex 3>;
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  123  		};
a427dd16e61f3d Kathiravan Thirumoorthy 2023-10-25  124  
570006756a1645 Sricharan Ramabadhran   2023-07-28  125  		tz_region: tz@4ac00000 {
570006756a1645 Sricharan Ramabadhran   2023-07-28  126  			reg = <0x0 0x4ac00000 0x0 0x200000>;
570006756a1645 Sricharan Ramabadhran   2023-07-28  127  			no-map;
570006756a1645 Sricharan Ramabadhran   2023-07-28  128  		};
570006756a1645 Sricharan Ramabadhran   2023-07-28  129  	};
570006756a1645 Sricharan Ramabadhran   2023-07-28  130  
570006756a1645 Sricharan Ramabadhran   2023-07-28  131  	soc: soc@0 {
570006756a1645 Sricharan Ramabadhran   2023-07-28  132  		compatible = "simple-bus";
570006756a1645 Sricharan Ramabadhran   2023-07-28  133  		#address-cells = <1>;
570006756a1645 Sricharan Ramabadhran   2023-07-28  134  		#size-cells = <1>;
570006756a1645 Sricharan Ramabadhran   2023-07-28  135  		ranges = <0 0 0 0xffffffff>;
570006756a1645 Sricharan Ramabadhran   2023-07-28  136  
e7166f2774aafe Nitheesh Sekar          2023-09-04  137  		usbphy0: phy@5b000 {
e7166f2774aafe Nitheesh Sekar          2023-09-04  138  			compatible = "qcom,ipq5018-usb-hsphy";
e7166f2774aafe Nitheesh Sekar          2023-09-04  139  			reg = <0x0005b000 0x120>;
e7166f2774aafe Nitheesh Sekar          2023-09-04  140  
e7166f2774aafe Nitheesh Sekar          2023-09-04  141  			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
e7166f2774aafe Nitheesh Sekar          2023-09-04  142  
e7166f2774aafe Nitheesh Sekar          2023-09-04  143  			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
e7166f2774aafe Nitheesh Sekar          2023-09-04  144  
e7166f2774aafe Nitheesh Sekar          2023-09-04  145  			#phy-cells = <0>;
e7166f2774aafe Nitheesh Sekar          2023-09-04  146  
e7166f2774aafe Nitheesh Sekar          2023-09-04  147  			status = "disabled";
e7166f2774aafe Nitheesh Sekar          2023-09-04  148  		};
e7166f2774aafe Nitheesh Sekar          2023-09-04  149  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  150  		qfprom: qfprom@a0000 {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  151  			compatible = "qcom,ipq5018-qfprom", "qcom,qfprom";
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  152  			reg = <0x000a0000 0x1000>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  153  			#address-cells = <1>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  154  			#size-cells = <1>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  155  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24 @156  			tsens_mode: mode@249 {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  157  				reg = <0x249 0x1>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  158  				bits = <0 3>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  159  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  160  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  161  			tsens_base1: base1@249 {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  162  				reg = <0x249 0x2>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  163  				bits = <3 8>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  164  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  165  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  166  			tsens_base2: base2@24a {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  167  				reg = <0x24a 0x2>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  168  				bits = <3 8>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  169  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  170  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  171  			tsens_s0_p1: s0-p1@24b {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  172  				reg = <0x24b 0x2>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  173  				bits = <2 6>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  174  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  175  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24 @176  			tsens_s0_p2: s0-p2@24c {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  177  				reg = <0x24c 0x1>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  178  				bits = <1 6>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  179  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  180  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  181  			tsens_s1_p1: s1-p1@24c {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  182  				reg = <0x24c 0x2>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  183  				bits = <7 6>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  184  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  185  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  186  			tsens_s1_p2: s1-p2@24d {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  187  				reg = <0x24d 0x2>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  188  				bits = <5 6>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  189  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  190  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  191  			tsens_s2_p1: s2-p1@24e {
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  192  				reg = <0x24e 0x2>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  193  				bits = <3 6>;
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  194  			};
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24  195  
d4670e2c28c07e Sricharan Ramabadhran   2025-02-24 @196  			tsens_s2_p2: s2-p2@24f {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
