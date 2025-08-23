Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3C1DF25C
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755940065; cv=none; b=CdEntvoK6WJ52MHcXtNrhUVeYq3xjux2JkvBOAwZj4BxpccP5HT3JIA0O5qVa8ZhTcwp693n+5xJty0j8y5dhTuu+BqATRo8JjbpVm8fS0Hsb9MVBAJcRQ9zY4WZhbVxIATj4d73dPE38lOUuTN/W/CSl5/Oz9BEbFZBjMhwLAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755940065; c=relaxed/simple;
	bh=T/lM/Y1YPPYFHPKQT/CPjbhCCeiTvHY62zwNS7CtPJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFSLDnE6lq0zhezF94tgGYH49ZZpPNBWtLshWxutTg63T541AeD+7Vu+cGdQESaeGtKaxq2g2Uu+hW+mRN5ixe7QjoIAItdBwfisMQ+lwg5XRVbk3lbqovJmja/odvHimZ4c5ZsnK+PvWjbEFDsJKzDonJijo1YC5Ix8vE6Iiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+WJNjE/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+WJNjE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755940062; x=1787476062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/lM/Y1YPPYFHPKQT/CPjbhCCeiTvHY62zwNS7CtPJA=;
  b=U+WJNjE/xwFKAhm1ksW70MQr5QsaSaNF2jtzyA3+ko8+qmRYXZHiXTMN
   CY4qQDmQ+uhmck3R0fLk/hC/IGgJB5i35hXaUuqEAk0mLHs50gKTUF014
   Q4WUlkC6KUCMGGsVRSlujHFD1KlOCRSjfAJuWtFTNh+lykYD/IYAff/7d
   UDg8AJg/gyDsrF20r7C6LY0JGjUVPXZ7dhC0S1OERtoRGtOX9DgG+YuJR
   EtaGxFRczPQRAqp4LvYLXGkKoCuiO5A+HzVV1z1EImM37m7wMWkoj1DFn
   LDVtu74YTa8MIPPLbhbx/hBekQ+spj+F1wKY/BoUgKn5nqqiudDNb6v5M
   A==;
X-CSE-ConnectionGUID: DXZWtU0ATPCPjeet9SscJw==
X-CSE-MsgGUID: yQnZ5CWER/qMkuLLzvRf0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80831690"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="80831690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 02:07:41 -0700
X-CSE-ConnectionGUID: d3Jkr/uSTrueppOaPXjiIA==
X-CSE-MsgGUID: 8KhgC7qLRqyNxYUgN694Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173298997"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Aug 2025 02:07:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upkDp-000MDq-2D;
	Sat, 23 Aug 2025 09:07:37 +0000
Date: Sat, 23 Aug 2025 17:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 38/45]
 arch/arm64/boot/dts/freescale/imx95.dtsi:513.19-536.5: Warning
 (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
Message-ID: <202508231713.aLfa7II5-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Peng Fan <peng.fan@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   5a796a700ff8a26b8c17bfa5b789dd24ce19c3b6
commit: 530141de4d6598f88924c5b2c4d9ee7b7c72db77 [38/45] arm64: dts: imx95: Add coresight nodes
:::::: branch date: 23 hours ago
:::::: commit date: 24 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250823/202508231713.aLfa7II5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231713.aLfa7II5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508231713.aLfa7II5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95.dtsi:513.19-536.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95.dtsi:538.23-557.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/freescale/imx95.dtsi:513.19-536.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95.dtsi:538.23-557.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:54.18-57.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
--
>> arch/arm64/boot/dts/freescale/imx95.dtsi:513.19-536.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95.dtsi:538.23-557.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi:276.9-288.5: Warning (graph_child_address): /soc/bus@42000000/i2c@42530000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +513 arch/arm64/boot/dts/freescale/imx95.dtsi

5e3cbb8e4256e3 Peng Fan        2024-06-17   16  
5e3cbb8e4256e3 Peng Fan        2024-06-17   17  / {
5e3cbb8e4256e3 Peng Fan        2024-06-17   18  	interrupt-parent = <&gic>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   19  	#address-cells = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   20  	#size-cells = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   21  
5e3cbb8e4256e3 Peng Fan        2024-06-17   22  	cpus {
5e3cbb8e4256e3 Peng Fan        2024-06-17   23  		#address-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   24  		#size-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   25  
fe2dfe068b45e6 Peng Fan        2024-10-12   26  		idle-states {
fe2dfe068b45e6 Peng Fan        2024-10-12   27  			entry-method = "psci";
fe2dfe068b45e6 Peng Fan        2024-10-12   28  
fe2dfe068b45e6 Peng Fan        2024-10-12   29  			cpu_pd_wait: cpu-pd-wait {
fe2dfe068b45e6 Peng Fan        2024-10-12   30  				compatible = "arm,idle-state";
fe2dfe068b45e6 Peng Fan        2024-10-12   31  				arm,psci-suspend-param = <0x0010033>;
fe2dfe068b45e6 Peng Fan        2024-10-12   32  				local-timer-stop;
fe2dfe068b45e6 Peng Fan        2024-10-12   33  				entry-latency-us = <10000>;
fe2dfe068b45e6 Peng Fan        2024-10-12   34  				exit-latency-us = <7000>;
fe2dfe068b45e6 Peng Fan        2024-10-12   35  				min-residency-us = <27000>;
fe2dfe068b45e6 Peng Fan        2024-10-12   36  				wakeup-latency-us = <15000>;
fe2dfe068b45e6 Peng Fan        2024-10-12   37  			};
fe2dfe068b45e6 Peng Fan        2024-10-12   38  		};
fe2dfe068b45e6 Peng Fan        2024-10-12   39  
5e3cbb8e4256e3 Peng Fan        2024-06-17   40  		A55_0: cpu@0 {
5e3cbb8e4256e3 Peng Fan        2024-06-17   41  			device_type = "cpu";
5e3cbb8e4256e3 Peng Fan        2024-06-17   42  			compatible = "arm,cortex-a55";
5e3cbb8e4256e3 Peng Fan        2024-06-17   43  			reg = <0x0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   44  			enable-method = "psci";
5e3cbb8e4256e3 Peng Fan        2024-06-17   45  			#cooling-cells = <2>;
fe2dfe068b45e6 Peng Fan        2024-10-12   46  			cpu-idle-states = <&cpu_pd_wait>;
915d9d914a2557 Peng Fan        2024-07-29   47  			power-domains = <&scmi_perf IMX95_PERF_A55>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   48  			power-domain-names = "perf";
5e3cbb8e4256e3 Peng Fan        2024-06-17   49  			i-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   50  			i-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   51  			i-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   52  			d-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   53  			d-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   54  			d-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   55  			next-level-cache = <&l2_cache_l0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   56  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17   57  
5e3cbb8e4256e3 Peng Fan        2024-06-17   58  		A55_1: cpu@100 {
5e3cbb8e4256e3 Peng Fan        2024-06-17   59  			device_type = "cpu";
5e3cbb8e4256e3 Peng Fan        2024-06-17   60  			compatible = "arm,cortex-a55";
5e3cbb8e4256e3 Peng Fan        2024-06-17   61  			reg = <0x100>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   62  			enable-method = "psci";
5e3cbb8e4256e3 Peng Fan        2024-06-17   63  			#cooling-cells = <2>;
fe2dfe068b45e6 Peng Fan        2024-10-12   64  			cpu-idle-states = <&cpu_pd_wait>;
915d9d914a2557 Peng Fan        2024-07-29   65  			power-domains = <&scmi_perf IMX95_PERF_A55>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   66  			power-domain-names = "perf";
5e3cbb8e4256e3 Peng Fan        2024-06-17   67  			i-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   68  			i-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   69  			i-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   70  			d-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   71  			d-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   72  			d-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   73  			next-level-cache = <&l2_cache_l1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   74  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17   75  
5e3cbb8e4256e3 Peng Fan        2024-06-17   76  		A55_2: cpu@200 {
5e3cbb8e4256e3 Peng Fan        2024-06-17   77  			device_type = "cpu";
5e3cbb8e4256e3 Peng Fan        2024-06-17   78  			compatible = "arm,cortex-a55";
5e3cbb8e4256e3 Peng Fan        2024-06-17   79  			reg = <0x200>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   80  			enable-method = "psci";
5e3cbb8e4256e3 Peng Fan        2024-06-17   81  			#cooling-cells = <2>;
fe2dfe068b45e6 Peng Fan        2024-10-12   82  			cpu-idle-states = <&cpu_pd_wait>;
915d9d914a2557 Peng Fan        2024-07-29   83  			power-domains = <&scmi_perf IMX95_PERF_A55>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   84  			power-domain-names = "perf";
5e3cbb8e4256e3 Peng Fan        2024-06-17   85  			i-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   86  			i-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   87  			i-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   88  			d-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   89  			d-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   90  			d-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   91  			next-level-cache = <&l2_cache_l2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   92  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17   93  
5e3cbb8e4256e3 Peng Fan        2024-06-17   94  		A55_3: cpu@300 {
5e3cbb8e4256e3 Peng Fan        2024-06-17   95  			device_type = "cpu";
5e3cbb8e4256e3 Peng Fan        2024-06-17   96  			compatible = "arm,cortex-a55";
5e3cbb8e4256e3 Peng Fan        2024-06-17   97  			reg = <0x300>;
5e3cbb8e4256e3 Peng Fan        2024-06-17   98  			enable-method = "psci";
5e3cbb8e4256e3 Peng Fan        2024-06-17   99  			#cooling-cells = <2>;
fe2dfe068b45e6 Peng Fan        2024-10-12  100  			cpu-idle-states = <&cpu_pd_wait>;
915d9d914a2557 Peng Fan        2024-07-29  101  			power-domains = <&scmi_perf IMX95_PERF_A55>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  102  			power-domain-names = "perf";
5e3cbb8e4256e3 Peng Fan        2024-06-17  103  			i-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  104  			i-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  105  			i-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  106  			d-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  107  			d-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  108  			d-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  109  			next-level-cache = <&l2_cache_l3>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  110  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  111  
5e3cbb8e4256e3 Peng Fan        2024-06-17  112  		A55_4: cpu@400 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  113  			device_type = "cpu";
5e3cbb8e4256e3 Peng Fan        2024-06-17  114  			compatible = "arm,cortex-a55";
5e3cbb8e4256e3 Peng Fan        2024-06-17  115  			reg = <0x400>;
915d9d914a2557 Peng Fan        2024-07-29  116  			power-domains = <&scmi_perf IMX95_PERF_A55>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  117  			power-domain-names = "perf";
5e3cbb8e4256e3 Peng Fan        2024-06-17  118  			enable-method = "psci";
5e3cbb8e4256e3 Peng Fan        2024-06-17  119  			#cooling-cells = <2>;
fe2dfe068b45e6 Peng Fan        2024-10-12  120  			cpu-idle-states = <&cpu_pd_wait>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  121  			i-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  122  			i-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  123  			i-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  124  			d-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  125  			d-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  126  			d-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  127  			next-level-cache = <&l2_cache_l4>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  128  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  129  
5e3cbb8e4256e3 Peng Fan        2024-06-17  130  		A55_5: cpu@500 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  131  			device_type = "cpu";
5e3cbb8e4256e3 Peng Fan        2024-06-17  132  			compatible = "arm,cortex-a55";
5e3cbb8e4256e3 Peng Fan        2024-06-17  133  			reg = <0x500>;
915d9d914a2557 Peng Fan        2024-07-29  134  			power-domains = <&scmi_perf IMX95_PERF_A55>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  135  			power-domain-names = "perf";
5e3cbb8e4256e3 Peng Fan        2024-06-17  136  			enable-method = "psci";
5e3cbb8e4256e3 Peng Fan        2024-06-17  137  			#cooling-cells = <2>;
fe2dfe068b45e6 Peng Fan        2024-10-12  138  			cpu-idle-states = <&cpu_pd_wait>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  139  			i-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  140  			i-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  141  			i-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  142  			d-cache-size = <32768>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  143  			d-cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  144  			d-cache-sets = <128>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  145  			next-level-cache = <&l2_cache_l5>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  146  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  147  
5e3cbb8e4256e3 Peng Fan        2024-06-17  148  		l2_cache_l0: l2-cache-l0 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  149  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  150  			cache-size = <65536>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  151  			cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  152  			cache-sets = <256>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  153  			cache-level = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  154  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  155  			next-level-cache = <&l3_cache>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  156  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  157  
5e3cbb8e4256e3 Peng Fan        2024-06-17  158  		l2_cache_l1: l2-cache-l1 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  159  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  160  			cache-size = <65536>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  161  			cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  162  			cache-sets = <256>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  163  			cache-level = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  164  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  165  			next-level-cache = <&l3_cache>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  166  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  167  
5e3cbb8e4256e3 Peng Fan        2024-06-17  168  		l2_cache_l2: l2-cache-l2 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  169  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  170  			cache-size = <65536>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  171  			cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  172  			cache-sets = <256>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  173  			cache-level = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  174  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  175  			next-level-cache = <&l3_cache>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  176  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  177  
5e3cbb8e4256e3 Peng Fan        2024-06-17  178  		l2_cache_l3: l2-cache-l3 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  179  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  180  			cache-size = <65536>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  181  			cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  182  			cache-sets = <256>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  183  			cache-level = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  184  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  185  			next-level-cache = <&l3_cache>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  186  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  187  
5e3cbb8e4256e3 Peng Fan        2024-06-17  188  		l2_cache_l4: l2-cache-l4 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  189  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  190  			cache-size = <65536>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  191  			cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  192  			cache-sets = <256>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  193  			cache-level = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  194  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  195  			next-level-cache = <&l3_cache>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  196  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  197  
5e3cbb8e4256e3 Peng Fan        2024-06-17  198  		l2_cache_l5: l2-cache-l5 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  199  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  200  			cache-size = <65536>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  201  			cache-line-size = <64>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  202  			cache-sets = <256>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  203  			cache-level = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  204  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  205  			next-level-cache = <&l3_cache>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  206  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  207  
5e3cbb8e4256e3 Peng Fan        2024-06-17  208  		l3_cache: l3-cache {
5e3cbb8e4256e3 Peng Fan        2024-06-17  209  			compatible = "cache";
5e3cbb8e4256e3 Peng Fan        2024-06-17  210  			cache-size = <524288>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  211  			cache-line-size = <64>;
d3c2b2a8923abc Peng Fan        2024-08-05  212  			cache-sets = <512>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  213  			cache-level = <3>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  214  			cache-unified;
5e3cbb8e4256e3 Peng Fan        2024-06-17  215  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  216  
5e3cbb8e4256e3 Peng Fan        2024-06-17  217  		cpu-map {
5e3cbb8e4256e3 Peng Fan        2024-06-17  218  			cluster0 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  219  				core0 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  220  					cpu = <&A55_0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  221  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  222  
5e3cbb8e4256e3 Peng Fan        2024-06-17  223  				core1 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  224  					cpu = <&A55_1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  225  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  226  
5e3cbb8e4256e3 Peng Fan        2024-06-17  227  				core2 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  228  					cpu = <&A55_2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  229  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  230  
5e3cbb8e4256e3 Peng Fan        2024-06-17  231  				core3 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  232  					cpu = <&A55_3>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  233  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  234  
5e3cbb8e4256e3 Peng Fan        2024-06-17  235  				core4 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  236  					cpu = <&A55_4>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  237  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  238  
5e3cbb8e4256e3 Peng Fan        2024-06-17  239  				core5 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  240  					cpu = <&A55_5>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  241  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  242  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  243  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  244  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  245  
70fd1f6641e26e Frank Li        2024-07-01  246  	dummy: clock-dummy {
70fd1f6641e26e Frank Li        2024-07-01  247  		compatible = "fixed-clock";
70fd1f6641e26e Frank Li        2024-07-01  248  		#clock-cells = <0>;
70fd1f6641e26e Frank Li        2024-07-01  249  		clock-frequency = <0>;
70fd1f6641e26e Frank Li        2024-07-01  250  		clock-output-names = "dummy";
70fd1f6641e26e Frank Li        2024-07-01  251  	};
70fd1f6641e26e Frank Li        2024-07-01  252  
5e3cbb8e4256e3 Peng Fan        2024-06-17  253  	clk_ext1: clock-ext1 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  254  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  255  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  256  		clock-frequency = <133000000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  257  		clock-output-names = "clk_ext1";
5e3cbb8e4256e3 Peng Fan        2024-06-17  258  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  259  
5e3cbb8e4256e3 Peng Fan        2024-06-17  260  	sai1_mclk: clock-sai-mclk1 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  261  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  262  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  263  		clock-frequency= <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  264  		clock-output-names = "sai1_mclk";
5e3cbb8e4256e3 Peng Fan        2024-06-17  265  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  266  
5e3cbb8e4256e3 Peng Fan        2024-06-17  267  	sai2_mclk: clock-sai-mclk2 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  268  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  269  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  270  		clock-frequency= <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  271  		clock-output-names = "sai2_mclk";
5e3cbb8e4256e3 Peng Fan        2024-06-17  272  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  273  
5e3cbb8e4256e3 Peng Fan        2024-06-17  274  	sai3_mclk: clock-sai-mclk3 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  275  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  276  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  277  		clock-frequency= <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  278  		clock-output-names = "sai3_mclk";
5e3cbb8e4256e3 Peng Fan        2024-06-17  279  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  280  
5e3cbb8e4256e3 Peng Fan        2024-06-17  281  	sai4_mclk: clock-sai-mclk4 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  282  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  283  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  284  		clock-frequency= <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  285  		clock-output-names = "sai4_mclk";
5e3cbb8e4256e3 Peng Fan        2024-06-17  286  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  287  
5e3cbb8e4256e3 Peng Fan        2024-06-17  288  	sai5_mclk: clock-sai-mclk5 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  289  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  290  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  291  		clock-frequency= <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  292  		clock-output-names = "sai5_mclk";
5e3cbb8e4256e3 Peng Fan        2024-06-17  293  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  294  
3c8d7b5d2bed44 Frank Li        2025-02-25  295  	clk_sys100m: clock-sys100m {
3c8d7b5d2bed44 Frank Li        2025-02-25  296  		compatible = "fixed-clock";
3c8d7b5d2bed44 Frank Li        2025-02-25  297  		#clock-cells = <0>;
3c8d7b5d2bed44 Frank Li        2025-02-25  298  		clock-frequency = <100000000>;
3c8d7b5d2bed44 Frank Li        2025-02-25  299  		clock-output-names = "clk_sys100m";
3c8d7b5d2bed44 Frank Li        2025-02-25  300  	};
3c8d7b5d2bed44 Frank Li        2025-02-25  301  
5e3cbb8e4256e3 Peng Fan        2024-06-17  302  	osc_24m: clock-24m {
5e3cbb8e4256e3 Peng Fan        2024-06-17  303  		compatible = "fixed-clock";
5e3cbb8e4256e3 Peng Fan        2024-06-17  304  		#clock-cells = <0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  305  		clock-frequency = <24000000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  306  		clock-output-names = "osc_24m";
5e3cbb8e4256e3 Peng Fan        2024-06-17  307  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  308  
5e3cbb8e4256e3 Peng Fan        2024-06-17  309  	sram1: sram@204c0000 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  310  		compatible = "mmio-sram";
5e3cbb8e4256e3 Peng Fan        2024-06-17  311  		reg = <0x0 0x204c0000 0x0 0x18000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  312  		ranges = <0x0 0x0 0x204c0000 0x18000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  313  		#address-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  314  		#size-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  315  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  316  
5e3cbb8e4256e3 Peng Fan        2024-06-17  317  	firmware {
5e3cbb8e4256e3 Peng Fan        2024-06-17  318  		scmi {
5e3cbb8e4256e3 Peng Fan        2024-06-17  319  			compatible = "arm,scmi";
b06402b31d9f93 Peng Fan        2024-06-28  320  			mboxes = <&mu2 5 0>, <&mu2 3 0>, <&mu2 3 1>, <&mu2 5 1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  321  			shmem = <&scmi_buf0>, <&scmi_buf1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  322  			#address-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  323  			#size-cells = <0>;
8d721ebef7bb3e Alexander Stein 2024-10-30  324  			arm,max-rx-timeout-ms = <5000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  325  
5e3cbb8e4256e3 Peng Fan        2024-06-17  326  			scmi_devpd: protocol@11 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  327  				reg = <0x11>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  328  				#power-domain-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  329  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  330  
f7d4801432e0ee Peng Fan        2024-10-12  331  			scmi_sys_power: protocol@12 {
f7d4801432e0ee Peng Fan        2024-10-12  332  				reg = <0x12>;
f7d4801432e0ee Peng Fan        2024-10-12  333  			};
f7d4801432e0ee Peng Fan        2024-10-12  334  
5e3cbb8e4256e3 Peng Fan        2024-06-17  335  			scmi_perf: protocol@13 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  336  				reg = <0x13>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  337  				#power-domain-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  338  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  339  
5e3cbb8e4256e3 Peng Fan        2024-06-17  340  			scmi_clk: protocol@14 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  341  				reg = <0x14>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  342  				#clock-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  343  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  344  
5e3cbb8e4256e3 Peng Fan        2024-06-17  345  			scmi_sensor: protocol@15 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  346  				reg = <0x15>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  347  				#thermal-sensor-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  348  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  349  
5e3cbb8e4256e3 Peng Fan        2024-06-17  350  			scmi_iomuxc: protocol@19 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  351  				reg = <0x19>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  352  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  353  
770fcc6856e986 Peng Fan        2025-08-18  354  			scmi_lmm: protocol@80 {
770fcc6856e986 Peng Fan        2025-08-18  355  				reg = <0x80>;
770fcc6856e986 Peng Fan        2025-08-18  356  			};
770fcc6856e986 Peng Fan        2025-08-18  357  
f7d4801432e0ee Peng Fan        2024-10-12  358  			scmi_bbm: protocol@81 {
f7d4801432e0ee Peng Fan        2024-10-12  359  				reg = <0x81>;
f7d4801432e0ee Peng Fan        2024-10-12  360  			};
f7d4801432e0ee Peng Fan        2024-10-12  361  
770fcc6856e986 Peng Fan        2025-08-18  362  			scmi_cpu: protocol@82 {
770fcc6856e986 Peng Fan        2025-08-18  363  				reg = <0x82>;
770fcc6856e986 Peng Fan        2025-08-18  364  			};
770fcc6856e986 Peng Fan        2025-08-18  365  
f7d4801432e0ee Peng Fan        2024-10-12  366  			scmi_misc: protocol@84 {
f7d4801432e0ee Peng Fan        2024-10-12  367  				reg = <0x84>;
f7d4801432e0ee Peng Fan        2024-10-12  368  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  369  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  370  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  371  
5e3cbb8e4256e3 Peng Fan        2024-06-17  372  	pmu {
5e3cbb8e4256e3 Peng Fan        2024-06-17  373  		compatible = "arm,cortex-a55-pmu";
5e3cbb8e4256e3 Peng Fan        2024-06-17  374  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  375  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  376  
3d282d5cc8a8d8 Frank Li        2024-07-01  377  	thermal_zones: thermal-zones {
5e3cbb8e4256e3 Peng Fan        2024-06-17  378  		a55-thermal {
5e3cbb8e4256e3 Peng Fan        2024-06-17  379  			polling-delay-passive = <250>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  380  			polling-delay = <2000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  381  			thermal-sensors = <&scmi_sensor 1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  382  
5e3cbb8e4256e3 Peng Fan        2024-06-17  383  			trips {
5e3cbb8e4256e3 Peng Fan        2024-06-17  384  				cpu_alert0: trip0 {
8f0618f159d0d1 Peng Fan        2024-10-12  385  					temperature = <105000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  386  					hysteresis = <2000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  387  					type = "passive";
5e3cbb8e4256e3 Peng Fan        2024-06-17  388  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  389  
5e3cbb8e4256e3 Peng Fan        2024-06-17  390  				cpu_crit0: trip1 {
8f0618f159d0d1 Peng Fan        2024-10-12  391  					temperature = <125000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  392  					hysteresis = <2000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  393  					type = "critical";
5e3cbb8e4256e3 Peng Fan        2024-06-17  394  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  395  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  396  
5e3cbb8e4256e3 Peng Fan        2024-06-17  397  			cooling-maps {
5e3cbb8e4256e3 Peng Fan        2024-06-17  398  				map0 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  399  					trip = <&cpu_alert0>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  400  					cooling-device =
5e3cbb8e4256e3 Peng Fan        2024-06-17  401  						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  402  						<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  403  						<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  404  						<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  405  						<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  406  						<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  407  				};
5e3cbb8e4256e3 Peng Fan        2024-06-17  408  			};
5e3cbb8e4256e3 Peng Fan        2024-06-17  409  		};
539edd24665aa0 Peng Fan        2024-10-12  410  
539edd24665aa0 Peng Fan        2024-10-12  411  		ana-thermal {
539edd24665aa0 Peng Fan        2024-10-12  412  			polling-delay-passive = <250>;
539edd24665aa0 Peng Fan        2024-10-12  413  			polling-delay = <2000>;
539edd24665aa0 Peng Fan        2024-10-12  414  			thermal-sensors = <&scmi_sensor 0>;
539edd24665aa0 Peng Fan        2024-10-12  415  			trips {
539edd24665aa0 Peng Fan        2024-10-12  416  				ana_alert: trip0 {
539edd24665aa0 Peng Fan        2024-10-12  417  					temperature = <105000>;
539edd24665aa0 Peng Fan        2024-10-12  418  					hysteresis = <2000>;
539edd24665aa0 Peng Fan        2024-10-12  419  					type = "passive";
539edd24665aa0 Peng Fan        2024-10-12  420  				};
539edd24665aa0 Peng Fan        2024-10-12  421  
539edd24665aa0 Peng Fan        2024-10-12  422  				ana_crit0: trip1 {
539edd24665aa0 Peng Fan        2024-10-12  423  					temperature = <125000>;
539edd24665aa0 Peng Fan        2024-10-12  424  					hysteresis = <2000>;
539edd24665aa0 Peng Fan        2024-10-12  425  					type = "critical";
539edd24665aa0 Peng Fan        2024-10-12  426  				};
539edd24665aa0 Peng Fan        2024-10-12  427  			};
539edd24665aa0 Peng Fan        2024-10-12  428  
539edd24665aa0 Peng Fan        2024-10-12  429  			cooling-maps {
539edd24665aa0 Peng Fan        2024-10-12  430  				map0 {
539edd24665aa0 Peng Fan        2024-10-12  431  					trip = <&ana_alert>;
539edd24665aa0 Peng Fan        2024-10-12  432  					cooling-device =
539edd24665aa0 Peng Fan        2024-10-12  433  						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
539edd24665aa0 Peng Fan        2024-10-12  434  						<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
539edd24665aa0 Peng Fan        2024-10-12  435  						<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
539edd24665aa0 Peng Fan        2024-10-12  436  						<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
539edd24665aa0 Peng Fan        2024-10-12  437  						<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
539edd24665aa0 Peng Fan        2024-10-12  438  						<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
539edd24665aa0 Peng Fan        2024-10-12  439  				};
539edd24665aa0 Peng Fan        2024-10-12  440  			};
539edd24665aa0 Peng Fan        2024-10-12  441  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  442  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  443  
5e3cbb8e4256e3 Peng Fan        2024-06-17  444  	psci {
5e3cbb8e4256e3 Peng Fan        2024-06-17  445  		compatible = "arm,psci-1.0";
5e3cbb8e4256e3 Peng Fan        2024-06-17  446  		method = "smc";
5e3cbb8e4256e3 Peng Fan        2024-06-17  447  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  448  
5e3cbb8e4256e3 Peng Fan        2024-06-17  449  	timer {
5e3cbb8e4256e3 Peng Fan        2024-06-17  450  		compatible = "arm,armv8-timer";
5e3cbb8e4256e3 Peng Fan        2024-06-17  451  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  452  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  453  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  454  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  455  		clock-frequency = <24000000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  456  		arm,no-tick-in-suspend;
5e3cbb8e4256e3 Peng Fan        2024-06-17  457  		interrupt-parent = <&gic>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  458  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  459  
5e3cbb8e4256e3 Peng Fan        2024-06-17  460  	gic: interrupt-controller@48000000 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  461  		compatible = "arm,gic-v3";
5e3cbb8e4256e3 Peng Fan        2024-06-17  462  		reg = <0 0x48000000 0 0x10000>,
5e3cbb8e4256e3 Peng Fan        2024-06-17  463  		      <0 0x48060000 0 0xc0000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  464  		#address-cells = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  465  		#size-cells = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  466  		#interrupt-cells = <3>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  467  		interrupt-controller;
5e3cbb8e4256e3 Peng Fan        2024-06-17  468  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  469  		interrupt-parent = <&gic>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  470  		dma-noncoherent;
5e3cbb8e4256e3 Peng Fan        2024-06-17  471  		ranges;
5e3cbb8e4256e3 Peng Fan        2024-06-17  472  
5e3cbb8e4256e3 Peng Fan        2024-06-17  473  		its: msi-controller@48040000 {
5e3cbb8e4256e3 Peng Fan        2024-06-17  474  			compatible = "arm,gic-v3-its";
5e3cbb8e4256e3 Peng Fan        2024-06-17  475  			reg = <0 0x48040000 0 0x20000>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  476  			msi-controller;
5e3cbb8e4256e3 Peng Fan        2024-06-17  477  			#msi-cells = <1>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  478  			dma-noncoherent;
5e3cbb8e4256e3 Peng Fan        2024-06-17  479  		};
5e3cbb8e4256e3 Peng Fan        2024-06-17  480  	};
5e3cbb8e4256e3 Peng Fan        2024-06-17  481  
b6bf37e40cbec2 Xu Yang         2025-04-10  482  	usbphynop: usbphynop {
b6bf37e40cbec2 Xu Yang         2025-04-10  483  		compatible = "usb-nop-xceiv";
b6bf37e40cbec2 Xu Yang         2025-04-10  484  		clocks = <&scmi_clk IMX95_CLK_HSIO>;
b6bf37e40cbec2 Xu Yang         2025-04-10  485  		clock-names = "main_clk";
b6bf37e40cbec2 Xu Yang         2025-04-10  486  		#phy-cells = <0>;
b6bf37e40cbec2 Xu Yang         2025-04-10  487  	};
b6bf37e40cbec2 Xu Yang         2025-04-10  488  
5e3cbb8e4256e3 Peng Fan        2024-06-17  489  	soc {
5e3cbb8e4256e3 Peng Fan        2024-06-17  490  		compatible = "simple-bus";
5e3cbb8e4256e3 Peng Fan        2024-06-17  491  		#address-cells = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  492  		#size-cells = <2>;
5e3cbb8e4256e3 Peng Fan        2024-06-17  493  		ranges;
5e3cbb8e4256e3 Peng Fan        2024-06-17  494  
530141de4d6598 Peng Fan        2025-08-18  495  		etm0: etm@40840000 {
530141de4d6598 Peng Fan        2025-08-18  496  			compatible = "arm,coresight-etm4x", "arm,primecell";
530141de4d6598 Peng Fan        2025-08-18  497  			reg = <0x0 0x40840000 0x0 0x10000>;
530141de4d6598 Peng Fan        2025-08-18  498  			arm,primecell-periphid = <0xbb95d>;
530141de4d6598 Peng Fan        2025-08-18  499  			cpu = <&A55_0>;
530141de4d6598 Peng Fan        2025-08-18  500  			clocks = <&scmi_clk IMX95_CLK_A55PERIPH>;
530141de4d6598 Peng Fan        2025-08-18  501  			clock-names = "apb_pclk";
530141de4d6598 Peng Fan        2025-08-18  502  			status = "disabled";
530141de4d6598 Peng Fan        2025-08-18  503  
530141de4d6598 Peng Fan        2025-08-18  504  			out-ports {
530141de4d6598 Peng Fan        2025-08-18  505  				port {
530141de4d6598 Peng Fan        2025-08-18  506  					etm0_out_port: endpoint {
530141de4d6598 Peng Fan        2025-08-18  507  						remote-endpoint = <&ca_funnel_in_port0>;
530141de4d6598 Peng Fan        2025-08-18  508  					};
530141de4d6598 Peng Fan        2025-08-18  509  				};
530141de4d6598 Peng Fan        2025-08-18  510  			};
530141de4d6598 Peng Fan        2025-08-18  511  		};
530141de4d6598 Peng Fan        2025-08-18  512  
530141de4d6598 Peng Fan        2025-08-18 @513  		funnel0: funnel {
530141de4d6598 Peng Fan        2025-08-18  514  			/*
530141de4d6598 Peng Fan        2025-08-18  515  			 * non-configurable funnel don't show up on the AMBA
530141de4d6598 Peng Fan        2025-08-18  516  			 * bus.  As such no need to add "arm,primecell".
530141de4d6598 Peng Fan        2025-08-18  517  			 */
530141de4d6598 Peng Fan        2025-08-18  518  			compatible = "arm,coresight-static-funnel";
530141de4d6598 Peng Fan        2025-08-18  519  			status = "disabled";
530141de4d6598 Peng Fan        2025-08-18  520  
530141de4d6598 Peng Fan        2025-08-18  521  			in-ports {
530141de4d6598 Peng Fan        2025-08-18  522  				port {
530141de4d6598 Peng Fan        2025-08-18  523  					ca_funnel_in_port0: endpoint {
530141de4d6598 Peng Fan        2025-08-18  524  						remote-endpoint = <&etm0_out_port>;
530141de4d6598 Peng Fan        2025-08-18  525  					};
530141de4d6598 Peng Fan        2025-08-18  526  				};
530141de4d6598 Peng Fan        2025-08-18  527  			};
530141de4d6598 Peng Fan        2025-08-18  528  
530141de4d6598 Peng Fan        2025-08-18  529  			out-ports {
530141de4d6598 Peng Fan        2025-08-18  530  				port {
530141de4d6598 Peng Fan        2025-08-18  531  					ca_funnel_out_port0: endpoint {
530141de4d6598 Peng Fan        2025-08-18  532  						remote-endpoint = <&hugo_funnel_in_port0>;
530141de4d6598 Peng Fan        2025-08-18  533  					};
530141de4d6598 Peng Fan        2025-08-18  534  				};
530141de4d6598 Peng Fan        2025-08-18  535  			};
530141de4d6598 Peng Fan        2025-08-18  536  		};
530141de4d6598 Peng Fan        2025-08-18  537  
530141de4d6598 Peng Fan        2025-08-18 @538  		funnel1: funnel-sys {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
