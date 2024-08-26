Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6012C473
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Aug 2024 21:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724707489; cv=none; b=BjflB1RrVBMaNxqxOeCemxtoldIr2avr92Tl7g0YE+JKStvAlAxOjV8hHgnuq3i3nK2E6XhWTkeD49f2KelDavljKHI2+Sb/o9dFS3jPCBsqlENlOJnHhMB85c9d3OwMinpAIb/jpXGro4KsjGqAZqT1CEoKgul3dNOSnz/cvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724707489; c=relaxed/simple;
	bh=x9WZafQ7ZMT9VSON41Eg6GE+lyLqEj4cAGUy+Xa45XY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZthbWclUo6fkMPu1ivISUXYQ1wdBO7Rto8Zaw3F6JQsooHkUFpRjOOqJcXdcSgV+WfPo4RPdvwGNEhgcBRFcQnFC7y5QAb6AR641pYcGvDt2Fzhp4VVufPgxOgGPEON3uHWzb7Pys1sM8OKRbhL6I9d/aXpxklXwQF2eipzW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIbSl8rq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIbSl8rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724707475; x=1756243475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9WZafQ7ZMT9VSON41Eg6GE+lyLqEj4cAGUy+Xa45XY=;
  b=AIbSl8rq93Z8/i0x2B7BJPlgd1F187t78VgtSKasvf5SeByhCPHFHaRo
   UhwAR1LP1EEwKFXFDexnmnVSHJsoWJNRUEjHAlDvVS/dmQ4cq6Z0hQz+j
   mZGSYgcMCOJzbhtjkTuA/ZH9UvuZOR1e5LTLFWbw8SVIqtFFeH+YqHfn3
   yF9guq12namJWeV5OgBRVKOXlLyXwN+CCL41nVWLyB3e/HH8ljx2YD8zP
   z/UtL/b6hNjR9RdjY6DgQG+Ae/I132oJ93X2RhV6qCEOE1a04II3seFUn
   2cCRU7pit9t09M3flxD1Dugb9WPFm0PgZPQ8MKMKxYMXMUZ0HKe6B+bHT
   A==;
X-CSE-ConnectionGUID: BSU9qPHRTeGVWpTmGW3aaQ==
X-CSE-MsgGUID: RU8xDUdnT22HtaUvLQK26Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23337130"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23337130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 14:24:33 -0700
X-CSE-ConnectionGUID: 9df8L5RXTZO+6aV3zeeFsA==
X-CSE-MsgGUID: Dg0ftyq/RTW7ZVeaOp4E1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="93369799"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 14:24:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sihCO-000Hc4-0V;
	Mon, 26 Aug 2024 21:24:28 +0000
Date: Tue, 27 Aug 2024 05:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for x1e80100
Message-ID: <202408270518.gxIQwYQN-lkp@intel.com>
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
In-Reply-To: <20240826061900.790715-1-quic_jiegan@quicinc.com>
References: <20240826061900.790715-1-quic_jiegan@quicinc.com>
TO: Jie Gan <quic_jiegan@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>
CC: Tao Zhang <quic_taozha@quicinc.com>
CC: Yuanfang Zhang <quic_yuanfang@quicinc.com>
CC: Song Chai <quic_songchai@quicinc.com>
CC: Yushan Li <quic_yushli@quicinc.com>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/arm64-dts-qcom-Add-coresight-nodes-for-x1e80100/20240826-161812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240826061900.790715-1-quic_jiegan%40quicinc.com
patch subject: [PATCH] arm64: dts: qcom: Add coresight nodes for x1e80100
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-002-20240827 (https://download.01.org/0day-ci/archive/20240827/202408270518.gxIQwYQN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270518.gxIQwYQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408270518.gxIQwYQN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3886.11-3896.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5702.13-5713.6: Warning (graph_child_address): /soc@0/funnel@10ac5000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6041.13-6052.6: Warning (graph_child_address): /soc@0/funnel@10b24000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6371.13-6382.6: Warning (graph_child_address): /soc@0/funnel@10c3d000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6453.13-6464.6: Warning (graph_child_address): /soc@0/funnel@10cc5000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6760.13-6771.6: Warning (graph_child_address): /soc@0/funnel@10d13000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +5702 arch/arm64/boot/dts/qcom/x1e80100.dtsi

af16b00578a7a1 Rajendra Nayak      2023-12-05    22  
af16b00578a7a1 Rajendra Nayak      2023-12-05    23  / {
af16b00578a7a1 Rajendra Nayak      2023-12-05    24  	interrupt-parent = <&intc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    25  
af16b00578a7a1 Rajendra Nayak      2023-12-05    26  	#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    27  	#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    28  
af16b00578a7a1 Rajendra Nayak      2023-12-05    29  	chosen { };
af16b00578a7a1 Rajendra Nayak      2023-12-05    30  
af16b00578a7a1 Rajendra Nayak      2023-12-05    31  	clocks {
af16b00578a7a1 Rajendra Nayak      2023-12-05    32  		xo_board: xo-board {
af16b00578a7a1 Rajendra Nayak      2023-12-05    33  			compatible = "fixed-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    34  			clock-frequency = <76800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    35  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    36  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    37  
af16b00578a7a1 Rajendra Nayak      2023-12-05    38  		sleep_clk: sleep-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05    39  			compatible = "fixed-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    40  			clock-frequency = <32000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    41  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    42  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    43  
af16b00578a7a1 Rajendra Nayak      2023-12-05    44  		bi_tcxo_div2: bi-tcxo-div2-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05    45  			compatible = "fixed-factor-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    46  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    47  
af16b00578a7a1 Rajendra Nayak      2023-12-05    48  			clocks = <&rpmhcc RPMH_CXO_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    49  			clock-mult = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    50  			clock-div = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    51  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    52  
af16b00578a7a1 Rajendra Nayak      2023-12-05    53  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05    54  			compatible = "fixed-factor-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    55  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    56  
af16b00578a7a1 Rajendra Nayak      2023-12-05    57  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    58  			clock-mult = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    59  			clock-div = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    60  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    61  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05    62  
af16b00578a7a1 Rajendra Nayak      2023-12-05    63  	cpus {
af16b00578a7a1 Rajendra Nayak      2023-12-05    64  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    65  		#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    66  
af16b00578a7a1 Rajendra Nayak      2023-12-05    67  		CPU0: cpu@0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05    68  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05    69  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05    70  			reg = <0x0 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    71  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05    72  			next-level-cache = <&L2_0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    73  			power-domains = <&CPU_PD0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    74  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05    75  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    76  
af16b00578a7a1 Rajendra Nayak      2023-12-05    77  			L2_0: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05    78  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05    79  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    80  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05    81  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05    82  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    83  
af16b00578a7a1 Rajendra Nayak      2023-12-05    84  		CPU1: cpu@100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05    85  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05    86  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05    87  			reg = <0x0 0x100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    88  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05    89  			next-level-cache = <&L2_0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    90  			power-domains = <&CPU_PD1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    91  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05    92  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    93  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    94  
af16b00578a7a1 Rajendra Nayak      2023-12-05    95  		CPU2: cpu@200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05    96  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05    97  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05    98  			reg = <0x0 0x200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    99  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   100  			next-level-cache = <&L2_0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   101  			power-domains = <&CPU_PD2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   102  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   103  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   104  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   105  
af16b00578a7a1 Rajendra Nayak      2023-12-05   106  		CPU3: cpu@300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   107  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   108  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   109  			reg = <0x0 0x300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   110  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   111  			next-level-cache = <&L2_0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   112  			power-domains = <&CPU_PD3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   113  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   114  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   115  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   116  
af16b00578a7a1 Rajendra Nayak      2023-12-05   117  		CPU4: cpu@10000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   118  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   119  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   120  			reg = <0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   121  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   122  			next-level-cache = <&L2_1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   123  			power-domains = <&CPU_PD4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   124  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   125  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   126  
af16b00578a7a1 Rajendra Nayak      2023-12-05   127  			L2_1: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05   128  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05   129  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   130  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05   131  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   132  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   133  
af16b00578a7a1 Rajendra Nayak      2023-12-05   134  		CPU5: cpu@10100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   135  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   136  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   137  			reg = <0x0 0x10100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   138  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   139  			next-level-cache = <&L2_1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   140  			power-domains = <&CPU_PD5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   141  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   142  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   143  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   144  
af16b00578a7a1 Rajendra Nayak      2023-12-05   145  		CPU6: cpu@10200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   146  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   147  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   148  			reg = <0x0 0x10200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   149  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   150  			next-level-cache = <&L2_1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   151  			power-domains = <&CPU_PD6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   152  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   153  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   154  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   155  
af16b00578a7a1 Rajendra Nayak      2023-12-05   156  		CPU7: cpu@10300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   157  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   158  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   159  			reg = <0x0 0x10300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   160  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   161  			next-level-cache = <&L2_1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   162  			power-domains = <&CPU_PD7>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   163  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   164  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   165  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   166  
af16b00578a7a1 Rajendra Nayak      2023-12-05   167  		CPU8: cpu@20000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   168  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   169  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   170  			reg = <0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   171  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   172  			next-level-cache = <&L2_2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   173  			power-domains = <&CPU_PD8>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   174  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   175  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   176  
af16b00578a7a1 Rajendra Nayak      2023-12-05   177  			L2_2: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05   178  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05   179  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   180  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05   181  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   182  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   183  
af16b00578a7a1 Rajendra Nayak      2023-12-05   184  		CPU9: cpu@20100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   185  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   186  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   187  			reg = <0x0 0x20100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   188  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   189  			next-level-cache = <&L2_2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   190  			power-domains = <&CPU_PD9>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   191  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   192  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   193  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   194  
af16b00578a7a1 Rajendra Nayak      2023-12-05   195  		CPU10: cpu@20200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   196  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   197  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   198  			reg = <0x0 0x20200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   199  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   200  			next-level-cache = <&L2_2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   201  			power-domains = <&CPU_PD10>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   202  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   203  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   204  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   205  
af16b00578a7a1 Rajendra Nayak      2023-12-05   206  		CPU11: cpu@20300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   207  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   208  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   209  			reg = <0x0 0x20300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   210  			enable-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   211  			next-level-cache = <&L2_2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   212  			power-domains = <&CPU_PD11>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   213  			power-domain-names = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   214  			cpu-idle-states = <&CLUSTER_C4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   215  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   216  
af16b00578a7a1 Rajendra Nayak      2023-12-05   217  		cpu-map {
af16b00578a7a1 Rajendra Nayak      2023-12-05   218  			cluster0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   219  				core0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   220  					cpu = <&CPU0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   221  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   222  
af16b00578a7a1 Rajendra Nayak      2023-12-05   223  				core1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   224  					cpu = <&CPU1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   225  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   226  
af16b00578a7a1 Rajendra Nayak      2023-12-05   227  				core2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   228  					cpu = <&CPU2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   229  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   230  
af16b00578a7a1 Rajendra Nayak      2023-12-05   231  				core3 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   232  					cpu = <&CPU3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   233  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   234  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   235  
af16b00578a7a1 Rajendra Nayak      2023-12-05   236  			cluster1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   237  				core0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   238  					cpu = <&CPU4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   239  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   240  
af16b00578a7a1 Rajendra Nayak      2023-12-05   241  				core1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   242  					cpu = <&CPU5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   243  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   244  
af16b00578a7a1 Rajendra Nayak      2023-12-05   245  				core2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   246  					cpu = <&CPU6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   247  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   248  
af16b00578a7a1 Rajendra Nayak      2023-12-05   249  				core3 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   250  					cpu = <&CPU7>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   251  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   252  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   253  
af16b00578a7a1 Rajendra Nayak      2023-12-05   254  			cluster2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   255  				core0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   256  					cpu = <&CPU8>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   257  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   258  
af16b00578a7a1 Rajendra Nayak      2023-12-05   259  				core1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   260  					cpu = <&CPU9>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   261  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   262  
af16b00578a7a1 Rajendra Nayak      2023-12-05   263  				core2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   264  					cpu = <&CPU10>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   265  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   266  
af16b00578a7a1 Rajendra Nayak      2023-12-05   267  				core3 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   268  					cpu = <&CPU11>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   269  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   270  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   271  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   272  
af16b00578a7a1 Rajendra Nayak      2023-12-05   273  		idle-states {
af16b00578a7a1 Rajendra Nayak      2023-12-05   274  			entry-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   275  
af16b00578a7a1 Rajendra Nayak      2023-12-05   276  			CLUSTER_C4: cpu-sleep-0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   277  				compatible = "arm,idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05   278  				idle-state-name = "ret";
af16b00578a7a1 Rajendra Nayak      2023-12-05   279  				arm,psci-suspend-param = <0x00000004>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   280  				entry-latency-us = <180>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   281  				exit-latency-us = <320>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   282  				min-residency-us = <1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   283  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   284  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   285  
af16b00578a7a1 Rajendra Nayak      2023-12-05   286  		domain-idle-states {
af16b00578a7a1 Rajendra Nayak      2023-12-05   287  			CLUSTER_CL4: cluster-sleep-0 {
cb939b9b354268 Rajendra Nayak      2024-03-17   288  				compatible = "domain-idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05   289  				idle-state-name = "l2-ret";
af16b00578a7a1 Rajendra Nayak      2023-12-05   290  				arm,psci-suspend-param = <0x01000044>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   291  				entry-latency-us = <350>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   292  				exit-latency-us = <500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   293  				min-residency-us = <2500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   294  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   295  
af16b00578a7a1 Rajendra Nayak      2023-12-05   296  			CLUSTER_CL5: cluster-sleep-1 {
cb939b9b354268 Rajendra Nayak      2024-03-17   297  				compatible = "domain-idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05   298  				idle-state-name = "ret-pll-off";
af16b00578a7a1 Rajendra Nayak      2023-12-05   299  				arm,psci-suspend-param = <0x01000054>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   300  				entry-latency-us = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   301  				exit-latency-us = <2500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   302  				min-residency-us = <7000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   303  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   304  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   305  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   306  
4c00bb76d36f3d Jie Gan             2024-08-26   307  	dummy-sink {
4c00bb76d36f3d Jie Gan             2024-08-26   308  		compatible = "arm,coresight-dummy-sink";
4c00bb76d36f3d Jie Gan             2024-08-26   309  
4c00bb76d36f3d Jie Gan             2024-08-26   310  		in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26   311  			port {
4c00bb76d36f3d Jie Gan             2024-08-26   312  				eud_in: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26   313  					remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26   314  					<&swao_rep_out1>;
4c00bb76d36f3d Jie Gan             2024-08-26   315  				};
4c00bb76d36f3d Jie Gan             2024-08-26   316  			};
4c00bb76d36f3d Jie Gan             2024-08-26   317  		};
4c00bb76d36f3d Jie Gan             2024-08-26   318  	};
4c00bb76d36f3d Jie Gan             2024-08-26   319  
af16b00578a7a1 Rajendra Nayak      2023-12-05   320  	firmware {
af16b00578a7a1 Rajendra Nayak      2023-12-05   321  		scm: scm {
af16b00578a7a1 Rajendra Nayak      2023-12-05   322  			compatible = "qcom,scm-x1e80100", "qcom,scm";
af16b00578a7a1 Rajendra Nayak      2023-12-05   323  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   324  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   325  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   326  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   327  
af16b00578a7a1 Rajendra Nayak      2023-12-05   328  	clk_virt: interconnect-0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   329  		compatible = "qcom,x1e80100-clk-virt";
af16b00578a7a1 Rajendra Nayak      2023-12-05   330  		#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   331  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   332  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   333  
af16b00578a7a1 Rajendra Nayak      2023-12-05   334  	mc_virt: interconnect-1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   335  		compatible = "qcom,x1e80100-mc-virt";
af16b00578a7a1 Rajendra Nayak      2023-12-05   336  		#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   337  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   338  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   339  
af16b00578a7a1 Rajendra Nayak      2023-12-05   340  	memory@80000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   341  		device_type = "memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   342  		/* We expect the bootloader to fill in the size */
af16b00578a7a1 Rajendra Nayak      2023-12-05   343  		reg = <0 0x80000000 0 0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   344  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   345  
af16b00578a7a1 Rajendra Nayak      2023-12-05   346  	pmu {
af16b00578a7a1 Rajendra Nayak      2023-12-05   347  		compatible = "arm,armv8-pmuv3";
af16b00578a7a1 Rajendra Nayak      2023-12-05   348  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   349  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   350  
af16b00578a7a1 Rajendra Nayak      2023-12-05   351  	psci {
af16b00578a7a1 Rajendra Nayak      2023-12-05   352  		compatible = "arm,psci-1.0";
af16b00578a7a1 Rajendra Nayak      2023-12-05   353  		method = "smc";
af16b00578a7a1 Rajendra Nayak      2023-12-05   354  
af16b00578a7a1 Rajendra Nayak      2023-12-05   355  		CPU_PD0: power-domain-cpu0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   356  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   357  			power-domains = <&CLUSTER_PD0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   358  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   359  
af16b00578a7a1 Rajendra Nayak      2023-12-05   360  		CPU_PD1: power-domain-cpu1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   361  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   362  			power-domains = <&CLUSTER_PD0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   363  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   364  
af16b00578a7a1 Rajendra Nayak      2023-12-05   365  		CPU_PD2: power-domain-cpu2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   366  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   367  			power-domains = <&CLUSTER_PD0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   368  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   369  
af16b00578a7a1 Rajendra Nayak      2023-12-05   370  		CPU_PD3: power-domain-cpu3 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   371  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   372  			power-domains = <&CLUSTER_PD0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   373  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   374  
af16b00578a7a1 Rajendra Nayak      2023-12-05   375  		CPU_PD4: power-domain-cpu4 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   376  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   377  			power-domains = <&CLUSTER_PD1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   378  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   379  
af16b00578a7a1 Rajendra Nayak      2023-12-05   380  		CPU_PD5: power-domain-cpu5 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   381  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   382  			power-domains = <&CLUSTER_PD1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   383  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   384  
af16b00578a7a1 Rajendra Nayak      2023-12-05   385  		CPU_PD6: power-domain-cpu6 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   386  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   387  			power-domains = <&CLUSTER_PD1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   388  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   389  
af16b00578a7a1 Rajendra Nayak      2023-12-05   390  		CPU_PD7: power-domain-cpu7 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   391  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   392  			power-domains = <&CLUSTER_PD1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   393  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   394  
af16b00578a7a1 Rajendra Nayak      2023-12-05   395  		CPU_PD8: power-domain-cpu8 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   396  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   397  			power-domains = <&CLUSTER_PD2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   398  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   399  
af16b00578a7a1 Rajendra Nayak      2023-12-05   400  		CPU_PD9: power-domain-cpu9 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   401  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   402  			power-domains = <&CLUSTER_PD2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   403  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   404  
af16b00578a7a1 Rajendra Nayak      2023-12-05   405  		CPU_PD10: power-domain-cpu10 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   406  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   407  			power-domains = <&CLUSTER_PD2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   408  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   409  
af16b00578a7a1 Rajendra Nayak      2023-12-05   410  		CPU_PD11: power-domain-cpu11 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   411  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   412  			power-domains = <&CLUSTER_PD2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   413  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   414  
af16b00578a7a1 Rajendra Nayak      2023-12-05   415  		CLUSTER_PD0: power-domain-cpu-cluster0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   416  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   417  			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   418  			power-domains = <&SYSTEM_PD>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   419  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   420  
af16b00578a7a1 Rajendra Nayak      2023-12-05   421  		CLUSTER_PD1: power-domain-cpu-cluster1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   422  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   423  			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   424  			power-domains = <&SYSTEM_PD>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   425  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   426  
af16b00578a7a1 Rajendra Nayak      2023-12-05   427  		CLUSTER_PD2: power-domain-cpu-cluster2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   428  			#power-domain-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   429  			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   430  			power-domains = <&SYSTEM_PD>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   431  		};
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   432  
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   433  		SYSTEM_PD: power-domain-system {
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   434  			#power-domain-cells = <0>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   435  			/* TODO: system-wide idle states */
af16b00578a7a1 Rajendra Nayak      2023-12-05   436  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   437  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   438  
af16b00578a7a1 Rajendra Nayak      2023-12-05   439  	reserved-memory {
af16b00578a7a1 Rajendra Nayak      2023-12-05   440  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   441  		#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   442  		ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05   443  
af16b00578a7a1 Rajendra Nayak      2023-12-05   444  		gunyah_hyp_mem: gunyah-hyp@80000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   445  			reg = <0x0 0x80000000 0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   446  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   447  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   448  
af16b00578a7a1 Rajendra Nayak      2023-12-05   449  		hyp_elf_package_mem: hyp-elf-package@80800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   450  			reg = <0x0 0x80800000 0x0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   451  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   452  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   453  
af16b00578a7a1 Rajendra Nayak      2023-12-05   454  		ncc_mem: ncc@80a00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   455  			reg = <0x0 0x80a00000 0x0 0x400000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   456  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   457  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   458  
af16b00578a7a1 Rajendra Nayak      2023-12-05   459  		cpucp_log_mem: cpucp-log@80e00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   460  			reg = <0x0 0x80e00000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   461  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   462  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   463  
af16b00578a7a1 Rajendra Nayak      2023-12-05   464  		cpucp_mem: cpucp@80e40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   465  			reg = <0x0 0x80e40000 0x0 0x540000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   466  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   467  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   468  
af16b00578a7a1 Rajendra Nayak      2023-12-05   469  		reserved-region@81380000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   470  			reg = <0x0 0x81380000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   471  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   472  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   473  
af16b00578a7a1 Rajendra Nayak      2023-12-05   474  		tags_mem: tags-region@81400000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   475  			reg = <0x0 0x81400000 0x0 0x1a0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   476  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   477  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   478  
af16b00578a7a1 Rajendra Nayak      2023-12-05   479  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   480  			reg = <0x0 0x81a00000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   481  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   482  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   483  
af16b00578a7a1 Rajendra Nayak      2023-12-05   484  		xbl_ramdump_mem: xbl-ramdump@81a40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   485  			reg = <0x0 0x81a40000 0x0 0x1c0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   486  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   487  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   488  
af16b00578a7a1 Rajendra Nayak      2023-12-05   489  		aop_image_mem: aop-image@81c00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   490  			reg = <0x0 0x81c00000 0x0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   491  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   492  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   493  
af16b00578a7a1 Rajendra Nayak      2023-12-05   494  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   495  			compatible = "qcom,cmd-db";
af16b00578a7a1 Rajendra Nayak      2023-12-05   496  			reg = <0x0 0x81c60000 0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   497  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   498  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   499  
af16b00578a7a1 Rajendra Nayak      2023-12-05   500  		aop_config_mem: aop-config@81c80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   501  			reg = <0x0 0x81c80000 0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   502  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   503  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   504  
af16b00578a7a1 Rajendra Nayak      2023-12-05   505  		tme_crash_dump_mem: tme-crash-dump@81ca0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   506  			reg = <0x0 0x81ca0000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   507  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   508  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   509  
af16b00578a7a1 Rajendra Nayak      2023-12-05   510  		tme_log_mem: tme-log@81ce0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   511  			reg = <0x0 0x81ce0000 0x0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   512  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   513  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   514  
af16b00578a7a1 Rajendra Nayak      2023-12-05   515  		uefi_log_mem: uefi-log@81ce4000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   516  			reg = <0x0 0x81ce4000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   517  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   518  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   519  
af16b00578a7a1 Rajendra Nayak      2023-12-05   520  		secdata_apss_mem: secdata-apss@81cff000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   521  			reg = <0x0 0x81cff000 0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   522  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   523  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   524  
af16b00578a7a1 Rajendra Nayak      2023-12-05   525  		pdp_ns_shared_mem: pdp-ns-shared@81e00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   526  			reg = <0x0 0x81e00000 0x0 0x100000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   527  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   528  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   529  
af16b00578a7a1 Rajendra Nayak      2023-12-05   530  		gpu_prr_mem: gpu-prr@81f00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   531  			reg = <0x0 0x81f00000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   532  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   533  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   534  
af16b00578a7a1 Rajendra Nayak      2023-12-05   535  		tpm_control_mem: tpm-control@81f10000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   536  			reg = <0x0 0x81f10000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   537  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   538  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   539  
af16b00578a7a1 Rajendra Nayak      2023-12-05   540  		usb_ucsi_shared_mem: usb-ucsi-shared@81f20000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   541  			reg = <0x0 0x81f20000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   542  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   543  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   544  
af16b00578a7a1 Rajendra Nayak      2023-12-05   545  		pld_pep_mem: pld-pep@81f30000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   546  			reg = <0x0 0x81f30000 0x0 0x6000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   547  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   548  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   549  
af16b00578a7a1 Rajendra Nayak      2023-12-05   550  		pld_gmu_mem: pld-gmu@81f36000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   551  			reg = <0x0 0x81f36000 0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   552  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   553  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   554  
af16b00578a7a1 Rajendra Nayak      2023-12-05   555  		pld_pdp_mem: pld-pdp@81f37000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   556  			reg = <0x0 0x81f37000 0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   557  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   558  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   559  
af16b00578a7a1 Rajendra Nayak      2023-12-05   560  		tz_stat_mem: tz-stat@82700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   561  			reg = <0x0 0x82700000 0x0 0x100000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   562  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   563  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   564  
af16b00578a7a1 Rajendra Nayak      2023-12-05   565  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   566  			reg = <0x0 0x82800000 0x0 0xc00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   567  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   568  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   569  
af16b00578a7a1 Rajendra Nayak      2023-12-05   570  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@84b00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   571  			reg = <0x0 0x84b00000 0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   572  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   573  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   574  
af16b00578a7a1 Rajendra Nayak      2023-12-05   575  		spu_secure_shared_memory_mem: spu-secure-shared-memory@85300000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   576  			reg = <0x0 0x85300000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   577  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   578  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   579  
af16b00578a7a1 Rajendra Nayak      2023-12-05   580  		adsp_boot_dtb_mem: adsp-boot-dtb@866c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   581  			reg = <0x0 0x866c0000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   582  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   583  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   584  
af16b00578a7a1 Rajendra Nayak      2023-12-05   585  		spss_region_mem: spss-region@86700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   586  			reg = <0x0 0x86700000 0x0 0x400000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   587  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   588  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   589  
af16b00578a7a1 Rajendra Nayak      2023-12-05   590  		adsp_boot_mem: adsp-boot@86b00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   591  			reg = <0x0 0x86b00000 0x0 0xc00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   592  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   593  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   594  
af16b00578a7a1 Rajendra Nayak      2023-12-05   595  		video_mem: video@87700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   596  			reg = <0x0 0x87700000 0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   597  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   598  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   599  
af16b00578a7a1 Rajendra Nayak      2023-12-05   600  		adspslpi_mem: adspslpi@87e00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   601  			reg = <0x0 0x87e00000 0x0 0x3a00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   602  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   603  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   604  
af16b00578a7a1 Rajendra Nayak      2023-12-05   605  		q6_adsp_dtb_mem: q6-adsp-dtb@8b800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   606  			reg = <0x0 0x8b800000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   607  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   608  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   609  
af16b00578a7a1 Rajendra Nayak      2023-12-05   610  		cdsp_mem: cdsp@8b900000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   611  			reg = <0x0 0x8b900000 0x0 0x2000000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   612  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   613  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   614  
af16b00578a7a1 Rajendra Nayak      2023-12-05   615  		q6_cdsp_dtb_mem: q6-cdsp-dtb@8d900000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   616  			reg = <0x0 0x8d900000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   617  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   618  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   619  
af16b00578a7a1 Rajendra Nayak      2023-12-05   620  		gpu_microcode_mem: gpu-microcode@8d9fe000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   621  			reg = <0x0 0x8d9fe000 0x0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   622  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   623  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   624  
af16b00578a7a1 Rajendra Nayak      2023-12-05   625  		cvp_mem: cvp@8da00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   626  			reg = <0x0 0x8da00000 0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   627  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   628  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   629  
af16b00578a7a1 Rajendra Nayak      2023-12-05   630  		camera_mem: camera@8e100000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   631  			reg = <0x0 0x8e100000 0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   632  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   633  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   634  
af16b00578a7a1 Rajendra Nayak      2023-12-05   635  		av1_encoder_mem: av1-encoder@8e900000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   636  			reg = <0x0 0x8e900000 0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   637  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   638  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   639  
af16b00578a7a1 Rajendra Nayak      2023-12-05   640  		reserved-region@8f000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   641  			reg = <0x0 0x8f000000 0x0 0xa00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   642  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   643  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   644  
af16b00578a7a1 Rajendra Nayak      2023-12-05   645  		wpss_mem: wpss@8fa00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   646  			reg = <0x0 0x8fa00000 0x0 0x1900000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   647  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   648  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   649  
af16b00578a7a1 Rajendra Nayak      2023-12-05   650  		q6_wpss_dtb_mem: q6-wpss-dtb@91300000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   651  			reg = <0x0 0x91300000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   652  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   653  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   654  
af16b00578a7a1 Rajendra Nayak      2023-12-05   655  		xbl_sc_mem: xbl-sc@d8000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   656  			reg = <0x0 0xd8000000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   657  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   658  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   659  
af16b00578a7a1 Rajendra Nayak      2023-12-05   660  		reserved-region@d8040000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   661  			reg = <0x0 0xd8040000 0x0 0xa0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   662  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   663  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   664  
af16b00578a7a1 Rajendra Nayak      2023-12-05   665  		qtee_mem: qtee@d80e0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   666  			reg = <0x0 0xd80e0000 0x0 0x520000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   667  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   668  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   669  
af16b00578a7a1 Rajendra Nayak      2023-12-05   670  		ta_mem: ta@d8600000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   671  			reg = <0x0 0xd8600000 0x0 0x8a00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   672  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   673  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   674  
af16b00578a7a1 Rajendra Nayak      2023-12-05   675  		tags_mem1: tags@e1000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   676  			reg = <0x0 0xe1000000 0x0 0x26a0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   677  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   678  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   679  
af16b00578a7a1 Rajendra Nayak      2023-12-05   680  		llcc_lpi_mem: llcc-lpi@ff800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   681  			reg = <0x0 0xff800000 0x0 0x600000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   682  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   683  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   684  
af16b00578a7a1 Rajendra Nayak      2023-12-05   685  		smem_mem: smem@ffe00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   686  			compatible = "qcom,smem";
af16b00578a7a1 Rajendra Nayak      2023-12-05   687  			reg = <0x0 0xffe00000 0x0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   688  			hwlocks = <&tcsr_mutex 3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   689  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   690  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   691  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   692  
0b6ae7364b1133 Sibi Sankar         2024-01-29   693  	smp2p-adsp {
0b6ae7364b1133 Sibi Sankar         2024-01-29   694  		compatible = "qcom,smp2p";
0b6ae7364b1133 Sibi Sankar         2024-01-29   695  
0b6ae7364b1133 Sibi Sankar         2024-01-29   696  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133 Sibi Sankar         2024-01-29   697  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133 Sibi Sankar         2024-01-29   698  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   699  
0b6ae7364b1133 Sibi Sankar         2024-01-29   700  		mboxes = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133 Sibi Sankar         2024-01-29   701  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   702  
0b6ae7364b1133 Sibi Sankar         2024-01-29   703  		qcom,smem = <443>, <429>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   704  		qcom,local-pid = <0>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   705  		qcom,remote-pid = <2>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   706  
0b6ae7364b1133 Sibi Sankar         2024-01-29   707  		smp2p_adsp_out: master-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   708  			qcom,entry-name = "master-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   709  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   710  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   711  
0b6ae7364b1133 Sibi Sankar         2024-01-29   712  		smp2p_adsp_in: slave-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   713  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   714  			interrupt-controller;
0b6ae7364b1133 Sibi Sankar         2024-01-29   715  			#interrupt-cells = <2>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   716  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   717  	};
0b6ae7364b1133 Sibi Sankar         2024-01-29   718  
0b6ae7364b1133 Sibi Sankar         2024-01-29   719  	smp2p-cdsp {
0b6ae7364b1133 Sibi Sankar         2024-01-29   720  		compatible = "qcom,smp2p";
0b6ae7364b1133 Sibi Sankar         2024-01-29   721  
0b6ae7364b1133 Sibi Sankar         2024-01-29   722  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133 Sibi Sankar         2024-01-29   723  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133 Sibi Sankar         2024-01-29   724  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   725  
0b6ae7364b1133 Sibi Sankar         2024-01-29   726  		mboxes = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133 Sibi Sankar         2024-01-29   727  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   728  
0b6ae7364b1133 Sibi Sankar         2024-01-29   729  		qcom,smem = <94>, <432>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   730  		qcom,local-pid = <0>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   731  		qcom,remote-pid = <5>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   732  
0b6ae7364b1133 Sibi Sankar         2024-01-29   733  		smp2p_cdsp_out: master-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   734  			qcom,entry-name = "master-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   735  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   736  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   737  
0b6ae7364b1133 Sibi Sankar         2024-01-29   738  		smp2p_cdsp_in: slave-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   739  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   740  			interrupt-controller;
0b6ae7364b1133 Sibi Sankar         2024-01-29   741  			#interrupt-cells = <2>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   742  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   743  	};
0b6ae7364b1133 Sibi Sankar         2024-01-29   744  
af16b00578a7a1 Rajendra Nayak      2023-12-05   745  	soc: soc@0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   746  		compatible = "simple-bus";
af16b00578a7a1 Rajendra Nayak      2023-12-05   747  
af16b00578a7a1 Rajendra Nayak      2023-12-05   748  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   749  		#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   750  		dma-ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   751  		ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   752  
af16b00578a7a1 Rajendra Nayak      2023-12-05   753  		gcc: clock-controller@100000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   754  			compatible = "qcom,x1e80100-gcc";
af16b00578a7a1 Rajendra Nayak      2023-12-05   755  			reg = <0 0x00100000 0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   756  
af16b00578a7a1 Rajendra Nayak      2023-12-05   757  			clocks = <&bi_tcxo_div2>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   758  				 <&sleep_clk>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   759  				 <0>,
5eb83fc10289db Abel Vesa           2024-01-29   760  				 <&pcie4_phy>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   761  				 <0>,
5eb83fc10289db Abel Vesa           2024-01-29   762  				 <&pcie6a_phy>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   763  				 <0>,
4af46b7bd66fa3 Abel Vesa           2024-01-29   764  				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29   765  				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29   766  				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   767  
af16b00578a7a1 Rajendra Nayak      2023-12-05   768  			power-domains = <&rpmhpd RPMHPD_CX>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   769  			#clock-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   770  			#reset-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   771  			#power-domain-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   772  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   773  
6a07a4f3f509c3 Sibi Sankar         2024-01-29   774  		ipcc: mailbox@408000 {
6a07a4f3f509c3 Sibi Sankar         2024-01-29   775  			compatible = "qcom,x1e80100-ipcc", "qcom,ipcc";
6a07a4f3f509c3 Sibi Sankar         2024-01-29   776  			reg = <0 0x00408000 0 0x1000>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   777  
6a07a4f3f509c3 Sibi Sankar         2024-01-29   778  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   779  			interrupt-controller;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   780  			#interrupt-cells = <3>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   781  
6a07a4f3f509c3 Sibi Sankar         2024-01-29   782  			#mbox-cells = <2>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   783  		};
6a07a4f3f509c3 Sibi Sankar         2024-01-29   784  
af16b00578a7a1 Rajendra Nayak      2023-12-05   785  		gpi_dma2: dma-controller@800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   786  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak      2023-12-05   787  			reg = <0 0x00800000 0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   788  
af16b00578a7a1 Rajendra Nayak      2023-12-05   789  			interrupts = <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   790  				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   791  				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   792  				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   793  				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   794  				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   795  				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   796  				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   797  				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   798  				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   799  				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   800  				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   801  
af16b00578a7a1 Rajendra Nayak      2023-12-05   802  			dma-channels = <12>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   803  			dma-channel-mask = <0x3e>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   804  			#dma-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   805  
af16b00578a7a1 Rajendra Nayak      2023-12-05   806  			iommus = <&apps_smmu 0x436 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   807  
af16b00578a7a1 Rajendra Nayak      2023-12-05   808  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   809  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   810  
af16b00578a7a1 Rajendra Nayak      2023-12-05   811  		qupv3_2: geniqup@8c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   812  			compatible = "qcom,geni-se-qup";
af16b00578a7a1 Rajendra Nayak      2023-12-05   813  			reg = <0 0x008c0000 0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   814  
af16b00578a7a1 Rajendra Nayak      2023-12-05   815  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   816  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   817  			clock-names = "m-ahb",
af16b00578a7a1 Rajendra Nayak      2023-12-05   818  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak      2023-12-05   819  
af16b00578a7a1 Rajendra Nayak      2023-12-05   820  			iommus = <&apps_smmu 0x423 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   821  
af16b00578a7a1 Rajendra Nayak      2023-12-05   822  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   823  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   824  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05   825  
af16b00578a7a1 Rajendra Nayak      2023-12-05   826  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   827  
af16b00578a7a1 Rajendra Nayak      2023-12-05   828  			i2c16: i2c@880000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   829  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05   830  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   831  
af16b00578a7a1 Rajendra Nayak      2023-12-05   832  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   833  
af16b00578a7a1 Rajendra Nayak      2023-12-05   834  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   835  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   836  
af16b00578a7a1 Rajendra Nayak      2023-12-05   837  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   838  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   839  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   840  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   841  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   842  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   843  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   844  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   845  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   846  
af16b00578a7a1 Rajendra Nayak      2023-12-05   847  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   848  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   849  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   850  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   851  
af16b00578a7a1 Rajendra Nayak      2023-12-05   852  				pinctrl-0 = <&qup_i2c16_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   853  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   854  
af16b00578a7a1 Rajendra Nayak      2023-12-05   855  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   856  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   857  
af16b00578a7a1 Rajendra Nayak      2023-12-05   858  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   859  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   860  
af16b00578a7a1 Rajendra Nayak      2023-12-05   861  			spi16: spi@880000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   862  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05   863  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   864  
af16b00578a7a1 Rajendra Nayak      2023-12-05   865  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   866  
af16b00578a7a1 Rajendra Nayak      2023-12-05   867  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   868  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   869  
af16b00578a7a1 Rajendra Nayak      2023-12-05   870  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   871  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   872  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   873  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   874  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   875  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   876  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   877  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   878  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   879  
af16b00578a7a1 Rajendra Nayak      2023-12-05   880  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   881  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   882  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   883  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   884  
af16b00578a7a1 Rajendra Nayak      2023-12-05   885  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   886  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   887  
af16b00578a7a1 Rajendra Nayak      2023-12-05   888  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   889  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   890  
af16b00578a7a1 Rajendra Nayak      2023-12-05   891  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   892  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   893  
af16b00578a7a1 Rajendra Nayak      2023-12-05   894  			i2c17: i2c@884000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   895  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05   896  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   897  
af16b00578a7a1 Rajendra Nayak      2023-12-05   898  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   899  
af16b00578a7a1 Rajendra Nayak      2023-12-05   900  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   901  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   902  
af16b00578a7a1 Rajendra Nayak      2023-12-05   903  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   904  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   905  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   906  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   907  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   908  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   909  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   910  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   911  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   912  
af16b00578a7a1 Rajendra Nayak      2023-12-05   913  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   914  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   915  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   916  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   917  
af16b00578a7a1 Rajendra Nayak      2023-12-05   918  				pinctrl-0 = <&qup_i2c17_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   919  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   920  
af16b00578a7a1 Rajendra Nayak      2023-12-05   921  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   922  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   923  
af16b00578a7a1 Rajendra Nayak      2023-12-05   924  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   925  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   926  
af16b00578a7a1 Rajendra Nayak      2023-12-05   927  			spi17: spi@884000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   928  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05   929  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   930  
af16b00578a7a1 Rajendra Nayak      2023-12-05   931  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   932  
af16b00578a7a1 Rajendra Nayak      2023-12-05   933  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   934  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   935  
af16b00578a7a1 Rajendra Nayak      2023-12-05   936  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   937  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   938  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   939  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   940  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   941  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   942  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   943  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   944  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   945  
af16b00578a7a1 Rajendra Nayak      2023-12-05   946  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   947  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   948  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   949  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   950  
af16b00578a7a1 Rajendra Nayak      2023-12-05   951  				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   952  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   953  
af16b00578a7a1 Rajendra Nayak      2023-12-05   954  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   955  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   956  
af16b00578a7a1 Rajendra Nayak      2023-12-05   957  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   958  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   959  
af16b00578a7a1 Rajendra Nayak      2023-12-05   960  			i2c18: i2c@888000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   961  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05   962  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   963  
af16b00578a7a1 Rajendra Nayak      2023-12-05   964  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   965  
af16b00578a7a1 Rajendra Nayak      2023-12-05   966  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   967  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   968  
af16b00578a7a1 Rajendra Nayak      2023-12-05   969  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   970  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   971  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   972  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   973  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   974  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   975  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   976  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   977  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   978  
af16b00578a7a1 Rajendra Nayak      2023-12-05   979  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   980  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   981  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   982  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   983  
af16b00578a7a1 Rajendra Nayak      2023-12-05   984  				pinctrl-0 = <&qup_i2c18_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   985  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   986  
af16b00578a7a1 Rajendra Nayak      2023-12-05   987  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   988  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   989  
af16b00578a7a1 Rajendra Nayak      2023-12-05   990  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   991  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   992  
af16b00578a7a1 Rajendra Nayak      2023-12-05   993  			spi18: spi@888000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   994  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05   995  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   996  
af16b00578a7a1 Rajendra Nayak      2023-12-05   997  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   998  
af16b00578a7a1 Rajendra Nayak      2023-12-05   999  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1000  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1001  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1002  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1003  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1004  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1005  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1006  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1007  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1008  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1009  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1010  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1011  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1012  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1013  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1014  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1015  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1016  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1017  				pinctrl-0 = <&qup_spi18_data_clk>, <&qup_spi18_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1018  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1019  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1020  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1021  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1022  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1023  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1024  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1025  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1026  			i2c19: i2c@88c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1027  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1028  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1029  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1030  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1031  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1032  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1033  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1034  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1035  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1036  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1037  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1038  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1039  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1040  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1041  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1042  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1043  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1044  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1045  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1046  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1047  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1048  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1049  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1050  				pinctrl-0 = <&qup_i2c19_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1051  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1052  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1053  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1054  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1055  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1056  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1057  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1058  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1059  			spi19: spi@88c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1060  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1061  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1062  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1063  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1064  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1065  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1066  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1067  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1068  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1069  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1070  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1071  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1072  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1073  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1074  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1075  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1076  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1077  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1078  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1079  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1080  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1081  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1082  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1083  				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1084  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1085  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1086  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1087  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1088  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1089  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1090  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1091  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1092  			i2c20: i2c@890000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1093  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1094  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1095  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1096  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1097  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1098  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1099  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1100  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1101  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1102  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1103  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1104  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1105  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1106  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1107  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1108  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1109  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1110  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1111  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1112  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1113  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1114  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1115  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1116  				pinctrl-0 = <&qup_i2c20_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1117  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1118  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1119  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1120  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1121  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1122  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1123  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1124  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1125  			spi20: spi@890000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1126  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1127  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1128  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1129  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1130  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1131  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1132  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1133  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1134  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1135  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1136  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1137  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1138  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1139  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1140  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1141  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1142  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1143  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1144  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1145  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1146  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1147  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1148  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1149  				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1150  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1151  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1152  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1153  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1154  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1155  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1156  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1157  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1158  			i2c21: i2c@894000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1159  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1160  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1161  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1162  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1163  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1164  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1165  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1166  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1167  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1168  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1169  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1170  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1171  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1172  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1173  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1174  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1175  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1176  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1177  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1178  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1179  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1180  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1181  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1182  				pinctrl-0 = <&qup_i2c21_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1183  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1184  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1185  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1186  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1187  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1188  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1189  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1190  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1191  			spi21: spi@894000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1192  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1193  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1194  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1195  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1196  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1197  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1198  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1199  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1200  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1201  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1202  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1203  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1204  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1205  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1206  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1207  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1208  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1209  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1210  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1211  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1212  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1213  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1214  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1215  				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1216  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1217  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1218  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1219  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1220  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1221  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1222  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1223  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1224  			uart21: serial@894000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1225  				compatible = "qcom,geni-uart";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1226  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1227  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1228  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1229  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1230  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1231  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1232  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1233  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1234  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1235  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1236  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1237  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1238  						     "qup-config";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1239  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1240  				pinctrl-0 = <&qup_uart21_default>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1241  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1242  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1243  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1244  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1245  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1246  			i2c22: i2c@898000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1247  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1248  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1249  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1250  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1251  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1252  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1253  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1254  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1255  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1256  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1257  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1258  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1259  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1260  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1261  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1262  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1263  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1264  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1265  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1266  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1267  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1268  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1269  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1270  				pinctrl-0 = <&qup_i2c22_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1271  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1272  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1273  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1274  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1275  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1276  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1277  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1278  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1279  			spi22: spi@898000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1280  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1281  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1282  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1283  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1284  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1285  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1286  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1287  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1288  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1289  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1290  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1291  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1292  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1293  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1294  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1295  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1296  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1297  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1298  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1299  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1300  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1301  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1302  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1303  				pinctrl-0 = <&qup_spi22_data_clk>, <&qup_spi22_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1304  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1305  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1306  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1307  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1308  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1309  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1310  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1311  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1312  			i2c23: i2c@89c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1313  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1314  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1315  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1316  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1317  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1318  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1319  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1320  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1321  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1322  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1323  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1324  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1325  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1326  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1327  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1328  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1329  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1330  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1331  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1332  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1333  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1334  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1335  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1336  				pinctrl-0 = <&qup_i2c23_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1337  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1338  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1339  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1340  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1341  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1342  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1343  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1344  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1345  			spi23: spi@89c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1346  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1347  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1348  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1349  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1350  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1351  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1352  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1353  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1354  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1355  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1356  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1357  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1358  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1359  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1360  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1361  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1362  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1363  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1364  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1365  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1366  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1367  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1368  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1369  				pinctrl-0 = <&qup_spi23_data_clk>, <&qup_spi23_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1370  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1371  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1372  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1373  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1374  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1375  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1376  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1377  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1378  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1379  		gpi_dma1: dma-controller@a00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1380  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1381  			reg = <0 0x00a00000 0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1382  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1383  			interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1384  				     <GIC_SPI 777 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1385  				     <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1386  				     <GIC_SPI 779 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1387  				     <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1388  				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1389  				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1390  				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1391  				     <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1392  				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1393  				     <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1394  				     <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1395  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1396  			dma-channels = <12>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1397  			dma-channel-mask = <0x3e>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1398  			#dma-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1399  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1400  			iommus = <&apps_smmu 0x136 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1401  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1402  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1403  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1404  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1405  		qupv3_1: geniqup@ac0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1406  			compatible = "qcom,geni-se-qup";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1407  			reg = <0 0x00ac0000 0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1408  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1409  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1410  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1411  			clock-names = "m-ahb",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1412  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1413  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1414  			iommus = <&apps_smmu 0x123 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1415  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1416  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1417  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1418  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1419  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1420  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1421  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1422  			i2c8: i2c@a80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1423  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1424  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1425  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1426  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1427  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1428  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1429  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1430  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1431  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1432  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1433  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1434  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1435  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1436  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1437  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1438  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1439  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1440  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1441  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1442  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1443  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1444  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1445  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1446  				pinctrl-0 = <&qup_i2c8_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1447  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1448  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1449  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1450  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1451  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1452  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1453  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1454  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1455  			spi8: spi@a80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1456  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1457  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1458  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1459  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1460  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1461  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1462  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1463  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1464  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1465  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1466  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1467  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1468  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1469  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1470  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1471  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1472  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1473  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1474  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1475  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1476  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1477  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1478  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1479  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1480  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1481  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1482  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1483  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1484  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1485  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1486  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1487  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1488  			i2c9: i2c@a84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1489  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1490  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1491  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1492  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1493  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1494  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1495  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1496  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1497  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1498  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1499  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1500  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1501  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1502  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1503  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1504  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1505  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1506  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1507  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1508  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1509  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1510  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1511  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1512  				pinctrl-0 = <&qup_i2c9_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1513  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1514  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1515  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1516  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1517  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1518  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1519  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1520  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1521  			spi9: spi@a84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1522  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1523  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1524  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1525  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1526  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1527  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1528  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1529  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1530  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1531  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1532  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1533  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1534  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1535  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1536  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1537  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1538  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1539  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1540  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1541  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1542  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1543  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1544  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1545  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1546  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1547  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1548  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1549  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1550  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1551  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1552  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1553  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1554  			i2c10: i2c@a88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1555  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1556  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1557  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1558  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1559  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1560  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1561  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1562  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1563  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1564  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1565  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1566  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1567  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1568  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1569  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1570  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1571  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1572  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1573  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1574  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1575  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1576  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1577  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1578  				pinctrl-0 = <&qup_i2c10_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1579  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1580  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1581  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1582  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1583  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1584  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1585  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1586  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1587  			spi10: spi@a88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1588  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1589  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1590  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1591  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1592  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1593  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1594  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1595  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1596  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1597  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1598  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1599  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1600  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1601  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1602  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1603  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1604  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1605  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1606  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1607  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1608  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1609  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1610  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1611  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1612  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1613  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1614  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1615  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1616  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1617  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1618  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1619  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1620  			i2c11: i2c@a8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1621  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1622  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1623  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1624  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1625  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1626  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1627  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1628  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1629  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1630  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1631  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1632  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1633  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1634  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1635  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1636  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1637  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1638  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1639  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1640  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1641  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1642  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1643  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1644  				pinctrl-0 = <&qup_i2c11_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1645  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1646  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1647  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1648  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1649  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1650  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1651  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1652  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1653  			spi11: spi@a8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1654  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1655  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1656  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1657  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1658  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1659  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1660  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1661  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1662  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1663  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1664  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1665  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1666  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1667  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1668  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1669  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1670  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1671  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1672  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1673  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1674  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1675  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1676  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1677  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1678  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1679  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1680  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1681  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1682  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1683  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1684  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1685  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1686  			i2c12: i2c@a90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1687  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1688  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1689  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1690  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1691  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1692  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1693  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1694  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1695  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1696  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1697  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1698  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1699  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1700  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1701  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1702  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1703  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1704  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1705  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1706  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1707  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1708  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1709  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1710  				pinctrl-0 = <&qup_i2c12_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1711  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1712  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1713  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1714  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1715  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1716  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1717  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1718  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1719  			spi12: spi@a90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1720  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1721  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1722  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1723  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1724  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1725  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1726  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1727  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1728  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1729  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1730  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1731  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1732  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1733  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1734  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1735  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1736  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1737  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1738  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1739  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1740  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1741  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1742  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1743  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1744  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1745  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1746  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1747  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1748  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1749  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1750  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1751  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1752  			i2c13: i2c@a94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1753  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1754  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1755  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1756  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1757  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1758  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1759  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1760  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1761  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1762  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1763  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1764  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1765  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1766  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1767  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1768  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1769  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1770  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1771  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1772  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1773  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1774  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1775  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1776  				pinctrl-0 = <&qup_i2c13_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1777  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1778  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1779  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1780  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1781  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1782  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1783  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1784  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1785  			spi13: spi@a94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1786  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1787  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1788  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1789  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1790  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1791  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1792  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1793  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1794  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1795  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1796  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1797  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1798  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1799  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1800  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1801  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1802  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1803  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1804  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1805  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1806  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1807  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1808  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1809  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1810  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1811  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1812  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1813  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1814  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1815  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1816  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1817  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1818  			i2c14: i2c@a98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1819  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1820  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1821  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1822  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1823  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1824  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1825  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1826  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1827  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1828  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1829  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1830  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1831  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1832  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1833  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1834  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1835  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1836  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1837  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1838  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1839  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1840  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1841  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1842  				pinctrl-0 = <&qup_i2c14_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1843  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1844  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1845  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1846  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1847  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1848  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1849  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1850  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1851  			spi14: spi@a98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1852  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1853  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1854  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1855  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1856  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1857  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1858  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1859  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1860  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1861  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1862  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1863  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1864  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1865  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1866  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1867  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1868  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1869  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1870  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1871  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1872  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1873  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1874  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1875  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1876  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1877  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1878  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1879  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1880  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1881  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1882  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1883  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1884  			i2c15: i2c@a9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1885  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1886  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1887  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1888  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1889  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1890  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1891  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1892  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1893  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1894  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1895  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1896  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1897  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1898  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1899  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1900  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1901  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1902  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1903  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1904  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1905  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1906  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1907  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1908  				pinctrl-0 = <&qup_i2c15_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1909  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1910  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1911  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1912  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1913  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1914  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1915  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1916  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1917  			spi15: spi@a9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1918  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1919  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1920  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1921  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1922  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1923  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1924  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1925  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1926  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1927  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1928  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1929  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1930  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1931  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1932  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1933  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1934  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1935  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1936  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1937  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1938  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1939  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1940  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1941  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1942  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1943  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1944  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1945  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1946  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1947  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1948  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1949  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1950  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1951  		gpi_dma0: dma-controller@b00000  {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1952  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1953  			reg = <0 0x00b00000 0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1954  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1955  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1956  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1957  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1958  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1959  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1960  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1961  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1962  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1963  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1964  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1965  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1966  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1967  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1968  			dma-channels = <12>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1969  			dma-channel-mask = <0x3e>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1970  			#dma-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1971  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1972  			iommus = <&apps_smmu 0x456 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1973  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1974  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1975  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1976  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1977  		qupv3_0: geniqup@bc0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1978  			compatible = "qcom,geni-se-qup";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1979  			reg = <0 0x00bc0000 0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1980  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1981  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1982  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1983  			clock-names = "m-ahb",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1984  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1985  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1986  			iommus = <&apps_smmu 0x443 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1987  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1988  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1989  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1990  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1991  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1992  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1993  			i2c0: i2c@b80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1994  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1995  				reg = <0 0xb80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1996  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1997  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1998  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1999  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2000  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2001  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2002  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2003  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2004  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2005  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2006  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2007  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2008  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2009  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2010  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2011  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2012  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2013  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2014  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2015  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2016  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2017  				pinctrl-0 = <&qup_i2c0_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2018  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2019  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2020  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2021  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2022  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2023  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2024  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2025  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2026  			spi0: spi@b80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2027  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2028  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2029  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2030  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2031  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2032  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2033  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2034  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2035  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2036  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2037  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2038  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2039  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2040  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2041  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2042  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2043  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2044  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2045  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2046  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2047  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2048  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2049  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2050  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2051  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2052  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2053  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2054  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2055  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2056  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2057  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2058  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2059  			i2c1: i2c@b84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2060  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2061  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2062  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2063  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2064  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2065  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2066  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2067  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2068  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2069  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2070  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2071  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2072  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2073  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2074  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2075  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2076  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2077  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2078  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2079  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2080  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2081  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2082  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2083  				pinctrl-0 = <&qup_i2c1_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2084  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2085  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2086  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2087  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2088  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2089  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2090  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2091  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2092  			spi1: spi@b84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2093  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2094  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2095  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2096  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2097  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2098  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2099  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2100  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2101  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2102  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2103  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2104  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2105  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2106  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2107  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2108  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2109  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2110  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2111  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2112  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2113  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2114  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2115  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2116  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2117  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2118  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2119  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2120  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2121  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2122  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2123  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2124  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2125  			i2c2: i2c@b88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2126  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2127  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2128  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2129  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2130  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2131  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2132  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2133  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2134  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2135  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2136  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2137  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2138  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2139  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2140  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2141  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2142  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2143  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2144  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2145  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2146  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2147  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2148  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2149  				pinctrl-0 = <&qup_i2c2_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2150  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2151  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2152  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2153  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2154  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2155  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2156  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2157  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2158  			spi2: spi@b88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2159  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2160  				reg = <0 0xb88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2161  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2162  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2163  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2164  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2165  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2166  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2167  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2168  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2169  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2170  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2171  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2172  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2173  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2174  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2175  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2176  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2177  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2178  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2179  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2180  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2181  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2182  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2183  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2184  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2185  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2186  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2187  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2188  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2189  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2190  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2191  			i2c3: i2c@b8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2192  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2193  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2194  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2195  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2196  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2197  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2198  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2199  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2200  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2201  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2202  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2203  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2204  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2205  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2206  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2207  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2208  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2209  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2210  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2211  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2212  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2213  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2214  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2215  				pinctrl-0 = <&qup_i2c3_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2216  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2217  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2218  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2219  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2220  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2221  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2222  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2223  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2224  			spi3: spi@b8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2225  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2226  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2227  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2228  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2229  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2230  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2231  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2232  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2233  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2234  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2235  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2236  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2237  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2238  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2239  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2240  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2241  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2242  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2243  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2244  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2245  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2246  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2247  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2248  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2249  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2250  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2251  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2252  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2253  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2254  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2255  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2256  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2257  			i2c4: i2c@b90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2258  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2259  				reg = <0 0xb90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2260  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2261  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2262  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2263  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2264  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2265  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2266  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2267  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2268  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2269  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2270  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2271  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2272  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2273  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2274  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2275  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2276  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2277  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2278  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2279  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2280  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2281  				pinctrl-0 = <&qup_i2c4_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2282  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2283  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2284  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2285  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2286  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2287  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2288  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2289  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2290  			spi4: spi@b90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2291  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2292  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2293  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2294  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2295  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2296  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2297  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2298  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2299  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2300  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2301  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2302  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2303  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2304  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2305  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2306  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2307  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2308  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2309  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2310  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2311  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2312  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2313  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2314  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2315  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2316  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2317  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2318  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2319  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2320  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2321  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2322  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2323  			i2c5: i2c@b94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2324  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2325  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2326  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2327  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2328  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2329  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2330  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2331  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2332  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2333  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2334  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2335  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2336  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2337  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2338  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2339  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2340  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2341  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2342  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2343  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2344  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2345  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2346  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2347  				pinctrl-0 = <&qup_i2c5_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2348  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2349  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2350  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2351  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2352  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2353  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2354  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2355  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2356  			spi5: spi@b94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2357  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2358  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2359  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2360  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2361  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2362  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2363  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2364  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2365  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2366  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2367  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2368  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2369  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2370  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2371  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2372  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2373  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2374  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2375  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2376  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2377  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2378  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2379  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2380  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2381  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2382  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2383  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2384  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2385  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2386  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2387  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2388  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2389  			i2c6: i2c@b98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2390  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2391  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2392  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2393  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2394  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2395  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2396  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2397  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2398  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2399  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2400  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2401  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2402  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2403  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2404  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2405  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2406  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2407  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2408  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2409  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2410  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2411  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2412  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2413  				pinctrl-0 = <&qup_i2c6_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2414  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2415  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2416  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2417  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2418  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2419  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2420  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2421  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2422  			spi6: spi@b98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2423  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2424  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2425  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2426  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2427  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2428  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2429  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2430  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2431  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2432  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2433  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2434  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2435  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2436  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2437  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2438  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2439  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2440  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2441  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2442  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2443  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2444  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2445  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2446  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2447  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2448  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2449  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2450  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2451  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2452  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2453  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2454  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2455  			i2c7: i2c@b9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2456  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2457  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2458  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2459  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2460  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2461  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2462  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2463  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2464  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2465  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2466  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2467  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2468  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2469  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2470  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2471  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2472  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2473  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2474  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2475  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2476  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2477  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2478  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2479  				pinctrl-0 = <&qup_i2c7_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2480  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2481  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2482  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2483  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2484  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2485  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2486  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2487  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2488  			spi7: spi@b9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2489  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2490  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2491  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2492  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2493  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2494  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2495  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2496  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2497  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2498  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2499  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2500  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2501  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2502  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2503  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2504  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2505  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2506  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2507  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2508  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2509  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2510  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2511  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2512  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2513  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2514  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2515  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2516  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2517  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2518  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2519  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2520  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2521  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2522  		tsens0: thermal-sensor@c271000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2523  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2524  			reg = <0 0x0c271000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2525  			      <0 0x0c222000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2526  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2527  			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2528  					      <&intc GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2529  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2530  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2531  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2532  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2533  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2534  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2535  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2536  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2537  		tsens1: thermal-sensor@c272000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2538  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2539  			reg = <0 0x0c272000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2540  			      <0 0x0c223000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2541  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2542  			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2543  					      <&intc GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2544  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2545  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2546  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2547  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2548  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2549  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2550  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2551  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2552  		tsens2: thermal-sensor@c273000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2553  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2554  			reg = <0 0x0c273000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2555  			      <0 0x0c224000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2556  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2557  			interrupts-extended = <&pdc 28 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2558  					      <&intc GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2559  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2560  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2561  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2562  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2563  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2564  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2565  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2566  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2567  		tsens3: thermal-sensor@c274000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2568  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2569  			reg = <0 0x0c274000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2570  			      <0 0x0c225000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2571  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2572  			interrupts-extended = <&pdc 29 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2573  					      <&intc GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2574  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2575  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2576  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2577  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2578  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2579  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2580  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2581  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2582  		usb_1_ss0_hsphy: phy@fd3000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2583  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2584  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2585  			reg = <0 0x00fd3000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2586  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2587  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2588  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2589  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2590  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2591  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2592  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2593  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2594  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2595  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2596  		usb_1_ss0_qmpphy: phy@fd5000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2597  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2598  			reg = <0 0x00fd5000 0 0x4000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2599  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2600  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2601  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2602  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2603  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2604  			clock-names = "aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2605  				      "ref",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2606  				      "com_aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2607  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2608  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2609  			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2610  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2611  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2612  				 <&gcc GCC_USB4_0_DP0_PHY_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2613  			reset-names = "phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2614  				      "common";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2615  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2616  			#clock-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2617  			#phy-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2618  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2619  			status = "disabled";
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2620  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2621  			ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2622  				#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2623  				#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2624  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2625  				port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2626  					reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2627  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2628  					usb_1_ss0_qmpphy_out: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2629  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2630  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2631  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2632  				port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2633  					reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2634  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2635  					usb_1_ss0_qmpphy_usb_ss_in: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2636  						remote-endpoint = <&usb_1_ss0_dwc3_ss>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2637  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2638  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2639  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2640  				port@2 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2641  					reg = <2>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2642  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2643  					usb_1_ss0_qmpphy_dp_in: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  2644  						remote-endpoint = <&mdss_dp0_out>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2645  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2646  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2647  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2648  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2649  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2650  		usb_1_ss1_hsphy: phy@fd9000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2651  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2652  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2653  			reg = <0 0x00fd9000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2654  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2655  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2656  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2657  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2658  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2659  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2660  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2661  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2662  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2663  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2664  		usb_1_ss1_qmpphy: phy@fda000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2665  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2666  			reg = <0 0x00fda000 0 0x4000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2667  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2668  			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2669  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2670  				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2671  				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2672  			clock-names = "aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2673  				      "ref",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2674  				      "com_aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2675  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2676  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2677  			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2678  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2679  			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2680  				 <&gcc GCC_USB4_1_DP0_PHY_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2681  			reset-names = "phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2682  				      "common";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2683  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2684  			#clock-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2685  			#phy-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2686  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2687  			status = "disabled";
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2688  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2689  			ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2690  				#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2691  				#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2692  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2693  				port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2694  					reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2695  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2696  					usb_1_ss1_qmpphy_out: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2697  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2698  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2699  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2700  				port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2701  					reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2702  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2703  					usb_1_ss1_qmpphy_usb_ss_in: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2704  						remote-endpoint = <&usb_1_ss1_dwc3_ss>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2705  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2706  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2707  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2708  				port@2 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2709  					reg = <2>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2710  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2711  					usb_1_ss1_qmpphy_dp_in: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  2712  						remote-endpoint = <&mdss_dp1_out>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2713  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2714  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2715  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2716  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2717  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2718  		usb_1_ss2_hsphy: phy@fde000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2719  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2720  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2721  			reg = <0 0x00fde000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2722  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2723  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2724  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2725  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2726  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2727  			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2728  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2729  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2730  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2731  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2732  		usb_1_ss2_qmpphy: phy@fdf000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2733  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2734  			reg = <0 0x00fdf000 0 0x4000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2735  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2736  			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2737  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2738  				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2739  				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2740  			clock-names = "aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2741  				      "ref",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2742  				      "com_aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2743  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2744  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2745  			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2746  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2747  			resets = <&gcc GCC_USB3_PHY_TERT_BCR>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2748  				 <&gcc GCC_USB4_2_DP0_PHY_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2749  			reset-names = "phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2750  				      "common";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2751  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2752  			#clock-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2753  			#phy-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2754  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2755  			status = "disabled";
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2756  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2757  			ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2758  				#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2759  				#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2760  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2761  				port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2762  					reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2763  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2764  					usb_1_ss2_qmpphy_out: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2765  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2766  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2767  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2768  				port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2769  					reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2770  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2771  					usb_1_ss2_qmpphy_usb_ss_in: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2772  						remote-endpoint = <&usb_1_ss2_dwc3_ss>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2773  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2774  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2775  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2776  				port@2 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2777  					reg = <2>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2778  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2779  					usb_1_ss2_qmpphy_dp_in: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  2780  						remote-endpoint = <&mdss_dp2_out>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2781  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2782  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2783  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2784  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2785  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2786  		cnoc_main: interconnect@1500000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2787  			compatible = "qcom,x1e80100-cnoc-main";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2788  			reg = <0 0x1500000 0 0x14400>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2789  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2790  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2791  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2792  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2793  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2794  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2795  		config_noc: interconnect@1600000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2796  			compatible = "qcom,x1e80100-cnoc-cfg";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2797  			reg = <0 0x1600000 0 0x6600>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2798  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2799  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2800  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2801  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2802  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2803  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2804  		system_noc: interconnect@1680000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2805  			compatible = "qcom,x1e80100-system-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2806  			reg = <0 0x1680000 0 0x1c080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2807  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2808  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2809  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2810  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2811  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2812  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2813  		pcie_south_anoc: interconnect@16c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2814  			compatible = "qcom,x1e80100-pcie-south-anoc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2815  			reg = <0 0x16c0000 0 0xd080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2816  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2817  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2818  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2819  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2820  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2821  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2822  		pcie_center_anoc: interconnect@16d0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2823  			compatible = "qcom,x1e80100-pcie-center-anoc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2824  			reg = <0 0x16d0000 0 0x7000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2825  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2826  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2827  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2828  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2829  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2830  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2831  		aggre1_noc: interconnect@16e0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2832  			compatible = "qcom,x1e80100-aggre1-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2833  			reg = <0 0x16E0000 0 0x14400>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2834  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2835  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2836  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2837  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2838  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2839  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2840  		aggre2_noc: interconnect@1700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2841  			compatible = "qcom,x1e80100-aggre2-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2842  			reg = <0 0x1700000 0 0x1c400>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2843  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2844  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2845  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2846  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2847  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2848  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2849  		pcie_north_anoc: interconnect@1740000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2850  			compatible = "qcom,x1e80100-pcie-north-anoc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2851  			reg = <0 0x1740000 0 0x9080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2852  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2853  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2854  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2855  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2856  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2857  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2858  		usb_center_anoc: interconnect@1750000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2859  			compatible = "qcom,x1e80100-usb-center-anoc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2860  			reg = <0 0x1750000 0 0x8800>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2861  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2862  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2863  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2864  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2865  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2866  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2867  		usb_north_anoc: interconnect@1760000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2868  			compatible = "qcom,x1e80100-usb-north-anoc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2869  			reg = <0 0x1760000 0 0x7080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2870  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2871  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2872  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2873  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2874  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2875  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2876  		usb_south_anoc: interconnect@1770000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2877  			compatible = "qcom,x1e80100-usb-south-anoc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2878  			reg = <0 0x1770000 0 0xf080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2879  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2880  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2881  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2882  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2883  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2884  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2885  		mmss_noc: interconnect@1780000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2886  			compatible = "qcom,x1e80100-mmss-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2887  			reg = <0 0x1780000 0 0x5B800>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2888  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2889  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2890  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2891  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2892  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2893  
5eb83fc10289db Abel Vesa           2024-01-29  2894  		pcie6a: pci@1bf8000 {
5eb83fc10289db Abel Vesa           2024-01-29  2895  			device_type = "pci";
5eb83fc10289db Abel Vesa           2024-01-29  2896  			compatible = "qcom,pcie-x1e80100";
5eb83fc10289db Abel Vesa           2024-01-29  2897  			reg = <0 0x01bf8000 0 0x3000>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2898  			      <0 0x70000000 0 0xf20>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2899  			      <0 0x70000f40 0 0xa8>,
5eb83fc10289db Abel Vesa           2024-01-29  2900  			      <0 0x70001000 0 0x1000>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2901  			      <0 0x70100000 0 0x100000>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2902  			      <0 0x01bfb000 0 0x1000>;
5eb83fc10289db Abel Vesa           2024-01-29  2903  			reg-names = "parf",
5eb83fc10289db Abel Vesa           2024-01-29  2904  				    "dbi",
5eb83fc10289db Abel Vesa           2024-01-29  2905  				    "elbi",
5eb83fc10289db Abel Vesa           2024-01-29  2906  				    "atu",
8e99e770f7eab8 Abel Vesa           2024-06-04  2907  				    "config",
8e99e770f7eab8 Abel Vesa           2024-06-04  2908  				    "mhi";
5eb83fc10289db Abel Vesa           2024-01-29  2909  			#address-cells = <3>;
5eb83fc10289db Abel Vesa           2024-01-29  2910  			#size-cells = <2>;
5eb83fc10289db Abel Vesa           2024-01-29  2911  			ranges = <0x01000000 0 0x00000000 0 0x70200000 0 0x100000>,
5eb83fc10289db Abel Vesa           2024-01-29  2912  				 <0x02000000 0 0x70300000 0 0x70300000 0 0x3d00000>;
5eb83fc10289db Abel Vesa           2024-01-29  2913  			bus-range = <0 0xff>;
5eb83fc10289db Abel Vesa           2024-01-29  2914  
5eb83fc10289db Abel Vesa           2024-01-29  2915  			dma-coherent;
5eb83fc10289db Abel Vesa           2024-01-29  2916  
5eb83fc10289db Abel Vesa           2024-01-29  2917  			linux,pci-domain = <7>;
5eb83fc10289db Abel Vesa           2024-01-29  2918  			num-lanes = <2>;
5eb83fc10289db Abel Vesa           2024-01-29  2919  
5eb83fc10289db Abel Vesa           2024-01-29  2920  			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2921  				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2922  				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2923  				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2924  				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2925  				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2926  				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2927  				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  2928  			interrupt-names = "msi0",
5eb83fc10289db Abel Vesa           2024-01-29  2929  					  "msi1",
5eb83fc10289db Abel Vesa           2024-01-29  2930  					  "msi2",
5eb83fc10289db Abel Vesa           2024-01-29  2931  					  "msi3",
5eb83fc10289db Abel Vesa           2024-01-29  2932  					  "msi4",
5eb83fc10289db Abel Vesa           2024-01-29  2933  					  "msi5",
5eb83fc10289db Abel Vesa           2024-01-29  2934  					  "msi6",
5eb83fc10289db Abel Vesa           2024-01-29  2935  					  "msi7";
5eb83fc10289db Abel Vesa           2024-01-29  2936  
5eb83fc10289db Abel Vesa           2024-01-29  2937  			#interrupt-cells = <1>;
5eb83fc10289db Abel Vesa           2024-01-29  2938  			interrupt-map-mask = <0 0 0 0x7>;
5eb83fc10289db Abel Vesa           2024-01-29  2939  			interrupt-map = <0 0 0 1 &intc 0 0 0 843 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2940  					<0 0 0 2 &intc 0 0 0 844 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2941  					<0 0 0 3 &intc 0 0 0 845 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2942  					<0 0 0 4 &intc 0 0 0 772 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  2943  
5eb83fc10289db Abel Vesa           2024-01-29  2944  			clocks = <&gcc GCC_PCIE_6A_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2945  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2946  				 <&gcc GCC_PCIE_6A_MSTR_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2947  				 <&gcc GCC_PCIE_6A_SLV_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2948  				 <&gcc GCC_PCIE_6A_SLV_Q2A_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2949  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2950  				 <&gcc GCC_CNOC_PCIE_SOUTH_SF_AXI_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  2951  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  2952  				      "cfg",
5eb83fc10289db Abel Vesa           2024-01-29  2953  				      "bus_master",
5eb83fc10289db Abel Vesa           2024-01-29  2954  				      "bus_slave",
5eb83fc10289db Abel Vesa           2024-01-29  2955  				      "slave_q2a",
5eb83fc10289db Abel Vesa           2024-01-29  2956  				      "noc_aggr",
5eb83fc10289db Abel Vesa           2024-01-29  2957  				      "cnoc_sf_axi";
5eb83fc10289db Abel Vesa           2024-01-29  2958  
5eb83fc10289db Abel Vesa           2024-01-29  2959  			assigned-clocks = <&gcc GCC_PCIE_6A_AUX_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  2960  			assigned-clock-rates = <19200000>;
5eb83fc10289db Abel Vesa           2024-01-29  2961  
5eb83fc10289db Abel Vesa           2024-01-29  2962  			interconnects = <&pcie_south_anoc MASTER_PCIE_6A QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  2963  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
5eb83fc10289db Abel Vesa           2024-01-29  2964  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  2965  					 &cnoc_main SLAVE_PCIE_6A QCOM_ICC_TAG_ALWAYS>;
5eb83fc10289db Abel Vesa           2024-01-29  2966  			interconnect-names = "pcie-mem",
5eb83fc10289db Abel Vesa           2024-01-29  2967  					     "cpu-pcie";
5eb83fc10289db Abel Vesa           2024-01-29  2968  
5eb83fc10289db Abel Vesa           2024-01-29  2969  			resets = <&gcc GCC_PCIE_6A_BCR>,
5eb83fc10289db Abel Vesa           2024-01-29  2970  				 <&gcc GCC_PCIE_6A_LINK_DOWN_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  2971  			reset-names = "pci",
5eb83fc10289db Abel Vesa           2024-01-29  2972  				      "link_down";
5eb83fc10289db Abel Vesa           2024-01-29  2973  
5eb83fc10289db Abel Vesa           2024-01-29  2974  			power-domains = <&gcc GCC_PCIE_6A_GDSC>;
5eb83fc10289db Abel Vesa           2024-01-29  2975  
5eb83fc10289db Abel Vesa           2024-01-29  2976  			phys = <&pcie6a_phy>;
5eb83fc10289db Abel Vesa           2024-01-29  2977  			phy-names = "pciephy";
5eb83fc10289db Abel Vesa           2024-01-29  2978  
5eb83fc10289db Abel Vesa           2024-01-29  2979  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  2980  		};
5eb83fc10289db Abel Vesa           2024-01-29  2981  
5eb83fc10289db Abel Vesa           2024-01-29  2982  		pcie6a_phy: phy@1bfc000 {
5eb83fc10289db Abel Vesa           2024-01-29  2983  			compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy";
5eb83fc10289db Abel Vesa           2024-01-29  2984  			reg = <0 0x01bfc000 0 0x2000>;
5eb83fc10289db Abel Vesa           2024-01-29  2985  
5eb83fc10289db Abel Vesa           2024-01-29  2986  			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2987  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2988  				 <&rpmhcc RPMH_CXO_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2989  				 <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2990  				 <&gcc GCC_PCIE_6A_PIPE_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  2991  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  2992  				      "cfg_ahb",
5eb83fc10289db Abel Vesa           2024-01-29  2993  				      "ref",
5eb83fc10289db Abel Vesa           2024-01-29  2994  				      "rchng",
5eb83fc10289db Abel Vesa           2024-01-29  2995  				      "pipe";
5eb83fc10289db Abel Vesa           2024-01-29  2996  
5eb83fc10289db Abel Vesa           2024-01-29  2997  			resets = <&gcc GCC_PCIE_6A_PHY_BCR>,
5eb83fc10289db Abel Vesa           2024-01-29  2998  				 <&gcc GCC_PCIE_6A_NOCSR_COM_PHY_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  2999  			reset-names = "phy",
5eb83fc10289db Abel Vesa           2024-01-29  3000  				      "phy_nocsr";
5eb83fc10289db Abel Vesa           2024-01-29  3001  
5eb83fc10289db Abel Vesa           2024-01-29  3002  			assigned-clocks = <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3003  			assigned-clock-rates = <100000000>;
5eb83fc10289db Abel Vesa           2024-01-29  3004  
5eb83fc10289db Abel Vesa           2024-01-29  3005  			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
5eb83fc10289db Abel Vesa           2024-01-29  3006  
5eb83fc10289db Abel Vesa           2024-01-29  3007  			#clock-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3008  			clock-output-names = "pcie6a_pipe_clk";
5eb83fc10289db Abel Vesa           2024-01-29  3009  
5eb83fc10289db Abel Vesa           2024-01-29  3010  			#phy-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3011  
5eb83fc10289db Abel Vesa           2024-01-29  3012  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3013  		};
5eb83fc10289db Abel Vesa           2024-01-29  3014  
5eb83fc10289db Abel Vesa           2024-01-29  3015  		pcie4: pci@1c08000 {
5eb83fc10289db Abel Vesa           2024-01-29  3016  			device_type = "pci";
5eb83fc10289db Abel Vesa           2024-01-29  3017  			compatible = "qcom,pcie-x1e80100";
5eb83fc10289db Abel Vesa           2024-01-29  3018  			reg = <0 0x01c08000 0 0x3000>,
5eb83fc10289db Abel Vesa           2024-01-29  3019  			      <0 0x7c000000 0 0xf1d>,
5eb83fc10289db Abel Vesa           2024-01-29  3020  			      <0 0x7c000f40 0 0xa8>,
5eb83fc10289db Abel Vesa           2024-01-29  3021  			      <0 0x7c001000 0 0x1000>,
5eb83fc10289db Abel Vesa           2024-01-29  3022  			      <0 0x7c100000 0 0x100000>,
5eb83fc10289db Abel Vesa           2024-01-29  3023  			      <0 0x01c0b000 0 0x1000>;
5eb83fc10289db Abel Vesa           2024-01-29  3024  			reg-names = "parf",
5eb83fc10289db Abel Vesa           2024-01-29  3025  			            "dbi",
5eb83fc10289db Abel Vesa           2024-01-29  3026  				    "elbi",
5eb83fc10289db Abel Vesa           2024-01-29  3027  				    "atu",
5eb83fc10289db Abel Vesa           2024-01-29  3028  				    "config",
5eb83fc10289db Abel Vesa           2024-01-29  3029  				    "mhi";
5eb83fc10289db Abel Vesa           2024-01-29  3030  			#address-cells = <3>;
5eb83fc10289db Abel Vesa           2024-01-29  3031  			#size-cells = <2>;
5eb83fc10289db Abel Vesa           2024-01-29  3032  			ranges = <0x01000000 0 0x00000000 0 0x7c200000 0 0x100000>,
5eb83fc10289db Abel Vesa           2024-01-29  3033  				 <0x02000000 0 0x7c300000 0 0x7c300000 0 0x3d00000>;
5eb83fc10289db Abel Vesa           2024-01-29  3034  			bus-range = <0x00 0xff>;
5eb83fc10289db Abel Vesa           2024-01-29  3035  
5eb83fc10289db Abel Vesa           2024-01-29  3036  			dma-coherent;
5eb83fc10289db Abel Vesa           2024-01-29  3037  
5eb83fc10289db Abel Vesa           2024-01-29  3038  			linux,pci-domain = <5>;
5eb83fc10289db Abel Vesa           2024-01-29  3039  			num-lanes = <2>;
5eb83fc10289db Abel Vesa           2024-01-29  3040  
5eb83fc10289db Abel Vesa           2024-01-29  3041  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3042  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3043  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3044  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3045  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3046  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3047  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3048  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  3049  			interrupt-names = "msi0",
5eb83fc10289db Abel Vesa           2024-01-29  3050  					  "msi1",
5eb83fc10289db Abel Vesa           2024-01-29  3051  					  "msi2",
5eb83fc10289db Abel Vesa           2024-01-29  3052  					  "msi3",
5eb83fc10289db Abel Vesa           2024-01-29  3053  					  "msi4",
5eb83fc10289db Abel Vesa           2024-01-29  3054  					  "msi5",
5eb83fc10289db Abel Vesa           2024-01-29  3055  					  "msi6",
5eb83fc10289db Abel Vesa           2024-01-29  3056  					  "msi7";
5eb83fc10289db Abel Vesa           2024-01-29  3057  
5eb83fc10289db Abel Vesa           2024-01-29  3058  			#interrupt-cells = <1>;
5eb83fc10289db Abel Vesa           2024-01-29  3059  			interrupt-map-mask = <0 0 0 0x7>;
5eb83fc10289db Abel Vesa           2024-01-29  3060  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3061  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3062  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3063  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  3064  
5eb83fc10289db Abel Vesa           2024-01-29  3065  			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3066  				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3067  				 <&gcc GCC_PCIE_4_MSTR_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3068  				 <&gcc GCC_PCIE_4_SLV_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3069  				 <&gcc GCC_PCIE_4_SLV_Q2A_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3070  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3071  				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3072  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  3073  				      "cfg",
5eb83fc10289db Abel Vesa           2024-01-29  3074  				      "bus_master",
5eb83fc10289db Abel Vesa           2024-01-29  3075  				      "bus_slave",
5eb83fc10289db Abel Vesa           2024-01-29  3076  				      "slave_q2a",
5eb83fc10289db Abel Vesa           2024-01-29  3077  				      "noc_aggr",
5eb83fc10289db Abel Vesa           2024-01-29  3078  				      "cnoc_sf_axi";
5eb83fc10289db Abel Vesa           2024-01-29  3079  
5eb83fc10289db Abel Vesa           2024-01-29  3080  			assigned-clocks = <&gcc GCC_PCIE_4_AUX_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3081  			assigned-clock-rates = <19200000>;
5eb83fc10289db Abel Vesa           2024-01-29  3082  
5eb83fc10289db Abel Vesa           2024-01-29  3083  			interconnects = <&pcie_south_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  3084  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
5eb83fc10289db Abel Vesa           2024-01-29  3085  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  3086  					 &cnoc_main SLAVE_PCIE_4 QCOM_ICC_TAG_ALWAYS>;
5eb83fc10289db Abel Vesa           2024-01-29  3087  			interconnect-names = "pcie-mem",
5eb83fc10289db Abel Vesa           2024-01-29  3088  					     "cpu-pcie";
5eb83fc10289db Abel Vesa           2024-01-29  3089  
5eb83fc10289db Abel Vesa           2024-01-29  3090  			resets = <&gcc GCC_PCIE_4_BCR>,
5eb83fc10289db Abel Vesa           2024-01-29  3091  				 <&gcc GCC_PCIE_4_LINK_DOWN_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  3092  			reset-names = "pci",
5eb83fc10289db Abel Vesa           2024-01-29  3093  				      "link_down";
5eb83fc10289db Abel Vesa           2024-01-29  3094  
5eb83fc10289db Abel Vesa           2024-01-29  3095  			power-domains = <&gcc GCC_PCIE_4_GDSC>;
5eb83fc10289db Abel Vesa           2024-01-29  3096  
5eb83fc10289db Abel Vesa           2024-01-29  3097  			phys = <&pcie4_phy>;
5eb83fc10289db Abel Vesa           2024-01-29  3098  			phy-names = "pciephy";
5eb83fc10289db Abel Vesa           2024-01-29  3099  
5eb83fc10289db Abel Vesa           2024-01-29  3100  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3101  		};
5eb83fc10289db Abel Vesa           2024-01-29  3102  
5eb83fc10289db Abel Vesa           2024-01-29  3103  		pcie4_phy: phy@1c0e000 {
5eb83fc10289db Abel Vesa           2024-01-29  3104  			compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy";
5eb83fc10289db Abel Vesa           2024-01-29  3105  			reg = <0 0x01c0e000 0 0x2000>;
5eb83fc10289db Abel Vesa           2024-01-29  3106  
5eb83fc10289db Abel Vesa           2024-01-29  3107  			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3108  				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3109  				 <&rpmhcc RPMH_CXO_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3110  				 <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3111  				 <&gcc GCC_PCIE_4_PIPE_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3112  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  3113  				      "cfg_ahb",
5eb83fc10289db Abel Vesa           2024-01-29  3114  				      "ref",
5eb83fc10289db Abel Vesa           2024-01-29  3115  				      "rchng",
5eb83fc10289db Abel Vesa           2024-01-29  3116  				      "pipe";
5eb83fc10289db Abel Vesa           2024-01-29  3117  
5eb83fc10289db Abel Vesa           2024-01-29  3118  			resets = <&gcc GCC_PCIE_4_PHY_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  3119  			reset-names = "phy";
5eb83fc10289db Abel Vesa           2024-01-29  3120  
5eb83fc10289db Abel Vesa           2024-01-29  3121  			assigned-clocks = <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3122  			assigned-clock-rates = <100000000>;
5eb83fc10289db Abel Vesa           2024-01-29  3123  
5eb83fc10289db Abel Vesa           2024-01-29  3124  			power-domains = <&gcc GCC_PCIE_4_PHY_GDSC>;
5eb83fc10289db Abel Vesa           2024-01-29  3125  
5eb83fc10289db Abel Vesa           2024-01-29  3126  			#clock-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3127  			clock-output-names = "pcie4_pipe_clk";
5eb83fc10289db Abel Vesa           2024-01-29  3128  
5eb83fc10289db Abel Vesa           2024-01-29  3129  			#phy-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3130  
5eb83fc10289db Abel Vesa           2024-01-29  3131  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3132  		};
5eb83fc10289db Abel Vesa           2024-01-29  3133  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3134  		tcsr_mutex: hwlock@1f40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3135  			compatible = "qcom,tcsr-mutex";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3136  			reg = <0 0x01f40000 0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3137  			#hwlock-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3138  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3139  
8b6e2bf94b278c Abel Vesa           2024-01-29  3140  		tcsr: clock-controller@1fc0000 {
8b6e2bf94b278c Abel Vesa           2024-01-29  3141  			compatible = "qcom,x1e80100-tcsr", "syscon";
8b6e2bf94b278c Abel Vesa           2024-01-29  3142  			reg = <0 0x01fc0000 0 0x30000>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3143  			clocks = <&rpmhcc RPMH_CXO_CLK>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3144  			#clock-cells = <1>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3145  			#reset-cells = <1>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3146  		};
8b6e2bf94b278c Abel Vesa           2024-01-29  3147  
721e38301b79a6 Akhil P Oommen      2024-06-29  3148  		gpu: gpu@3d00000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3149  			compatible = "qcom,adreno-43050c01", "qcom,adreno";
721e38301b79a6 Akhil P Oommen      2024-06-29  3150  			reg = <0x0 0x03d00000 0x0 0x40000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3151  			      <0x0 0x03d9e000 0x0 0x1000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3152  			      <0x0 0x03d61000 0x0 0x800>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3153  
721e38301b79a6 Akhil P Oommen      2024-06-29  3154  			reg-names = "kgsl_3d0_reg_memory",
721e38301b79a6 Akhil P Oommen      2024-06-29  3155  				    "cx_mem",
721e38301b79a6 Akhil P Oommen      2024-06-29  3156  				    "cx_dbgc";
721e38301b79a6 Akhil P Oommen      2024-06-29  3157  
721e38301b79a6 Akhil P Oommen      2024-06-29  3158  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3159  
721e38301b79a6 Akhil P Oommen      2024-06-29  3160  			iommus = <&adreno_smmu 0 0x0>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3161  				 <&adreno_smmu 1 0x0>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3162  
721e38301b79a6 Akhil P Oommen      2024-06-29  3163  			operating-points-v2 = <&gpu_opp_table>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3164  
721e38301b79a6 Akhil P Oommen      2024-06-29  3165  			qcom,gmu = <&gmu>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3166  			#cooling-cells = <2>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3167  
721e38301b79a6 Akhil P Oommen      2024-06-29  3168  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3169  			interconnect-names = "gfx-mem";
721e38301b79a6 Akhil P Oommen      2024-06-29  3170  
721e38301b79a6 Akhil P Oommen      2024-06-29  3171  			zap-shader {
721e38301b79a6 Akhil P Oommen      2024-06-29  3172  				memory-region = <&gpu_microcode_mem>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3173  				firmware-name = "qcom/gen70500_zap.mbn";
721e38301b79a6 Akhil P Oommen      2024-06-29  3174  			};
721e38301b79a6 Akhil P Oommen      2024-06-29  3175  
721e38301b79a6 Akhil P Oommen      2024-06-29  3176  			gpu_opp_table: opp-table {
721e38301b79a6 Akhil P Oommen      2024-06-29  3177  				compatible = "operating-points-v2";
721e38301b79a6 Akhil P Oommen      2024-06-29  3178  
721e38301b79a6 Akhil P Oommen      2024-06-29  3179  				opp-1100000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3180  					opp-hz = /bits/ 64 <1100000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3181  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3182  					opp-peak-kBps = <16500000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3183  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3184  
721e38301b79a6 Akhil P Oommen      2024-06-29  3185  				opp-1000000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3186  					opp-hz = /bits/ 64 <1000000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3187  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3188  					opp-peak-kBps = <14398438>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3189  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3190  
721e38301b79a6 Akhil P Oommen      2024-06-29  3191  				opp-925000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3192  					opp-hz = /bits/ 64 <925000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3193  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3194  					opp-peak-kBps = <14398438>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3195  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3196  
721e38301b79a6 Akhil P Oommen      2024-06-29  3197  				opp-800000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3198  					opp-hz = /bits/ 64 <800000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3199  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3200  					opp-peak-kBps = <12449219>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3201  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3202  
721e38301b79a6 Akhil P Oommen      2024-06-29  3203  				opp-744000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3204  					opp-hz = /bits/ 64 <744000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3205  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3206  					opp-peak-kBps = <10687500>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3207  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3208  
721e38301b79a6 Akhil P Oommen      2024-06-29  3209  				opp-687000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3210  					opp-hz = /bits/ 64 <687000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3211  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3212  					opp-peak-kBps = <8171875>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3213  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3214  
721e38301b79a6 Akhil P Oommen      2024-06-29  3215  				opp-550000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3216  					opp-hz = /bits/ 64 <550000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3217  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3218  					opp-peak-kBps = <6074219>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3219  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3220  
721e38301b79a6 Akhil P Oommen      2024-06-29  3221  				opp-390000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3222  					opp-hz = /bits/ 64 <390000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3223  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3224  					opp-peak-kBps = <3000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3225  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3226  
721e38301b79a6 Akhil P Oommen      2024-06-29  3227  				opp-300000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3228  					opp-hz = /bits/ 64 <300000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3229  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3230  					opp-peak-kBps = <2136719>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3231  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3232  			};
721e38301b79a6 Akhil P Oommen      2024-06-29  3233  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3234  
721e38301b79a6 Akhil P Oommen      2024-06-29  3235  		gmu: gmu@3d6a000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3236  			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
721e38301b79a6 Akhil P Oommen      2024-06-29  3237  			reg = <0x0 0x03d6a000 0x0 0x35000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3238  			      <0x0 0x03d50000 0x0 0x10000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3239  			      <0x0 0x0b280000 0x0 0x10000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3240  			reg-names =  "gmu", "rscc", "gmu_pdc";
721e38301b79a6 Akhil P Oommen      2024-06-29  3241  
721e38301b79a6 Akhil P Oommen      2024-06-29  3242  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3243  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3244  			interrupt-names = "hfi", "gmu";
721e38301b79a6 Akhil P Oommen      2024-06-29  3245  
721e38301b79a6 Akhil P Oommen      2024-06-29  3246  			clocks = <&gpucc GPU_CC_AHB_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3247  				 <&gpucc GPU_CC_CX_GMU_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3248  				 <&gpucc GPU_CC_CXO_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3249  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3250  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3251  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3252  				 <&gpucc GPU_CC_DEMET_CLK>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3253  			clock-names = "ahb",
721e38301b79a6 Akhil P Oommen      2024-06-29  3254  				      "gmu",
721e38301b79a6 Akhil P Oommen      2024-06-29  3255  				      "cxo",
721e38301b79a6 Akhil P Oommen      2024-06-29  3256  				      "axi",
721e38301b79a6 Akhil P Oommen      2024-06-29  3257  				      "memnoc",
721e38301b79a6 Akhil P Oommen      2024-06-29  3258  				      "hub",
721e38301b79a6 Akhil P Oommen      2024-06-29  3259  				      "demet";
721e38301b79a6 Akhil P Oommen      2024-06-29  3260  
721e38301b79a6 Akhil P Oommen      2024-06-29  3261  			power-domains = <&gpucc GPU_CX_GDSC>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3262  					<&gpucc GPU_GX_GDSC>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3263  			power-domain-names = "cx",
721e38301b79a6 Akhil P Oommen      2024-06-29  3264  					     "gx";
721e38301b79a6 Akhil P Oommen      2024-06-29  3265  
721e38301b79a6 Akhil P Oommen      2024-06-29  3266  			iommus = <&adreno_smmu 5 0x0>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3267  
721e38301b79a6 Akhil P Oommen      2024-06-29  3268  			qcom,qmp = <&aoss_qmp>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3269  
721e38301b79a6 Akhil P Oommen      2024-06-29  3270  			operating-points-v2 = <&gmu_opp_table>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3271  
721e38301b79a6 Akhil P Oommen      2024-06-29  3272  			gmu_opp_table: opp-table {
721e38301b79a6 Akhil P Oommen      2024-06-29  3273  				compatible = "operating-points-v2";
721e38301b79a6 Akhil P Oommen      2024-06-29  3274  
721e38301b79a6 Akhil P Oommen      2024-06-29  3275  				opp-550000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3276  					opp-hz = /bits/ 64 <550000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3277  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3278  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3279  
721e38301b79a6 Akhil P Oommen      2024-06-29  3280  				opp-220000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3281  					opp-hz = /bits/ 64 <220000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3282  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3283  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3284  			};
721e38301b79a6 Akhil P Oommen      2024-06-29  3285  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3286  
721e38301b79a6 Akhil P Oommen      2024-06-29  3287  		gpucc: clock-controller@3d90000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3288  			compatible = "qcom,x1e80100-gpucc";
721e38301b79a6 Akhil P Oommen      2024-06-29  3289  			reg = <0 0x03d90000 0 0xa000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3290  			clocks = <&bi_tcxo_div2>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3291  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3292  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3293  			#clock-cells = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3294  			#reset-cells = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3295  			#power-domain-cells = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3296  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3297  
721e38301b79a6 Akhil P Oommen      2024-06-29  3298  		adreno_smmu: iommu@3da0000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3299  			compatible = "qcom,x1e80100-smmu-500", "qcom,adreno-smmu",
721e38301b79a6 Akhil P Oommen      2024-06-29  3300  				     "qcom,smmu-500", "arm,mmu-500";
721e38301b79a6 Akhil P Oommen      2024-06-29  3301  			reg = <0x0 0x03da0000 0x0 0x40000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3302  			#iommu-cells = <2>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3303  			#global-interrupts = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3304  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3305  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3306  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3307  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3308  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3309  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3310  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3311  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3312  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3313  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3314  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3315  				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3316  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3317  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3318  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3319  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3320  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3321  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3322  				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3323  				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3324  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3325  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3326  				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3327  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3328  				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3329  				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3330  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3331  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3332  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3333  				 <&gpucc GPU_CC_AHB_CLK>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3334  			clock-names = "hlos",
721e38301b79a6 Akhil P Oommen      2024-06-29  3335  				      "bus",
721e38301b79a6 Akhil P Oommen      2024-06-29  3336  				      "iface",
721e38301b79a6 Akhil P Oommen      2024-06-29  3337  				      "ahb";
721e38301b79a6 Akhil P Oommen      2024-06-29  3338  			power-domains = <&gpucc GPU_CX_GDSC>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3339  			dma-coherent;
721e38301b79a6 Akhil P Oommen      2024-06-29  3340  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3341  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3342  		gem_noc: interconnect@26400000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3343  			compatible = "qcom,x1e80100-gem-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3344  			reg = <0 0x26400000 0 0x311200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3345  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3346  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3347  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3348  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3349  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3350  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3351  		nsp_noc: interconnect@320c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3352  			compatible = "qcom,x1e80100-nsp-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3353  			reg = <0 0x320C0000 0 0xE080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3354  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3355  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3356  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3357  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3358  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3359  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3360  		lpass_wsa2macro: codec@6aa0000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3361  			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3362  			reg = <0 0x06aa0000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3363  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3364  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3365  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3366  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3367  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3368  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3369  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3370  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3371  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3372  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3373  			clock-output-names = "wsa2-mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3374  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3375  			sound-name-prefix = "WSA2";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3376  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3377  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3378  		swr3: soundwire@6ab0000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3379  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3380  			reg = <0 0x06ab0000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3381  			clocks = <&lpass_wsa2macro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3382  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3383  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3384  			label = "WSA2";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3385  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3386  			pinctrl-0 = <&wsa2_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3387  			pinctrl-names = "default";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3388  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3389  			qcom,din-ports = <4>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3390  			qcom,dout-ports = <9>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3391  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3392  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3393  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3394  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3395  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3396  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3397  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3398  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3399  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3400  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3401  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3402  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3403  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3404  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3405  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3406  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3407  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3408  		lpass_rxmacro: codec@6ac0000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3409  			compatible = "qcom,x1e80100-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3410  			reg = <0 0x06ac0000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3411  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3412  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3413  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3414  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3415  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3416  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3417  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3418  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3419  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3420  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3421  			clock-output-names = "mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3422  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3423  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3424  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3425  		swr1: soundwire@6ad0000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3426  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3427  			reg = <0 0x06ad0000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3428  			clocks = <&lpass_rxmacro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3429  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3430  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3431  			label = "RX";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3432  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3433  			pinctrl-0 = <&rx_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3434  			pinctrl-names = "default";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3435  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3436  			qcom,din-ports = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3437  			qcom,dout-ports = <11>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3438  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3439  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3440  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3441  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3442  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3443  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0x0f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3444  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
d4fac32cbe9504 Krzysztof Kozlowski 2024-02-27  3445  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0x01 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3446  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3447  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3448  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3449  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3450  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3451  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3452  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3453  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3454  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3455  		lpass_txmacro: codec@6ae0000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3456  			compatible = "qcom,x1e80100-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3457  			reg = <0 0x06ae0000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3458  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3459  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3460  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3461  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3462  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3463  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3464  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3465  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3466  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3467  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3468  			clock-output-names = "mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3469  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3470  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3471  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3472  		lpass_wsamacro: codec@6b00000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3473  			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3474  			reg = <0 0x06b00000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3475  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3476  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3477  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3478  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3479  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3480  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3481  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3482  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3483  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3484  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3485  			clock-output-names = "mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3486  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3487  			sound-name-prefix = "WSA";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3488  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3489  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3490  		swr0: soundwire@6b10000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3491  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3492  			reg = <0 0x06b10000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3493  			clocks = <&lpass_wsamacro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3494  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3495  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3496  			label = "WSA";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3497  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3498  			pinctrl-0 = <&wsa_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3499  			pinctrl-names = "default";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3500  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3501  			qcom,din-ports = <4>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3502  			qcom,dout-ports = <9>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3503  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3504  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3505  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3506  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3507  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3508  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3509  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3510  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3511  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3512  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3513  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3514  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3515  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3516  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3517  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3518  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3519  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3520  		swr2: soundwire@6d30000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3521  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3522  			reg = <0 0x06d30000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3523  			clocks = <&lpass_txmacro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3524  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3525  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3526  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3527  			interrupt-names = "core", "wakeup";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3528  			label = "TX";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3529  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3530  			pinctrl-0 = <&tx_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3531  			pinctrl-names = "default";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3532  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3533  			qcom,din-ports = <4>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3534  			qcom,dout-ports = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3535  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3536  			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3537  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3538  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3539  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3540  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3541  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3542  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3543  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3544  			qcom,ports-lane-control =	/bits/ 8 <0xff 0x00 0x00 0x01 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3545  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3546  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3547  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3548  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3549  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3550  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3551  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3552  		lpass_vamacro: codec@6d44000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3553  			compatible = "qcom,x1e80100-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3554  			reg = <0 0x06d44000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3555  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3556  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3557  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3558  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3559  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3560  				      "dcodec";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3561  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3562  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3563  			clock-output-names = "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3564  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3565  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3566  
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3567  		lpass_tlmm: pinctrl@6e80000 {
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3568  			compatible = "qcom,x1e80100-lpass-lpi-pinctrl", "qcom,sm8550-lpass-lpi-pinctrl";
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3569  			reg = <0 0x06e80000 0 0x20000>,
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3570  			      <0 0x07250000 0 0x10000>;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3571  
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3572  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3573  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3574  			clock-names = "core", "audio";
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3575  
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3576  			gpio-controller;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3577  			#gpio-cells = <2>;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3578  			gpio-ranges = <&lpass_tlmm 0 0 23>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3579  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3580  			tx_swr_active: tx-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3581  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3582  					pins = "gpio0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3583  					function = "swr_tx_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3584  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3585  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3586  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3587  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3588  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3589  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3590  					pins = "gpio1", "gpio2";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3591  					function = "swr_tx_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3592  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3593  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3594  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3595  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3596  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3597  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3598  			rx_swr_active: rx-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3599  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3600  					pins = "gpio3";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3601  					function = "swr_rx_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3602  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3603  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3604  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3605  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3606  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3607  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3608  					pins = "gpio4", "gpio5";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3609  					function = "swr_rx_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3610  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3611  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3612  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3613  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3614  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3615  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3616  			dmic01_default: dmic01-default-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3617  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3618  					pins = "gpio6";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3619  					function = "dmic1_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3620  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3621  					output-high;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3622  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3623  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3624  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3625  					pins = "gpio7";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3626  					function = "dmic1_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3627  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3628  					input-enable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3629  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3630  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3631  
8794916799d61f Krzysztof Kozlowski 2024-02-12  3632  			dmic23_default: dmic23-default-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3633  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3634  					pins = "gpio8";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3635  					function = "dmic2_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3636  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3637  					output-high;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3638  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3639  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3640  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3641  					pins = "gpio9";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3642  					function = "dmic2_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3643  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3644  					input-enable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3645  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3646  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3647  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3648  			wsa_swr_active: wsa-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3649  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3650  					pins = "gpio10";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3651  					function = "wsa_swr_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3652  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3653  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3654  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3655  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3656  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3657  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3658  					pins = "gpio11";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3659  					function = "wsa_swr_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3660  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3661  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3662  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3663  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3664  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3665  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3666  			wsa2_swr_active: wsa2-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3667  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3668  					pins = "gpio15";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3669  					function = "wsa2_swr_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3670  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3671  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3672  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3673  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3674  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3675  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3676  					pins = "gpio16";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3677  					function = "wsa2_swr_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3678  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3679  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3680  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3681  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3682  			};
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3683  		};
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3684  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3685  		lpass_ag_noc: interconnect@7e40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3686  			compatible = "qcom,x1e80100-lpass-ag-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3687  			reg = <0 0x7e40000 0 0xE080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3688  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3689  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3690  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3691  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3692  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3693  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3694  		lpass_lpiaon_noc: interconnect@7400000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3695  			compatible = "qcom,x1e80100-lpass-lpiaon-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3696  			reg = <0 0x7400000 0 0x19080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3697  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3698  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3699  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3700  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3701  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3702  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3703  		lpass_lpicx_noc: interconnect@7430000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3704  			compatible = "qcom,x1e80100-lpass-lpicx-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3705  			reg = <0 0x7430000 0 0x3A200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3706  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3707  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3708  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3709  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3710  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3711  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3712  		usb_2_hsphy: phy@88e0000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3713  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3714  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3715  			reg = <0 0x088e0000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3716  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3717  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3718  			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3719  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3720  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3721  			resets = <&gcc GCC_QUSB2PHY_USB20_HS_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3722  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3723  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3724  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3725  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3726  		usb_1_ss2: usb@a0f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3727  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3728  			reg = <0 0x0a0f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3729  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3730  			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3731  				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3732  				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3733  				 <&gcc GCC_USB30_TERT_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3734  				 <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3735  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3736  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3737  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3738  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3739  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3740  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3741  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3742  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3743  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3744  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3745  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3746  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3747  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3748  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3749  			assigned-clocks = <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3750  					  <&gcc GCC_USB30_TERT_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3751  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3752  					       <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3753  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3754  			interrupts-extended = <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3755  					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3756  					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3757  					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3758  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3759  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3760  					  "dm_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3761  					  "ss_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3762  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3763  			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3764  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3765  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3766  			resets = <&gcc GCC_USB30_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3767  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3768  			interconnects = <&usb_south_anoc MASTER_USB3_2 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  3769  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3770  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  3771  					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ALWAYS>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3772  			interconnect-names = "usb-ddr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3773  					     "apps-usb";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3774  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3775  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3776  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3777  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3778  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3779  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3780  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3781  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3782  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3783  			usb_1_ss2_dwc3: usb@a000000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3784  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3785  				reg = <0 0x0a000000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3786  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3787  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3788  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3789  				iommus = <&apps_smmu 0x14a0 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3790  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3791  				phys = <&usb_1_ss2_hsphy>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3792  				       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3793  				phy-names = "usb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3794  				            "usb3-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3795  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3796  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3797  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3798  				snps,usb3_lpm_capable;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3799  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3800  				dma-coherent;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3801  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3802  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3803  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3804  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3805  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3806  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3807  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3808  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3809  						usb_1_ss2_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3810  						};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3811  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3812  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3813  					port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3814  						reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3815  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3816  						usb_1_ss2_dwc3_ss: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3817  							remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3818  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3819  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3820  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3821  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3822  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3823  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3824  		usb_2: usb@a2f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3825  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3826  			reg = <0 0x0a2f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3827  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3828  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3829  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3830  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3831  			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3832  				 <&gcc GCC_USB20_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3833  				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3834  				 <&gcc GCC_USB20_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3835  				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3836  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3837  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3838  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3839  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3840  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3841  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3842  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3843  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3844  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3845  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3846  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3847  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3848  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3849  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3850  			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3851  					  <&gcc GCC_USB20_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3852  			assigned-clock-rates = <19200000>, <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3853  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3854  			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3855  					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3856  					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3857  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3858  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3859  					  "dm_hs_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3860  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3861  			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3862  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3863  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3864  			resets = <&gcc GCC_USB20_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3865  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3866  			interconnects = <&usb_north_anoc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  3867  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3868  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  3869  					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3870  			interconnect-names = "usb-ddr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3871  					     "apps-usb";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3872  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3873  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3874  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3875  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3876  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3877  			usb_2_dwc3: usb@a200000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3878  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3879  				reg = <0 0x0a200000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3880  				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3881  				iommus = <&apps_smmu 0x14e0 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3882  				phys = <&usb_2_hsphy>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3883  				phy-names = "usb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3884  				maximum-speed = "high-speed";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3885  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3886  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3887  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3888  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3889  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3890  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3891  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3892  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3893  						usb_2_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3894  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3895  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3896  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3897  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3898  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3899  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3900  		usb_1_ss0: usb@a6f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3901  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3902  			reg = <0 0x0a6f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3903  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3904  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3905  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3906  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3907  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3908  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3909  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3910  				 <&gcc GCC_CFG_NOC_USB_ANOC_NORTH_AHB_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3911  				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3912  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3913  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3914  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3915  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3916  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3917  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3918  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3919  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3920  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3921  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3922  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3923  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3924  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3925  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3926  					       <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3927  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3928  			interrupts-extended = <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3929  					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3930  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3931  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3932  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3933  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3934  					  "dm_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3935  					  "ss_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3936  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3937  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3938  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3939  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3940  			resets = <&gcc GCC_USB30_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3941  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3942  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3943  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3944  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3945  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3946  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3947  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3948  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3949  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3950  			usb_1_ss0_dwc3: usb@a600000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3951  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3952  				reg = <0 0x0a600000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3953  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3954  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3955  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3956  				iommus = <&apps_smmu 0x1420 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3957  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3958  				phys = <&usb_1_ss0_hsphy>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3959  				       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3960  				phy-names = "usb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3961  					    "usb3-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3962  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3963  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3964  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3965  				snps,usb3_lpm_capable;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3966  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3967  				dma-coherent;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3968  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3969  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3970  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3971  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3972  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3973  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3974  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3975  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3976  						usb_1_ss0_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3977  						};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3978  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3979  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3980  					port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3981  						reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3982  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3983  						usb_1_ss0_dwc3_ss: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3984  							remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  3985  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3986  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3987  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3988  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3989  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3990  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3991  		usb_1_ss1: usb@a8f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3992  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3993  			reg = <0 0x0a8f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3994  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3995  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3996  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3997  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3998  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  3999  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4000  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4001  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4002  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4003  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4004  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4005  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4006  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4007  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4008  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4009  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4010  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4011  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4012  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4013  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4014  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4015  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4016  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4017  					       <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4018  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4019  			interrupts-extended = <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4020  					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4021  					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4022  					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4023  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4024  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4025  					  "dm_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4026  					  "ss_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4027  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4028  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4029  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4030  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4031  			resets = <&gcc GCC_USB30_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4032  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4033  			interconnects = <&usb_south_anoc MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4034  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4035  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4036  					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4037  			interconnect-names = "usb-ddr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4038  					     "apps-usb";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4039  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4040  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4041  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4042  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4043  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4044  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4045  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4046  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4047  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4048  			usb_1_ss1_dwc3: usb@a800000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4049  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4050  				reg = <0 0x0a800000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4051  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4052  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4053  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4054  				iommus = <&apps_smmu 0x1460 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4055  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4056  				phys = <&usb_1_ss1_hsphy>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4057  				       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4058  				phy-names = "usb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4059  					    "usb3-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4060  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4061  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4062  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4063  				snps,usb3_lpm_capable;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4064  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4065  				dma-coherent;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4066  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4067  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4068  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4069  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4070  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4071  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4072  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4073  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4074  						usb_1_ss1_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4075  						};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4076  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4077  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4078  					port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4079  						reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4080  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4081  						usb_1_ss1_dwc3_ss: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4082  							remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4083  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4084  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4085  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4086  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4087  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4088  
1940c25eaa63f6 Abel Vesa           2024-01-29  4089  		mdss: display-subsystem@ae00000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4090  			compatible = "qcom,x1e80100-mdss";
1940c25eaa63f6 Abel Vesa           2024-01-29  4091  			reg = <0 0x0ae00000 0 0x1000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4092  			reg-names = "mdss";
1940c25eaa63f6 Abel Vesa           2024-01-29  4093  
1940c25eaa63f6 Abel Vesa           2024-01-29  4094  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4095  
1940c25eaa63f6 Abel Vesa           2024-01-29  4096  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4097  				 <&gcc GCC_DISP_HF_AXI_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4098  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4099  
1940c25eaa63f6 Abel Vesa           2024-01-29  4100  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4101  
1940c25eaa63f6 Abel Vesa           2024-01-29  4102  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
1940c25eaa63f6 Abel Vesa           2024-01-29  4103  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4104  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
1940c25eaa63f6 Abel Vesa           2024-01-29  4105  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4106  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
1940c25eaa63f6 Abel Vesa           2024-01-29  4107  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4108  			interconnect-names = "mdp0-mem",
1940c25eaa63f6 Abel Vesa           2024-01-29  4109  					     "mdp1-mem",
1940c25eaa63f6 Abel Vesa           2024-01-29  4110  					     "cpu-cfg";
1940c25eaa63f6 Abel Vesa           2024-01-29  4111  
1940c25eaa63f6 Abel Vesa           2024-01-29  4112  			power-domains = <&dispcc MDSS_GDSC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4113  
1940c25eaa63f6 Abel Vesa           2024-01-29  4114  			iommus = <&apps_smmu 0x1c00 0x2>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4115  
1940c25eaa63f6 Abel Vesa           2024-01-29  4116  			interrupt-controller;
1940c25eaa63f6 Abel Vesa           2024-01-29  4117  			#interrupt-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4118  
1940c25eaa63f6 Abel Vesa           2024-01-29  4119  			#address-cells = <2>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4120  			#size-cells = <2>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4121  			ranges;
1940c25eaa63f6 Abel Vesa           2024-01-29  4122  
1940c25eaa63f6 Abel Vesa           2024-01-29  4123  			status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4124  
1940c25eaa63f6 Abel Vesa           2024-01-29  4125  			mdss_mdp: display-controller@ae01000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4126  				compatible = "qcom,x1e80100-dpu";
1940c25eaa63f6 Abel Vesa           2024-01-29  4127  				reg = <0 0x0ae01000 0 0x8f000>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4128  				      <0 0x0aeb0000 0 0x2008>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4129  				reg-names = "mdp",
1940c25eaa63f6 Abel Vesa           2024-01-29  4130  					    "vbif";
1940c25eaa63f6 Abel Vesa           2024-01-29  4131  
1940c25eaa63f6 Abel Vesa           2024-01-29  4132  				interrupts-extended = <&mdss 0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4133  
1940c25eaa63f6 Abel Vesa           2024-01-29  4134  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4135  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4136  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4137  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4138  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4139  				clock-names = "nrt_bus",
1940c25eaa63f6 Abel Vesa           2024-01-29  4140  					      "iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4141  					      "lut",
1940c25eaa63f6 Abel Vesa           2024-01-29  4142  					      "core",
1940c25eaa63f6 Abel Vesa           2024-01-29  4143  					      "vsync";
1940c25eaa63f6 Abel Vesa           2024-01-29  4144  
1940c25eaa63f6 Abel Vesa           2024-01-29  4145  				operating-points-v2 = <&mdp_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4146  
1940c25eaa63f6 Abel Vesa           2024-01-29  4147  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4148  
1940c25eaa63f6 Abel Vesa           2024-01-29  4149  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4150  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4151  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4152  
1940c25eaa63f6 Abel Vesa           2024-01-29  4153  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4154  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4155  
1940c25eaa63f6 Abel Vesa           2024-01-29  4156  						mdss_intf0_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4157  							remote-endpoint = <&mdss_dp0_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4158  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4159  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4160  
1940c25eaa63f6 Abel Vesa           2024-01-29  4161  					port@4 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4162  						reg = <4>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4163  
1940c25eaa63f6 Abel Vesa           2024-01-29  4164  						mdss_intf4_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4165  							remote-endpoint = <&mdss_dp1_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4166  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4167  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4168  
1940c25eaa63f6 Abel Vesa           2024-01-29  4169  					port@5 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4170  						reg = <5>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4171  
1940c25eaa63f6 Abel Vesa           2024-01-29  4172  						mdss_intf5_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4173  							remote-endpoint = <&mdss_dp3_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4174  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4175  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4176  
1940c25eaa63f6 Abel Vesa           2024-01-29  4177  					port@6 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4178  						reg = <6>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4179  
1940c25eaa63f6 Abel Vesa           2024-01-29  4180  						mdss_intf6_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4181  							remote-endpoint = <&mdss_dp2_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4182  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4183  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4184  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4185  
1940c25eaa63f6 Abel Vesa           2024-01-29  4186  				mdp_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4187  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4188  
1940c25eaa63f6 Abel Vesa           2024-01-29  4189  					opp-200000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4190  						opp-hz = /bits/ 64 <200000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4191  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4192  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4193  
1940c25eaa63f6 Abel Vesa           2024-01-29  4194  					opp-325000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4195  						opp-hz = /bits/ 64 <325000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4196  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4197  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4198  
1940c25eaa63f6 Abel Vesa           2024-01-29  4199  					opp-375000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4200  						opp-hz = /bits/ 64 <375000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4201  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4202  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4203  
1940c25eaa63f6 Abel Vesa           2024-01-29  4204  					opp-514000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4205  						opp-hz = /bits/ 64 <514000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4206  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4207  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4208  
1940c25eaa63f6 Abel Vesa           2024-01-29  4209  					opp-575000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4210  						opp-hz = /bits/ 64 <575000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4211  						required-opps = <&rpmhpd_opp_nom_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4212  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4213  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4214  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4215  
1940c25eaa63f6 Abel Vesa           2024-01-29  4216  			mdss_dp0: displayport-controller@ae90000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4217  				compatible = "qcom,x1e80100-dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4218  				reg = <0 0xae90000 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4219  				      <0 0xae90200 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4220  				      <0 0xae90400 0 0x600>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4221  				      <0 0xae91000 0 0x400>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4222  				      <0 0xae91400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4223  
1940c25eaa63f6 Abel Vesa           2024-01-29  4224  				interrupts-extended = <&mdss 12>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4225  
1940c25eaa63f6 Abel Vesa           2024-01-29  4226  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4227  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4228  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4229  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4230  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4231  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4232  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4233  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4234  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4235  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4236  
1940c25eaa63f6 Abel Vesa           2024-01-29  4237  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4238  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4239  				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4240  							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4241  
1940c25eaa63f6 Abel Vesa           2024-01-29  4242  				operating-points-v2 = <&mdss_dp0_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4243  
1940c25eaa63f6 Abel Vesa           2024-01-29  4244  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4245  
1940c25eaa63f6 Abel Vesa           2024-01-29  4246  				phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4247  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4248  
1940c25eaa63f6 Abel Vesa           2024-01-29  4249  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4250  
1940c25eaa63f6 Abel Vesa           2024-01-29  4251  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4252  
1940c25eaa63f6 Abel Vesa           2024-01-29  4253  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4254  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4255  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4256  
1940c25eaa63f6 Abel Vesa           2024-01-29  4257  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4258  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4259  
1940c25eaa63f6 Abel Vesa           2024-01-29  4260  						mdss_dp0_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4261  							remote-endpoint = <&mdss_intf0_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4262  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4263  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4264  
1940c25eaa63f6 Abel Vesa           2024-01-29  4265  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4266  						reg = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4267  
1940c25eaa63f6 Abel Vesa           2024-01-29  4268  						mdss_dp0_out: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  4269  							remote-endpoint = <&usb_1_ss0_qmpphy_dp_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4270  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4271  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4272  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4273  
1940c25eaa63f6 Abel Vesa           2024-01-29  4274  				mdss_dp0_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4275  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4276  
1940c25eaa63f6 Abel Vesa           2024-01-29  4277  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4278  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4279  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4280  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4281  
1940c25eaa63f6 Abel Vesa           2024-01-29  4282  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4283  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4284  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4285  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4286  
1940c25eaa63f6 Abel Vesa           2024-01-29  4287  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4288  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4289  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4290  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4291  
1940c25eaa63f6 Abel Vesa           2024-01-29  4292  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4293  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4294  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4295  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4296  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4297  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4298  
1940c25eaa63f6 Abel Vesa           2024-01-29  4299  			mdss_dp1: displayport-controller@ae98000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4300  				compatible = "qcom,x1e80100-dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4301  				reg = <0 0xae98000 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4302  				      <0 0xae98200 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4303  				      <0 0xae98400 0 0x600>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4304  				      <0 0xae99000 0 0x400>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4305  				      <0 0xae99400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4306  
1940c25eaa63f6 Abel Vesa           2024-01-29  4307  				interrupts-extended = <&mdss 13>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4308  
1940c25eaa63f6 Abel Vesa           2024-01-29  4309  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4310  					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4311  					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4312  					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4313  					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4314  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4315  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4316  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4317  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4318  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4319  
1940c25eaa63f6 Abel Vesa           2024-01-29  4320  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4321  						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4322  				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4323  							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4324  
1940c25eaa63f6 Abel Vesa           2024-01-29  4325  				operating-points-v2 = <&mdss_dp1_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4326  
1940c25eaa63f6 Abel Vesa           2024-01-29  4327  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4328  
1940c25eaa63f6 Abel Vesa           2024-01-29  4329  				phys = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_PHY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4330  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4331  
1940c25eaa63f6 Abel Vesa           2024-01-29  4332  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4333  
1940c25eaa63f6 Abel Vesa           2024-01-29  4334  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4335  
1940c25eaa63f6 Abel Vesa           2024-01-29  4336  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4337  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4338  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4339  
1940c25eaa63f6 Abel Vesa           2024-01-29  4340  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4341  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4342  
1940c25eaa63f6 Abel Vesa           2024-01-29  4343  						mdss_dp1_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4344  							remote-endpoint = <&mdss_intf4_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4345  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4346  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4347  
1940c25eaa63f6 Abel Vesa           2024-01-29  4348  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4349  						reg = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4350  
1940c25eaa63f6 Abel Vesa           2024-01-29  4351  						mdss_dp1_out: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  4352  							remote-endpoint = <&usb_1_ss1_qmpphy_dp_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4353  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4354  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4355  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4356  
1940c25eaa63f6 Abel Vesa           2024-01-29  4357  				mdss_dp1_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4358  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4359  
1940c25eaa63f6 Abel Vesa           2024-01-29  4360  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4361  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4362  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4363  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4364  
1940c25eaa63f6 Abel Vesa           2024-01-29  4365  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4366  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4367  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4368  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4369  
1940c25eaa63f6 Abel Vesa           2024-01-29  4370  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4371  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4372  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4373  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4374  
1940c25eaa63f6 Abel Vesa           2024-01-29  4375  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4376  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4377  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4378  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4379  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4380  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4381  
1940c25eaa63f6 Abel Vesa           2024-01-29  4382  			mdss_dp2: displayport-controller@ae9a000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4383  				compatible = "qcom,x1e80100-dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4384  				reg = <0 0xae9a000 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4385  				      <0 0xae9a200 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4386  				      <0 0xae9a400 0 0x600>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4387  				      <0 0xae9b000 0 0x400>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4388  				      <0 0xae9b400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4389  
1940c25eaa63f6 Abel Vesa           2024-01-29  4390  				interrupts-extended = <&mdss 14>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4391  
1940c25eaa63f6 Abel Vesa           2024-01-29  4392  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4393  					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4394  					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4395  					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4396  					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4397  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4398  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4399  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4400  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4401  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4402  
1940c25eaa63f6 Abel Vesa           2024-01-29  4403  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4404  						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4405  				assigned-clock-parents = <&mdss_dp2_phy 0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4406  							 <&mdss_dp2_phy 1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4407  
1940c25eaa63f6 Abel Vesa           2024-01-29  4408  				operating-points-v2 = <&mdss_dp2_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4409  
1940c25eaa63f6 Abel Vesa           2024-01-29  4410  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4411  
1940c25eaa63f6 Abel Vesa           2024-01-29  4412  				phys = <&mdss_dp2_phy>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4413  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4414  
1940c25eaa63f6 Abel Vesa           2024-01-29  4415  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4416  
1940c25eaa63f6 Abel Vesa           2024-01-29  4417  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4418  
1940c25eaa63f6 Abel Vesa           2024-01-29  4419  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4420  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4421  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4422  
1940c25eaa63f6 Abel Vesa           2024-01-29  4423  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4424  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4425  						mdss_dp2_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4426  							remote-endpoint = <&mdss_intf6_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4427  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4428  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4429  
1940c25eaa63f6 Abel Vesa           2024-01-29  4430  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4431  						reg = <1>;
aa48a8a5d642b5 Abel Vesa           2024-06-06  4432  
aa48a8a5d642b5 Abel Vesa           2024-06-06  4433  						mdss_dp2_out: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  4434  							remote-endpoint = <&usb_1_ss2_qmpphy_dp_in>;
aa48a8a5d642b5 Abel Vesa           2024-06-06  4435  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4436  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4437  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4438  
1940c25eaa63f6 Abel Vesa           2024-01-29  4439  				mdss_dp2_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4440  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4441  
1940c25eaa63f6 Abel Vesa           2024-01-29  4442  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4443  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4444  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4445  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4446  
1940c25eaa63f6 Abel Vesa           2024-01-29  4447  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4448  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4449  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4450  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4451  
1940c25eaa63f6 Abel Vesa           2024-01-29  4452  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4453  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4454  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4455  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4456  
1940c25eaa63f6 Abel Vesa           2024-01-29  4457  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4458  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4459  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4460  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4461  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4462  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4463  
1940c25eaa63f6 Abel Vesa           2024-01-29  4464  			mdss_dp3: displayport-controller@aea0000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4465  				compatible = "qcom,x1e80100-dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4466  				reg = <0 0xaea0000 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4467  				      <0 0xaea0200 0 0x200>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4468  				      <0 0xaea0400 0 0x600>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4469  				      <0 0xaea1000 0 0x400>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4470  				      <0 0xaea1400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4471  
1940c25eaa63f6 Abel Vesa           2024-01-29  4472  				interrupts-extended = <&mdss 15>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4473  
1940c25eaa63f6 Abel Vesa           2024-01-29  4474  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4475  					 <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4476  					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4477  					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4478  					 <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4479  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4480  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4481  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4482  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4483  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4484  
1940c25eaa63f6 Abel Vesa           2024-01-29  4485  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4486  						  <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4487  				assigned-clock-parents = <&mdss_dp3_phy 0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4488  							 <&mdss_dp3_phy 1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4489  
1940c25eaa63f6 Abel Vesa           2024-01-29  4490  				operating-points-v2 = <&mdss_dp3_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4491  
1940c25eaa63f6 Abel Vesa           2024-01-29  4492  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4493  
1940c25eaa63f6 Abel Vesa           2024-01-29  4494  				phys = <&mdss_dp3_phy>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4495  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4496  
1940c25eaa63f6 Abel Vesa           2024-01-29  4497  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4498  
1940c25eaa63f6 Abel Vesa           2024-01-29  4499  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4500  
1940c25eaa63f6 Abel Vesa           2024-01-29  4501  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4502  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4503  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4504  
1940c25eaa63f6 Abel Vesa           2024-01-29  4505  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4506  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4507  
1940c25eaa63f6 Abel Vesa           2024-01-29  4508  						mdss_dp3_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4509  							remote-endpoint = <&mdss_intf5_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4510  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4511  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4512  
1940c25eaa63f6 Abel Vesa           2024-01-29  4513  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4514  						reg = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4515  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4516  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4517  
1940c25eaa63f6 Abel Vesa           2024-01-29  4518  				mdss_dp3_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4519  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4520  
1940c25eaa63f6 Abel Vesa           2024-01-29  4521  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4522  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4523  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4524  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4525  
1940c25eaa63f6 Abel Vesa           2024-01-29  4526  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4527  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4528  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4529  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4530  
1940c25eaa63f6 Abel Vesa           2024-01-29  4531  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4532  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4533  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4534  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4535  
1940c25eaa63f6 Abel Vesa           2024-01-29  4536  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4537  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4538  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4539  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4540  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4541  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4542  
1940c25eaa63f6 Abel Vesa           2024-01-29  4543  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4544  
1940c25eaa63f6 Abel Vesa           2024-01-29  4545  		mdss_dp2_phy: phy@aec2a00 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4546  			compatible = "qcom,x1e80100-dp-phy";
1940c25eaa63f6 Abel Vesa           2024-01-29  4547  			reg = <0 0x0aec2a00 0 0x19c>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4548  			      <0 0x0aec2200 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4549  			      <0 0x0aec2600 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4550  			      <0 0x0aec2000 0 0x1c8>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4551  
1940c25eaa63f6 Abel Vesa           2024-01-29  4552  			clocks = <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4553  				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4554  			clock-names = "aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4555  				      "cfg_ahb";
1940c25eaa63f6 Abel Vesa           2024-01-29  4556  
1940c25eaa63f6 Abel Vesa           2024-01-29  4557  			power-domains = <&rpmhpd RPMHPD_MX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4558  
1940c25eaa63f6 Abel Vesa           2024-01-29  4559  			#clock-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4560  			#phy-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4561  
1940c25eaa63f6 Abel Vesa           2024-01-29  4562  			status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4563  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4564  
1940c25eaa63f6 Abel Vesa           2024-01-29  4565  		mdss_dp3_phy: phy@aec5a00 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4566  			compatible = "qcom,x1e80100-dp-phy";
1940c25eaa63f6 Abel Vesa           2024-01-29  4567  			reg = <0 0x0aec5a00 0 0x19c>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4568  			      <0 0x0aec5200 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4569  			      <0 0x0aec5600 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4570  			      <0 0x0aec5000 0 0x1c8>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4571  
1940c25eaa63f6 Abel Vesa           2024-01-29  4572  			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4573  				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4574  			clock-names = "aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4575  				      "cfg_ahb";
1940c25eaa63f6 Abel Vesa           2024-01-29  4576  
1940c25eaa63f6 Abel Vesa           2024-01-29  4577  			power-domains = <&rpmhpd RPMHPD_MX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4578  
1940c25eaa63f6 Abel Vesa           2024-01-29  4579  			#clock-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4580  			#phy-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4581  
1940c25eaa63f6 Abel Vesa           2024-01-29  4582  			status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4583  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4584  
1940c25eaa63f6 Abel Vesa           2024-01-29  4585  		dispcc: clock-controller@af00000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4586  			compatible = "qcom,x1e80100-dispcc";
1940c25eaa63f6 Abel Vesa           2024-01-29  4587  			reg = <0 0x0af00000 0 0x20000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4588  			clocks = <&bi_tcxo_div2>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4589  				 <&bi_tcxo_ao_div2>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4590  				 <&gcc GCC_DISP_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4591  				 <&sleep_clk>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4592  				 <0>, /* dsi0 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4593  				 <0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4594  				 <0>, /* dsi1 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4595  				 <0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4596  				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp0 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4597  				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4598  				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp1 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4599  				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4600  				 <&mdss_dp2_phy 0>, /* dp2 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4601  				 <&mdss_dp2_phy 1>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4602  				 <&mdss_dp3_phy 0>, /* dp3 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4603  				 <&mdss_dp3_phy 1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4604  			power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4605  			required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4606  			#clock-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4607  			#reset-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4608  			#power-domain-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4609  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4610  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4611  		pdc: interrupt-controller@b220000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4612  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4613  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4614  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4615  			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  4616  					  <47 522 52>, <99 609 32>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  4617  					  <131 717 12>, <143 816 19>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4618  			#interrupt-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4619  			interrupt-parent = <&intc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4620  			interrupt-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4621  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4622  
2661646f5934c9 Sibi Sankar         2024-01-29  4623  		aoss_qmp: power-management@c300000 {
2661646f5934c9 Sibi Sankar         2024-01-29  4624  			compatible = "qcom,x1e80100-aoss-qmp", "qcom,aoss-qmp";
2661646f5934c9 Sibi Sankar         2024-01-29  4625  			reg = <0 0x0c300000 0 0x400>;
2661646f5934c9 Sibi Sankar         2024-01-29  4626  			interrupt-parent = <&ipcc>;
2661646f5934c9 Sibi Sankar         2024-01-29  4627  			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
2661646f5934c9 Sibi Sankar         2024-01-29  4628  						     IRQ_TYPE_EDGE_RISING>;
2661646f5934c9 Sibi Sankar         2024-01-29  4629  			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
2661646f5934c9 Sibi Sankar         2024-01-29  4630  
2661646f5934c9 Sibi Sankar         2024-01-29  4631  			#clock-cells = <0>;
2661646f5934c9 Sibi Sankar         2024-01-29  4632  		};
2661646f5934c9 Sibi Sankar         2024-01-29  4633  
53fdae5e086b69 Abel Vesa           2024-02-22  4634  		spmi: arbiter@c400000 {
53fdae5e086b69 Abel Vesa           2024-02-22  4635  			compatible = "qcom,x1e80100-spmi-pmic-arb";
53fdae5e086b69 Abel Vesa           2024-02-22  4636  			reg = <0 0x0c400000 0 0x3000>,
53fdae5e086b69 Abel Vesa           2024-02-22  4637  			      <0 0x0c500000 0 0x400000>,
53fdae5e086b69 Abel Vesa           2024-02-22  4638  			      <0 0x0c440000 0 0x80000>;
53fdae5e086b69 Abel Vesa           2024-02-22  4639  			reg-names = "core", "chnls", "obsrvr";
53fdae5e086b69 Abel Vesa           2024-02-22  4640  
53fdae5e086b69 Abel Vesa           2024-02-22  4641  			qcom,ee = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  4642  			qcom,channel = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  4643  
53fdae5e086b69 Abel Vesa           2024-02-22  4644  			#address-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  4645  			#size-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  4646  			ranges;
53fdae5e086b69 Abel Vesa           2024-02-22  4647  
53fdae5e086b69 Abel Vesa           2024-02-22  4648  			spmi_bus0: spmi@c42d000 {
53fdae5e086b69 Abel Vesa           2024-02-22  4649  				reg = <0 0x0c42d000 0 0x4000>,
53fdae5e086b69 Abel Vesa           2024-02-22  4650  				      <0 0x0c4c0000 0 0x10000>;
53fdae5e086b69 Abel Vesa           2024-02-22  4651  				reg-names = "cnfg", "intr";
53fdae5e086b69 Abel Vesa           2024-02-22  4652  
53fdae5e086b69 Abel Vesa           2024-02-22  4653  				interrupt-names = "periph_irq";
53fdae5e086b69 Abel Vesa           2024-02-22  4654  				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
53fdae5e086b69 Abel Vesa           2024-02-22  4655  				interrupt-controller;
53fdae5e086b69 Abel Vesa           2024-02-22  4656  				#interrupt-cells = <4>;
53fdae5e086b69 Abel Vesa           2024-02-22  4657  
53fdae5e086b69 Abel Vesa           2024-02-22  4658  				#address-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  4659  				#size-cells = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  4660  			};
53fdae5e086b69 Abel Vesa           2024-02-22  4661  
53fdae5e086b69 Abel Vesa           2024-02-22  4662  			spmi_bus1: spmi@c432000 {
53fdae5e086b69 Abel Vesa           2024-02-22  4663  				reg = <0 0x0c432000 0 0x4000>,
53fdae5e086b69 Abel Vesa           2024-02-22  4664  				      <0 0x0c4d0000 0 0x10000>;
53fdae5e086b69 Abel Vesa           2024-02-22  4665  				reg-names = "cnfg", "intr";
53fdae5e086b69 Abel Vesa           2024-02-22  4666  
53fdae5e086b69 Abel Vesa           2024-02-22  4667  				interrupt-names = "periph_irq";
53fdae5e086b69 Abel Vesa           2024-02-22  4668  				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
53fdae5e086b69 Abel Vesa           2024-02-22  4669  				interrupt-controller;
53fdae5e086b69 Abel Vesa           2024-02-22  4670  				#interrupt-cells = <4>;
53fdae5e086b69 Abel Vesa           2024-02-22  4671  
53fdae5e086b69 Abel Vesa           2024-02-22  4672  				#address-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  4673  				#size-cells = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  4674  			};
53fdae5e086b69 Abel Vesa           2024-02-22  4675  		};
2661646f5934c9 Sibi Sankar         2024-01-29  4676  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4677  		tlmm: pinctrl@f100000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4678  			compatible = "qcom,x1e80100-tlmm";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4679  			reg = <0 0x0f100000 0 0xf00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4680  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4681  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4682  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4683  			gpio-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4684  			#gpio-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4685  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4686  			interrupt-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4687  			#interrupt-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4688  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4689  			gpio-ranges = <&tlmm 0 0 239>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4690  			wakeup-parent = <&pdc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4691  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4692  			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4693  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4694  				pins = "gpio0", "gpio1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4695  				function = "qup0_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4696  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4697  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4698  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4699  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4700  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4701  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4702  				pins = "gpio4", "gpio5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4703  				function = "qup0_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4704  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4705  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4706  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4707  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4708  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4709  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4710  				pins = "gpio8", "gpio9";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4711  				function = "qup0_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4712  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4713  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4714  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4715  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4716  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4717  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4718  				pins = "gpio12", "gpio13";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4719  				function = "qup0_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4720  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4721  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4722  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4723  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4724  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4725  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4726  				pins = "gpio16", "gpio17";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4727  				function = "qup0_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4728  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4729  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4730  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4731  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4732  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4733  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4734  				pins = "gpio20", "gpio21";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4735  				function = "qup0_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4736  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4737  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4738  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4739  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4740  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4741  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4742  				pins = "gpio24", "gpio25";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4743  				function = "qup0_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4744  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4745  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4746  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4747  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4748  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4749  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4750  				pins = "gpio14", "gpio15";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4751  				function = "qup0_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4752  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4753  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4754  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4755  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4756  			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4757  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4758  				pins = "gpio32", "gpio33";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4759  				function = "qup1_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4760  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4761  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4762  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4763  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4764  			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4765  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4766  				pins = "gpio36", "gpio37";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4767  				function = "qup1_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4768  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4769  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4770  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4771  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4772  			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4773  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4774  				pins = "gpio40", "gpio41";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4775  				function = "qup1_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4776  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4777  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4778  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4779  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4780  			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4781  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4782  				pins = "gpio44", "gpio45";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4783  				function = "qup1_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4784  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4785  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4786  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4787  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4788  			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4789  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4790  				pins = "gpio48", "gpio49";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4791  				function = "qup1_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4792  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4793  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4794  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4795  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4796  			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4797  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4798  				pins = "gpio52", "gpio53";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4799  				function = "qup1_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4800  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4801  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4802  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4803  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4804  			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4805  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4806  				pins = "gpio56", "gpio57";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4807  				function = "qup1_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4808  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4809  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4810  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4811  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4812  			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4813  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4814  				pins = "gpio54", "gpio55";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4815  				function = "qup1_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4816  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4817  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4818  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4819  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4820  			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4821  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4822  				pins = "gpio64", "gpio65";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4823  				function = "qup2_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4824  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4825  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4826  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4827  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4828  			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4829  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4830  				pins = "gpio68", "gpio69";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4831  				function = "qup2_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4832  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4833  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4834  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4835  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4836  			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4837  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4838  				pins = "gpio72", "gpio73";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4839  				function = "qup2_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4840  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4841  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4842  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4843  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4844  			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4845  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4846  				pins = "gpio76", "gpio77";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4847  				function = "qup2_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4848  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4849  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4850  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4851  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4852  			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4853  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4854  				pins = "gpio80", "gpio81";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4855  				function = "qup2_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4856  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4857  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4858  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4859  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4860  			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4861  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4862  				pins = "gpio84", "gpio85";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4863  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4864  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4865  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4866  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4867  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4868  			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4869  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4870  				pins = "gpio88", "gpio89";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4871  				function = "qup2_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4872  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4873  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4874  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4875  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4876  			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4877  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4878  				pins = "gpio86", "gpio87";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4879  				function = "qup2_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4880  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4881  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4882  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4883  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4884  			qup_spi0_cs: qup-spi0-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4885  				pins = "gpio3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4886  				function = "qup0_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4887  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4888  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4889  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4890  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4891  			qup_spi0_data_clk: qup-spi0-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4892  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4893  				pins = "gpio0", "gpio1", "gpio2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4894  				function = "qup0_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4895  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4896  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4897  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4898  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4899  			qup_spi1_cs: qup-spi1-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4900  				pins = "gpio7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4901  				function = "qup0_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4902  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4903  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4904  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4905  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4906  			qup_spi1_data_clk: qup-spi1-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4907  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4908  				pins = "gpio4", "gpio5", "gpio6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4909  				function = "qup0_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4910  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4911  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4912  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4913  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4914  			qup_spi2_cs: qup-spi2-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4915  				pins = "gpio11";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4916  				function = "qup0_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4917  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4918  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4919  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4920  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4921  			qup_spi2_data_clk: qup-spi2-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4922  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4923  				pins = "gpio8", "gpio9", "gpio10";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4924  				function = "qup0_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4925  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4926  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4927  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4928  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4929  			qup_spi3_cs: qup-spi3-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4930  				pins = "gpio15";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4931  				function = "qup0_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4932  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4933  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4934  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4935  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4936  			qup_spi3_data_clk: qup-spi3-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4937  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4938  				pins = "gpio12", "gpio13", "gpio14";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4939  				function = "qup0_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4940  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4941  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4942  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4943  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4944  			qup_spi4_cs: qup-spi4-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4945  				pins = "gpio19";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4946  				function = "qup0_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4947  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4948  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4949  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4950  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4951  			qup_spi4_data_clk: qup-spi4-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4952  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4953  				pins = "gpio16", "gpio17", "gpio18";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4954  				function = "qup0_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4955  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4956  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4957  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4958  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4959  			qup_spi5_cs: qup-spi5-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4960  				pins = "gpio23";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4961  				function = "qup0_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4962  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4963  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4964  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4965  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4966  			qup_spi5_data_clk: qup-spi5-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4967  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4968  				pins = "gpio20", "gpio21", "gpio22";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4969  				function = "qup0_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4970  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4971  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4972  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4973  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4974  			qup_spi6_cs: qup-spi6-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4975  				pins = "gpio27";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4976  				function = "qup0_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4977  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4978  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4979  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4980  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4981  			qup_spi6_data_clk: qup-spi6-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4982  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4983  				pins = "gpio24", "gpio25", "gpio26";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4984  				function = "qup0_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4985  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4986  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4987  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4988  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4989  			qup_spi7_cs: qup-spi7-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4990  				pins = "gpio13";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4991  				function = "qup0_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4992  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4993  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4994  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4995  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4996  			qup_spi7_data_clk: qup-spi7-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4997  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  4998  				pins = "gpio14", "gpio15", "gpio12";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4999  				function = "qup0_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5000  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5001  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5002  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5003  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5004  			qup_spi8_cs: qup-spi8-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5005  				pins = "gpio35";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5006  				function = "qup1_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5007  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5008  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5009  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5010  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5011  			qup_spi8_data_clk: qup-spi8-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5012  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5013  				pins = "gpio32", "gpio33", "gpio34";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5014  				function = "qup1_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5015  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5016  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5017  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5018  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5019  			qup_spi9_cs: qup-spi9-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5020  				pins = "gpio39";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5021  				function = "qup1_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5022  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5023  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5024  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5025  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5026  			qup_spi9_data_clk: qup-spi9-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5027  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5028  				pins = "gpio36", "gpio37", "gpio38";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5029  				function = "qup1_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5030  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5031  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5032  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5033  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5034  			qup_spi10_cs: qup-spi10-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5035  				pins = "gpio43";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5036  				function = "qup1_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5037  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5038  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5039  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5040  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5041  			qup_spi10_data_clk: qup-spi10-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5042  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5043  				pins = "gpio40", "gpio41", "gpio42";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5044  				function = "qup1_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5045  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5046  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5047  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5048  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5049  			qup_spi11_cs: qup-spi11-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5050  				pins = "gpio47";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5051  				function = "qup1_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5052  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5053  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5054  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5055  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5056  			qup_spi11_data_clk: qup-spi11-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5057  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5058  				pins = "gpio44", "gpio45", "gpio46";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5059  				function = "qup1_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5060  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5061  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5062  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5063  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5064  			qup_spi12_cs: qup-spi12-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5065  				pins = "gpio51";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5066  				function = "qup1_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5067  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5068  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5069  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5070  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5071  			qup_spi12_data_clk: qup-spi12-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5072  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5073  				pins = "gpio48", "gpio49", "gpio50";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5074  				function = "qup1_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5075  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5076  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5077  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5078  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5079  			qup_spi13_cs: qup-spi13-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5080  				pins = "gpio55";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5081  				function = "qup1_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5082  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5083  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5084  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5085  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5086  			qup_spi13_data_clk: qup-spi13-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5087  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5088  				pins = "gpio52", "gpio53", "gpio54";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5089  				function = "qup1_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5090  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5091  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5092  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5093  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5094  			qup_spi14_cs: qup-spi14-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5095  				pins = "gpio59";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5096  				function = "qup1_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5097  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5098  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5099  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5100  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5101  			qup_spi14_data_clk: qup-spi14-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5102  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5103  				pins = "gpio56", "gpio57", "gpio58";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5104  				function = "qup1_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5105  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5106  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5107  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5108  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5109  			qup_spi15_cs: qup-spi15-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5110  				pins = "gpio53";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5111  				function = "qup1_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5112  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5113  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5114  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5115  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5116  			qup_spi15_data_clk: qup-spi15-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5117  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5118  				pins = "gpio54", "gpio55", "gpio52";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5119  				function = "qup1_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5120  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5121  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5122  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5123  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5124  			qup_spi16_cs: qup-spi16-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5125  				pins = "gpio67";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5126  				function = "qup2_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5127  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5128  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5129  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5130  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5131  			qup_spi16_data_clk: qup-spi16-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5132  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5133  				pins = "gpio64", "gpio65", "gpio66";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5134  				function = "qup2_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5135  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5136  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5137  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5138  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5139  			qup_spi17_cs: qup-spi17-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5140  				pins = "gpio71";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5141  				function = "qup2_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5142  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5143  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5144  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5145  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5146  			qup_spi17_data_clk: qup-spi17-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5147  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5148  				pins = "gpio68", "gpio69", "gpio70";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5149  				function = "qup2_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5150  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5151  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5152  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5153  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5154  			qup_spi18_cs: qup-spi18-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5155  				pins = "gpio75";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5156  				function = "qup2_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5157  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5158  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5159  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5160  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5161  			qup_spi18_data_clk: qup-spi18-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5162  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5163  				pins = "gpio72", "gpio73", "gpio74";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5164  				function = "qup2_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5165  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5166  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5167  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5168  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5169  			qup_spi19_cs: qup-spi19-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5170  				pins = "gpio79";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5171  				function = "qup2_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5172  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5173  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5174  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5175  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5176  			qup_spi19_data_clk: qup-spi19-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5177  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5178  				pins = "gpio76", "gpio77", "gpio78";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5179  				function = "qup2_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5180  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5181  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5182  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5183  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5184  			qup_spi20_cs: qup-spi20-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5185  				pins = "gpio83";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5186  				function = "qup2_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5187  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5188  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5189  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5190  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5191  			qup_spi20_data_clk: qup-spi20-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5192  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5193  				pins = "gpio80", "gpio81", "gpio82";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5194  				function = "qup2_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5195  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5196  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5197  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5198  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5199  			qup_spi21_cs: qup-spi21-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5200  				pins = "gpio87";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5201  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5202  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5203  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5204  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5205  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5206  			qup_spi21_data_clk: qup-spi21-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5207  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5208  				pins = "gpio84", "gpio85", "gpio86";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5209  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5210  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5211  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5212  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5213  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5214  			qup_spi22_cs: qup-spi22-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5215  				pins = "gpio91";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5216  				function = "qup2_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5217  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5218  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5219  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5220  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5221  			qup_spi22_data_clk: qup-spi22-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5222  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5223  				pins = "gpio88", "gpio89", "gpio90";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5224  				function = "qup2_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5225  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5226  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5227  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5228  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5229  			qup_spi23_cs: qup-spi23-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5230  				pins = "gpio85";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5231  				function = "qup2_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5232  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5233  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5234  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5235  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5236  			qup_spi23_data_clk: qup-spi23-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5237  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5238  				pins = "gpio86", "gpio87", "gpio84";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5239  				function = "qup2_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5240  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5241  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5242  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5243  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5244  			qup_uart21_default: qup-uart21-default-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5245  				/* TX, RX */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5246  				pins = "gpio86", "gpio87";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5247  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5248  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5249  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5250  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5251  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5252  
4c00bb76d36f3d Jie Gan             2024-08-26  5253  		stm@10002000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5254  			compatible = "arm,coresight-stm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5255  			reg = <0x0 0x10002000 0x0 0x1000>,
4c00bb76d36f3d Jie Gan             2024-08-26  5256  			      <0x0 0x16280000 0x0 0x180000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5257  			reg-names = "stm-base", "stm-stimulus-base";
4c00bb76d36f3d Jie Gan             2024-08-26  5258  
4c00bb76d36f3d Jie Gan             2024-08-26  5259  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5260  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5261  
4c00bb76d36f3d Jie Gan             2024-08-26  5262  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5263  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5264  					stm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5265  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5266  						<&funnel0_in7>;
4c00bb76d36f3d Jie Gan             2024-08-26  5267  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5268  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5269  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5270  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5271  
4c00bb76d36f3d Jie Gan             2024-08-26  5272  		tpdm@10003000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5273  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5274  			reg = <0x0 0x10003000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5275  
4c00bb76d36f3d Jie Gan             2024-08-26  5276  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5277  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5278  
4c00bb76d36f3d Jie Gan             2024-08-26  5279  			qcom,cmb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5280  			qcom,cmb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5281  
4c00bb76d36f3d Jie Gan             2024-08-26  5282  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5283  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5284  					dcc_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5285  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5286  						<&qdss_tpda_in0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5287  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5288  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5289  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5290  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5291  
4c00bb76d36f3d Jie Gan             2024-08-26  5292  		tpda@10004000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5293  			compatible = "qcom,coresight-tpda", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5294  			reg = <0x0 0x10004000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5295  
4c00bb76d36f3d Jie Gan             2024-08-26  5296  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5297  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5298  
4c00bb76d36f3d Jie Gan             2024-08-26  5299  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5300  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5301  					qdss_tpda_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5302  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5303  						<&funnel0_in6>;
4c00bb76d36f3d Jie Gan             2024-08-26  5304  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5305  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5306  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5307  
4c00bb76d36f3d Jie Gan             2024-08-26  5308  			in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5309  				#address-cells = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5310  				#size-cells = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5311  
4c00bb76d36f3d Jie Gan             2024-08-26  5312  				port@0 {
4c00bb76d36f3d Jie Gan             2024-08-26  5313  					reg = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5314  					qdss_tpda_in0: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5315  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5316  						<&dcc_tpdm_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5317  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5318  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5319  
4c00bb76d36f3d Jie Gan             2024-08-26  5320  				port@1 {
4c00bb76d36f3d Jie Gan             2024-08-26  5321  					reg = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5322  					qdss_tpda_in1: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5323  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5324  						<&qdss_tpdm_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5325  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5326  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5327  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5328  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5329  
4c00bb76d36f3d Jie Gan             2024-08-26  5330  		tpdm@1000f000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5331  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5332  			reg = <0x0 0x1000f000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5333  
4c00bb76d36f3d Jie Gan             2024-08-26  5334  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5335  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5336  
4c00bb76d36f3d Jie Gan             2024-08-26  5337  			qcom,cmb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5338  			qcom,cmb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5339  
4c00bb76d36f3d Jie Gan             2024-08-26  5340  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5341  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5342  					qdss_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5343  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5344  						<&qdss_tpda_in1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5345  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5346  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5347  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5348  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5349  
4c00bb76d36f3d Jie Gan             2024-08-26  5350  		funnel@10041000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5351  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5352  			reg = <0x0 0x10041000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5353  
4c00bb76d36f3d Jie Gan             2024-08-26  5354  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5355  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5356  
4c00bb76d36f3d Jie Gan             2024-08-26  5357  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5358  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5359  					funnel0_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5360  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5361  						<&qdss_funnel_in0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5362  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5363  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5364  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5365  
4c00bb76d36f3d Jie Gan             2024-08-26  5366  			in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5367  				#address-cells = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5368  				#size-cells = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5369  
4c00bb76d36f3d Jie Gan             2024-08-26  5370  				port@6 {
4c00bb76d36f3d Jie Gan             2024-08-26  5371  					reg = <6>;
4c00bb76d36f3d Jie Gan             2024-08-26  5372  					funnel0_in6: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5373  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5374  						<&qdss_tpda_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5375  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5376  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5377  
4c00bb76d36f3d Jie Gan             2024-08-26  5378  				port@7 {
4c00bb76d36f3d Jie Gan             2024-08-26  5379  					reg = <7>;
4c00bb76d36f3d Jie Gan             2024-08-26  5380  					funnel0_in7: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5381  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5382  						<&stm_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5383  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5384  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5385  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5386  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5387  
4c00bb76d36f3d Jie Gan             2024-08-26  5388  		funnel@10042000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5389  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5390  			reg = <0x0 0x10042000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5391  
4c00bb76d36f3d Jie Gan             2024-08-26  5392  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5393  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5394  
4c00bb76d36f3d Jie Gan             2024-08-26  5395  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5396  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5397  					funnel1_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5398  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5399  						<&qdss_funnel_in1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5400  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5401  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5402  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5403  
4c00bb76d36f3d Jie Gan             2024-08-26  5404  			in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5405  				#address-cells = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5406  				#size-cells = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5407  
4c00bb76d36f3d Jie Gan             2024-08-26  5408  				port@2 {
4c00bb76d36f3d Jie Gan             2024-08-26  5409  					reg = <2>;
4c00bb76d36f3d Jie Gan             2024-08-26  5410  					funnel1_in2: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5411  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5412  						<&tmess_funnel_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5413  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5414  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5415  
4c00bb76d36f3d Jie Gan             2024-08-26  5416  				port@5 {
4c00bb76d36f3d Jie Gan             2024-08-26  5417  					reg = <5>;
4c00bb76d36f3d Jie Gan             2024-08-26  5418  					funnel1_in5: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5419  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5420  						<&dlst_funnel_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5421  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5422  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5423  
4c00bb76d36f3d Jie Gan             2024-08-26  5424  				port@6 {
4c00bb76d36f3d Jie Gan             2024-08-26  5425  					reg = <6>;
4c00bb76d36f3d Jie Gan             2024-08-26  5426  					funnel1_in6: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5427  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5428  						<&dlct1_funnel_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5429  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5430  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5431  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5432  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5433  
4c00bb76d36f3d Jie Gan             2024-08-26  5434  		funnel@10045000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5435  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5436  			reg = <0x0 0x10045000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5437  
4c00bb76d36f3d Jie Gan             2024-08-26  5438  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5439  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5440  
4c00bb76d36f3d Jie Gan             2024-08-26  5441  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5442  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5443  					qdss_funnel_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5444  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5445  						<&aoss_funnel_in7>;
4c00bb76d36f3d Jie Gan             2024-08-26  5446  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5447  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5448  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5449  
4c00bb76d36f3d Jie Gan             2024-08-26  5450  			in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5451  				#address-cells = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5452  				#size-cells = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5453  
4c00bb76d36f3d Jie Gan             2024-08-26  5454  				port@0 {
4c00bb76d36f3d Jie Gan             2024-08-26  5455  					reg = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5456  					qdss_funnel_in0: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5457  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5458  						<&funnel0_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5459  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5460  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5461  
4c00bb76d36f3d Jie Gan             2024-08-26  5462  				port@1 {
4c00bb76d36f3d Jie Gan             2024-08-26  5463  					reg = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5464  					qdss_funnel_in1: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5465  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5466  						<&funnel1_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5467  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5468  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5469  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5470  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5471  
4c00bb76d36f3d Jie Gan             2024-08-26  5472  		tpdm@10800000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5473  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5474  			reg = <0x0 0x10800000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5475  
4c00bb76d36f3d Jie Gan             2024-08-26  5476  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5477  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5478  
4c00bb76d36f3d Jie Gan             2024-08-26  5479  			qcom,cmb-element-bits = <64>;
4c00bb76d36f3d Jie Gan             2024-08-26  5480  			qcom,cmb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5481  
4c00bb76d36f3d Jie Gan             2024-08-26  5482  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5483  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5484  					mxa_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5485  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5486  						<&dlct2_tpda_in15>;
4c00bb76d36f3d Jie Gan             2024-08-26  5487  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5488  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5489  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5490  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5491  
4c00bb76d36f3d Jie Gan             2024-08-26  5492  		tpdm@1082c000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5493  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5494  			reg = <0x0 0x1082c000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5495  
4c00bb76d36f3d Jie Gan             2024-08-26  5496  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5497  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5498  
4c00bb76d36f3d Jie Gan             2024-08-26  5499  			qcom,dsb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5500  			qcom,dsb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5501  
4c00bb76d36f3d Jie Gan             2024-08-26  5502  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5503  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5504  					gcc_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5505  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5506  						<&dlct1_tpda_in21>;
4c00bb76d36f3d Jie Gan             2024-08-26  5507  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5508  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5509  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5510  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5511  
4c00bb76d36f3d Jie Gan             2024-08-26  5512  		tpdm@10841000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5513  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5514  			reg = <0x0 0x10841000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5515  
4c00bb76d36f3d Jie Gan             2024-08-26  5516  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5517  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5518  
4c00bb76d36f3d Jie Gan             2024-08-26  5519  			qcom,cmb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5520  			qcom,cmb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5521  
4c00bb76d36f3d Jie Gan             2024-08-26  5522  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5523  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5524  					prng_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5525  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5526  						<&dlct1_tpda_in19>;
4c00bb76d36f3d Jie Gan             2024-08-26  5527  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5528  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5529  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5530  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5531  
4c00bb76d36f3d Jie Gan             2024-08-26  5532  		tpdm@10844000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5533  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5534  			reg = <0x0 0x10844000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5535  
4c00bb76d36f3d Jie Gan             2024-08-26  5536  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5537  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5538  
4c00bb76d36f3d Jie Gan             2024-08-26  5539  			qcom,dsb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5540  			qcom,dsb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5541  
4c00bb76d36f3d Jie Gan             2024-08-26  5542  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5543  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5544  					lpass_cx_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5545  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5546  						<&lpass_cx_funnel_in0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5547  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5548  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5549  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5550  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5551  
4c00bb76d36f3d Jie Gan             2024-08-26  5552  		funnel@10846000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5553  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5554  			reg = <0x0 0x10846000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5555  
4c00bb76d36f3d Jie Gan             2024-08-26  5556  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5557  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5558  
4c00bb76d36f3d Jie Gan             2024-08-26  5559  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5560  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5561  					lpass_cx_funnel_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5562  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5563  						<&dlct1_tpda_in4>;
4c00bb76d36f3d Jie Gan             2024-08-26  5564  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5565  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5566  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5567  
4c00bb76d36f3d Jie Gan             2024-08-26  5568  			in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5569  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5570  					lpass_cx_funnel_in0: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5571  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5572  						<&lpass_cx_tpdm_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5573  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5574  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5575  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5576  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5577  
4c00bb76d36f3d Jie Gan             2024-08-26  5578  		cti@1098b000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5579  			compatible = "arm,coresight-cti", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5580  			reg = <0x0 0x1098b000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5581  
4c00bb76d36f3d Jie Gan             2024-08-26  5582  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5583  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5584  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5585  
4c00bb76d36f3d Jie Gan             2024-08-26  5586  		tpdm@109d0000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5587  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5588  			reg = <0x0 0x109d0000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5589  
4c00bb76d36f3d Jie Gan             2024-08-26  5590  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5591  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5592  
4c00bb76d36f3d Jie Gan             2024-08-26  5593  			qcom,dsb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5594  			qcom,dsb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5595  			status = "disabled";
4c00bb76d36f3d Jie Gan             2024-08-26  5596  
4c00bb76d36f3d Jie Gan             2024-08-26  5597  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5598  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5599  					qm_tpdm_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5600  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5601  						<&dlct1_tpda_in20>;
4c00bb76d36f3d Jie Gan             2024-08-26  5602  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5603  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5604  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5605  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5606  
4c00bb76d36f3d Jie Gan             2024-08-26  5607  		tpdm@10ac0000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5608  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5609  			reg = <0x0 0x10ac0000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5610  
4c00bb76d36f3d Jie Gan             2024-08-26  5611  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5612  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5613  
4c00bb76d36f3d Jie Gan             2024-08-26  5614  			qcom,dsb-element-bits = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5615  			qcom,dsb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5616  			status = "disabled";
4c00bb76d36f3d Jie Gan             2024-08-26  5617  
4c00bb76d36f3d Jie Gan             2024-08-26  5618  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5619  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5620  					dlst_tpdm0_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5621  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5622  						<&dlst_tpda_in8>;
4c00bb76d36f3d Jie Gan             2024-08-26  5623  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5624  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5625  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5626  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5627  
4c00bb76d36f3d Jie Gan             2024-08-26  5628  		tpdm@10ac1000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5629  			compatible = "qcom,coresight-tpdm", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5630  			reg = <0x0 0x10ac1000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5631  
4c00bb76d36f3d Jie Gan             2024-08-26  5632  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5633  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5634  
4c00bb76d36f3d Jie Gan             2024-08-26  5635  			qcom,cmb-element-bits = <64>;
4c00bb76d36f3d Jie Gan             2024-08-26  5636  			qcom,cmb-msrs-num = <32>;
4c00bb76d36f3d Jie Gan             2024-08-26  5637  
4c00bb76d36f3d Jie Gan             2024-08-26  5638  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5639  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5640  					dlst_tpdm1_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5641  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5642  						<&dlst_tpda_in9>;
4c00bb76d36f3d Jie Gan             2024-08-26  5643  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5644  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5645  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5646  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5647  
4c00bb76d36f3d Jie Gan             2024-08-26  5648  		tpda@10ac4000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5649  			compatible = "qcom,coresight-tpda", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5650  			reg = <0x0 0x10ac4000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5651  
4c00bb76d36f3d Jie Gan             2024-08-26  5652  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5653  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5654  
4c00bb76d36f3d Jie Gan             2024-08-26  5655  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5656  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5657  					dlst_tpda_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5658  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5659  						<&dlst_funnel_in0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5660  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5661  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5662  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5663  
4c00bb76d36f3d Jie Gan             2024-08-26  5664  			in-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5665  				#address-cells = <1>;
4c00bb76d36f3d Jie Gan             2024-08-26  5666  				#size-cells = <0>;
4c00bb76d36f3d Jie Gan             2024-08-26  5667  
4c00bb76d36f3d Jie Gan             2024-08-26  5668  				port@8 {
4c00bb76d36f3d Jie Gan             2024-08-26  5669  					reg = <8>;
4c00bb76d36f3d Jie Gan             2024-08-26  5670  					dlst_tpda_in8: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5671  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5672  						<&dlst_tpdm0_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5673  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5674  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5675  
4c00bb76d36f3d Jie Gan             2024-08-26  5676  				port@9 {
4c00bb76d36f3d Jie Gan             2024-08-26  5677  					reg = <9>;
4c00bb76d36f3d Jie Gan             2024-08-26  5678  					dlst_tpda_in9: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5679  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5680  						<&dlst_tpdm1_out>;
4c00bb76d36f3d Jie Gan             2024-08-26  5681  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5682  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5683  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5684  		};
4c00bb76d36f3d Jie Gan             2024-08-26  5685  
4c00bb76d36f3d Jie Gan             2024-08-26  5686  		funnel@10ac5000 {
4c00bb76d36f3d Jie Gan             2024-08-26  5687  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
4c00bb76d36f3d Jie Gan             2024-08-26  5688  			reg = <0x0 0x10ac5000 0x0 0x1000>;
4c00bb76d36f3d Jie Gan             2024-08-26  5689  
4c00bb76d36f3d Jie Gan             2024-08-26  5690  			clocks = <&aoss_qmp>;
4c00bb76d36f3d Jie Gan             2024-08-26  5691  			clock-names = "apb_pclk";
4c00bb76d36f3d Jie Gan             2024-08-26  5692  
4c00bb76d36f3d Jie Gan             2024-08-26  5693  			out-ports {
4c00bb76d36f3d Jie Gan             2024-08-26  5694  				port {
4c00bb76d36f3d Jie Gan             2024-08-26  5695  					dlst_funnel_out: endpoint {
4c00bb76d36f3d Jie Gan             2024-08-26  5696  						remote-endpoint =
4c00bb76d36f3d Jie Gan             2024-08-26  5697  						<&funnel1_in5>;
4c00bb76d36f3d Jie Gan             2024-08-26  5698  					};
4c00bb76d36f3d Jie Gan             2024-08-26  5699  				};
4c00bb76d36f3d Jie Gan             2024-08-26  5700  			};
4c00bb76d36f3d Jie Gan             2024-08-26  5701  
4c00bb76d36f3d Jie Gan             2024-08-26 @5702  			in-ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
